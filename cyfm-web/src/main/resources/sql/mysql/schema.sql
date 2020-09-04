DROP TABLE IF EXISTS cy_excel_template;

DROP TABLE IF EXISTS cy_sys_user_role;

DROP TABLE IF EXISTS cy_sys_role;

DROP TABLE IF EXISTS cy_sys_user;

DROP TABLE IF EXISTS cy_sys_user_detail;

DROP TABLE IF EXISTS cy_sys_team;

DROP TABLE IF EXISTS cy_sys_resource;

DROP TABLE IF EXISTS cy_sys_user_online;

DROP TABLE IF EXISTS cy_sys_permission;

DROP TABLE IF EXISTS cy_sys_role_resource_permission;

DROP TABLE IF EXISTS cy_sys_authorize;

DROP TABLE IF EXISTS cy_maintain_task_definition;

DROP TABLE IF EXISTS cy_datasource_manage;

DROP TABLE IF EXISTS cy_maintain_notification_data;

DROP TABLE IF EXISTS cy_maintain_notification_template;

DROP TABLE IF EXISTS fs_files;

DROP TABLE IF EXISTS properties;

DROP TABLE IF EXISTS bus_join_system;

DROP TABLE IF EXISTS bus_remote_api;

create table cy_excel_template
(
    id int auto_increment
        primary key,
    template_id varchar(500) null,
    resource_identity varchar(500) null
);

create table cy_sys_role
(
	id bigint auto_increment
		primary key,
	name varchar(255) not null,
	value varchar(255) not null,
	permissions text null,
	description text null,
	constraint name
		unique (name),
	constraint value
		unique (value)
)
AUTO_INCREMENT=1000;

create table cy_sys_user
(
	id bigint auto_increment
		primary key,
	username varchar(255) not null,
	name varchar(64) null,
	password varchar(255) null,
	salt varchar(64) null,
	email varchar(128) null,
	tel varchar(20) null,
	status varchar(32) null,
	team_id bigint null,
	create_date datetime null,
	deleted tinyint default 0 null,
	totp_secret varchar(4000) null,
	constraint tel
		unique (tel),
	constraint username
		unique (username)
)
AUTO_INCREMENT = 100;

create table cy_sys_user_detail
(
	id BIGINT NOT NULL AUTO_INCREMENT,
	real_Name varchar(255) null,
	gender varchar(2) null,
	birth_date date null,
	province varchar(255) null,
	city varchar(255) null,
	address varchar(3000) null,
	zip_code varchar(10) null,
	user_id bigint null ,
  PRIMARY KEY (id)
)
AUTO_INCREMENT = 100;


create table cy_sys_user_wechat_bind
(
	id bigint auto_increment
		primary key,
	wechat_openid varchar(55) null,
	user_id bigint null,
	bind_date datetime null,
	subsystem varchar(50) null
);

create table cy_sys_user_role
(
	user_id bigint not null,
	role_id bigint not null,
	primary key (user_id, role_id)
);

create table cy_sys_team
(
	id bigint auto_increment
		primary key,
	name varchar(255) not null,
	city varchar(255) null,
	sign varchar(255) null,
	master_id bigint null,
	max_member_count bigint null,
	default_roles varchar(3000) null,
	root_menu varchar(50) null,
	root_menu_id bigint null,
	deleted tinyint default 0 not null,
	constraint name
		unique (name)
)
AUTO_INCREMENT=1000;

create table cy_sys_work_group
(
	id bigint auto_increment
		primary key,
	team_id bigint null,
	name varchar(255) not null,
	master_id bigint null,
	deleted tinyint default 0 null,
	constraint name
		unique (team_id, name)
);

create table cy_sys_work_group_user
(
	id bigint auto_increment
		primary key,
	work_group_id bigint null,
	user_id bigint null
);

CREATE TABLE cy_sys_resource
(
  id BIGINT PRIMARY KEY NOT NULL auto_increment,
  name VARCHAR(255),
  icon VARCHAR(255),
  _identity VARCHAR(255),
  parent_id BIGINT,
  parent_ids VARCHAR(255),
  url VARCHAR(255),
  weight INT,
  is_show BIT,
  resource_type INT
)
AUTO_INCREMENT=1000;


create table cy_sys_user_last_online
(
	id bigint auto_increment
		primary key,
	USER_ID bigint null,
	USERNAME varchar(300) null,
	LAST_UID varchar(255) null,
	HOST varchar(100) null,
	USER_AGENT varchar(800) null,
	SYSTEM_HOST varchar(100) null,
	LAST_LOGIN_TIMESTAMP datetime null,
	LAST_STOP_TIMESTAMP datetime null,
	LOGIN_COUNT bigint null,
	TOTAL_ONLINE_TIME bigint null,
	CREATE_DATE datetime default CURRENT_TIMESTAMP not null
);

create table cy_sys_user_online
(
	id varchar(255) not null
		primary key,
	host varchar(255) null,
	last_access_time datetime null,
	online_session longtext null,
	start_timestamp datetime null,
	status varchar(255) null,
	system_host varchar(255) null,
	timeout bigint null,
	user_agent varchar(255) null,
	user_id bigint null,
	username varchar(255) null
);

