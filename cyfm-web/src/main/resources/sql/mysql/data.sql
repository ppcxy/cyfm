insert into cy_sys_user (id, username, name, email,tel, password, salt, status, team_id,deleted,create_date) values(1,'admin','管理员','admin@springside.org.cn','13888888888','691b14d79bf0fa2215f155235df5e670b64394cc','7efbd59d9741d34f','enabled',1,0,'2012-01-01 00:00:00');
insert into cy_sys_user (id, username, name, email,tel, password, salt, status, team_id,deleted,create_date) values(2,'user','Calvin','user@springside.org.cn',
'13211111112','2488aa0c31c624687bd9928e0a5d29e7d1ed520b','6d65d24122c30500','enabled',1,0,'2012-01-01 00:00:00');
insert into cy_sys_user (id, username, name, email,tel, password, salt, status, team_id,deleted,create_date)values(3,'user2','Jack','jack@springside.org.cn',
'13211111113','2488aa0c31c624687bd9928e0a5d29e7d1ed520b','6d65d24122c30500','enabled',1,0,'2012-01-01 00:00:00');
insert into cy_sys_user (id, username, name, email,tel, password, salt, status, team_id,deleted,create_date) values(4,'user3','Kate','kate@springside.org.cn',
'13211111114','2488aa0c31c624687bd9928e0a5d29e7d1ed520b','6d65d24122c30500','enabled',1,0,'2012-01-01 00:00:00');
insert into cy_sys_user (id, username, name, email,tel, password, salt, status, team_id,deleted,create_date) values(5,'user4','Sawyer','sawyer@springside.org.cn',
'13211111115','2488aa0c31c624687bd9928e0a5d29e7d1ed520b','6d65d24122c30500','enabled',1,0,'2012-01-01 00:00:00');
insert into cy_sys_user (id, username, name, email,tel, password, salt, status, team_id,deleted,create_date) values(6,'user5','Ben','ben@springside.org.cn',
'13211111116','2488aa0c31c624687bd9928e0a5d29e7d1ed520b','6d65d24122c30500','enabled',1,0,'2012-01-01 00:00:00');


INSERT INTO cy_sys_resource (ID, NAME, ICON, _IDENTITY, PARENT_ID, PARENT_IDS, URL, WEIGHT, IS_SHOW, RESOURCE_TYPE) VALUES (1, '系统功能', 'icon-th-large', 'root', 0, '0', '/', 1, true, 0);
INSERT INTO cy_sys_resource (ID, NAME, ICON, _IDENTITY, PARENT_ID, PARENT_IDS, URL, WEIGHT, IS_SHOW, RESOURCE_TYPE) VALUES (20, '系统管理', 'fa fa-cogs', '', 1, '01/', '', 1, true, 0);
INSERT INTO cy_sys_resource (ID, NAME, ICON, _IDENTITY, PARENT_ID, PARENT_IDS, URL, WEIGHT, IS_SHOW, RESOURCE_TYPE) VALUES (21, '用户管理', 'fa fa-user', 'user', 20, '01/20/', '/sys/user', 1, true, 0);
INSERT INTO cy_sys_resource (ID, NAME, ICON, _IDENTITY, PARENT_ID, PARENT_IDS, URL, WEIGHT, IS_SHOW, RESOURCE_TYPE) VALUES (22, '团队管理', 'fa fa-users', 'team', 20, '01/20/', '/sys/team', 2, true, 0);
INSERT INTO cy_sys_resource (ID, NAME, ICON, _IDENTITY, PARENT_ID, PARENT_IDS, URL, WEIGHT, IS_SHOW, RESOURCE_TYPE) VALUES (23, '角色管理', 'ztree_file', 'role', 20, '01/20/', '/sys/role', 3, true, 0);
INSERT INTO cy_sys_resource (ID, NAME, ICON, _IDENTITY, PARENT_ID, PARENT_IDS, URL, WEIGHT, IS_SHOW, RESOURCE_TYPE) VALUES (24, '资源管理', 'icon-refresh', 'resource', 20, '01/20/', '/sys/resource', 4, true, 0);


INSERT INTO cy_sys_resource (ID, NAME, ICON, _IDENTITY, PARENT_ID, PARENT_IDS, URL, WEIGHT, IS_SHOW, RESOURCE_TYPE) VALUES (30, '系统监控', 'fa fa-cogs', '', 1, '01/', '', 2, true, 0);

