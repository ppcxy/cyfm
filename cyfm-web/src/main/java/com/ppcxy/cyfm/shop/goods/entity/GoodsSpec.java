package com.ppcxy.cyfm.shop.goods.entity;

import com.ppcxy.common.entity.IdEntity;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.math.BigDecimal;

/**
 * 商品规格
 */
@Entity
@Table(name = "gs_spec")
public class GoodsSpec extends IdEntity {
    private GoodsBaseInfo goodsBaseInfo;
    //规格分组
    private String specGroup;
    //规格标题
    private String specTitle;
    //规格描述
    private String specInfo;
    //规格相对于商品基础价格调整
    private BigDecimal price;
    
    @ManyToOne(optional = true, fetch = FetchType.EAGER)
    @JoinColumn(name = "goods_base_info_id")
    @Fetch(FetchMode.SELECT)
    public GoodsBaseInfo getGoodsBaseInfo() {
        return goodsBaseInfo;
    }
    
    public void setGoodsBaseInfo(GoodsBaseInfo goodsBaseInfo) {
        this.goodsBaseInfo = goodsBaseInfo;
    }
    
    public String getSpecGroup() {
        return specGroup;
    }
    
    public void setSpecGroup(String specGroup) {
        this.specGroup = specGroup;
    }
    
    public String getSpecTitle() {
        return specTitle;
    }
    
    public void setSpecTitle(String specTitle) {
        this.specTitle = specTitle;
    }
    
    public String getSpecInfo() {
        return specInfo;
    }
    
    public void setSpecInfo(String specInfo) {
        this.specInfo = specInfo;
    }
    
    public BigDecimal getPrice() {
        return price;
    }
    
    public void setPrice(BigDecimal price) {
        this.price = price;
    }
}
