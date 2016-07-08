package com.ppcxy.cyfm.sys.web.permission;

import com.ppcxy.common.web.controller.BaseCRUDController;
import com.ppcxy.cyfm.sys.entity.permission.Role;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by weep on 2016-7-7.
 */
@Controller
@RequestMapping("/sys/role")
public class RoleController extends BaseCRUDController<Role, Long> {

    public RoleController() {
        setResourceIdentity("role");
    }
}
