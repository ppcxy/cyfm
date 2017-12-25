package com.ppcxy.cyfm.experi.entity.experi;

import java.util.List;

public class Plan {
    
    private String placeName;
    private String placeType;
    private List<ExperimentProject> projects;
    private String courseName;
    private String classes;
    private String major;
    private Integer planPersonCount;
    
    public String getPlaceName() {
        return placeName;
    }
    
    public void setPlaceName(String placeName) {
        this.placeName = placeName;
    }
    
    public String getPlaceType() {
        return placeType;
    }
    
    public void setPlaceType(String placeType) {
        this.placeType = placeType;
    }
    
    public List<ExperimentProject> getProjects() {
        return projects;
    }
    
    public void setProjects(List<ExperimentProject> projects) {
        this.projects = projects;
    }
    
    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }
    
    public String getCourseName() {
        return courseName;
    }
    
    public void setClasses(String classes) {
        this.classes = classes;
    }
    
    public String getClasses() {
        return classes;
    }
    
    public void setMajor(String major) {
        this.major = major;
    }
    
    public String getMajor() {
        return major;
    }
    
    public void setPlanPersonCount(Integer planPersonCount) {
        this.planPersonCount = planPersonCount;
    }
    
    public Integer getPlanPersonCount() {
        return planPersonCount;
    }
}
