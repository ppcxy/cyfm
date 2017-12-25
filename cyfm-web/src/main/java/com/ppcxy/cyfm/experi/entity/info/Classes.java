package com.ppcxy.cyfm.experi.entity.info;

import com.ppcxy.common.entity.IdEntity;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;

/**
 * 班级
 */
@Entity
@Table(name = "info_classes")
public class Classes extends IdEntity {
    
    /**
     * 班级名
     */
    private String classesName;
    /**
     * 专业
     */
    private Major major;
    /**
     * 年级
     */
    private Grade grade;
    /**
     * 班级人数
     */
    private Integer enrollment;
    
    
    public String getClassesName() {
        return classesName;
    }
    
    public void setClassesName(String classesName) {
        this.classesName = classesName;
    }
    
    @ManyToOne(optional = true, fetch = FetchType.EAGER)
    @JoinColumn(name = "major_id")
    @Fetch(FetchMode.SELECT)
    public Major getMajor() {
        return major;
    }
    
    public void setMajor(Major major) {
        this.major = major;
    }
    
    @ManyToOne(optional = true, fetch = FetchType.EAGER)
    @JoinColumn(name = "grade_id")
    @Fetch(FetchMode.SELECT)
    public Grade getGrade() {
        return grade;
    }
    
    public void setGrade(Grade grade) {
        this.grade = grade;
    }
    
    public Integer getEnrollment() {
        return enrollment;
    }
    
    public void setEnrollment(Integer enrollment) {
        this.enrollment = enrollment;
    }
}
