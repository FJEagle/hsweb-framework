-- ----------------------------
-- Table structure for S_CONFIG
-- ----------------------------

CREATE TABLE `s_config` (
  `u_id`        VARCHAR(32) NOT NULL PRIMARY KEY
  COMMENT 'UID',
  `content`     TEXT        NOT NULL
  COMMENT '配置内容',
  `remark`      VARCHAR(512)
  COMMENT '备注',
  `create_date` DATETIME    NOT NULL
  COMMENT '创建日期',
  `update_date` DATETIME
  COMMENT '修改日期'
);
ALTER TABLE `s_config` COMMENT '系统配置文件表';
-- ----------------------------
-- Table structure for S_FORM
-- ----------------------------
CREATE TABLE `s_form` (
  `u_id`        VARCHAR(32)  NOT NULL PRIMARY KEY
  COMMENT 'uid',
  `name`        VARCHAR(256) NOT NULL
  COMMENT '名称',
  `html`        TEXT COMMENT 'html内容',
  `meta`        TEXT COMMENT '结构定义',
  `config`      TEXT COMMENT '配置',
  `version`     INT COMMENT '版本',
  `using`       TINYINT COMMENT '是否使用中',
  `create_date` DATETIME     NOT NULL
  COMMENT '创建日期',
  `update_date` DATETIME COMMENT '修改日期',
  `remark`      VARCHAR(200)
);
ALTER TABLE `s_form` COMMENT '动态表单';


-- ----------------------------
-- Table structure for S_MODULES
-- ----------------------------
CREATE TABLE `s_modules` (
  `u_id`       VARCHAR(256)  NOT NULL PRIMARY KEY
  COMMENT 'uid',
  `name`       VARCHAR(256)  NOT NULL
  COMMENT '模块名称',
  `uri`        VARCHAR(1024) NULL
  COMMENT 'uri',
  `icon`       VARCHAR(256)  NULL
  COMMENT '图标',
  `p_id`       VARCHAR(256)  NOT NULL
  COMMENT '上级菜单',
  `remark`     VARCHAR(512)  NULL
  COMMENT '备注',
  `status`     INT(4)        NULL
  COMMENT '状态',
  `m_option`   TEXT          NOT NULL
  COMMENT '可选权限',
  `sort_index` INT(32)       NOT NULL
  COMMENT '排序'
);
ALTER TABLE `s_modules` COMMENT '系统模块';


CREATE TABLE `s_module_meta` (
  `u_id`      VARCHAR(256)  NOT NULL PRIMARY KEY
  COMMENT 'uid',
  `key`       VARCHAR(256)  NOT NULL
  COMMENT '标识',
  `module_id` VARCHAR(1024) NULL
  COMMENT '模块ID',
  `remark` VARCHAR(1024) NULL
  COMMENT '备注',
  `role_id`   VARCHAR(256)  NULL
  COMMENT '图标',
  `status`    INT(4)        NULL
  COMMENT '状态',
  `meta`      TEXT          NOT NULL
  COMMENT '定义内容'
);
ALTER TABLE `s_modules` COMMENT '系统模块配置';

-- ----------------------------
-- Records of S_MODULES
-- ----------------------------
INSERT INTO `s_modules` VALUES ('sys', '系统设置', NULL, 'fa fa-cog', '-1', '系统权限', '101', '[]', '1');
INSERT INTO `s_modules` VALUES ('form', '表单管理', 'admin/form/list.html', 'fa fa-wpforms', 'sys', NULL, '1', '[{"id":"M","text":"菜单可见","checked":true},{"id":"C","text":"新增","checked":false},{"id":"R","text":"查询","checked":false},{"id":"U","text":"修改","checked":false},{"id":"D","text":"删除","checked":false},{"id":"deploy","text":"发布","checked":false}]', '10101');
INSERT INTO `s_modules` VALUES ('module', '权限管理', 'admin/module/list.html', 'fa fa-list-alt', 'sys', NULL, '1', '[{"id":"M","text":"菜单可见","checked":true},{"id":"C","text":"新增","checked":false},{"id":"R","text":"查询","checked":false},{"id":"U","text":"修改","checked":false},{"id":"D","text":"删除","checked":false}]', '10102');
INSERT INTO `s_modules` VALUES ('role', '角色管理', 'admin/role/list.html', 'fa fa-users', 'sys', '初始数据', '1', '[{"id":"M", "text":"菜单可见", "uri":""},{"id":"C", "text":"新增", "uri":""},{"id":"R", "text":"查询", "uri":""},{"id":"U", "text":"修改", "uri":""},{"id":"D", "text":"删除", "uri":""}]', '10103');
INSERT INTO `s_modules` VALUES ('user', '用户管理', 'admin/user/list.html', 'fa fa-user', 'sys', '初始数据', '1', '[{"id":"M", "text":"菜单可见", "uri":""},{"id":"C", "text":"新增", "uri":""},{"id":"R", "text":"查询", "uri":""},{"id":"U", "text":"修改", "uri":""},{"id":"D", "text":"删除", "uri":""}]', '10104');
INSERT INTO `s_modules` VALUES ('s_logger', '日志管理', 'admin/logger/list.html', 'fa fa-book', 'sys', NULL, '1', '[{"id":"M","text":"菜单可见","checked":true},{"id":"R","text":"查询","checked":false}]', '10105');

