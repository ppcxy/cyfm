package com.ppcxy.cyfm.shop.goods.entity;

import com.ppcxy.common.entity.IdEntity;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.math.BigDecimal;

/**
 * 商品基础信息
 */
@Entity
@Table(name = "gs_base_info")
public class GoodsBaseInfo extends IdEntity {
    
    //商品类型
    private GoodsType goodsType;
    //商品品牌
    private GoodsBrand goodsBrand;
    //商品名称
    private String title;
    //商品单位
    private String unit;
    //商品图片
    private String pics;
    //基础商品价格
    private BigDecimal basePrice;
    //商品详情
    private String details;
    
    @ManyToOne(optional = true, fetch = FetchType.EAGER)
    @JoinColumn(name = "goods_type_id")
    @Fetch(FetchMode.SELECT)
    public GoodsType getGoodsType() {
        return goodsType;
    }
    
    public void setGoodsType(GoodsType goodsType) {
        this.goodsType = goodsType;
    }
    
    @ManyToOne(optional = true, fetch = FetchType.EAGER)
    @JoinColumn(name = "goods_brand_id")
    @Fetch(FetchMode.SELECT)
    public GoodsBrand getGoodsBrand() {
        return goodsBrand;
    }
    
    public void setGoodsBrand(GoodsBrand goodsBrand) {
        this.goodsBrand = goodsBrand;
    }
    
    public String getTitle() {
        return title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }
    
    public String getPics() {
        return pics;
    }
    
    public void setPics(String pics) {
        this.pics = pics;
    }
    
    public BigDecimal getBasePrice() {
        return basePrice;
    }
    
    public void setBasePrice(BigDecimal basePrice) {
        this.basePrice = basePrice;
    }
    
    public String getUnit() {
        return unit;
    }
    
    public void setUnit(String unit) {
        this.unit = unit;
    }
    
    public String getDetails() {
        return details;
    }
    
    public void setDetails(String details) {
        this.details = details;
    }
}
