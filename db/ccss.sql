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

 Date: 12/02/2022 16:58:43
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
  INDEX `class_schedule_ibfk_2`(`user_id`) USING BTREE,
  CONSTRAINT `class_schedule_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `class_schedule_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class_schedule
-- ----------------------------
INSERT INTO `class_schedule` VALUES (6, 1, 2, 1, 132, 2, 134, '2022-02-12 09:16:34');
INSERT INTO `class_schedule` VALUES (7, 4, 1, 2, 132, 2, 134, '2022-01-21 10:56:50');
INSERT INTO `class_schedule` VALUES (8, 4, 4, 4, 132, 2, 134, '2022-01-21 10:56:53');
INSERT INTO `class_schedule` VALUES (9, 4, 1, 1, 132, 2, 134, '2022-01-21 10:56:55');
INSERT INTO `class_schedule` VALUES (10, 1, 1, 1, 132, 2, 134, '2022-02-12 09:16:34');
INSERT INTO `class_schedule` VALUES (11, 4, 3, 4, 132, 2, 134, '2022-01-21 10:56:53');
INSERT INTO `class_schedule` VALUES (12, 4, 2, 6, 132, 2, 134, '2022-01-21 10:56:55');
INSERT INTO `class_schedule` VALUES (13, 5, 1, 6, 132, 2, 134, '2022-02-12 09:16:34');
INSERT INTO `class_schedule` VALUES (14, 5, 2, 6, 132, 2, 134, '2022-01-21 10:56:50');
INSERT INTO `class_schedule` VALUES (15, 1, 3, 6, 132, 2, 134, '2022-01-21 10:56:53');
INSERT INTO `class_schedule` VALUES (16, 1, 4, 6, 132, 2, 134, '2022-01-21 10:56:55');
INSERT INTO `class_schedule` VALUES (17, 4, 5, 6, 132, 2, 134, '2022-02-12 09:16:34');
INSERT INTO `class_schedule` VALUES (18, 1, 6, 6, 132, 2, 134, '2022-01-21 10:56:53');
INSERT INTO `class_schedule` VALUES (19, 5, 7, 6, 132, 2, 134, '2022-01-21 10:56:55');
INSERT INTO `class_schedule` VALUES (20, 5, 8, 6, 132, 2, 134, '2022-01-21 10:56:55');
INSERT INTO `class_schedule` VALUES (36, 5, 8, 6, 1, 2, 134, '2022-01-21 10:56:55');

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, '毛概', 1, 1);
INSERT INTO `course` VALUES (4, '环世界', 4, 2);
INSERT INTO `course` VALUES (5, '体育与健康', 3, 2);

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
-- Table structure for order_course
-- ----------------------------
DROP TABLE IF EXISTS `order_course`;
CREATE TABLE `order_course`  (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` bigint(22) NULL DEFAULT NULL COMMENT '用户id',
  `course_id` int(11) NULL DEFAULT NULL COMMENT '课程id',
  `second_course_id` int(11) NULL DEFAULT NULL COMMENT '抢课id',
  PRIMARY KEY (`order_id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `second_course_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_course
-- ----------------------------
INSERT INTO `order_course` VALUES (39, 1, NULL, 1);
INSERT INTO `order_course` VALUES (40, 1, NULL, 2);

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
-- Table structure for second_course
-- ----------------------------
DROP TABLE IF EXISTS `second_course`;
CREATE TABLE `second_course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '抢课自增id',
  `course_id` int(11) NULL DEFAULT NULL COMMENT '课程id',
  `teacher` bigint(22) NULL DEFAULT NULL COMMENT '授课老师',
  `course_sum` int(11) NULL DEFAULT NULL COMMENT '课程剩余数量',
  `up_time` int(11) NULL DEFAULT NULL COMMENT '上课时间',
  `week` int(11) NULL DEFAULT NULL COMMENT '星期几',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始得时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `state` int(1) NULL DEFAULT NULL COMMENT '发布状态  0 未发布 1 发布',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of second_course
-- ----------------------------
INSERT INTO `second_course` VALUES (1, 1, 134, 200, 1, 1, '2022-02-09 14:18:26', '2022-02-15 14:18:29', 1);
INSERT INTO `second_course` VALUES (2, 4, 134, 200, 1, 2, '2022-02-01 15:06:19', '2022-02-15 15:06:21', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 9628 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `sys_log` VALUES (9415, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-24 09:23:50');
INSERT INTO `sys_log` VALUES (9416, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-24 09:24:46');
INSERT INTO `sys_log` VALUES (9417, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-24 09:26:45');
INSERT INTO `sys_log` VALUES (9418, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-24 09:27:48');
INSERT INTO `sys_log` VALUES (9419, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-24 09:28:01');
INSERT INTO `sys_log` VALUES (9420, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-24 09:30:16');
INSERT INTO `sys_log` VALUES (9421, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-24 09:31:13');
INSERT INTO `sys_log` VALUES (9422, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-24 09:32:10');
INSERT INTO `sys_log` VALUES (9423, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-24 09:32:43');
INSERT INTO `sys_log` VALUES (9424, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-24 09:34:19');
INSERT INTO `sys_log` VALUES (9425, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-24 09:57:54');
INSERT INTO `sys_log` VALUES (9426, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-24 10:02:27');
INSERT INTO `sys_log` VALUES (9427, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-24 10:03:12');
INSERT INTO `sys_log` VALUES (9428, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-24 10:03:25');
INSERT INTO `sys_log` VALUES (9429, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-24 10:04:19');
INSERT INTO `sys_log` VALUES (9430, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-24 10:04:27');
INSERT INTO `sys_log` VALUES (9431, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-24 10:04:35');
INSERT INTO `sys_log` VALUES (9432, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-24 10:04:41');
INSERT INTO `sys_log` VALUES (9433, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-24 10:11:04');
INSERT INTO `sys_log` VALUES (9434, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-24 10:13:52');
INSERT INTO `sys_log` VALUES (9435, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-24 10:14:00');
INSERT INTO `sys_log` VALUES (9436, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-24 10:14:10');
INSERT INTO `sys_log` VALUES (9437, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-24 10:14:18');
INSERT INTO `sys_log` VALUES (9438, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-24 10:14:52');
INSERT INTO `sys_log` VALUES (9439, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-24 10:15:46');
INSERT INTO `sys_log` VALUES (9440, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-24 10:16:08');
INSERT INTO `sys_log` VALUES (9441, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2022-01-24 10:21:48');
INSERT INTO `sys_log` VALUES (9442, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-24 10:23:46');
INSERT INTO `sys_log` VALUES (9443, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2022-01-24 10:23:53');
INSERT INTO `sys_log` VALUES (9444, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2022-01-24 10:25:06');
INSERT INTO `sys_log` VALUES (9445, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-24 10:25:16');
INSERT INTO `sys_log` VALUES (9446, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-24 10:29:21');
INSERT INTO `sys_log` VALUES (9447, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-24 10:37:04');
INSERT INTO `sys_log` VALUES (9448, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-24 10:38:59');
INSERT INTO `sys_log` VALUES (9449, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-24 10:39:28');
INSERT INTO `sys_log` VALUES (9450, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-24 10:46:37');
INSERT INTO `sys_log` VALUES (9451, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-24 10:56:21');
INSERT INTO `sys_log` VALUES (9452, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-24 10:57:13');
INSERT INTO `sys_log` VALUES (9453, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-24 10:58:25');
INSERT INTO `sys_log` VALUES (9454, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-24 10:59:37');
INSERT INTO `sys_log` VALUES (9455, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-24 11:08:01');
INSERT INTO `sys_log` VALUES (9456, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-24 11:16:13');
INSERT INTO `sys_log` VALUES (9457, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-24 11:17:06');
INSERT INTO `sys_log` VALUES (9458, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-24 11:22:46');
INSERT INTO `sys_log` VALUES (9459, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-24 11:25:33');
INSERT INTO `sys_log` VALUES (9460, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-24 11:51:05');
INSERT INTO `sys_log` VALUES (9461, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-24 11:57:47');
INSERT INTO `sys_log` VALUES (9462, 'admin', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9463, 'admin', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9464, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-24 13:03:12');
INSERT INTO `sys_log` VALUES (9465, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-24 13:05:47');
INSERT INTO `sys_log` VALUES (9466, 'admin', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9467, 'admin', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9468, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-24 13:18:12');
INSERT INTO `sys_log` VALUES (9469, 'admin', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9470, 'admin', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9471, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-24 13:57:05');
INSERT INTO `sys_log` VALUES (9472, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-24 14:14:43');
INSERT INTO `sys_log` VALUES (9473, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-24 14:23:27');
INSERT INTO `sys_log` VALUES (9474, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-24 15:03:52');
INSERT INTO `sys_log` VALUES (9475, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-24 15:27:05');
INSERT INTO `sys_log` VALUES (9476, 'admin', '退出平台', NULL, NULL, 1643009437846, NULL, NULL);
INSERT INTO `sys_log` VALUES (9477, 'admin', '退出平台', NULL, NULL, 1643009450755, NULL, NULL);
INSERT INTO `sys_log` VALUES (9478, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-24 15:41:10');
INSERT INTO `sys_log` VALUES (9479, 'admin', '退出平台', NULL, NULL, 1643010273754, NULL, NULL);
INSERT INTO `sys_log` VALUES (9480, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-24 15:44:54');
INSERT INTO `sys_log` VALUES (9481, 'lyt', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9482, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-24 15:45:23');
INSERT INTO `sys_log` VALUES (9483, 'lyt', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9484, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-24 15:47:32');
INSERT INTO `sys_log` VALUES (9485, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-24 16:46:29');
INSERT INTO `sys_log` VALUES (9486, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-24 16:52:56');
INSERT INTO `sys_log` VALUES (9487, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-24 16:53:49');
INSERT INTO `sys_log` VALUES (9488, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-24 16:54:16');
INSERT INTO `sys_log` VALUES (9489, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-24 16:58:24');
INSERT INTO `sys_log` VALUES (9490, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-24 16:58:56');
INSERT INTO `sys_log` VALUES (9491, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-24 17:24:11');
INSERT INTO `sys_log` VALUES (9492, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-25 08:40:16');
INSERT INTO `sys_log` VALUES (9493, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-25 08:48:19');
INSERT INTO `sys_log` VALUES (9494, 'admin', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9495, 'admin', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9496, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-25 08:50:59');
INSERT INTO `sys_log` VALUES (9497, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-25 11:25:06');
INSERT INTO `sys_log` VALUES (9498, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-25 13:03:25');
INSERT INTO `sys_log` VALUES (9499, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-25 13:03:34');
INSERT INTO `sys_log` VALUES (9500, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-25 13:12:56');
INSERT INTO `sys_log` VALUES (9501, 'admin', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9502, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-25 13:14:48');
INSERT INTO `sys_log` VALUES (9503, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-25 14:12:00');
INSERT INTO `sys_log` VALUES (9504, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-25 14:23:40');
INSERT INTO `sys_log` VALUES (9505, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-25 14:31:08');
INSERT INTO `sys_log` VALUES (9506, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-25 14:50:15');
INSERT INTO `sys_log` VALUES (9507, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-25 14:52:54');
INSERT INTO `sys_log` VALUES (9508, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-25 15:59:38');
INSERT INTO `sys_log` VALUES (9509, 'lyt', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9510, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-25 16:00:12');
INSERT INTO `sys_log` VALUES (9511, 'lyt', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9512, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-25 16:01:41');
INSERT INTO `sys_log` VALUES (9513, 'lyt', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9514, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-25 16:05:47');
INSERT INTO `sys_log` VALUES (9515, 'lyt', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9516, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-25 16:09:28');
INSERT INTO `sys_log` VALUES (9517, 'lyt', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9518, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-25 16:09:39');
INSERT INTO `sys_log` VALUES (9519, 'lyt', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9520, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-25 16:13:19');
INSERT INTO `sys_log` VALUES (9521, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-25 16:22:56');
INSERT INTO `sys_log` VALUES (9522, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-25 17:04:43');
INSERT INTO `sys_log` VALUES (9523, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-25 17:06:19');
INSERT INTO `sys_log` VALUES (9524, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-25 17:18:40');
INSERT INTO `sys_log` VALUES (9525, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-26 08:32:29');
INSERT INTO `sys_log` VALUES (9526, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-26 09:57:04');
INSERT INTO `sys_log` VALUES (9527, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-26 10:04:53');
INSERT INTO `sys_log` VALUES (9528, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-26 10:05:08');
INSERT INTO `sys_log` VALUES (9529, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-26 10:05:12');
INSERT INTO `sys_log` VALUES (9530, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-26 10:14:53');
INSERT INTO `sys_log` VALUES (9531, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-26 10:15:16');
INSERT INTO `sys_log` VALUES (9532, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-26 10:23:13');
INSERT INTO `sys_log` VALUES (9533, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-26 10:50:18');
INSERT INTO `sys_log` VALUES (9534, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-26 11:14:33');
INSERT INTO `sys_log` VALUES (9535, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-01-26 11:14:36');
INSERT INTO `sys_log` VALUES (9536, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-01-26 11:14:40');
INSERT INTO `sys_log` VALUES (9537, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-01-26 11:14:47');
INSERT INTO `sys_log` VALUES (9538, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-01-26 11:15:20');
INSERT INTO `sys_log` VALUES (9539, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-01-26 11:15:25');
INSERT INTO `sys_log` VALUES (9540, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-01-26 11:16:41');
INSERT INTO `sys_log` VALUES (9541, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-01-26 11:16:42');
INSERT INTO `sys_log` VALUES (9542, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-01-26 11:16:43');
INSERT INTO `sys_log` VALUES (9543, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-01-26 11:16:43');
INSERT INTO `sys_log` VALUES (9544, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-01-26 11:20:07');
INSERT INTO `sys_log` VALUES (9545, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-01-26 11:20:10');
INSERT INTO `sys_log` VALUES (9546, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-01-26 11:20:14');
INSERT INTO `sys_log` VALUES (9547, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-01-26 11:21:15');
INSERT INTO `sys_log` VALUES (9548, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-01-26 11:21:20');
INSERT INTO `sys_log` VALUES (9549, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-26 11:21:52');
INSERT INTO `sys_log` VALUES (9550, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-26 11:21:54');
INSERT INTO `sys_log` VALUES (9551, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-26 11:22:42');
INSERT INTO `sys_log` VALUES (9552, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-01-26 11:28:14');
INSERT INTO `sys_log` VALUES (9553, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-01-26 11:28:21');
INSERT INTO `sys_log` VALUES (9554, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-01-26 11:52:36');
INSERT INTO `sys_log` VALUES (9555, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-01-26 11:54:38');
INSERT INTO `sys_log` VALUES (9556, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-10 08:48:08');
INSERT INTO `sys_log` VALUES (9557, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-10 09:23:10');
INSERT INTO `sys_log` VALUES (9558, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-10 10:14:40');
INSERT INTO `sys_log` VALUES (9559, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-10 10:21:16');
INSERT INTO `sys_log` VALUES (9560, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-10 10:22:58');
INSERT INTO `sys_log` VALUES (9561, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-10 10:23:05');
INSERT INTO `sys_log` VALUES (9562, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-10 11:25:25');
INSERT INTO `sys_log` VALUES (9563, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-10 11:25:45');
INSERT INTO `sys_log` VALUES (9564, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-10 13:04:54');
INSERT INTO `sys_log` VALUES (9565, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-10 13:48:06');
INSERT INTO `sys_log` VALUES (9566, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-10 14:05:40');
INSERT INTO `sys_log` VALUES (9567, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-10 15:02:16');
INSERT INTO `sys_log` VALUES (9568, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-10 15:06:27');
INSERT INTO `sys_log` VALUES (9569, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-10 15:59:46');
INSERT INTO `sys_log` VALUES (9570, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-10 16:11:17');
INSERT INTO `sys_log` VALUES (9571, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-10 16:40:30');
INSERT INTO `sys_log` VALUES (9572, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-10 16:46:25');
INSERT INTO `sys_log` VALUES (9573, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-10 16:58:05');
INSERT INTO `sys_log` VALUES (9574, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-11 08:39:08');
INSERT INTO `sys_log` VALUES (9575, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-11 11:35:11');
INSERT INTO `sys_log` VALUES (9576, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-11 11:35:21');
INSERT INTO `sys_log` VALUES (9577, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-11 11:40:55');
INSERT INTO `sys_log` VALUES (9578, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-11 11:42:21');
INSERT INTO `sys_log` VALUES (9579, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-11 13:02:17');
INSERT INTO `sys_log` VALUES (9580, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-11 13:04:36');
INSERT INTO `sys_log` VALUES (9581, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-11 14:16:52');
INSERT INTO `sys_log` VALUES (9582, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-11 14:19:23');
INSERT INTO `sys_log` VALUES (9583, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-11 14:48:00');
INSERT INTO `sys_log` VALUES (9584, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-11 14:51:30');
INSERT INTO `sys_log` VALUES (9585, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-11 15:13:38');
INSERT INTO `sys_log` VALUES (9586, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-11 15:26:42');
INSERT INTO `sys_log` VALUES (9587, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-11 15:52:58');
INSERT INTO `sys_log` VALUES (9588, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-11 16:03:39');
INSERT INTO `sys_log` VALUES (9589, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-11 16:11:41');
INSERT INTO `sys_log` VALUES (9590, 'lyt', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9591, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-11 16:19:48');
INSERT INTO `sys_log` VALUES (9592, 'lyt', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9593, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-11 16:20:57');
INSERT INTO `sys_log` VALUES (9594, 'lyt', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9595, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-11 16:21:10');
INSERT INTO `sys_log` VALUES (9596, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-11 16:27:00');
INSERT INTO `sys_log` VALUES (9597, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-11 16:27:02');
INSERT INTO `sys_log` VALUES (9598, 'lyt', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9599, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-11 16:33:49');
INSERT INTO `sys_log` VALUES (9600, 'lyt', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9601, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-11 16:50:10');
INSERT INTO `sys_log` VALUES (9602, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-11 16:52:13');
INSERT INTO `sys_log` VALUES (9603, 'lyt', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9604, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-11 16:58:02');
INSERT INTO `sys_log` VALUES (9605, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-11 17:20:27');
INSERT INTO `sys_log` VALUES (9606, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-11 17:22:48');
INSERT INTO `sys_log` VALUES (9607, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-12 08:37:01');
INSERT INTO `sys_log` VALUES (9608, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-12 09:05:10');
INSERT INTO `sys_log` VALUES (9609, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-12 09:15:52');
INSERT INTO `sys_log` VALUES (9610, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-12 10:09:53');
INSERT INTO `sys_log` VALUES (9611, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-12 10:18:19');
INSERT INTO `sys_log` VALUES (9612, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-12 11:17:34');
INSERT INTO `sys_log` VALUES (9613, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-12 11:20:17');
INSERT INTO `sys_log` VALUES (9614, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-12 11:25:55');
INSERT INTO `sys_log` VALUES (9615, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-12 13:02:40');
INSERT INTO `sys_log` VALUES (9616, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-12 13:04:36');
INSERT INTO `sys_log` VALUES (9617, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-12 14:04:16');
INSERT INTO `sys_log` VALUES (9618, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-12 14:08:37');
INSERT INTO `sys_log` VALUES (9619, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-12 14:13:53');
INSERT INTO `sys_log` VALUES (9620, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-12 15:12:32');
INSERT INTO `sys_log` VALUES (9621, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-12 15:13:36');
INSERT INTO `sys_log` VALUES (9622, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-12 15:43:00');
INSERT INTO `sys_log` VALUES (9623, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-12 16:02:44');
INSERT INTO `sys_log` VALUES (9624, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-12 16:13:37');
INSERT INTO `sys_log` VALUES (9625, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-12 16:19:21');
INSERT INTO `sys_log` VALUES (9626, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-12 16:26:50');
INSERT INTO `sys_log` VALUES (9627, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-12 16:53:36');

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
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (2, 0, '基础管理', '/base', NULL, 0, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (3, 2, '用户管理', '/user', NULL, 0, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (4, 3, '用户集合', NULL, 'sys:user:list', 2, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (5, 3, '用户新增', NULL, 'sys:user:insert', 2, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (6, 3, '用户删除', NULL, 'sys:user:delete', 2, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (7, 3, '用户编辑', NULL, 'sys:user:update', 2, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (8, 3, '用户详情', NULL, 'sys:user:info', 2, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (9, 2, '部门管理', '/unit', '', 1, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (11, 3, '更新密码', NULL, 'sys:user:password', 2, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (12, 3, '更新个人密码', NULL, 'sys:my:password', 2, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (13, 3, '重置密码', NULL, 'sys:user:reset', 2, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (14, 2, '课程管理', '/course', NULL, 1, NULL, 2, 1);
INSERT INTO `sys_menu` VALUES (15, 14, '课程集合', NULL, 'user:course:list', 2, '', 1, 1);
INSERT INTO `sys_menu` VALUES (16, 14, '课程详情', NULL, 'user:course:info', 2, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (17, 0, '课程表', '/classCourse', NULL, 1, NULL, 2, 1);
INSERT INTO `sys_menu` VALUES (18, 17, '当前个人课程表', NULL, 'course:classSchedule:user:course', 2, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (19, 3, '老师管理', '/teacher', NULL, 1, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (20, 3, '学生管理', '/student', NULL, 1, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (22, 9, '部门列表', NULL, 'sys:unit:tree:list', 2, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (23, 9, '部门详情', NULL, 'sys:unit:info', 2, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (24, 9, '部门新增', NULL, 'sys:unit:insert', 2, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (25, 9, '部门编辑', NULL, 'sys:unit:update', 2, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (26, 9, '部门删除', NULL, 'sys:unit:delete', 2, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (27, 2, '角色管理', '/role', NULL, 1, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (28, 27, '角色列表', NULL, 'sys:role:list', 2, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (29, 27, '角色详情', NULL, 'sys:role:info', 2, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (30, 27, '角色编辑', NULL, 'sys:role:update', 2, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (31, 27, '角色删除', NULL, 'sys:role:delete', 2, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (32, 27, '角色新增', NULL, 'sys:role:insert', 2, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (33, 0, '选课管理', '/pickCourse', NULL, 1, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (34, 33, '课程集合', NULL, 'ccss:second:list', 2, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (35, 14, '课程编辑', NULL, 'user:course:update', 2, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (36, 14, '课程新增', NULL, 'user:course:insert', 2, NULL, 1, 1);
INSERT INTO `sys_menu` VALUES (37, 14, '课程删除', NULL, 'user:course:delete', 2, NULL, 1, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'admin', '管理员', 12, 'admin', '2021-08-10 11:54:26', 'admin', '2022-02-11 16:52:29');
INSERT INTO `sys_role` VALUES (22, 'Student', '学生', 1, 'admin', '2021-11-25 13:52:26', 'admin', '2021-11-25 13:52:30');
INSERT INTO `sys_role` VALUES (23, 'Teacher', '老师', 1, 'admin', '2021-11-25 13:59:27', 'admin', '2022-02-11 15:28:37');
INSERT INTO `sys_role` VALUES (24, 'test', '1', 1, '1', NULL, 'admin', '2022-02-11 15:27:55');
INSERT INTO `sys_role` VALUES (33, '123123', '123123', NULL, 'admin', '2022-02-11 14:23:27', 'admin', '2022-02-11 14:23:27');
INSERT INTO `sys_role` VALUES (34, '1234', '12342134', NULL, 'admin', '2022-02-11 14:24:02', 'admin', '2022-02-11 14:24:02');
INSERT INTO `sys_role` VALUES (43, '1231', '12312312', NULL, 'admin', '2022-02-11 14:26:26', 'admin', '2022-02-11 14:26:26');
INSERT INTO `sys_role` VALUES (44, '1234567', '132', NULL, 'admin', '2022-02-11 14:26:53', 'admin', '2022-02-11 15:26:57');
INSERT INTO `sys_role` VALUES (45, 'demo1', '1', NULL, 'admin', '2022-02-11 14:59:36', 'admin', '2022-02-11 15:31:29');
INSERT INTO `sys_role` VALUES (46, 'demo11', '1', NULL, 'admin', '2022-02-11 15:21:37', 'admin', '2022-02-11 15:24:57');

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
  CONSTRAINT `sys_role_menu_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 497 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色与菜单对应关系' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (31, 43, 2);
INSERT INTO `sys_role_menu` VALUES (32, 43, 3);
INSERT INTO `sys_role_menu` VALUES (33, 43, 4);
INSERT INTO `sys_role_menu` VALUES (34, 43, 5);
INSERT INTO `sys_role_menu` VALUES (35, 43, 6);
INSERT INTO `sys_role_menu` VALUES (36, 43, 7);
INSERT INTO `sys_role_menu` VALUES (37, 43, 8);
INSERT INTO `sys_role_menu` VALUES (38, 43, 11);
INSERT INTO `sys_role_menu` VALUES (39, 43, 12);
INSERT INTO `sys_role_menu` VALUES (40, 43, 13);
INSERT INTO `sys_role_menu` VALUES (41, 43, 19);
INSERT INTO `sys_role_menu` VALUES (42, 43, 20);
INSERT INTO `sys_role_menu` VALUES (43, 43, 9);
INSERT INTO `sys_role_menu` VALUES (44, 43, 22);
INSERT INTO `sys_role_menu` VALUES (45, 43, 23);
INSERT INTO `sys_role_menu` VALUES (46, 43, 24);
INSERT INTO `sys_role_menu` VALUES (47, 43, 25);
INSERT INTO `sys_role_menu` VALUES (48, 43, 26);
INSERT INTO `sys_role_menu` VALUES (49, 43, 14);
INSERT INTO `sys_role_menu` VALUES (50, 43, 15);
INSERT INTO `sys_role_menu` VALUES (51, 43, 16);
INSERT INTO `sys_role_menu` VALUES (52, 43, 27);
INSERT INTO `sys_role_menu` VALUES (53, 43, 28);
INSERT INTO `sys_role_menu` VALUES (54, 43, 29);
INSERT INTO `sys_role_menu` VALUES (55, 43, 30);
INSERT INTO `sys_role_menu` VALUES (56, 43, 31);
INSERT INTO `sys_role_menu` VALUES (57, 43, 32);
INSERT INTO `sys_role_menu` VALUES (58, 43, 17);
INSERT INTO `sys_role_menu` VALUES (59, 43, 18);
INSERT INTO `sys_role_menu` VALUES (60, 43, 33);
INSERT INTO `sys_role_menu` VALUES (61, 43, 34);
INSERT INTO `sys_role_menu` VALUES (62, 44, 17);
INSERT INTO `sys_role_menu` VALUES (63, 44, 18);
INSERT INTO `sys_role_menu` VALUES (219, 46, 2);
INSERT INTO `sys_role_menu` VALUES (220, 46, 3);
INSERT INTO `sys_role_menu` VALUES (221, 46, 4);
INSERT INTO `sys_role_menu` VALUES (222, 46, 5);
INSERT INTO `sys_role_menu` VALUES (223, 46, 6);
INSERT INTO `sys_role_menu` VALUES (224, 46, 7);
INSERT INTO `sys_role_menu` VALUES (225, 46, 8);
INSERT INTO `sys_role_menu` VALUES (226, 46, 11);
INSERT INTO `sys_role_menu` VALUES (227, 46, 12);
INSERT INTO `sys_role_menu` VALUES (228, 46, 13);
INSERT INTO `sys_role_menu` VALUES (229, 46, 19);
INSERT INTO `sys_role_menu` VALUES (230, 46, 20);
INSERT INTO `sys_role_menu` VALUES (231, 46, 9);
INSERT INTO `sys_role_menu` VALUES (232, 46, 22);
INSERT INTO `sys_role_menu` VALUES (233, 46, 23);
INSERT INTO `sys_role_menu` VALUES (234, 46, 24);
INSERT INTO `sys_role_menu` VALUES (235, 46, 25);
INSERT INTO `sys_role_menu` VALUES (236, 46, 26);
INSERT INTO `sys_role_menu` VALUES (237, 46, 14);
INSERT INTO `sys_role_menu` VALUES (238, 46, 15);
INSERT INTO `sys_role_menu` VALUES (239, 46, 16);
INSERT INTO `sys_role_menu` VALUES (240, 46, 27);
INSERT INTO `sys_role_menu` VALUES (241, 46, 28);
INSERT INTO `sys_role_menu` VALUES (242, 46, 29);
INSERT INTO `sys_role_menu` VALUES (243, 46, 30);
INSERT INTO `sys_role_menu` VALUES (244, 46, 31);
INSERT INTO `sys_role_menu` VALUES (245, 46, 32);
INSERT INTO `sys_role_menu` VALUES (308, 24, 2);
INSERT INTO `sys_role_menu` VALUES (309, 24, 3);
INSERT INTO `sys_role_menu` VALUES (310, 24, 4);
INSERT INTO `sys_role_menu` VALUES (311, 24, 5);
INSERT INTO `sys_role_menu` VALUES (312, 24, 6);
INSERT INTO `sys_role_menu` VALUES (313, 24, 7);
INSERT INTO `sys_role_menu` VALUES (314, 24, 8);
INSERT INTO `sys_role_menu` VALUES (315, 24, 11);
INSERT INTO `sys_role_menu` VALUES (316, 24, 12);
INSERT INTO `sys_role_menu` VALUES (317, 24, 13);
INSERT INTO `sys_role_menu` VALUES (318, 24, 19);
INSERT INTO `sys_role_menu` VALUES (319, 24, 20);
INSERT INTO `sys_role_menu` VALUES (320, 24, 9);
INSERT INTO `sys_role_menu` VALUES (321, 24, 22);
INSERT INTO `sys_role_menu` VALUES (322, 24, 23);
INSERT INTO `sys_role_menu` VALUES (323, 24, 24);
INSERT INTO `sys_role_menu` VALUES (324, 24, 25);
INSERT INTO `sys_role_menu` VALUES (325, 24, 26);
INSERT INTO `sys_role_menu` VALUES (326, 24, 14);
INSERT INTO `sys_role_menu` VALUES (327, 24, 15);
INSERT INTO `sys_role_menu` VALUES (328, 24, 16);
INSERT INTO `sys_role_menu` VALUES (329, 24, 27);
INSERT INTO `sys_role_menu` VALUES (330, 24, 28);
INSERT INTO `sys_role_menu` VALUES (331, 24, 29);
INSERT INTO `sys_role_menu` VALUES (332, 24, 30);
INSERT INTO `sys_role_menu` VALUES (333, 24, 31);
INSERT INTO `sys_role_menu` VALUES (334, 24, 32);
INSERT INTO `sys_role_menu` VALUES (335, 24, 17);
INSERT INTO `sys_role_menu` VALUES (336, 24, 18);
INSERT INTO `sys_role_menu` VALUES (397, 23, 17);
INSERT INTO `sys_role_menu` VALUES (398, 23, 18);
INSERT INTO `sys_role_menu` VALUES (463, 1, 2);
INSERT INTO `sys_role_menu` VALUES (464, 1, 3);
INSERT INTO `sys_role_menu` VALUES (465, 1, 4);
INSERT INTO `sys_role_menu` VALUES (466, 1, 5);
INSERT INTO `sys_role_menu` VALUES (467, 1, 6);
INSERT INTO `sys_role_menu` VALUES (468, 1, 7);
INSERT INTO `sys_role_menu` VALUES (469, 1, 8);
INSERT INTO `sys_role_menu` VALUES (470, 1, 11);
INSERT INTO `sys_role_menu` VALUES (471, 1, 12);
INSERT INTO `sys_role_menu` VALUES (472, 1, 13);
INSERT INTO `sys_role_menu` VALUES (473, 1, 19);
INSERT INTO `sys_role_menu` VALUES (474, 1, 20);
INSERT INTO `sys_role_menu` VALUES (475, 1, 9);
INSERT INTO `sys_role_menu` VALUES (476, 1, 22);
INSERT INTO `sys_role_menu` VALUES (477, 1, 23);
INSERT INTO `sys_role_menu` VALUES (478, 1, 24);
INSERT INTO `sys_role_menu` VALUES (479, 1, 25);
INSERT INTO `sys_role_menu` VALUES (480, 1, 26);
INSERT INTO `sys_role_menu` VALUES (481, 1, 14);
INSERT INTO `sys_role_menu` VALUES (482, 1, 15);
INSERT INTO `sys_role_menu` VALUES (483, 1, 16);
INSERT INTO `sys_role_menu` VALUES (484, 1, 35);
INSERT INTO `sys_role_menu` VALUES (485, 1, 36);
INSERT INTO `sys_role_menu` VALUES (486, 1, 37);
INSERT INTO `sys_role_menu` VALUES (487, 1, 27);
INSERT INTO `sys_role_menu` VALUES (488, 1, 28);
INSERT INTO `sys_role_menu` VALUES (489, 1, 29);
INSERT INTO `sys_role_menu` VALUES (490, 1, 30);
INSERT INTO `sys_role_menu` VALUES (491, 1, 31);
INSERT INTO `sys_role_menu` VALUES (492, 1, 32);
INSERT INTO `sys_role_menu` VALUES (493, 1, 17);
INSERT INTO `sys_role_menu` VALUES (494, 1, 18);
INSERT INTO `sys_role_menu` VALUES (495, 1, 33);
INSERT INTO `sys_role_menu` VALUES (496, 1, 34);

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
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_unit
-- ----------------------------
INSERT INTO `sys_unit` VALUES (1, '信息技术', 0, '111');
INSERT INTO `sys_unit` VALUES (2, '软件19-1', 1, '123');
INSERT INTO `sys_unit` VALUES (3, '软件19-2', 1, '1235');
INSERT INTO `sys_unit` VALUES (7, '软件技术', 0, NULL);
INSERT INTO `sys_unit` VALUES (8, '软件18-1', 7, NULL);
INSERT INTO `sys_unit` VALUES (9, '软件18-1-1', 8, NULL);
INSERT INTO `sys_unit` VALUES (23, '123424', 0, NULL);

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
  `created_by` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `updated_by` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `enable` int(1) NULL DEFAULT 0 COMMENT '账号是否可用',
  `unit_id` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '部门id',
  `last_login_time` datetime NULL DEFAULT NULL COMMENT '登录时间',
  `sex` int(1) NULL DEFAULT NULL COMMENT '性别 0 女 1 男 2保密',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `number`(`number`) USING BTREE,
  INDEX `unit_id`(`unit_id`) USING BTREE,
  CONSTRAINT `sys_user_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `sys_unit` (`unit_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 141 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, '管理员', 'admin', 0, '$2a$10$SDvONxqv83ufTAMlS0pXqePTpnFxvEHjN5Qirh90NTOwzKUhvB7EK', NULL, 0, 'String', 'String', 'String', 1, 61, '2021-11-18 10:48:13', '2021-11-26 10:48:52', '1', '2021-12-01 11:29:00', '1', 1, 1, '2021-12-01 11:29:00', 1);
INSERT INTO `sys_user` VALUES (132, 'lyt', 'lyt', 22, '$2a$10$ZyMH1lHj1XfGVpslDRPLV.Jgu8oTCA7yEzxCKlq3IDQecU/fXeppK', '13736521260', 1, '1830841504@qq.com', '浙江省台州市黄岩区', NULL, 1, 3, '2022-01-26 11:37:20', '2022-01-26 11:32:57', 'admin', '2022-02-11 16:33:23', 'admin', 1, 2, NULL, 1);
INSERT INTO `sys_user` VALUES (133, 'lz', 'lz', 18, '$2a$10$1TUdS7us3V3K6EQ8qBaDXeUDR.2aRtDuL6ZyNxiEJPk1iE4Kk46j.', '13564852451', 1, 'lz@qq.com', 'lz', NULL, 1, 5, '2022-01-26 11:36:18', '2022-01-26 11:36:18', 'admin', '2022-02-10 10:15:16', 'admin', 1, 2, NULL, 1);
INSERT INTO `sys_user` VALUES (134, 'demo1', 'demo1', 16, '$2a$10$5Q1wxkTWmBP3t1PTjzZOJeX.pnNK7bc3pzQ1yAKNQTX04QEiDgp12', '13736521260', 2, '1830841504@qq.com', '', NULL, 1, 1, '2022-02-10 08:53:40', '2022-02-10 08:53:40', 'admin', '2022-02-10 08:53:40', 'admin', 1, 2, '2022-02-10 08:53:40', 1);
INSERT INTO `sys_user` VALUES (140, 'demo5', 'demo5', 16, '$2a$10$27ihOQOHqWxQv/kO3En6B.IHfCUu5NJH1Udxs3FeYpwQEwsV0jMoy', '13736521260', 2, '1830841504@qq.com', '', NULL, 1, 1, '2022-02-10 08:59:44', '2022-02-10 08:59:44', 'admin', '2022-02-10 08:59:44', 'admin', 1, 23, '2022-02-10 08:59:44', 1);

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
  CONSTRAINT `sys_user_role_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sys_user_role_ibfk_3` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与角色对应关系' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1, 1);
INSERT INTO `sys_user_role` VALUES (18, 132, 1);
INSERT INTO `sys_user_role` VALUES (19, 133, 1);
INSERT INTO `sys_user_role` VALUES (20, 134, 1);
INSERT INTO `sys_user_role` VALUES (25, 140, 24);

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
