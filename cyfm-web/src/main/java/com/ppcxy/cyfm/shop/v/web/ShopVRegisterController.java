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

@Controller
@RequestMapping("/shop/v/register")
public class ShopVRegisterController {
    
    @Autowired
    private UserService userService;
    
    @RequestMapping(method = RequestMethod.GET)
    public String register() {
        return "/shop/v/register";
    }
    
    
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
