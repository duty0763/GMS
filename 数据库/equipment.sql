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

 Date: 25/06/2020 21:49:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for equipment
-- ----------------------------
DROP TABLE IF EXISTS `equipment`;
CREATE TABLE `equipment`  (
  `equId` int(0) NOT NULL AUTO_INCREMENT,
  `equName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `equNum` int(0) NULL DEFAULT NULL,
  `equPrice` float(10, 1) NULL DEFAULT NULL,
  `equRenPrice` float(10, 1) NULL DEFAULT NULL,
  `equMaiNum` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`equId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of equipment
-- ----------------------------
INSERT INTO `equipment` VALUES (2, '网球拍', 52, 2.0, 50.0, 4);
INSERT INTO `equipment` VALUES (13, '羽毛球拍', 47, 2.0, 30.0, 2);
INSERT INTO `equipment` VALUES (14, '篮球', 77, 2.0, 30.0, 3);
INSERT INTO `equipment` VALUES (15, '乒乓球拍', 60, 1.0, 20.0, NULL);
INSERT INTO `equipment` VALUES (16, '3', 9, 3.0, 3.0, NULL);
INSERT INTO `equipment` VALUES (17, '阿斯顿', 123, 1.0, 3.0, NULL);

-- ----------------------------
-- Table structure for fineannouncement
-- ----------------------------
DROP TABLE IF EXISTS `fineannouncement`;
CREATE TABLE `fineannouncement`  (
  `announcementId` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `publisher` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `publishTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`announcementId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fineannouncement
-- ----------------------------
INSERT INTO `fineannouncement` VALUES (8, '3', '3', '3', '3', '2020-06-24 09:17:36');

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

-- ----------------------------
-- Table structure for groundnotice
-- ----------------------------
DROP TABLE IF EXISTS `groundnotice`;
CREATE TABLE `groundnotice`  (
  `noticeId` int(0) NOT NULL AUTO_INCREMENT COMMENT '场地公告',
  `noticeTitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公告标题',
  `noticeText` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公告内容',
  `noticePublisher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '发布人',
  `noticePtime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '发布时间',
  PRIMARY KEY (`noticeId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of groundnotice
-- ----------------------------
INSERT INTO `groundnotice` VALUES (3, '123', '123', '123', '2020-06-12 18:47:33');
INSERT INTO `groundnotice` VALUES (4, '3', '3', '3', '2020-06-12 20:07:40');

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

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `major` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('0', '司理理', '202cb962ac59075b964b07152d234b70', '软件1173', '13178477398', '0');
INSERT INTO `user` VALUES ('1', '凤萍萍', '202cb962ac59075b964b07152d234b70', '', '13178477398', '2');
INSERT INTO `user` VALUES ('123', '123', '202cb962ac59075b964b07152d234b70', '123', '123', '0');
INSERT INTO `user` VALUES ('1234', '范闲', '202cb962ac59075b964b07152d234b70', '', '13178477398', '0');
INSERT INTO `user` VALUES ('2', '范闲', '202cb962ac59075b964b07152d234b70', '', '13178477398', '2');
INSERT INTO `user` VALUES ('201711701123', '李小狼', '202cb962ac59075b964b07152d234b70', '软件1173', '13178477398', '0');
INSERT INTO `user` VALUES ('201711701133', '教职工1', '202cb962ac59075b964b07152d234b70', '', '13178477398', '2');
INSERT INTO `user` VALUES ('3', '超级用户', '202cb962ac59075b964b07152d234b70', '', '13178477398', '3');

SET FOREIGN_KEY_CHECKS = 1;
