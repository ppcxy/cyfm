package com.ppcxy.cyfm.sys.entity.team;

import com.google.common.collect.Lists;
import com.ppcxy.common.entity.IdEntity;
import com.ppcxy.common.entity.base.LogicDeleteable;
import com.ppcxy.cyfm.sys.entity.user.User;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * 开发团队.
 *
 * @author calvin
 */
@Entity
@Table(name = "cy_sys_team")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Team extends IdEntity implements LogicDeleteable {
    
    private String name;
    /**
     * 团队所在城市
     */
    private String city;
    /**
     * 团队标志
     */
    private String sign;
    
    private User master;
    private Long maxMemberCount;
    
    private String defaultRoles;
    
    private List<User> userList = Lists.newArrayList();
    
    private List<User> newUserList = Lists.newArrayList();
    
    private String rootMenu;
    private Long rootMenuId;
    
    private Boolean deleted = Boolean.FALSE;
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public String getCity() {
        return city;
    }
    
    public void setCity(String city) {
        this.city = city;
    }
    
    public String getSign() {
        return sign;
    }
    
    public void setSign(String sign) {
        this.sign = sign;
    }
    
    @NotNull
    @OneToOne
    @JoinColumn(name = "master_id")
    public User getMaster() {
        return master;
    }
    
    public void setMaster(User master) {
        this.master = master;
    }
    
    public Long getMaxMemberCount() {
        return maxMemberCount;
    }
    
    public void setMaxMemberCount(Long maxMemberCount) {
        this.maxMemberCount = maxMemberCount;
    }
    
    public String getDefaultRoles() {
        return defaultRoles;
    }
    
    public void setDefaultRoles(String defaultRoles) {
        this.defaultRoles = defaultRoles;
    }
    
    @OneToMany(mappedBy = "team")
    public List<User> getUserList() {
        return userList;
    }
    
    public void setUserList(List<User> userList) {
        this.userList = userList;
    }
    
    @Transient
    public List<User> getNewUserList() {
        return newUserList;
    }
    
    public void setNewUserList(List<User> newUserList) {
        this.newUserList = newUserList;
    }
    
    public void setRootMenu(String rootMenu) {
        this.rootMenu = rootMenu;
    }
    
    public Long getRootMenuId() {
        return rootMenuId;
    }
    
    public void setRootMenuId(Long rootMenuId) {
        this.rootMenuId = rootMenuId;
    }
    
    @Override
    public Boolean getDeleted() {
        return deleted;
    }
    
    @Override
    public void setDeleted(Boolean deleted) {
        this.deleted = deleted;
    }
    
    @Override
    public void markDeleted() {
        this.deleted = true;
    }
}
