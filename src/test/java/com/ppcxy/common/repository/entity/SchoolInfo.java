package com.ppcxy.common.repository.entity;

import com.ppcxy.common.entity.IdEntity;

import javax.persistence.*;

/**
 * <p>学校信息</p>
 */
@Entity
@Table(name = "user_schoolinfo")
@SequenceGenerator(name="seq", sequenceName="SchoolInfo_SEQ")
public class SchoolInfo extends IdEntity {


    private User user;
    /**
     * 学校名称
     */

    private String name;


    private SchoolType type;

    @ManyToOne()
    @JoinColumn(name = "user_id", nullable = false)
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    @Column(name = "name", length = 200)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    @Column(name = "type", length = 2)
    @Enumerated(EnumType.ORDINAL)
    public SchoolType getType() {
        return type;
    }

    public void setType(SchoolType type) {
        this.type = type;
    }
}
