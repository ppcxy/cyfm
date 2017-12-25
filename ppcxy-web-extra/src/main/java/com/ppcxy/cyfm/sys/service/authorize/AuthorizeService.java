package com.ppcxy.cyfm.sys.service.authorize;

import com.google.common.collect.Maps;
import com.google.common.collect.Sets;
import com.ppcxy.common.service.BaseService;
import com.ppcxy.cyfm.sys.entity.authorize.Authorize;
import com.ppcxy.cyfm.sys.entity.permission.Permission;
import com.ppcxy.cyfm.sys.entity.permission.Role;
import com.ppcxy.cyfm.sys.entity.permission.RoleResourcePermission;
import com.ppcxy.cyfm.sys.entity.resource.Resource;
import com.ppcxy.cyfm.sys.entity.user.User;
import com.ppcxy.cyfm.sys.service.permission.PermissionService;
import com.ppcxy.cyfm.sys.service.resource.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * TODO WEEP 关于授权查询的缓存优化，存储结构优化
 * Created by weep on 2016-8-11.
 */
@Service
@Transactional
public class AuthorizeService extends BaseService<Authorize, Long> {
    
    @Autowired
    private ResourceService resourceService;
    @Autowired
    private PermissionService permissionService;
    
    private static final Map<Long, String> perms = Maps.newHashMap();
    private static final Map<String, Set<String>> cacheUserPermissions = Maps.newConcurrentMap();
    
    @EventListener
    public void handleContextRefresh(ContextRefreshedEvent event) {
        initPerms();
    }
    
    public Set<String> findStringPermissions(User user) {
        Set<String> resultPermissions = Sets.newHashSet();
        
        if (cacheUserPermissions.containsKey(user.getUsername())) {
            return cacheUserPermissions.get(user.getUsername());
        }
        
        for (Role role : user.getRoleList()) {
            resultPermissions.addAll(role.getPermissionList());
            
            Set<RoleResourcePermission> roleResourcePermissions = role.getRoleResourcePermissions();
            Iterator<RoleResourcePermission> iterator = roleResourcePermissions.iterator();
            while (iterator.hasNext()) {
                RoleResourcePermission next = iterator.next();
                Resource resource = resourceService.findOne(next.getResourceId());
    
                Iterator<Long> permidsIterator = next.getPermissionIds().iterator();
                while (permidsIterator.hasNext()) {
                    String permString = perms.get(permidsIterator.next());
                    resultPermissions.add(resource.getIdentity() + ":" + permString);
                }
            }
        }
        
        cacheUserPermissions.put(user.getUsername(), resultPermissions);
        
        return resultPermissions;
    }
    
    /**
     * 重置权限字典
     */
    private void initPerms() {
        List<Permission> all = permissionService.findAll();
        
        for (Permission permission : all) {
            perms.put(permission.getId(), permission.getValue());
        }
    }
    
    /**
     * 在修改用户授权相关的时候清理缓存
     *
     * @param username
     */
    public void refresh(String username) {
        cacheUserPermissions.remove(username);
    }
    
    
    /**
     * 在权限变动较大的时候清理所有用户的权限缓存
     */
    public void refreshAll() {
        cacheUserPermissions.clear();
    }
    
}
