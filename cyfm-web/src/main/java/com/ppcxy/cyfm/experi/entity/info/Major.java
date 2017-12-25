package com.ppcxy.cyfm.experi.entity.info;

import com.ppcxy.common.entity.IdEntity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 专业
 */
@Entity
@Table(name = "info_major")
public class Major extends IdEntity {
    
    /**
     * 专业分类
     */
    private String majorType;
    /**
     * 专业编号
     */
    private String majorNumber;
    /**
     * 专业名称
     */
    private String majorName;
    /**
     * 权重，用于排序
     */
    private Integer weight;
    
    public String getMajorType() {
        return majorType;
    }
    
    public void setMajorType(String majorType) {
        this.majorType = majorType;
    }
    
    public String getMajorNumber() {
        return majorNumber;
    }
    
    public void setMajorNumber(String majorNumber) {
        this.majorNumber = majorNumber;
    }
    
    public String getMajorName() {
        return majorName;
    }
    
    public void setMajorName(String majorName) {
        this.majorName = majorName;
    }
    
    public Integer getWeight() {
        return weight;
    }
    
    public void setWeight(Integer weight) {
        this.weight = weight;
    }
}
