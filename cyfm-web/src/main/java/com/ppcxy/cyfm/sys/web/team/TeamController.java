package com.ppcxy.cyfm.sys.web.team;

import com.ppcxy.common.web.controller.BaseCRUDController;
import com.ppcxy.cyfm.sys.entity.team.Team;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by weep on 2016-5-16.
 */
@Controller
@RequestMapping(value = "/sys/team")
public class TeamController extends BaseCRUDController<Team, Long> {
    public TeamController() {
        setResourceIdentity("sys:team");
        //和资源一致可以不处理
        setModelName("team");
    }
}
