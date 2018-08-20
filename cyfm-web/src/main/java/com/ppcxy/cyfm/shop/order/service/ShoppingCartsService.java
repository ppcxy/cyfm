package com.ppcxy.cyfm.shop.order.service;

import com.google.common.collect.Lists;
import com.ppcxy.common.service.BaseService;
import com.ppcxy.cyfm.shop.order.entity.ShoppingCarts;
import com.ppcxy.cyfm.shop.order.repository.jpa.ShoppingCartsDao;
import com.ppcxy.cyfm.shop.order.vo.ShoppingCartsGoodsVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;
import java.util.Set;

@Service
@Transactional
public class ShoppingCartsService extends BaseService<ShoppingCarts, Long> {
    @Autowired
    private ShoppingCartsDao shoppingCartsDao;
    
    @Transactional(readOnly = true)
    public List<ShoppingCartsGoodsVO> loadUserCarts(Long id) {
        List<ShoppingCarts> carts = shoppingCartsDao.findByUserId(id);
        
        List<ShoppingCartsGoodsVO> vos = Lists.newArrayList();
        ShoppingCartsGoodsVO vo = null;
        
        for (ShoppingCarts cart : carts) {
            vo = new ShoppingCartsGoodsVO();
            vo.setId(cart.getId());
            vo.setGoodsId(cart.getGoodsBaseInfo().getId());
            vo.setTitle(cart.getGoodsBaseInfo().getTitle());
            
            //商品图处理
            String pics = cart.getGoodsBaseInfo().getPics();
            if (pics.length() > 0) {
                Integer index = pics.indexOf(",");
                //此处判断只要字符串中有,就可以但是不能是第一个
                if (index > 0) {
                    vo.setPic(pics.substring(0, index));
                } else {
                    vo.setPic(pics);
                }
                
            }
            vo.setAmount(cart.getAmount());
            
            vo.setUnitPrice(calcUnitPrice(cart.getGoodsBaseInfo().getBasePrice(), cart.getSpecs()));
            vo.setSumPrice(vo.getUnitPrice().multiply(new BigDecimal(cart.getAmount())));
            vos.add(vo);
            
        }
        
        
        return vos;
    }
    
    /**
     * 按照商品基础价格和规格计算最终单价
     *
     * @param basePrice
     * @param spaces
     * @return
     */
    private BigDecimal calcUnitPrice(BigDecimal basePrice, Set<Long> spaces) {
        //TODO 暂时只计算基础价格，不计算规格价格
        return basePrice;
        
    }
    
    /**
     * 加入购物车，如果已有此商品直接加入，如果没有则
     *
     * @param carts
     */
    public void addCarts(ShoppingCarts carts) {
        
        ShoppingCarts shoppingCarts = shoppingCartsDao.findByGoodsAndUserId(carts.getGoodsBaseInfo().getId(), carts.getUserId());
        if (shoppingCarts != null) {
            shoppingCarts.setAmount(shoppingCarts.getAmount() + carts.getAmount());
        } else {
            shoppingCarts = carts;
        }
        
        shoppingCartsDao.save(shoppingCarts);
    }
}
