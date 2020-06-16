/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : oa

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2020-06-16 09:18:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for claim_voucher
-- ----------------------------
DROP TABLE IF EXISTS `claim_voucher`;
CREATE TABLE `claim_voucher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cause` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_sn` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `next_deal_sn` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of claim_voucher
-- ----------------------------
INSERT INTO `claim_voucher` VALUES ('1', '高峰论坛', '10004', '2020-06-15 21:39:01', null, '5000', '已打款');
INSERT INTO `claim_voucher` VALUES ('2', '大金额', '10004', '2020-06-16 08:15:08', null, '6666', '已打款');
INSERT INTO `claim_voucher` VALUES ('3', '演示', '10004', '2020-06-16 09:14:27', null, '800000', '已打款');

-- ----------------------------
-- Table structure for claim_voucher_item
-- ----------------------------
DROP TABLE IF EXISTS `claim_voucher_item`;
CREATE TABLE `claim_voucher_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `claim_voucher_id` int(11) DEFAULT NULL,
  `item` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `comment` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_4` (`claim_voucher_id`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`claim_voucher_id`) REFERENCES `claim_voucher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of claim_voucher_item
-- ----------------------------
INSERT INTO `claim_voucher_item` VALUES ('8', '1', '交通', '3000', '机票');
INSERT INTO `claim_voucher_item` VALUES ('9', '1', '住宿', '2000', '宾馆');
INSERT INTO `claim_voucher_item` VALUES ('10', '2', '办公', '6666', '设备购买');
INSERT INTO `claim_voucher_item` VALUES ('11', '3', '住宿', '800000', '演示');

-- ----------------------------
-- Table structure for deal_record
-- ----------------------------
DROP TABLE IF EXISTS `deal_record`;
CREATE TABLE `deal_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `claim_voucher_id` int(11) DEFAULT NULL,
  `deal_sn` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deal_time` datetime DEFAULT NULL,
  `deal_way` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deal_result` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_5` (`claim_voucher_id`),
  KEY `FK_Reference_6` (`deal_sn`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`claim_voucher_id`) REFERENCES `claim_voucher` (`id`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`deal_sn`) REFERENCES `employee` (`sn`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of deal_record
-- ----------------------------
INSERT INTO `deal_record` VALUES ('2', '1', '10004', '2020-06-16 07:54:23', '提交', '已提交', '无');
INSERT INTO `deal_record` VALUES ('3', '1', '10003', '2020-06-16 07:55:05', '通过', '已审核', '');
INSERT INTO `deal_record` VALUES ('4', '1', '10002', '2020-06-16 07:56:22', '打款', '已打款', '已打款');
INSERT INTO `deal_record` VALUES ('5', '2', '10004', '2020-06-16 08:15:12', '提交', '已提交', '无');
INSERT INTO `deal_record` VALUES ('6', '2', '10003', '2020-06-16 08:15:43', '通过', '待复审', '');
INSERT INTO `deal_record` VALUES ('7', '2', '10001', '2020-06-16 08:23:24', '通过', '已审核', '');
INSERT INTO `deal_record` VALUES ('8', '2', '10002', '2020-06-16 08:33:02', '打款', '已打款', '已报销，打款');
INSERT INTO `deal_record` VALUES ('9', '3', '10004', '2020-06-16 09:14:35', '提交', '已提交', '无');
INSERT INTO `deal_record` VALUES ('10', '3', '10003', '2020-06-16 09:15:05', '通过', '待复审', '');
INSERT INTO `deal_record` VALUES ('11', '3', '10001', '2020-06-16 09:15:42', '通过', '已审核', '');
INSERT INTO `deal_record` VALUES ('12', '3', '10002', '2020-06-16 09:16:30', '打款', '已打款', '打款成功');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `sn` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('10001', '总经理办公室', '星星大厦E座1201');
INSERT INTO `department` VALUES ('10002', '财务部', '星星大厦E座1202');
INSERT INTO `department` VALUES ('10003', '事业部', '星星大厦E座1101');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `sn` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department_sn` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sn`),
  KEY `FK_Reference_1` (`department_sn`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`department_sn`) REFERENCES `department` (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('10001', '111111', '马云', '10001', '总经理');
INSERT INTO `employee` VALUES ('10002', '000000', '刘强东', '10002', '财务');
INSERT INTO `employee` VALUES ('10003', '000000', '马化腾', '10003', '部门经理');
INSERT INTO `employee` VALUES ('10004', '222222', '雷军', '10003', '员工');
