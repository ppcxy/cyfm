package com.ppcxy.cyfm.sys.service.user;

import com.google.common.base.Function;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.google.common.collect.Sets;
import com.ppcxy.common.entity.search.SearchOperator;
import com.ppcxy.common.entity.search.Searchable;
import com.ppcxy.common.exception.BaseException;
import com.ppcxy.common.service.BaseService;
import com.ppcxy.common.service.UserLogUtils;
import com.ppcxy.common.utils.ShiroUserInfoUtils;
import com.ppcxy.cyfm.sys.entity.user.User;
import com.ppcxy.cyfm.sys.repository.jpa.permission.RoleDao;
import com.ppcxy.cyfm.sys.repository.jpa.user.UserDao;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.exception.UserBlockedException;
import org.apache.shiro.exception.UserNotExistsException;
import org.apache.shiro.exception.UserPasswordNotMatchException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.Map;
import java.util.Set;

/**
 * 用户管理 service
 */
@Service
@Transactional
public class UserService extends BaseService<User, Long> {
    protected final Logger logger = LoggerFactory.getLogger(getClass());

    public static final String HASH_ALGORITHM = "SHA-1";
    public static final int HASH_INTERATIONS = 1024;
    private static final int SALT_SIZE = 8;

    private UserDao getUserRepository() {
        return (UserDao) baseRepository;
    }

    @Autowired
    private RoleDao roleDao;

    @Autowired
    private PasswordService passwordService;

    /**
     * 判断是否超级管理员.
     */
    private boolean isSupervisor(User user) {
        return ((user.getId() != null) && (user.getId() == 1L));
    }

    @Override
    public User save(User user) {
        if (isSupervisor(user)) {
            logger.warn("操作员{}尝试修改超级管理员用户", ShiroUserInfoUtils.getUsername());
            throw new BaseException("不能修改超级管理员用户");
        }

        if (user.getCreateDate() == null) {
            user.setCreateDate(new Date());
        }
        user.randomSalt();
        if (StringUtils.isNotBlank(user.getPlainPassword())) {
            user.setPassword(passwordService.encryptPassword(user.getPlainPassword(), user.getSalt()));
        }

        User resultUser = super.save(user);
        return resultUser;

    }


    @Override
    public User update(User user) {
        User resultUser = super.update(user);

        return resultUser;
    }


    public User findByUsername(String username) {
        if (StringUtils.isEmpty(username)) {
            return null;
        }
        return getUserRepository().findByUsername(username);
    }

    public User findByEmail(String email) {
        if (StringUtils.isEmpty(email)) {
            return null;
        }
        return getUserRepository().findByEmail(email);
    }


    public User findByTel(String tel) {
        if (StringUtils.isEmpty(tel)) {
            return null;
        }
        return getUserRepository().findByTel(tel);
    }


    public User changePassword(User user, String newPassword) {
        user.randomSalt();
        user.setPassword(passwordService.encryptPassword(newPassword, user.getSalt()));
        update(user);
        return user;
    }


    public User login(String loginName, String password) {
        if (StringUtils.isEmpty(loginName) || StringUtils.isEmpty(password)) {
            UserLogUtils.log(
                    loginName,
                    "loginError",
                    "loginName is empty");
            throw new UserNotExistsException();
        }
        //密码如果不在指定范围内 肯定错误
        if (password.length() < User.PASSWORD_MIN_LENGTH || password.length() > User.PASSWORD_MAX_LENGTH) {
            UserLogUtils.log(
                    loginName,
                    "loginError",
                    "password length error! password is between {} and {}",
                    User.PASSWORD_MIN_LENGTH, User.PASSWORD_MAX_LENGTH);

            throw new UserPasswordNotMatchException();
        }

        User user = null;

        //此处需要走代理对象，目的是能走缓存切面
        //UserService proxyUserService = (UserService) AopContext.currentProxy();

        if (maybeUsername(loginName)) {
            user = findByUsername(loginName);
        }

        if (user == null && maybeEmail(loginName)) {
            user = findByEmail(loginName);
        }

        if (user == null && maybeTel(loginName)) {
            user = findByTel(loginName);
        }

        if (user == null) {
            UserLogUtils.log(
                    loginName,
                    "loginError",
                    "user is not exists!");

            throw new UserNotExistsException();
        }

        passwordService.validate(user, password);

        if (user.getStatus() == "disabled") {
            UserLogUtils.log(
                    loginName,
                    "loginError",
                    "user is blocked!");
            //TODO WEEP 锁定原因 userStatusHistoryService.getLastReason(user)
            throw new UserBlockedException("异常锁定.");
        }

        UserLogUtils.log(
                loginName,
                "loginSuccess",
                "");
        return user;
    }


    private boolean maybeUsername(String username) {
        if (!username.matches(User.USERNAME_PATTERN)) {
            return false;
        }
        //如果用户名不在指定范围内也是错误的
        if (username.length() < User.USERNAME_MIN_LENGTH || username.length() > User.USERNAME_MAX_LENGTH) {
            return false;
        }

        return true;
    }

    private boolean maybeEmail(String username) {
        if (!username.matches(User.EMAIL_PATTERN)) {
            return false;
        }
        return true;
    }

    private boolean maybeTel(String username) {
        if (!username.matches(User.MOBILE_PHONE_NUMBER_PATTERN)) {
            return false;
        }
        return true;
    }

    public void changePassword(User opUser, Long[] ids, String newPassword) {
        //UserService proxyUserService = (UserService) AopContext.currentProxy();
        for (Long id : ids) {
            User user = findOne(id);
            changePassword(user, newPassword);
            UserLogUtils.log(
                    user.getUsername(),
                    "changePassword",
                    "admin user {} change password!", opUser.getUsername());

        }
    }

    //TODO 没用到的组织用户信息方法
    public Set<Map<String, Object>> findIdAndNames(Searchable searchable, String username) {

        searchable.addSearchFilter("username", SearchOperator.like, username);
        searchable.addSearchFilter("deleted", SearchOperator.eq, false);

        return Sets.newHashSet(
                Lists.transform(
                        findAll(searchable).getContent(),
                        new Function<User, Map<String, Object>>() {
                            @Override
                            public Map<String, Object> apply(User input) {
                                Map<String, Object> data = Maps.newHashMap();
                                data.put("label", input.getUsername());
                                data.put("value", input.getId());
                                return data;
                            }
                        }
                )
        );
    }

    public Object getAllRole() {
        return roleDao.findAll();
    }

    @Override
    public Page<User> findAll(Searchable searchable) {
        return super.findAll(searchable);
    }
}
