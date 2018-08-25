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
    
    
    /**
     * 根据用户id查询该用户的商品收藏
     *
     * @param userId
     * @return
     */
    public List<Goodsfavorite> findByUserId(Long userId) {
        
        return goodsfavoriteDao.findByUserId(userId);
    }
    
    /**
     * 添加商品收藏，在已存在的情况更新收藏时间
     *
     * @param goodsfavorite
     */
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
