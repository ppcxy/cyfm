DROP TABLE IF EXISTS CY_SYS_USER_ROLE;

DROP TABLE IF EXISTS CY_SYS_ROLE;

DROP TABLE IF EXISTS CY_SYS_USER;

DROP TABLE IF EXISTS CY_SYS_TEAM;

DROP TABLE IF EXISTS CY_SYS_RESOURCE;

DROP TABLE IF EXISTS CY_SYS_USER_ONLINE;

CREATE TABLE CY_SYS_ROLE (
  ID BIGINT  NOT NULL AUTO_INCREMENT,
  NAME VARCHAR(255) NOT NULL UNIQUE,
  PERMISSIONS VARCHAR(255),
  PRIMARY KEY (ID)
);

CREATE TABLE CY_SYS_USER (
  ID BIGINT NOT NULL AUTO_INCREMENT,
  LOGIN_NAME VARCHAR(255) NOT NULL UNIQUE,
  NAME VARCHAR(64),
  PASSWORD VARCHAR(255),
  SALT VARCHAR(64),
  EMAIL VARCHAR(128),
  TEL VARCHAR (20) UNIQUE,
  STATUS VARCHAR(32),
  TEAM_ID BIGINT,
  CREATE_DATE DATETIME ,
  DELETED TINYINT DEFAULT 0,
  PRIMARY KEY (ID)
);

CREATE TABLE CY_SYS_USER_ROLE (
  USER_ID BIGINT NOT NULL,
  ROLE_ID BIGINT NOT NULL,
  PRIMARY KEY (USER_ID, ROLE_ID)
);

CREATE TABLE CY_SYS_TEAM (
  ID BIGINT NOT NULL AUTO_INCREMENT,
  NAME VARCHAR(255) NOT NULL UNIQUE,
  MASTER_ID BIGINT,
  PRIMARY KEY (ID)
);

CREATE TABLE CY_SYS_RESOURCE
(
  ID BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  NAME VARCHAR(255),
  ICON VARCHAR(255),
  IDENTITY VARCHAR(255),
  PARENT_ID BIGINT,
  PARENT_IDS VARCHAR(255),
  URL VARCHAR(255),
  WEIGHT INT,
  IS_SHOW BIT,
  RESOURCE_TYPE INT
);

CREATE TABLE CY_SYS_USER_ONLINE
(
  ID VARCHAR(255) PRIMARY KEY NOT NULL,
  HOST VARCHAR(255),
  LAST_ACCESS_TIME DATETIME,
  ONLINE_SESSION LONGTEXT,
  START_TIMESTAMP DATETIME,
  STATUS VARCHAR(255),
  SYSTEM_HOST VARCHAR(255),
  TIMEOUT BIGINT,
  USER_AGENT VARCHAR(255),
  USER_ID BIGINT,
  USERNAME VARCHAR(255)
);

