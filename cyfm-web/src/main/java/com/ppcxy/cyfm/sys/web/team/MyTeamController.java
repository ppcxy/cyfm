package com.ppcxy.cyfm.sys.web.team;

import com.ppcxy.common.web.bind.annotation.CurrentUser;
import com.ppcxy.cyfm.sys.entity.permission.Role;
import com.ppcxy.cyfm.sys.entity.user.User;
import com.ppcxy.cyfm.sys.entity.user.UserStatus;
import com.ppcxy.cyfm.sys.service.team.TeamService;
import com.ppcxy.cyfm.sys.service.user.UserService;
import com.ppcxy.cyfm.sys.web.team.dto.TeamUserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Objects;
import java.util.UUID;

/**
 * 我的团队管理
 */
@Controller
@RequestMapping(value = "/sys/myteam")
public class MyTeamController {
    
    @Autowired
    private UserService userService;
    @Autowired
    private TeamService teamService;
    
    @RequestMapping
    public String myteam(@CurrentUser User user, Model model) {
        List<User> teamUsers = userService.findByTeamId(user.getTeam().getId());
        
        model.addAttribute("users", teamUsers);
        return "/sys/myteam/main";
    }
    
    /**
     * 团队添加人员操作
     *
     * @param teamUserDTO
     * @param currentUser
     * @return
     */
    @RequestMapping("addMember")
    @ResponseBody
    public String addMember(TeamUserDTO teamUserDTO, @CurrentUser User currentUser) {
        
        if (!Objects.equals(currentUser.getTeam().getMaster().getUsername(), currentUser.getUsername())) {
            return "error";
        }
        
        User user = new User();
        user.setTeam(currentUser.getTeam());
        user.setUsername("RTUSER_"+UUID.randomUUID().toString().replaceAll("-", "").substring(2,8)+UUID.randomUUID().toString().replaceAll("-", "").substring(18,22));
        user.setName(teamUserDTO.getName());
        user.setPlainPassword(teamUserDTO.getPassword());
        user.setTel(teamUserDTO.getTel());
        user.setEmail(teamUserDTO.getEmail());
        user.setStatus(UserStatus.normal);
        
        
        List<Role> roles = teamService.getRolesByTeamId(currentUser.getTeam().getId());
        user.setRoleList(roles);
        
        userService.save(user);
        
        return "success";
    }
    
    
    /**
     * 修改成员账号使用状态
     *
     * @param memberId
     * @param enable
     * @param currentUser
     * @return
     */
    @RequestMapping("changeMemberState")
    @ResponseBody
    public String changeMemberState(Long memberId, Boolean enable, @CurrentUser User currentUser) {
        
        User member = userService.findOne(memberId);
        
        if (member.getTeam().getId() != currentUser.getTeam().getId() || !Objects.equals(currentUser.getTeam().getMaster().getUsername(), currentUser.getUsername())) {
            return "error";
        }
        
        if (Objects.equals(memberId, currentUser.getId())) {
            return "无法禁用自己。";
        }
        
        member.setStatus(enable ? UserStatus.normal : UserStatus.blocked);
        userService.update(member);
        
        return "success";
    }
    
}
