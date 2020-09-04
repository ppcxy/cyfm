package com.ppcxy.cyfm.sys.entity.group;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.google.common.collect.Lists;
import com.ppcxy.common.entity.IdEntity;
import com.ppcxy.common.entity.base.LogicDeleteable;
import com.ppcxy.cyfm.sys.entity.team.Team;
import com.ppcxy.cyfm.sys.entity.user.User;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.List;

@Entity
@Table(name = "cy_sys_work_group")
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class WorkGroup extends IdEntity implements LogicDeleteable {
	private String name;
	private User master;
	
	private Team team;
	
	private List<User> userList = Lists.newArrayList();
	private Boolean deleted = Boolean.FALSE;
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
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
	
	@NotNull
	@ManyToOne
	@JoinColumn(name = "team_id")
	public Team getTeam() {
		return team;
	}
	
	public void setTeam(Team team) {
		this.team = team;
	}
	
	
	@JsonIgnore
	// 多对多定义
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "cy_sys_work_group_user", joinColumns = {@JoinColumn(name = "work_group_id")}, inverseJoinColumns = {@JoinColumn(name = "user_id")})
	// Fecth策略定义
	@Fetch(FetchMode.SELECT)
	@Basic(optional = true, fetch = FetchType.EAGER)
	// 集合按id排序
	@OrderBy("id ASC")
	// 缓存策略
	@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	public List<User> getUserList() {
		return userList;
	}
	
	public void setUserList(List<User> userList) {
		this.userList = userList;
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
