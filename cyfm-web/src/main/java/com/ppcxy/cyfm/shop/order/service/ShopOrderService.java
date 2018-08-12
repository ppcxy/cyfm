package com.ppcxy.cyfm.shop.order.service;

import com.ppcxy.common.service.BaseService;
import com.ppcxy.cyfm.shop.order.entity.ShopOrder;
import com.ppcxy.cyfm.shop.order.repository.jpa.ShopOrderDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ShopOrderService extends BaseService<ShopOrder, Long> {
    @Autowired
    private ShopOrderDao shopOrderDao;
    
    public List<ShopOrder> loadUserOrder(Long id) {
        return shopOrderDao.findByUserId(id);
    }
}
