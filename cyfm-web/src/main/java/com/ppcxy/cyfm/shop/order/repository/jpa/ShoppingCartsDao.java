package com.ppcxy.cyfm.shop.order.repository.jpa;

import com.ppcxy.common.repository.jpa.BaseRepository;
import com.ppcxy.cyfm.shop.order.entity.ShoppingCarts;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ShoppingCartsDao extends BaseRepository<ShoppingCarts, Long> {
    List<ShoppingCarts> findByUserId(Long id);
    
    @Query(value = "select o from ShoppingCarts o where o.goodsBaseInfo.id=?1 and userId=?2")
    ShoppingCarts findByGoodsAndUserId(Long goodsId, Long userId);
}
