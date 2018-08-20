package com.ppcxy.cyfm.shop.v.service;

import com.ppcxy.common.service.BaseService;
import com.ppcxy.cyfm.shop.v.entity.Goodsfavorite;
import com.ppcxy.cyfm.shop.v.repository.jpa.GoodsfavoriteDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class GoodsfavoriteService extends BaseService<Goodsfavorite, Long> {
    
    @Autowired
    private GoodsfavoriteDao goodsfavoriteDao;
    
    public List<Goodsfavorite> findByUserId(Long userId) {
        
        return goodsfavoriteDao.findByUserId(userId);
    }
    
    public void addFavorite(Goodsfavorite goodsfavorite) {
        Goodsfavorite favorite = goodsfavoriteDao.findByUserIdAndGoodsId(goodsfavorite.getUserId(), goodsfavorite.getGoodsBaseInfo().getId());
    
        if (favorite != null) {
            favorite.setCreateDate(goodsfavorite.getCreateDate());
        } else {
            favorite = goodsfavorite;
        }
    
        goodsfavoriteDao.save(favorite);
        
    }
}
