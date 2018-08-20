package com.ppcxy.cyfm.shop.v.entity;

import com.ppcxy.common.entity.IdEntity;
import com.ppcxy.cyfm.shop.goods.entity.GoodsBaseInfo;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "gs_favorite")
public class Goodsfavorite extends IdEntity {
    private Long userId;
    private GoodsBaseInfo goodsBaseInfo;
    private Date createDate;
    
    public Long getUserId() {
        return userId;
    }
    
    public void setUserId(Long userId) {
        this.userId = userId;
    }
    
    @ManyToOne(optional = true, fetch = FetchType.EAGER)
    @JoinColumn(name = "goods_base_id")
    @Fetch(FetchMode.SELECT)
    public GoodsBaseInfo getGoodsBaseInfo() {
        return goodsBaseInfo;
    }
    
    public void setGoodsBaseInfo(GoodsBaseInfo goodsBaseInfo) {
        this.goodsBaseInfo = goodsBaseInfo;
    }
    
    public Date getCreateDate() {
        return createDate;
    }
    
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}
