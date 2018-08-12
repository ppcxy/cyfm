package com.ppcxy.cyfm.shop.order.entity;

import com.ppcxy.common.entity.IdEntity;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "gs_shop_order")
public class ShopOrder extends IdEntity {
    private Long userId;
    private String orderNum;
    private String title;
    private String goodsBaseInfoId;
    private String goodsSpecIds;
    private String goodsSpecInfo;
    private Integer goodsAmount;
    private BigDecimal orderPrice;
    private Date createDate;
    private String orderState;
    private String orderReturnState;
    
    public Long getUserId() {
        return userId;
    }
    
    public void setUserId(Long userId) {
        this.userId = userId;
    }
    
    public String getOrderNum() {
        return orderNum;
    }
    
    public void setOrderNum(String orderNum) {
        this.orderNum = orderNum;
    }
    
    public String getTitle() {
        return title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }
    
    public String getGoodsBaseInfoId() {
        return goodsBaseInfoId;
    }
    
    public void setGoodsBaseInfoId(String goodsBaseInfoId) {
        this.goodsBaseInfoId = goodsBaseInfoId;
    }
    
    public Integer getGoodsAmount() {
        return goodsAmount;
    }
    
    public void setGoodsAmount(Integer goodsAmount) {
        this.goodsAmount = goodsAmount;
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
    
    public BigDecimal getOrderPrice() {
        return orderPrice;
    }
    
    public void setOrderPrice(BigDecimal orderPrice) {
        this.orderPrice = orderPrice;
    }
    
    public Date getCreateDate() {
        return createDate;
    }
    
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
    
    public String getOrderState() {
        return orderState;
    }
    
    public void setOrderState(String orderState) {
        this.orderState = orderState;
    }
    
    public String getOrderReturnState() {
        return orderReturnState;
    }
    
    public void setOrderReturnState(String orderReturnState) {
        this.orderReturnState = orderReturnState;
    }
}
