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

 Date: 25/06/2020 21:49:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for matchdetail
-- ----------------------------
DROP TABLE IF EXISTS `matchdetail`;
CREATE TABLE `matchdetail`  (
  `mId` int(0) NOT NULL AUTO_INCREMENT,
  `groundName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `applicant` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `referee` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `startTime` timestamp(0) NULL DEFAULT NULL,
  `endTime` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`mId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of matchdetail
-- ----------------------------
INSERT INTO `matchdetail` VALUES (15, '足球场', '3', '13178477398', '1', '2020-06-19 00:00:00', '2020-06-12 00:00:00');
INSERT INTO `matchdetail` VALUES (16, '足球场', 'aa', '1233333', 'sa', '2020-12-31 00:00:00', '2020-12-31 00:00:00');

SET FOREIGN_KEY_CHECKS = 1;
