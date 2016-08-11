package com.ppcxy.cyfm.sys.entity.authorize;

import com.ppcxy.common.entity.IdEntity;
import com.ppcxy.cyfm.sys.entity.permission.Permission;
import com.ppcxy.cyfm.sys.entity.resource.Resource;

import javax.persistence.*;

/**
 * Created by wufab on 2016/8/11.
 */
@Entity
@Table(name = "CY_SYS_AUTHORIZE")
public class Authorize extends IdEntity {

    private Resource resource;
    private Permission permission;
    private Long targetId;

    private AuthorizeType authType = AuthorizeType.Role;

    @OneToOne(optional = false, cascade = CascadeType.MERGE)
    @JoinColumn(name = "resource_id", referencedColumnName = "id", unique = false)
    @OrderBy(value = "id ASC")
    public Resource getResource() {
        return resource;
    }

    public void setResource(Resource resource) {
        this.resource = resource;
    }

    @OneToOne(optional = false, cascade = CascadeType.MERGE)
    @JoinColumn(name = "permission_id", referencedColumnName = "id", unique = false)
    @OrderBy(value = "id ASC")
    public Permission getPermission() {
        return permission;
    }

    public void setPermission(Permission permission) {
        this.permission = permission;
    }

    public Long getTargetId() {
        return targetId;
    }

    public void setTargetId(Long targetId) {
        this.targetId = targetId;
    }

    @Enumerated(value = EnumType.STRING)
    public AuthorizeType getAuthType() {
        return authType;
    }

    public void setAuthType(AuthorizeType authType) {
        this.authType = authType;
    }
}
