package com.ppcxy.cyfm.experi.entity.info;

import com.ppcxy.common.entity.IdEntity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 课程
 */
@Entity
@Table(name = "info_course")
public class Course extends IdEntity {
    /**
     * 课程编号
     */
    private String courseNumber;
    /**
     * 课程名称
     */
    private String courseName;
    /**
     * 课程类型
     */
    private String courseType;
    /**
     * 课时数
     */
    private Integer coursePeriodCount;
    
    public String getCourseNumber() {
        return courseNumber;
    }
    
    public void setCourseNumber(String courseNumber) {
        this.courseNumber = courseNumber;
    }
    
    public String getCourseName() {
        return courseName;
    }
    
    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }
    
    public String getCourseType() {
        return courseType;
    }
    
    public void setCourseType(String courseType) {
        this.courseType = courseType;
    }
    
    public Integer getCoursePeriodCount() {
        return coursePeriodCount;
    }
    
    public void setCoursePeriodCount(Integer coursePeriodCount) {
        this.coursePeriodCount = coursePeriodCount;
    }
}
