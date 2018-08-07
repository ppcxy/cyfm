package com.ppcxy.cyfm.shop.goods.entity;

import com.ppcxy.common.entity.IdEntity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 商品品牌
 */
@Entity
@Table(name = "gs_brand")
public class GoodsBrand extends IdEntity {
    //品牌名称
    private String brandName;
    //产地
    private String origin;
    //品牌优先级
    private String weight;
    
    public String getBrandName() {
        return brandName;
    }
    
    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }
    
    public String getOrigin() {
        return origin;
    }
    
    public void setOrigin(String origin) {
        this.origin = origin;
    }
    
    public String getWeight() {
        return weight;
    }
    
    public void setWeight(String weight) {
        this.weight = weight;
    }
}
