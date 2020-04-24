/*
Navicat MySQL Data Transfer

Source Server         : qa
Source Server Version : 80019
Source Host           : localhost:3306
Source Database       : daoyunweb

Target Server Type    : MYSQL
Target Server Version : 80019
File Encoding         : 65001

Date: 2020-04-24 16:50:23
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
  `CoursePlace` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CourseId`),
  KEY `FK_Reference_4` (`TeachId`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`TeachId`) REFERENCES `user` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of course
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='paper表';

-- ----------------------------
-- Records of paper
-- ----------------------------
INSERT INTO `paper` VALUES ('2', '深度学习', '3', 'dldldl');
INSERT INTO `paper` VALUES ('3', '大数据', '4', 'bdbdbd');
INSERT INTO `paper` VALUES ('12', 'attentionnlp', '1', 'a');
INSERT INTO `paper` VALUES ('14', 'bbbb', '1', 'b');
INSERT INTO `paper` VALUES ('15', '分页测试1', '5', '嗷嗷嗷');
INSERT INTO `paper` VALUES ('17', 'pagetest3', '5', 'cc');
INSERT INTO `paper` VALUES ('18', 'pagetest5', '7', 'cc');
INSERT INTO `paper` VALUES ('19', 'pagetest6', '8', 'nn');
INSERT INTO `paper` VALUES ('20', 'dd', '2', 'dd');
INSERT INTO `paper` VALUES ('21', 'cc', '3', 'cc');
INSERT INTO `paper` VALUES ('23', '你是猪头', '3', '猪头猪头');
INSERT INTO `paper` VALUES ('24', '测试新增postman', '5', '新增新增改');
INSERT INTO `paper` VALUES ('26', '新增', '5', '啊');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of paperdetailtest
-- ----------------------------
INSERT INTO `paperdetailtest` VALUES ('1', '2', '3', 'a', '2', 'a');
INSERT INTO `paperdetailtest` VALUES ('2', '2', '22', '西安建筑科技大学', '1', 'aaa');
INSERT INTO `paperdetailtest` VALUES ('3', '2', '33', '福建师范大学', '1', 'bbb');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of role
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_role
-- ----------------------------
