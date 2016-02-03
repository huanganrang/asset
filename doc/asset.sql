/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50626
 Source Host           : 127.0.0.1
 Source Database       : asset

 Target Server Type    : MySQL
 Target Server Version : 50626
 File Encoding         : utf-8

 Date: 02/03/2016 20:57:41 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `jb_administrative_division`
-- ----------------------------
DROP TABLE IF EXISTS `jb_administrative_division`;
CREATE TABLE `jb_administrative_division` (
  `id` varchar(36) NOT NULL,
  `name` varchar(72) DEFAULT NULL COMMENT '名称',
  `pid` varchar(36) DEFAULT NULL COMMENT '父级ID',
  `level` varchar(4) DEFAULT NULL COMMENT '行政级别',
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jb_assets`
-- ----------------------------
DROP TABLE IF EXISTS `jb_assets`;
CREATE TABLE `jb_assets` (
  `id` varchar(36) NOT NULL,
  `asset_number` varchar(32) DEFAULT NULL COMMENT '资产编号',
  `first_category` varchar(4) DEFAULT NULL COMMENT '资产种类{AT}',
  `second_category` varchar(4) DEFAULT NULL COMMENT '二级分类{SC}',
  `description` varchar(512) DEFAULT NULL COMMENT '资产描述',
  `factory` varchar(4) DEFAULT NULL COMMENT '生产厂家{FY}',
  `asset_type` varchar(10) DEFAULT NULL COMMENT '型号{TN}',
  `serial_number` varchar(64) DEFAULT NULL COMMENT '序列号',
  `location` varchar(128) DEFAULT NULL COMMENT '位置',
  `dept_Id` varchar(36) DEFAULT NULL COMMENT '部门{SL02}',
  `principal` varchar(36) DEFAULT NULL COMMENT '资产负责人',
  `buy_date` date DEFAULT NULL COMMENT '购买日期',
  `make_date` date DEFAULT NULL COMMENT '装日期/投产日',
  `supplier` varchar(128) DEFAULT NULL COMMENT '供应商名称',
  `supplier_phone` varchar(32) DEFAULT NULL COMMENT '供应商联系电话',
  `measure` varchar(32) DEFAULT NULL COMMENT '尺寸',
  `weight` float DEFAULT NULL COMMENT '重量',
  `standard_power` float DEFAULT NULL COMMENT '标准功率',
  `icon` varchar(128) DEFAULT NULL COMMENT '图标地址',
  `parent_id` varchar(36) DEFAULT NULL COMMENT '机柜/机房ID{SL03}',
  `room_area_id` varchar(36) DEFAULT NULL COMMENT '区域ID{SL04}',
  `scope` varchar(128) DEFAULT NULL COMMENT '范围',
  `u_place` int(11) DEFAULT NULL COMMENT 'U位数',
  `uid` varchar(32) DEFAULT NULL COMMENT 'uid',
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `jb_assets`
-- ----------------------------
BEGIN;
INSERT INTO `jb_assets` VALUES ('0d4e134d-dc51-4c0c-b2f0-3974a0d16fd4', '111', 'AT01', '', '', '', '', '', null, '', '', null, null, '', '', '22', '323', '223', null, '46fff7c0-93b2-4e2c-844b-781c77364e9f', null, '1-2', null, '', '2015-09-12 17:26:05'), ('19d8aca9-7c8e-4c63-9118-05a3364d1a65', 'AT000008', '', '', '', '', '', '', '', '', '', null, null, '', '', '', null, null, '', 'd46aef05-8af7-468b-a12f-42fdd484bcdb', '', '', null, '', '2015-08-19 22:37:12'), ('2ccbc4e9-8adf-4084-984a-650003f660d4', 'AT0000001', 'AT01', '', '111', '', '', '', '', '', '', null, null, '', '', '', null, null, '', 'bbbad213-e71f-42d0-a697-ed5c39fedb33', '', '{\"left\":202,\"top\":190,\"right\":234,\"bottom\":244,\"width\":32,\"height\":54,\"rotate\":1.942890293094024e-16}', null, '', '2015-08-17 22:55:09'), ('378ea6dd-09ed-4f29-9a6c-ac9d5af641b6', 'AT000003', 'AT01', '', '', '', '', '', '', '', '', null, null, '', '', '', null, null, '', 'bbbad213-e71f-42d0-a697-ed5c39fedb33', '', '{\"left\":163,\"top\":307,\"right\":194,\"bottom\":366,\"width\":31,\"height\":59,\"rotate\":0}', null, '', '2015-08-19 22:34:11'), ('3c09c7cf-6a97-46bd-a0c1-ac54ec4e9af0', '555', 'AT01', '', '', '', '', '', null, '', '', null, null, '', '', '11', '223', '123', null, '46fff7c0-93b2-4e2c-844b-781c77364e9f', null, '5-5', null, '', '2015-09-12 20:19:44'), ('3c0de785-19c0-45d4-993c-40d48fe09dca', 'AT000006', '', '', '', '', '', '', '', '', '', null, null, '', '', '', null, null, '', 'd46aef05-8af7-468b-a12f-42fdd484bcdb', '', '', null, '', '2015-08-19 22:36:53'), ('46fff7c0-93b2-4e2c-844b-781c77364e9f', 'AT0000011', 'AT03', '', '', '', 'TN0001', '', '', '', '', null, null, '', '', '', null, null, '', 'bbbad213-e71f-42d0-a697-ed5c39fedb33', '', '', '10', '', '2015-08-19 22:38:03'), ('4fc5f931-70fe-4587-9563-2087186d792e', 'AT0000005', '', '', '', '', '', '', '', '', '', null, null, '', '', '', null, null, '', 'bbbad213-e71f-42d0-a697-ed5c39fedb33', '', '{\"left\":160,\"top\":100,\"right\":192,\"bottom\":132,\"width\":32,\"height\":32,\"rotate\":0}', null, '', '2015-08-19 22:34:52'), ('6c0bc376-f9b3-4227-b7e1-22c525d2109e', 'AT0000002', 'AT01', '', '', '', '', '', '', '', '', null, null, '', '', '', null, null, '', 'bbbad213-e71f-42d0-a697-ed5c39fedb33', '', '{\"left\":164,\"top\":191,\"right\":196,\"bottom\":244,\"width\":32,\"height\":53,\"rotate\":0}', null, '', '2015-08-18 23:22:58'), ('7e634de5-b8fb-4baa-af7b-4e72181172f1', '777', 'AT01', '', '', '', '', '', null, '', '', null, null, '', '', '11', '223', '123', null, '46fff7c0-93b2-4e2c-844b-781c77364e9f', null, '6-6', null, '', '2015-09-12 20:19:44'), ('96c9b091-bff4-45ca-8090-acb56e99144b', 'AT0000010', '', '', '', '', '', '', '', '', '', null, null, '', '', '', null, null, '', 'd46aef05-8af7-468b-a12f-42fdd484bcdb', '', '', null, '', '2015-08-19 22:37:48'), ('97da66f0-c481-4513-9a08-e118b9d4efdd', '66', 'AT01', '', '', '', '', '', null, '', '', null, null, '', '', '11', '223', '123', null, '46fff7c0-93b2-4e2c-844b-781c77364e9f', null, '9-9', null, '', '2015-09-12 20:19:44'), ('a14df3bf-649d-4806-ab56-e884ba79cd88', 'AT000009', '', '', '', '', '', '', '', '', '', null, null, '', '', '', null, null, '', 'd46aef05-8af7-468b-a12f-42fdd484bcdb', '', '', null, '', '2015-08-19 22:37:39'), ('c7572e96-7439-40fb-863e-5f1c72a6381a', '22211', 'AT01', '', '', '', '', '', null, '', '', null, null, '', '', '11', '223', '123', null, '46fff7c0-93b2-4e2c-844b-781c77364e9f', null, '8-8', null, '', '2015-09-12 20:19:44'), ('db57bdfd-52bf-4414-b6de-0efce299e452', 'AT0000007', '', '', '', '', '', '', '', '', '', null, null, '', '', '', null, null, '', 'd46aef05-8af7-468b-a12f-42fdd484bcdb', '', '', null, '', '2015-08-19 22:37:03'), ('e0e0faeb-1510-426b-b48a-c067acef1959', 'AT000004', '', '', '', '', '', '', '', '', '', null, null, '', '', '', null, null, '', 'bbbad213-e71f-42d0-a697-ed5c39fedb33', '', '{\"left\":247,\"top\":99,\"right\":279,\"bottom\":131,\"width\":32,\"height\":32,\"rotate\":-0.5}', null, '', '2015-08-19 22:34:35');
COMMIT;

-- ----------------------------
--  Table structure for `jb_department`
-- ----------------------------
DROP TABLE IF EXISTS `jb_department`;
CREATE TABLE `jb_department` (
  `id` varchar(36) NOT NULL,
  `name` varchar(72) DEFAULT NULL COMMENT '名称',
  `pid` varchar(36) DEFAULT NULL COMMENT '父级ID',
  `principal` varchar(36) DEFAULT NULL COMMENT '责任人',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jb_machine_room`
-- ----------------------------
DROP TABLE IF EXISTS `jb_machine_room`;
CREATE TABLE `jb_machine_room` (
  `id` varchar(36) NOT NULL,
  `name` varchar(36) DEFAULT NULL COMMENT '机房名称',
  `image_path` varchar(128) DEFAULT NULL COMMENT '图片地址',
  `areaCode` varchar(36) DEFAULT NULL COMMENT '地区代码{SL01}',
  `address` varchar(256) DEFAULT NULL COMMENT '详细地址',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `jb_machine_room`
-- ----------------------------
BEGIN;
INSERT INTO `jb_machine_room` VALUES ('bbbad213-e71f-42d0-a697-ed5c39fedb33', '南汇机房01', 'uploadfiles/machineroom/machineroom_5Rhz1439994553571.png', '', '111', 'teste', '2015-08-09 15:56:39'), ('d46aef05-8af7-468b-a12f-42fdd484bcdb', '南汇机房02', 'uploadfiles/machineroom/machineroom_0p2b1439216584757.png', '', '', '', '2015-08-10 22:23:05'), ('df348c40-58ac-4e64-ae77-3c93683e97a1', '测试机房', 'uploadfiles/machineroom/machineroom_6Moj1439099016242.jpg', '', '111', '', '2015-08-09 13:43:37');
COMMIT;

-- ----------------------------
--  Table structure for `jb_machine_room_area`
-- ----------------------------
DROP TABLE IF EXISTS `jb_machine_room_area`;
CREATE TABLE `jb_machine_room_area` (
  `id` varchar(36) NOT NULL,
  `room_id` varchar(36) DEFAULT NULL COMMENT '机房ID',
  `name` varchar(36) DEFAULT NULL COMMENT '区域名称',
  `scope` varchar(128) DEFAULT NULL COMMENT '范围',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jb_machine_room_remark`
-- ----------------------------
DROP TABLE IF EXISTS `jb_machine_room_remark`;
CREATE TABLE `jb_machine_room_remark` (
  `id` varchar(36) NOT NULL,
  `addtime` datetime DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `room_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `jb_machine_room_remark`
-- ----------------------------
BEGIN;
INSERT INTO `jb_machine_room_remark` VALUES ('3d2908b2-7808-4b9c-b6a5-0efdf539cda8', '2015-09-05 18:53:04', '{\"left\":472.615966796875,\"top\":432,\"right\":554.3439636230469,\"bottom\":448,\"width\":81.72799682617188,\"height\":16,\"rotate\":0,\"text\":\"南汇机房01\"}', 'bbbad213-e71f-42d0-a697-ed5c39fedb33'), ('9212184b-8888-4def-b90f-551778702e16', '2015-09-05 18:53:04', '{\"left\":452.615966796875,\"top\":266,\"right\":500.615966796875,\"bottom\":282,\"width\":48,\"height\":16,\"rotate\":0,\"text\":\"第二排\"}', 'bbbad213-e71f-42d0-a697-ed5c39fedb33'), ('bb5cd4d6-e935-484f-a6ab-17ecf1211120', '2015-09-05 18:53:04', '{\"left\":674.615966796875,\"top\":120,\"right\":722.615966796875,\"bottom\":136,\"width\":48,\"height\":16,\"rotate\":0,\"text\":\"第一排\"}', 'bbbad213-e71f-42d0-a697-ed5c39fedb33');
COMMIT;

-- ----------------------------
--  Table structure for `jb_maintain_base`
-- ----------------------------
DROP TABLE IF EXISTS `jb_maintain_base`;
CREATE TABLE `jb_maintain_base` (
  `id` varchar(36) NOT NULL,
  `asset_id` varchar(36) DEFAULT NULL COMMENT '资产ID',
  `maintain_unit` varchar(126) DEFAULT NULL COMMENT '维护单位',
  `telphone` varchar(16) DEFAULT NULL COMMENT '联系方式',
  `end_date` date DEFAULT NULL COMMENT '维保到期时间',
  `check_cycle` varchar(36) DEFAULT NULL COMMENT '巡检周期',
  `check_mode` varchar(36) DEFAULT NULL COMMENT '维保模式',
  `next_check_date` date DEFAULT NULL COMMENT '下次巡检时间',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jb_regular_check`
-- ----------------------------
DROP TABLE IF EXISTS `jb_regular_check`;
CREATE TABLE `jb_regular_check` (
  `id` varchar(36) NOT NULL,
  `maintain_id` varchar(36) DEFAULT NULL COMMENT '基础表ID',
  `check_date` datetime DEFAULT NULL COMMENT '巡检时间',
  `check_order` varchar(36) DEFAULT NULL COMMENT '巡检单号',
  `check_people` varchar(18) DEFAULT NULL COMMENT '巡检人',
  `check_phone` varchar(18) DEFAULT NULL COMMENT '联系方式',
  `summary` varchar(256) DEFAULT NULL COMMENT '概述',
  `scan_file` varchar(64) DEFAULT NULL COMMENT '原件扫描',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `jb_repair_check`
-- ----------------------------
DROP TABLE IF EXISTS `jb_repair_check`;
CREATE TABLE `jb_repair_check` (
  `id` varchar(36) NOT NULL,
  `maintain_id` varchar(36) DEFAULT NULL COMMENT '基础表ID',
  `repair_date` datetime DEFAULT NULL COMMENT '修理时间',
  `repair_order` varchar(36) DEFAULT NULL COMMENT '修理单号',
  `repair_people` varchar(18) DEFAULT NULL COMMENT '修理人',
  `repair_phone` varchar(18) DEFAULT NULL COMMENT '联系方式',
  `summary` varchar(256) DEFAULT NULL COMMENT '概述',
  `scan_file` varchar(64) DEFAULT NULL COMMENT '原件扫描',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tbasedata`
-- ----------------------------
DROP TABLE IF EXISTS `tbasedata`;
CREATE TABLE `tbasedata` (
  `id` varchar(32) NOT NULL,
  `description` varchar(256) DEFAULT NULL,
  `icon` longtext,
  `NAME` varchar(100) NOT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `SEQ` int(11) DEFAULT NULL,
  `basetype_code` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_2olwoajkvhsgxrdsrbnua811r` (`basetype_code`),
  CONSTRAINT `FK_2olwoajkvhsgxrdsrbnua811r` FOREIGN KEY (`basetype_code`) REFERENCES `tbasetype` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tbasedata`
-- ----------------------------
BEGIN;
INSERT INTO `tbasedata` VALUES ('AT01', '', null, 'IT设备', '', '100', 'AT'), ('AT02', '', null, '动环设备', '', '100', 'AT'), ('AT03', '', null, '机柜', '', '100', 'AT'), ('EX0001', '全局系统异常提示', null, '系统繁忙！', null, '1', 'EX'), ('SL01', 'select id as value,name as text  from jb_administrative_division', null, '查询地区', '', '100', 'SL'), ('SL02', 'select concat(id,\',\',image_path) as value,name as text  from jb_machine_room', null, '查询机房(机房部署页)', '', '100', 'SL'), ('SV001', '系统title', null, 'Jbase平台', null, '1', 'SV'), ('SV002', '版权所有', null, '版权所有@John', null, '2', 'SV'), ('SV003', 'welcome', null, '欢迎使用Jbase平台', null, '3', 'SV'), ('SV004', '0：开发，1：测试，2：生产', null, '2', null, '4', 'SV'), ('TN0001', '', 'uploadfiles/basedata/TN/jigui.png', '默认机柜', 'AT03', '100', 'TN'), ('TN1001', '', 'uploadfiles/basedata/TN/fuwuqi.png', '默认服务器', 'AT01', '100', 'TN');
COMMIT;

-- ----------------------------
--  Table structure for `tbasetype`
-- ----------------------------
DROP TABLE IF EXISTS `tbasetype`;
CREATE TABLE `tbasetype` (
  `code` varchar(2) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tbasetype`
-- ----------------------------
BEGIN;
INSERT INTO `tbasetype` VALUES ('AT', '资产类别', '0'), ('EX', '异常', '0'), ('SL', 'SQL', '0'), ('SV', '系统环境变量', '0'), ('TN', '资产型号', '0');
COMMIT;

-- ----------------------------
--  Table structure for `tbug`
-- ----------------------------
DROP TABLE IF EXISTS `tbug`;
CREATE TABLE `tbug` (
  `ID` varchar(36) NOT NULL,
  `CREATEDATETIME` datetime DEFAULT NULL,
  `MODIFYDATETIME` datetime DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `NOTE` longtext,
  `BUGTYPE_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_q8x2eyh7d65rv7vcd7iw2h8yf` (`BUGTYPE_ID`),
  CONSTRAINT `FK_q8x2eyh7d65rv7vcd7iw2h8yf` FOREIGN KEY (`BUGTYPE_ID`) REFERENCES `tbugtype` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tbugtype`
-- ----------------------------
DROP TABLE IF EXISTS `tbugtype`;
CREATE TABLE `tbugtype` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tbugtype`
-- ----------------------------
BEGIN;
INSERT INTO `tbugtype` VALUES ('0', '错误'), ('1', '功能');
COMMIT;

-- ----------------------------
--  Table structure for `tresource`
-- ----------------------------
DROP TABLE IF EXISTS `tresource`;
CREATE TABLE `tresource` (
  `ID` varchar(36) NOT NULL,
  `ICON` varchar(100) DEFAULT NULL,
  `NAME` varchar(100) NOT NULL,
  `REMARK` varchar(200) DEFAULT NULL,
  `SEQ` int(11) DEFAULT NULL,
  `URL` varchar(200) DEFAULT NULL,
  `PID` varchar(36) DEFAULT NULL,
  `TRESOURCETYPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_m0i6pj14hcg1mleojnl7igg6o` (`PID`),
  KEY `FK_6w0sgqbec1o81uqqjsmejg57p` (`TRESOURCETYPE_ID`),
  CONSTRAINT `FK_6w0sgqbec1o81uqqjsmejg57p` FOREIGN KEY (`TRESOURCETYPE_ID`) REFERENCES `tresourcetype` (`ID`),
  CONSTRAINT `FK_m0i6pj14hcg1mleojnl7igg6o` FOREIGN KEY (`PID`) REFERENCES `tresource` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tresource`
-- ----------------------------
BEGIN;
INSERT INTO `tresource` VALUES ('0CF5D37231DB4890BA0EB407AF174FFE', 'brick', '删除资产', '', '30', '/jbAssetsController/delete', '42D98D488A154C4AB5A7D879D38E6695', '1'), ('0dad98dc-5f1b-4613-9f5e-5702c4b1684c', 'house', '机房部署', '', '100', '/jbmachineroom/jbMachineRoomHtml5.jsp', null, '0'), ('102EB23ECBC94B21BB19A3623080A28B', null, '添加部门页面', null, '10', '/jbDepartmentController/addPage', 'DEFFE71F00F045639C7CD534419D0F8D', '1'), ('12A36BFF53224C31A2E26C08053DC94F', null, '修改行政区划页面', null, '25', '/jbAdministrativeDivisionController/edit', 'CDAAB97A4ACF40A7A329D41D35073A6C', '1'), ('27B857584E4F465BBE07D27283499AED', null, '添加行政区划页面', null, '10', '/jbAdministrativeDivisionController/addPage', 'CDAAB97A4ACF40A7A329D41D35073A6C', '1'), ('2F507E19F41347A698CF9CCC4CF6AB8A', null, '查看机房', null, '35', '/jbMachineRoomController/view', '6F6D27E0C1624BC0AEBEABCF6EE64587', '1'), ('414BAE5610DD4084A162632F1EAA3FBE', null, '添加资产', null, '15', '/jbAssetsController/add', '42D98D488A154C4AB5A7D879D38E6695', '1'), ('42D98D488A154C4AB5A7D879D38E6695', 'computer', '资产管理', '', '100', '/jbAssetsController/manager', null, '0'), ('47A9BDB14C6546A8BA35363F62EB70F3', null, '删除部门', null, '30', '/jbDepartmentController/delete', 'DEFFE71F00F045639C7CD534419D0F8D', '1'), ('49D6536D21A44EC190A71CA9BF7F7EBB', null, '添加行政区划', null, '15', '/jbAdministrativeDivisionController/add', 'CDAAB97A4ACF40A7A329D41D35073A6C', '1'), ('53025FE17DE1450CA59444D52DE5056B', null, '下载资产', null, '40', '/jbAssetsController/download', '42D98D488A154C4AB5A7D879D38E6695', '1'), ('5825CAEC4521466F9501ADCEFF19A5B9', null, '修改部门页面', null, '25', '/jbDepartmentController/edit', 'DEFFE71F00F045639C7CD534419D0F8D', '1'), ('5DF2DD0A9F6C455F800EB43FF3E6A6C7', null, '删除机房', null, '30', '/jbMachineRoomController/delete', '6F6D27E0C1624BC0AEBEABCF6EE64587', '1'), ('5DFE66DF961A474EB4B711623A881043', null, '修改资产页面', null, '20', '/jbAssetsController/editPage', '42D98D488A154C4AB5A7D879D38E6695', '1'), ('6143101c-3fc6-497b-b841-951058df3c2e', null, '机房部署', '', '100', '/jbmachineroom/jbMachineRoomSysMain.jsp', null, '1'), ('61B385D3EC5F4F8681375B5D556BBF03', null, '查看部门', null, '35', '/jbDepartmentController/view', 'DEFFE71F00F045639C7CD534419D0F8D', '1'), ('66F9CC0A786B4F548234754417060477', null, '修改行政区划页面', null, '20', '/jbAdministrativeDivisionController/editPage', 'CDAAB97A4ACF40A7A329D41D35073A6C', '1'), ('6F3A1B793F7D4AD9982655E133C91EAB', null, '修改资产页面', null, '25', '/jbAssetsController/edit', '42D98D488A154C4AB5A7D879D38E6695', '1'), ('6F6D27E0C1624BC0AEBEABCF6EE64587', 'brick', '机房管理', '', '100', '/jbMachineRoomController/manager', null, '0'), ('7F3728ED48E44FCFA07896687CD28B4A', null, '下载部门', null, '40', '/jbDepartmentController/download', 'DEFFE71F00F045639C7CD534419D0F8D', '1'), ('87A6DADFC7EA4572BC803B86299405F4', null, '下载行政区划', null, '40', '/jbAdministrativeDivisionController/download', 'CDAAB97A4ACF40A7A329D41D35073A6C', '1'), ('9325b3f3-dc6a-4973-83cd-21dc7e0f89c5', null, '获取机房配置', '', '100', '/jbMachineRoomController/getRemarkList', '0dad98dc-5f1b-4613-9f5e-5702c4b1684c', '1'), ('937F663E1F6B4DD5B9BF7A4620D9D7AE', null, '添加机房', null, '15', '/jbMachineRoomController/add', '6F6D27E0C1624BC0AEBEABCF6EE64587', '1'), ('94FA6270B10F4BAA9A88E7F814BE9BE2', null, '修改部门页面', null, '20', '/jbDepartmentController/editPage', 'DEFFE71F00F045639C7CD534419D0F8D', '1'), ('9BBCD8EDCF7A452CAC015CFA3C98E0FC', null, '查看行政区划', null, '35', '/jbAdministrativeDivisionController/view', 'CDAAB97A4ACF40A7A329D41D35073A6C', '1'), ('9C95F24F5EFA4F31A62B5DEF88C1921B', null, '机房列表查询', null, '5', '/jbMachineRoomController/dataGrid', '6F6D27E0C1624BC0AEBEABCF6EE64587', '1'), ('A0F3D55577D544C3A2F195CA37EB405C', null, '删除行政区划', null, '30', '/jbAdministrativeDivisionController/delete', 'CDAAB97A4ACF40A7A329D41D35073A6C', '1'), ('A8C9AAFB5D6E456DA9ACBBA7A32A4CF7', null, '添加机房页面', null, '10', '/jbMachineRoomController/addPage', '6F6D27E0C1624BC0AEBEABCF6EE64587', '1'), ('autoAdd', null, '生成资源权限', null, '1', '/autoController/add', 'autoDev', '1'), ('autoDev', 'cog', '自动化开发', null, '4', '/autoController/manager', 'xtgl', '0'), ('B0BB11EB0662441481A3CDFFCE0BB272', null, '添加部门', null, '15', '/jbDepartmentController/add', 'DEFFE71F00F045639C7CD534419D0F8D', '1'), ('B5A840DE580248B3A6567581DDA6F1B5', null, '查看资产', null, '35', '/jbAssetsController/view', '42D98D488A154C4AB5A7D879D38E6695', '1'), ('bdgl', 'database', '数据字典', null, '4', '/basedataController/manager', 'xtgl', '0'), ('bdglAdd', null, '添加基础数据', null, '3', '/basedataController/basedataAdd', 'bdgl', '1'), ('bdglAddPage', null, '添加基础数据页面', null, '2', '/basedataController/basedataAddPage', 'bdgl', '1'), ('bdglDateGrid', null, '基础数据表格', null, '1', '/basedataController/basedataDataGrid', 'bdgl', '1'), ('bdglDelete', null, '删除基础数据', null, '6', '/basedataController/basedatadelete', 'bdgl', '1'), ('bdglEdit', null, '编辑基础数据', null, '5', '/basedataController/basedataEdit', 'bdgl', '1'), ('bdglEditPage', null, '编辑基础数据页面', null, '3', '/basedataController/basedataEditPage', 'bdgl', '1'), ('bdtyAdd', null, '添加基础类型', null, '7', '/basedataController/basetypeAdd', 'bdgl', '1'), ('bdtyAddPage', null, '添加基础类型页面', null, '8', '/basedataController/basetypeAddPage', 'bdgl', '1'), ('bdtyDelete', null, '删除基础类型', null, '10', '/basedataController/basetypedelete', 'bdgl', '1'), ('bdtyEdit', null, '编辑基础类型', null, '15', '/basedataController/basetypeEdit', 'bdgl', '1'), ('bdtyTree', null, '基础类型树', null, '20', '/basedataController/treeGrid', 'bdgl', '1'), ('buggl', 'bug', 'BUG管理', null, '5', '/bugController/manager', 'xtgl', '0'), ('bugglAdd', 'bug_add', '添加BUG', null, '3', '/bugController/add', 'buggl', '1'), ('bugglAddPage', 'bug_add', '添加BUG页面', null, '2', '/bugController/addPage', 'buggl', '1'), ('bugglDateGrid', 'bug_link', 'BUG表格', null, '1', '/bugController/dataGrid', 'buggl', '1'), ('bugglDelete', 'bug_delete', '删除BUG', null, '6', '/bugController/delete', 'buggl', '1'), ('bugglEdit', 'bug_edit', '编辑BUG', null, '5', '/bugController/edit', 'buggl', '1'), ('bugglEditPage', 'bug_edit', '编辑BUG页面', null, '4', '/bugController/editPage', 'buggl', '1'), ('bugglView', 'bug_link', '查看BUG', null, '7', '/bugController/view', 'buggl', '1'), ('C4F9769BBD434654A6B761DAA56BFF5D', null, '修改机房页面', null, '25', '/jbMachineRoomController/edit', '6F6D27E0C1624BC0AEBEABCF6EE64587', '1'), ('CA2D51B0EBEE41C68B452E0568133EAD', null, '资产列表查询', null, '5', '/jbAssetsController/dataGrid', '42D98D488A154C4AB5A7D879D38E6695', '1'), ('cd5b50a0-d706-45a8-8af0-2449131a8d14', null, 'html5demo', '', '100', '/jbmachineroom/example.jsp', null, '1'), ('CD645455E685433584FFCC3F20B24247', null, '修改机房页面', null, '20', '/jbMachineRoomController/editPage', '6F6D27E0C1624BC0AEBEABCF6EE64587', '1'), ('CDAAB97A4ACF40A7A329D41D35073A6C', 'cog', '行政区划管理', '', '100', '/jbAdministrativeDivisionController/manager', null, '0'), ('CF81B88048684B53AA9DC5120DF92997', null, '添加资产页面', null, '10', '/jbAssetsController/addPage', '42D98D488A154C4AB5A7D879D38E6695', '1'), ('chart', 'chart_bar', '图表管理', null, '7', null, null, '0'), ('DC3143D008CA424183238124D34E6598', null, '下载机房', null, '40', '/jbMachineRoomController/download', '6F6D27E0C1624BC0AEBEABCF6EE64587', '1'), ('DEFFE71F00F045639C7CD534419D0F8D', 'door', '部门管理', '', '100', '/jbDepartmentController/manager', null, '0'), ('eaf12826-bfb1-4e96-8728-ed1b4ba15712', null, '保存按钮', '', '100', '/jbMachineRoomController/updateRoomNode', '0dad98dc-5f1b-4613-9f5e-5702c4b1684c', '1'), ('F812480222C9496F8E0C674657541225', null, '部门列表查询', null, '5', '/jbDepartmentController/dataGrid', 'DEFFE71F00F045639C7CD534419D0F8D', '1'), ('FA35067E9D7646BDA18471E9E5A7503D', null, '行政区划列表查询', null, '5', '/jbAdministrativeDivisionController/dataGrid', 'CDAAB97A4ACF40A7A329D41D35073A6C', '1'), ('fb4387a7-4600-4311-b2f1-fbda851ae7e4', null, '服务器上架', '', '100', '/jbMachineRoomController/onlinePage', '0dad98dc-5f1b-4613-9f5e-5702c4b1684c', '1'), ('jeasyuiApi', 'book', 'EasyUI API', null, '1000', 'http://jeasyui.com/documentation', null, '0'), ('jsgl', 'tux', '角色管理', null, '2', '/roleController/manager', 'xtgl', '0'), ('jsglAdd', 'wrench', '添加角色', null, '3', '/roleController/add', 'jsgl', '1'), ('jsglAddPage', 'wrench', '添加角色页面', null, '2', '/roleController/addPage', 'jsgl', '1'), ('jsglDelete', 'wrench', '删除角色', null, '6', '/roleController/delete', 'jsgl', '1'), ('jsglEdit', 'wrench', '编辑角色', null, '5', '/roleController/edit', 'jsgl', '1'), ('jsglEditPage', 'wrench', '编辑角色页面', null, '4', '/roleController/editPage', 'jsgl', '1'), ('jsglGrant', 'wrench', '角色授权', null, '8', '/roleController/grant', 'jsgl', '1'), ('jsglGrantPage', 'wrench', '角色授权页面', null, '7', '/roleController/grantPage', 'jsgl', '1'), ('jsglTreeGrid', 'wrench', '角色表格', null, '1', '/roleController/treeGrid', 'jsgl', '1'), ('sjygl', 'server_database', '数据源管理', null, '5', '/druidController/druid', 'xtgl', '0'), ('userCreateDatetimeChart', 'chart_curve', '用户图表', null, '1', '/chartController/userCreateDatetimeChart', 'chart', '0'), ('wjgl', 'server_database', '文件管理', null, '6', '', 'xtgl', '1'), ('wjglDownload', 'server_database', '上传下载', null, '3', '/fileController/download', 'wjgl', '1'), ('wjglUpload', 'server_database', '上传文件', null, '2', '/fileController/upload', 'wjgl', '1'), ('wjglView', 'server_database', '浏览服务器文件', null, '1', '/fileController/fileManage', 'wjgl', '1'), ('xtgl', 'plugin', '系统管理', null, '0', null, null, '0'), ('yhgl', 'status_online', '用户管理', null, '3', '/userController/manager', 'xtgl', '0'), ('yhglAdd', 'wrench', '添加用户', null, '3', '/userController/add', 'yhgl', '1'), ('yhglAddPage', 'wrench', '添加用户页面', null, '2', '/userController/addPage', 'yhgl', '1'), ('yhglBatchDelete', 'wrench', '批量删除用户', null, '7', '/userController/batchDelete', 'yhgl', '1'), ('yhglDateGrid', 'wrench', '用户表格', null, '1', '/userController/dataGrid', 'yhgl', '1'), ('yhglDelete', 'wrench', '删除用户', null, '6', '/userController/delete', 'yhgl', '1'), ('yhglEdit', 'wrench', '编辑用户', null, '5', '/userController/edit', 'yhgl', '1'), ('yhglEditPage', 'wrench', '编辑用户页面', null, '4', '/userController/editPage', 'yhgl', '1'), ('yhglEditPwd', 'wrench', '用户修改密码', null, '11', '/userController/editPwd', 'yhgl', '1'), ('yhglEditPwdPage', 'wrench', '用户修改密码页面', null, '10', '/userController/editPwdPage', 'yhgl', '1'), ('yhglGrant', 'wrench', '用户授权', null, '9', '/userController/grant', 'yhgl', '1'), ('yhglGrantPage', 'wrench', '用户授权页面', null, '8', '/userController/grantPage', 'yhgl', '1'), ('zygl', 'database_gear', '资源管理', '管理系统中所有的菜单或功能', '1', '/resourceController/manager', 'xtgl', '0'), ('zyglAdd', 'wrench', '添加资源', null, '4', '/resourceController/add', 'zygl', '1'), ('zyglAddPage', 'wrench', '添加资源页面', null, '3', '/resourceController/addPage', 'zygl', '1'), ('zyglDelete', 'wrench', '删除资源', null, '7', '/resourceController/delete', 'zygl', '1'), ('zyglEdit', 'wrench', '编辑资源', null, '6', '/resourceController/edit', 'zygl', '1'), ('zyglEditPage', 'wrench', '编辑资源页面', null, '5', '/resourceController/editPage', 'zygl', '1'), ('zyglMenu', 'wrench', '功能菜单', null, '2', '/resourceController/tree', 'zygl', '1'), ('zyglTreeGrid', 'wrench', '资源表格', '显示资源列表', '1', '/resourceController/treeGrid', 'zygl', '1');
COMMIT;

-- ----------------------------
--  Table structure for `tresourcetype`
-- ----------------------------
DROP TABLE IF EXISTS `tresourcetype`;
CREATE TABLE `tresourcetype` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tresourcetype`
-- ----------------------------
BEGIN;
INSERT INTO `tresourcetype` VALUES ('0', '菜单'), ('1', '功能');
COMMIT;

-- ----------------------------
--  Table structure for `trole`
-- ----------------------------
DROP TABLE IF EXISTS `trole`;
CREATE TABLE `trole` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `REMARK` varchar(200) DEFAULT NULL,
  `SEQ` int(11) DEFAULT NULL,
  `PID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_3qq9eyhwbhblv83lt270gxbik` (`PID`),
  CONSTRAINT `FK_3qq9eyhwbhblv83lt270gxbik` FOREIGN KEY (`PID`) REFERENCES `trole` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `trole`
-- ----------------------------
BEGIN;
INSERT INTO `trole` VALUES ('0', '超管', '超级管理员角色，拥有系统中所有的资源访问权限', '0', null), ('bugAdmin', 'BUG管理员', null, '5', '0'), ('guest', 'Guest', '只拥有只看的权限', '1', null), ('jsAdmin', '角色管理员', null, '2', '0'), ('sjyAdmin', '数据源管理员', null, '4', '0'), ('yhAdmin', '用户管理员', null, '3', '0'), ('zyAdmin', '资源管理员', null, '1', '0');
COMMIT;

-- ----------------------------
--  Table structure for `trole_tresource`
-- ----------------------------
DROP TABLE IF EXISTS `trole_tresource`;
CREATE TABLE `trole_tresource` (
  `TROLE_ID` varchar(36) NOT NULL,
  `TRESOURCE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`TRESOURCE_ID`,`TROLE_ID`),
  KEY `FK_18oms8g4ib4h67dqx0f3fwaed` (`TRESOURCE_ID`),
  KEY `FK_aunc1ssqh18meky8cxl48i4m9` (`TROLE_ID`),
  CONSTRAINT `FK_18oms8g4ib4h67dqx0f3fwaed` FOREIGN KEY (`TRESOURCE_ID`) REFERENCES `tresource` (`ID`),
  CONSTRAINT `FK_aunc1ssqh18meky8cxl48i4m9` FOREIGN KEY (`TROLE_ID`) REFERENCES `trole` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `trole_tresource`
-- ----------------------------
BEGIN;
INSERT INTO `trole_tresource` VALUES ('0', '0CF5D37231DB4890BA0EB407AF174FFE'), ('0', '0dad98dc-5f1b-4613-9f5e-5702c4b1684c'), ('bugAdmin', '0dad98dc-5f1b-4613-9f5e-5702c4b1684c'), ('guest', '0dad98dc-5f1b-4613-9f5e-5702c4b1684c'), ('jsAdmin', '0dad98dc-5f1b-4613-9f5e-5702c4b1684c'), ('sjyAdmin', '0dad98dc-5f1b-4613-9f5e-5702c4b1684c'), ('yhAdmin', '0dad98dc-5f1b-4613-9f5e-5702c4b1684c'), ('zyAdmin', '0dad98dc-5f1b-4613-9f5e-5702c4b1684c'), ('0', '102EB23ECBC94B21BB19A3623080A28B'), ('0', '12A36BFF53224C31A2E26C08053DC94F'), ('0', '27B857584E4F465BBE07D27283499AED'), ('0', '2F507E19F41347A698CF9CCC4CF6AB8A'), ('0', '414BAE5610DD4084A162632F1EAA3FBE'), ('0', '42D98D488A154C4AB5A7D879D38E6695'), ('0', '47A9BDB14C6546A8BA35363F62EB70F3'), ('0', '49D6536D21A44EC190A71CA9BF7F7EBB'), ('0', '53025FE17DE1450CA59444D52DE5056B'), ('0', '5825CAEC4521466F9501ADCEFF19A5B9'), ('0', '5DF2DD0A9F6C455F800EB43FF3E6A6C7'), ('0', '5DFE66DF961A474EB4B711623A881043'), ('0', '6143101c-3fc6-497b-b841-951058df3c2e'), ('bugAdmin', '6143101c-3fc6-497b-b841-951058df3c2e'), ('guest', '6143101c-3fc6-497b-b841-951058df3c2e'), ('jsAdmin', '6143101c-3fc6-497b-b841-951058df3c2e'), ('sjyAdmin', '6143101c-3fc6-497b-b841-951058df3c2e'), ('yhAdmin', '6143101c-3fc6-497b-b841-951058df3c2e'), ('zyAdmin', '6143101c-3fc6-497b-b841-951058df3c2e'), ('0', '61B385D3EC5F4F8681375B5D556BBF03'), ('0', '66F9CC0A786B4F548234754417060477'), ('0', '6F3A1B793F7D4AD9982655E133C91EAB'), ('0', '6F6D27E0C1624BC0AEBEABCF6EE64587'), ('0', '7F3728ED48E44FCFA07896687CD28B4A'), ('0', '87A6DADFC7EA4572BC803B86299405F4'), ('0', '9325b3f3-dc6a-4973-83cd-21dc7e0f89c5'), ('bugAdmin', '9325b3f3-dc6a-4973-83cd-21dc7e0f89c5'), ('guest', '9325b3f3-dc6a-4973-83cd-21dc7e0f89c5'), ('jsAdmin', '9325b3f3-dc6a-4973-83cd-21dc7e0f89c5'), ('sjyAdmin', '9325b3f3-dc6a-4973-83cd-21dc7e0f89c5'), ('yhAdmin', '9325b3f3-dc6a-4973-83cd-21dc7e0f89c5'), ('zyAdmin', '9325b3f3-dc6a-4973-83cd-21dc7e0f89c5'), ('0', '937F663E1F6B4DD5B9BF7A4620D9D7AE'), ('0', '94FA6270B10F4BAA9A88E7F814BE9BE2'), ('0', '9BBCD8EDCF7A452CAC015CFA3C98E0FC'), ('0', '9C95F24F5EFA4F31A62B5DEF88C1921B'), ('0', 'A0F3D55577D544C3A2F195CA37EB405C'), ('0', 'A8C9AAFB5D6E456DA9ACBBA7A32A4CF7'), ('0', 'autoAdd'), ('0', 'autoDev'), ('0', 'B0BB11EB0662441481A3CDFFCE0BB272'), ('0', 'B5A840DE580248B3A6567581DDA6F1B5'), ('0', 'bdgl'), ('0', 'bdglAdd'), ('0', 'bdglAddPage'), ('0', 'bdglDateGrid'), ('0', 'bdglDelete'), ('0', 'bdglEdit'), ('0', 'bdglEditPage'), ('0', 'bdtyAdd'), ('0', 'bdtyAddPage'), ('0', 'bdtyDelete'), ('0', 'bdtyEdit'), ('0', 'bdtyTree'), ('0', 'buggl'), ('bugAdmin', 'buggl'), ('0', 'bugglAdd'), ('bugAdmin', 'bugglAdd'), ('0', 'bugglAddPage'), ('bugAdmin', 'bugglAddPage'), ('0', 'bugglDateGrid'), ('bugAdmin', 'bugglDateGrid'), ('0', 'bugglDelete'), ('bugAdmin', 'bugglDelete'), ('0', 'bugglEdit'), ('bugAdmin', 'bugglEdit'), ('0', 'bugglEditPage'), ('bugAdmin', 'bugglEditPage'), ('0', 'bugglView'), ('bugAdmin', 'bugglView'), ('0', 'C4F9769BBD434654A6B761DAA56BFF5D'), ('0', 'CA2D51B0EBEE41C68B452E0568133EAD'), ('0', 'cd5b50a0-d706-45a8-8af0-2449131a8d14'), ('bugAdmin', 'cd5b50a0-d706-45a8-8af0-2449131a8d14'), ('guest', 'cd5b50a0-d706-45a8-8af0-2449131a8d14'), ('jsAdmin', 'cd5b50a0-d706-45a8-8af0-2449131a8d14'), ('sjyAdmin', 'cd5b50a0-d706-45a8-8af0-2449131a8d14'), ('yhAdmin', 'cd5b50a0-d706-45a8-8af0-2449131a8d14'), ('zyAdmin', 'cd5b50a0-d706-45a8-8af0-2449131a8d14'), ('0', 'CD645455E685433584FFCC3F20B24247'), ('0', 'CDAAB97A4ACF40A7A329D41D35073A6C'), ('0', 'CF81B88048684B53AA9DC5120DF92997'), ('0', 'chart'), ('0', 'DC3143D008CA424183238124D34E6598'), ('0', 'DEFFE71F00F045639C7CD534419D0F8D'), ('0', 'eaf12826-bfb1-4e96-8728-ed1b4ba15712'), ('bugAdmin', 'eaf12826-bfb1-4e96-8728-ed1b4ba15712'), ('guest', 'eaf12826-bfb1-4e96-8728-ed1b4ba15712'), ('jsAdmin', 'eaf12826-bfb1-4e96-8728-ed1b4ba15712'), ('sjyAdmin', 'eaf12826-bfb1-4e96-8728-ed1b4ba15712'), ('yhAdmin', 'eaf12826-bfb1-4e96-8728-ed1b4ba15712'), ('zyAdmin', 'eaf12826-bfb1-4e96-8728-ed1b4ba15712'), ('0', 'F812480222C9496F8E0C674657541225'), ('0', 'FA35067E9D7646BDA18471E9E5A7503D'), ('0', 'fb4387a7-4600-4311-b2f1-fbda851ae7e4'), ('bugAdmin', 'fb4387a7-4600-4311-b2f1-fbda851ae7e4'), ('guest', 'fb4387a7-4600-4311-b2f1-fbda851ae7e4'), ('jsAdmin', 'fb4387a7-4600-4311-b2f1-fbda851ae7e4'), ('sjyAdmin', 'fb4387a7-4600-4311-b2f1-fbda851ae7e4'), ('yhAdmin', 'fb4387a7-4600-4311-b2f1-fbda851ae7e4'), ('zyAdmin', 'fb4387a7-4600-4311-b2f1-fbda851ae7e4'), ('0', 'jeasyuiApi'), ('guest', 'jeasyuiApi'), ('0', 'jsgl'), ('guest', 'jsgl'), ('jsAdmin', 'jsgl'), ('0', 'jsglAdd'), ('jsAdmin', 'jsglAdd'), ('0', 'jsglAddPage'), ('jsAdmin', 'jsglAddPage'), ('0', 'jsglDelete'), ('jsAdmin', 'jsglDelete'), ('0', 'jsglEdit'), ('jsAdmin', 'jsglEdit'), ('0', 'jsglEditPage'), ('jsAdmin', 'jsglEditPage'), ('0', 'jsglGrant'), ('jsAdmin', 'jsglGrant'), ('0', 'jsglGrantPage'), ('jsAdmin', 'jsglGrantPage'), ('0', 'jsglTreeGrid'), ('guest', 'jsglTreeGrid'), ('jsAdmin', 'jsglTreeGrid'), ('0', 'sjygl'), ('sjyAdmin', 'sjygl'), ('0', 'userCreateDatetimeChart'), ('0', 'wjgl'), ('0', 'wjglDownload'), ('0', 'wjglUpload'), ('0', 'wjglView'), ('0', 'xtgl'), ('guest', 'xtgl'), ('0', 'yhgl'), ('guest', 'yhgl'), ('yhAdmin', 'yhgl'), ('0', 'yhglAdd'), ('yhAdmin', 'yhglAdd'), ('0', 'yhglAddPage'), ('yhAdmin', 'yhglAddPage'), ('0', 'yhglBatchDelete'), ('yhAdmin', 'yhglBatchDelete'), ('0', 'yhglDateGrid'), ('guest', 'yhglDateGrid'), ('yhAdmin', 'yhglDateGrid'), ('0', 'yhglDelete'), ('yhAdmin', 'yhglDelete'), ('0', 'yhglEdit'), ('yhAdmin', 'yhglEdit'), ('0', 'yhglEditPage'), ('yhAdmin', 'yhglEditPage'), ('0', 'yhglEditPwd'), ('yhAdmin', 'yhglEditPwd'), ('0', 'yhglEditPwdPage'), ('yhAdmin', 'yhglEditPwdPage'), ('0', 'yhglGrant'), ('yhAdmin', 'yhglGrant'), ('0', 'yhglGrantPage'), ('yhAdmin', 'yhglGrantPage'), ('0', 'zygl'), ('guest', 'zygl'), ('zyAdmin', 'zygl'), ('0', 'zyglAdd'), ('zyAdmin', 'zyglAdd'), ('0', 'zyglAddPage'), ('zyAdmin', 'zyglAddPage'), ('0', 'zyglDelete'), ('zyAdmin', 'zyglDelete'), ('0', 'zyglEdit'), ('zyAdmin', 'zyglEdit'), ('0', 'zyglEditPage'), ('zyAdmin', 'zyglEditPage'), ('0', 'zyglMenu'), ('zyAdmin', 'zyglMenu'), ('0', 'zyglTreeGrid'), ('guest', 'zyglTreeGrid'), ('zyAdmin', 'zyglTreeGrid');
COMMIT;

-- ----------------------------
--  Table structure for `tuser`
-- ----------------------------
DROP TABLE IF EXISTS `tuser`;
CREATE TABLE `tuser` (
  `ID` varchar(36) NOT NULL,
  `areaCode` varchar(36) DEFAULT NULL,
  `bardian` varchar(128) DEFAULT NULL,
  `birthday` varchar(18) DEFAULT NULL,
  `CREATEDATETIME` datetime DEFAULT NULL,
  `head_image` varchar(256) DEFAULT NULL,
  `isStar` tinyint(1) DEFAULT NULL,
  `isTarento` tinyint(1) DEFAULT NULL,
  `member_v` varchar(4) DEFAULT NULL,
  `MODIFYDATETIME` datetime DEFAULT NULL,
  `NAME` varchar(100) NOT NULL,
  `nickname` varchar(36) DEFAULT NULL,
  `PWD` varchar(100) NOT NULL,
  `third_user` varchar(36) DEFAULT NULL,
  `utype` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_doflky41g81kf7ydx6y0a99nm` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tuser`
-- ----------------------------
BEGIN;
INSERT INTO `tuser` VALUES ('0', null, null, null, '2015-08-08 20:15:39', null, null, null, null, null, 'John', null, 'e10adc3949ba59abbe56e057f20f883e', null, null), ('1', null, null, null, '2015-08-08 20:15:40', null, null, null, null, null, 'admin1', null, 'e10adc3949ba59abbe56e057f20f883e', null, null), ('2', null, null, null, '2015-08-08 20:15:40', null, null, null, null, null, 'admin2', null, 'e10adc3949ba59abbe56e057f20f883e', null, null), ('3', null, null, null, '2015-08-08 20:15:40', null, null, null, null, null, 'admin3', null, 'e10adc3949ba59abbe56e057f20f883e', null, null), ('4', null, null, null, '2015-08-08 20:15:40', null, null, null, null, null, 'admin4', null, 'e10adc3949ba59abbe56e057f20f883e', null, null), ('5', null, null, null, '2015-08-08 20:15:40', null, null, null, null, null, 'admin5', null, 'e10adc3949ba59abbe56e057f20f883e', null, null), ('guest', null, null, null, '2015-08-08 20:15:40', null, null, null, null, null, 'guest', null, 'e10adc3949ba59abbe56e057f20f883e', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `tuser_trole`
-- ----------------------------
DROP TABLE IF EXISTS `tuser_trole`;
CREATE TABLE `tuser_trole` (
  `TUSER_ID` varchar(36) NOT NULL,
  `TROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`TROLE_ID`,`TUSER_ID`),
  KEY `FK_30t0khk63muiwisjpp0h7e57l` (`TROLE_ID`),
  KEY `FK_mipcojqd9xymdghov18fobf7e` (`TUSER_ID`),
  CONSTRAINT `FK_30t0khk63muiwisjpp0h7e57l` FOREIGN KEY (`TROLE_ID`) REFERENCES `trole` (`ID`),
  CONSTRAINT `FK_mipcojqd9xymdghov18fobf7e` FOREIGN KEY (`TUSER_ID`) REFERENCES `tuser` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tuser_trole`
-- ----------------------------
BEGIN;
INSERT INTO `tuser_trole` VALUES ('0', '0'), ('0', 'bugAdmin'), ('5', 'bugAdmin'), ('0', 'guest'), ('guest', 'guest'), ('0', 'jsAdmin'), ('2', 'jsAdmin'), ('0', 'sjyAdmin'), ('4', 'sjyAdmin'), ('0', 'yhAdmin'), ('3', 'yhAdmin'), ('0', 'zyAdmin'), ('1', 'zyAdmin');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
