/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : 127.0.0.1:3306
 Source Schema         : ccss

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 22/01/2022 17:33:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for class_schedule
-- ----------------------------
DROP TABLE IF EXISTS `class_schedule`;
CREATE TABLE `class_schedule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NULL DEFAULT NULL COMMENT '课程id',
  `up_time` int(4) NULL DEFAULT NULL COMMENT '上课时间 第几节    总共   按大学课表算',
  `week` int(1) NULL DEFAULT NULL COMMENT '星期几',
  `user_id` bigint(22) NULL DEFAULT NULL COMMENT '学生id',
  `unit` int(11) NULL DEFAULT NULL COMMENT '所属部门',
  `teacher` bigint(22) NULL DEFAULT NULL COMMENT '任课老师',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `class_schedule_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `class_schedule_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class_schedule
-- ----------------------------
INSERT INTO `class_schedule` VALUES (1, 4, 1, 2, 1, 2, 117, '2022-01-21 10:56:50');
INSERT INTO `class_schedule` VALUES (2, 4, 4, 4, 1, 2, 117, '2022-01-21 10:56:53');
INSERT INTO `class_schedule` VALUES (3, 4, 1, 1, 1, 2, 118, '2022-01-21 10:56:55');
INSERT INTO `class_schedule` VALUES (4, 4, 1, 1, 110, 3, 117, '2022-01-21 11:01:35');
INSERT INTO `class_schedule` VALUES (5, 1, 2, 1, 1, 2, 117, '2022-01-21 13:08:09');

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_use` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `effect` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_schema` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfo_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfoaggr_datagrouptenantdatum`(`data_id`, `group_id`, `tenant_id`, `datum_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '增加租户字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info_aggr
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfobeta_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_beta' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info_beta
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfotag_datagrouptenanttag`(`data_id`, `group_id`, `tenant_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_tag' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info_tag
-- ----------------------------

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `uk_configtagrelation_configidtag`(`id`, `tag_name`, `tag_type`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_tag_relation' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_tags_relation
-- ----------------------------

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程名称',
  `type` int(11) NULL DEFAULT NULL COMMENT '课程类型 1公共课 2选修课 3必修课 4人文素质',
  `credit` int(11) NULL DEFAULT NULL COMMENT '学分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, '一', 1, 1);
INSERT INTO `course` VALUES (4, '环世界', 4, 2);

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '集群、各Group容量信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of group_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info`  (
  `id` bigint(64) UNSIGNED NOT NULL,
  `nid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `op_type` char(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `idx_gmt_create`(`gmt_create`) USING BTREE,
  INDEX `idx_gmt_modified`(`gmt_modified`) USING BTREE,
  INDEX `idx_did`(`data_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '多租户改造' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
INSERT INTO `his_config_info` VALUES (0, 1, 'test', 'DEFAULT_GROUP', '', 'spring.ca', '389fe541cfc9bdbeb4831b2b9e4a4be6', '2021-12-14 10:22:28', '2021-12-14 02:23:16', NULL, '192.168.6.44', 'I', '');
INSERT INTO `his_config_info` VALUES (1, 2, 'test', 'DEFAULT_GROUP', '', 'spring.ca', '389fe541cfc9bdbeb4831b2b9e4a4be6', '2021-12-14 10:22:46', '2021-12-14 02:23:34', NULL, '192.168.6.44', 'D', '');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `role` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `resource` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  UNIQUE INDEX `uk_role_permission`(`role`, `resource`, `action`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permissions
-- ----------------------------

-- ----------------------------
-- Table structure for persistent_logins
-- ----------------------------
DROP TABLE IF EXISTS `persistent_logins`;
CREATE TABLE `persistent_logins`  (
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `series` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`series`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of persistent_logins
-- ----------------------------
INSERT INTO `persistent_logins` VALUES ('admin', 'aHx3MV8kF23fg/YJmLfpFg==', '3BPm0/XVL/vTptnBJ3OWbA==', '2021-11-28 11:37:20');
INSERT INTO `persistent_logins` VALUES ('admin', 'znBxzgUNyoc9T2/Oegz4Dg==', '0KTpZZ/boHm7ItnZGAhACA==', '2021-11-28 11:07:53');
INSERT INTO `persistent_logins` VALUES ('admin', 'yOjLQIgW6gIJoT5BxdfUaw==', 'wJVrYjaKRhvxQNslmauVOg==', '2021-11-26 10:04:15');
INSERT INTO `persistent_logins` VALUES ('admin', 'd7fOnQg40vrxilkei1FLtA==', 'B1wztURx70THRTluKZAXzw==', '2021-11-28 21:23:37');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  UNIQUE INDEX `idx_user_role`(`username`, `role`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('nacos', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9415 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (8940, 'admin', '登录平台', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (8941, 'admin', '登录平台', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (8942, 'admin', '登录平台', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (8943, 'admin', '登录平台', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (8944, 'admin', '登录平台', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (8945, 'admin', '登录平台', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (8946, 'admin', '登录平台', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (8947, 'admin', '登录平台', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (8948, 'admin', '登录平台', NULL, NULL, 0, NULL, '2021-11-29 16:09:57');
INSERT INTO `sys_log` VALUES (8949, 'admin', '登录平台', NULL, NULL, 0, NULL, '2021-11-29 16:10:05');
INSERT INTO `sys_log` VALUES (8950, 'admin', '登录平台', NULL, NULL, 0, NULL, '2021-11-29 16:10:09');
INSERT INTO `sys_log` VALUES (8951, 'admin', '登录平台', NULL, NULL, 0, NULL, '2021-11-29 16:16:05');
INSERT INTO `sys_log` VALUES (8952, 'admin', '登录平台', NULL, NULL, 0, NULL, '2021-11-29 16:17:10');
INSERT INTO `sys_log` VALUES (8953, 'admin', '登录平台', NULL, NULL, 0, NULL, '2021-11-29 16:18:24');
INSERT INTO `sys_log` VALUES (8954, 'admin', '登录平台', NULL, NULL, 0, NULL, '2021-11-29 16:24:17');
INSERT INTO `sys_log` VALUES (8955, 'admin', '登录平台', NULL, NULL, 0, NULL, '2021-11-29 16:46:08');
INSERT INTO `sys_log` VALUES (8956, 'admin', '登录平台', NULL, NULL, 0, NULL, '2021-11-29 16:52:37');
INSERT INTO `sys_log` VALUES (8957, 'admin', '登录平台', NULL, NULL, 0, NULL, '2021-11-29 16:54:41');
INSERT INTO `sys_log` VALUES (8958, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-29 16:59:49');
INSERT INTO `sys_log` VALUES (8959, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2021-11-29 17:08:44');
INSERT INTO `sys_log` VALUES (8960, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2021-11-29 17:15:27');
INSERT INTO `sys_log` VALUES (8961, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-29 17:24:02');
INSERT INTO `sys_log` VALUES (8962, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-29 17:25:51');
INSERT INTO `sys_log` VALUES (8963, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2021-11-29 17:30:20');
INSERT INTO `sys_log` VALUES (8964, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2021-11-30 08:45:43');
INSERT INTO `sys_log` VALUES (8965, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2021-11-30 08:46:45');
INSERT INTO `sys_log` VALUES (8966, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2021-11-30 08:47:08');
INSERT INTO `sys_log` VALUES (8967, '1234', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 08:47:21');
INSERT INTO `sys_log` VALUES (8968, '1234', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 08:48:13');
INSERT INTO `sys_log` VALUES (8969, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 09:00:26');
INSERT INTO `sys_log` VALUES (8970, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 09:34:20');
INSERT INTO `sys_log` VALUES (8971, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 09:39:05');
INSERT INTO `sys_log` VALUES (8972, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 09:39:08');
INSERT INTO `sys_log` VALUES (8973, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 09:39:09');
INSERT INTO `sys_log` VALUES (8974, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 09:39:09');
INSERT INTO `sys_log` VALUES (8975, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 09:39:10');
INSERT INTO `sys_log` VALUES (8976, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 09:39:11');
INSERT INTO `sys_log` VALUES (8977, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 09:39:11');
INSERT INTO `sys_log` VALUES (8978, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 09:39:12');
INSERT INTO `sys_log` VALUES (8979, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 09:39:13');
INSERT INTO `sys_log` VALUES (8980, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 09:39:14');
INSERT INTO `sys_log` VALUES (8981, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 09:39:14');
INSERT INTO `sys_log` VALUES (8982, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 09:39:15');
INSERT INTO `sys_log` VALUES (8983, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 09:39:16');
INSERT INTO `sys_log` VALUES (8984, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 09:39:17');
INSERT INTO `sys_log` VALUES (8985, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 09:39:17');
INSERT INTO `sys_log` VALUES (8986, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 09:39:18');
INSERT INTO `sys_log` VALUES (8987, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 09:39:19');
INSERT INTO `sys_log` VALUES (8988, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 09:39:21');
INSERT INTO `sys_log` VALUES (8989, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 09:39:28');
INSERT INTO `sys_log` VALUES (8990, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 10:37:09');
INSERT INTO `sys_log` VALUES (8991, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 10:39:35');
INSERT INTO `sys_log` VALUES (8992, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 10:39:53');
INSERT INTO `sys_log` VALUES (8993, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 10:49:30');
INSERT INTO `sys_log` VALUES (8994, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 10:56:15');
INSERT INTO `sys_log` VALUES (8995, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 11:01:16');
INSERT INTO `sys_log` VALUES (8996, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 11:05:30');
INSERT INTO `sys_log` VALUES (8997, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 11:08:33');
INSERT INTO `sys_log` VALUES (8998, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 11:27:31');
INSERT INTO `sys_log` VALUES (8999, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 11:30:12');
INSERT INTO `sys_log` VALUES (9000, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 11:37:55');
INSERT INTO `sys_log` VALUES (9001, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 11:39:28');
INSERT INTO `sys_log` VALUES (9002, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 11:43:20');
INSERT INTO `sys_log` VALUES (9003, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 11:44:15');
INSERT INTO `sys_log` VALUES (9004, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 11:52:11');
INSERT INTO `sys_log` VALUES (9005, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 13:32:50');
INSERT INTO `sys_log` VALUES (9006, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 13:34:00');
INSERT INTO `sys_log` VALUES (9007, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 13:34:04');
INSERT INTO `sys_log` VALUES (9008, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 13:34:05');
INSERT INTO `sys_log` VALUES (9009, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 13:34:06');
INSERT INTO `sys_log` VALUES (9010, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 13:34:06');
INSERT INTO `sys_log` VALUES (9011, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 13:34:07');
INSERT INTO `sys_log` VALUES (9012, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 13:34:07');
INSERT INTO `sys_log` VALUES (9013, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 13:34:07');
INSERT INTO `sys_log` VALUES (9014, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 13:34:08');
INSERT INTO `sys_log` VALUES (9015, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 13:34:08');
INSERT INTO `sys_log` VALUES (9016, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 13:34:09');
INSERT INTO `sys_log` VALUES (9017, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 13:34:09');
INSERT INTO `sys_log` VALUES (9018, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 13:34:09');
INSERT INTO `sys_log` VALUES (9019, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 13:34:49');
INSERT INTO `sys_log` VALUES (9020, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 13:35:48');
INSERT INTO `sys_log` VALUES (9021, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 13:40:30');
INSERT INTO `sys_log` VALUES (9022, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 13:48:37');
INSERT INTO `sys_log` VALUES (9023, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2021-11-30 14:20:42');
INSERT INTO `sys_log` VALUES (9024, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2021-11-30 14:20:58');
INSERT INTO `sys_log` VALUES (9025, '1234', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 14:21:05');
INSERT INTO `sys_log` VALUES (9026, '1234', '登录平台', NULL, NULL, 0, '192.168.6.44', '2021-11-30 16:39:42');
INSERT INTO `sys_log` VALUES (9027, '1234', '登录平台', NULL, NULL, 0, '221.12.76.42', '2021-11-30 16:56:13');
INSERT INTO `sys_log` VALUES (9028, '1234', '登录平台', NULL, NULL, 0, '221.12.76.42', '2021-11-30 16:56:42');
INSERT INTO `sys_log` VALUES (9029, '1234', '登录平台', NULL, NULL, 0, '221.12.76.42', '2021-11-30 16:56:49');
INSERT INTO `sys_log` VALUES (9030, '1234', '登录平台', NULL, NULL, 0, '221.12.76.42', '2021-11-30 16:56:51');
INSERT INTO `sys_log` VALUES (9031, '1234', '登录平台', NULL, NULL, 0, '221.12.76.42', '2021-11-30 16:56:52');
INSERT INTO `sys_log` VALUES (9032, '1234', '登录平台', NULL, NULL, 0, '221.12.76.42', '2021-11-30 16:56:53');
INSERT INTO `sys_log` VALUES (9033, '1234', '登录平台', NULL, NULL, 0, '221.12.76.42', '2021-11-30 16:59:03');
INSERT INTO `sys_log` VALUES (9034, '1234', '登录平台', NULL, NULL, 0, '221.12.76.42', '2021-11-30 16:59:07');
INSERT INTO `sys_log` VALUES (9035, '1234', '登录平台', NULL, NULL, 0, '221.12.76.42', '2021-11-30 17:04:12');
INSERT INTO `sys_log` VALUES (9036, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-11-30 17:09:49');
INSERT INTO `sys_log` VALUES (9037, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-11-30 17:28:35');
INSERT INTO `sys_log` VALUES (9038, '1234', '登录平台', NULL, NULL, 0, '112.12.146.222', '2021-11-30 21:50:41');
INSERT INTO `sys_log` VALUES (9039, NULL, '尝试登录', NULL, NULL, 0, '112.12.146.222', '2021-11-30 21:51:35');
INSERT INTO `sys_log` VALUES (9040, 'admin', '登录平台', NULL, NULL, 0, '112.12.146.222', '2021-11-30 21:51:41');
INSERT INTO `sys_log` VALUES (9041, NULL, '尝试登录', NULL, NULL, 0, '112.12.213.159', '2021-11-30 21:53:40');
INSERT INTO `sys_log` VALUES (9042, '1234', '登录平台', NULL, NULL, 0, '112.12.213.159', '2021-11-30 21:53:56');
INSERT INTO `sys_log` VALUES (9043, NULL, '尝试登录', NULL, NULL, 0, '112.12.213.159', '2021-11-30 22:01:40');
INSERT INTO `sys_log` VALUES (9044, NULL, '尝试登录', NULL, NULL, 0, '112.12.213.159', '2021-11-30 22:12:40');
INSERT INTO `sys_log` VALUES (9045, NULL, '尝试登录', NULL, NULL, 0, '112.12.213.159', '2021-11-30 22:17:56');
INSERT INTO `sys_log` VALUES (9046, NULL, '尝试登录', NULL, NULL, 0, '112.12.213.159', '2021-11-30 22:19:29');
INSERT INTO `sys_log` VALUES (9047, NULL, '尝试登录', NULL, NULL, 0, '112.12.213.159', '2021-11-30 22:20:08');
INSERT INTO `sys_log` VALUES (9048, '1234', '登录平台', NULL, NULL, 0, '112.12.213.159', '2021-11-30 22:20:53');
INSERT INTO `sys_log` VALUES (9049, '1234', '登录平台', NULL, NULL, 0, '112.12.213.159', '2021-11-30 22:22:18');
INSERT INTO `sys_log` VALUES (9050, '1234', '登录平台', NULL, NULL, 0, '112.12.213.159', '2021-11-30 22:24:40');
INSERT INTO `sys_log` VALUES (9051, 'admin', '登录平台', NULL, NULL, 0, '112.12.213.159', '2021-11-30 22:35:54');
INSERT INTO `sys_log` VALUES (9052, 'admin', '登录平台', NULL, NULL, 0, '112.12.213.159', '2021-11-30 22:46:46');
INSERT INTO `sys_log` VALUES (9053, 'admin', '登录平台', NULL, NULL, 0, '112.12.146.222', '2021-11-30 22:46:57');
INSERT INTO `sys_log` VALUES (9054, 'admin', '登录平台', NULL, NULL, 0, '112.12.146.222', '2021-11-30 22:47:00');
INSERT INTO `sys_log` VALUES (9055, 'admin', '登录平台', NULL, NULL, 0, '112.12.213.159', '2021-11-30 22:49:19');
INSERT INTO `sys_log` VALUES (9056, 'admin', '登录平台', NULL, NULL, 0, '112.12.146.222', '2021-11-30 22:55:42');
INSERT INTO `sys_log` VALUES (9057, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-11-30 23:02:11');
INSERT INTO `sys_log` VALUES (9058, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-11-30 23:02:11');
INSERT INTO `sys_log` VALUES (9059, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-01 08:35:51');
INSERT INTO `sys_log` VALUES (9060, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-01 09:06:20');
INSERT INTO `sys_log` VALUES (9061, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-01 09:09:13');
INSERT INTO `sys_log` VALUES (9062, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-01 09:16:23');
INSERT INTO `sys_log` VALUES (9063, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-01 09:16:52');
INSERT INTO `sys_log` VALUES (9064, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-01 09:17:17');
INSERT INTO `sys_log` VALUES (9065, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-01 09:52:13');
INSERT INTO `sys_log` VALUES (9066, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-01 09:52:15');
INSERT INTO `sys_log` VALUES (9067, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-01 09:55:06');
INSERT INTO `sys_log` VALUES (9068, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-01 10:45:18');
INSERT INTO `sys_log` VALUES (9069, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-01 10:49:10');
INSERT INTO `sys_log` VALUES (9070, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-01 10:51:56');
INSERT INTO `sys_log` VALUES (9071, '1234', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-01 10:54:14');
INSERT INTO `sys_log` VALUES (9072, '1234', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-01 10:54:26');
INSERT INTO `sys_log` VALUES (9073, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-01 10:54:40');
INSERT INTO `sys_log` VALUES (9074, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-01 10:55:59');
INSERT INTO `sys_log` VALUES (9075, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-01 10:58:17');
INSERT INTO `sys_log` VALUES (9076, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-01 11:25:03');
INSERT INTO `sys_log` VALUES (9077, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-01 11:29:00');
INSERT INTO `sys_log` VALUES (9078, NULL, '尝试登录', NULL, NULL, 0, '127.0.0.1', '2021-12-01 14:01:20');
INSERT INTO `sys_log` VALUES (9079, NULL, '尝试登录', NULL, NULL, 0, '127.0.0.1', '2021-12-01 14:01:29');
INSERT INTO `sys_log` VALUES (9080, NULL, '尝试登录', NULL, NULL, 0, '127.0.0.1', '2021-12-01 14:01:59');
INSERT INTO `sys_log` VALUES (9081, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-01 14:03:18');
INSERT INTO `sys_log` VALUES (9082, 'admin', '登录平台', NULL, NULL, 0, '221.12.76.42', '2021-12-01 14:06:26');
INSERT INTO `sys_log` VALUES (9083, 'admin', '登录平台', NULL, NULL, 0, '221.12.76.42', '2021-12-01 14:06:54');
INSERT INTO `sys_log` VALUES (9084, 'admin', '登录平台', NULL, NULL, 0, '221.12.76.42', '2021-12-01 14:10:21');
INSERT INTO `sys_log` VALUES (9085, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-01 15:16:22');
INSERT INTO `sys_log` VALUES (9086, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-01 15:19:58');
INSERT INTO `sys_log` VALUES (9087, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-01 16:13:56');
INSERT INTO `sys_log` VALUES (9088, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2021-12-02 13:48:53');
INSERT INTO `sys_log` VALUES (9089, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2021-12-02 13:51:57');
INSERT INTO `sys_log` VALUES (9090, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2021-12-02 13:52:05');
INSERT INTO `sys_log` VALUES (9091, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2021-12-02 13:52:16');
INSERT INTO `sys_log` VALUES (9092, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2021-12-02 13:52:42');
INSERT INTO `sys_log` VALUES (9093, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2021-12-02 13:54:02');
INSERT INTO `sys_log` VALUES (9094, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2021-12-02 13:54:18');
INSERT INTO `sys_log` VALUES (9095, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2021-12-02 13:56:04');
INSERT INTO `sys_log` VALUES (9096, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-02 14:03:25');
INSERT INTO `sys_log` VALUES (9097, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2021-12-02 14:15:25');
INSERT INTO `sys_log` VALUES (9098, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2021-12-02 14:19:12');
INSERT INTO `sys_log` VALUES (9099, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2021-12-02 14:22:27');
INSERT INTO `sys_log` VALUES (9100, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2021-12-02 14:26:22');
INSERT INTO `sys_log` VALUES (9101, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2021-12-02 14:27:44');
INSERT INTO `sys_log` VALUES (9102, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2021-12-02 14:27:47');
INSERT INTO `sys_log` VALUES (9103, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2021-12-02 14:27:48');
INSERT INTO `sys_log` VALUES (9104, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2021-12-02 14:28:46');
INSERT INTO `sys_log` VALUES (9105, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2021-12-02 14:28:59');
INSERT INTO `sys_log` VALUES (9106, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.105', '2021-12-02 14:39:28');
INSERT INTO `sys_log` VALUES (9107, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2021-12-02 14:48:52');
INSERT INTO `sys_log` VALUES (9108, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2021-12-02 14:49:14');
INSERT INTO `sys_log` VALUES (9109, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2021-12-02 14:55:32');
INSERT INTO `sys_log` VALUES (9110, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2021-12-02 14:55:41');
INSERT INTO `sys_log` VALUES (9111, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2021-12-02 14:55:42');
INSERT INTO `sys_log` VALUES (9112, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2021-12-02 14:55:43');
INSERT INTO `sys_log` VALUES (9113, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2021-12-02 14:55:49');
INSERT INTO `sys_log` VALUES (9114, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2021-12-02 14:55:56');
INSERT INTO `sys_log` VALUES (9115, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2021-12-02 14:56:00');
INSERT INTO `sys_log` VALUES (9116, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2021-12-02 14:57:12');
INSERT INTO `sys_log` VALUES (9117, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2021-12-02 14:57:14');
INSERT INTO `sys_log` VALUES (9118, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2021-12-02 14:58:09');
INSERT INTO `sys_log` VALUES (9119, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2021-12-02 14:59:39');
INSERT INTO `sys_log` VALUES (9120, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2021-12-02 15:00:51');
INSERT INTO `sys_log` VALUES (9121, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2021-12-02 15:02:58');
INSERT INTO `sys_log` VALUES (9122, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2021-12-02 15:04:05');
INSERT INTO `sys_log` VALUES (9123, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2021-12-02 15:04:52');
INSERT INTO `sys_log` VALUES (9124, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2021-12-02 15:05:43');
INSERT INTO `sys_log` VALUES (9125, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.105', '2021-12-02 15:05:49');
INSERT INTO `sys_log` VALUES (9126, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-02 20:57:29');
INSERT INTO `sys_log` VALUES (9127, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-02 20:57:29');
INSERT INTO `sys_log` VALUES (9128, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-02 20:57:47');
INSERT INTO `sys_log` VALUES (9129, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-02 20:57:53');
INSERT INTO `sys_log` VALUES (9130, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-02 20:57:53');
INSERT INTO `sys_log` VALUES (9131, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-02 20:57:54');
INSERT INTO `sys_log` VALUES (9132, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-02 20:57:54');
INSERT INTO `sys_log` VALUES (9133, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-02 20:57:55');
INSERT INTO `sys_log` VALUES (9134, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-02 20:57:55');
INSERT INTO `sys_log` VALUES (9135, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-02 20:57:55');
INSERT INTO `sys_log` VALUES (9136, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-02 20:57:56');
INSERT INTO `sys_log` VALUES (9137, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-02 20:57:56');
INSERT INTO `sys_log` VALUES (9138, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-02 20:57:57');
INSERT INTO `sys_log` VALUES (9139, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-02 20:57:58');
INSERT INTO `sys_log` VALUES (9140, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-02 20:57:58');
INSERT INTO `sys_log` VALUES (9141, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-02 20:57:58');
INSERT INTO `sys_log` VALUES (9142, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-02 20:57:58');
INSERT INTO `sys_log` VALUES (9143, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-02 21:00:11');
INSERT INTO `sys_log` VALUES (9144, NULL, '尝试登录', NULL, NULL, 0, '0:0:0:0:0:0:0:1', '2021-12-02 21:06:42');
INSERT INTO `sys_log` VALUES (9145, NULL, '尝试登录', NULL, NULL, 0, '0:0:0:0:0:0:0:1', '2021-12-02 21:08:39');
INSERT INTO `sys_log` VALUES (9146, NULL, '尝试登录', NULL, NULL, 0, '0:0:0:0:0:0:0:1', '2021-12-02 21:17:18');
INSERT INTO `sys_log` VALUES (9147, NULL, '尝试登录', NULL, NULL, 0, '0:0:0:0:0:0:0:1', '2021-12-02 21:19:04');
INSERT INTO `sys_log` VALUES (9148, NULL, '尝试登录', NULL, NULL, 0, '0:0:0:0:0:0:0:1', '2021-12-02 21:19:45');
INSERT INTO `sys_log` VALUES (9149, NULL, '尝试登录', NULL, NULL, 0, '0:0:0:0:0:0:0:1', '2021-12-02 21:20:20');
INSERT INTO `sys_log` VALUES (9150, NULL, '尝试登录', NULL, NULL, 0, '0:0:0:0:0:0:0:1', '2021-12-02 21:20:23');
INSERT INTO `sys_log` VALUES (9151, NULL, '尝试登录', NULL, NULL, 0, '0:0:0:0:0:0:0:1', '2021-12-02 21:21:22');
INSERT INTO `sys_log` VALUES (9152, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-02 21:22:11');
INSERT INTO `sys_log` VALUES (9153, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-02 21:22:12');
INSERT INTO `sys_log` VALUES (9154, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-02 21:23:41');
INSERT INTO `sys_log` VALUES (9155, NULL, '尝试登录', NULL, NULL, 0, '0:0:0:0:0:0:0:1', '2021-12-02 21:25:23');
INSERT INTO `sys_log` VALUES (9156, NULL, '尝试登录', NULL, NULL, 0, '0:0:0:0:0:0:0:1', '2021-12-02 21:25:38');
INSERT INTO `sys_log` VALUES (9157, NULL, '尝试登录', NULL, NULL, 0, '0:0:0:0:0:0:0:1', '2021-12-02 21:26:52');
INSERT INTO `sys_log` VALUES (9158, NULL, '尝试登录', NULL, NULL, 0, '0:0:0:0:0:0:0:1', '2021-12-02 21:27:06');
INSERT INTO `sys_log` VALUES (9159, NULL, '尝试登录', NULL, NULL, 0, '127.0.0.1', '2021-12-02 21:27:06');
INSERT INTO `sys_log` VALUES (9160, NULL, '尝试登录', NULL, NULL, 0, '0:0:0:0:0:0:0:1', '2021-12-02 21:29:59');
INSERT INTO `sys_log` VALUES (9161, NULL, '尝试登录', NULL, NULL, 0, '0:0:0:0:0:0:0:1', '2021-12-02 21:36:08');
INSERT INTO `sys_log` VALUES (9162, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-02 21:37:10');
INSERT INTO `sys_log` VALUES (9163, NULL, '尝试登录', NULL, NULL, 0, '0:0:0:0:0:0:0:1', '2021-12-02 21:39:41');
INSERT INTO `sys_log` VALUES (9164, NULL, '尝试登录', NULL, NULL, 0, '0:0:0:0:0:0:0:1', '2021-12-02 21:41:24');
INSERT INTO `sys_log` VALUES (9165, NULL, '尝试登录', NULL, NULL, 0, '0:0:0:0:0:0:0:1', '2021-12-02 21:43:13');
INSERT INTO `sys_log` VALUES (9166, NULL, '尝试登录', NULL, NULL, 0, '0:0:0:0:0:0:0:1', '2021-12-02 21:52:03');
INSERT INTO `sys_log` VALUES (9167, NULL, '尝试登录', NULL, NULL, 0, '0:0:0:0:0:0:0:1', '2021-12-02 21:53:25');
INSERT INTO `sys_log` VALUES (9168, NULL, '尝试登录', NULL, NULL, 0, '127.0.0.1', '2021-12-02 21:58:58');
INSERT INTO `sys_log` VALUES (9169, NULL, '尝试登录', NULL, NULL, 0, '127.0.0.1', '2021-12-02 22:09:36');
INSERT INTO `sys_log` VALUES (9170, NULL, '尝试登录', NULL, NULL, 0, '0:0:0:0:0:0:0:1', '2021-12-02 22:09:36');
INSERT INTO `sys_log` VALUES (9171, NULL, '尝试登录', NULL, NULL, 0, '127.0.0.1', '2021-12-02 22:11:12');
INSERT INTO `sys_log` VALUES (9172, NULL, '尝试登录', NULL, NULL, 0, '127.0.0.1', '2021-12-02 22:16:48');
INSERT INTO `sys_log` VALUES (9173, NULL, '尝试登录', NULL, NULL, 0, '127.0.0.1', '2021-12-02 22:20:30');
INSERT INTO `sys_log` VALUES (9174, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-02 22:21:39');
INSERT INTO `sys_log` VALUES (9175, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-02 22:25:03');
INSERT INTO `sys_log` VALUES (9176, NULL, '尝试登录', NULL, NULL, 0, '127.0.0.1', '2021-12-03 14:16:29');
INSERT INTO `sys_log` VALUES (9177, NULL, '尝试登录', NULL, NULL, 0, '127.0.0.1', '2021-12-03 14:17:25');
INSERT INTO `sys_log` VALUES (9178, NULL, '尝试登录', NULL, NULL, 0, '127.0.0.1', '2021-12-03 14:17:32');
INSERT INTO `sys_log` VALUES (9179, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-03 14:17:39');
INSERT INTO `sys_log` VALUES (9180, NULL, '尝试登录', NULL, NULL, 0, '127.0.0.1', '2021-12-03 14:17:42');
INSERT INTO `sys_log` VALUES (9181, NULL, '尝试登录', NULL, NULL, 0, '127.0.0.1', '2021-12-03 14:18:37');
INSERT INTO `sys_log` VALUES (9182, NULL, '尝试登录', NULL, NULL, 0, '127.0.0.1', '2021-12-03 14:19:17');
INSERT INTO `sys_log` VALUES (9183, NULL, '尝试登录', NULL, NULL, 0, '127.0.0.1', '2021-12-03 14:20:30');
INSERT INTO `sys_log` VALUES (9184, NULL, '尝试登录', NULL, NULL, 0, '127.0.0.1', '2021-12-03 14:21:07');
INSERT INTO `sys_log` VALUES (9185, NULL, '尝试登录', NULL, NULL, 0, '127.0.0.1', '2021-12-03 14:21:49');
INSERT INTO `sys_log` VALUES (9186, NULL, '尝试登录', NULL, NULL, 0, '127.0.0.1', '2021-12-03 14:22:42');
INSERT INTO `sys_log` VALUES (9187, NULL, '尝试登录', NULL, NULL, 0, '127.0.0.1', '2021-12-03 14:23:19');
INSERT INTO `sys_log` VALUES (9188, NULL, '尝试登录', NULL, NULL, 0, '127.0.0.1', '2021-12-03 14:24:20');
INSERT INTO `sys_log` VALUES (9189, NULL, '尝试登录', NULL, NULL, 0, '127.0.0.1', '2021-12-03 14:24:31');
INSERT INTO `sys_log` VALUES (9190, NULL, '尝试登录', NULL, NULL, 0, '127.0.0.1', '2021-12-03 14:24:52');
INSERT INTO `sys_log` VALUES (9191, NULL, '尝试登录', NULL, NULL, 0, '127.0.0.1', '2021-12-03 14:25:54');
INSERT INTO `sys_log` VALUES (9192, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-03 14:46:33');
INSERT INTO `sys_log` VALUES (9193, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-03 14:47:23');
INSERT INTO `sys_log` VALUES (9194, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-03 15:08:43');
INSERT INTO `sys_log` VALUES (9195, '1234', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-03 15:09:08');
INSERT INTO `sys_log` VALUES (9196, '1234', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-03 15:13:59');
INSERT INTO `sys_log` VALUES (9197, '1234', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-03 15:14:58');
INSERT INTO `sys_log` VALUES (9198, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-03 15:43:10');
INSERT INTO `sys_log` VALUES (9199, 'admin', '退出平台', NULL, NULL, 1638518776681, NULL, NULL);
INSERT INTO `sys_log` VALUES (9200, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-03 16:06:25');
INSERT INTO `sys_log` VALUES (9201, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-04 09:02:22');
INSERT INTO `sys_log` VALUES (9202, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-04 09:04:02');
INSERT INTO `sys_log` VALUES (9203, 'admin', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9204, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-04 10:49:26');
INSERT INTO `sys_log` VALUES (9205, 'admin', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9206, 'admin', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9207, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-04 10:50:48');
INSERT INTO `sys_log` VALUES (9208, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-04 11:09:18');
INSERT INTO `sys_log` VALUES (9209, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-04 11:13:48');
INSERT INTO `sys_log` VALUES (9210, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-04 13:30:44');
INSERT INTO `sys_log` VALUES (9211, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-04 13:32:08');
INSERT INTO `sys_log` VALUES (9212, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-04 13:36:46');
INSERT INTO `sys_log` VALUES (9213, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-04 13:37:21');
INSERT INTO `sys_log` VALUES (9214, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-04 13:38:15');
INSERT INTO `sys_log` VALUES (9215, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-04 13:39:22');
INSERT INTO `sys_log` VALUES (9216, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-04 13:40:09');
INSERT INTO `sys_log` VALUES (9217, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-04 13:41:14');
INSERT INTO `sys_log` VALUES (9218, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-04 13:41:27');
INSERT INTO `sys_log` VALUES (9219, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-04 13:48:05');
INSERT INTO `sys_log` VALUES (9220, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-04 13:52:16');
INSERT INTO `sys_log` VALUES (9221, NULL, '尝试登录', NULL, NULL, 0, '127.0.0.1', '2021-12-04 14:06:38');
INSERT INTO `sys_log` VALUES (9222, '1234', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-04 14:06:42');
INSERT INTO `sys_log` VALUES (9223, '1234', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-04 14:25:06');
INSERT INTO `sys_log` VALUES (9224, '1234', '登录平台', NULL, NULL, 0, '221.12.76.42', '2021-12-04 14:29:12');
INSERT INTO `sys_log` VALUES (9225, '1234', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-04 14:40:02');
INSERT INTO `sys_log` VALUES (9226, '1234', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-04 14:41:33');
INSERT INTO `sys_log` VALUES (9227, '1234', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-04 14:45:10');
INSERT INTO `sys_log` VALUES (9228, '1234', '登录平台', NULL, NULL, 0, '221.12.76.42', '2021-12-04 14:48:07');
INSERT INTO `sys_log` VALUES (9229, '1234', '登录平台', NULL, NULL, 0, '221.12.76.42', '2021-12-04 14:48:41');
INSERT INTO `sys_log` VALUES (9230, '1234', '登录平台', NULL, NULL, 0, '221.12.76.42', '2021-12-04 14:51:30');
INSERT INTO `sys_log` VALUES (9231, '1234', '登录平台', NULL, NULL, 0, '221.12.76.42', '2021-12-04 14:52:49');
INSERT INTO `sys_log` VALUES (9232, '1234', '登录平台', NULL, NULL, 0, '221.12.76.42', '2021-12-04 14:52:52');
INSERT INTO `sys_log` VALUES (9233, '1234', '登录平台', NULL, NULL, 0, '221.12.76.42', '2021-12-04 14:52:55');
INSERT INTO `sys_log` VALUES (9234, '1234', '登录平台', NULL, NULL, 0, '221.12.76.42', '2021-12-04 15:00:49');
INSERT INTO `sys_log` VALUES (9235, '1234', '登录平台', NULL, NULL, 0, '221.12.76.42', '2021-12-04 15:04:16');
INSERT INTO `sys_log` VALUES (9236, '1234', '登录平台', NULL, NULL, 0, '221.12.76.42', '2021-12-04 15:05:52');
INSERT INTO `sys_log` VALUES (9237, '1234', '登录平台', NULL, NULL, 0, '221.12.76.42', '2021-12-04 15:07:13');
INSERT INTO `sys_log` VALUES (9238, '1234', '登录平台', NULL, NULL, 0, '221.12.76.42', '2021-12-04 15:07:21');
INSERT INTO `sys_log` VALUES (9239, '1234', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-04 15:07:27');
INSERT INTO `sys_log` VALUES (9240, '1234', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-04 15:07:49');
INSERT INTO `sys_log` VALUES (9241, '1234', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-04 15:09:29');
INSERT INTO `sys_log` VALUES (9242, '1234', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-04 15:10:52');
INSERT INTO `sys_log` VALUES (9243, '1234', '登录平台', NULL, NULL, 0, '221.12.76.42', '2021-12-04 15:11:27');
INSERT INTO `sys_log` VALUES (9244, '1234', '登录平台', NULL, NULL, 0, '221.12.76.42', '2021-12-04 15:16:05');
INSERT INTO `sys_log` VALUES (9245, '1234', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-04 15:16:14');
INSERT INTO `sys_log` VALUES (9246, '1234', '登录平台', NULL, NULL, 0, '221.12.76.42', '2021-12-04 15:16:33');
INSERT INTO `sys_log` VALUES (9247, '1234', '登录平台', NULL, NULL, 0, '221.12.76.42', '2021-12-04 15:16:38');
INSERT INTO `sys_log` VALUES (9248, '1234', '登录平台', NULL, NULL, 0, '221.12.76.42', '2021-12-04 15:16:49');
INSERT INTO `sys_log` VALUES (9249, '1234', '登录平台', NULL, NULL, 0, '221.12.76.42', '2021-12-04 15:18:23');
INSERT INTO `sys_log` VALUES (9250, '1234', '登录平台', NULL, NULL, 0, '221.12.76.42', '2021-12-04 15:18:34');
INSERT INTO `sys_log` VALUES (9251, '1234', '登录平台', NULL, NULL, 0, '221.12.76.42', '2021-12-04 15:18:37');
INSERT INTO `sys_log` VALUES (9252, '1234', '登录平台', NULL, NULL, 0, '221.12.76.42', '2021-12-04 15:18:42');
INSERT INTO `sys_log` VALUES (9253, '1234', '登录平台', NULL, NULL, 0, '221.12.76.42', '2021-12-04 15:18:47');
INSERT INTO `sys_log` VALUES (9254, '1234', '登录平台', NULL, NULL, 0, '221.12.76.42', '2021-12-04 15:21:19');
INSERT INTO `sys_log` VALUES (9255, '1234', '登录平台', NULL, NULL, 0, '221.12.76.42', '2021-12-04 15:21:24');
INSERT INTO `sys_log` VALUES (9256, '1234', '登录平台', NULL, NULL, 0, '221.12.76.42', '2021-12-04 15:21:26');
INSERT INTO `sys_log` VALUES (9257, '1234', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-04 15:21:36');
INSERT INTO `sys_log` VALUES (9258, '1234', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-04 15:22:32');
INSERT INTO `sys_log` VALUES (9259, '1234', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-04 15:23:03');
INSERT INTO `sys_log` VALUES (9260, '1234', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-04 15:23:09');
INSERT INTO `sys_log` VALUES (9261, '1234', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-04 15:23:28');
INSERT INTO `sys_log` VALUES (9262, '1234', '登录平台', NULL, NULL, 0, '221.12.76.42', '2021-12-04 15:23:58');
INSERT INTO `sys_log` VALUES (9263, '1234', '登录平台', NULL, NULL, 0, '221.12.76.42', '2021-12-04 15:24:05');
INSERT INTO `sys_log` VALUES (9264, '1234', '登录平台', NULL, NULL, 0, '221.12.76.42', '2021-12-04 15:25:12');
INSERT INTO `sys_log` VALUES (9265, '1234', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-04 15:25:06');
INSERT INTO `sys_log` VALUES (9266, '1234', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-04 15:26:31');
INSERT INTO `sys_log` VALUES (9267, '1234', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-04 15:30:01');
INSERT INTO `sys_log` VALUES (9268, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-04 15:30:51');
INSERT INTO `sys_log` VALUES (9269, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-04 15:31:00');
INSERT INTO `sys_log` VALUES (9270, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-04 15:31:18');
INSERT INTO `sys_log` VALUES (9271, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-04 15:32:00');
INSERT INTO `sys_log` VALUES (9272, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-09 08:47:23');
INSERT INTO `sys_log` VALUES (9273, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-09 08:50:32');
INSERT INTO `sys_log` VALUES (9274, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-09 09:02:10');
INSERT INTO `sys_log` VALUES (9275, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-09 09:03:37');
INSERT INTO `sys_log` VALUES (9276, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-09 09:04:43');
INSERT INTO `sys_log` VALUES (9277, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-09 09:06:39');
INSERT INTO `sys_log` VALUES (9278, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-09 09:09:00');
INSERT INTO `sys_log` VALUES (9279, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-09 09:11:29');
INSERT INTO `sys_log` VALUES (9280, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-09 09:13:54');
INSERT INTO `sys_log` VALUES (9281, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-09 09:16:13');
INSERT INTO `sys_log` VALUES (9282, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-09 09:16:34');
INSERT INTO `sys_log` VALUES (9283, 'admin', '登录平台', NULL, NULL, 0, '127.0.0.1', '2021-12-09 09:17:10');
INSERT INTO `sys_log` VALUES (9284, NULL, '尝试登录', NULL, NULL, 0, '1.116.59.211', '2021-12-17 20:13:38');
INSERT INTO `sys_log` VALUES (9285, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-21 10:05:01');
INSERT INTO `sys_log` VALUES (9286, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-21 10:05:05');
INSERT INTO `sys_log` VALUES (9287, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-21 10:05:11');
INSERT INTO `sys_log` VALUES (9288, 'admin', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9289, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-21 11:43:24');
INSERT INTO `sys_log` VALUES (9290, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-21 14:49:08');
INSERT INTO `sys_log` VALUES (9291, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2022-01-21 14:50:18');
INSERT INTO `sys_log` VALUES (9292, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-01-21 14:50:53');
INSERT INTO `sys_log` VALUES (9293, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-01-21 14:51:00');
INSERT INTO `sys_log` VALUES (9294, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2022-01-21 14:51:01');
INSERT INTO `sys_log` VALUES (9295, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-01-21 14:51:03');
INSERT INTO `sys_log` VALUES (9296, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-21 14:51:17');
INSERT INTO `sys_log` VALUES (9297, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-21 14:51:39');
INSERT INTO `sys_log` VALUES (9298, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-21 14:52:11');
INSERT INTO `sys_log` VALUES (9299, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-21 14:53:07');
INSERT INTO `sys_log` VALUES (9300, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-01-21 14:57:57');
INSERT INTO `sys_log` VALUES (9301, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-01-21 14:58:09');
INSERT INTO `sys_log` VALUES (9302, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2022-01-21 14:58:30');
INSERT INTO `sys_log` VALUES (9303, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2022-01-21 14:58:35');
INSERT INTO `sys_log` VALUES (9304, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-01-21 14:58:36');
INSERT INTO `sys_log` VALUES (9305, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-01-21 14:58:41');
INSERT INTO `sys_log` VALUES (9306, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-21 14:59:12');
INSERT INTO `sys_log` VALUES (9307, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-21 15:00:04');
INSERT INTO `sys_log` VALUES (9308, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-01-21 15:00:35');
INSERT INTO `sys_log` VALUES (9309, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-01-21 15:01:18');
INSERT INTO `sys_log` VALUES (9310, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-01-21 15:02:16');
INSERT INTO `sys_log` VALUES (9311, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-01-21 15:02:56');
INSERT INTO `sys_log` VALUES (9312, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-01-21 16:20:56');
INSERT INTO `sys_log` VALUES (9313, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-21 16:21:03');
INSERT INTO `sys_log` VALUES (9314, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-01-21 16:54:26');
INSERT INTO `sys_log` VALUES (9315, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-01-21 16:54:52');
INSERT INTO `sys_log` VALUES (9316, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-21 16:56:50');
INSERT INTO `sys_log` VALUES (9317, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-21 17:27:29');
INSERT INTO `sys_log` VALUES (9318, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-21 17:27:43');
INSERT INTO `sys_log` VALUES (9319, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-01-21 17:27:56');
INSERT INTO `sys_log` VALUES (9320, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 08:46:44');
INSERT INTO `sys_log` VALUES (9321, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 08:50:38');
INSERT INTO `sys_log` VALUES (9322, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-22 08:54:55');
INSERT INTO `sys_log` VALUES (9323, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 08:56:40');
INSERT INTO `sys_log` VALUES (9324, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-22 08:58:28');
INSERT INTO `sys_log` VALUES (9325, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-22 08:59:35');
INSERT INTO `sys_log` VALUES (9326, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-22 09:01:39');
INSERT INTO `sys_log` VALUES (9327, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-22 09:02:36');
INSERT INTO `sys_log` VALUES (9328, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-22 09:03:18');
INSERT INTO `sys_log` VALUES (9329, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 09:04:11');
INSERT INTO `sys_log` VALUES (9330, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-22 09:06:02');
INSERT INTO `sys_log` VALUES (9331, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 09:07:18');
INSERT INTO `sys_log` VALUES (9332, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-22 09:08:11');
INSERT INTO `sys_log` VALUES (9333, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-22 09:10:55');
INSERT INTO `sys_log` VALUES (9334, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-22 09:13:42');
INSERT INTO `sys_log` VALUES (9335, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-22 09:14:41');
INSERT INTO `sys_log` VALUES (9336, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-22 09:16:06');
INSERT INTO `sys_log` VALUES (9337, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 09:16:49');
INSERT INTO `sys_log` VALUES (9338, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 09:17:38');
INSERT INTO `sys_log` VALUES (9339, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-22 09:19:42');
INSERT INTO `sys_log` VALUES (9340, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 09:19:56');
INSERT INTO `sys_log` VALUES (9341, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 09:43:47');
INSERT INTO `sys_log` VALUES (9342, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 10:22:25');
INSERT INTO `sys_log` VALUES (9343, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 10:45:04');
INSERT INTO `sys_log` VALUES (9344, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-22 10:49:24');
INSERT INTO `sys_log` VALUES (9345, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 11:14:59');
INSERT INTO `sys_log` VALUES (9346, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 11:18:02');
INSERT INTO `sys_log` VALUES (9347, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 11:19:43');
INSERT INTO `sys_log` VALUES (9348, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 11:22:17');
INSERT INTO `sys_log` VALUES (9349, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 11:25:48');
INSERT INTO `sys_log` VALUES (9350, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 11:27:28');
INSERT INTO `sys_log` VALUES (9351, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-22 11:32:47');
INSERT INTO `sys_log` VALUES (9352, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 11:34:14');
INSERT INTO `sys_log` VALUES (9353, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-22 11:37:33');
INSERT INTO `sys_log` VALUES (9354, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 11:39:15');
INSERT INTO `sys_log` VALUES (9355, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 11:40:08');
INSERT INTO `sys_log` VALUES (9356, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 11:42:39');
INSERT INTO `sys_log` VALUES (9357, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 11:43:32');
INSERT INTO `sys_log` VALUES (9358, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 11:44:05');
INSERT INTO `sys_log` VALUES (9359, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 11:44:35');
INSERT INTO `sys_log` VALUES (9360, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-22 11:48:54');
INSERT INTO `sys_log` VALUES (9361, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-22 11:49:23');
INSERT INTO `sys_log` VALUES (9362, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 11:51:43');
INSERT INTO `sys_log` VALUES (9363, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 11:53:20');
INSERT INTO `sys_log` VALUES (9364, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 11:58:11');
INSERT INTO `sys_log` VALUES (9365, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 11:59:09');
INSERT INTO `sys_log` VALUES (9366, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 13:03:21');
INSERT INTO `sys_log` VALUES (9367, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 13:04:16');
INSERT INTO `sys_log` VALUES (9368, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 13:05:28');
INSERT INTO `sys_log` VALUES (9369, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 13:06:00');
INSERT INTO `sys_log` VALUES (9370, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 13:10:52');
INSERT INTO `sys_log` VALUES (9371, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 13:11:18');
INSERT INTO `sys_log` VALUES (9372, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 13:13:20');
INSERT INTO `sys_log` VALUES (9373, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 13:14:26');
INSERT INTO `sys_log` VALUES (9374, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 13:16:19');
INSERT INTO `sys_log` VALUES (9375, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 13:16:32');
INSERT INTO `sys_log` VALUES (9376, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 13:19:06');
INSERT INTO `sys_log` VALUES (9377, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 13:21:53');
INSERT INTO `sys_log` VALUES (9378, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 13:23:11');
INSERT INTO `sys_log` VALUES (9379, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 13:23:58');
INSERT INTO `sys_log` VALUES (9380, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 13:28:15');
INSERT INTO `sys_log` VALUES (9381, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 13:34:26');
INSERT INTO `sys_log` VALUES (9382, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 13:41:11');
INSERT INTO `sys_log` VALUES (9383, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 13:44:40');
INSERT INTO `sys_log` VALUES (9384, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 13:55:25');
INSERT INTO `sys_log` VALUES (9385, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 13:58:03');
INSERT INTO `sys_log` VALUES (9386, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 13:59:50');
INSERT INTO `sys_log` VALUES (9387, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 14:00:39');
INSERT INTO `sys_log` VALUES (9388, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 14:04:23');
INSERT INTO `sys_log` VALUES (9389, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 14:08:06');
INSERT INTO `sys_log` VALUES (9390, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 14:08:31');
INSERT INTO `sys_log` VALUES (9391, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 14:09:10');
INSERT INTO `sys_log` VALUES (9392, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 14:10:19');
INSERT INTO `sys_log` VALUES (9393, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 14:11:41');
INSERT INTO `sys_log` VALUES (9394, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-22 14:13:17');
INSERT INTO `sys_log` VALUES (9395, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-22 14:17:10');
INSERT INTO `sys_log` VALUES (9396, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-22 14:43:45');
INSERT INTO `sys_log` VALUES (9397, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-22 14:46:18');
INSERT INTO `sys_log` VALUES (9398, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-22 14:46:22');
INSERT INTO `sys_log` VALUES (9399, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-01-22 14:47:59');
INSERT INTO `sys_log` VALUES (9400, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-01-22 14:49:30');
INSERT INTO `sys_log` VALUES (9401, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-01-22 14:50:38');
INSERT INTO `sys_log` VALUES (9402, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-01-22 14:52:55');
INSERT INTO `sys_log` VALUES (9403, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-01-22 14:54:19');
INSERT INTO `sys_log` VALUES (9404, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-01-22 15:00:41');
INSERT INTO `sys_log` VALUES (9405, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-01-22 15:17:30');
INSERT INTO `sys_log` VALUES (9406, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-01-22 15:18:28');
INSERT INTO `sys_log` VALUES (9407, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-22 15:18:47');
INSERT INTO `sys_log` VALUES (9408, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-22 15:32:54');
INSERT INTO `sys_log` VALUES (9409, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-22 15:33:04');
INSERT INTO `sys_log` VALUES (9410, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-22 15:33:50');
INSERT INTO `sys_log` VALUES (9411, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-22 15:36:40');
INSERT INTO `sys_log` VALUES (9412, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-22 17:25:45');
INSERT INTO `sys_log` VALUES (9413, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-22 17:25:49');
INSERT INTO `sys_log` VALUES (9414, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-22 17:26:23');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` int(20) NOT NULL AUTO_INCREMENT,
  `parent_id` int(20) NULL DEFAULT 0 COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '首页', '/index', NULL, 0, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (2, 0, '基础管理', NULL, NULL, 0, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (3, 2, '用户管理', '/user', NULL, 1, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (4, 3, '用户集合', NULL, 'sys:user:list', 2, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (5, 3, '用户新增', NULL, 'sys:user:insert', 2, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (6, 3, '用户删除', NULL, 'sys:user:delete', 2, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (7, 3, '用户编辑', NULL, 'sys:user:update', 2, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (8, 3, '用户详情', NULL, 'sys:user:info', 2, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (9, 2, '部门管理', '/unit', '', 1, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (10, 9, '部门集合', NULL, 'sys:unit:list', 2, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (11, 3, '更新密码', NULL, 'sys:user:password', 2, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (12, 3, '更新个人密码', NULL, 'sys:my:password', 2, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (13, 3, '重置密码', NULL, 'sys:user:reset', 2, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (14, 0, '课程类型', '/course', NULL, 1, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (15, 14, '课程集合', NULL, 'user:course:list', 2, '', 1, 1);
INSERT INTO `sys_menu` VALUES (16, 14, '课程详情', NULL, 'user:course:info', 2, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (17, 2, '课程表', '/classCourse', NULL, 1, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (18, 17, '当前个人课程表', NULL, 'course:classSchedule:user:course', 2, NULL, 1, 1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `REVISION` int(11) NULL DEFAULT NULL COMMENT '乐观锁',
  `created_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE INDEX `role_name`(`role_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'admin', '管理员', 12, 'admin', '2021-08-10 11:54:26', 'admin', '2021-09-23 14:27:10');
INSERT INTO `sys_role` VALUES (22, 'Student', '学生', 1, 'admin', '2021-11-25 13:52:26', 'admin', '2021-11-25 13:52:30');
INSERT INTO `sys_role` VALUES (23, 'Teacher', '老师', 1, 'admin', '2021-11-25 13:59:27', 'admin', '2021-11-25 13:59:31');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` int(20) NULL DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  INDEX `menu_id`(`menu_id`) USING BTREE,
  CONSTRAINT `sys_role_menu_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `sys_role_menu_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`menu_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色与菜单对应关系' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1, 1);

-- ----------------------------
-- Table structure for sys_unit
-- ----------------------------
DROP TABLE IF EXISTS `sys_unit`;
CREATE TABLE `sys_unit`  (
  `unit_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名字',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父亲id',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门代码',
  PRIMARY KEY (`unit_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_unit
-- ----------------------------
INSERT INTO `sys_unit` VALUES (1, '信息技术', 0, '111');
INSERT INTO `sys_unit` VALUES (2, '软件19-1', 1, '123');
INSERT INTO `sys_unit` VALUES (3, '软件19-2', 1, '1235');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(22) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号或学号',
  `age` int(10) NULL DEFAULT NULL COMMENT '年龄',
  `password` varchar(70) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `type` int(10) NULL DEFAULT NULL COMMENT '账号类型 1 学生 2 老师 3主任 3其它人员',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭地址',
  `avatar` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `state` int(1) NULL DEFAULT 0 COMMENT '用户状态 1 开 0 关',
  `revision` int(10) NULL DEFAULT NULL COMMENT '乐观锁',
  `lock_time` datetime NULL DEFAULT NULL COMMENT '锁定时间',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `created_by` int(10) NULL DEFAULT NULL COMMENT '创建人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `updated_by` int(10) NULL DEFAULT NULL COMMENT '更新人',
  `enable` int(1) NULL DEFAULT 0 COMMENT '账号是否可用',
  `unit_id` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '部门id',
  `last_login_time` datetime NULL DEFAULT NULL COMMENT '登录时间',
  `sex` int(1) NULL DEFAULT NULL COMMENT '性别 0 女 1 男 2保密',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `number`(`number`) USING BTREE,
  INDEX `unit_id`(`unit_id`) USING BTREE,
  CONSTRAINT `sys_user_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `sys_unit` (`unit_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 129 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, '管理员', 'admin', 0, '$2a$10$SDvONxqv83ufTAMlS0pXqePTpnFxvEHjN5Qirh90NTOwzKUhvB7EK', NULL, 0, 'String', 'String', 'String', 1, 61, '2021-11-18 10:48:13', '2021-11-26 10:48:52', 1, '2021-12-01 11:29:00', 1, 1, 1, '2021-12-01 11:29:00', 1);
INSERT INTO `sys_user` VALUES (30, 'String', '1234', 0, '$2a$10$YYkRs9LdKGMqEV6eNAqTY.7nGIKv7fGEPLH5OAUDLIXyOhtTtZeNy', 'String', 1, 'String', 'String', 'String', 1, 20, '2021-11-29 17:24:31', '2021-11-30 11:05:40', 1, '2021-12-04 15:30:01', 1, 1, 2, '2021-12-04 15:30:01', 0);
INSERT INTO `sys_user` VALUES (110, '11111', '1111111', 0, '$2a$10$unzrz/B4X3OP7c8HlPfjOeDFfeaV6rkE17zKachPm6mGqdVeT5rgO', 'String', 1, 'String', NULL, NULL, 1, 1, '2021-12-04 09:46:21', '2021-12-04 09:04:10', 1, '2021-12-04 09:04:10', 1, 1, 2, NULL, 1);
INSERT INTO `sys_user` VALUES (117, '王老师', '1111111111111', 0, '$2a$10$SNQRhP2H91rflnZKBFBkTuZtW3MsaN1vRVGpYgVnvclvY9FbrZtma', 'String', 2, 'String', NULL, NULL, 0, 1, '2021-12-04 10:04:25', '2021-12-04 10:04:09', 1, '2021-12-04 10:04:09', 1, 0, 2, NULL, 0);
INSERT INTO `sys_user` VALUES (118, '2号老师', '12', 0, '$2a$10$SNQRhP2H91rflnZKBFBkTuZtW3MsaN1vRVGpYgVnvclvY9FbrZtma', 'String', 2, 'String', NULL, NULL, 0, 1, '2021-12-04 10:04:25', '2021-12-04 10:04:09', 1, '2021-12-04 10:04:09', 1, 0, 2, NULL, 0);
INSERT INTO `sys_user` VALUES (119, 'lyt', 'lyt', 0, '$2a$10$h5PPUcJnkxTor58IKbb/u.cOeiTCORlnfxXHs.LXuNsMecvGjmLQW', 'String', NULL, 'String', 'String', 'String', 1, 1, '2021-11-18 10:48:13', '2021-11-26 10:48:52', 1, '2022-01-22 14:17:10', 1, 1, 1, '2022-01-22 14:17:10', 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  INDEX `sys_user_role_ibfk_2`(`user_id`) USING BTREE,
  CONSTRAINT `sys_user_role_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sys_user_role_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与角色对应关系' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1, 1);

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '租户容量信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tenant_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_info_kptenantid`(`kp`, `tenant_id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'tenant_info' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tenant_info
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);

SET FOREIGN_KEY_CHECKS = 1;
