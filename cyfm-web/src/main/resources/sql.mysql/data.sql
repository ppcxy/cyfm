insert into cy_sys_user (id, login_name, name, email,tel, password, salt, status, team_id,deleted,create_date) values(1,'admin','管理员','admin@springside.org.cn','13888888888','691b14d79bf0fa2215f155235df5e670b64394cc','7efbd59d9741d34f','enabled',1,0,'2012-01-01 00:00:00');

insert into cy_sys_user (id, login_name, name, email,tel, password, salt, status, team_id,deleted,create_date) values(2,'user','Calvin','user@springside.org.cn',
'13211111112','2488aa0c31c624687bd9928e0a5d29e7d1ed520b','6d65d24122c30500','enabled',1,0,'2012-01-01 00:00:00');
insert into cy_sys_user (id, login_name, name, email,tel, password, salt, status, team_id,deleted,create_date)values(3,'user2','Jack','jack@springside.org.cn',
'13211111113','2488aa0c31c624687bd9928e0a5d29e7d1ed520b','6d65d24122c30500','enabled',1,0,'2012-01-01 00:00:00');
insert into cy_sys_user (id, login_name, name, email,tel, password, salt, status, team_id,deleted,create_date) values(4,'user3','Kate','kate@springside.org.cn',
'13211111114','2488aa0c31c624687bd9928e0a5d29e7d1ed520b','6d65d24122c30500','enabled',1,0,'2012-01-01 00:00:00');
insert into cy_sys_user (id, login_name, name, email,tel, password, salt, status, team_id,deleted,create_date) values(5,'user4','Sawyer','sawyer@springside.org.cn',
'13211111115','2488aa0c31c624687bd9928e0a5d29e7d1ed520b','6d65d24122c30500','enabled',1,0,'2012-01-01 00:00:00');
insert into cy_sys_user (id, login_name, name, email,tel, password, salt, status, team_id,deleted,create_date) values(6,'user5','Ben','ben@springside.org.cn',
'13211111116','2488aa0c31c624687bd9928e0a5d29e7d1ed520b','6d65d24122c30500','enabled',1,0,'2012-01-01 00:00:00');

INSERT INTO cy_sys_resource (id, name, icon, identity, parent_id, parent_ids, url, weight, is_show, resource_type) VALUES (1, '系统功能', 'icon-th-large', 'root', 0, '0', '/', 1, true, 0);
INSERT INTO cy_sys_resource (id, name, icon, identity, parent_id, parent_ids, url, weight, is_show, resource_type) VALUES (26, '系统管理', 'fa fa-cogs', '', 1, '01/', '', 1, true, 0);
INSERT INTO cy_sys_resource (id, name, icon, identity, parent_id, parent_ids, url, weight, is_show, resource_type) VALUES (27, '用户管理', 'fa fa-user', 'user', 26, '01/26/', '/sys/user', 1, true, 0);
INSERT INTO cy_sys_resource (id, name, icon, identity, parent_id, parent_ids, url, weight, is_show, resource_type) VALUES (28, '团队管理', 'fa fa-users', 'team', 26, '01/26/', '/sys/team', 2, true, 0);
INSERT INTO cy_sys_resource (id, name, icon, identity, parent_id, parent_ids, url, weight, is_show, resource_type) VALUES (29, '资源管理', 'icon-refresh', 'resource', 26, '01/26/', '/sys/resource', 3, true, 0);
INSERT INTO cy_sys_resource (id, name, icon, identity, parent_id, parent_ids, url, weight, is_show, resource_type) VALUES (30, '监控维护', 'fa fa-cogs', '', 1, '01/', '', 2, true, 0);
INSERT INTO cy_sys_resource (id,NAME, ICON, IDENTITY, PARENT_ID, PARENT_IDS, URL, WEIGHT, IS_SHOW, RESOURCE_TYPE) VALUES (31,'Druid监控', 'ztree_file', '', 30, '01/30/', '/manage/monitor/druid/index.html', 1, true, 0);
INSERT INTO cy_sys_resource (id,NAME, ICON, IDENTITY, PARENT_ID, PARENT_IDS, URL, WEIGHT, IS_SHOW, RESOURCE_TYPE) VALUES (32,'JVM监控', 'ztree_file', 'monitor:jvm', 30, '01/30/', '/manage/monitor/jvm', 2, true, 0);
INSERT INTO cy_sys_resource (id,NAME, ICON, IDENTITY, PARENT_ID, PARENT_IDS, URL, WEIGHT, IS_SHOW, RESOURCE_TYPE) VALUES (33,'SQL/JPQL操作', 'ztree_file', '', 30, '01/30/', '/manage/monitor/db/sql', 3, true, 0);
INSERT INTO cy_sys_resource (id,NAME, ICON, IDENTITY, PARENT_ID, PARENT_IDS, URL, WEIGHT, IS_SHOW, RESOURCE_TYPE) VALUES (34,'Ehcache监控', 'ztree_file', '', 30, '01/30/', '/manage/monitor/ehcache', 4, true, 0);
INSERT INTO cy_sys_resource (id,NAME, ICON, IDENTITY, PARENT_ID, PARENT_IDS, URL, WEIGHT, IS_SHOW, RESOURCE_TYPE) VALUES (35,'Hibernate监控', 'ztree_file', 'monitor:hibernate', 30, '01/30/', '/manage/monitor/hibernate', 5, true, 0);

insert into cy_sys_role (id, name, permissions) values(1,'Admin','user:view,user:update,user:create,resource:*,team:*');
insert into cy_sys_role (id, name, permissions) values(2,'User','user:view');

insert into cy_sys_user_role (user_id, role_id) values(1,1);
insert into cy_sys_user_role (user_id, role_id) values(1,2);
insert into cy_sys_user_role (user_id, role_id) values(2,2);
insert into cy_sys_user_role (user_id, role_id) values(3,2);
insert into cy_sys_user_role (user_id, role_id) values(4,2);
insert into cy_sys_user_role (user_id, role_id) values(5,2);
insert into cy_sys_user_role (user_id, role_id) values(6,2);

insert into cy_sys_team (id, name, master_id) values(1,'Dolphin',1);
