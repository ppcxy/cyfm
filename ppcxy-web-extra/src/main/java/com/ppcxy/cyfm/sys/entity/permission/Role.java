/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.ppcxy.cyfm.sys.entity.permission;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.Sets;
import com.ppcxy.common.entity.IdEntity;
import com.ppcxy.common.repository.jpa.support.annotation.EnableQueryCache;
import com.ppcxy.cyfm.sys.entity.authorize.Authorize;
import com.ppcxy.cyfm.sys.entity.authorize.AuthorizeType;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Where;

import javax.persistence.*;
import java.util.List;
import java.util.Set;

/**
 * 角色.
 *
 * @author calvin
 */
@Entity
@Table(name = "cy_sys_role")
@EnableQueryCache
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Role extends IdEntity {
    public static final String CE = "";
    private String name;

    private String permissions;

    private Set<Authorize> authorizes = Sets.newHashSet();

    public Role() {
    }

    public Role(Long id) {
        this.id = id;
    }

    @OneToMany()
    @JoinColumn(name = "targetId")
    @Where(clause = "auth_type='Role'")
    public Set<Authorize> getAuthorizes() {
        return authorizes;
    }

    public void setAuthorizes(Set<Authorize> authorizes) {
        this.authorizes = authorizes;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPermissions() {
        return permissions;
    }

    public void setPermissions(String permissions) {
        this.permissions = permissions;
    }

    @Transient
    public List<String> getPermissionList() {
        return ImmutableList.copyOf(StringUtils.split(permissions, ","));
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
