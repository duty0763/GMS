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

 Date: 25/06/2020 21:49:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for refereeannouncement
-- ----------------------------
DROP TABLE IF EXISTS `refereeannouncement`;
CREATE TABLE `refereeannouncement`  (
  `announcementId` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `publisher` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`announcementId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of refereeannouncement
-- ----------------------------
INSERT INTO `refereeannouncement` VALUES (1, '标题哈哈', '今天李裁判休息', '李裁判', '15502073437', '2020-06-11 11:20:56');
INSERT INTO `refereeannouncement` VALUES (2, 'tt', 'tt', 'tt', 'ttttt', '2020-06-11 15:28:52');
INSERT INTO `refereeannouncement` VALUES (3, '33', '33', '123123', '1233213', '2020-06-12 22:20:05');
INSERT INTO `refereeannouncement` VALUES (4, '11111', '333', '11', '11', '2020-06-12 22:20:22');

SET FOREIGN_KEY_CHECKS = 1;
