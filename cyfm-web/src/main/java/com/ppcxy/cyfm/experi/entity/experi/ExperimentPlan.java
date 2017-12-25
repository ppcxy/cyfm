package com.ppcxy.cyfm.experi.entity.experi;

import com.google.common.collect.Lists;
import com.ppcxy.common.entity.IdEntity;
import com.ppcxy.cyfm.experi.entity.info.Classes;
import com.ppcxy.cyfm.experi.entity.info.Course;
import com.ppcxy.cyfm.experi.entity.info.ExperimentDevice;
import com.ppcxy.cyfm.experi.entity.info.ExperimentPlace;
import com.ppcxy.cyfm.sys.entity.user.User;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.springside.modules.utils.Collections3;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * 实验计划
 */
@Entity
@Table(name = "experi_plan")
public class ExperimentPlan extends IdEntity {
    /**
     * 学年
     */
    private String schoolYear;
    /**
     * 学期
     */
    private String semester;
    /**
     * 所属课程
     */
    private Course course;
    
    /**
     * 试验场地
     */
    private ExperimentPlace place;
    /**
     * 实验设备
     */
    private ExperimentDevice device;
    
    /**
     * 实验软件
     */
    private String soft;
    
    /**
     * 实验班别
     */
    private List<Classes> classes = Lists.newArrayList();
    
    /**
     * 实验人数
     */
    private Integer planPersonCount;
    /**
     * 单组内人数
     */
    private Integer groupPersonCount;
    /**
     * 实验项目
     */
    private List<ExperimentProject> projects = Lists.newArrayList();
    
    /**
     * 周学时数
     */
    private Integer weeksPeriodCount;
    /**
     * 周数
     */
    private Integer weeksCount;
    /**
     * 主讲教师
     */
    private String principalTeacher;
    /**
     * 实验日期
     */
    private String experiDate;
    
    /**
     * 备注
     */
    private String remark;
    
    private User createUser;
    private User approveUser;
    private Date approveDate;
    private Integer approveStatus = 0;
    private String approveInfo;
    private Date createDate;
    
    
    @ManyToOne(optional = true, fetch = FetchType.EAGER)
    @JoinColumn(name = "course_id")
    @Fetch(FetchMode.SELECT)
    public Course getCourse() {
        return course;
    }
    
    public void setCourse(Course course) {
        this.course = course;
    }
    
    // 多对多定义
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "experi_plan_classes", joinColumns = {@JoinColumn(name = "plan_id")}, inverseJoinColumns = {@JoinColumn(name = "classes_id")})
    public List<Classes> getClasses() {
        return classes;
    }
    
    public void setClasses(List<Classes> classes) {
        this.classes = classes;
    }
    
    @OneToMany(mappedBy = "experimentPlan", fetch = FetchType.LAZY, cascade = {CascadeType.REMOVE}, orphanRemoval = true)
    public List<ExperimentProject> getProjects() {
        return projects;
    }
    
    public void setProjects(List<ExperimentProject> projects) {
        this.projects = projects;
    }
    
    public String getPrincipalTeacher() {
        return principalTeacher;
    }
    
    public void setPrincipalTeacher(String principalTeacher) {
        this.principalTeacher = principalTeacher;
    }
    
    public String getExperiDate() {
        return experiDate;
    }
    
    public void setExperiDate(String experiDate) {
        this.experiDate = experiDate;
    }
    
    @ManyToOne(optional = true, fetch = FetchType.EAGER)
    @JoinColumn(name = "create_user_id")
    @Fetch(FetchMode.SELECT)
    public User getCreateUser() {
        return createUser;
    }
    
    public void setCreateUser(User createUser) {
        this.createUser = createUser;
    }
    
    @ManyToOne(optional = true, fetch = FetchType.EAGER)
    @JoinColumn(name = "approve_user_id")
    @Fetch(FetchMode.SELECT)
    public User getApproveUser() {
        return approveUser;
    }
    
    public void setApproveUser(User approveUser) {
        this.approveUser = approveUser;
    }
    
    public Date getApproveDate() {
        return approveDate;
    }
    
    public void setApproveDate(Date approveDate) {
        this.approveDate = approveDate;
    }
    
    public Integer getApproveStatus() {
        return approveStatus;
    }
    
    public void setApproveStatus(Integer approveStatus) {
        this.approveStatus = approveStatus;
    }
    
    public String getApproveInfo() {
        return approveInfo;
    }
    
    public void setApproveInfo(String approveInfo) {
        this.approveInfo = approveInfo;
    }
    
    public Integer getPlanPersonCount() {
        return planPersonCount;
    }
    
    public void setPlanPersonCount(Integer planPersonCount) {
        this.planPersonCount = planPersonCount;
    }
    
    @Transient
    public String getApproveStatusInfo() {
        String result = "未知";
        switch (approveStatus) {
            case 0:
                result = "审批中";
                break;
            case 1:
                result = "已通过";
                break;
            case -1:
                result = "未通过";
                break;
        }
        
        return result;
    }
    
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
    
    public Date getCreateDate() {
        return createDate;
    }
    
    public Integer getWeeksPeriodCount() {
        return weeksPeriodCount;
    }
    
    public void setWeeksPeriodCount(Integer weeksPeriodCount) {
        this.weeksPeriodCount = weeksPeriodCount;
    }
    
    public Integer getWeeksCount() {
        return weeksCount;
    }
    
    public void setWeeksCount(Integer weeksCount) {
        this.weeksCount = weeksCount;
    }
    
    public String getRemark() {
        return remark;
    }
    
    public void setRemark(String remark) {
        this.remark = remark;
    }
    
    public Integer getGroupPersonCount() {
        return groupPersonCount;
    }
    
    public void setGroupPersonCount(Integer groupPersonCount) {
        this.groupPersonCount = groupPersonCount;
    }
    
    public String getSchoolYear() {
        return schoolYear;
    }
    
    public void setSchoolYear(String schoolYear) {
        this.schoolYear = schoolYear;
    }
    
    public String getSemester() {
        return semester;
    }
    
    public void setSemester(String semester) {
        this.semester = semester;
    }
    
    // 多对多定义
    @ManyToOne
    @JoinColumn(name = "place")
    public ExperimentPlace getPlace() {
        return place;
    }
    
    public void setPlace(ExperimentPlace place) {
        this.place = place;
    }
    
    // 多对多定义
    @ManyToOne
    @JoinColumn(name = "device")
    public ExperimentDevice getDevice() {
        return device;
    }
    
    public void setDevice(ExperimentDevice device) {
        this.device = device;
    }
    
    public String getSoft() {
        return soft;
    }
    
    public void setSoft(String soft) {
        this.soft = soft;
    }
    
    @Transient
    public String  getClassesInfo(){
        return Collections3.extractToString(classes, "classesName", "+");
    }
}
