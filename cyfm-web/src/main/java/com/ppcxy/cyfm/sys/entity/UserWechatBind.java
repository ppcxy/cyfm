package com.ppcxy.cyfm.sys.entity;

import com.ppcxy.common.entity.IdEntity;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import java.util.Date;

@Entity
@Table(name = "cy_sys_user_wechat_bind")
public class UserWechatBind extends IdEntity {
	
	/**
	 * 微信openid
	 */
	private String wechatOpenid;
	/**
	 * 系统用户id
	 */
	private Long userId;
	/**
	 * 绑定时间
	 */
	private Date bindDate;
	/**
	 * 子系统
	 */
	private String subsystem;
	
	public String getWechatOpenid() {
		return wechatOpenid;
	}
	
	public void setWechatOpenid(String wechatOpenid) {
		this.wechatOpenid = wechatOpenid;
	}
	
	public Long getUserId() {
		return userId;
	}
	
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Temporal(TemporalType.TIMESTAMP)
	public Date getBindDate() {
		return bindDate;
	}
	
	public void setBindDate(Date bindDate) {
		this.bindDate = bindDate;
	}
	
	public String getSubsystem() {
		return subsystem;
	}
	
	public void setSubsystem(String subsystem) {
		this.subsystem = subsystem;
	}
}
