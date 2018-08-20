package com.ppcxy.cyfm.shop.order.vo;


import java.math.BigDecimal;


public class ShoppingCartsGoodsVO {
    private Long id;
    private String pic;
    private Long goodsId;
    private String title;
    private String spaces;
    private Integer amount;
    private BigDecimal unitPrice;
    private BigDecimal sumPrice;
    
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public Long getGoodsId() {
        return goodsId;
    }
    
    public void setGoodsId(Long goodsId) {
        this.goodsId = goodsId;
    }
    
    public String getTitle() {
        return title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }
    
    public String getSpaces() {
        return spaces;
    }
    
    public void setSpaces(String spaces) {
        this.spaces = spaces;
    }
    
    
    public Integer getAmount() {
        return amount;
    }
    
    public void setAmount(Integer amount) {
        this.amount = amount;
    }
    
    public void setUnitPrice(BigDecimal unitPrice) {
        this.unitPrice = unitPrice;
    }
    
    public BigDecimal getUnitPrice() {
        return unitPrice;
    }
    
    public void setSumPrice(BigDecimal sumPrice) {
        this.sumPrice = sumPrice;
    }
    
    public BigDecimal getSumPrice() {
        return sumPrice;
    }
    
    public String getPic() {
        return pic;
    }
    
    public void setPic(String pic) {
        this.pic = pic;
    }
}
