package com.ppcxy.cyfm.shop.order.entity;


import com.google.common.collect.Sets;
import com.ppcxy.common.entity.IdEntity;
import com.ppcxy.common.repository.jpa.support.hibernate.type.CollectionToStringUserType;
import com.ppcxy.cyfm.shop.goods.entity.GoodsBaseInfo;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.Type;
import org.hibernate.annotations.TypeDef;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.util.Date;
import java.util.Set;

@TypeDef(
        name = "SetToStringUserType",
        typeClass = CollectionToStringUserType.class,
        parameters = {
                @org.hibernate.annotations.Parameter(name = "separator", value = ","),
                @org.hibernate.annotations.Parameter(name = "collectionType", value = "java.util.HashSet"),
                @org.hibernate.annotations.Parameter(name = "elementType", value = "java.lang.Long")
        }
)
@Entity
@Table(name = "gs_carts")
public class ShoppingCarts extends IdEntity {
    /**
     * 商品id
     **/
    private GoodsBaseInfo goodsBaseInfo;
    /**
     * 商品规格
     */
    
    private Set<Long> specs = Sets.newHashSet();
    /**
     * 商品数量
     **/
    private Integer amount;
    /**
     * 用户id
     **/
    private Long userId;
    /**
     * 加入时间
     **/
    private Date createTime;
    
    
    @ManyToOne
    @JoinColumn(name = "goods_base_id")
    @Fetch(FetchMode.SELECT)
    public GoodsBaseInfo getGoodsBaseInfo() {
        return goodsBaseInfo;
    }
    
    public void setGoodsBaseInfo(GoodsBaseInfo goodsBaseInfo) {
        this.goodsBaseInfo = goodsBaseInfo;
    }
    
    @Type(type = "SetToStringUserType")
    public Set<Long> getSpecs() {
        return specs;
    }
    
    public void setSpecs(Set<Long> specs) {
        this.specs = specs;
    }
    
    public Integer getAmount() {
        return amount == null ? 1 : amount;
    }
    
    public void setAmount(Integer amount) {
        this.amount = amount;
    }
    
    public Long getUserId() {
        return userId;
    }
    
    public void setUserId(Long userId) {
        this.userId = userId;
    }
    
    public Date getCreateTime() {
        return createTime;
    }
    
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
    
}
