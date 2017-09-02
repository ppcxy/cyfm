DROP TABLE IF EXISTS cy_sys_user_role;

DROP TABLE IF EXISTS cy_sys_role;

DROP TABLE IF EXISTS cy_sys_user;

DROP TABLE IF EXISTS cy_sys_team;

DROP TABLE IF EXISTS cy_sys_resource;

DROP TABLE IF EXISTS cy_sys_user_online;

DROP TABLE IF EXISTS cy_sys_permission;

DROP TABLE IF EXISTS cy_sys_role_resource_permission;

DROP TABLE IF EXISTS cy_sys_authorize;

CREATE TABLE cy_sys_role (
  id BIGINT  NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL UNIQUE,
  value VARCHAR(255) NOT NULL UNIQUE,
  permissions TEXT,
  description TEXT,
  PRIMARY KEY (id)
)
AUTO_INCREMENT=1000;

CREATE TABLE cy_sys_user (
  id BIGINT NOT NULL AUTO_INCREMENT,
  username VARCHAR(255) NOT NULL UNIQUE,
  name VARCHAR(64),
  password VARCHAR(255),
  salt VARCHAR(64),
  email VARCHAR(128),
  tel VARCHAR (20) UNIQUE,
  status VARCHAR(32),
  team_id BIGINT,
  create_date DATETIME ,
  deleted TINYINT DEFAULT 0,
  PRIMARY KEY (id)
)
AUTO_INCREMENT = 100;

CREATE TABLE cy_sys_user_role (
  user_id BIGINT NOT NULL,
  role_id BIGINT NOT NULL,
  PRIMARY KEY (user_id, role_id)
);

CREATE TABLE cy_sys_team (
  id BIGINT NOT NULL auto_increment,
  name VARCHAR(255) NOT NULL UNIQUE,
  master_id BIGINT,
  PRIMARY KEY (id)
)
AUTO_INCREMENT=1000;

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

CREATE TABLE cy_sys_user_online
(
  id VARCHAR(255) PRIMARY KEY NOT NULL,
  host VARCHAR(255),
  last_access_time DATETIME,
  online_session LONGTEXT,
  start_timestamp DATETIME,
  status VARCHAR(255),
  system_host VARCHAR(255),
  timeout BIGINT,
  user_agent VARCHAR(255),
  user_id BIGINT,
  username VARCHAR(255)
);

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
