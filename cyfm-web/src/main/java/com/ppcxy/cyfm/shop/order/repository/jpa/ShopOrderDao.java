package com.ppcxy.cyfm.shop.order.repository.jpa;

import com.ppcxy.common.repository.jpa.BaseRepository;
import com.ppcxy.cyfm.shop.order.entity.ShopOrder;

import java.util.List;

public interface ShopOrderDao extends BaseRepository<ShopOrder,Long> {
    List<ShopOrder> findByUserId(Long id);
}
