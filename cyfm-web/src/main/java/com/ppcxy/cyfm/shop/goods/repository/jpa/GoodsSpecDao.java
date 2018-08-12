package com.ppcxy.cyfm.shop.goods.repository.jpa;

import com.ppcxy.common.repository.jpa.BaseRepository;
import com.ppcxy.cyfm.shop.goods.entity.GoodsSpec;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface GoodsSpecDao extends BaseRepository<GoodsSpec, Long> {
    
    @Query(value = "select o from GoodsSpec o where o.goodsBaseInfo.id=?1 order by o.specGroup")
    List<GoodsSpec> findBygoods(Long goodsId);
}
