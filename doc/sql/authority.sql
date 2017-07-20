/*用户表*/
/*角色表*/
/*权限表*/
/*资源表*/
/*用户角色表*/
/*角色权限表*/
/*权限资源表*/

/*用户修改密码表*/
/*用户登陆日志表*/
/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2017/7/18 17:42:41                           */
/*==============================================================*/


drop table if exists authority;

drop table if exists authority_resource_rel;

drop table if exists resource;

drop table if exists role;

drop table if exists role_authority_rel;

drop table if exists user;

drop table if exists user_login_rec;

drop table if exists user_role_rel;

/*==============================================================*/
/* Table: authority                                             */
/*==============================================================*/
create table authority
(
  id                   varchar(50) not null comment 'pk_id',
  authority_name       varchar(50) comment '权限名',
  key_value            varchar(50) comment 'key',
  pid                  varchar(50) comment '父id',
  sort                 varchar(50) comment '排序',
  remark               varchar(1000) comment '备注',
  is_deleted           tinyint(1) comment '是否删除',
  version              int comment '版本',
  sys_create_id        varchar(50) comment '创建人id',
  sys_create_time      date comment '创建时间',
  sys_update_id        varchar(50) comment '修改人id',
  sys_update_time      date comment '修改时间',
  sys_delete_id        varchar(50) comment '删除任Id',
  sys_delete_time      date comment '删除时间',
  primary key (id)
);

alter table authority comment '权限';

/*==============================================================*/
/* Table: authority_resource_rel                                */
/*==============================================================*/
create table authority_resource_rel
(
  id                   varchar(50) not null comment 'pk_id',
  authority_id         varchar(50) comment '权限id',
  resource_id          varchar(50) comment '资源id',
  is_deleted           tinyint(1) comment '是否删除',
  version              int comment '版本',
  sys_create_id        varchar(50) comment '创建人id',
  sys_create_time      date comment '创建时间',
  sys_update_id        varchar(50) comment '修改人id',
  sys_update_time      date comment '修改时间',
  sys_delete_id        varchar(50) comment '删除任Id',
  sys_delete_time      date comment '删除时间',
  primary key (id)
);

alter table authority_resource_rel comment '权限资源关联';

/*==============================================================*/
/* Table: resource                                              */
/*==============================================================*/
create table resource
(
  id                   varchar(50) not null comment 'pk_id',
  resource_name        varchar(50) comment '资源名',
  type                 varchar(50) comment '资源类型',
  resource             varchar(100) comment '资源',
  sort                 varchar(50) comment '排序',
  remark               varchar(1000) comment '备注',
  is_deleted           tinyint(1) comment '是否删除',
  version              int comment '版本',
  sys_create_id        varchar(50) comment '创建人id',
  sys_create_time      date comment '创建时间',
  sys_update_id        varchar(50) comment '修改人id',
  sys_update_time      date comment '修改时间',
  sys_delete_id        varchar(50) comment '删除任Id',
  sys_delete_time      date comment '删除时间',
  primary key (id)
);

alter table resource comment '资源';

/*==============================================================*/
/* Table: role                                                  */
/*==============================================================*/
create table role
(
  id                   varchar(50) not null comment 'pk_id',
  role_name            varchar(50) comment '角色名',
  remark               varchar(1000) comment '备注',
  is_deleted           tinyint(1) comment '是否删除',
  version              int comment '版本',
  sys_create_id        varchar(50) comment '创建人id',
  sys_create_time      date comment '创建时间',
  sys_update_id        varchar(50) comment '修改人id',
  sys_update_time      date comment '修改时间',
  sys_delete_id        varchar(50) comment '删除任Id',
  sys_delete_time      date comment '删除时间',
  primary key (id)
);

alter table role comment '角色';

/*==============================================================*/
/* Table: role_authority_rel                                    */
/*==============================================================*/
create table role_authority_rel
(
  id                   varchar(50) not null comment 'pk_id',
  role_id              varchar(50) comment '角色id',
  authoriry_id         varchar(50) comment '权限id',
  is_deleted           tinyint(1) comment '是否删除',
  version              int comment '版本',
  sys_create_id        varchar(50) comment '创建人id',
  sys_create_time      date comment '创建时间',
  sys_update_id        varchar(50) comment '修改人id',
  sys_update_time      date comment '修改时间',
  sys_delete_id        varchar(50) comment '删除任Id',
  sys_delete_time      date comment '删除时间',
  primary key (id)
);

alter table role_authority_rel comment '角色权限关联';

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
  id                   varchar(50) not null comment 'pk_id',
  user_name            varchar(50) comment '用户登录名',
  password             varchar(50) comment '密码',
  real_name            varchar(50) comment '用户真名',
  tel                  varchar(50) comment '电话',
  email                varchar(50) comment '邮箱',
  status_type          varchar(50) comment '用户状态',
  is_admin             tinyint(1) comment '是否管理员',
  last_login_ip        varchar(50) comment '最后一次登录ip',
  last_login_date      date comment '最后一次登录时间',
  last_pwd_update_date date comment '最后一次修改密码时间',
  remark               varchar(1000) comment '备注',
  is_deleted           tinyint(1) comment '是否删除',
  version              int comment '版本',
  sys_create_id        varchar(50) comment '创建人id',
  sys_create_time      date comment '创建时间',
  sys_update_id        varchar(50) comment '修改人id',
  sys_update_time      date comment '修改时间',
  sys_delete_id        varchar(50) comment '删除任Id',
  sys_delete_time      date comment '删除时间',
  primary key (id)
);

/*==============================================================*/
/* Table: user_login_rec                                        */
/*==============================================================*/
create table user_login_rec
(
  id                   varchar(50) not null comment 'pk_id',
  user_id              varchar(50) comment '用户id',
  last_login_ip        varchar(50) comment '登录ip',
  last_login_date      date comment '登录时间',
  is_deleted           tinyint(1) comment '是否删除',
  version              int comment '版本',
  sys_create_id        varchar(50) comment '创建人id',
  sys_create_time      date comment '创建时间',
  sys_update_id        varchar(50) comment '修改人id',
  sys_update_time      date comment '修改时间',
  sys_delete_id        varchar(50) comment '删除任Id',
  sys_delete_time      date comment '删除时间',
  primary key (id)
);

alter table user_login_rec comment '用户登录记录';

/*==============================================================*/
/* Table: user_role_rel                                         */
/*==============================================================*/
create table user_role_rel
(
  id                   varchar(50) not null comment 'pk_id',
  user_id              varchar(50) comment '用户id',
  role_id              varchar(50) comment '角色id',
  is_deleted           tinyint(1) comment '是否删除',
  version              int comment '版本',
  sys_create_id        varchar(50) comment '创建人id',
  sys_create_time      date comment '创建时间',
  sys_update_id        varchar(50) comment '修改人id',
  sys_update_time      date comment '修改时间',
  sys_delete_id        varchar(50) comment '删除任Id',
  sys_delete_time      date comment '删除时间',
  primary key (id)
);

alter table user_role_rel comment '用户角色关联';

