package com.ppcxy.cyfm.shop.goods.entity;

import com.ppcxy.common.entity.IdEntity;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;

/**
 * 商品库存
 */
@Entity
@Table(name = "gs_inventory")
public class GoodsInventory extends IdEntity {
    //商品基础信息id
    private Long goodsBaseInfoId;
    //商品规格id
    private Long goodsSpecId;
    //商品品牌id
    private Long goodsBrandId;
    //商品类型id
    private Long goodsTypeId;
    //库存结算月度
    private String monthly;
    //库存结算年度
    private String annual;
    //库存结算时间
    private Date balanceDate;
    //库存结算类型
    private String settleType;
    //库存入库数量
    private Long storeIn;
    //库存出库数量
    private Long storeOut;
    
    public Long getGoodsBaseInfoId() {
        return goodsBaseInfoId;
    }
    
    public void setGoodsBaseInfoId(Long goodsBaseInfoId) {
        this.goodsBaseInfoId = goodsBaseInfoId;
    }
    
    public Long getGoodsSpecId() {
        return goodsSpecId;
    }
    
    public void setGoodsSpecId(Long goodsSpecId) {
        this.goodsSpecId = goodsSpecId;
    }
    
    public Long getGoodsBrandId() {
        return goodsBrandId;
    }
    
    public void setGoodsBrandId(Long goodsBrandId) {
        this.goodsBrandId = goodsBrandId;
    }
    
    public Long getGoodsTypeId() {
        return goodsTypeId;
    }
    
    public void setGoodsTypeId(Long goodsTypeId) {
        this.goodsTypeId = goodsTypeId;
    }
    
    public String getMonthly() {
        return monthly;
    }
    
    public void setMonthly(String monthly) {
        this.monthly = monthly;
    }
    
    public String getAnnual() {
        return annual;
    }
    
    public void setAnnual(String annual) {
        this.annual = annual;
    }
    
    public Date getBalanceDate() {
        return balanceDate;
    }
    
    public void setBalanceDate(Date balanceDate) {
        this.balanceDate = balanceDate;
    }
    
    public String getSettleType() {
        return settleType;
    }
    
    public void setSettleType(String settleType) {
        this.settleType = settleType;
    }
    
    public Long getStoreIn() {
        return storeIn;
    }
    
    public void setStoreIn(Long storeIn) {
        this.storeIn = storeIn;
    }
    
    public Long getStoreOut() {
        return storeOut;
    }
    
    public void setStoreOut(Long storeOut) {
        this.storeOut = storeOut;
    }
}
