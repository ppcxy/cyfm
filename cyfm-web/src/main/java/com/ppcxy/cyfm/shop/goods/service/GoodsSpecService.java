package com.ppcxy.cyfm.shop.goods.service;

import com.ppcxy.common.service.BaseService;
import com.ppcxy.cyfm.shop.goods.entity.GoodsSpec;
import com.ppcxy.cyfm.shop.goods.repository.jpa.GoodsSpecDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class GoodsSpecService extends BaseService<GoodsSpec,Long> {
    
    @Autowired
    private GoodsSpecDao goodsSpecDao;
    
    public List<GoodsSpec> findByGoodsId(Long goodsId) {
        return goodsSpecDao.findBygoods(goodsId);
    }
    
}
