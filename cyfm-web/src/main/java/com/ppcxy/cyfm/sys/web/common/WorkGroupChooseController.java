package com.ppcxy.cyfm.sys.web.common;

import com.ppcxy.common.entity.search.SearchOperator;
import com.ppcxy.common.entity.search.Searchable;
import com.ppcxy.common.utils.ShiroUserInfoUtils;
import com.ppcxy.common.web.bind.annotation.PageableDefaults;
import com.ppcxy.common.web.bind.annotation.SearchableDefaults;
import com.ppcxy.cyfm.sys.entity.group.WorkGroup;
import com.ppcxy.cyfm.sys.service.group.WorkGroupService;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
@RequestMapping(value = "/sys/common/workGroupChoose")
public class WorkGroupChooseController {
    
    @Resource
    private WorkGroupService workGroupService;
    
    @RequestMapping
    @SearchableDefaults( merge = true)
    @PageableDefaults(value = 5)
    public String dialog(Searchable searchable, Model model) {
    
        if (StringUtils.isNotBlank(searchable.getValue("keyword_custom"))) {
            searchable.addSearchFilter("name", SearchOperator.like, searchable.getValue("keyword_custom"));
        }
    
        Long teamId = ShiroUserInfoUtils.getTeamId();
    
        if (teamId != 1 && !SecurityUtils.getSubject().hasRole("Admin")) {
            searchable.addSearchFilter("team.id", SearchOperator.eq, teamId);
        }
        
        Page<WorkGroup> choosePage = workGroupService.findAll(searchable);
        model.addAttribute("choosePage", choosePage);
        return "sys/common/workGroup_choose";
        
    }
    
}
