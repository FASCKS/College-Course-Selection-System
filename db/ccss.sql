/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : ccss

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 20/05/2022 15:38:39
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
  `unit_id` int(11) NULL DEFAULT NULL COMMENT '所属部门',
  `teacher` bigint(22) NULL DEFAULT NULL COMMENT '任课老师',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `classroom_id` int(11) NULL DEFAULT NULL COMMENT '教室id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE,
  INDEX `class_schedule_ibfk_2`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 209 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class_schedule
-- ----------------------------
INSERT INTO `class_schedule` VALUES (1, 1, 1, 1, 1, 1, 134, '2022-04-09 15:10:03', 1);
INSERT INTO `class_schedule` VALUES (2, 10, 1, 1, 1501101488499138560, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (3, 10, 1, 1, 1501101488532692992, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (4, 10, 1, 1, 1501101488541081600, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (5, 10, 1, 1, 1501101488545275904, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (6, 10, 1, 1, 1501101488549470208, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (7, 10, 1, 1, 1501101488557858816, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (8, 10, 1, 1, 1501101488562053120, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (9, 10, 1, 1, 1501101488566247424, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (10, 10, 1, 1, 1501101488574636032, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (11, 10, 1, 1, 1501101488574636033, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (12, 10, 1, 1, 1501101488578830336, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (13, 10, 1, 1, 1501101488583024640, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (14, 10, 1, 1, 1501101488583024641, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (15, 10, 1, 1, 1501101488587218944, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (16, 10, 1, 1, 1501101488591413248, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (17, 10, 1, 1, 1501101488599801856, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (18, 10, 1, 1, 1501101488608190464, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (19, 10, 1, 1, 1501101488612384768, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (20, 10, 1, 1, 1501101488612384769, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (21, 10, 1, 1, 1501101488612384770, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (22, 10, 1, 1, 1501101488616579072, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (23, 10, 1, 1, 1501101488616579073, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (24, 10, 1, 1, 1501101488620773376, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (25, 10, 1, 1, 1501101488620773377, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (26, 10, 1, 1, 1501101488624967680, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (27, 10, 1, 1, 1501101488624967681, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (28, 10, 1, 1, 1501101488624967682, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (29, 10, 1, 1, 1501101488629161984, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (30, 10, 1, 1, 1501101488629161985, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (31, 10, 1, 1, 1501101488633356288, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (32, 10, 1, 1, 1501101488633356289, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (33, 10, 1, 1, 1501101488633356290, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (34, 10, 1, 1, 1501101488637550592, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (35, 10, 1, 1, 1501101488637550593, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (36, 10, 1, 1, 1501101488641744896, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (37, 10, 1, 1, 1501101488641744897, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (38, 10, 1, 1, 1501101488645939200, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (39, 10, 1, 1, 1501101488645939201, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (40, 10, 1, 1, 1501101488645939202, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (41, 10, 1, 1, 1501101488650133504, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (42, 10, 1, 1, 1501101488650133505, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (43, 10, 1, 1, 1501101488650133506, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (44, 10, 1, 1, 1501101488654327808, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (45, 10, 1, 1, 1501101488654327809, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (46, 10, 1, 1, 1501101488658522112, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (47, 10, 1, 1, 1501101488658522113, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (48, 10, 1, 1, 1501101488658522114, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (49, 10, 1, 1, 1501101488662716416, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (50, 10, 1, 1, 1501101488662716417, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (51, 10, 1, 1, 1501101488662716418, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (52, 10, 1, 1, 1501101488666910720, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (53, 10, 1, 1, 1501101488666910721, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (54, 10, 1, 1, 1501101488666910722, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (55, 10, 1, 1, 1501101488671105024, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (56, 10, 1, 1, 1501101488671105025, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (57, 10, 1, 1, 1501101488671105026, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (58, 10, 1, 1, 1501101488675299328, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (59, 10, 1, 1, 1501101488675299329, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (60, 10, 1, 1, 1501101488675299330, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (61, 10, 1, 1, 1501101488675299331, 1, 134, '2022-04-13 13:15:54', 1);
INSERT INTO `class_schedule` VALUES (62, 11, 7, 7, 132, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (63, 11, 7, 7, 133, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (64, 11, 7, 7, 134, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (65, 11, 7, 7, 140, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (66, 11, 7, 7, 141, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (67, 11, 7, 7, 142, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (68, 11, 7, 7, 144, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (69, 11, 7, 7, 145, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (70, 11, 7, 7, 146, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (71, 11, 7, 7, 147, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (72, 11, 7, 7, 148, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (73, 11, 7, 7, 149, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (74, 11, 7, 7, 150, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (75, 11, 7, 7, 1501101488499138560, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (76, 11, 7, 7, 1501101488532692992, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (77, 11, 7, 7, 1501101488541081600, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (78, 11, 7, 7, 1501101488545275904, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (79, 11, 7, 7, 1501101488549470208, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (80, 11, 7, 7, 1501101488557858816, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (81, 11, 7, 7, 1501101488562053120, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (82, 11, 7, 7, 1501101488566247424, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (83, 11, 7, 7, 1501101488574636032, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (84, 11, 7, 7, 1501101488574636033, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (85, 11, 7, 7, 1501101488578830336, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (86, 11, 7, 7, 1501101488583024640, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (87, 11, 7, 7, 1501101488583024641, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (88, 11, 7, 7, 1501101488587218944, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (89, 11, 7, 7, 1501101488591413248, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (90, 11, 7, 7, 1501101488599801856, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (91, 11, 7, 7, 1501101488608190464, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (92, 11, 7, 7, 1501101488612384768, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (93, 11, 7, 7, 1501101488612384769, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (94, 11, 7, 7, 1501101488612384770, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (95, 11, 7, 7, 1501101488616579072, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (96, 11, 7, 7, 1501101488616579073, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (97, 11, 7, 7, 1501101488620773376, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (98, 11, 7, 7, 1501101488620773377, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (99, 11, 7, 7, 1501101488624967680, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (100, 11, 7, 7, 1501101488624967681, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (101, 11, 7, 7, 1501101488624967682, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (102, 11, 7, 7, 1501101488629161984, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (103, 11, 7, 7, 1501101488629161985, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (104, 11, 7, 7, 1501101488633356288, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (105, 11, 7, 7, 1501101488633356289, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (106, 11, 7, 7, 1501101488633356290, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (107, 11, 7, 7, 1501101488637550592, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (108, 11, 7, 7, 1501101488637550593, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (109, 11, 7, 7, 1501101488641744896, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (110, 11, 7, 7, 1501101488641744897, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (111, 11, 7, 7, 1501101488645939200, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (112, 11, 7, 7, 1501101488645939201, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (113, 11, 7, 7, 1501101488645939202, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (114, 11, 7, 7, 1501101488650133504, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (115, 11, 7, 7, 1501101488650133505, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (116, 11, 7, 7, 1501101488650133506, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (117, 11, 7, 7, 1501101488654327808, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (118, 11, 7, 7, 1501101488654327809, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (119, 11, 7, 7, 1501101488658522112, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (120, 11, 7, 7, 1501101488658522113, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (121, 11, 7, 7, 1501101488658522114, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (122, 11, 7, 7, 1501101488662716416, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (123, 11, 7, 7, 1501101488662716417, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (124, 11, 7, 7, 1501101488662716418, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (125, 11, 7, 7, 1501101488666910720, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (126, 11, 7, 7, 1501101488666910721, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (127, 11, 7, 7, 1501101488666910722, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (128, 11, 7, 7, 1501101488671105024, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (129, 11, 7, 7, 1501101488671105025, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (130, 11, 7, 7, 1501101488671105026, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (131, 11, 7, 7, 1501101488675299328, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (132, 11, 7, 7, 1501101488675299329, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (133, 11, 7, 7, 1501101488675299330, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (134, 11, 7, 7, 1501101488675299331, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (135, 11, 8, 7, 132, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (136, 11, 8, 7, 133, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (137, 11, 8, 7, 134, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (138, 11, 8, 7, 140, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (139, 11, 8, 7, 141, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (140, 11, 8, 7, 142, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (141, 11, 8, 7, 144, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (142, 11, 8, 7, 145, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (143, 11, 8, 7, 146, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (144, 11, 8, 7, 147, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (145, 11, 8, 7, 148, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (146, 11, 8, 7, 149, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (147, 11, 8, 7, 150, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (148, 11, 8, 7, 1501101488499138560, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (149, 11, 8, 7, 1501101488532692992, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (150, 11, 8, 7, 1501101488541081600, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (151, 11, 8, 7, 1501101488545275904, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (152, 11, 8, 7, 1501101488549470208, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (153, 11, 8, 7, 1501101488557858816, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (154, 11, 8, 7, 1501101488562053120, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (155, 11, 8, 7, 1501101488566247424, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (156, 11, 8, 7, 1501101488574636032, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (157, 11, 8, 7, 1501101488574636033, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (158, 11, 8, 7, 1501101488578830336, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (159, 11, 8, 7, 1501101488583024640, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (160, 11, 8, 7, 1501101488583024641, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (161, 11, 8, 7, 1501101488587218944, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (162, 11, 8, 7, 1501101488591413248, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (163, 11, 8, 7, 1501101488599801856, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (164, 11, 8, 7, 1501101488608190464, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (165, 11, 8, 7, 1501101488612384768, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (166, 11, 8, 7, 1501101488612384769, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (167, 11, 8, 7, 1501101488612384770, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (168, 11, 8, 7, 1501101488616579072, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (169, 11, 8, 7, 1501101488616579073, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (170, 11, 8, 7, 1501101488620773376, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (171, 11, 8, 7, 1501101488620773377, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (172, 11, 8, 7, 1501101488624967680, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (173, 11, 8, 7, 1501101488624967681, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (174, 11, 8, 7, 1501101488624967682, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (175, 11, 8, 7, 1501101488629161984, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (176, 11, 8, 7, 1501101488629161985, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (177, 11, 8, 7, 1501101488633356288, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (178, 11, 8, 7, 1501101488633356289, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (179, 11, 8, 7, 1501101488633356290, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (180, 11, 8, 7, 1501101488637550592, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (181, 11, 8, 7, 1501101488637550593, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (182, 11, 8, 7, 1501101488641744896, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (183, 11, 8, 7, 1501101488641744897, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (184, 11, 8, 7, 1501101488645939200, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (185, 11, 8, 7, 1501101488645939201, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (186, 11, 8, 7, 1501101488645939202, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (187, 11, 8, 7, 1501101488650133504, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (188, 11, 8, 7, 1501101488650133505, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (189, 11, 8, 7, 1501101488650133506, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (190, 11, 8, 7, 1501101488654327808, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (191, 11, 8, 7, 1501101488654327809, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (192, 11, 8, 7, 1501101488658522112, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (193, 11, 8, 7, 1501101488658522113, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (194, 11, 8, 7, 1501101488658522114, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (195, 11, 8, 7, 1501101488662716416, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (196, 11, 8, 7, 1501101488662716417, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (197, 11, 8, 7, 1501101488662716418, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (198, 11, 8, 7, 1501101488666910720, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (199, 11, 8, 7, 1501101488666910721, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (200, 11, 8, 7, 1501101488666910722, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (201, 11, 8, 7, 1501101488671105024, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (202, 11, 8, 7, 1501101488671105025, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (203, 11, 8, 7, 1501101488671105026, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (204, 11, 8, 7, 1501101488675299328, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (205, 11, 8, 7, 1501101488675299329, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (206, 11, 8, 7, 1501101488675299330, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (207, 11, 8, 7, 1501101488675299331, 1, 140, '2022-04-13 13:20:43', 7);
INSERT INTO `class_schedule` VALUES (208, 9, 1, 1, 1, 1, 140, NULL, 1);

-- ----------------------------
-- Table structure for classroom
-- ----------------------------
DROP TABLE IF EXISTS `classroom`;
CREATE TABLE `classroom`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `floor` int(10) NULL DEFAULT NULL COMMENT '层数',
  `between` int(10) NULL DEFAULT NULL COMMENT '间',
  `roof_type_id` int(11) NULL DEFAULT NULL COMMENT '大楼类型 1 教学楼 2科技楼 3实验楼 4办公楼 11男学生宿舍 12 女学生宿舍 13男职工宿舍 14女职工宿舍 15混搭学生宿舍 16混搭职工宿舍',
  `between_type_id` int(11) NULL DEFAULT NULL COMMENT '教室类型 1 实验室 2 普通教室 11 单人间 12双人间 13三人间 14四人间 15五人间 16六人间 17七人间 18八人间',
  `number` int(11) NULL DEFAULT NULL COMMENT '容纳人数',
  `roof_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '大楼名称',
  `between_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教室名称',
  `roof_number` int(11) NULL DEFAULT NULL COMMENT '大楼序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classroom
-- ----------------------------
INSERT INTO `classroom` VALUES (1, 1, 1, 1, 1, 50, '教学楼', '普通教室', 1);
INSERT INTO `classroom` VALUES (2, 2, 1, 2, 5, 1, '教学楼', '机房', 2);
INSERT INTO `classroom` VALUES (4, 1, 5, 6, 5, 50, '教学楼', '机房', 3);
INSERT INTO `classroom` VALUES (6, 1, 1, 8, 1, 12, '科技楼', '普通教室', 1);
INSERT INTO `classroom` VALUES (7, 1, 2, 1, 1, 55, '教学楼', '普通教室', 1);
INSERT INTO `classroom` VALUES (9, 1, 3, 1, 1, 10, '教学楼', '普通教室', 1);
INSERT INTO `classroom` VALUES (10, 2, 1, 1, 1, 1, '教学楼', '普通教室', 1);
INSERT INTO `classroom` VALUES (11, 1, 4, 1, 1, 100, '教学楼', '普通教室', 1);
INSERT INTO `classroom` VALUES (12, 1, 6, 1, 5, 100, '教学楼', '机房', 1);
INSERT INTO `classroom` VALUES (13, 1, 1, 6, 1, 1, '教学楼', '普通教室', 3);
INSERT INTO `classroom` VALUES (14, 2, 2, 1, 1, 1, '教学楼', '普通教室', 1);

-- ----------------------------
-- Table structure for classroom_between
-- ----------------------------
DROP TABLE IF EXISTS `classroom_between`;
CREATE TABLE `classroom_between`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `between_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '房屋类型名称',
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '唯一标识码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classroom_between
-- ----------------------------
INSERT INTO `classroom_between` VALUES (1, '普通教室', '581c7f4b14ae4e6a8558d38739175a03');
INSERT INTO `classroom_between` VALUES (5, '机房', '581c7f4b14ae4e6a8558d38739175a01');
INSERT INTO `classroom_between` VALUES (6, '公共教室', '581c7f4b14ae4e6a8558d38739175a02');
INSERT INTO `classroom_between` VALUES (10, '453', '581c7f4b14ae4e6a8558d38739175a04');
INSERT INTO `classroom_between` VALUES (11, '普通教室', 'd4b09d09bb474d08ba4a55fbaa39950a');
INSERT INTO `classroom_between` VALUES (12, '普通 教室', '502b50b7aa5d4db58b7a28fc200cdc4e');
INSERT INTO `classroom_between` VALUES (13, '普通教室 ', '74fd7661e11647408991b02c4b978785');

-- ----------------------------
-- Table structure for classroom_roof
-- ----------------------------
DROP TABLE IF EXISTS `classroom_roof`;
CREATE TABLE `classroom_roof`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roof_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大楼类型名称',
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '唯一标识',
  `roof_number` int(11) NULL DEFAULT NULL COMMENT '编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classroom_roof
-- ----------------------------
INSERT INTO `classroom_roof` VALUES (1, '教学楼', '6c8b7be7bba349f9b3df184714b8844b', 1);
INSERT INTO `classroom_roof` VALUES (2, '教学楼', '6c8b7be7bba349f9b3df184714b8844d', 2);
INSERT INTO `classroom_roof` VALUES (6, '教学楼', '6c8b7be7bba349f9b3df184714b8844c', 3);
INSERT INTO `classroom_roof` VALUES (7, '教学楼', '6bc7b57cb5bc48e7810746895acbcee6', 4);
INSERT INTO `classroom_roof` VALUES (8, '科技楼', '6bc7b57cb5bc48e7810746895acbcee7', 1);
INSERT INTO `classroom_roof` VALUES (9, '科技楼', '3edb59560ad445b1a3826e6b59660ade', 2);

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
  `credit` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '学分',
  `number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程编号',
  `online_class` int(1) NULL DEFAULT NULL COMMENT '0 不是网课 1 是网课',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `number`(`number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, '毛泽东思想和中国特色社会主义理论体系概论', 3, '4', 'A001', 0);
INSERT INTO `course` VALUES (4, '环世界', 4, '10', 'A002', 1);
INSERT INTO `course` VALUES (5, '体育与健康', 3, '2', 'A003', 0);
INSERT INTO `course` VALUES (6, '趣味英语与翻译', 3, '2', 'A1', 0);
INSERT INTO `course` VALUES (7, '实用英语', 3, '2', 'A2', 1);
INSERT INTO `course` VALUES (8, '从爱因斯坦到霍金的宇宙', 2, '2', 'B1', 1);
INSERT INTO `course` VALUES (9, '突发事件及自救互救', 2, '2', 'B2', 0);
INSERT INTO `course` VALUES (10, '有效沟通技巧', 1, '2', 'B3', 0);
INSERT INTO `course` VALUES (11, '领导学', 2, '0.5', 'B4', 0);
INSERT INTO `course` VALUES (12, '公共关系礼仪实务', 2, '0.5', 'B6', 0);
INSERT INTO `course` VALUES (13, '打赢疫情防控阻击战', 4, '0.5', 'G1', 0);
INSERT INTO `course` VALUES (14, '大学生职业发展与就业指导', 4, '1', 'G5', 0);
INSERT INTO `course` VALUES (15, '创新创业', 4, '1', 'G7', 0);
INSERT INTO `course` VALUES (20, '的风格dd', 2, '0.5', '21·3', 1);

-- ----------------------------
-- Table structure for course_type
-- ----------------------------
DROP TABLE IF EXISTS `course_type`;
CREATE TABLE `course_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程类型名字',
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '唯一标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_type
-- ----------------------------
INSERT INTO `course_type` VALUES (1, '公共课', '9515CB30C62C42BBBF9190F5C59EA3D0');
INSERT INTO `course_type` VALUES (2, '选修课', 'F74BB419B6094373BC6E9798D41D7032');
INSERT INTO `course_type` VALUES (3, '必修课', '3B0CEBB977B148AD86AB5E3F03B39D84');
INSERT INTO `course_type` VALUES (4, '人文素质', 'BC85509CAC2C4333AFD392F7C82900C1');

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
  `plan_group_id` int(11) NULL DEFAULT NULL COMMENT '分组id',
  `teacher_id` bigint(22) NULL DEFAULT NULL COMMENT '老师id',
  `classroom_id` int(11) NULL DEFAULT NULL COMMENT '教室id',
  `up_time` int(11) NULL DEFAULT NULL COMMENT '上课时间',
  `week` int(11) NULL DEFAULT NULL COMMENT '星期几',
  PRIMARY KEY (`order_id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `second_course_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_course
-- ----------------------------
INSERT INTO `order_course` VALUES (25, 1, 12, 8, 76, 140, 1, 2, 3);
INSERT INTO `order_course` VALUES (27, 1, 9, 17, 86, 134, 2, 3, 1);
INSERT INTO `order_course` VALUES (29, 1, 12, 18, 86, 140, 4, 3, 1);

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
  `up_time_two` int(11) NULL DEFAULT NULL COMMENT '上课时间 如果是 第一节课和第二节课连在一起，则需要填写该值，如果默认一节课，则默认0',
  `week` int(11) NULL DEFAULT NULL COMMENT '星期几',
  `state` int(1) NULL DEFAULT NULL COMMENT '发布状态  0 未发布 1 发布',
  `plan_group_id` int(11) NULL DEFAULT NULL COMMENT '分组id',
  `classroom_id` int(11) NULL DEFAULT NULL COMMENT '教室id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `teacher`(`teacher`) USING BTREE,
  INDEX `second_course_ibfk_1`(`plan_group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of second_course
-- ----------------------------
INSERT INTO `second_course` VALUES (1, 10, 134, 6, 1, 0, 1, 0, 70, 6);
INSERT INTO `second_course` VALUES (2, 10, 134, 1, 1, 0, 1, 0, 72, 6);
INSERT INTO `second_course` VALUES (3, 11, 134, 4, 3, 0, 1, 0, 72, 6);
INSERT INTO `second_course` VALUES (4, 12, 134, 1, 3, 0, 3, 0, 72, 2);
INSERT INTO `second_course` VALUES (5, 12, 140, 1, 6, 0, 1, 0, 73, 2);
INSERT INTO `second_course` VALUES (6, 12, 140, 1, 6, 0, 5, 0, 74, 2);
INSERT INTO `second_course` VALUES (7, 10, 134, 99, 5, 6, 1, 0, 75, 1);
INSERT INTO `second_course` VALUES (8, 12, 140, 100, 2, 0, 3, 0, 76, 1);
INSERT INTO `second_course` VALUES (9, 10, 134, 1, 1, 0, 1, 0, 77, 4);
INSERT INTO `second_course` VALUES (10, 11, 134, 2, 2, 0, 1, 0, 79, 2);
INSERT INTO `second_course` VALUES (11, 9, 140, 500, 1, 0, 1, 0, 81, 1);
INSERT INTO `second_course` VALUES (12, 12, 134, 200, 5, 6, 1, 0, 81, 10);
INSERT INTO `second_course` VALUES (13, 9, 140, 1, 3, 4, 1, 0, 83, 1);
INSERT INTO `second_course` VALUES (14, 10, 134, 1, 2, 0, 6, 0, 84, 1);
INSERT INTO `second_course` VALUES (15, 9, 134, 1, 3, 0, 4, 0, 85, 6);
INSERT INTO `second_course` VALUES (16, 10, 140, 1, 1, 0, 7, 0, 85, 2);
INSERT INTO `second_course` VALUES (17, 9, 134, 1, 3, 0, 1, 0, 86, 2);
INSERT INTO `second_course` VALUES (18, 12, 140, 2, 3, 0, 1, 0, 86, 4);

-- ----------------------------
-- Table structure for second_course_plan_group
-- ----------------------------
DROP TABLE IF EXISTS `second_course_plan_group`;
CREATE TABLE `second_course_plan_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(5) NULL DEFAULT NULL COMMENT '年份',
  `up_or_down` int(1) NULL DEFAULT NULL COMMENT '9 上学期  10 下学期',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `state` int(1) NULL DEFAULT 0 COMMENT '计划状态  0 未开始  1  进行中  2 已结束',
  `sum` int(11) NULL DEFAULT NULL COMMENT '第几次选课',
  `release_state` int(1) NULL DEFAULT 0 COMMENT '发布状态  0 未发布 1 发布',
  `unit_id` int(11) NULL DEFAULT NULL COMMENT '添加部门',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 87 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of second_course_plan_group
-- ----------------------------
INSERT INTO `second_course_plan_group` VALUES (83, 2022, 9, '2022-04-13 13:40:32', '2022-04-13 13:50:32', 0, 1, 1, 31);
INSERT INTO `second_course_plan_group` VALUES (84, 2022, 9, '2022-04-13 13:49:27', '2022-04-13 15:59:27', 0, 2, 1, 31);
INSERT INTO `second_course_plan_group` VALUES (85, 2022, 9, '2022-04-29 00:00:00', '2022-04-30 00:00:00', 0, 3, 0, 31);
INSERT INTO `second_course_plan_group` VALUES (86, 2022, 9, '2022-05-20 15:30:04', '2022-05-20 17:26:04', 0, 4, 1, 31);

-- ----------------------------
-- Table structure for second_course_plan_group_and_unit
-- ----------------------------
DROP TABLE IF EXISTS `second_course_plan_group_and_unit`;
CREATE TABLE `second_course_plan_group_and_unit`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '抢课计划分组和部门关系表',
  `unit_id` int(11) NULL DEFAULT NULL COMMENT '部门id',
  `scpg_id` int(11) NULL DEFAULT NULL COMMENT '计划分组id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `second_course_plan_group_and_unit_ibfk_1`(`scpg_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 517 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of second_course_plan_group_and_unit
-- ----------------------------
INSERT INTO `second_course_plan_group_and_unit` VALUES (454, 31, 80);
INSERT INTO `second_course_plan_group_and_unit` VALUES (455, 1, 80);
INSERT INTO `second_course_plan_group_and_unit` VALUES (456, 32, 80);
INSERT INTO `second_course_plan_group_and_unit` VALUES (457, 2, 80);
INSERT INTO `second_course_plan_group_and_unit` VALUES (458, 3, 80);
INSERT INTO `second_course_plan_group_and_unit` VALUES (459, 33, 80);
INSERT INTO `second_course_plan_group_and_unit` VALUES (460, 34, 80);
INSERT INTO `second_course_plan_group_and_unit` VALUES (461, 35, 80);
INSERT INTO `second_course_plan_group_and_unit` VALUES (462, 36, 80);
INSERT INTO `second_course_plan_group_and_unit` VALUES (481, 31, 83);
INSERT INTO `second_course_plan_group_and_unit` VALUES (482, 1, 83);
INSERT INTO `second_course_plan_group_and_unit` VALUES (483, 32, 83);
INSERT INTO `second_course_plan_group_and_unit` VALUES (484, 2, 83);
INSERT INTO `second_course_plan_group_and_unit` VALUES (485, 3, 83);
INSERT INTO `second_course_plan_group_and_unit` VALUES (486, 33, 83);
INSERT INTO `second_course_plan_group_and_unit` VALUES (487, 34, 83);
INSERT INTO `second_course_plan_group_and_unit` VALUES (488, 35, 83);
INSERT INTO `second_course_plan_group_and_unit` VALUES (489, 36, 83);
INSERT INTO `second_course_plan_group_and_unit` VALUES (490, 31, 84);
INSERT INTO `second_course_plan_group_and_unit` VALUES (491, 1, 84);
INSERT INTO `second_course_plan_group_and_unit` VALUES (492, 32, 84);
INSERT INTO `second_course_plan_group_and_unit` VALUES (493, 2, 84);
INSERT INTO `second_course_plan_group_and_unit` VALUES (494, 3, 84);
INSERT INTO `second_course_plan_group_and_unit` VALUES (495, 33, 84);
INSERT INTO `second_course_plan_group_and_unit` VALUES (496, 34, 84);
INSERT INTO `second_course_plan_group_and_unit` VALUES (497, 35, 84);
INSERT INTO `second_course_plan_group_and_unit` VALUES (498, 36, 84);
INSERT INTO `second_course_plan_group_and_unit` VALUES (499, 31, 85);
INSERT INTO `second_course_plan_group_and_unit` VALUES (500, 1, 85);
INSERT INTO `second_course_plan_group_and_unit` VALUES (501, 32, 85);
INSERT INTO `second_course_plan_group_and_unit` VALUES (502, 2, 85);
INSERT INTO `second_course_plan_group_and_unit` VALUES (503, 3, 85);
INSERT INTO `second_course_plan_group_and_unit` VALUES (504, 33, 85);
INSERT INTO `second_course_plan_group_and_unit` VALUES (505, 34, 85);
INSERT INTO `second_course_plan_group_and_unit` VALUES (506, 35, 85);
INSERT INTO `second_course_plan_group_and_unit` VALUES (507, 36, 85);
INSERT INTO `second_course_plan_group_and_unit` VALUES (508, 31, 86);
INSERT INTO `second_course_plan_group_and_unit` VALUES (509, 1, 86);
INSERT INTO `second_course_plan_group_and_unit` VALUES (510, 32, 86);
INSERT INTO `second_course_plan_group_and_unit` VALUES (511, 2, 86);
INSERT INTO `second_course_plan_group_and_unit` VALUES (512, 3, 86);
INSERT INTO `second_course_plan_group_and_unit` VALUES (513, 33, 86);
INSERT INTO `second_course_plan_group_and_unit` VALUES (514, 34, 86);
INSERT INTO `second_course_plan_group_and_unit` VALUES (515, 35, 86);
INSERT INTO `second_course_plan_group_and_unit` VALUES (516, 36, 86);

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
) ENGINE = InnoDB AUTO_INCREMENT = 9961 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `sys_log` VALUES (9628, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-12 17:26:23');
INSERT INTO `sys_log` VALUES (9629, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-14 08:33:52');
INSERT INTO `sys_log` VALUES (9630, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-14 08:41:12');
INSERT INTO `sys_log` VALUES (9631, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-14 08:52:59');
INSERT INTO `sys_log` VALUES (9632, 'lyt', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9633, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-14 08:53:10');
INSERT INTO `sys_log` VALUES (9634, 'lyt', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9635, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-14 08:53:26');
INSERT INTO `sys_log` VALUES (9636, 'lyt', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9637, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-14 08:55:03');
INSERT INTO `sys_log` VALUES (9638, 'admin', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9639, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-14 08:55:08');
INSERT INTO `sys_log` VALUES (9640, 'admin', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9641, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-14 08:56:10');
INSERT INTO `sys_log` VALUES (9642, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-14 08:56:29');
INSERT INTO `sys_log` VALUES (9643, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-14 09:05:30');
INSERT INTO `sys_log` VALUES (9644, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-14 09:09:01');
INSERT INTO `sys_log` VALUES (9645, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-14 09:57:50');
INSERT INTO `sys_log` VALUES (9646, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-14 09:58:23');
INSERT INTO `sys_log` VALUES (9647, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-14 10:36:13');
INSERT INTO `sys_log` VALUES (9648, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-14 11:15:33');
INSERT INTO `sys_log` VALUES (9649, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-14 11:24:09');
INSERT INTO `sys_log` VALUES (9650, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-14 13:04:36');
INSERT INTO `sys_log` VALUES (9651, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-14 13:13:53');
INSERT INTO `sys_log` VALUES (9652, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-14 14:30:11');
INSERT INTO `sys_log` VALUES (9653, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-14 16:23:24');
INSERT INTO `sys_log` VALUES (9654, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-14 16:57:32');
INSERT INTO `sys_log` VALUES (9655, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-14 17:19:44');
INSERT INTO `sys_log` VALUES (9656, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-15 08:37:30');
INSERT INTO `sys_log` VALUES (9657, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-15 08:51:49');
INSERT INTO `sys_log` VALUES (9658, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-15 08:59:26');
INSERT INTO `sys_log` VALUES (9659, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-15 10:58:42');
INSERT INTO `sys_log` VALUES (9660, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-15 14:19:35');
INSERT INTO `sys_log` VALUES (9661, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-15 14:27:01');
INSERT INTO `sys_log` VALUES (9662, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-16 08:37:48');
INSERT INTO `sys_log` VALUES (9663, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-16 08:40:34');
INSERT INTO `sys_log` VALUES (9664, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-16 08:43:06');
INSERT INTO `sys_log` VALUES (9665, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-16 08:44:14');
INSERT INTO `sys_log` VALUES (9666, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-16 09:08:49');
INSERT INTO `sys_log` VALUES (9667, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-16 10:21:17');
INSERT INTO `sys_log` VALUES (9668, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-16 13:31:48');
INSERT INTO `sys_log` VALUES (9669, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-16 13:34:13');
INSERT INTO `sys_log` VALUES (9670, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-16 17:24:16');
INSERT INTO `sys_log` VALUES (9671, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-17 08:35:28');
INSERT INTO `sys_log` VALUES (9672, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-17 09:29:40');
INSERT INTO `sys_log` VALUES (9673, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-17 10:55:34');
INSERT INTO `sys_log` VALUES (9674, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-17 13:02:56');
INSERT INTO `sys_log` VALUES (9675, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-17 15:21:44');
INSERT INTO `sys_log` VALUES (9676, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-17 15:48:06');
INSERT INTO `sys_log` VALUES (9677, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-17 15:49:40');
INSERT INTO `sys_log` VALUES (9678, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-17 15:58:43');
INSERT INTO `sys_log` VALUES (9679, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-17 16:09:37');
INSERT INTO `sys_log` VALUES (9680, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-18 08:31:56');
INSERT INTO `sys_log` VALUES (9681, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-18 08:49:32');
INSERT INTO `sys_log` VALUES (9682, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-18 10:13:08');
INSERT INTO `sys_log` VALUES (9683, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-18 10:13:59');
INSERT INTO `sys_log` VALUES (9684, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-18 11:48:45');
INSERT INTO `sys_log` VALUES (9685, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-18 11:51:43');
INSERT INTO `sys_log` VALUES (9686, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-21 08:35:48');
INSERT INTO `sys_log` VALUES (9687, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-21 10:00:27');
INSERT INTO `sys_log` VALUES (9688, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.201', '2022-02-21 10:35:44');
INSERT INTO `sys_log` VALUES (9689, 'liuzhao', '登录平台', NULL, NULL, 0, '192.168.6.201', '2022-02-21 10:37:16');
INSERT INTO `sys_log` VALUES (9690, 'liuzhao', '登录平台', NULL, NULL, 0, '192.168.6.201', '2022-02-21 10:39:24');
INSERT INTO `sys_log` VALUES (9691, 'liuzhao', '登录平台', NULL, NULL, 0, '192.168.6.201', '2022-02-21 10:42:23');
INSERT INTO `sys_log` VALUES (9692, 'liuzhao', '登录平台', NULL, NULL, 0, '192.168.6.201', '2022-02-21 11:08:25');
INSERT INTO `sys_log` VALUES (9693, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-21 11:17:55');
INSERT INTO `sys_log` VALUES (9694, 'liuzhao', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-21 11:50:44');
INSERT INTO `sys_log` VALUES (9695, 'liuzhao', '登录平台', NULL, NULL, 0, '192.168.6.201', '2022-02-21 11:51:48');
INSERT INTO `sys_log` VALUES (9696, 'liuzhao', '登录平台', NULL, NULL, 0, '192.168.6.201', '2022-02-21 11:52:04');
INSERT INTO `sys_log` VALUES (9697, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-21 11:55:36');
INSERT INTO `sys_log` VALUES (9698, 'liuzhao', '登录平台', NULL, NULL, 0, '192.168.6.201', '2022-02-21 12:54:24');
INSERT INTO `sys_log` VALUES (9699, 'liuzhao', '登录平台', NULL, NULL, 0, '192.168.6.201', '2022-02-21 13:24:04');
INSERT INTO `sys_log` VALUES (9700, 'liuzhao', '登录平台', NULL, NULL, 0, '192.168.6.201', '2022-02-21 14:20:00');
INSERT INTO `sys_log` VALUES (9701, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-21 16:26:36');
INSERT INTO `sys_log` VALUES (9702, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-21 16:26:48');
INSERT INTO `sys_log` VALUES (9703, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-22 08:32:25');
INSERT INTO `sys_log` VALUES (9704, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-22 09:55:49');
INSERT INTO `sys_log` VALUES (9705, 'admin', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9706, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-22 10:13:02');
INSERT INTO `sys_log` VALUES (9707, 'admin', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9708, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-22 10:13:15');
INSERT INTO `sys_log` VALUES (9709, 'admin', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9710, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-22 10:13:55');
INSERT INTO `sys_log` VALUES (9711, 'admin', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9712, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-22 10:15:54');
INSERT INTO `sys_log` VALUES (9713, 'lyt', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9714, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-22 11:05:27');
INSERT INTO `sys_log` VALUES (9715, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-22 11:48:18');
INSERT INTO `sys_log` VALUES (9716, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-22 11:55:14');
INSERT INTO `sys_log` VALUES (9717, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-22 11:55:14');
INSERT INTO `sys_log` VALUES (9718, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-22 11:55:45');
INSERT INTO `sys_log` VALUES (9719, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-22 11:57:18');
INSERT INTO `sys_log` VALUES (9720, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-22 11:57:18');
INSERT INTO `sys_log` VALUES (9721, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2022-02-22 11:58:12');
INSERT INTO `sys_log` VALUES (9722, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2022-02-22 11:58:19');
INSERT INTO `sys_log` VALUES (9723, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-22 13:04:39');
INSERT INTO `sys_log` VALUES (9724, 'lyt', '用户 lyt 修改了 用户 lyt 的密码', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9725, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-22 13:14:27');
INSERT INTO `sys_log` VALUES (9726, 'admin', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9727, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-22 15:33:35');
INSERT INTO `sys_log` VALUES (9728, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2022-02-23 08:33:20');
INSERT INTO `sys_log` VALUES (9729, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-23 08:33:26');
INSERT INTO `sys_log` VALUES (9730, 'lyt', '用户 lyt 修改了 用户 lyt 的密码', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9731, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-23 08:36:03');
INSERT INTO `sys_log` VALUES (9732, 'lyt', '用户 lyt 修改了 用户 lyt 的密码', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9733, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2022-02-23 08:37:03');
INSERT INTO `sys_log` VALUES (9734, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2022-02-23 08:37:09');
INSERT INTO `sys_log` VALUES (9735, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2022-02-23 08:37:15');
INSERT INTO `sys_log` VALUES (9736, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-23 08:39:09');
INSERT INTO `sys_log` VALUES (9737, 'admin', '用户 admin 修改了 用户 admin 的密码', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9738, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-23 08:39:46');
INSERT INTO `sys_log` VALUES (9739, 'admin', '用户 admin 修改了 用户 admin 的密码', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9740, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-23 08:40:03');
INSERT INTO `sys_log` VALUES (9741, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-23 08:47:36');
INSERT INTO `sys_log` VALUES (9742, 'lyt', '用户 lyt 修改了 用户 lyt 的密码', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9743, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2022-02-23 08:48:53');
INSERT INTO `sys_log` VALUES (9744, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-23 08:48:57');
INSERT INTO `sys_log` VALUES (9745, 'lyt', '用户 lyt 修改了 用户 lyt 的密码', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9746, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-23 08:49:57');
INSERT INTO `sys_log` VALUES (9747, 'lyt', '用户 lyt 修改了 用户 lyt 的密码', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9748, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2022-02-23 08:50:13');
INSERT INTO `sys_log` VALUES (9749, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-23 08:50:16');
INSERT INTO `sys_log` VALUES (9750, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-23 11:41:56');
INSERT INTO `sys_log` VALUES (9751, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-23 13:03:22');
INSERT INTO `sys_log` VALUES (9752, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-23 14:07:40');
INSERT INTO `sys_log` VALUES (9753, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-23 14:32:03');
INSERT INTO `sys_log` VALUES (9754, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-23 14:33:29');
INSERT INTO `sys_log` VALUES (9755, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-23 14:34:03');
INSERT INTO `sys_log` VALUES (9756, 'lz', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-23 14:37:01');
INSERT INTO `sys_log` VALUES (9757, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-23 14:54:41');
INSERT INTO `sys_log` VALUES (9758, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-23 15:28:10');
INSERT INTO `sys_log` VALUES (9759, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-23 15:36:46');
INSERT INTO `sys_log` VALUES (9760, 'lz', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-23 15:37:48');
INSERT INTO `sys_log` VALUES (9761, 'lz', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9762, 'lz', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-23 16:47:40');
INSERT INTO `sys_log` VALUES (9763, 'lz', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9764, 'lz', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-23 17:07:33');
INSERT INTO `sys_log` VALUES (9765, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-23 17:29:11');
INSERT INTO `sys_log` VALUES (9766, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-24 08:34:45');
INSERT INTO `sys_log` VALUES (9767, 'lz', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-24 09:05:44');
INSERT INTO `sys_log` VALUES (9768, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-24 11:08:43');
INSERT INTO `sys_log` VALUES (9769, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-24 11:09:28');
INSERT INTO `sys_log` VALUES (9770, 'lz', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-24 11:09:42');
INSERT INTO `sys_log` VALUES (9771, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-24 11:13:56');
INSERT INTO `sys_log` VALUES (9772, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-02-24 11:36:09');
INSERT INTO `sys_log` VALUES (9773, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-24 11:36:14');
INSERT INTO `sys_log` VALUES (9774, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-24 11:36:39');
INSERT INTO `sys_log` VALUES (9775, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-24 11:39:11');
INSERT INTO `sys_log` VALUES (9776, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-24 11:45:08');
INSERT INTO `sys_log` VALUES (9777, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-24 13:04:48');
INSERT INTO `sys_log` VALUES (9778, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-24 13:04:48');
INSERT INTO `sys_log` VALUES (9779, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-24 13:10:52');
INSERT INTO `sys_log` VALUES (9780, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-24 13:35:20');
INSERT INTO `sys_log` VALUES (9781, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-24 13:59:38');
INSERT INTO `sys_log` VALUES (9782, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-24 15:22:10');
INSERT INTO `sys_log` VALUES (9783, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-24 15:22:40');
INSERT INTO `sys_log` VALUES (9784, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-24 15:30:03');
INSERT INTO `sys_log` VALUES (9785, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-24 15:59:10');
INSERT INTO `sys_log` VALUES (9786, 'lyt', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9787, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-24 16:23:19');
INSERT INTO `sys_log` VALUES (9788, 'admin', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9789, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-24 16:48:21');
INSERT INTO `sys_log` VALUES (9790, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-24 17:19:48');
INSERT INTO `sys_log` VALUES (9791, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-24 17:20:53');
INSERT INTO `sys_log` VALUES (9792, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-24 17:22:06');
INSERT INTO `sys_log` VALUES (9793, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-24 17:24:27');
INSERT INTO `sys_log` VALUES (9794, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-25 09:26:52');
INSERT INTO `sys_log` VALUES (9795, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-25 10:38:49');
INSERT INTO `sys_log` VALUES (9796, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-25 10:44:39');
INSERT INTO `sys_log` VALUES (9797, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-25 11:59:54');
INSERT INTO `sys_log` VALUES (9798, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-25 17:09:00');
INSERT INTO `sys_log` VALUES (9799, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-26 08:37:02');
INSERT INTO `sys_log` VALUES (9800, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-26 09:28:48');
INSERT INTO `sys_log` VALUES (9801, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-26 14:07:15');
INSERT INTO `sys_log` VALUES (9802, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-28 08:35:09');
INSERT INTO `sys_log` VALUES (9803, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-28 11:52:21');
INSERT INTO `sys_log` VALUES (9804, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-02-28 13:51:34');
INSERT INTO `sys_log` VALUES (9805, 'lz', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-02-28 14:14:28');
INSERT INTO `sys_log` VALUES (9806, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-03-01 13:09:50');
INSERT INTO `sys_log` VALUES (9807, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-02 09:28:33');
INSERT INTO `sys_log` VALUES (9808, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-02 10:10:32');
INSERT INTO `sys_log` VALUES (9809, 'lz', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-02 11:03:45');
INSERT INTO `sys_log` VALUES (9810, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-03-02 13:05:47');
INSERT INTO `sys_log` VALUES (9811, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-03-02 13:38:28');
INSERT INTO `sys_log` VALUES (9812, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-02 14:37:32');
INSERT INTO `sys_log` VALUES (9813, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-03-02 14:56:00');
INSERT INTO `sys_log` VALUES (9814, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-02 15:40:05');
INSERT INTO `sys_log` VALUES (9815, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-03-03 08:37:52');
INSERT INTO `sys_log` VALUES (9816, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-03-03 08:46:39');
INSERT INTO `sys_log` VALUES (9817, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-03 10:51:51');
INSERT INTO `sys_log` VALUES (9818, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-03-03 13:06:09');
INSERT INTO `sys_log` VALUES (9819, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-03 13:42:57');
INSERT INTO `sys_log` VALUES (9820, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-03 16:34:31');
INSERT INTO `sys_log` VALUES (9821, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-03-04 08:37:50');
INSERT INTO `sys_log` VALUES (9822, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-04 09:38:06');
INSERT INTO `sys_log` VALUES (9823, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-04 09:52:38');
INSERT INTO `sys_log` VALUES (9824, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-04 10:40:58');
INSERT INTO `sys_log` VALUES (9825, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-04 10:40:58');
INSERT INTO `sys_log` VALUES (9826, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-04 10:40:58');
INSERT INTO `sys_log` VALUES (9827, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-03-04 17:10:44');
INSERT INTO `sys_log` VALUES (9828, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-03-07 08:36:20');
INSERT INTO `sys_log` VALUES (9829, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-03-07 09:00:38');
INSERT INTO `sys_log` VALUES (9830, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-07 09:01:06');
INSERT INTO `sys_log` VALUES (9831, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-07 09:10:53');
INSERT INTO `sys_log` VALUES (9832, 'admin', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9833, 'admin', '登录平台', NULL, NULL, 0, '221.12.76.42', '2022-03-07 11:54:03');
INSERT INTO `sys_log` VALUES (9834, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-07 13:07:32');
INSERT INTO `sys_log` VALUES (9835, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.201', '2022-03-07 13:27:27');
INSERT INTO `sys_log` VALUES (9836, 'liuzhao', '登录平台', NULL, NULL, 0, '192.168.6.201', '2022-03-07 13:28:15');
INSERT INTO `sys_log` VALUES (9837, 'liuzhao', '用户 liuzhao 修改了 用户 liuzhao 的密码', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9838, 'liuzhao', '登录平台', NULL, NULL, 0, '192.168.6.201', '2022-03-07 13:31:05');
INSERT INTO `sys_log` VALUES (9839, 'admin', '登录平台', NULL, NULL, 0, '221.12.76.42', '2022-03-07 13:44:12');
INSERT INTO `sys_log` VALUES (9840, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-07 14:00:32');
INSERT INTO `sys_log` VALUES (9841, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-03-07 14:05:55');
INSERT INTO `sys_log` VALUES (9842, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-07 14:23:34');
INSERT INTO `sys_log` VALUES (9843, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-03-07 14:27:40');
INSERT INTO `sys_log` VALUES (9844, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-03-07 14:27:46');
INSERT INTO `sys_log` VALUES (9845, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-07 14:27:51');
INSERT INTO `sys_log` VALUES (9846, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-07 14:55:15');
INSERT INTO `sys_log` VALUES (9847, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-07 15:13:54');
INSERT INTO `sys_log` VALUES (9848, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-03-07 15:14:01');
INSERT INTO `sys_log` VALUES (9849, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-07 15:14:14');
INSERT INTO `sys_log` VALUES (9850, 'lxl', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-07 15:22:02');
INSERT INTO `sys_log` VALUES (9851, 'lxl', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-07 15:22:04');
INSERT INTO `sys_log` VALUES (9852, 'lxl', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-07 15:25:18');
INSERT INTO `sys_log` VALUES (9853, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-07 15:26:13');
INSERT INTO `sys_log` VALUES (9854, 'lxl', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-07 15:50:20');
INSERT INTO `sys_log` VALUES (9855, 'lxl', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9856, 'lxl', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-07 15:50:53');
INSERT INTO `sys_log` VALUES (9857, 'lxl', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9858, 'lxl', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-07 15:56:43');
INSERT INTO `sys_log` VALUES (9859, 'lxl', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9860, 'lxl', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-07 16:09:21');
INSERT INTO `sys_log` VALUES (9861, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-07 16:27:55');
INSERT INTO `sys_log` VALUES (9862, 'lxl', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-07 16:51:27');
INSERT INTO `sys_log` VALUES (9863, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-03-08 08:33:25');
INSERT INTO `sys_log` VALUES (9864, 'lxl', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-08 08:34:42');
INSERT INTO `sys_log` VALUES (9865, 'lxl', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9866, 'lxl', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9867, 'lxl', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9868, 'lxl', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9869, 'lxl', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9870, 'lxl', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9871, 'lxl', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9872, 'lyt', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9873, 'lxl', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9874, 'lxl', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9875, 'lxl', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9876, 'lyt', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9877, 'lyt', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9878, 'lxl', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9879, 'lxl', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9880, 'lxl', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9881, 'lyt', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9882, 'lxl', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-08 08:57:30');
INSERT INTO `sys_log` VALUES (9883, 'lxl', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-08 08:57:30');
INSERT INTO `sys_log` VALUES (9884, 'lxl', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9885, 'lyt', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9886, 'lyt', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9887, 'lyt', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9888, 'lyt', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9889, 'lyt', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9890, 'lyt', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9891, 'lyt', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9892, 'lxl', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-08 09:10:27');
INSERT INTO `sys_log` VALUES (9893, 'lxl', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9894, 'lxl', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9895, 'lxl', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9896, 'lxl', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-08 09:11:46');
INSERT INTO `sys_log` VALUES (9897, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-08 09:12:58');
INSERT INTO `sys_log` VALUES (9898, 'lxl', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9899, 'lxl', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-08 09:14:21');
INSERT INTO `sys_log` VALUES (9900, 'lxl', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-08 09:14:39');
INSERT INTO `sys_log` VALUES (9901, 'lxl', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9902, 'lxl', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9903, 'lxl', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-08 09:15:08');
INSERT INTO `sys_log` VALUES (9904, 'lxl', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-08 09:21:30');
INSERT INTO `sys_log` VALUES (9905, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-08 09:22:54');
INSERT INTO `sys_log` VALUES (9906, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-08 09:25:58');
INSERT INTO `sys_log` VALUES (9907, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-08 09:38:29');
INSERT INTO `sys_log` VALUES (9908, 'lxl', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-08 09:41:24');
INSERT INTO `sys_log` VALUES (9909, 'lxl', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-08 09:48:33');
INSERT INTO `sys_log` VALUES (9910, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-08 09:48:54');
INSERT INTO `sys_log` VALUES (9911, 'lxl', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-08 09:49:07');
INSERT INTO `sys_log` VALUES (9912, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-08 10:20:12');
INSERT INTO `sys_log` VALUES (9913, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-08 10:21:20');
INSERT INTO `sys_log` VALUES (9914, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-08 10:22:47');
INSERT INTO `sys_log` VALUES (9915, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-03-08 10:46:24');
INSERT INTO `sys_log` VALUES (9916, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-08 11:24:30');
INSERT INTO `sys_log` VALUES (9917, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-08 11:25:14');
INSERT INTO `sys_log` VALUES (9918, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-08 11:26:23');
INSERT INTO `sys_log` VALUES (9919, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-08 11:26:23');
INSERT INTO `sys_log` VALUES (9920, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-08 11:27:03');
INSERT INTO `sys_log` VALUES (9921, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-08 14:39:03');
INSERT INTO `sys_log` VALUES (9922, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-03-08 14:39:29');
INSERT INTO `sys_log` VALUES (9923, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-08 15:11:03');
INSERT INTO `sys_log` VALUES (9924, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-03-08 15:11:20');
INSERT INTO `sys_log` VALUES (9925, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-03-09 08:36:35');
INSERT INTO `sys_log` VALUES (9926, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.44', '2022-03-09 09:19:04');
INSERT INTO `sys_log` VALUES (9927, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-09 09:19:11');
INSERT INTO `sys_log` VALUES (9928, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-03-09 10:31:54');
INSERT INTO `sys_log` VALUES (9929, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-03-09 10:33:10');
INSERT INTO `sys_log` VALUES (9930, 'lyt', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9931, 'lyt', '非法访问', NULL, NULL, 0, NULL, NULL);
INSERT INTO `sys_log` VALUES (9932, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-03-11 09:23:51');
INSERT INTO `sys_log` VALUES (9933, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-03-11 09:26:14');
INSERT INTO `sys_log` VALUES (9934, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-03-11 09:28:38');
INSERT INTO `sys_log` VALUES (9935, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-03-11 09:30:00');
INSERT INTO `sys_log` VALUES (9936, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-03-11 09:33:04');
INSERT INTO `sys_log` VALUES (9937, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-03-11 09:38:29');
INSERT INTO `sys_log` VALUES (9938, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-03-11 09:51:18');
INSERT INTO `sys_log` VALUES (9939, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-03-11 09:53:20');
INSERT INTO `sys_log` VALUES (9940, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2022-03-11 14:23:48');
INSERT INTO `sys_log` VALUES (9941, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2022-03-11 14:23:57');
INSERT INTO `sys_log` VALUES (9942, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2022-03-11 14:24:02');
INSERT INTO `sys_log` VALUES (9943, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2022-03-11 14:24:08');
INSERT INTO `sys_log` VALUES (9944, NULL, '尝试登录', NULL, NULL, 0, '192.168.6.105', '2022-03-11 14:25:02');
INSERT INTO `sys_log` VALUES (9945, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-04-08 10:42:27');
INSERT INTO `sys_log` VALUES (9946, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-04-08 10:42:28');
INSERT INTO `sys_log` VALUES (9947, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-04-08 10:43:18');
INSERT INTO `sys_log` VALUES (9948, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-04-09 14:38:21');
INSERT INTO `sys_log` VALUES (9949, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-04-09 14:38:21');
INSERT INTO `sys_log` VALUES (9950, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-04-09 14:43:18');
INSERT INTO `sys_log` VALUES (9951, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-04-09 14:56:27');
INSERT INTO `sys_log` VALUES (9952, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-04-11 15:25:04');
INSERT INTO `sys_log` VALUES (9953, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-04-11 15:25:04');
INSERT INTO `sys_log` VALUES (9954, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-04-12 14:58:38');
INSERT INTO `sys_log` VALUES (9955, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-04-13 13:08:21');
INSERT INTO `sys_log` VALUES (9956, 'admin', '登录平台', NULL, NULL, 0, '192.168.6.44', '2022-04-13 13:33:44');
INSERT INTO `sys_log` VALUES (9957, 'lyt', '登录平台', NULL, NULL, 0, '192.168.6.105', '2022-04-13 13:46:36');
INSERT INTO `sys_log` VALUES (9958, NULL, '尝试登录', NULL, NULL, 0, '192.168.3.44', '2022-05-20 15:25:12');
INSERT INTO `sys_log` VALUES (9959, NULL, '尝试登录', NULL, NULL, 0, '192.168.3.44', '2022-05-20 15:25:17');
INSERT INTO `sys_log` VALUES (9960, 'admin', '登录平台', NULL, NULL, 0, '192.168.3.44', '2022-05-20 15:25:44');

-- ----------------------------
-- Table structure for sys_log_cloud
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_cloud`;
CREATE TABLE `sys_log_cloud`  (
  `id` bigint(20) NOT NULL,
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '日志标题',
  `service_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务ID',
  `remote_addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求URI',
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作方式',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '操作提交的数据',
  `time` bigint(20) NULL DEFAULT NULL COMMENT '执行时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标记',
  `exception` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_log_create_by`(`create_by`) USING BTREE,
  INDEX `sys_log_request_uri`(`request_uri`) USING BTREE,
  INDEX `sys_log_type`(`type`) USING BTREE,
  INDEX `sys_log_create_date`(`create_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_log_cloud
-- ----------------------------
INSERT INTO `sys_log_cloud` VALUES (1494129451636715522, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', NULL, '2022-02-17 09:59:56', '2022-02-17 09:59:56', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494129501251137538, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', NULL, '2022-02-17 10:00:07', '2022-02-17 10:00:07', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494129524575662081, '9', '登录失败', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', '用户名或密码错误', '2022-02-17 10:00:13', '2022-02-17 10:00:13', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494129548361560065, '9', '登录失败', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', '用户名或密码错误', '2022-02-17 10:00:19', '2022-02-17 10:00:19', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494130130883276802, '9', '登录失败', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', '用户名或密码错误', '2022-02-17 10:02:37', '2022-02-17 10:02:37', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494130503673016322, '9', '登录失败', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', '用户名或密码错误', '2022-02-17 10:04:06', '2022-02-17 10:04:06', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494130523071672321, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', NULL, '2022-02-17 10:04:11', '2022-02-17 10:04:11', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494130671818469377, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', NULL, '2022-02-17 10:04:46', '2022-02-17 10:04:46', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494130692878069762, '9', '登录失败', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin1%5D', 0, '0', '用户名或密码错误', '2022-02-17 10:04:51', '2022-02-17 10:04:51', 'admin1', 'admin1');
INSERT INTO `sys_log_cloud` VALUES (1494130722540187649, '9', '登录失败', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', '用户名或密码错误', '2022-02-17 10:04:59', '2022-02-17 10:04:59', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494130798180265985, '9', '登录失败', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', '用户名或密码错误', '2022-02-17 10:05:17', '2022-02-17 10:05:17', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494130942212665345, '9', '登录失败', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', '用户名或密码错误', '2022-02-17 10:05:51', '2022-02-17 10:05:51', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494136575389429762, '9', '登录失败', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', '用户名或密码错误', '2022-02-17 10:28:14', '2022-02-17 10:28:14', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494136779324878849, '9', '登录失败', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', '用户名或密码错误', '2022-02-17 10:29:03', '2022-02-17 10:29:03', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494136884442525698, '9', '登录失败', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', '用户名或密码错误', '2022-02-17 10:29:28', '2022-02-17 10:29:28', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494137545510973441, '9', '登录失败', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', '用户名或密码错误', '2022-02-17 10:32:05', '2022-02-17 10:32:05', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494137661970018306, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 10:32:33', '2022-02-17 10:32:33', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494138063184556033, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 10:34:09', '2022-02-17 10:34:09', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494138346497208321, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 10:35:16', '2022-02-17 10:35:16', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494138837063004161, '9', '登录失败', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi21%5D', 0, '0', '用户名或密码错误', '2022-02-17 10:37:13', '2022-02-17 10:37:13', 'ceshi21', 'ceshi21');
INSERT INTO `sys_log_cloud` VALUES (1494139834799845378, '9', '登录失败', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi21%5D', 0, '0', '用户名或密码错误', '2022-02-17 10:41:11', '2022-02-17 10:41:11', 'ceshi21', 'ceshi21');
INSERT INTO `sys_log_cloud` VALUES (1494140736378101761, '9', '登录失败', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi21%5D', 0, '0', '用户名或密码错误', '2022-02-17 10:44:46', '2022-02-17 10:44:46', 'ceshi21', 'ceshi21');
INSERT INTO `sys_log_cloud` VALUES (1494141358930255873, '9', '登录失败', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi21%5D', 0, '0', '用户名或密码错误', '2022-02-17 10:47:14', '2022-02-17 10:47:14', 'ceshi21', 'ceshi21');
INSERT INTO `sys_log_cloud` VALUES (1494141482372816898, '9', '登录失败', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', '用户名或密码错误', '2022-02-17 10:47:44', '2022-02-17 10:47:44', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494141650405023745, '9', '登录失败', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', '用户名或密码错误', '2022-02-17 10:48:24', '2022-02-17 10:48:24', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494141833972932610, '9', '登录失败', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', '用户名或密码错误', '2022-02-17 10:49:08', '2022-02-17 10:49:08', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494142028659941377, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 10:49:54', '2022-02-17 10:49:54', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494142490691887106, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', NULL, '2022-02-17 10:51:44', '2022-02-17 10:51:44', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494142546006368257, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 10:51:57', '2022-02-17 10:51:57', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494145759065530369, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 11:04:44', '2022-02-17 11:04:44', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494148338621210625, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 11:14:59', '2022-02-17 11:14:59', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494149411264126977, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 11:19:14', '2022-02-17 11:19:14', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494149968364167169, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 11:21:27', '2022-02-17 11:21:27', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494151845684305922, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 11:28:55', '2022-02-17 11:28:55', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494152329908314114, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 11:30:50', '2022-02-17 11:30:50', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494152416633937921, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 11:31:11', '2022-02-17 11:31:11', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494152419305709569, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 11:31:11', '2022-02-17 11:31:11', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494152421629353985, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 11:31:12', '2022-02-17 11:31:12', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494152423638425602, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 11:31:12', '2022-02-17 11:31:12', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494152425655885825, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 11:31:13', '2022-02-17 11:31:13', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494152427623014402, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 11:31:13', '2022-02-17 11:31:13', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494152429309124609, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 11:31:14', '2022-02-17 11:31:14', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494152431045566465, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 11:31:14', '2022-02-17 11:31:14', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494152432496795650, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 11:31:15', '2022-02-17 11:31:15', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494155839592849409, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 11:44:47', '2022-02-17 11:44:47', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494157203911860225, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 11:50:12', '2022-02-17 11:50:12', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494168916044345346, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 12:36:45', '2022-02-17 12:36:45', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494189933148069890, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 14:00:15', '2022-02-17 14:00:15', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494190712906932226, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 14:03:21', '2022-02-17 14:03:21', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494191012891942913, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 14:04:33', '2022-02-17 14:04:33', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494192352120627201, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 14:09:52', '2022-02-17 14:09:52', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494192381388480514, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 14:09:59', '2022-02-17 14:09:59', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494192409930719234, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 14:10:06', '2022-02-17 14:10:06', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494192428649897985, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 14:10:10', '2022-02-17 14:10:10', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494192438061916161, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 14:10:13', '2022-02-17 14:10:13', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494192440293285889, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 14:10:13', '2022-02-17 14:10:13', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494192442537238529, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 14:10:14', '2022-02-17 14:10:14', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494192444693110785, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 14:10:14', '2022-02-17 14:10:14', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494192447041921026, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 14:10:15', '2022-02-17 14:10:15', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494192710918168577, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 14:11:18', '2022-02-17 14:11:18', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494193335194181633, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 14:13:47', '2022-02-17 14:13:47', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494199414338736130, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 14:37:56', '2022-02-17 14:37:56', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494199415387312129, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 14:37:56', '2022-02-17 14:37:56', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494199417715150849, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 14:37:57', '2022-02-17 14:37:57', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494199419225100289, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 14:37:57', '2022-02-17 14:37:57', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494199424677695490, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 14:37:58', '2022-02-17 14:37:58', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494199427022311425, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 14:37:59', '2022-02-17 14:37:59', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494199429283041281, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 14:37:59', '2022-02-17 14:37:59', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494199431707348994, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 14:38:00', '2022-02-17 14:38:00', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494199434198765570, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 14:38:01', '2022-02-17 14:38:01', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494199920566063105, '9', '登录失败', 'pig', '192.168.6.201', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', '/oauth/token', 'POST', 'randomStr=%5B23441645079981281%5D&password=%5B123456%5D&code=%5B6%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', '用户名或密码错误', '2022-02-17 14:39:57', '2022-02-17 14:39:57', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494199984051048450, '9', '登录失败', 'pig', '192.168.6.201', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', '/oauth/token', 'POST', 'randomStr=%5B80731645079996615%5D&password=%5B123456%5D&code=%5B7%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', '用户名或密码错误', '2022-02-17 14:40:12', '2022-02-17 14:40:12', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494200205317361665, '9', '登录失败', 'pig', '192.168.6.201', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', '/oauth/token', 'POST', 'randomStr=%5B68661645080011741%5D&password=%5ByehdBPev%5D&code=%5B-3%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', '用户名或密码错误', '2022-02-17 14:41:05', '2022-02-17 14:41:05', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494200225470992385, '9', '登录失败', 'pig', '192.168.6.201', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', '/oauth/token', 'POST', 'randomStr=%5B38471645080064491%5D&password=%5ByehdBPev%5D&code=%5B4%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', '用户名或密码错误', '2022-02-17 14:41:09', '2022-02-17 14:41:09', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494200924502085633, '9', '登录失败', 'pig', '192.168.6.201', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', '/oauth/token', 'POST', 'randomStr=%5B68811645080227865%5D&password=%5Badmin1%5D&code=%5B2%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', '用户名或密码错误', '2022-02-17 14:43:56', '2022-02-17 14:43:56', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494200937101774850, '9', '登录失败', 'pig', '192.168.6.201', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', '/oauth/token', 'POST', 'randomStr=%5B68721645080235959%5D&password=%5Badmin1%5D&code=%5B0%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', '用户名或密码错误', '2022-02-17 14:43:59', '2022-02-17 14:43:59', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494201876265160706, '9', '登录失败', 'pig', '192.168.6.201', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', '/oauth/token', 'POST', 'randomStr=%5B72961645080458666%5D&password=%5B123456%5D&code=%5B12%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', '用户名或密码错误', '2022-02-17 14:47:43', '2022-02-17 14:47:43', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494201921647529985, '9', '登录失败', 'pig', '192.168.6.201', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', '/oauth/token', 'POST', 'randomStr=%5B12711645080462868%5D&password=%5B123456%5D&code=%5B-3%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', '用户名或密码错误', '2022-02-17 14:47:54', '2022-02-17 14:47:54', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494202006997422082, '9', '登录失败', 'pig', '192.168.6.201', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', '/oauth/token', 'POST', 'randomStr=%5B55011645080473693%5D&password=%5B123456%5D&code=%5B-6%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', '用户名或密码错误', '2022-02-17 14:48:14', '2022-02-17 14:48:14', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494202024718356481, '9', '登录失败', 'pig', '192.168.6.201', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', '/oauth/token', 'POST', 'randomStr=%5B89061645080494041%5D&password=%5B123456%5D&code=%5B45%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', '用户名或密码错误', '2022-02-17 14:48:18', '2022-02-17 14:48:18', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494202114912669698, '9', '登录失败', 'pig', '192.168.6.201', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', '/oauth/token', 'POST', 'randomStr=%5B90681645080498265%5D&password=%5B123456%5D&code=%5B11%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', '用户名或密码错误', '2022-02-17 14:48:40', '2022-02-17 14:48:40', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494202227835916290, '9', '登录失败', 'pig', '192.168.6.201', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', '/oauth/token', 'POST', 'randomStr=%5B30741645080519771%5D&password=%5B123456%5D&code=%5B16%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', '用户名或密码错误', '2022-02-17 14:49:07', '2022-02-17 14:49:07', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494202272517836801, '9', '登录失败', 'pig', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.80 Safari/537.36 Edg/98.0.1108.50', '/oauth/token', 'POST', 'randomStr=%5B77331645080549008%5D&password=%5B123456%5D&code=%5B5%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', '用户名或密码错误', '2022-02-17 14:49:17', '2022-02-17 14:49:17', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494202290389766146, '9', '登录失败', 'pig', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.80 Safari/537.36 Edg/98.0.1108.50', '/oauth/token', 'POST', 'randomStr=%5B66451645080557381%5D&password=%5B123456%5D&code=%5B0%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', '用户名或密码错误', '2022-02-17 14:49:22', '2022-02-17 14:49:22', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494202312250478594, '9', '登录失败', 'pig', '192.168.6.201', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', '/oauth/token', 'POST', 'randomStr=%5B86121645080546691%5D&password=%5B123456%5D&code=%5B32%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', '用户名或密码错误', '2022-02-17 14:49:27', '2022-02-17 14:49:27', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494206348609572865, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 15:05:29', '2022-02-17 15:05:29', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494206352745156610, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 15:05:30', '2022-02-17 15:05:30', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494206355563728897, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Bceshi2%5D', 0, '0', NULL, '2022-02-17 15:05:31', '2022-02-17 15:05:31', 'ceshi2', 'ceshi2');
INSERT INTO `sys_log_cloud` VALUES (1494207860047986690, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', NULL, '2022-02-17 15:11:30', '2022-02-17 15:11:30', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494208582642679810, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', NULL, '2022-02-17 15:14:22', '2022-02-17 15:14:22', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494209880993677314, '9', '登录失败', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', '用户名或密码错误', '2022-02-17 15:19:31', '2022-02-17 15:19:31', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494210872707497986, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', NULL, '2022-02-17 15:23:28', '2022-02-17 15:23:28', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494210973328850946, '9', '登录失败', 'test', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', '用户名或密码错误', '2022-02-17 15:23:52', '2022-02-17 15:23:52', 'test', 'test');
INSERT INTO `sys_log_cloud` VALUES (1494210993373429761, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', NULL, '2022-02-17 15:23:57', '2022-02-17 15:23:57', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494211105948549122, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', NULL, '2022-02-17 15:24:23', '2022-02-17 15:24:23', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494212237911457794, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', NULL, '2022-02-17 15:28:53', '2022-02-17 15:28:53', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494213164575858690, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', NULL, '2022-02-17 15:32:34', '2022-02-17 15:32:34', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494213860524126210, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', NULL, '2022-02-17 15:35:20', '2022-02-17 15:35:20', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494214152422543361, '9', '登录失败', 'test', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', '/oauth/token', 'POST', 'password=%5B9%03%EF%BF%BD%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', '用户名或密码错误', '2022-02-17 15:36:30', '2022-02-17 15:36:30', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494214187545645057, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', NULL, '2022-02-17 15:36:38', '2022-02-17 15:36:38', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494214845267038210, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', NULL, '2022-02-17 15:39:15', '2022-02-17 15:39:15', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494217690506694657, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', NULL, '2022-02-17 15:50:33', '2022-02-17 15:50:33', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494218065422884865, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', NULL, '2022-02-17 15:52:03', '2022-02-17 15:52:03', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494220060972064769, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', NULL, '2022-02-17 15:59:58', '2022-02-17 15:59:58', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494220169633898498, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', NULL, '2022-02-17 16:00:24', '2022-02-17 16:00:24', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494220503483719682, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', NULL, '2022-02-17 16:01:44', '2022-02-17 16:01:44', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494224990814380034, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', NULL, '2022-02-17 16:19:34', '2022-02-17 16:19:34', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494225060074921986, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', NULL, '2022-02-17 16:19:50', '2022-02-17 16:19:50', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494225852282478594, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', NULL, '2022-02-17 16:22:59', '2022-02-17 16:22:59', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494225854413185025, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', NULL, '2022-02-17 16:23:00', '2022-02-17 16:23:00', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494225856803938306, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', NULL, '2022-02-17 16:23:00', '2022-02-17 16:23:00', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494226659606306818, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', NULL, '2022-02-17 16:26:12', '2022-02-17 16:26:12', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494226712408399874, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', NULL, '2022-02-17 16:26:24', '2022-02-17 16:26:24', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494227148469215234, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', NULL, '2022-02-17 16:28:08', '2022-02-17 16:28:08', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494227201548132353, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', NULL, '2022-02-17 16:28:21', '2022-02-17 16:28:21', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494230375226974210, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', NULL, '2022-02-17 16:40:58', '2022-02-17 16:40:58', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494230405551792130, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', NULL, '2022-02-17 16:41:05', '2022-02-17 16:41:05', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494230410207469570, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', NULL, '2022-02-17 16:41:06', '2022-02-17 16:41:06', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494230626872631298, '9', '登录失败', 'admin', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/check_token', 'POST', 'token=%5B31aaf63d-d891-412f-87f5-feb8064c49a1%5D', 0, '0', '用户名或密码错误', '2022-02-17 16:41:58', '2022-02-17 16:41:58', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494231881980354562, '0', '登录成功', 'test', '192.168.6.44', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', NULL, '2022-02-17 16:46:57', '2022-02-17 16:46:57', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494231887030296578, '0', '登录成功', 'test', '192.168.6.44', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', NULL, '2022-02-17 16:46:58', '2022-02-17 16:46:58', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494231896673001474, '0', '登录成功', 'test', '127.0.0.1', 'PostmanRuntime/7.29.0', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', NULL, '2022-02-17 16:47:00', '2022-02-17 16:47:00', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494232122704072706, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', NULL, '2022-02-17 16:47:54', '2022-02-17 16:47:54', 'admin', 'admin');
INSERT INTO `sys_log_cloud` VALUES (1494232231735005186, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', '/oauth/token', 'POST', 'password=%5Badmin%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', 0, '0', NULL, '2022-02-17 16:48:20', '2022-02-17 16:48:20', 'admin', 'admin');

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
  `status` int(11) NULL DEFAULT NULL COMMENT '1 可用  0 不可用',
  `menu_type` int(11) NULL DEFAULT NULL COMMENT '增 1 删 2 改 3 查 4 详情 5 其它 6',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (2, 0, '基础管理', '/base', NULL, 0, NULL, 0, 1, 6);
INSERT INTO `sys_menu` VALUES (3, 2, '用户管理', '/user', NULL, 1, NULL, 0, 1, 6);
INSERT INTO `sys_menu` VALUES (4, 3, '学生列表', NULL, 'sys:student:list', 2, NULL, 1, 1, 4);
INSERT INTO `sys_menu` VALUES (6, 3, '学生删除', NULL, 'sys:student:delete', 2, NULL, 0, 1, 2);
INSERT INTO `sys_menu` VALUES (7, 3, '学生编辑', NULL, 'sys:student:update', 2, NULL, 0, 1, 3);
INSERT INTO `sys_menu` VALUES (8, 3, '学生详情', NULL, 'sys:student:info', 2, NULL, 0, 1, 5);
INSERT INTO `sys_menu` VALUES (9, 2, '部门管理', '/unit', '', 1, NULL, 1, 1, 6);
INSERT INTO `sys_menu` VALUES (11, 61, '更新密码', NULL, 'sys:user:password', 2, NULL, 0, 1, 6);
INSERT INTO `sys_menu` VALUES (12, 61, '更新个人密码', NULL, 'sys:my:password', 2, NULL, 0, 1, 6);
INSERT INTO `sys_menu` VALUES (13, 61, '重置密码', NULL, 'sys:user:reset', 2, NULL, 0, 1, 6);
INSERT INTO `sys_menu` VALUES (14, 2, '课程管理', '/course', NULL, 1, NULL, 2, 1, 6);
INSERT INTO `sys_menu` VALUES (15, 14, '课程集合', NULL, 'user:course:list', 2, '', 1, 1, 4);
INSERT INTO `sys_menu` VALUES (16, 14, '课程详情', NULL, 'user:course:info', 2, NULL, 1, 1, 5);
INSERT INTO `sys_menu` VALUES (17, 0, '课程表', '/classCourse', NULL, 1, NULL, 2, 1, 6);
INSERT INTO `sys_menu` VALUES (18, 17, '当前个人课程表', NULL, 'course:classSchedule:user:course', 2, NULL, 1, 1, 6);
INSERT INTO `sys_menu` VALUES (19, 3, '老师列表', '', 'sys:teacher:list', 2, NULL, 1, 1, 6);
INSERT INTO `sys_menu` VALUES (22, 9, '部门列表', NULL, 'sys:unit:tree:list', 2, NULL, 1, 1, 4);
INSERT INTO `sys_menu` VALUES (23, 9, '部门详情', NULL, 'sys:unit:info', 2, NULL, 1, 1, 5);
INSERT INTO `sys_menu` VALUES (24, 9, '部门新增', NULL, 'sys:unit:insert', 2, NULL, 1, 1, 1);
INSERT INTO `sys_menu` VALUES (25, 9, '部门编辑', NULL, 'sys:unit:update', 2, NULL, 1, 1, 3);
INSERT INTO `sys_menu` VALUES (26, 9, '部门删除', NULL, 'sys:unit:delete', 2, NULL, 1, 1, 2);
INSERT INTO `sys_menu` VALUES (27, 2, '角色管理', '/role', NULL, 1, NULL, 1, 1, 6);
INSERT INTO `sys_menu` VALUES (28, 27, '角色列表', NULL, 'sys:role:list', 2, NULL, 1, 1, 4);
INSERT INTO `sys_menu` VALUES (29, 27, '角色详情', NULL, 'sys:role:info', 2, NULL, 1, 1, 5);
INSERT INTO `sys_menu` VALUES (30, 27, '角色编辑', NULL, 'sys:role:update', 2, NULL, 1, 1, 3);
INSERT INTO `sys_menu` VALUES (31, 27, '角色删除', NULL, 'sys:role:delete', 2, NULL, 1, 1, 2);
INSERT INTO `sys_menu` VALUES (32, 27, '角色新增', NULL, 'sys:role:insert', 2, NULL, 1, 1, 1);
INSERT INTO `sys_menu` VALUES (33, 0, '选课管理', '/pickCourse', NULL, 0, NULL, 1, 1, 6);
INSERT INTO `sys_menu` VALUES (34, 33, '课程集合', NULL, 'ccss:second:list', 2, NULL, 1, 1, 4);
INSERT INTO `sys_menu` VALUES (35, 14, '课程编辑', NULL, 'user:course:update', 2, NULL, 1, 1, 3);
INSERT INTO `sys_menu` VALUES (36, 14, '课程新增', NULL, 'user:course:insert', 2, NULL, 1, 1, 1);
INSERT INTO `sys_menu` VALUES (37, 14, '课程删除', NULL, 'user:course:delete', 2, NULL, 1, 1, 2);
INSERT INTO `sys_menu` VALUES (38, 33, '自主选课', '/coursePick', NULL, 1, NULL, 1, 1, 6);
INSERT INTO `sys_menu` VALUES (39, 33, '发布管理', '/release', NULL, 1, NULL, 1, 1, 6);
INSERT INTO `sys_menu` VALUES (40, 0, '成绩管理', '/fraction', NULL, 0, NULL, 1, 0, 6);
INSERT INTO `sys_menu` VALUES (41, 2, '菜单管理', '/menu', NULL, 1, NULL, 0, 1, 6);
INSERT INTO `sys_menu` VALUES (43, 41, '菜单列表', NULL, 'sys:menu:list:menu', 2, NULL, 0, 1, 4);
INSERT INTO `sys_menu` VALUES (44, 41, '菜单新增', NULL, 'sys:menu:insert', 2, NULL, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (45, 41, '菜单编辑', NULL, 'sys:menu:update', 2, NULL, 0, 1, 3);
INSERT INTO `sys_menu` VALUES (46, 41, '菜单删除', NULL, 'sys:menu:delete', 2, NULL, 0, 1, 2);
INSERT INTO `sys_menu` VALUES (47, 39, '分组列表', NULL, 'plan:gorup:list', 2, NULL, 0, 1, 4);
INSERT INTO `sys_menu` VALUES (48, 39, '编辑', NULL, 'plan:gorup:update', 2, NULL, 0, 1, 3);
INSERT INTO `sys_menu` VALUES (49, 39, '新增', NULL, 'plan:gorup:insert', 2, NULL, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (50, 39, '详情', NULL, 'plan:gorup:info', 2, NULL, 0, 1, 5);
INSERT INTO `sys_menu` VALUES (51, 39, '删除', NULL, 'plan:gorup:delete', 2, NULL, 0, 1, 2);
INSERT INTO `sys_menu` VALUES (54, 17, '导出课程表 Excel 表格', NULL, 'course:classSchedule:get:user:course', 2, NULL, 0, 1, 6);
INSERT INTO `sys_menu` VALUES (55, 38, '抢课接口', NULL, 'second:go:course', 2, NULL, 0, 1, 6);
INSERT INTO `sys_menu` VALUES (56, 38, '学生抢课计划列表', NULL, 'second:plan:list', 2, NULL, 0, 1, 6);
INSERT INTO `sys_menu` VALUES (57, 38, '学生获取组信息', NULL, 'second:plan:info', 2, NULL, 0, 1, 6);
INSERT INTO `sys_menu` VALUES (58, 38, '学生抢课入口', NULL, 'second:plan:entrance', 2, NULL, 0, 1, 6);
INSERT INTO `sys_menu` VALUES (59, 38, '学生简单课表', NULL, 'second:get:class:course', 2, NULL, 0, 1, 6);
INSERT INTO `sys_menu` VALUES (60, 0, '设施管理', '/facility', '', 0, NULL, 0, 1, 6);
INSERT INTO `sys_menu` VALUES (61, 0, '个人设置', NULL, '', 0, NULL, 0, 1, 6);
INSERT INTO `sys_menu` VALUES (62, 41, '菜单详情', NULL, 'sys:menu:info', 2, NULL, 0, 1, 5);
INSERT INTO `sys_menu` VALUES (67, 39, '管理员计划列表', NULL, 'plan:plan:list', 2, NULL, 0, 1, 4);
INSERT INTO `sys_menu` VALUES (68, 39, '发布计划', NULL, 'plan:plan:put', 2, NULL, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (69, 39, '添加抢课课程', NULL, 'plan:plan:insert', 2, NULL, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (70, 39, '删除抢课课程', NULL, 'plan:plan:delete', 2, NULL, 0, 1, 2);
INSERT INTO `sys_menu` VALUES (71, 39, '编辑抢课课程', NULL, 'plan:plan:update', 2, NULL, 0, 1, 3);
INSERT INTO `sys_menu` VALUES (72, 60, '教室管理', '/classroom', NULL, 1, NULL, 0, 1, 6);
INSERT INTO `sys_menu` VALUES (73, 60, '大楼管理', '/classroomRoof', NULL, 1, NULL, 0, 1, 6);
INSERT INTO `sys_menu` VALUES (74, 60, '教室类型', '/classroomBetween', NULL, 1, NULL, 0, 1, 6);
INSERT INTO `sys_menu` VALUES (75, 39, '发布课程组', NULL, 'plan:plan:put1', 2, NULL, 0, 1, 6);
INSERT INTO `sys_menu` VALUES (78, 72, '教室集合', NULL, 'classroom:list', 2, NULL, 0, 1, 4);
INSERT INTO `sys_menu` VALUES (79, 72, '教室新增', NULL, 'classroom:insert', 2, NULL, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (80, 72, '教室删除', NULL, 'classroom:delete', 2, NULL, 0, 1, 2);
INSERT INTO `sys_menu` VALUES (81, 72, '教室编辑', NULL, 'classroom:update', 2, NULL, 0, 1, 3);
INSERT INTO `sys_menu` VALUES (82, 72, '教室详情', NULL, 'classroom:info', 2, NULL, 0, 1, 5);
INSERT INTO `sys_menu` VALUES (83, 73, '大楼集合', NULL, 'classroomRoof:list', 2, NULL, 0, 1, 4);
INSERT INTO `sys_menu` VALUES (84, 73, '大楼新增', NULL, 'classroomRoof:insert', 2, NULL, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (85, 73, '大楼删除', NULL, 'classroomRoof:delete', 2, NULL, 0, 1, 2);
INSERT INTO `sys_menu` VALUES (86, 73, '大楼编辑', NULL, 'classroomRoof:update', 2, NULL, 0, 1, 3);
INSERT INTO `sys_menu` VALUES (87, 73, '大楼详情', NULL, 'classroomRoof:info', 2, NULL, 0, 1, 5);
INSERT INTO `sys_menu` VALUES (88, 74, '教室类型集合', NULL, 'classroomBetween:list', 2, NULL, 0, 1, 4);
INSERT INTO `sys_menu` VALUES (89, 74, '教室类型新增', NULL, 'classroomBetween:insert', 2, NULL, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (90, 74, '教室类型删除', NULL, 'classroomBetween:delete', 2, NULL, 0, 1, 2);
INSERT INTO `sys_menu` VALUES (91, 74, '教室类型编辑', NULL, 'classroomBetween:update', 2, NULL, 0, 1, 3);
INSERT INTO `sys_menu` VALUES (92, 74, '教室类型详情', NULL, 'classroomBetween:info', 2, NULL, 0, 1, 5);
INSERT INTO `sys_menu` VALUES (93, 2, '课程类型', '/courseType', NULL, 1, NULL, 0, 1, 6);
INSERT INTO `sys_menu` VALUES (95, 93, '课程类型集合', NULL, 'course:type:menu', 2, NULL, 0, 1, 4);
INSERT INTO `sys_menu` VALUES (96, 93, '课程类型新增', NULL, 'course:type:insert', 2, NULL, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (97, 93, '课程类型编辑', NULL, 'course:type:update', 2, NULL, 0, 1, 3);
INSERT INTO `sys_menu` VALUES (98, 93, '课程类型删除', NULL, 'course:type:delete', 2, NULL, 0, 1, 2);
INSERT INTO `sys_menu` VALUES (99, 93, '课程类型详情', NULL, 'course:type:info', 2, NULL, 0, 1, 5);
INSERT INTO `sys_menu` VALUES (100, 17, '某个学生的课程表', NULL, 'course:classSchedule:find:course', 2, NULL, 0, 1, 6);
INSERT INTO `sys_menu` VALUES (101, 17, '初始化课程设置', NULL, 'course:classSchedule:initialization', 2, NULL, 0, 1, 6);
INSERT INTO `sys_menu` VALUES (102, 2, '初始课程', '/initialClass', NULL, 1, NULL, 0, 1, 6);
INSERT INTO `sys_menu` VALUES (103, 102, '初始化上传', NULL, 'course:classSchedule:initialization', 2, NULL, 0, 1, 6);
INSERT INTO `sys_menu` VALUES (104, 3, '踢人下线', NULL, 'sys:user:kick', 2, NULL, 0, 1, 6);
INSERT INTO `sys_menu` VALUES (105, 3, '通过部门id获取部门下的学生id', NULL, 'sys:user:unit', 2, NULL, 0, 1, 6);
INSERT INTO `sys_menu` VALUES (106, 3, '主任列表', NULL, 'sys:director:list', 2, NULL, 0, 1, 6);
INSERT INTO `sys_menu` VALUES (107, 3, '学生新增', NULL, 'sys:student:insert', 2, NULL, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (108, 3, '老师新增', NULL, 'sys:teacher:insert', 2, NULL, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (109, 3, '主任新增', NULL, 'sys:director:insert', 2, NULL, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (110, 3, '老师删除', NULL, 'sys:teacher:delete', 2, NULL, 0, 1, 2);
INSERT INTO `sys_menu` VALUES (111, 3, '主任删除', NULL, 'sys:director:delete', 2, NULL, 0, 1, 2);
INSERT INTO `sys_menu` VALUES (112, 3, '老师编辑', NULL, 'sys:teacher:update', 2, NULL, 0, 1, 3);
INSERT INTO `sys_menu` VALUES (113, 3, '主任编辑', NULL, 'sys:director:update', 2, NULL, 0, 1, 3);
INSERT INTO `sys_menu` VALUES (114, 3, '老师详情', NULL, 'sys:teacher:info', 2, NULL, 0, 1, 5);
INSERT INTO `sys_menu` VALUES (115, 3, '主任详情', NULL, 'sys:director:info', 2, NULL, 0, 1, 5);
INSERT INTO `sys_menu` VALUES (116, 3, '批量导入', NULL, 'sys:user:import', 2, NULL, 0, 1, 6);

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
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'admin', '管理员', 12, 'admin', '2021-08-10 11:54:26', 'admin', '2022-03-08 11:27:00');
INSERT INTO `sys_role` VALUES (22, 'Student', '学生', 1, 'admin', '2021-11-25 13:52:26', 'admin', '2022-02-22 10:15:29');
INSERT INTO `sys_role` VALUES (23, 'Teacher', '老师', 1, 'admin', '2021-11-25 13:59:27', 'admin', '2022-02-22 10:15:33');
INSERT INTO `sys_role` VALUES (24, 'test', '1', 1, '1', NULL, 'admin', '2022-02-24 09:11:27');
INSERT INTO `sys_role` VALUES (25, '只读', '只读权限', NULL, 'admin', '2022-03-07 14:27:19', 'admin', '2022-03-08 09:49:04');

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
  INDEX `menu_id`(`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2801 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色与菜单对应关系' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (540, 22, 2);
INSERT INTO `sys_role_menu` VALUES (541, 22, 3);
INSERT INTO `sys_role_menu` VALUES (542, 22, 4);
INSERT INTO `sys_role_menu` VALUES (544, 22, 6);
INSERT INTO `sys_role_menu` VALUES (545, 22, 7);
INSERT INTO `sys_role_menu` VALUES (546, 22, 8);
INSERT INTO `sys_role_menu` VALUES (547, 22, 11);
INSERT INTO `sys_role_menu` VALUES (548, 22, 12);
INSERT INTO `sys_role_menu` VALUES (549, 22, 13);
INSERT INTO `sys_role_menu` VALUES (550, 22, 19);
INSERT INTO `sys_role_menu` VALUES (552, 22, 9);
INSERT INTO `sys_role_menu` VALUES (553, 22, 22);
INSERT INTO `sys_role_menu` VALUES (554, 22, 23);
INSERT INTO `sys_role_menu` VALUES (555, 22, 24);
INSERT INTO `sys_role_menu` VALUES (556, 22, 25);
INSERT INTO `sys_role_menu` VALUES (557, 22, 26);
INSERT INTO `sys_role_menu` VALUES (558, 22, 14);
INSERT INTO `sys_role_menu` VALUES (559, 22, 15);
INSERT INTO `sys_role_menu` VALUES (560, 22, 16);
INSERT INTO `sys_role_menu` VALUES (561, 22, 35);
INSERT INTO `sys_role_menu` VALUES (562, 22, 36);
INSERT INTO `sys_role_menu` VALUES (563, 22, 37);
INSERT INTO `sys_role_menu` VALUES (564, 22, 27);
INSERT INTO `sys_role_menu` VALUES (565, 22, 28);
INSERT INTO `sys_role_menu` VALUES (566, 22, 29);
INSERT INTO `sys_role_menu` VALUES (567, 22, 30);
INSERT INTO `sys_role_menu` VALUES (568, 22, 31);
INSERT INTO `sys_role_menu` VALUES (569, 22, 32);
INSERT INTO `sys_role_menu` VALUES (570, 22, 17);
INSERT INTO `sys_role_menu` VALUES (571, 22, 18);
INSERT INTO `sys_role_menu` VALUES (572, 22, 33);
INSERT INTO `sys_role_menu` VALUES (573, 22, 34);
INSERT INTO `sys_role_menu` VALUES (574, 22, 38);
INSERT INTO `sys_role_menu` VALUES (575, 22, 39);
INSERT INTO `sys_role_menu` VALUES (576, 22, 40);
INSERT INTO `sys_role_menu` VALUES (577, 22, 41);
INSERT INTO `sys_role_menu` VALUES (578, 22, 43);
INSERT INTO `sys_role_menu` VALUES (579, 22, 44);
INSERT INTO `sys_role_menu` VALUES (580, 22, 45);
INSERT INTO `sys_role_menu` VALUES (581, 22, 46);
INSERT INTO `sys_role_menu` VALUES (583, 23, 2);
INSERT INTO `sys_role_menu` VALUES (584, 23, 3);
INSERT INTO `sys_role_menu` VALUES (585, 23, 4);
INSERT INTO `sys_role_menu` VALUES (587, 23, 6);
INSERT INTO `sys_role_menu` VALUES (588, 23, 7);
INSERT INTO `sys_role_menu` VALUES (589, 23, 8);
INSERT INTO `sys_role_menu` VALUES (590, 23, 11);
INSERT INTO `sys_role_menu` VALUES (591, 23, 12);
INSERT INTO `sys_role_menu` VALUES (592, 23, 13);
INSERT INTO `sys_role_menu` VALUES (593, 23, 19);
INSERT INTO `sys_role_menu` VALUES (595, 23, 9);
INSERT INTO `sys_role_menu` VALUES (596, 23, 22);
INSERT INTO `sys_role_menu` VALUES (597, 23, 23);
INSERT INTO `sys_role_menu` VALUES (598, 23, 24);
INSERT INTO `sys_role_menu` VALUES (599, 23, 25);
INSERT INTO `sys_role_menu` VALUES (600, 23, 26);
INSERT INTO `sys_role_menu` VALUES (601, 23, 14);
INSERT INTO `sys_role_menu` VALUES (602, 23, 15);
INSERT INTO `sys_role_menu` VALUES (603, 23, 16);
INSERT INTO `sys_role_menu` VALUES (604, 23, 35);
INSERT INTO `sys_role_menu` VALUES (605, 23, 36);
INSERT INTO `sys_role_menu` VALUES (606, 23, 37);
INSERT INTO `sys_role_menu` VALUES (607, 23, 27);
INSERT INTO `sys_role_menu` VALUES (608, 23, 28);
INSERT INTO `sys_role_menu` VALUES (609, 23, 29);
INSERT INTO `sys_role_menu` VALUES (610, 23, 30);
INSERT INTO `sys_role_menu` VALUES (611, 23, 31);
INSERT INTO `sys_role_menu` VALUES (612, 23, 32);
INSERT INTO `sys_role_menu` VALUES (613, 23, 17);
INSERT INTO `sys_role_menu` VALUES (614, 23, 18);
INSERT INTO `sys_role_menu` VALUES (615, 23, 33);
INSERT INTO `sys_role_menu` VALUES (616, 23, 34);
INSERT INTO `sys_role_menu` VALUES (617, 23, 38);
INSERT INTO `sys_role_menu` VALUES (618, 23, 39);
INSERT INTO `sys_role_menu` VALUES (619, 23, 40);
INSERT INTO `sys_role_menu` VALUES (620, 23, 41);
INSERT INTO `sys_role_menu` VALUES (621, 23, 43);
INSERT INTO `sys_role_menu` VALUES (622, 23, 44);
INSERT INTO `sys_role_menu` VALUES (623, 23, 45);
INSERT INTO `sys_role_menu` VALUES (624, 23, 46);
INSERT INTO `sys_role_menu` VALUES (772, 24, 2);
INSERT INTO `sys_role_menu` VALUES (773, 24, 3);
INSERT INTO `sys_role_menu` VALUES (774, 24, 4);
INSERT INTO `sys_role_menu` VALUES (776, 24, 6);
INSERT INTO `sys_role_menu` VALUES (777, 24, 7);
INSERT INTO `sys_role_menu` VALUES (778, 24, 8);
INSERT INTO `sys_role_menu` VALUES (779, 24, 19);
INSERT INTO `sys_role_menu` VALUES (781, 24, 9);
INSERT INTO `sys_role_menu` VALUES (782, 24, 22);
INSERT INTO `sys_role_menu` VALUES (783, 24, 23);
INSERT INTO `sys_role_menu` VALUES (784, 24, 24);
INSERT INTO `sys_role_menu` VALUES (785, 24, 25);
INSERT INTO `sys_role_menu` VALUES (786, 24, 26);
INSERT INTO `sys_role_menu` VALUES (787, 24, 14);
INSERT INTO `sys_role_menu` VALUES (788, 24, 15);
INSERT INTO `sys_role_menu` VALUES (789, 24, 16);
INSERT INTO `sys_role_menu` VALUES (790, 24, 35);
INSERT INTO `sys_role_menu` VALUES (791, 24, 36);
INSERT INTO `sys_role_menu` VALUES (792, 24, 37);
INSERT INTO `sys_role_menu` VALUES (793, 24, 27);
INSERT INTO `sys_role_menu` VALUES (794, 24, 28);
INSERT INTO `sys_role_menu` VALUES (795, 24, 29);
INSERT INTO `sys_role_menu` VALUES (796, 24, 30);
INSERT INTO `sys_role_menu` VALUES (797, 24, 31);
INSERT INTO `sys_role_menu` VALUES (798, 24, 32);
INSERT INTO `sys_role_menu` VALUES (799, 24, 41);
INSERT INTO `sys_role_menu` VALUES (800, 24, 43);
INSERT INTO `sys_role_menu` VALUES (801, 24, 44);
INSERT INTO `sys_role_menu` VALUES (802, 24, 45);
INSERT INTO `sys_role_menu` VALUES (803, 24, 46);
INSERT INTO `sys_role_menu` VALUES (804, 24, 62);
INSERT INTO `sys_role_menu` VALUES (2648, 25, 4);
INSERT INTO `sys_role_menu` VALUES (2649, 25, 8);
INSERT INTO `sys_role_menu` VALUES (2650, 25, 19);
INSERT INTO `sys_role_menu` VALUES (2651, 25, 105);
INSERT INTO `sys_role_menu` VALUES (2652, 25, 106);
INSERT INTO `sys_role_menu` VALUES (2653, 25, 114);
INSERT INTO `sys_role_menu` VALUES (2654, 25, 115);
INSERT INTO `sys_role_menu` VALUES (2655, 25, 22);
INSERT INTO `sys_role_menu` VALUES (2656, 25, 23);
INSERT INTO `sys_role_menu` VALUES (2657, 25, 15);
INSERT INTO `sys_role_menu` VALUES (2658, 25, 16);
INSERT INTO `sys_role_menu` VALUES (2659, 25, 28);
INSERT INTO `sys_role_menu` VALUES (2660, 25, 29);
INSERT INTO `sys_role_menu` VALUES (2661, 25, 43);
INSERT INTO `sys_role_menu` VALUES (2662, 25, 62);
INSERT INTO `sys_role_menu` VALUES (2663, 25, 95);
INSERT INTO `sys_role_menu` VALUES (2664, 25, 99);
INSERT INTO `sys_role_menu` VALUES (2665, 25, 18);
INSERT INTO `sys_role_menu` VALUES (2666, 25, 54);
INSERT INTO `sys_role_menu` VALUES (2667, 25, 38);
INSERT INTO `sys_role_menu` VALUES (2668, 25, 55);
INSERT INTO `sys_role_menu` VALUES (2669, 25, 56);
INSERT INTO `sys_role_menu` VALUES (2670, 25, 57);
INSERT INTO `sys_role_menu` VALUES (2671, 25, 58);
INSERT INTO `sys_role_menu` VALUES (2672, 25, 59);
INSERT INTO `sys_role_menu` VALUES (2673, 25, 47);
INSERT INTO `sys_role_menu` VALUES (2674, 25, 50);
INSERT INTO `sys_role_menu` VALUES (2675, 25, 67);
INSERT INTO `sys_role_menu` VALUES (2676, 25, 78);
INSERT INTO `sys_role_menu` VALUES (2677, 25, 82);
INSERT INTO `sys_role_menu` VALUES (2678, 25, 83);
INSERT INTO `sys_role_menu` VALUES (2679, 25, 87);
INSERT INTO `sys_role_menu` VALUES (2680, 25, 88);
INSERT INTO `sys_role_menu` VALUES (2681, 25, 92);
INSERT INTO `sys_role_menu` VALUES (2682, 25, 61);
INSERT INTO `sys_role_menu` VALUES (2683, 25, 11);
INSERT INTO `sys_role_menu` VALUES (2684, 25, 12);
INSERT INTO `sys_role_menu` VALUES (2685, 25, 13);
INSERT INTO `sys_role_menu` VALUES (2686, 25, 2);
INSERT INTO `sys_role_menu` VALUES (2687, 25, 3);
INSERT INTO `sys_role_menu` VALUES (2688, 25, 9);
INSERT INTO `sys_role_menu` VALUES (2689, 25, 14);
INSERT INTO `sys_role_menu` VALUES (2690, 25, 27);
INSERT INTO `sys_role_menu` VALUES (2691, 25, 41);
INSERT INTO `sys_role_menu` VALUES (2692, 25, 93);
INSERT INTO `sys_role_menu` VALUES (2693, 25, 17);
INSERT INTO `sys_role_menu` VALUES (2694, 25, 33);
INSERT INTO `sys_role_menu` VALUES (2695, 25, 39);
INSERT INTO `sys_role_menu` VALUES (2696, 25, 60);
INSERT INTO `sys_role_menu` VALUES (2697, 25, 72);
INSERT INTO `sys_role_menu` VALUES (2698, 25, 73);
INSERT INTO `sys_role_menu` VALUES (2699, 25, 74);
INSERT INTO `sys_role_menu` VALUES (2700, 1, 2);
INSERT INTO `sys_role_menu` VALUES (2701, 1, 3);
INSERT INTO `sys_role_menu` VALUES (2702, 1, 4);
INSERT INTO `sys_role_menu` VALUES (2703, 1, 6);
INSERT INTO `sys_role_menu` VALUES (2704, 1, 7);
INSERT INTO `sys_role_menu` VALUES (2705, 1, 8);
INSERT INTO `sys_role_menu` VALUES (2706, 1, 19);
INSERT INTO `sys_role_menu` VALUES (2707, 1, 104);
INSERT INTO `sys_role_menu` VALUES (2708, 1, 105);
INSERT INTO `sys_role_menu` VALUES (2709, 1, 106);
INSERT INTO `sys_role_menu` VALUES (2710, 1, 107);
INSERT INTO `sys_role_menu` VALUES (2711, 1, 108);
INSERT INTO `sys_role_menu` VALUES (2712, 1, 109);
INSERT INTO `sys_role_menu` VALUES (2713, 1, 110);
INSERT INTO `sys_role_menu` VALUES (2714, 1, 111);
INSERT INTO `sys_role_menu` VALUES (2715, 1, 112);
INSERT INTO `sys_role_menu` VALUES (2716, 1, 113);
INSERT INTO `sys_role_menu` VALUES (2717, 1, 114);
INSERT INTO `sys_role_menu` VALUES (2718, 1, 115);
INSERT INTO `sys_role_menu` VALUES (2719, 1, 116);
INSERT INTO `sys_role_menu` VALUES (2720, 1, 9);
INSERT INTO `sys_role_menu` VALUES (2721, 1, 22);
INSERT INTO `sys_role_menu` VALUES (2722, 1, 23);
INSERT INTO `sys_role_menu` VALUES (2723, 1, 24);
INSERT INTO `sys_role_menu` VALUES (2724, 1, 25);
INSERT INTO `sys_role_menu` VALUES (2725, 1, 26);
INSERT INTO `sys_role_menu` VALUES (2726, 1, 14);
INSERT INTO `sys_role_menu` VALUES (2727, 1, 15);
INSERT INTO `sys_role_menu` VALUES (2728, 1, 16);
INSERT INTO `sys_role_menu` VALUES (2729, 1, 35);
INSERT INTO `sys_role_menu` VALUES (2730, 1, 36);
INSERT INTO `sys_role_menu` VALUES (2731, 1, 37);
INSERT INTO `sys_role_menu` VALUES (2732, 1, 27);
INSERT INTO `sys_role_menu` VALUES (2733, 1, 28);
INSERT INTO `sys_role_menu` VALUES (2734, 1, 29);
INSERT INTO `sys_role_menu` VALUES (2735, 1, 30);
INSERT INTO `sys_role_menu` VALUES (2736, 1, 31);
INSERT INTO `sys_role_menu` VALUES (2737, 1, 32);
INSERT INTO `sys_role_menu` VALUES (2738, 1, 41);
INSERT INTO `sys_role_menu` VALUES (2739, 1, 43);
INSERT INTO `sys_role_menu` VALUES (2740, 1, 44);
INSERT INTO `sys_role_menu` VALUES (2741, 1, 45);
INSERT INTO `sys_role_menu` VALUES (2742, 1, 46);
INSERT INTO `sys_role_menu` VALUES (2743, 1, 62);
INSERT INTO `sys_role_menu` VALUES (2744, 1, 93);
INSERT INTO `sys_role_menu` VALUES (2745, 1, 95);
INSERT INTO `sys_role_menu` VALUES (2746, 1, 96);
INSERT INTO `sys_role_menu` VALUES (2747, 1, 97);
INSERT INTO `sys_role_menu` VALUES (2748, 1, 98);
INSERT INTO `sys_role_menu` VALUES (2749, 1, 99);
INSERT INTO `sys_role_menu` VALUES (2750, 1, 102);
INSERT INTO `sys_role_menu` VALUES (2751, 1, 103);
INSERT INTO `sys_role_menu` VALUES (2752, 1, 17);
INSERT INTO `sys_role_menu` VALUES (2753, 1, 18);
INSERT INTO `sys_role_menu` VALUES (2754, 1, 54);
INSERT INTO `sys_role_menu` VALUES (2755, 1, 100);
INSERT INTO `sys_role_menu` VALUES (2756, 1, 101);
INSERT INTO `sys_role_menu` VALUES (2757, 1, 33);
INSERT INTO `sys_role_menu` VALUES (2758, 1, 34);
INSERT INTO `sys_role_menu` VALUES (2759, 1, 38);
INSERT INTO `sys_role_menu` VALUES (2760, 1, 55);
INSERT INTO `sys_role_menu` VALUES (2761, 1, 56);
INSERT INTO `sys_role_menu` VALUES (2762, 1, 57);
INSERT INTO `sys_role_menu` VALUES (2763, 1, 58);
INSERT INTO `sys_role_menu` VALUES (2764, 1, 59);
INSERT INTO `sys_role_menu` VALUES (2765, 1, 39);
INSERT INTO `sys_role_menu` VALUES (2766, 1, 47);
INSERT INTO `sys_role_menu` VALUES (2767, 1, 48);
INSERT INTO `sys_role_menu` VALUES (2768, 1, 49);
INSERT INTO `sys_role_menu` VALUES (2769, 1, 50);
INSERT INTO `sys_role_menu` VALUES (2770, 1, 51);
INSERT INTO `sys_role_menu` VALUES (2771, 1, 67);
INSERT INTO `sys_role_menu` VALUES (2772, 1, 68);
INSERT INTO `sys_role_menu` VALUES (2773, 1, 69);
INSERT INTO `sys_role_menu` VALUES (2774, 1, 70);
INSERT INTO `sys_role_menu` VALUES (2775, 1, 71);
INSERT INTO `sys_role_menu` VALUES (2776, 1, 75);
INSERT INTO `sys_role_menu` VALUES (2777, 1, 40);
INSERT INTO `sys_role_menu` VALUES (2778, 1, 60);
INSERT INTO `sys_role_menu` VALUES (2779, 1, 72);
INSERT INTO `sys_role_menu` VALUES (2780, 1, 78);
INSERT INTO `sys_role_menu` VALUES (2781, 1, 79);
INSERT INTO `sys_role_menu` VALUES (2782, 1, 80);
INSERT INTO `sys_role_menu` VALUES (2783, 1, 81);
INSERT INTO `sys_role_menu` VALUES (2784, 1, 82);
INSERT INTO `sys_role_menu` VALUES (2785, 1, 73);
INSERT INTO `sys_role_menu` VALUES (2786, 1, 83);
INSERT INTO `sys_role_menu` VALUES (2787, 1, 84);
INSERT INTO `sys_role_menu` VALUES (2788, 1, 85);
INSERT INTO `sys_role_menu` VALUES (2789, 1, 86);
INSERT INTO `sys_role_menu` VALUES (2790, 1, 87);
INSERT INTO `sys_role_menu` VALUES (2791, 1, 74);
INSERT INTO `sys_role_menu` VALUES (2792, 1, 88);
INSERT INTO `sys_role_menu` VALUES (2793, 1, 89);
INSERT INTO `sys_role_menu` VALUES (2794, 1, 90);
INSERT INTO `sys_role_menu` VALUES (2795, 1, 91);
INSERT INTO `sys_role_menu` VALUES (2796, 1, 92);
INSERT INTO `sys_role_menu` VALUES (2797, 1, 61);
INSERT INTO `sys_role_menu` VALUES (2798, 1, 11);
INSERT INTO `sys_role_menu` VALUES (2799, 1, 12);
INSERT INTO `sys_role_menu` VALUES (2800, 1, 13);

-- ----------------------------
-- Table structure for sys_unit
-- ----------------------------
DROP TABLE IF EXISTS `sys_unit`;
CREATE TABLE `sys_unit`  (
  `unit_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名字',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父亲id',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门代码',
  `type` int(2) NULL DEFAULT NULL COMMENT '部门类别 0 学校 1 学院 2 专业 3 班级 ',
  `weight` int(10) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`unit_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_unit
-- ----------------------------
INSERT INTO `sys_unit` VALUES (1, '信息技术', 31, '001', 1, 0);
INSERT INTO `sys_unit` VALUES (2, '软件19-1', 32, '01', 3, 0);
INSERT INTO `sys_unit` VALUES (3, '软件19-2', 32, '02', 3, 0);
INSERT INTO `sys_unit` VALUES (31, '温州科技', 0, '001', 0, 0);
INSERT INTO `sys_unit` VALUES (32, '软件技术', 1, '032', 2, 0);
INSERT INTO `sys_unit` VALUES (33, '软件19-3', 32, '03', 3, 0);
INSERT INTO `sys_unit` VALUES (34, '软件19-4', 32, '04', 3, 0);
INSERT INTO `sys_unit` VALUES (35, '软件19-5', 32, '05', 3, 0);
INSERT INTO `sys_unit` VALUES (36, '软件19-6', 32, '06', 3, 0);

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
  `identity` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `number`(`number`) USING BTREE,
  INDEX `unit_id`(`unit_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1501101488675299332 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, '管理员', 'admin', 0, '$2a$10$o0vkFeTV0Nj2CJMLWoBcnOuYPPXUvvfXPegxkftnpKnsYM7f5Qt8O', '13736521260', 0, 'String', 'String', 'String', 1, 63, '2021-11-18 10:48:13', '2021-11-26 10:48:52', '1', '2022-02-23 08:39:58', 'admin', 1, 31, '2021-12-01 11:29:00', 1, NULL);
INSERT INTO `sys_user` VALUES (132, 'lyt', 'lyt', 22, '$2a$10$FYSFotZ5J7rApuHupdhm2OtxwyOPyEXWgap2oQej2pfZVdJdb49bO', '13736521260', 1, '1830841504@qq.com', '浙江省台州市黄岩区', NULL, 1, 14, '2022-01-26 11:37:20', '2022-01-26 11:32:57', 'admin', '2022-04-13 13:46:10', 'admin', 1, 31, NULL, 1, NULL);
INSERT INTO `sys_user` VALUES (133, 'lz', 'lz', 18, '$2a$10$o0vkFeTV0Nj2CJMLWoBcnOuYPPXUvvfXPegxkftnpKnsYM7f5Qt8O', '13564852451', 1, 'lz@qq.com', 'lz', NULL, 1, 5, '2022-01-26 11:36:18', '2022-01-26 11:36:18', 'admin', '2022-02-10 10:15:16', 'admin', 1, 1, '2022-02-17 13:53:37', 1, NULL);
INSERT INTO `sys_user` VALUES (134, '王老师', 'demo1', 16, '$2a$10$5Q1wxkTWmBP3t1PTjzZOJeX.pnNK7bc3pzQ1yAKNQTX04QEiDgp12', '13736521260', 2, '1830841504@qq.com', '', NULL, 1, 1, '2022-02-10 08:53:40', '2022-02-10 08:53:40', 'admin', '2022-02-10 08:53:40', 'admin', 1, 1, '2022-02-10 08:53:40', 1, NULL);
INSERT INTO `sys_user` VALUES (140, '林老师', 'demo5', 16, '$2a$10$27ihOQOHqWxQv/kO3En6B.IHfCUu5NJH1Udxs3FeYpwQEwsV0jMoy', '13736521260', 2, '1830841504@qq.com', '', NULL, 1, 1, '2022-02-10 08:59:44', '2022-02-10 08:59:44', 'admin', '2022-02-10 08:59:44', 'admin', 1, 1, '2022-02-10 08:59:44', 1, NULL);
INSERT INTO `sys_user` VALUES (141, '测试一号', 'ceshi', 16, '$2a$10$SDvONxqv83ufTAMlS0pXqePTpnFxvEHjN5Qirh90NTOwzKUhvB7EK', '15469875845', 1, 'wefw@qq.com', '中国', NULL, 1, 1, '2022-02-17 09:38:49', '2022-02-17 09:38:49', 'admin', '2022-02-17 09:38:49', 'admin', 1, 1, '2022-02-17 09:38:49', 1, NULL);
INSERT INTO `sys_user` VALUES (142, '测试二号', 'ceshi2', 16, '$2a$10$0z3pHJsKBSB089Cn3JPRiedVUx1JEctGawa11jy3koM89MOO.GDw.', '13526456254', 1, 'a@qq.com', 'awefawef', NULL, 1, 1, '2022-02-17 09:44:05', '2022-02-17 09:44:05', 'admin', '2022-02-17 09:44:05', 'admin', 1, 1, '2022-02-17 09:44:05', 1, NULL);
INSERT INTO `sys_user` VALUES (144, 'liuzhao', 'liuzhao', 21, '$2a$10$lfaE9WUAIusrc7ZhWXT/A.K8vn99O.JaKgUl5uasu/Iamx3ZLt./6', '13745678900', 3, '123@qq.com', '11111', NULL, 1, 2, '2022-02-21 10:36:31', '2022-02-21 10:36:31', 'admin', '2022-03-07 13:30:59', 'liuzhao', 1, 1, '2022-02-21 10:36:31', 1, NULL);
INSERT INTO `sys_user` VALUES (145, '1123123', '123123123', 16, '$2a$10$QLmX/.4A9hpnXOC2s8nhduiiYUGD2Z60Nzhc0KsL0/ov9MJdykerS', '13736521260', 1, '1830841504@qq.com', '123', NULL, 1, 1, '2022-02-24 11:55:17', '2022-02-24 11:55:17', 'admin', '2022-02-24 11:55:17', 'admin', 1, 1, '2022-02-24 11:55:17', 1, NULL);
INSERT INTO `sys_user` VALUES (146, '123123', '123', 16, '$2a$10$OUgdPJEKzhIANeaZNQFvYucxE9bimQUtZxAxMc.OYs0Hm4BIpszse', '13736521260', 1, '1830841504@qq.com', '1324', NULL, 1, 1, '2022-02-24 11:57:22', '2022-02-24 11:57:22', 'admin', '2022-02-24 11:57:22', 'admin', 1, 1, '2022-02-24 11:57:22', 1, NULL);
INSERT INTO `sys_user` VALUES (147, 'werf', 'q2w3e', 16, '$2a$10$CR.S4qx93z7nMw9Z9AE/8.wwlr1GQmT3B.zByC2Cf50hlIagg0/hy', '13736521260', 1, '1830841504@qq.com', '123', NULL, 1, 1, '2022-02-24 13:02:25', '2022-02-24 13:02:25', 'admin', '2022-02-24 13:02:25', 'admin', 1, 1, '2022-02-24 13:02:25', 1, NULL);
INSERT INTO `sys_user` VALUES (148, 'asdf', 'asd', 16, '$2a$10$eKUDqVLPxAK6JS8Rvp1eseRFU52s5cOHJx9joQKe0glELc0RdaBAW', '13736521260', 1, '1830841504@qq.com', 'ad', NULL, 1, 1, '2022-02-24 13:03:40', '2022-02-24 13:03:40', 'admin', '2022-02-24 13:03:40', 'admin', 1, 1, '2022-02-24 13:03:40', 1, NULL);
INSERT INTO `sys_user` VALUES (149, '测试', 'feeee', 16, '$2a$10$oSnKp8lDH6M4Hw18JBhgxuWG0x7m6Dz9aLCgRIcY1vKMt2.ygKEKS', '15364585642', 1, 'ww@qq.com', 'fawfwaefawef', NULL, 1, 1, '2022-02-24 13:06:08', '2022-02-24 13:06:08', 'admin', '2022-02-24 13:06:08', 'admin', 1, 1, '2022-02-24 13:06:08', 1, NULL);
INSERT INTO `sys_user` VALUES (150, 'wefwe', 'wef', 16, '$2a$10$FuZ0vcIjTt57NF8R3oi5Iu1gCEjIglx0RVGh4A8dZYlJi7WpWR/Ra', '13456878524', 1, '123@qq.com', 'awefawef', NULL, 1, 1, '2022-02-24 17:02:14', '2022-02-24 17:02:14', 'admin', '2022-02-24 17:02:14', 'admin', 1, 1, '2022-02-24 17:02:14', 1, NULL);
INSERT INTO `sys_user` VALUES (1501101488499138560, '张月静', '220320401', 30, '$2a$10$tXJ6j/aXPAv4auH8AEShEOeXkaZqVuLyDhaON4JQNHVlImBNIxI1.', '15736873259', 1, NULL, '浙江省金华市磐安县', NULL, 1, 1, '2022-03-08 15:44:13', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 0, '33072719910609382X');
INSERT INTO `sys_user` VALUES (1501101488532692992, '印莉', '220320402', 49, '$2a$10$cHeCEBxCwZJpOCSe77ogyu.tbm7u6iKx.z87eQaoVaXkx9asb5nvW', '18715640088', 1, NULL, '湖南省长沙市望城县', NULL, 1, 1, '2022-03-08 15:44:13', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 0, '430122197207173423');
INSERT INTO `sys_user` VALUES (1501101488541081600, '郑新刚', '220320403', 52, '$2a$10$pFrZPfHqDQrkgTPk8akk2ezMl6B9tyi8miysTH7xYrd/Aub5zv.M2', '13769392789', 1, NULL, '湖北省宜昌市秭归县', NULL, 1, 1, '2022-03-08 15:44:13', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 1, '42052719700226661X');
INSERT INTO `sys_user` VALUES (1501101488545275904, '曹晓玮', '220320404', 42, '$2a$10$p.YLMb4LivkGjQLrbsx9QOgicQ4a1kD51VFdfPf2ghfELsFoPqGa.', '17783855052', 1, NULL, '江苏省连云港市东海县', NULL, 1, 1, '2022-03-08 15:44:13', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 0, '320722197903241220');
INSERT INTO `sys_user` VALUES (1501101488549470208, '荣文华', '220320405', 49, '$2a$10$wSE./Rlmisx0abs2Wxu8mujxRnYyPCjiV2DpOA6Eb0.ecdhziBE6W', '17425126594', 1, NULL, '湖南省长沙市宁乡县', NULL, 1, 1, '2022-03-08 15:44:13', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 1, '430124197211202015');
INSERT INTO `sys_user` VALUES (1501101488557858816, '马长宏', '220320406', 49, '$2a$10$JlW4TqH.OMh4d49Ihbk2eeQH/cI9BBCa3jlfBB9lFjze30Aq9UNna', '16439700913', 1, NULL, '黑龙江省牡丹江市东宁县', NULL, 1, 1, '2022-03-08 15:44:13', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 1, '231024197212132918');
INSERT INTO `sys_user` VALUES (1501101488562053120, '赵汝栋', '220320407', 28, '$2a$10$YO6umXMOirbX0zq4ekI3qeTOAjNZEq0xURYDW6jt.LaqCTwymZA36', '16417178297', 1, NULL, '辽宁省辽阳市辽阳县', NULL, 1, 1, '2022-03-08 15:44:13', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 1, '211021199307014910');
INSERT INTO `sys_user` VALUES (1501101488566247424, '钟萍萍', '220320408', 34, '$2a$10$6zDqGIOH.FMNZLPSN4Qix.84FQazuuo3l5nnlDbCtsj1fHs8avknK', '18383976812', 1, NULL, '河北省保定市博野县', NULL, 1, 1, '2022-03-08 15:44:13', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 0, '130637198802203127');
INSERT INTO `sys_user` VALUES (1501101488574636032, '王士敏', '220320409', 42, '$2a$10$Tw32zDvrDaYw6keIw3bQTu9EQBlIPIOgdXN13hNRXlwZNLiE3wN3G', '14582051886', 1, NULL, '陕西省咸阳市长武县', NULL, 1, 1, '2022-03-08 15:44:13', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 1, '61042819800217111X');
INSERT INTO `sys_user` VALUES (1501101488574636033, '岳莹莹', '220320410', 29, '$2a$10$LSelVA2A8JqN6OjGdetNh.WoJ70MlvWMgig78.XvZuGYKNR8PTwGK', '16940433452', 1, NULL, '四川省乐山市夹江县', NULL, 1, 1, '2022-03-08 15:44:14', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 0, '511126199302201627');
INSERT INTO `sys_user` VALUES (1501101488578830336, '卓鹤君', '220320411', 42, '$2a$10$OCd4u6Vd0KzDr0tS0n4Blu3GTGAIpkOpqDRtf/4OAmDLWieaqaQfG', '19342346471', 1, NULL, '河南省南阳市方城县', NULL, 1, 1, '2022-03-08 15:44:14', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 1, '411322197912021618');
INSERT INTO `sys_user` VALUES (1501101488583024640, '李维达', '220320412', 50, '$2a$10$N9/2Dm/8ecyI3vxyFOChyu9ql0Ym.mpqZt1RZpezK8tpkT9XwWw.S', '16354716059', 1, NULL, '福建省漳州市平和县', NULL, 1, 1, '2022-03-08 15:44:14', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 1, '350628197105244716');
INSERT INTO `sys_user` VALUES (1501101488583024641, '周祖兰', '220320413', 39, '$2a$10$v2QGpFAfUBAjFbuZi1WhU.STE37Sqs5S8GoWQhtA5h75/RZ3dfgGq', '19497287708', 1, NULL, '湖南省岳阳市华容县', NULL, 1, 1, '2022-03-08 15:44:14', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 0, '430623198206071327');
INSERT INTO `sys_user` VALUES (1501101488587218944, '彭付太', '220320414', 30, '$2a$10$bef0gK4p/jaBj2ou.qOi0OyDEWbh7mgwpRn4qboWFUmd72SxvSfLu', '17763201843', 1, NULL, '山东省临沂市郯城县', NULL, 1, 1, '2022-03-08 15:44:14', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 1, '371322199104181812');
INSERT INTO `sys_user` VALUES (1501101488591413248, '于进进', '220320415', 42, '$2a$10$f/7icWDrIjokpcZzNLNAUeGTl1C/GhDJ0W/NKpMhBaoUyuNeGJxL2', '13852548715', 1, NULL, '河南省安阳市滑县', NULL, 1, 1, '2022-03-08 15:44:14', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 1, '410526198001155914');
INSERT INTO `sys_user` VALUES (1501101488599801856, '曾福来', '220320416', 36, '$2a$10$dgfJqQRyyL5P.uTeyKYoeOvDEGN4SWCqh6SiM/CvhWLqCPCSE3Ici', '13869629377', 1, NULL, '湖南省永州市宁远县', NULL, 1, 1, '2022-03-08 15:44:14', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 1, '431126198511016116');
INSERT INTO `sys_user` VALUES (1501101488608190464, '崔胡', '220320417', 44, '$2a$10$klQUjuPA.NEq5Fg4f714buf.R1Pl4O5IpoiW0Dsy7bJkRrRd/495K', '19420837152', 1, NULL, '江西省九江市星子县', NULL, 1, 1, '2022-03-08 15:44:14', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 0, '360427197708041824');
INSERT INTO `sys_user` VALUES (1501101488612384768, '赵汉伟', '220320418', 30, '$2a$10$/4.i/Cs8zdG.bgKIFZZqTerVhSIQdNULQCuEmmXwt78rm/16E.8uC', '13990057796', 1, NULL, '湖北省荆门市沙洋县', NULL, 1, 1, '2022-03-08 15:44:14', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 1, '420822199111234215');
INSERT INTO `sys_user` VALUES (1501101488612384769, '卢海丹', '220320419', 42, '$2a$10$oZU.XKFIE2XkhDmGo6lz1./M/JuCTrKCyfC4/kMQX9G9DCpHj95V.', '15536280308', 1, NULL, '湖南省岳阳市岳阳县', NULL, 1, 1, '2022-03-08 15:44:14', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 0, '430621197905226327');
INSERT INTO `sys_user` VALUES (1501101488612384770, '张泽俊', '220320420', 51, '$2a$10$W2wshzsIvD5Ns9fp2vsHS.e7jxfsAVRLgcNRSXRdcjkuOddVxU1oq', '15901179200', 1, NULL, '湖南省郴州市安仁县', NULL, 1, 1, '2022-03-08 15:44:14', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 1, '431028197011133319');
INSERT INTO `sys_user` VALUES (1501101488616579072, '张天超', '220320421', 37, '$2a$10$7fZew5goAAQPpsxxFwZhrOcpcM/wRX/LHanZhdZuCeIoQzL3iOREC', '18442704848', 1, NULL, '河南省新乡市获嘉县', NULL, 1, 1, '2022-03-08 15:44:15', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 1, '410724198501267718');
INSERT INTO `sys_user` VALUES (1501101488616579073, '刘华燕', '220320422', 42, '$2a$10$.XLKY5zm.7sgkTZ//luVUuLWxUjl88h8oym60k43RyW9BKSkQCYri', '13902553744', 1, NULL, '江苏省镇江市丹徒县', NULL, 1, 1, '2022-03-08 15:44:15', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 0, '321121197912271925');
INSERT INTO `sys_user` VALUES (1501101488620773376, '朱晓虹', '220320423', 46, '$2a$10$UJFu11GrdbUhwJhi61IG4eWXMwlCvm2vfyT28kVzbb1N3XbZ.N8gW', '16829550936', 1, NULL, '河南省南阳市内乡县', NULL, 1, 1, '2022-03-08 15:44:15', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 0, '41132519750626412X');
INSERT INTO `sys_user` VALUES (1501101488620773377, '赵润平', '220320424', 26, '$2a$10$WbKIOFLpzt0sq1eEJmEeb.1G15oZo2jGsinWg9bF0y5obsRV/aoXS', '19211830210', 1, NULL, '海南省三亚市临高县', NULL, 1, 1, '2022-03-08 15:44:15', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 1, '460028199511223613');
INSERT INTO `sys_user` VALUES (1501101488624967680, '董运生', '220320425', 49, '$2a$10$yykl2K7HdA4NiDczjRAG9.NfFl7n4TsABnfDl2BLwyKkgPeGi0eji', '18428188328', 1, NULL, '黑龙江省齐齐哈尔市依安县', NULL, 1, 1, '2022-03-08 15:44:15', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 1, '230223197211144515');
INSERT INTO `sys_user` VALUES (1501101488624967681, '于红平', '220320426', 42, '$2a$10$U8FardxcWlvqkrU6BVOXlef8ymdVeSFRmw4T1gExkGZ5oQVvEOjpO', '14264253110', 1, NULL, '福建省龙岩市长汀县', NULL, 1, 1, '2022-03-08 15:44:15', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 0, '350821198002042020');
INSERT INTO `sys_user` VALUES (1501101488624967682, '郑台', '220320427', 42, '$2a$10$iLoG2hdPVXyg3hySibrxxOTPcLt.lOK.PU24IZPAgRFQ6Y8icX3.i', '16739187795', 1, NULL, '广东省河源市龙川县', NULL, 1, 1, '2022-03-08 15:44:15', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 1, '441622198002147517');
INSERT INTO `sys_user` VALUES (1501101488629161984, '何兆坚', '220320428', 37, '$2a$10$lBAqwZAeD6RoCgYJ9RwzmO24lFu4ofSbk2q7aVGKHA5ZgGEcZFW2C', '16860903663', 1, NULL, '河南省三门峡市渑池县', NULL, 1, 1, '2022-03-08 15:44:16', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 1, '411221198406087414');
INSERT INTO `sys_user` VALUES (1501101488629161985, '郭伟清', '220320429', 51, '$2a$10$wRgeXP35N0GrYaGo2IiGn.XXfprvoOWzJPu9pzsq574vZkn4W2iNq', '14330279246', 1, NULL, '湖南省永州市宁远县', NULL, 1, 1, '2022-03-08 15:44:16', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 1, '431126197102174418');
INSERT INTO `sys_user` VALUES (1501101488633356288, '柏隆', '220320430', 45, '$2a$10$M9SlTnt..K4JqZfOQ7CPMOkL3re3TCeK5Vbm2rB1jNx5s/ZfyFUHi', '19392039138', 1, NULL, '甘肃省兰州市永登县', NULL, 1, 1, '2022-03-08 15:44:16', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 1, '62012119761026691X');
INSERT INTO `sys_user` VALUES (1501101488633356289, '郑荣玉', '220320431', 34, '$2a$10$b9qd36HBlVFwrMhdr1C10.DVBEUfEkA1YnjmPwC6g89KxGVOb/6Lm', '18185004792', 1, NULL, '陕西省延安市子长县', NULL, 1, 1, '2022-03-08 15:44:16', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 0, '61062319880102502X');
INSERT INTO `sys_user` VALUES (1501101488633356290, '郑汉平', '220320432', 22, '$2a$10$9JDZsdTyeYvB6.VH1N9Awu52l7uMGxtGwiS28R3CZC9PGov5xw1Bu', '17202112262', 1, NULL, '河北省唐山市唐海县', NULL, 1, 1, '2022-03-08 15:44:16', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 1, '130230199904011917');
INSERT INTO `sys_user` VALUES (1501101488637550592, '达白', '220320433', 44, '$2a$10$v0VqfAwVFyVHxeHM3KX8A.higmo18wLl4ppg3cYJA1pFfn.9WhnCy', '17559212684', 1, NULL, '河南省信阳市淮滨县', NULL, 1, 1, '2022-03-08 15:44:16', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 0, '411527197708017024');
INSERT INTO `sys_user` VALUES (1501101488637550593, '朱卫军', '220320434', 29, '$2a$10$IgkD42v4i1arYxyXyOLNt.X6tyq1tz3VpQSuOQRRM1dM1NV5eheO2', '16331822935', 1, NULL, '福建省龙岩市连城县', NULL, 1, 1, '2022-03-08 15:44:16', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 1, '350825199207185615');
INSERT INTO `sys_user` VALUES (1501101488641744896, '周洁茹', '220320435', 22, '$2a$10$N5PrsLX0Up.ig..fyJrYiOQFHjTqnLbXoEMbuBtk7wTRmyBXlTsmS', '15384271129', 1, NULL, '山东省临沂市平邑县', NULL, 1, 1, '2022-03-08 15:44:16', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 0, '371326200002145125');
INSERT INTO `sys_user` VALUES (1501101488641744897, '虞伟民', '220320436', 22, '$2a$10$mOFWxouVaE.HwHvfYYJsWOd5X9fpPg5NbPhqJfWe2b9PaE7cBI3aW', '15669144902', 1, NULL, '福建省南平市松溪县', NULL, 1, 1, '2022-03-08 15:44:16', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 1, '350724199910033312');
INSERT INTO `sys_user` VALUES (1501101488645939200, '赵亚光', '220320437', 23, '$2a$10$0oMGiRDyDMHP3Mv17qZ5fO9rgfnZbvYf9sFQYbfK5hnVRvif871g2', '18327489260', 1, NULL, '吉林省长春市农安县', NULL, 1, 1, '2022-03-08 15:44:16', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 1, '220122199804134713');
INSERT INTO `sys_user` VALUES (1501101488645939201, '马振娥', '220320438', 22, '$2a$10$fNiTzek.WEgvmEs0Jm3NzeONt.1cICp84iqCSLAud6SrMb/.iwHHq', '19869071732', 1, NULL, '江苏省淮阴市洪泽县', NULL, 1, 1, '2022-03-08 15:44:16', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 0, '320829200002027424');
INSERT INTO `sys_user` VALUES (1501101488645939202, '赵世猛', '220320439', 31, '$2a$10$B1QqxWc8ioghp0AMST4ljeAbtrIwMI4EwjLN/9llIILkR6bxWySfq', '19372895922', 1, NULL, '江西省南昌市新建县', NULL, 1, 1, '2022-03-08 15:44:16', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 1, '360122199011176519');
INSERT INTO `sys_user` VALUES (1501101488650133504, '白金林', '220320440', 51, '$2a$10$AC7oqzcQx/yvnjRGfBcKdOE7CpbDvzlWDf3HpAqvpgLvQqcAZH5B2', '19187803852', 1, NULL, '河南省安阳市汤阴县', NULL, 1, 1, '2022-03-08 15:44:16', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 1, '410523197012214015');
INSERT INTO `sys_user` VALUES (1501101488650133505, '张心羽', '220320441', 25, '$2a$10$NZOZa01XjAmUtvEw2CevNu2xhcX.MsZn8G/32GLOkSSvGMku5aDby', '19441600931', 1, NULL, '浙江省金华市武义县', NULL, 1, 1, '2022-03-08 15:44:17', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 0, '330723199611205022');
INSERT INTO `sys_user` VALUES (1501101488650133506, '钟子红', '220320442', 46, '$2a$10$eVI6ANLBccvCCiXdfAfGyesF1AEK4/u2Pqu2Ukcsdd82z1oFXaE/G', '19720995594', 1, NULL, '河北省邯郸市邯郸县', NULL, 1, 1, '2022-03-08 15:44:17', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 0, '13042119750424352X');
INSERT INTO `sys_user` VALUES (1501101488654327808, '熊铎', '220320443', 32, '$2a$10$h1AgdYe3oPkIaXtxxXnlj.E67xtIfiuCShiLgJvNUdTaSFGBvbqZm', '18971948905', 1, NULL, '陕西省宝鸡市凤翔县', NULL, 1, 1, '2022-03-08 15:44:17', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 1, '61032219890715461X');
INSERT INTO `sys_user` VALUES (1501101488654327809, '孙建威', '220320444', 39, '$2a$10$RqA3rKTtBEiyuGNKPfCIrOUVT4u8x0rjTn1QkI0WDrmabRWwSQDwS', '19286252161', 1, NULL, '江西省萍乡市芦溪县', NULL, 1, 1, '2022-03-08 15:44:17', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 1, '360323198207265110');
INSERT INTO `sys_user` VALUES (1501101488658522112, '柏振华', '220320445', 28, '$2a$10$oJ2nw.HrVUDonkOFxIQp1OmStEdsq9nJTvxpLiV4LJqOKB9mFlEdO', '14134290807', 1, NULL, '河北省石家庄市灵寿县', NULL, 1, 1, '2022-03-08 15:44:17', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 1, '13012619930509321X');
INSERT INTO `sys_user` VALUES (1501101488658522113, '陈凯佳', '220320446', 29, '$2a$10$Dn0d8zGMgCOXzVAxNjBDAeCl2fP2ld7bLjk.W3C21wgAI32.kzOMS', '17654301463', 1, NULL, '河北省石家庄市正定县', NULL, 1, 1, '2022-03-08 15:44:18', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 1, '130123199206263114');
INSERT INTO `sys_user` VALUES (1501101488658522114, '叶伟清', '220320447', 25, '$2a$10$I72NovDygiiSLADfe/HGT.czU9jlV8mQ.YeWy0D/7xUP.YLm.jJ9C', '16981188339', 1, NULL, '山东省淄博市沂源县', NULL, 1, 1, '2022-03-08 15:44:18', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 1, '370323199610024014');
INSERT INTO `sys_user` VALUES (1501101488662716416, '周楠森', '220320448', 26, '$2a$10$XQfxLHKg2nMZo5w1oRqgO.ixVvY1Sil1hezUh09d1uCm7NxDHuhga', '18980380403', 1, NULL, '四川省成都市大邑县', NULL, 1, 1, '2022-03-08 15:44:18', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 1, '510129199512124111');
INSERT INTO `sys_user` VALUES (1501101488662716417, '周珍菊', '220320449', 45, '$2a$10$SNJ8nIxpahBpLft4CJh0Q.43MW.sMwcm20V/kP0ce3ZTu4wUJl6DK', '15938188870', 1, NULL, '河北省邯郸市曲周县', NULL, 1, 1, '2022-03-08 15:44:18', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 0, '130435197607194327');
INSERT INTO `sys_user` VALUES (1501101488662716418, '郑金朋', '220320450', 49, '$2a$10$WNUeRHmBRt.SPnh6yufG7.wnDmxo5bcg/kpCbbeiDdrrq9F5YXf.W', '17294255729', 1, NULL, '湖南省常德市澧县', NULL, 1, 1, '2022-03-08 15:44:18', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 1, '430723197207226715');
INSERT INTO `sys_user` VALUES (1501101488666910720, '朱闻静', '220320451', 41, '$2a$10$4suza4w/XZqCLtANxfvj2Ocbq3Anw0Qj/62KTIZ/wrVk6kWa/2MDu', '17949511781', 1, NULL, '江苏省徐州市睢宁县', NULL, 1, 1, '2022-03-08 15:44:18', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 0, '32032419800622272X');
INSERT INTO `sys_user` VALUES (1501101488666910721, '邢娜', '220320452', 38, '$2a$10$R6UHHzjxBb3tZUVo4KAimegk7rEmd3bngEIPOlf4LJAJtECCDnLVq', '18528048637', 1, NULL, '吉林省白山市抚松县', NULL, 1, 1, '2022-03-08 15:44:18', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 0, '220621198402095121');
INSERT INTO `sys_user` VALUES (1501101488666910722, '印洁', '220320453', 41, '$2a$10$jNcSJWAhgSNAXkPoj6qpbewMzTpe74CqQFu1AehT64QCX.nxIn8ou', '18202009492', 1, NULL, '黑龙江省齐齐哈尔市拜泉县', NULL, 1, 1, '2022-03-08 15:44:18', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 0, '230231198010163722');
INSERT INTO `sys_user` VALUES (1501101488671105024, '于晓菲', '220320454', 23, '$2a$10$Clb9ATURy4ARHDDxIwBQxuyfSCiOSAgYjIHn527Nl3mJeR3hXWUV.', '15222599157', 1, NULL, '辽宁省大连市长海县', NULL, 1, 1, '2022-03-08 15:44:18', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 0, '210224199811102927');
INSERT INTO `sys_user` VALUES (1501101488671105025, '袁烨', '220320455', 46, '$2a$10$3zdqPfoDqnjqV2oVV3Um6uakx2CUR9WsOHcOfDM6JxXqLZJPQEprO', '17382352560', 1, NULL, '江西省赣州市上犹县', NULL, 1, 1, '2022-03-08 15:44:18', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 1, '360724197602244516');
INSERT INTO `sys_user` VALUES (1501101488671105026, '张家水', '220320456', 30, '$2a$10$fH9iLbEi9sWtCJVviS/KT.FkieVX61A5O9bO8VMpCEJAFVmDn5oxG', '18569951505', 1, NULL, '陕西省西安市户县', NULL, 1, 1, '2022-03-08 15:44:18', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 1, '610125199111171214');
INSERT INTO `sys_user` VALUES (1501101488675299328, '左纳', '220320457', 33, '$2a$10$fauIIwQt0rMkJCpSpE9o8.I21DGWBec7ksTD6AV71OcHYuqQM3kpy', '19964048271', 1, NULL, '安徽省滁州市凤阳县', NULL, 1, 1, '2022-03-08 15:44:18', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 1, '341126198803127713');
INSERT INTO `sys_user` VALUES (1501101488675299329, '麦考', '220320458', 31, '$2a$10$Lk8cK7n1gdnom/eJnJ.u2.nk2ObzIrLdjsJo0TuSAamkq6sM1OdRK', '16263966193', 1, NULL, '山西省阳泉市盂县', NULL, 1, 1, '2022-03-08 15:44:18', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 1, '140322199006146411');
INSERT INTO `sys_user` VALUES (1501101488675299330, '俞荣光', '220320459', 47, '$2a$10$v07lWZzFFXwEtnB6hFKX0OPAvY4XMErxXQuVhr70jwMRpuoWUs5TG', '17304368024', 1, NULL, '江西省赣州市全南县', NULL, 1, 1, '2022-03-08 15:44:18', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 1, '360729197405215013');
INSERT INTO `sys_user` VALUES (1501101488675299331, '张吉法', '220320460', 41, '$2a$10$BzR2j8qtcobhz/GeVpF93uGUgx/fmyBJuVAAvIIN6YuU1VL9jSG0a', '14650205335', 1, NULL, '浙江省金华市浦江县', NULL, 1, 1, '2022-03-08 15:44:18', '2022-03-08 15:44:19', 'admin', '2022-03-08 15:44:19', 'admin', 1, 34, NULL, 1, '330726198006196011');

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
  INDEX `sys_user_role_ibfk_2`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 619 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与角色对应关系' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1, 1);
INSERT INTO `sys_user_role` VALUES (18, 132, 1);
INSERT INTO `sys_user_role` VALUES (19, 133, 1);
INSERT INTO `sys_user_role` VALUES (20, 134, 1);
INSERT INTO `sys_user_role` VALUES (25, 140, 24);
INSERT INTO `sys_user_role` VALUES (26, 141, 1);
INSERT INTO `sys_user_role` VALUES (27, 142, 1);
INSERT INTO `sys_user_role` VALUES (28, 144, 1);
INSERT INTO `sys_user_role` VALUES (29, 145, 22);
INSERT INTO `sys_user_role` VALUES (30, 146, 1);
INSERT INTO `sys_user_role` VALUES (31, 147, 1);
INSERT INTO `sys_user_role` VALUES (32, 148, 1);
INSERT INTO `sys_user_role` VALUES (33, 149, 23);
INSERT INTO `sys_user_role` VALUES (559, 1501101488499138560, 22);
INSERT INTO `sys_user_role` VALUES (560, 1501101488532692992, 22);
INSERT INTO `sys_user_role` VALUES (561, 1501101488541081600, 22);
INSERT INTO `sys_user_role` VALUES (562, 1501101488545275904, 22);
INSERT INTO `sys_user_role` VALUES (563, 1501101488549470208, 22);
INSERT INTO `sys_user_role` VALUES (564, 1501101488557858816, 22);
INSERT INTO `sys_user_role` VALUES (565, 1501101488562053120, 22);
INSERT INTO `sys_user_role` VALUES (566, 1501101488566247424, 22);
INSERT INTO `sys_user_role` VALUES (567, 1501101488574636032, 22);
INSERT INTO `sys_user_role` VALUES (568, 1501101488574636033, 22);
INSERT INTO `sys_user_role` VALUES (569, 1501101488578830336, 22);
INSERT INTO `sys_user_role` VALUES (570, 1501101488583024640, 22);
INSERT INTO `sys_user_role` VALUES (571, 1501101488583024641, 22);
INSERT INTO `sys_user_role` VALUES (572, 1501101488587218944, 22);
INSERT INTO `sys_user_role` VALUES (573, 1501101488591413248, 22);
INSERT INTO `sys_user_role` VALUES (574, 1501101488599801856, 22);
INSERT INTO `sys_user_role` VALUES (575, 1501101488608190464, 22);
INSERT INTO `sys_user_role` VALUES (576, 1501101488612384768, 22);
INSERT INTO `sys_user_role` VALUES (577, 1501101488612384769, 22);
INSERT INTO `sys_user_role` VALUES (578, 1501101488612384770, 22);
INSERT INTO `sys_user_role` VALUES (579, 1501101488616579072, 22);
INSERT INTO `sys_user_role` VALUES (580, 1501101488616579073, 22);
INSERT INTO `sys_user_role` VALUES (581, 1501101488620773376, 22);
INSERT INTO `sys_user_role` VALUES (582, 1501101488620773377, 22);
INSERT INTO `sys_user_role` VALUES (583, 1501101488624967680, 22);
INSERT INTO `sys_user_role` VALUES (584, 1501101488624967681, 22);
INSERT INTO `sys_user_role` VALUES (585, 1501101488624967682, 22);
INSERT INTO `sys_user_role` VALUES (586, 1501101488629161984, 22);
INSERT INTO `sys_user_role` VALUES (587, 1501101488629161985, 22);
INSERT INTO `sys_user_role` VALUES (588, 1501101488633356288, 22);
INSERT INTO `sys_user_role` VALUES (589, 1501101488633356289, 22);
INSERT INTO `sys_user_role` VALUES (590, 1501101488633356290, 22);
INSERT INTO `sys_user_role` VALUES (591, 1501101488637550592, 22);
INSERT INTO `sys_user_role` VALUES (592, 1501101488637550593, 22);
INSERT INTO `sys_user_role` VALUES (593, 1501101488641744896, 22);
INSERT INTO `sys_user_role` VALUES (594, 1501101488641744897, 22);
INSERT INTO `sys_user_role` VALUES (595, 1501101488645939200, 22);
INSERT INTO `sys_user_role` VALUES (596, 1501101488645939201, 22);
INSERT INTO `sys_user_role` VALUES (597, 1501101488645939202, 22);
INSERT INTO `sys_user_role` VALUES (598, 1501101488650133504, 22);
INSERT INTO `sys_user_role` VALUES (599, 1501101488650133505, 22);
INSERT INTO `sys_user_role` VALUES (600, 1501101488650133506, 22);
INSERT INTO `sys_user_role` VALUES (601, 1501101488654327808, 22);
INSERT INTO `sys_user_role` VALUES (602, 1501101488654327809, 22);
INSERT INTO `sys_user_role` VALUES (603, 1501101488658522112, 22);
INSERT INTO `sys_user_role` VALUES (604, 1501101488658522113, 22);
INSERT INTO `sys_user_role` VALUES (605, 1501101488658522114, 22);
INSERT INTO `sys_user_role` VALUES (606, 1501101488662716416, 22);
INSERT INTO `sys_user_role` VALUES (607, 1501101488662716417, 22);
INSERT INTO `sys_user_role` VALUES (608, 1501101488662716418, 22);
INSERT INTO `sys_user_role` VALUES (609, 1501101488666910720, 22);
INSERT INTO `sys_user_role` VALUES (610, 1501101488666910721, 22);
INSERT INTO `sys_user_role` VALUES (611, 1501101488666910722, 22);
INSERT INTO `sys_user_role` VALUES (612, 1501101488671105024, 22);
INSERT INTO `sys_user_role` VALUES (613, 1501101488671105025, 22);
INSERT INTO `sys_user_role` VALUES (614, 1501101488671105026, 22);
INSERT INTO `sys_user_role` VALUES (615, 1501101488675299328, 22);
INSERT INTO `sys_user_role` VALUES (616, 1501101488675299329, 22);
INSERT INTO `sys_user_role` VALUES (617, 1501101488675299330, 22);
INSERT INTO `sys_user_role` VALUES (618, 1501101488675299331, 22);

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
