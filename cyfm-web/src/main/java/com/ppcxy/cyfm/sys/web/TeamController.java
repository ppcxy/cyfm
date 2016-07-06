package com.ppcxy.cyfm.sys.web;

import com.ppcxy.common.web.controller.BaseCRUDController;
import com.ppcxy.cyfm.sys.entity.Team;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by weep on 2016-5-16.
 */
@Controller
@RequestMapping(value = "/team")
public class TeamController extends BaseCRUDController<Team, Long> {
    public TeamController() {
        setResourceIdentity("team");
        //和资源一致可以不处理
        //setModelName("team");
    }
}
