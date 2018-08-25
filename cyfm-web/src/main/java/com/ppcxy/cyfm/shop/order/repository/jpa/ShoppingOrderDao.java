package com.ppcxy.cyfm.shop.order.repository.jpa;

import com.ppcxy.common.repository.jpa.BaseRepository;
import com.ppcxy.cyfm.shop.order.entity.ShoppingOrder;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ShoppingOrderDao extends BaseRepository<ShoppingOrder, Long> {
    List<ShoppingOrder> findByUserId(Long id);
    
    
    @Query(value = "update ShoppingOrder set trackNum=?1,orderState='2',deliverDate=CURRENT_TIMESTAMP where orderNum=?2")
    @Modifying
    void updateTrackUnmByOrderNum(String trackNum, String orderNum);
    
    ShoppingOrder findByOrderNum(String orderNum);
}
