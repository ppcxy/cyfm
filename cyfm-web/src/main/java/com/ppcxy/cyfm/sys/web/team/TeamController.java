package com.ppcxy.cyfm.sys.web.team;

import com.ppcxy.common.entity.search.SearchOperator;
import com.ppcxy.common.entity.search.Searchable;
import com.ppcxy.common.utils.ShiroUserInfoUtils;
import com.ppcxy.common.web.controller.BaseCRUDController;
import com.ppcxy.cyfm.sys.entity.permission.Role;
import com.ppcxy.cyfm.sys.entity.team.Team;
import com.ppcxy.cyfm.sys.entity.user.User;
import com.ppcxy.cyfm.sys.service.authorize.AuthorizeService;
import com.ppcxy.cyfm.sys.service.permission.RoleService;
import com.ppcxy.cyfm.sys.service.resource.ResourceService;
import com.ppcxy.cyfm.sys.service.team.TeamService;
import com.ppcxy.cyfm.sys.service.user.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Objects;

/**
 * Created by weep on 2016-5-16.
 */
@Controller
@RequestMapping(value = "/sys/team")
public class TeamController extends BaseCRUDController<Team, Long> {
    
    @Autowired
    private ResourceService resourceService;
    @Autowired
    private UserService userService;
    @Autowired
    private TeamService teamService;
    @Autowired
    private RoleService roleService;
    
    @Autowired
    private AuthorizeService authorizeService;
    
    public TeamController() {
        setResourceIdentity("sys:team");
        //和资源一致可以不处理
        setModelName("team");
    }
    
    @Override
    protected void preResponse(Model model) {
        model.addAttribute("rootMenus", resourceService.findRoots(userService.findByUsername(ShiroUserInfoUtils.getUsername())));
        super.preResponse(model);
    }
    
    
    @Override
    public void beforList(Searchable searchable, Model model) {
        super.beforList(searchable, model);
        searchable.addSearchFilter("deleted", SearchOperator.eq, false);
    }
    
    @Override
    public void beforCreate(Model model, Team entity, BindingResult result, RedirectAttributes redirectAttributes) {
        super.beforCreate(model, entity, result, redirectAttributes);
        bindTeamNewUserList(entity);
    }
    
    @Override
    public void afterCreate(Model model, Team entity, BindingResult result, RedirectAttributes redirectAttributes) {
        super.afterCreate(model, entity, result, redirectAttributes);
        addTeamAdminRoleToUser(entity);
    }
    
    @Override
    public void beforUpdate(Model model, Team entity, BindingResult result, String backURL, RedirectAttributes redirectAttributes) {
        super.beforUpdate(model, entity, result, backURL, redirectAttributes);
        bindTeamNewUserList(entity);
    }
    
    @Override
    public void afterUpdate(Model model, Team entity, BindingResult result, String backURL, RedirectAttributes redirectAttributes) {
        super.afterUpdate(model, entity, result, backURL, redirectAttributes);
        addTeamAdminRoleToUser(entity);
    }
    
    public void addTeamAdminRoleToUser(Team entity) {
        if (entity.getMaster() != null) {
            Role role = roleService.findByValue("TEAM_ADMIN");
            
            if (role != null) {
                HttpServletRequest request = ((ServletRequestAttributes) (RequestContextHolder.currentRequestAttributes())).getRequest();
                String oldMaster = request.getParameter("oldMaster");
                
                if (StringUtils.isNotBlank(oldMaster)) {
                    if (!Objects.equals(entity.getMaster().getId(), Long.parseLong(oldMaster))) {
                        roleService.removeRoleAllot(role.getId(), Long.parseLong(oldMaster));
                    }
                }
                
                List<User> users = roleService.findUsers(role);
                if (!users.contains(entity.getMaster())) {
                    roleService.allotRole2User(role.getId(), new Long[]{entity.getMaster().getId()});
                }
            }
            
        }
    }
    
    private void bindTeamNewUserList(Team entity) {
        HttpServletRequest request = ((ServletRequestAttributes) (RequestContextHolder.currentRequestAttributes())).getRequest();
        String[] userIds = request.getParameterValues("userList.id");
        
        List<User> userList = entity.getNewUserList();
        userList.clear();
        
        userList.add(entity.getMaster());
        
        if (userIds != null) {
            //重新初始化用户列表
            for (String userIdStr : userIds) {
                Long userId = new Long(userIdStr);
                if (!Objects.equals(userId, entity.getMaster().getId())) {
                    User user = new User();
                    user.setId(userId);
                    userList.add(user);
                }
            }
        }
        
        authorizeService.refreshAll();
    }
    
    
    @RequestMapping(value = "checkTeamName")
    @ResponseBody
    public String checkTeamName(@RequestParam("oldName") String oldName,
                                @RequestParam("name") String name) {
        if (name.equals(oldName)) {
            return "true";
        } else if (teamService.findByName(name) == null) {
            return "true";
        }
        
        return "false";
    }
}
