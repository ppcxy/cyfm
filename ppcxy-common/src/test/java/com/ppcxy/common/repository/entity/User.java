package com.ppcxy.common.repository.entity;

import com.ppcxy.common.entity.IdEntity;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * <p>用户信息</p>
 */
@Entity
@Table(name = "user")
@SequenceGenerator(name = "seq", sequenceName = "User_SEQ")
public class User extends IdEntity {

    private String username;


    private String password;


    private Date registerDate;


    private BaseInfo baseInfo;


    private Set<SchoolInfo> schoolInfoSet;

    @Column(name = "username", unique = true, length = 200)
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Column(name = "password", length = 200)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Column(name = "register_date")
    public Date getRegisterDate() {
        return registerDate;
    }

    public void setRegisterDate(Date registerDate) {
        this.registerDate = registerDate;
    }

    /**
     * 基本信息
     */
    @OneToOne(mappedBy = "user", fetch = FetchType.EAGER, cascade = {CascadeType.ALL}, orphanRemoval = true)
    public BaseInfo getBaseInfo() {
        return baseInfo;
    }

    public void setBaseInfo(BaseInfo baseInfo) {
        this.baseInfo = baseInfo;
        if (baseInfo != null) {
            this.baseInfo.setUser(this);
        }
    }

    /**
     * 学校信息
     */
    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = {CascadeType.ALL}, orphanRemoval = true)
    public Set<SchoolInfo> getSchoolInfoSet() {
        if (schoolInfoSet == null) {
            schoolInfoSet = new HashSet<SchoolInfo>();
        }
        return schoolInfoSet;
    }

    public void setSchoolInfoSet(Set<SchoolInfo> schoolInfoSet) {
        this.schoolInfoSet = schoolInfoSet;
    }

    public void addSchoolInfo(SchoolInfo schoolInfo) {
        this.getSchoolInfoSet().add(schoolInfo);
        schoolInfo.setUser(this);
    }
}
