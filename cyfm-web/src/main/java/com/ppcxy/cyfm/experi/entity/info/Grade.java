package com.ppcxy.cyfm.experi.entity.info;

import com.ppcxy.common.entity.IdEntity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 年级
 */
@Entity
@Table(name = "info_grade")
public class Grade extends IdEntity {
    /**
     * 年级名
     */
    private String gradeName;
    /**
     * 入学年份
     */
    private String enrolYears;
    /**
     * 权重，用于排序
     */
    private Integer weight;

    public String getGradeName() {
        return gradeName;
    }

    public void setGradeName(String gradeName) {
        this.gradeName = gradeName;
    }

    public String getEnrolYears() {
        return enrolYears;
    }

    public void setEnrolYears(String enrolYears) {
        this.enrolYears = enrolYears;
    }

    public Integer getWeight() {
        return weight;
    }

    public void setWeight(Integer weight) {
        this.weight = weight;
    }
}
