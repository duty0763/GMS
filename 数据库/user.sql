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

 Date: 25/06/2020 21:50:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