INSERT INTO cy_sys_resource (ID, NAME, ICON, _IDENTITY, PARENT_ID, PARENT_IDS, URL, WEIGHT, IS_SHOW, RESOURCE_TYPE) VALUES (31, 'Druid监控', 'ztree_file', '', 30, '01/30/', '/manage/monitor/druid/index.html', 1, true, 0);
INSERT INTO cy_sys_resource (ID, NAME, ICON, _IDENTITY, PARENT_ID, PARENT_IDS, URL, WEIGHT, IS_SHOW, RESOURCE_TYPE) VALUES (32, 'JVM监控', 'ztree_file', 'monitor:jvm', 30, '01/30/', '/manage/monitor/jvm', 2, true, 0);
INSERT INTO cy_sys_resource (ID, NAME, ICON, _IDENTITY, PARENT_ID, PARENT_IDS, URL, WEIGHT, IS_SHOW, RESOURCE_TYPE) VALUES (33, 'SQL/JPQL操作', 'ztree_file', '', 30, '01/30/', '/manage/monitor/db/sql', 3, true, 0);
INSERT INTO cy_sys_resource (ID, NAME, ICON, _IDENTITY, PARENT_ID, PARENT_IDS, URL, WEIGHT, IS_SHOW, RESOURCE_TYPE) VALUES (34, 'Ehcache监控', 'ztree_file', '', 30, '01/30/', '/manage/monitor/ehcache', 4, true, 0);
INSERT INTO cy_sys_resource (ID, NAME, ICON, _IDENTITY, PARENT_ID, PARENT_IDS, URL, WEIGHT, IS_SHOW, RESOURCE_TYPE) VALUES (35, 'Hibernate监控', 'ztree_file', 'monitor:hibernate', 30, '01/30/', '/manage/monitor/hibernate', 5, true, 0);

INSERT INTO cy_sys_resource (ID, NAME, ICON, _IDENTITY, PARENT_ID, PARENT_IDS, URL, WEIGHT, IS_SHOW, RESOURCE_TYPE) VALUES (40, '系统维护', 'ztree_file', '', 1, '01/', '', 3, true, 0);
INSERT INTO cy_sys_resource (ID, NAME, ICON, _IDENTITY, PARENT_ID, PARENT_IDS, URL, WEIGHT, IS_SHOW, RESOURCE_TYPE) VALUES (41, '静态资源管理', 'ztree_file', '', 40, '01/40/', '/manage/maintain/staticResource', 1, true, 0);

INSERT INTO cy_sys_resource (ID, NAME, ICON, _IDENTITY, PARENT_ID, PARENT_IDS, URL, WEIGHT, IS_SHOW, RESOURCE_TYPE) VALUES (50, '演示功能', 'ztree_file', '', 1, '01/', '', 4, true, 0);
INSERT INTO cy_sys_resource (ID, NAME, ICON, _IDENTITY, PARENT_ID, PARENT_IDS, URL, WEIGHT, IS_SHOW, RESOURCE_TYPE) VALUES (51, 'dialog演示', 'ztree_file', '', 50, '01/50/', '/demo/ui/dialog', 1, true, 0);


insert into cy_sys_role (id, name, permissions) values(1,'Admin','*');
insert into cy_sys_role (id, name, permissions) values(2,'User','user:view');


insert into cy_sys_user_role (user_id, role_id) values(1,1);
insert into cy_sys_user_role (user_id, role_id) values(1,2);
insert into cy_sys_user_role (user_id, role_id) values(2,2);
insert into cy_sys_user_role (user_id, role_id) values(3,2);
insert into cy_sys_user_role (user_id, role_id) values(4,2);
insert into cy_sys_user_role (user_id, role_id) values(5,2);
insert into cy_sys_user_role (user_id, role_id) values(6,2);


insert into cy_sys_team (id, name, master_id) values(1,'Dolphin',1);


INSERT INTO cyfm.cy_sys_permission (id, name, value, detailed) VALUES (1, '创建权限', 'create', '资源的创建权限----值为:create 实际用法 资源标识:create');
INSERT INTO cyfm.cy_sys_permission (id, name, value, detailed) VALUES (2, '修改权限', 'update', '资源的创建权限----值为:update 实际用法 资源标识:update ');
INSERT INTO cyfm.cy_sys_permission (id, name, value, detailed) VALUES (3, '删除权限', 'delete', '资源的删除权限----值为:delete 实际用法 资源标识:delete ');
INSERT INTO cyfm.cy_sys_permission (id, name, value, detailed) VALUES (4, '查看权限', 'view', '资源的查看权限----值为:view 实际用法 资源标识:view  ');
INSERT INTO cyfm.cy_sys_permission (id, name, value, detailed) VALUES (5, '导入权限', 'import', '资源的导入权限----值为:import 实际用法 资源标识:import ');
INSERT INTO cyfm.cy_sys_permission (id, name, value, detailed) VALUES (6, '导出权限', 'export', '资源的导出权限----值为:export 实际用法 资源标识:export ');