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
    
    public Set<String> findStringPermissions(User user) {
        initPerms();
        
        Set<String> resultPermissinos = Sets.newHashSet();
        
        for (Role role : user.getRoleList()) {
            resultPermissinos.addAll(role.getPermissionList());

            Set<RoleResourcePermission> roleResourcePermissions = role.getRoleResourcePermissions();
            Iterator<RoleResourcePermission> iterator = roleResourcePermissions.iterator();
            while (iterator.hasNext()) {
                RoleResourcePermission next = iterator.next();
                Resource resource = resourceService.findOne(next.getResourceId());

                Iterator<Long> permidsIterator = next.getPermissionIds().iterator();
                while (permidsIterator.hasNext()) {
                    String permString = perms.get(permidsIterator.next());
                    resultPermissinos.add(resource.getIdentity() + ":" + permString);
                }
            }
        }
        
        return resultPermissinos;
    }
    
    /**
     * 重置权限字典
     */
    private void initPerms() {
        perms.clear();
        
        List<Permission> all = permissionService.findAll();
        
        for (Permission permission : all) {
            perms.put(permission.getId(), permission.getValue());
        }
    }
    
    
}
