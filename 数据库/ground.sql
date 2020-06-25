/*
 Navicat Premium Data Transfer

 Source Server         : MySQL80
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : localhost:3306
 Source Schema         : gms

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 25/06/2020 21:49:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ground
-- ----------------------------
DROP TABLE IF EXISTS `ground`;
CREATE TABLE `ground`  (
  `groundId` int(0) NOT NULL AUTO_INCREMENT COMMENT '场地号',
  `groundName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '场地名称',
  `groundFee` float(8, 0) NULL DEFAULT NULL COMMENT '场地收费标准',
  `groundStatus` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '场地状态',
  `useTime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '场地使用时长',
  `groundEqu` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '场地器材',
  `userId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`groundId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ground
-- ----------------------------
INSERT INTO `ground` VALUES (1, '足球场', 3, '0', '0', '足球', NULL);
INSERT INTO `ground` VALUES (2, '1', 1, '2', '后天整日', '1', NULL);
INSERT INTO `ground` VALUES (3, '3', 3, '2', '今天上午8.30-11.30', '3', NULL);

SET FOREIGN_KEY_CHECKS = 1;
