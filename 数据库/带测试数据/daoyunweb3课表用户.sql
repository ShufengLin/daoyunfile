/*
Navicat MySQL Data Transfer

Source Server         : lin
Source Server Version : 80019
Source Host           : localhost:3306
Source Database       : daoyunweb

Target Server Type    : MYSQL
Target Server Version : 80019
File Encoding         : 65001

Date: 2020-05-10 20:48:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `CourseId` int NOT NULL AUTO_INCREMENT,
  `CourseName` varchar(255) DEFAULT NULL,
  `CourseHour` int DEFAULT NULL,
  `TeachId` int NOT NULL,
  `StartTime` datetime DEFAULT NULL,
  `CoursePlace` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CourseId`),
  KEY `FK_Reference_4` (`TeachId`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`TeachId`) REFERENCES `user` (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '软件开发', '26', '5', '2019-08-06 00:00:00', '东1-203');
INSERT INTO `course` VALUES ('2', '云计算', '54', '3', '2019-02-06 00:00:00', '东1-103');
INSERT INTO `course` VALUES ('3', '大数据处理', '54', '4', '2019-02-06 00:00:00', '文1-303');
INSERT INTO `course` VALUES ('4', '智能图像分析', '54', '5', '2019-02-06 00:00:00', '文2-303');
INSERT INTO `course` VALUES ('5', '工程实践', '54', '6', '2019-02-06 00:00:00', '文3-303');
INSERT INTO `course` VALUES ('6', '工程英语', '54', '2', '2019-02-06 00:00:00', '文3-304');
INSERT INTO `course` VALUES ('7', '软件', '54', '5', '2019-08-06 00:00:00', '东1-203');
INSERT INTO `course` VALUES ('8', '智能技术', '54', '4', '2019-02-06 00:00:00', '东3-303');

-- ----------------------------
-- Table structure for course_sign
-- ----------------------------
DROP TABLE IF EXISTS `course_sign`;
CREATE TABLE `course_sign` (
  `SignId` int NOT NULL AUTO_INCREMENT,
  `CourseId` int DEFAULT NULL,
  `StudentId` int DEFAULT NULL,
  `SignPlace` varchar(255) DEFAULT NULL,
  `SignTime` datetime DEFAULT NULL,
  `SignStatus` int DEFAULT NULL,
  PRIMARY KEY (`SignId`),
  KEY `FK_Reference_5` (`CourseId`),
  KEY `FK_Reference_6` (`StudentId`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`CourseId`) REFERENCES `course` (`CourseId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`StudentId`) REFERENCES `user` (`UserId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of course_sign
-- ----------------------------

-- ----------------------------
-- Table structure for course_student
-- ----------------------------
DROP TABLE IF EXISTS `course_student`;
CREATE TABLE `course_student` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CourseId` int DEFAULT NULL,
  `StudentId` int DEFAULT NULL,
  `StudentEXP` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Reference_2` (`CourseId`),
  KEY `FK_Reference_3` (`StudentId`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`CourseId`) REFERENCES `course` (`CourseId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`StudentId`) REFERENCES `user` (`UserId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of course_student
-- ----------------------------

-- ----------------------------
-- Table structure for dictionary
-- ----------------------------
DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE `dictionary` (
  `DicId` int NOT NULL,
  `DicName` varchar(255) DEFAULT NULL,
  `DicDescription` varchar(255) DEFAULT NULL,
  `Code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DicId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of dictionary
-- ----------------------------

-- ----------------------------
-- Table structure for dictionarydetail
-- ----------------------------
DROP TABLE IF EXISTS `dictionarydetail`;
CREATE TABLE `dictionarydetail` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `DicId` int DEFAULT NULL,
  `ItemKey` int DEFAULT NULL,
  `ItemValue` varchar(32) DEFAULT NULL,
  `IsDefault` int DEFAULT NULL,
  `Code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Reference_7` (`DicId`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`DicId`) REFERENCES `dictionary` (`DicId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of dictionarydetail
-- ----------------------------

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `MenuId` int NOT NULL AUTO_INCREMENT,
  `MenuName` varchar(255) DEFAULT NULL,
  `MenuURL` varchar(255) DEFAULT NULL,
  `MenuIcon` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`MenuId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of menu
-- ----------------------------

-- ----------------------------
-- Table structure for paper
-- ----------------------------
DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper` (
  `paper_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'paperID',
  `name` varchar(100) NOT NULL COMMENT 'paper名称',
  `number` int NOT NULL COMMENT 'paper数量',
  `detail` varchar(200) NOT NULL COMMENT 'paper描述',
  PRIMARY KEY (`paper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='paper表';

-- ----------------------------
-- Records of paper
-- ----------------------------
INSERT INTO `paper` VALUES ('38', '学校', '1', '学校字典');
INSERT INTO `paper` VALUES ('39', '国籍', '2', '国籍字典');
INSERT INTO `paper` VALUES ('40', '证件', '3', '证件字典');
INSERT INTO `paper` VALUES ('41', '学院', '4', '学院字典');
INSERT INTO `paper` VALUES ('42', '专业', '5', '专业字典');
INSERT INTO `paper` VALUES ('43', '课程', '6', '课程字典');

-- ----------------------------
-- Table structure for paperdetailtest
-- ----------------------------
DROP TABLE IF EXISTS `paperdetailtest`;
CREATE TABLE `paperdetailtest` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `PaperId` bigint DEFAULT NULL,
  `ItemKey` int DEFAULT NULL,
  `ItemValue` varchar(32) DEFAULT NULL,
  `IsDefault` int DEFAULT NULL,
  `Code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Reference_7` (`PaperId`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of paperdetailtest
-- ----------------------------
INSERT INTO `paperdetailtest` VALUES ('19', '43', '1', '智能技术', '0', '');
INSERT INTO `paperdetailtest` VALUES ('20', '43', '2', '人工智能', '0', '');
INSERT INTO `paperdetailtest` VALUES ('21', '43', '3', '工程实践', '0', '');
INSERT INTO `paperdetailtest` VALUES ('22', '42', '1', '计算机技术', '0', '');
INSERT INTO `paperdetailtest` VALUES ('23', '42', '2', '软件工程', '0', '');
INSERT INTO `paperdetailtest` VALUES ('24', '42', '3', '网络安全', '0', '');
INSERT INTO `paperdetailtest` VALUES ('25', '41', '1', '数学与计算机科学学院', '0', '');
INSERT INTO `paperdetailtest` VALUES ('26', '41', '2', '土木工程学院', '0', '');
INSERT INTO `paperdetailtest` VALUES ('27', '40', '1', '身份证', '0', '');
INSERT INTO `paperdetailtest` VALUES ('28', '40', '2', '行驶证', '0', '');
INSERT INTO `paperdetailtest` VALUES ('29', '40', '3', '驾驶证', '0', '');
INSERT INTO `paperdetailtest` VALUES ('30', '40', '4', '军官证', '0', '');
INSERT INTO `paperdetailtest` VALUES ('31', '39', '1', '中国', '0', '');
INSERT INTO `paperdetailtest` VALUES ('32', '39', '2', '美国', '0', '');
INSERT INTO `paperdetailtest` VALUES ('33', '39', '3', '俄罗斯', '0', '');
INSERT INTO `paperdetailtest` VALUES ('34', '39', '4', '日本', '0', '');
INSERT INTO `paperdetailtest` VALUES ('35', '38', '1', '福州大学', '0', '');
INSERT INTO `paperdetailtest` VALUES ('36', '38', '2', '西安建筑科技大学', '0', '');
INSERT INTO `paperdetailtest` VALUES ('37', '38', '3', '福建师范大学', '0', '');

-- ----------------------------
-- Table structure for permision
-- ----------------------------
DROP TABLE IF EXISTS `permision`;
CREATE TABLE `permision` (
  `PermissionId` int NOT NULL AUTO_INCREMENT,
  `MenuId` int DEFAULT NULL,
  `PermissionName` varchar(255) DEFAULT NULL,
  `PermissionDescription` varchar(255) DEFAULT NULL,
  `ParentId` int DEFAULT NULL,
  PRIMARY KEY (`PermissionId`),
  KEY `FK_Reference_11` (`MenuId`),
  KEY `FK_Reference_14` (`ParentId`),
  CONSTRAINT `FK_Reference_11` FOREIGN KEY (`MenuId`) REFERENCES `menu` (`MenuId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_14` FOREIGN KEY (`ParentId`) REFERENCES `permision` (`PermissionId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of permision
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `RoleId` int NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(255) DEFAULT NULL,
  `RoleDescription` varchar(255) DEFAULT NULL,
  `IsLock` int DEFAULT NULL,
  `Creator` varchar(20) DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`RoleId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '管理员', null, null, null, null);
INSERT INTO `role` VALUES ('2', '老师', null, null, null, null);
INSERT INTO `role` VALUES ('3', '学生', null, null, null, null);

-- ----------------------------
-- Table structure for roledescription
-- ----------------------------
DROP TABLE IF EXISTS `roledescription`;
CREATE TABLE `roledescription` (
  `RolePermisionId` int NOT NULL AUTO_INCREMENT,
  `RoleId` int DEFAULT NULL,
  `RightId` int DEFAULT NULL,
  PRIMARY KEY (`RolePermisionId`),
  KEY `FK_Reference_10` (`RightId`),
  KEY `FK_Reference_9` (`RoleId`),
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`RightId`) REFERENCES `permision` (`PermissionId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`RoleId`) REFERENCES `role` (`RoleId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of roledescription
-- ----------------------------

-- ----------------------------
-- Table structure for teachersign
-- ----------------------------
DROP TABLE IF EXISTS `teachersign`;
CREATE TABLE `teachersign` (
  `TeacherSignId` int NOT NULL AUTO_INCREMENT,
  `TeacherId` int DEFAULT NULL,
  `CourseId` int DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  PRIMARY KEY (`TeacherSignId`),
  KEY `FK_Reference_15` (`TeacherId`),
  KEY `FK_Reference_16` (`CourseId`),
  CONSTRAINT `FK_Reference_15` FOREIGN KEY (`TeacherId`) REFERENCES `user` (`UserId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_16` FOREIGN KEY (`CourseId`) REFERENCES `course` (`CourseId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of teachersign
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `UserId` int NOT NULL AUTO_INCREMENT,
  `UserName` varchar(255) DEFAULT NULL,
  `UserEducation` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `School` varchar(255) DEFAULT NULL,
  `Academy` varchar(255) DEFAULT NULL,
  `Major` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'lin', '', '123344444', '123', '福州大学', '数学与计算机学院', '计算机技术');
INSERT INTO `user` VALUES ('2', '陈老师', null, '133344444', '123', '福州大学', '数学与计算机学院', '计算机技术');
INSERT INTO `user` VALUES ('3', '肖老师', null, '123344444', '123', '福州大学', '数学与计算机学院', '计算机技术');
INSERT INTO `user` VALUES ('4', '林老师', null, '123344444', '123', '福州大学', '数学与计算机学院', '计算机技术');
INSERT INTO `user` VALUES ('5', '蔡老师', null, '123344444', '123', '福州大学', '数学与计算机学院', '计算机技术');
INSERT INTO `user` VALUES ('6', '何老师', null, '123344444', '123', '福州大学', '数学与计算机学院', '软件工程');
INSERT INTO `user` VALUES ('7', '池老师', null, '123344444', '123', '福州大学', '数学与计算机学院', '软件工程');
INSERT INTO `user` VALUES ('8', '陈同学', null, '123344444', '123', '福州大学', '数学与计算机学院', '计算机技术');
INSERT INTO `user` VALUES ('9', '林同学', null, '123344444', '123', '福州大学', '数学与计算机学院', '计算机技术');
INSERT INTO `user` VALUES ('10', '蔡同学', null, '123344444', '123', '福州大学', '数学与计算机学院', '软件工程');
INSERT INTO `user` VALUES ('11', '肖同学', null, '123344444', '123', '福州大学', '数学与计算机学院', '软件工程');
INSERT INTO `user` VALUES ('12', '郑同学', null, '123344444', '123', '福州大学', '数学与计算机学院', '计算机技术');
INSERT INTO `user` VALUES ('13', '火同学', null, '123344444', '123', '福州大学', '数学与计算机学院', '计算机技术');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserId` int DEFAULT NULL,
  `RoleId` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Reference_12` (`RoleId`),
  KEY `FK_Reference_13` (`UserId`),
  CONSTRAINT `FK_Reference_12` FOREIGN KEY (`RoleId`) REFERENCES `role` (`RoleId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_13` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1', '1');
INSERT INTO `user_role` VALUES ('2', '2', '2');
INSERT INTO `user_role` VALUES ('3', '3', '2');
INSERT INTO `user_role` VALUES ('4', '4', '2');
INSERT INTO `user_role` VALUES ('5', '5', '2');
INSERT INTO `user_role` VALUES ('6', '6', '2');
INSERT INTO `user_role` VALUES ('7', '7', '2');
INSERT INTO `user_role` VALUES ('8', '8', '3');
INSERT INTO `user_role` VALUES ('9', '9', '3');
INSERT INTO `user_role` VALUES ('10', '10', '3');
INSERT INTO `user_role` VALUES ('11', '11', '3');
INSERT INTO `user_role` VALUES ('12', '12', '3');
INSERT INTO `user_role` VALUES ('13', '13', '3');
