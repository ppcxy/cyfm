package com.ppcxy.cyfm.sys.service.user;

import com.ppcxy.common.service.UserLogUtils;
import com.ppcxy.cyfm.sys.entity.user.User;
import org.apache.shiro.exception.UserPasswordNotMatchException;
import org.apache.shiro.exception.UserPasswordRetryLimitExceedException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.stereotype.Service;
import org.springside.modules.security.utils.Digests;
import org.springside.modules.utils.Encodes;

import javax.annotation.PostConstruct;

/**
 */
@Service
public class PasswordService {
    public static final String HASH_ALGORITHM = "SHA-1";
    public static final int HASH_INTERATIONS = 1024;
    
    @Autowired
    private CacheManager cacheManager;
    
    private Cache loginRecordCache;
    
    @Value(value = "${user.password.maxRetryCount}")
    private int maxRetryCount = 10;
    
    public void setMaxRetryCount(int maxRetryCount) {
        this.maxRetryCount = maxRetryCount;
    }
    
    @PostConstruct
    public void init() {
        loginRecordCache = cacheManager.getCache("loginRecordCache");
    }
    
    
    public void validate(User user, String password) {
        String username = user.getUsername();
        
        int retryCount = 0;
        
        Cache.ValueWrapper value = loginRecordCache.get(username);
        if (value != null) {
            retryCount = (Integer) value.get();
        }
        
        if (retryCount >= maxRetryCount) {
            UserLogUtils.log(
                    username,
                    "passwordError",
                    "password error, retry limit exceed! password: {},max retry count {}",
                    password, maxRetryCount);
            throw new UserPasswordRetryLimitExceedException(maxRetryCount);
        }
        
        if (!matches(user, password)) {
            loginRecordCache.put(username, ++retryCount);
            UserLogUtils.log(
                    username,
                    "passwordError",
                    "password error! password: {} retry count: {}",
                    password, retryCount);
            throw new UserPasswordNotMatchException();
        } else {
            clearLoginRecordCache(username);
        }
    }
    
    public boolean matches(User user, String password) {
        return user.getPassword().equals(encryptPassword(password, user.getSalt()));
    }
    
    public void clearLoginRecordCache(String username) {
        loginRecordCache.evict(username);
    }
    
    
    public String encryptPassword(String password, String salt) {
        byte[] saltByts = Encodes.decodeHex(salt);
        byte[] hashPassword = Digests.sha1(password.getBytes(), saltByts, HASH_INTERATIONS);
        return Encodes.encodeHex(hashPassword);
    }
    
}
