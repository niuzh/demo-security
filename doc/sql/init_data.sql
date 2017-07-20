
INSERT INTO demo.user (id, user_name, password, real_name, tel, email, status_type, is_admin, last_login_ip, last_login_date, last_pwd_update_date, remark, is_deleted, version, sys_create_id, sys_create_time, sys_update_id, sys_update_time, sys_delete_id, sys_delete_time) VALUES ('admin', 'admin', 'admin', 'admin', null, null, null, 1, null, null, null, null, 0, 0, null, null, null, null, null, null);

INSERT INTO demo.role (id, role_name, remark, is_deleted, version, sys_create_id, sys_create_time, sys_update_id, sys_update_time, sys_delete_id, sys_delete_time) VALUES ('index', '角色', '角色', 0, 0, null, null, null, null, null, null);

INSERT INTO demo.authority (id, authority_name, key_value, pid, sort, remark, is_deleted, version, sys_create_id, sys_create_time, sys_update_id, sys_update_time, sys_delete_id, sys_delete_time) VALUES ('Index', '首页', 'Index', null, '0', null, 0, 0, null, null, null, null, null, null);

INSERT INTO demo.authority_resource_rel (id, authority_id, resource_id, is_deleted, version, sys_create_id, sys_create_time, sys_update_id, sys_update_time, sys_delete_id, sys_delete_time) VALUES ('Index', 'Index', 'Index', 0, 0, null, null, null, null, null, null);

INSERT INTO demo.resource (id, resource_name, type, resource, sort, remark, is_deleted, version, sys_create_id, sys_create_time, sys_update_id, sys_update_time, sys_delete_id, sys_delete_time) VALUES ('Index', '首页', 'url', '/', '0', '首页', 0, 0, null, null, null, null, null, null);
