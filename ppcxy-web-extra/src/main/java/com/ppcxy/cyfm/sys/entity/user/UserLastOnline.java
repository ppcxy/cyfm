package com.ppcxy.cyfm.sys.entity.user;

import com.ppcxy.common.entity.IdEntity;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

/**
 * 在线用户最后一次在线信息()
 * 此表对于分析活跃用户有用
 * <p>Date: 13-3-11 下午3:25
 * <p>Version: 1.0
 */
@Entity
@Table(name = "cy_sys_user_last_online")
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class UserLastOnline extends IdEntity {
    
    /**
     * 在线的用户
     */
    private Long userId;
    
    private String username;
    
    /**
     * 最后退出时的uid
     */
    private String uid;
    
    /**
     * 用户主机地址
     */
    private String host;
    
    
    /**
     * 用户浏览器类型
     */
    private String userAgent;
    
    /**
     * 用户登录时系统IP
     */
    private String systemHost;
    
    /**
     * 最后登录时间
     */
    private Date lastLoginTimestamp;
    
    /**
     * 最后退出时间
     */
    private Date lastStopTimestamp;
    
    /**
     * 登录次数
     */
    private Integer loginCount = 0;
    
    /**
     * 总的在线时长（秒为单位）
     */
    private Long totalOnlineTime = 0L;
    
    
    @Column(name = "last_uid")
    public String getUid() {
        return uid;
    }
    
    public void setUid(String uid) {
        this.uid = uid;
    }
    
    @Column(name = "host")
    public String getHost() {
        return host;
    }
    
    public void setHost(String host) {
        this.host = host;
    }
    
    @Column(name = "username")
    public String getUsername() {
        return username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    
    @Column(name = "user_id")
    public Long getUserId() {
        return userId;
    }
    
    public void setUserId(Long userId) {
        this.userId = userId;
    }
    
    @Column(name = "user_agent")
    public String getUserAgent() {
        return userAgent;
    }
    
    public void setUserAgent(String userAgent) {
        this.userAgent = userAgent;
    }
    
    @Column(name = "login_count")
    public Integer getLoginCount() {
        return loginCount;
    }
    
    public void setLoginCount(Integer loginCount) {
        this.loginCount = loginCount;
    }
    
    @Column(name = "total_online_time")
    public Long getTotalOnlineTime() {
        return totalOnlineTime;
    }
    
    public void setTotalOnlineTime(Long totalOnlineTime) {
        this.totalOnlineTime = totalOnlineTime;
    }
    
    @Column(name = "system_host")
    public String getSystemHost() {
        return systemHost;
    }
    
    public void setSystemHost(String systemHost) {
        this.systemHost = systemHost;
    }
    
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Column(name = "last_login_timestamp")
    @Temporal(TemporalType.TIMESTAMP)
    public Date getLastLoginTimestamp() {
        return lastLoginTimestamp;
    }
    
    public void setLastLoginTimestamp(Date lastLoginTimestamp) {
        this.lastLoginTimestamp = lastLoginTimestamp;
    }
    
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Column(name = "last_stop_timestamp")
    @Temporal(TemporalType.TIMESTAMP)
    public Date getLastStopTimestamp() {
        return lastStopTimestamp;
    }
    
    public void setLastStopTimestamp(Date lastStopTimestamp) {
        this.lastStopTimestamp = lastStopTimestamp;
    }
    
    public void incLoginCount() {
        setLoginCount(getLoginCount() + 1);
    }
    
    public void incTotalOnlineTime() {
        long onlineTime = getLastStopTimestamp().getTime() - getLastLoginTimestamp().getTime();
        setTotalOnlineTime(getTotalOnlineTime() + onlineTime / 1000);
    }
    
    
    public static final UserLastOnline fromUserOnline(UserOnline online) {
        UserLastOnline lastOnline = new UserLastOnline();
        lastOnline.setHost(online.getHost());
        lastOnline.setUserId(online.getUserId());
        lastOnline.setUsername(online.getUsername());
        lastOnline.setUserAgent(online.getUserAgent());
        lastOnline.setSystemHost(online.getSystemHost());
        lastOnline.setUid(String.valueOf(online.getId()));
        lastOnline.setLastLoginTimestamp(online.getStartTimestamp());
        lastOnline.setLastStopTimestamp(online.getLastAccessTime());
        return lastOnline;
    }
    
    public static final void merge(UserLastOnline from, UserLastOnline to) {
        to.setHost(from.getHost());
        to.setUserId(from.getUserId());
        to.setUsername(from.getUsername());
        to.setUserAgent(from.getUserAgent());
        to.setSystemHost(from.getSystemHost());
        to.setUid(String.valueOf(from.getUid()));
        to.setLastLoginTimestamp(from.getLastLoginTimestamp());
        to.setLastStopTimestamp(from.getLastStopTimestamp());
    }
    
}
