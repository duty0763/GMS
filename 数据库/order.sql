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

 Date: 25/06/2020 21:49:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `ordId` int(0) NOT NULL AUTO_INCREMENT,
  `userId` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `equName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ordState` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ordTime` datetime(0) NULL DEFAULT NULL,
  `renNum` int(0) NULL DEFAULT NULL,
  `ordUTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ordId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (9, '11', '羽毛球拍', '0', '2020-06-13 21:30:12', 2, NULL);
INSERT INTO `order` VALUES (12, '1111', '羽毛球拍', '2', '2020-06-13 21:30:32', 1, '14小时39分钟');
INSERT INTO `order` VALUES (18, '1111', '网球拍', '2', '2020-06-14 13:09:56', 1, '0小时1分钟');
INSERT INTO `order` VALUES (19, '1111', '羽毛球拍', '0', '2020-06-14 13:09:56', 1, NULL);
INSERT INTO `order` VALUES (20, '1111', '篮球', '0', '2020-06-14 13:09:56', 1, NULL);
INSERT INTO `order` VALUES (27, '3', '阿斯顿', '2', '2020-06-18 13:03:36', 3, '0小时0分钟');

SET FOREIGN_KEY_CHECKS = 1;