-- ----------------------------
-- Table structure for S_RESOURCES
-- ----------------------------
CREATE TABLE `s_resources` (
  `u_id`        VARCHAR(256)  NOT NULL PRIMARY KEY
  COMMENT 'uid',
  `name`        VARCHAR(256)  NOT NULL
  COMMENT '资源名称',
  `path`        VARCHAR(1024) NOT NULL
  COMMENT '路径',
  `type`        VARCHAR(256)  NOT NULL
  COMMENT '类型',
  `md5`         VARCHAR(256)  NOT NULL
  COMMENT 'md5校验值',
  `status`      INT(4)        NULL
  COMMENT '状态',
  `create_date` DATETIME      NOT NULL
  COMMENT '创建时间',
  `creator_id`  VARCHAR(256)  NOT NULL
  COMMENT '创建人'
);
ALTER TABLE `s_resources` COMMENT '资源表';

-- ----------------------------
-- Table structure for S_ROLE
-- ----------------------------
CREATE TABLE `s_role` (
  `u_id`   VARCHAR(256) NOT NULL PRIMARY KEY
  COMMENT 'uid',
  `name`   VARCHAR(256) NOT NULL
  COMMENT '角色名称',
  `type`   VARCHAR(50)  NULL
  COMMENT '类型',
  `remark` VARCHAR(512) NULL
  COMMENT '备注'
);
ALTER TABLE `s_role` COMMENT '角色表';

-- ----------------------------
-- Records of S_ROLE
-- ----------------------------
INSERT INTO `s_role` VALUES ('admin', '超级管理员', NULL, '初始数据');

-- ----------------------------
-- Table structure for S_ROLE_MODULES
-- ----------------------------
CREATE TABLE `s_role_modules` (
  `u_id`      VARCHAR(256) NOT NULL PRIMARY KEY
  COMMENT 'uid',
  `module_id` VARCHAR(256) NOT NULL
  COMMENT '模块id',
  `role_id`   VARCHAR(256) NOT NULL
  COMMENT '角色id',
  `o_level`   TEXT         NULL
  COMMENT '可操作权限'
);
ALTER TABLE `s_role_modules` COMMENT '角色模块绑定表';

-- ----------------------------
-- Table structure for S_SCRIPT
-- ----------------------------
CREATE TABLE `s_script` (
  `u_id`    VARCHAR(256)  NOT NULL PRIMARY KEY
  COMMENT 'uid',
  `name`    VARCHAR(256)  NOT NULL
  COMMENT '脚本名称',
  `path`    VARCHAR(1024) NOT NULL
  COMMENT '路径',
  `type`    VARCHAR(256)  NOT NULL
  COMMENT '类型',
  `content` TEXT          NOT NULL
  COMMENT '内容',
  `remark`  VARCHAR(512)  NULL
  COMMENT '备注',
  `status`  INT(4)        NULL
  COMMENT '状态'
);
ALTER TABLE `s_script` COMMENT '脚本';

-- ----------------------------
-- Records of S_TEST_2
-- ----------------------------

-- ----------------------------
-- Table structure for S_USER
-- ----------------------------
CREATE TABLE `s_user` (
  `u_id`        VARCHAR(64)  NOT NULL PRIMARY KEY
  COMMENT 'ID',
  `username`    VARCHAR(64)  NOT NULL
  COMMENT '用户名',
  `password`    VARCHAR(64)  NOT NULL
  COMMENT '密码',
  `name`        VARCHAR(64)  NULL
  COMMENT '姓名',
  `email`       VARCHAR(512) NULL
  COMMENT '邮箱',
  `phone`       VARCHAR(64)  NULL
  COMMENT '联系电话',
  `status`      INT(4)       NULL
  COMMENT '状态',
  `create_date` DATETIME     NOT NULL
  COMMENT '创建日期',
  `update_date` DATETIME     NULL
  COMMENT '修改日期',
  `ent_id`      VARCHAR(64)  NULL
  COMMENT '企业ID'
);
ALTER TABLE `s_user` COMMENT '用户表';

-- ----------------------------
-- Records of S_USER
-- ----------------------------
INSERT INTO `s_user` VALUES ('admin', 'admin', '23ec59e119da971084cbd0ba72d230a0', '超级管理员', NULL, NULL, '1', TO_datetime('2015-11-19 12:10:36', 'YYYY-MM-DD HH24:MI:SS'), NULL, NULL);
-- ----------------------------
-- Table structure for S_USER_ROLE
-- ----------------------------
CREATE TABLE `s_user_role` (
  `u_id`    VARCHAR(256) NOT NULL PRIMARY KEY
  COMMENT 'UID',
  `user_id` VARCHAR(256) NOT NULL
  COMMENT '用户ID',
  `role_id` VARCHAR(256) NOT NULL
  COMMENT '角色ID'
);
ALTER TABLE `s_user_role` COMMENT '用户角色关联表';

CREATE TABLE s_history
(
  `u_id`              VARCHAR(32) NOT NULL
  COMMENT 'UID',
  `type`              VARCHAR(64) NOT NULL
  COMMENT '类型',
  `describe`          VARCHAR(512) COMMENT '描述',
  `primary_key_name`  VARCHAR(32) COMMENT '主键名称',
  `primary_key_value` VARCHAR(64) COMMENT '主键值',
  `change_before`     TEXT COMMENT '修改前的值',
  `change_after`      TEXT COMMENT '修改后的值',
  `create_date`       DATETIME    NOT NULL
  COMMENT '创建日期',
  `creator_id`        VARCHAR(32) COMMENT '创建人'
);
ALTER TABLE `s_history` COMMENT '操作记录表';
