package com.ppcxy.cyfm.shop.order.service;

import com.google.common.collect.Lists;
import com.ppcxy.common.service.BaseService;
import com.ppcxy.cyfm.shop.order.entity.ShoppingCarts;
import com.ppcxy.cyfm.shop.order.entity.ShoppingOrder;
import com.ppcxy.cyfm.shop.order.entity.ShoppingOrderList;
import com.ppcxy.cyfm.shop.order.repository.jpa.ShoppingCartsDao;
import com.ppcxy.cyfm.shop.order.repository.jpa.ShoppingOrderDao;
import com.ppcxy.cyfm.shop.order.repository.jpa.ShoppingOrderListDao;
import com.ppcxy.cyfm.sys.entity.user.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springside.modules.mapper.JsonMapper;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class ShoppingOrderService extends BaseService<ShoppingOrder, Long> {
    @Autowired
    private ShoppingOrderDao shopOrderDao;
    @Autowired
    private ShoppingOrderListDao shoppingOrderListDao;
    @Autowired
    private ShoppingCartsDao shoppingCartsDao;
    
    
    public List<ShoppingOrder> loadUserOrder(Long id) {
        return shopOrderDao.findByUserId(id);
    }
    
    public List<ShoppingOrder> placeOrder(String orderInfo, User user) {
        List<ShoppingOrder> results = Lists.newArrayList();
        
        List<Map<String, String>> cartsInfos = new JsonMapper().fromJson(orderInfo, ArrayList.class);
        
        long datetime = System.currentTimeMillis();
        Date createDate = new Date(datetime);
        String orderNumber = String.format("2%d%d", datetime, user.getId());
        
        ShoppingOrder shoppingOrder = new ShoppingOrder();
        
        shoppingOrder.setCreateDate(createDate);
        shoppingOrder.setUserId(user.getId());
        shoppingOrder.setOrderNum(orderNumber);
        shoppingOrder.setOrderState("0");
        shoppingOrder.setOrderReturnState("0");
        shoppingOrder.setOrderPrice(new BigDecimal(0));
        
        shopOrderDao.save(shoppingOrder);
        
        ShoppingOrderList orderList = null;
        
        for (int i = 0; i < cartsInfos.size(); i++) {
            Map<String, String> cartInfo = cartsInfos.get(i);
            ShoppingCarts cart = shoppingCartsDao.findOne(new Long(cartInfo.get("id")));
            if (cart != null) {
                orderList = new ShoppingOrderList();
                
                orderList.setTitle(cart.getGoodsBaseInfo().getTitle());
                orderList.setGoodsBaseInfoId(cart.getGoodsBaseInfo().getId());
                orderList.setGoodsAmount(new Integer(cartInfo.get("amount")));
                orderList.setPrice(cart.getGoodsBaseInfo().getBasePrice().multiply(new BigDecimal(cartInfo.get("amount"))));
                
                shoppingOrder.setOrderPrice(shoppingOrder.getOrderPrice().add(orderList.getPrice()));
                orderList.setShoppingOrder(shoppingOrder);
                
                shoppingOrderListDao.save(orderList);
                
                shoppingCartsDao.delete(cart);
            }
            
        }
        
        
        return results;
    }
    
    public Boolean deliver(String orderNum, String trackNum) {
        shopOrderDao.updateTrackUnmByOrderNum(trackNum, orderNum);
        return Boolean.TRUE;
    }
    
    public void close(Long id) {
        ShoppingOrder shoppingOrder = findOne(id);
        shoppingOrder.setOrderReturnState("1");
        save(shoppingOrder);
    }
    
    public  ShoppingOrder findByOrderNum(String orderNum) {
        return shopOrderDao.findByOrderNum(orderNum);
    }
}
