package com.ppcxy.cyfm.sys.service;

import com.google.common.base.Function;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.google.common.collect.Sets;
import com.ppcxy.common.entity.search.SearchOperator;
import com.ppcxy.common.entity.search.Searchable;
import com.ppcxy.common.service.BaseService;
import com.ppcxy.cyfm.sys.entity.User;
import com.ppcxy.cyfm.sys.repository.jpa.RoleDao;
import com.ppcxy.cyfm.sys.repository.jpa.UserDao;
import com.ppcxy.common.service.UserLogUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.exception.UserBlockedException;
import org.apache.shiro.exception.UserNotExistsException;
import org.apache.shiro.exception.UserPasswordNotMatchException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.Map;
import java.util.Set;

/**
 * <p>Date: 13-2-4 下午3:01
 * <p>Version: 1.0
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

    @Override
    public User save(User user) {
        if (user.getCreateDate() == null) {
            user.setCreateDate(new Date());
        }
        user.randomSalt();
        if (StringUtils.isNotBlank(user.getPlainPassword() )) {
            user.setPassword(passwordService.encryptPassword(user.getLoginName(), user.getPlainPassword(), user.getSalt()));
        }

        User resultUser = super.save(user);
        return resultUser;

    }


    @Override
    public User update(User user) {

        User resultUser = super.update(user);

        return resultUser;
    }


    public User findByLoginName(String username) {
        if (StringUtils.isEmpty(username)) {
            return null;
        }
        return getUserRepository().findByLoginName(username);
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
        user.setPassword(passwordService.encryptPassword(user.getLoginName(), newPassword, user.getSalt()));
        update(user);
        return user;
    }


    public User login(String username, String password) {

        if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password)) {
            UserLogUtils.log(
                    username,
                    "loginError",
                    "username is empty");
            throw new UserNotExistsException();
        }
        //密码如果不在指定范围内 肯定错误
        if (password.length() < User.PASSWORD_MIN_LENGTH || password.length() > User.PASSWORD_MAX_LENGTH) {
            UserLogUtils.log(
                    username,
                    "loginError",
                    "password length error! password is between {} and {}",
                    User.PASSWORD_MIN_LENGTH, User.PASSWORD_MAX_LENGTH);

            throw new UserPasswordNotMatchException();
        }

        User user = null;

        //此处需要走代理对象，目的是能走缓存切面
        //UserService proxyUserService = (UserService) AopContext.currentProxy();

        if (maybeUsername(username)) {
            user = findByLoginName(username);
        }

        if (user == null && maybeEmail(username)) {
            user = findByEmail(username);
        }

        if (user == null && maybeMobilePhoneNumber(username)) {
            user = findByTel(username);
        }

        if (user == null) {
            UserLogUtils.log(
                    username,
                    "loginError",
                    "user is not exists!");

            throw new UserNotExistsException();
        }

        passwordService.validate(user, password);

        if (user.getStatus() == "disabled") {
            UserLogUtils.log(
                    username,
                    "loginError",
                    "user is blocked!");
            //userStatusHistoryService.getLastReason(user)
            throw new UserBlockedException("cccc");
        }

        UserLogUtils.log(
                username,
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

    private boolean maybeMobilePhoneNumber(String username) {
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
                    user.getLoginName(),
                    "changePassword",
                    "admin user {} change password!", opUser.getLoginName());

        }
    }


    public Set<Map<String, Object>> findIdAndNames(Searchable searchable, String usernme) {

        searchable.addSearchFilter("username", SearchOperator.like, usernme);
        searchable.addSearchFilter("deleted", SearchOperator.eq, false);

        return Sets.newHashSet(
                Lists.transform(
                        findAll(searchable).getContent(),
                        new Function<User, Map<String, Object>>() {
                            @Override
                            public Map<String, Object> apply(User input) {
                                Map<String, Object> data = Maps.newHashMap();
                                data.put("label", input.getLoginName());
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
}
