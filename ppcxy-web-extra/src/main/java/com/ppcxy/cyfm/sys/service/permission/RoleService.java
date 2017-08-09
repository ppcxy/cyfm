package com.ppcxy.cyfm.sys.service.permission;

import com.ppcxy.common.service.BaseService;
import com.ppcxy.cyfm.sys.entity.permission.Role;
import com.ppcxy.cyfm.sys.repository.jpa.permission.RoleDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by weep on 2016-7-7.
 */
@Service
public class RoleService extends BaseService<Role, Long> {

    @Resource
    private RoleDao roleDao;

    public Role findByName(String name) {
        return roleDao.findByName(name);
    }

    public Role findByValue(String value) {
        return roleDao.findByValue(value);
    }

}
