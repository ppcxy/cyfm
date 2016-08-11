package com.ppcxy.cyfm.sys.entity.permission;

import com.ppcxy.common.entity.IdEntity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by wufab on 2016/8/11.
 */
@Entity
@Table(name = "CY_SYS_PERMISSION")
public class Permission extends IdEntity {

    private String name;
    private String value;
    private String detailed;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getDetailed() {
        return detailed;
    }

    public void setDetailed(String detailed) {
        this.detailed = detailed;
    }
}
