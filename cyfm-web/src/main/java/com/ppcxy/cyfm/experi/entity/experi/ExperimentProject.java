package com.ppcxy.cyfm.experi.entity.experi;

import com.ppcxy.common.entity.IdEntity;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;

/**
 * 实验项目
 */
@Entity
@Table(name = "experi_project")
public class ExperimentProject extends IdEntity {
    /**
     * 所属实验计划
     */
    private ExperimentPlan experimentPlan;
    /**
     * 实验项目名称
     */
    private String projectName;

    /**
     * 课时数
     */
    private Integer coursePeriodCount;

    /**
     * 组数
     */
    private Integer groupCount;

    /**
     * 单组内人数
     */
    private Integer groupPersonCount;

    /**
     * 实验消耗（元/人时）
     */
    private Integer consume;

    /**
     * 实施日期
     */
    private String beginTime;

    /**
     * 辅导人员
     */
    private String counsellor;
    
    @ManyToOne(optional = true, fetch = FetchType.EAGER)
    @JoinColumn(name = "plan_id")
    @Fetch(FetchMode.SELECT)
    public ExperimentPlan getExperimentPlan() {
        return experimentPlan;
    }
    
    public void setExperimentPlan(ExperimentPlan experimentPlan) {
        this.experimentPlan = experimentPlan;
    }
    
    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public Integer getCoursePeriodCount() {
        return coursePeriodCount;
    }

    public void setCoursePeriodCount(Integer coursePeriodCount) {
        this.coursePeriodCount = coursePeriodCount;
    }

    public Integer getGroupCount() {
        return groupCount;
    }

    public void setGroupCount(Integer groupCount) {
        this.groupCount = groupCount;
    }

    public Integer getGroupPersonCount() {
        return groupPersonCount;
    }

    public void setGroupPersonCount(Integer groupPersonCount) {
        this.groupPersonCount = groupPersonCount;
    }

    public Integer getConsume() {
        return consume;
    }

    public void setConsume(Integer consume) {
        this.consume = consume;
    }

    public String getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(String beginTime) {
        this.beginTime = beginTime;
    }

    public String getCounsellor() {
        return counsellor;
    }

    public void setCounsellor(String counsellor) {
        this.counsellor = counsellor;
    }
}
