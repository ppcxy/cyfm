package com.ppcxy.cyfm.shop.order.entity;

import com.google.common.collect.Lists;
import com.ppcxy.common.entity.IdEntity;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "gs_shop_order")
public class ShoppingOrder extends IdEntity {
    private Long userId;
    private String orderNum;
    private BigDecimal orderPrice;
    private Date createDate;
    private String orderState;
    private String orderReturnState;
    
    private Date deliverDate;
    private String trackNum;
    private Date finishDate;
    
    private List<ShoppingOrderList> orderLists = Lists.newArrayList();
    
    
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
    
    @Transient
    public String getOrderStateInfo() {
        String result = null;
        
        switch (this.orderState) {
            case "0":
                result = "待付款";
                break;
            case "1":
                result = "待发货";
                break;
            case "2":
                result = "待收货";
                break;
            case "3":
                result = "已收货";
                break;
            default:
                result = "异常";
        }
        return result;
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
    
    @OneToMany(mappedBy = "shoppingOrder")
    @OrderBy(value = "ID ASC")
    public List<ShoppingOrderList> getOrderLists() {
        return orderLists;
    }
    
    public void setOrderLists(List<ShoppingOrderList> orderLists) {
        this.orderLists = orderLists;
    }
    
    public Date getDeliverDate() {
        return deliverDate;
    }
    
    public void setDeliverDate(Date deliverDate) {
        this.deliverDate = deliverDate;
    }
    
    public String getTrackNum() {
        return trackNum;
    }
    
    public void setTrackNum(String trackNum) {
        this.trackNum = trackNum;
    }
    
    public Date getFinishDate() {
        return finishDate;
    }
    
    public void setFinishDate(Date finishDate) {
        this.finishDate = finishDate;
    }
    
    @Transient
    public String getTitle() {
        StringBuilder sb = new StringBuilder(orderLists.get(0).getTitle());
        if (orderLists.size() > 1) {
            sb.append("等").append(orderLists.size()).append("件商品");
        }
        return sb.toString();
        
    }
}
