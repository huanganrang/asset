/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50627
 Source Host           : localhost
 Source Database       : asset

 Target Server Type    : MySQL
 Target Server Version : 50627
 File Encoding         : utf-8

 Date: 03/03/2016 21:11:31 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `asset_attr`
-- ----------------------------
DROP TABLE IF EXISTS `asset_attr`;
CREATE TABLE `asset_attr` (
  `attr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id ',
  `attr_name` varchar(255) DEFAULT NULL COMMENT '属性名称',
  `attr_cate` varchar(255) DEFAULT NULL COMMENT '属性类别',
  `attr_status` tinyint(4) DEFAULT NULL COMMENT '属性状态 1 有效 0 无效',
  PRIMARY KEY (`attr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `asset_base_info`
-- ----------------------------
DROP TABLE IF EXISTS `asset_base_info`;
CREATE TABLE `asset_base_info` (
  `asset_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `asset_cate` varchar(255) NOT NULL COMMENT '资产种类  如交换机 路由器等',
  `asset_it_number` varchar(255) NOT NULL COMMENT 'IT验收编号',
  `asset_number` varchar(255) NOT NULL COMMENT '固定资产编号',
  `asset_type` varchar(255) NOT NULL COMMENT '设备类型',
  `asset_name` varchar(255) NOT NULL COMMENT '设备名称 （如果是电脑 则为设备小类）',
  `asset_maker` varchar(255) DEFAULT NULL COMMENT '制造商',
  `asset_model` varchar(255) NOT NULL COMMENT '设备型号',
  `asset_serial` varchar(255) DEFAULT NULL COMMENT '出厂编号',
  `asset_born_date` varchar(255) DEFAULT NULL COMMENT '出厂日期',
  `asset_repair_date` varchar(255) DEFAULT NULL COMMENT '保修截止日期',
  `asset_visit_date` varchar(255) DEFAULT NULL COMMENT '上门截止日期',
  `asset_arrive_date` varchar(255) NOT NULL COMMENT '到货入库日期',
  `asset_check_date` varchar(255) DEFAULT NULL COMMENT '验收合格日期',
  `asset_invoice` varchar(255) DEFAULT NULL COMMENT '发票号',
  `asset_property` varchar(255) DEFAULT NULL COMMENT '产权归属',
  `asset_business` varchar(255) NOT NULL COMMENT '业务条线归属',
  `asset_remark` varchar(255) DEFAULT NULL COMMENT '备注1',
  `asset_stock_status` varchar(255) DEFAULT NULL COMMENT '在库状态',
  `asset_device_status` varchar(255) DEFAULT NULL COMMENT '设备状态',
  `asset_device_location` varchar(255) DEFAULT NULL COMMENT '设备存放地点',
  `asset_use_department` varchar(255) DEFAULT NULL COMMENT '领用部门',
  `asset_user` varchar(255) DEFAULT NULL COMMENT '领用人',
  `asset_use_date` varchar(255) DEFAULT NULL COMMENT '领用日期',
  `asset_man_department` varchar(255) DEFAULT NULL COMMENT '设备管理部门',
  `asset_keep_department` varchar(255) DEFAULT NULL COMMENT '使用保管部门',
  `asset_use` varchar(255) DEFAULT NULL COMMENT '用途 （如果是电脑 则为所属系统）',
  `asset_add_method` varchar(255) DEFAULT NULL COMMENT '设备增加方式',
  `asset_change_method` varchar(255) DEFAULT NULL COMMENT '设备变动方式',
  `asset_reduce_method` varchar(255) DEFAULT NULL COMMENT '设备减少方式',
  `asset_remark2` varchar(255) DEFAULT NULL COMMENT '备注2',
  `asset_begin_date` varchar(255) DEFAULT NULL COMMENT '(如果是电脑 则为开始使用日期)',
  `asset_reserve1` varchar(255) DEFAULT NULL,
  `asset_reserve2` varchar(255) DEFAULT NULL,
  `asset_reserve3` varchar(255) DEFAULT NULL,
  `asset_add_time` timestamp NULL DEFAULT NULL,
  `asset_add_user` varchar(11) DEFAULT NULL,
  `asset_modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '资产状态 1有效 0无效',
  `asset_modify_user` varchar(11) DEFAULT NULL,
  `asset_status` varchar(255) DEFAULT NULL COMMENT '资产状态 1有效 0无效',
  PRIMARY KEY (`asset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资产基本信息表';

-- ----------------------------
--  Table structure for `asset_dic`
-- ----------------------------
DROP TABLE IF EXISTS `asset_dic`;
CREATE TABLE `asset_dic` (
  `dic_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键 自增',
  `dic_key` varchar(255) NOT NULL,
  `dic_value` varchar(255) NOT NULL,
  `dic_type` tinyint(4) NOT NULL,
  PRIMARY KEY (`dic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `asset_ext_info`
-- ----------------------------
DROP TABLE IF EXISTS `asset_ext_info`;
CREATE TABLE `asset_ext_info` (
  `asset_ext_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `asset_id` int(11) NOT NULL COMMENT '资产id',
  `asset_attr_id` int(11) NOT NULL,
  `asset_attr_value` varchar(255) DEFAULT NULL,
  `asset_status` tinyint(4) DEFAULT NULL COMMENT '1 有效 0 无效',
  `asset_add_time` timestamp NULL DEFAULT NULL,
  `asset_add_user` varchar(11) DEFAULT NULL,
  `asset_modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `asset_modify_user` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`asset_ext_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资产扩展信息表';

-- ----------------------------
--  Table structure for `tuser_notice`
-- ----------------------------
DROP TABLE IF EXISTS `tuser_notice`;
CREATE TABLE `tuser_notice` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_user` varchar(255) NOT NULL,
  `notice_source` varchar(255) DEFAULT NULL COMMENT '事件来源',
  `notice_desc` varchar(255) DEFAULT NULL COMMENT '事件描述',
  `notice_level` varchar(255) DEFAULT NULL COMMENT '事件级别',
  `notice_time` timestamp NULL DEFAULT NULL COMMENT '事件事件',
  `notice_status` varchar(255) DEFAULT NULL COMMENT '事件状态',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
