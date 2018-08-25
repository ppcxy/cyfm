package com.ppcxy.cyfm.shop.v.repository.jpa;

import com.ppcxy.common.repository.jpa.BaseRepository;
import com.ppcxy.cyfm.shop.v.entity.Goodsfavorite;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface GoodsfavoriteDao extends BaseRepository<Goodsfavorite, Long> {
    List<Goodsfavorite> findByUserId(Long userId);
    
    /**
     * 通过用户id和商品id查询收藏记录
     * @param userId
     * @param goodsId
     * @return
     */
    @Query(value = "select o from Goodsfavorite o where o.userId=?1 and o.goodsBaseInfo.id=?2")
    Goodsfavorite findByUserIdAndGoodsId(Long userId, Long goodsId);
}
