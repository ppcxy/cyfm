drop table if exists ss_user_role;

drop table if exists ss_role;

drop table if exists ss_user;

drop table if exists ss_team;

create table ss_role (
  id bigint  not null AUTO_INCREMENT,
  name varchar(255) not null unique,
  permissions varchar(255),
  primary key (id)
);

create table ss_user (
  id bigint not null AUTO_INCREMENT,
  login_name varchar(255) not null unique,
  name varchar(64),
  password varchar(255),
  salt varchar(64),
  email varchar(128),
  tel VARCHAR (20),
  status varchar(32),
  create_date date,
  team_id bigint,
  primary key (id)
);

create table ss_user_role (
  user_id bigint not null,
  role_id bigint not null,
  primary key (user_id, role_id)
);

create table ss_team (
  id bigint not null AUTO_INCREMENT,
  name varchar(255) not null unique,
  master_id bigint,
  primary key (id)
);
