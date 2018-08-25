package com.ppcxy.cyfm.shop.v.web;

import com.ppcxy.common.web.jcaptcha.JCaptcha;
import com.ppcxy.cyfm.sys.entity.permission.Role;
import com.ppcxy.cyfm.sys.entity.team.Team;
import com.ppcxy.cyfm.sys.entity.user.User;
import com.ppcxy.cyfm.sys.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * 前端用户注册web控制器
 */
@Controller
@RequestMapping("/shop/v/register")
public class ShopVRegisterController {
    
    @Autowired
    private UserService userService;
    
    /**
     * 进入注册页面
     *
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public String register() {
        return "/shop/v/register";
    }
    
    
    /**
     * 注册信息调教注册用户
     *
     * @param user
     * @param vcode
     * @param request
     * @return
     */
    @RequestMapping(method = RequestMethod.POST)
    public String registerSave(User user, String vcode, HttpServletRequest request) {
        
        if (JCaptcha.validateResponse(request, vcode)) {
            Role role = new Role();
            role.setId(3L);
            user.getRoleList().add(role);
            
            Team team = new Team();
            team.setId(2L);
            user.setTeam(team);
            
            user.setStatus("enabled");
            userService.save(user);
            return "redirect:/shop/v/login";
        } else {
            return "redirect:/shop/v/register?error=0";
        }
    }
    
    
    /**
     * 验证当前用户名是否存在
     *
     * @param oldUsername
     * @param username
     * @return
     */
    @RequestMapping(value = "checkUsername")
    @ResponseBody
    public String checkUsername(@RequestParam(value = "oldUsername", defaultValue = "") String oldUsername,
                                @RequestParam("username") String username) {
        if (username.equals(oldUsername)) {
            return "true";
        } else if (userService.findByUsername(username) == null) {
            return "true";
        }
        
        return "false";
    }
    
    /**
     * 验证email是否已经注册
     *
     * @param oldEmail
     * @param email
     * @return
     */
    @RequestMapping(value = "checkEmail")
    @ResponseBody
    public String checkEmail(@RequestParam(value = "oldEmail", defaultValue = "") String oldEmail,
                             @RequestParam("email") String email) {
        if (email.equals(oldEmail)) {
            return "true";
        } else if (userService.findByEmail(email) == null) {
            return "true";
        }
        
        return "false";
    }
    
    /**
     * 验证手机号是否已经注册
     *
     * @param oldTel
     * @param tel
     * @return
     */
    @RequestMapping(value = "checkTel")
    @ResponseBody
    public String checkTel(@RequestParam(value = "oldTel", defaultValue = "") String oldTel,
                           @RequestParam("tel") String tel) {
        if (tel.equals(oldTel)) {
            return "true";
        } else if (userService.findByTel(tel) == null) {
            return "true";
        }
        
        return "false";
    }
}