create trigger trigger_sys_user_off_online
	after delete
	on cy_sys_user_online
	for each row
	begin
    DECLARE v_flag INT;
    IF OLD.user_id IS NOT NULL
    THEN
        SELECT (CASE
                    WHEN exists(SELECT user_id
                                FROM cy_sys_user_last_online
                                WHERE user_id = OLD.user_id)
                        THEN 1
                    ELSE 0 END) AS val
        INTO v_flag
        FROM DUAL;
    end if;

    IF v_flag = 0
    THEN
        INSERT INTO cy_sys_user_last_online
        (user_id, username, last_uid, host, user_agent, system_host,
         last_login_timestamp, last_stop_timestamp, login_count, total_online_time)
        VALUES (OLD.user_id, OLD.username, OLD.id, OLD.host, OLD.user_agent,
                OLD.system_host, OLD.start_timestamp, OLD.last_access_time, 1,
                (UNIX_TIMESTAMP(OLD.last_access_time) - UNIX_TIMESTAMP(OLD.start_timestamp)));
    ELSE
        UPDATE cy_sys_user_last_online
        SET username             =OLD.username,
            last_uid             =OLD.id,
            host                 =OLD.host,
            user_agent           =OLD.user_agent,
            system_host          =OLD.system_host,
            last_login_timestamp =OLD.start_timestamp,
            last_stop_timestamp  =OLD.last_access_time,
            login_count          = login_count + 1,
            total_online_time    = total_online_time +
                                   (UNIX_TIMESTAMP(OLD.last_access_time) - UNIX_TIMESTAMP(OLD.start_timestamp))
        WHERE user_id = OLD.user_id;
    end if;
end;

CREATE TABLE cy_sys_permission
(
    id BIGINT(20) PRIMARY KEY NOT NULL auto_increment,
    name VARCHAR(100) NOT NULL UNIQUE,
    value VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
)
AUTO_INCREMENT=1000;

CREATE TABLE cy_sys_role_resource_permission(
  id BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  role_id BIGINT,
  resource_id BIGINT,
  permission_ids VARCHAR(500),
  CONSTRAINT unique_sys_role_resource_permission UNIQUE(role_id, resource_id)
)
AUTO_INCREMENT=1000;

CREATE TABLE cy_sys_authorize
(
    id BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    user_id BIGINT NOT NULL,
    target_id BIGINT NOT NULL,
    auth_type VARCHAR(50) NOT NULL
)
AUTO_INCREMENT=1000;

create table cy_maintain_task_definition
(
	id bigint auto_increment
		primary key,
	name varchar(300) null,
	cron varchar(300) null,
	bean_class varchar(300) null,
	bean_name varchar(300) null,
	method_Name varchar(300) null,
	is_start tinyint(1) null,
	description varchar(4000) null
)
AUTO_INCREMENT=1000;

create table cy_datasource_manage
(
	id bigint auto_increment
		primary key,
	DS_NAME varchar(200) not null,
	DS_TYPE varchar(200) not null,
	DB_NAME varchar(200) not null,
	DB_TYPE varchar(200) not null,
	DB_HOST varchar(200) not null,
	DB_PORT varchar(200) not null,
	DB_USERNAME varchar(200) not null,
	DB_PASSWORD varchar(200) not null,
	create_date datetime null,
	creator varchar(50) null,
	team_id bigint null
)
AUTO_INCREMENT=1000;

create table cy_maintain_notification_data
(
	id BIGINT AUTO_INCREMENT
    PRIMARY KEY,
	USER_ID BIGINT,
	SYSTEM VARCHAR(50),
	TITLE VARCHAR(600),
	CONTENT VARCHAR(2000),
	PUBLISH_DATE DATETIME,
	IS_READ BIGINT
)
AUTO_INCREMENT=1000;

create table cy_maintain_notification_template
(
	id BIGINT AUTO_INCREMENT
    PRIMARY KEY,
	NAME VARCHAR(200),
	SYSTEM VARCHAR(50),
	TITLE VARCHAR(600),
	TEMPLATE VARCHAR(2000),
	DELETED bigint
)
AUTO_INCREMENT=1000;

create table fs_files
(
	id varchar(36) not null
		primary key,
	real_name varchar(300) null,
	logic_name varchar(300) null,
	location varchar(4000) null,
	file_size bigint,
	type_content varchar(300) null,
	file_suffix varchar(10) null,
	identity varchar(255) null,
	second_identity varchar(255) null,
	tag varchar(255) null,
  upload_time datetime,
  uploader varchar(255),
  state varchar(255)
);

CREATE TABLE PROPERTIES
(
	ID BIGINT AUTO_INCREMENT
		PRIMARY KEY,
	`KEY` VARCHAR(50) NULL,
	`VALUE` VARCHAR(500) NULL,
	APPLICATION VARCHAR(50) NULL,
	PROFILE VARCHAR(50) NULL,
	LABEL VARCHAR(50) NULL
)
AUTO_INCREMENT=1000;


CREATE TABLE BUS_JOIN_SYSTEM
(
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    sys_name VARCHAR(300),
    sys_address VARCHAR(100),
    sys_base_path VARCHAR(100),
    login_api_path VARCHAR(4000),
    auth_username_key VARCHAR(100) default 'username',
    auth_password_key VARCHAR(100) default 'password',
    auth_other_params TEXT,
    auth_username VARCHAR(200),
    auth_password VARCHAR(200),
    requst_method VARCHAR(200)
)
AUTO_INCREMENT=1000;

CREATE TABLE BUS_REMOTE_API
(
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    join_system_id BIGINT,
    remote_api_name VARCHAR(300),
    remote_api_path VARCHAR(4000),
    request_method VARCHAR(100),
    param_model TEXT,
    remark VARCHAR(3000)
)
AUTO_INCREMENT=1000;
