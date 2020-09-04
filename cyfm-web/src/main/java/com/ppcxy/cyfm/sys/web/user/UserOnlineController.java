package com.ppcxy.cyfm.sys.web.user;

import com.ppcxy.common.entity.search.Searchable;
import com.ppcxy.common.spring.SpringContextHolder;
import com.ppcxy.common.utils.MessageUtils;
import com.ppcxy.common.web.bind.annotation.PageableDefaults;
import com.ppcxy.common.web.controller.BaseCRUDController;
import com.ppcxy.cyfm.sys.entity.user.UserOnline;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.session.mgt.DefaultSessionKey;
import org.apache.shiro.session.mgt.OnlineSession;
import org.apache.shiro.session.mgt.SessionKey;
import org.apache.shiro.session.mgt.eis.OnlineSessionDAO;
import org.apache.shiro.web.session.mgt.OnlineWebSessionManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * <p>Date: 13-1-28 下午4:29
 * <p>Version: 1.0
 */
@Controller
@RequestMapping(value = "/sys/user/online")
public class UserOnlineController extends BaseCRUDController<UserOnline, String> {

    @Autowired
    private OnlineSessionDAO onlineSessionDAO;

    public UserOnlineController() {
        setResourceIdentity("sys:user:online");
        setModelName("online");
    }

    @Override
    protected void preResponse(Model model) {
        model.addAttribute("customToolbar", true);
        model.addAttribute("statusList", OnlineSession.OnlineStatus.values());
    }

    @Override
    @PageableDefaults(sort = "startTimestamp=desc")
    public String list(Searchable searchable, Model model) {
        if (!SecurityUtils.getSubject().isPermitted("sys:userOnline:view or monitor:userOnline:view")) {
            throw new UnauthorizedException(MessageUtils.message("no.view.permission", "sys:userOnline:view或monitor:userOnline:view"));
        }
        return super.list(searchable, model);
    }

    @Override
    @RequestMapping(method = RequestMethod.GET, headers = "table=true")
    @PageableDefaults(sort = "startTimestamp=desc")
    public String listTable(Searchable searchable, Model model) {
        return super.listTable(searchable, model);
    }

    @RequestMapping("/forceLogout")
    public String forceLogout(@RequestParam(value = "ids") String[] ids) {

        if (!SecurityUtils.getSubject().isPermitted("sys:userOnline or monitor:userOnline")) {
            throw new UnauthorizedException(MessageUtils.message("no.view.permission", "sys:userOnline或monitor:userOnline"));
        }

        for (String id : ids) {
            UserOnline online = baseService.findOne(id);
            if (online == null) {
                continue;
            }
            OnlineSession onlineSession = (OnlineSession) onlineSessionDAO.readSession(online.getId());
            if (onlineSession == null) {
                continue;
            }


            onlineSession.setStatus(OnlineSession.OnlineStatus.force_logout);
            online.setStatus(OnlineSession.OnlineStatus.force_logout);

            try {
                onlineSession.stop();
                SessionKey key = new DefaultSessionKey(online.getId());
                SpringContextHolder.getBean(OnlineWebSessionManager.class).useValidate(onlineSession, key);
            } catch (InvalidSessionException e) {
            }

            baseService.update(online);
        }
        return redirectToUrl(null);
    }

}
