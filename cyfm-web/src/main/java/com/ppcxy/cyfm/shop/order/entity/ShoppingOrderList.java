package com.ppcxy.cyfm.shop.order.entity;

import com.ppcxy.common.entity.IdEntity;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "gs_shop_order_list")
public class ShoppingOrderList extends IdEntity {
    private String title;
    private Long goodsBaseInfoId;
    private String goodsSpecIds;
    private String goodsSpecInfo;
    private Integer goodsAmount;
    private BigDecimal price;
    
    private ShoppingOrder shoppingOrder;
    
    public String getTitle() {
        return title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }
    
    public Long getGoodsBaseInfoId() {
        return goodsBaseInfoId;
    }
    
    public void setGoodsBaseInfoId(Long goodsBaseInfoId) {
        this.goodsBaseInfoId = goodsBaseInfoId;
    }
    
    public String getGoodsSpecIds() {
        return goodsSpecIds;
    }
    
    public void setGoodsSpecIds(String goodsSpecIds) {
        this.goodsSpecIds = goodsSpecIds;
    }
    
    public String getGoodsSpecInfo() {
        return goodsSpecInfo;
    }
    
    public void setGoodsSpecInfo(String goodsSpecInfo) {
        this.goodsSpecInfo = goodsSpecInfo;
    }
    
    public Integer getGoodsAmount() {
        return goodsAmount;
    }
    
    public void setGoodsAmount(Integer goodsAmount) {
        this.goodsAmount = goodsAmount;
    }
    
    public void setPrice(BigDecimal price) {
        this.price = price;
    }
    
    public BigDecimal getPrice() {
        return price;
    }
    
    @ManyToOne(optional = true, fetch = FetchType.EAGER)
    @JoinColumn(name = "order_id")
    @Fetch(FetchMode.SELECT)
    public ShoppingOrder getShoppingOrder() {
        return shoppingOrder;
    }
    
    public void setShoppingOrder(ShoppingOrder shoppingOrder) {
        this.shoppingOrder = shoppingOrder;
    }
}
