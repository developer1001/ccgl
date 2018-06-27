/*
Navicat MySQL Data Transfer

Source Server         : mydb
Source Server Version : 50024
Source Host           : localhost:3306
Source Database       : smis

Target Server Type    : MYSQL
Target Server Version : 50024
File Encoding         : 65001

Date: 2017-06-04 15:45:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_buyintowarehouse
-- ----------------------------
DROP TABLE IF EXISTS `t_buyintowarehouse`;
CREATE TABLE `t_buyintowarehouse` (
  `INID` int(20) NOT NULL auto_increment,
  `PRID` varchar(60) NOT NULL,
  `PRNAME` varchar(60) NOT NULL,
  `PRKIND` varchar(60) default NULL,
  `MATERIAL` varchar(60) default NULL,
  `SPECIFICATION` varchar(60) default NULL,
  `PRPRICE` double(20,0) default NULL,
  `PRQUANTITY` int(20) NOT NULL,
  `PRCOST` double(20,2) default NULL,
  `SUPPLIER` varchar(60) NOT NULL,
  `PRDATE` datetime NOT NULL,
  `CHECHER` varchar(60) NOT NULL,
  `WAREHOUSE` varchar(60) NOT NULL,
  `REMARKS` varchar(60) default NULL,
  PRIMARY KEY  (`INID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_buyintowarehouse
-- ----------------------------
INSERT INTO `t_buyintowarehouse` VALUES ('1', 'wer-345', '三号轴承', '轴承', '钢铁', '1.6KG/个', '123', '100', '12300.00', '峻峰铸造厂', '2017-03-14 22:30:45', '李勇', '5号仓', '轴承');
INSERT INTO `t_buyintowarehouse` VALUES ('2', '77', '77', '77', '77', '77', '77', '100', '77.00', '河东区三原电力有限公司', '2017-03-18 00:00:00', '77', '2号仓库', '77');
INSERT INTO `t_buyintowarehouse` VALUES ('5', '收人头', '有', ' 人', '而已 ', '我还有', '600', '2222', '1333200.00', '江南制造总局', '2017-04-03 00:00:00', 'GAwk是个', '5号仓库', '有意思');
INSERT INTO `t_buyintowarehouse` VALUES ('6', '铜矿石', '铜矿石', '矿石', '矿石', '', '68758', '768', '650000.00', '江南制造总局', '2017-03-16 00:00:00', '是否', '5号仓库', '的若干');
INSERT INTO `t_buyintowarehouse` VALUES ('7', '34-GHH', '铜矿石', '矿石', '矿石', '25T', '56230', '300', '650000.00', '江南制造总局', '2017-03-25 00:00:00', '李涛', '5号仓库', '矿石');
INSERT INTO `t_buyintowarehouse` VALUES ('8', '34-GHH', '铁矿石', '矿石', '矿石', '25T', '18500', '300', '650000.00', '江南制造总局', '2017-03-25 00:00:00', '李涛', '5号仓库', '');
INSERT INTO `t_buyintowarehouse` VALUES ('10', '788-HGH', '铝矿石', '矿石', '矿石', '25T', '18500', '300', '650000.00', '江南制造总局', '2017-03-25 00:00:00', '是否', '5号仓库', '');
INSERT INTO `t_buyintowarehouse` VALUES ('11', '34-GHH', '铝矿石', '矿石', '矿石', '25T', '18500', '300', '650000.00', '江南制造总局', '2017-03-25 00:00:00', '李涛', '5号仓库', '');
INSERT INTO `t_buyintowarehouse` VALUES ('12', '788-HGH', '铁矿石', '矿石', '矿石', '25T', '18500', '300', '650000.00', '江南制造总局', '2017-03-25 00:00:00', '何一飞', '5号仓库', '');
INSERT INTO `t_buyintowarehouse` VALUES ('13', '788-HGH', '稀有金属', '金属', '金属', '0.2T', '15451', '300', '574500.00', '河东区三原电力有限公司', '2017-02-27 00:00:00', '何一飞', '1号仓库', '');
INSERT INTO `t_buyintowarehouse` VALUES ('15', '788-HGH', '稀有金属', '金属', '金属', '0.2T', '15451', '300', '574500.00', '俊峰铸造厂', '2017-02-09 00:00:00', '何一飞', '1号仓库', '');
INSERT INTO `t_buyintowarehouse` VALUES ('16', '34-GHH', '铜矿石', '矿石', '金属', '25T', '15451', '300', '574500.00', '俊峰铸造厂', '2017-02-09 00:00:00', '何一飞', '9号仓库', '');
INSERT INTO `t_buyintowarehouse` VALUES ('17', '788-HGH', '铁矿石', '金属', '金属', '0.2T', '15451', '300', '574500.00', '俊峰铸造厂', '2017-02-09 00:00:00', '是否', '9号仓库', '');
INSERT INTO `t_buyintowarehouse` VALUES ('18', 'cai', 'cai', 'cai', 'cai', 'cai', '1000', '600', '600000.00', '俊峰铸造厂', '2017-04-05 00:00:00', '何一飞', '3号仓库', 'cai  222');
INSERT INTO `t_buyintowarehouse` VALUES ('19', 'qqq', 'qqq', 'qqq', 'qqq', 'qqq', '2100', '2000', '4200000.00', '河东区三原电力有限公司', '2017-04-05 00:00:00', '何一飞', '2号仓库', '3000');
INSERT INTO `t_buyintowarehouse` VALUES ('20', 'GH-0236', '0236型切割机', '切割机', '混合', '10kg', '3500', '10', '35000.00', '河北三菱重型机床有限公司', '2017-05-06 00:00:00', '周工', '2号仓库', '购买的10套切割机');
INSERT INTO `t_buyintowarehouse` VALUES ('21', 'GH-0236', '0236型切割机', '切割机', '混合', '10kg', '3500', '10', '35000.00', 'aaa', '2017-05-13 00:00:00', '周工', '1号仓库', '20总');
INSERT INTO `t_buyintowarehouse` VALUES ('22', 'mmmm', 'mmmm', 'mmmm', 'mmmm', 'mmmm', '6500', '100', '650000.00', 'aaa', '2017-05-12 00:00:00', '周工', '2号仓库', 'wu');

-- ----------------------------
-- Table structure for t_buyplan
-- ----------------------------
DROP TABLE IF EXISTS `t_buyplan`;
CREATE TABLE `t_buyplan` (
  `planid` int(10) NOT NULL auto_increment,
  `plantime` varchar(30) default NULL,
  `plansupplier` varchar(50) NOT NULL,
  `productname` varchar(80) NOT NULL,
  `buyprice` double(20,3) default NULL,
  `buyccount` double(10,3) NOT NULL,
  `totalmoney` double(20,3) default NULL,
  `planbudget` double(20,3) default NULL,
  PRIMARY KEY  (`planid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_buyplan
-- ----------------------------
INSERT INTO `t_buyplan` VALUES ('1', '2017-04-05', '无锡三原金属有限公司', 'wd-021涡轮铜套', '1500.000', '200.000', '300000.000', '0.000');
INSERT INTO `t_buyplan` VALUES ('3', '2017-03-01', '斯科特', 'AL68-9机床', '150000.000', '3.000', '450000.000', '450000.000');
INSERT INTO `t_buyplan` VALUES ('5', '2017-03-11', '菏泽中原钢铁厂', '压盖', '2000.000', '20.000', '40000.000', '0.000');
INSERT INTO `t_buyplan` VALUES ('6', '2017-04-05', '湖北汉阳兵工厂', '汉阳造', '5000.000', '5000.000', '25000000.000', '0.000');
INSERT INTO `t_buyplan` VALUES ('8', '2017-03-11', '湖北汉阳兵工厂', '老套筒', '0.000', '5000.000', '0.000', '0.000');
INSERT INTO `t_buyplan` VALUES ('9', '2017-03-31', '湖北汉阳兵工厂', '汉阳造', '150000.000', '5000.000', '750000000.000', '0.000');
INSERT INTO `t_buyplan` VALUES ('10', '2017-03-14', '菏泽中原钢铁厂', '涡轮机', '2000.000', '200.000', '400000.000', '400000.000');
INSERT INTO `t_buyplan` VALUES ('11', '2017-03-14', '阿士大夫', 'wd-021涡轮铜套', '500.000', '12.000', '6000.000', '40000.000');
INSERT INTO `t_buyplan` VALUES ('12', '2017-02-26', '三条石', 'wd-021涡轮铜套', '150000.000', '500.000', '75000000.000', '524200.000');
INSERT INTO `t_buyplan` VALUES ('13', '2017-02-24', '无锡三原金属有限公司', 'AL68-9机床', '1000.000', '20.000', '20000.000', '40000.000');
INSERT INTO `t_buyplan` VALUES ('14', '2017-02-24', '斯科特', '压盖', '2000.000', '500.000', '1000000.000', '456500.000');
INSERT INTO `t_buyplan` VALUES ('15', '2017-04-06', '阿士大夫', '压盖', '500.000', '5000.000', '2500000.000', '450000.000');
INSERT INTO `t_buyplan` VALUES ('16', '2017-04-06', '无锡三原金属有限公司', 'wd-021涡轮铜套', '50786.000', '12.000', '609432.000', '450000.000');
INSERT INTO `t_buyplan` VALUES ('17', '2017-04-20', '阿士大夫', '涡轮机', '48656.000', '45.000', '2189520.000', '4527800.000');
INSERT INTO `t_buyplan` VALUES ('18', '2017-04-20', '湖北汉阳兵工厂', '老套筒', '5000.000', '4530.000', '22650000.000', '524200.000');
INSERT INTO `t_buyplan` VALUES ('19', '2017-04-07', '达远合金铸造厂', '85号钻头', '20000.000', '3.000', '60000.000', '60000.000');

-- ----------------------------
-- Table structure for t_buyreturnout
-- ----------------------------
DROP TABLE IF EXISTS `t_buyreturnout`;
CREATE TABLE `t_buyreturnout` (
  `INID` int(20) NOT NULL auto_increment,
  `PRID` varchar(60) NOT NULL,
  `PRNAME` varchar(60) NOT NULL,
  `PRKIND` varchar(60) default NULL,
  `MATERIAL` varchar(60) default NULL,
  `SPECIFICATION` varchar(60) default NULL,
  `PRPRICE` double(20,2) NOT NULL,
  `PRQUANTITY` int(20) NOT NULL,
  `PRCOST` double(20,2) default NULL,
  `SUPPLIER` varchar(60) NOT NULL,
  `PRDATE` datetime NOT NULL,
  `CHECHER` varchar(60) NOT NULL,
  `WAREHOUSE` varchar(60) NOT NULL,
  `REMARKS` varchar(60) NOT NULL,
  PRIMARY KEY  (`INID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_buyreturnout
-- ----------------------------
INSERT INTO `t_buyreturnout` VALUES ('1', 'DSF-34', 'AWD', '远程步枪', '桃木和镍钢', '1.69m', '23000.00', '200', '4600000.00', '雷明登公司', '2017-03-17 11:02:47', '詹妮弗*劳伦斯', '10号仓库', 'AWD');
INSERT INTO `t_buyreturnout` VALUES ('3', 'uu', 'uu', 'uu', 'uu', 'uu', '436.00', '768', '578.00', '河东区三原电力有限公司', '2017-02-27 00:00:00', 'uu', '2号仓库', 'uu');
INSERT INTO `t_buyreturnout` VALUES ('4', 'pr-234', '磨损件', '耗材', '钢', '0.23T', '18500.00', '768', '650000.00', '俊峰铸造厂', '2017-03-13 00:00:00', 'DH电话', '4号仓库', '');
INSERT INTO `t_buyreturnout` VALUES ('5', 'pr-234', 'uu', '宿舍', '钢', '宿舍', '18500.00', '768', '650000.00', '河东区三原电力有限公司', '2017-03-16 00:00:00', 'uu', '6号仓库', '');
INSERT INTO `t_buyreturnout` VALUES ('6', '宿舍', 'gsh', 'kfj', '钢', 'uu', '18500.00', '768', '650000.00', '河东区三原电力有限公司', '2017-03-14 00:00:00', '宿舍', '1号仓库', '');
INSERT INTO `t_buyreturnout` VALUES ('7', 'uu', 'gsh', '宿舍', '二', 'uu', '18500.00', '768', '650000.00', '河东区三原电力有限公司', '2017-03-07 00:00:00', '宿舍', '6号仓库', '');
INSERT INTO `t_buyreturnout` VALUES ('8', 'pr-234', 'uu', 'kfj', '钢', '宿舍', '18500.00', '768', '650000.00', '俊峰铸造厂', '2017-03-19 00:00:00', 'uu', '3号仓库', '');
INSERT INTO `t_buyreturnout` VALUES ('9', 'pr-234', '磨损件', '耗材', '钢', '0.23T', '18500.00', '768', '650000.00', '俊峰铸造厂', '2017-03-29 00:00:00', 'uu', '6号仓库', '');
INSERT INTO `t_buyreturnout` VALUES ('10', '宿舍', 'gsh', '耗材', '钢', '宿舍', '18500.00', '768', '650000.00', '江南制造总局', '2017-03-01 00:00:00', 'DH电话', '6号仓库', '');
INSERT INTO `t_buyreturnout` VALUES ('11', 'uu', 'uu', '耗材', '二', 'uu', '18500.00', '768', '650000.00', '江南制造总局', '2017-03-07 00:00:00', 'DH电话', '8号仓库', '');
INSERT INTO `t_buyreturnout` VALUES ('12', 'uu', '磨损件', 'kfj', '钢', 'uu', '18500.00', '768', '650000.00', '江南制造总局', '2017-04-01 00:00:00', '宿舍', '3号仓库', '');
INSERT INTO `t_buyreturnout` VALUES ('13', 'uu', '磨损件', '耗材', '二', 'uu', '18500.00', '768', '650000.00', '江南制造总局', '2017-04-11 00:00:00', '宿舍', '4号仓库', '嗷呜 ');
INSERT INTO `t_buyreturnout` VALUES ('14', '宿舍', 'gsh', 'kfj', 'uu', '0.23T', '18500.00', '768', '650000.00', '江南制造总局', '2017-04-13 00:00:00', 'DH电话', '4号仓库', '');
INSERT INTO `t_buyreturnout` VALUES ('15', 'pr-234', '磨损件', '耗材', '钢', '的染色体', '18500.00', '768', '650000.00', '俊峰铸造厂', '2017-04-16 00:00:00', 'DH电话', '3号仓库', '');
INSERT INTO `t_buyreturnout` VALUES ('16', '宿舍', '磨损件', '耗材', '二', '宿舍', '18500.00', '768', '650000.00', '俊峰铸造厂', '2017-04-26 00:00:00', 'DH电话', '3号仓库', '');

-- ----------------------------
-- Table structure for t_checkstorage
-- ----------------------------
DROP TABLE IF EXISTS `t_checkstorage`;
CREATE TABLE `t_checkstorage` (
  `INID` int(10) NOT NULL auto_increment,
  `PRID` varchar(60) NOT NULL,
  `PRNAME` varchar(60) NOT NULL,
  `PRKIND` varchar(60) default NULL,
  `MATERIAL` varchar(60) default NULL,
  `SPECIFICATION` varchar(60) default NULL,
  `OVERFLOW` int(20) default '0',
  `PRLOSE` int(20) default '0',
  `INSTORAGE` int(20) default '0',
  `OUTSTORAGE` int(20) default '0',
  `PRQUANTITY` int(20) NOT NULL default '0',
  `SUPPLIER` varchar(60) default '三条石金属铸造厂',
  `WAREHOUSE` varchar(60) NOT NULL,
  `REMARKS` varchar(100) default NULL,
  PRIMARY KEY  (`INID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_checkstorage
-- ----------------------------
INSERT INTO `t_checkstorage` VALUES ('1', '82A81', '巴雷特', '狙击步枪', '精钢', '1.68m', '0', '2', '200', '0', '198', '勃朗宁公司', '9号仓库', '步枪');
INSERT INTO `t_checkstorage` VALUES ('4', '78-FHSD', '减速机', '减速机', '铜铁合金，镍镉', '0.6T', '0', '0', '23', '18', '5', '河东区三原电力有限公司', '5号仓库', '');
INSERT INTO `t_checkstorage` VALUES ('5', '54DFG', 'pp', 'pp', 'pp', 'pp', '0', '0', '0', '0', '0', '江南制造总局', '5号仓库', 'pp');
INSERT INTO `t_checkstorage` VALUES ('6', 'WYD-4512', '中飞轮', '飞轮', '生铁', '2.6KG', '0', '0', '203', '0', '203', '江南制造总局', '5号仓库', '');
INSERT INTO `t_checkstorage` VALUES ('7', 'YGD-744', 'III型变压器外壳', '外壳', '钨钢', '350*562*489', '0', '0', '264', '204', '60', '俊峰铸造厂', '5号仓库', '');
INSERT INTO `t_checkstorage` VALUES ('8', 'HJFF', 'pp', 'sdfg', 'pp', '4444', '0', '0', '0', '0', '0', '江南制造总局', '5号仓库', '');
INSERT INTO `t_checkstorage` VALUES ('9', '8545fh', 'pp', 'pp', 'asdf', 'pp', '10', '10', '10', '10', '0', '江南制造总局', '5号仓库', '二');
INSERT INTO `t_checkstorage` VALUES ('10', 'asdt', '的认同', '谁的容颜', 'pp', 'pp', '0', '100', '8600', '5000', '3500', '江南制造总局', '5号仓库', '3500');
INSERT INTO `t_checkstorage` VALUES ('11', '963214578', '4444', 'pp', '第三方', '4444', '10', '10', '500', '10', '490', '江南制造总局', '5号仓库', '士大夫');
INSERT INTO `t_checkstorage` VALUES ('12', '8855', '中飞轮', '飞轮', '第三方', '人头', '0', '0', '0', '0', '0', '江南制造总局', '5号仓库', '');
INSERT INTO `t_checkstorage` VALUES ('13', 'seytud', '4444', '谁的容颜', 'asdf', 'dfg', '2', '2', '50', '10', '40', '江南制造总局', '5号仓库', '');
INSERT INTO `t_checkstorage` VALUES ('14', 'QWERTY', '4444', 'pp', 'asdf', '4444', '0', '450', '3450', '0', '3000', '江南制造总局', '5号仓库', '3000');
INSERT INTO `t_checkstorage` VALUES ('15', '45rh', 'sdgs', '飞轮', 'pp', '2.6KG', '0', '0', '0', '0', '0', '江南制造总局', '5号仓库', '');
INSERT INTO `t_checkstorage` VALUES ('16', '4444', 'sdgs', '飞轮', 'pp', 'dfg', '0', '0', '453', '78', '375', '江南制造总局', '5号仓库', '');
INSERT INTO `t_checkstorage` VALUES ('17', 'sg', '减速机', 'pp', '第三方', 'dfg', '0', '0', '0', '0', '0', '江南制造总局', '5号仓库', '0');
INSERT INTO `t_checkstorage` VALUES ('18', 'pp', '的认同', '飞轮', '第三方', '人头', '110', '0', '2534', '0', '2644', '江南制造总局', '5号仓库', 'awer');
INSERT INTO `t_checkstorage` VALUES ('19', 'ee', 'ee', 'ee', 'ee', 'ee', '200', '0', '0', '0', '200', '江南制造总局', '5号仓库', '200');
INSERT INTO `t_checkstorage` VALUES ('20', 'hh', 'hh', 'yy', 'hh', 'hh', '10', '0', '1000', '0', '1010', '河东区三原电力有限公司', '4号仓库', '');
INSERT INTO `t_checkstorage` VALUES ('7823', 'test', 'test', 'test', 'test', 'test', '0', '0', '2366', '0', '2366', '三条石金属铸造厂', '1号仓库', 'test新增到库存记录中');
INSERT INTO `t_checkstorage` VALUES ('7826', 'DD-56', '56型下水管', '水管', 'PVC', '16cm', '0', '0', '0', '0', '0', '江南制造总局', '5号仓库', '库存该2000');
INSERT INTO `t_checkstorage` VALUES ('7827', '是地方与华盛顿', '水管', '水管', '铁', '0.85mm', '0', '0', '400', '0', '400', '江南制造总局', '5号仓库', '库存表应为400');
INSERT INTO `t_checkstorage` VALUES ('7828', '77', 'dh', 'dh', 'h', 'df', '0', '0', '777', '0', '777', '三条石金属铸造厂', '4号仓库', '777新增加到库存');
INSERT INTO `t_checkstorage` VALUES ('7829', 'sdg', 'dhdfh', 'fgjh', '356', 'dsfgs', '0', '0', '-3361', '0', '-3361', '三条石金属铸造厂', '3号仓库', '');
INSERT INTO `t_checkstorage` VALUES ('7830', 'rr', 'rr', 'rr', 'rr', 'rr', '0', '0', '-23', '0', '-23', '三条石金属铸造厂', '8号仓库', 'rr');
INSERT INTO `t_checkstorage` VALUES ('7831', 'tttt', 'dhdfh', '4356', '356', 'dfhssd', '0', '0', '-1536', '0', '-1536', '三条石金属铸造厂', '2号仓库', '');
INSERT INTO `t_checkstorage` VALUES ('7832', '007', '007', '007', '007', '007', '0', '0', '70', '0', '70', '三条石金属铸造厂', '2号仓库', '007');
INSERT INTO `t_checkstorage` VALUES ('7833', 'dujh', 'dsfh', 'sdfg', 'dsh', 'dfgjd', '0', '0', '-32', '0', '-32', '三条石金属铸造厂', '3号仓库', '发个');
INSERT INTO `t_checkstorage` VALUES ('7834', '124DGF', '下水管道', '水管', '铁', '0.563mm', '0', '0', '-32', '0', '-32', '三条石金属铸造厂', '3号仓库', '');
INSERT INTO `t_checkstorage` VALUES ('7839', 'aa', 'aa', 'aa', 'aa', 'aa', '0', '0', '200', '0', '200', '三条石金属铸造厂', '5号仓库', '200');
INSERT INTO `t_checkstorage` VALUES ('7840', 'bb', 'bb', 'bb', 'bb', 'bb', '0', '0', '999', '0', '999', '三条石金属铸造厂', '2号仓库', '999');
INSERT INTO `t_checkstorage` VALUES ('7841', 'cai', 'cai', 'cai', 'cai', 'cai', '0', '0', '1322', '0', '1322', '俊峰铸造厂', '3号仓库', 'cai  222');
INSERT INTO `t_checkstorage` VALUES ('7842', 'qqq', 'qqq', 'qqq', 'qqq', 'qqq', '0', '0', '2000', '0', '2000', '河东区三原电力有限公司', '2号仓库', '3000');
INSERT INTO `t_checkstorage` VALUES ('7843', '34-GHH', '铜矿石', '矿石', '矿石', '25T', '0', '0', '-300', '0', '-300', '江南制造总局', '5号仓库', '可以');
INSERT INTO `t_checkstorage` VALUES ('7844', '788-HGH', '稀有金属', '金属', '金属', '0.2T', '0', '0', '-300', '0', '-300', '俊峰铸造厂', '1号仓库', '');
INSERT INTO `t_checkstorage` VALUES ('7845', 'tui', 'tui', 'tui', 'tui', 'tui', '0', '0', '0', '0', '0', '江南制造总局', '3号仓库', '4500');
INSERT INTO `t_checkstorage` VALUES ('7849', 'eee', 'eee', 'eee', 'eee', 'eee', '0', '0', '0', '2000', '0', '江南制造总局', '8号仓库', '1001');
INSERT INTO `t_checkstorage` VALUES ('7850', 'ggg', 'ggg', 'ggg', 'ggg', 'ggg', '0', '0', '0', '0', '0', '江南制造总局', '3号仓库', '40000');
INSERT INTO `t_checkstorage` VALUES ('7852', '收人头', '有', ' 人', '而已 ', '我还有', '0', '0', '2222', '0', '2222', '江南制造总局', '5号仓库', '有意思');
INSERT INTO `t_checkstorage` VALUES ('7853', '075D', '护卫舰', '战舰', '钢铁合金', '2000T', '0', '0', '5', '0', '5', '三条石金属铸造厂', '1号仓库', '无');
INSERT INTO `t_checkstorage` VALUES ('7854', 'DG784', '784型三角架', '三脚架', '钢', '12*25*45', '0', '0', '362', '0', '362', '三条石金属铸造厂', '2号仓库', '三脚架');
INSERT INTO `t_checkstorage` VALUES ('7855', 'panpan', '盼盼法式小面包', '面包', '淀粉', '300g', '0', '0', '700', '0', '700', '三条石金属铸造厂', '2号仓库', '200，加上五百');
INSERT INTO `t_checkstorage` VALUES ('7856', 'dddddddd', 'fcjcgyidry', 'vgjcfhyzdr', 'vgjchj', 'sefsz', '0', '0', '200', '0', '200', '三条石金属铸造厂', '4号仓库', 'fgvjc');
INSERT INTO `t_checkstorage` VALUES ('7857', 'yyyyyy', 'yyyyyyyyyy', 'yyyyyyyyyyy', 'yyyyyyyy', 'yyyyyyyyyy', '0', '0', '0', '100', '-100', '中铁一局集团有限公司', '5号仓库', 'uiuytuty');
INSERT INTO `t_checkstorage` VALUES ('7858', 'GH-0236', '0236型切割机', '切割机', '混合', '10kg', '0', '0', '20', '0', '20', '河北三菱重型机床有限公司', '2号仓库', '20总');
INSERT INTO `t_checkstorage` VALUES ('7859', 'mmmm', 'mmmm', 'mmmm', 'mmmm', 'mmmm', '0', '0', '100', '0', '100', 'aaa', '2号仓库', 'wu');
INSERT INTO `t_checkstorage` VALUES ('7862', 'oooooo', 'ooo', 'oo', 'oo', 'ooo', '0', '0', '0', '1000', '-1000', '三条石金属铸造厂', '5号仓库', '1000');
INSERT INTO `t_checkstorage` VALUES ('7864', 'kk', 'kk', 'kk', 'kk', 'kk', '0', '0', '3000', '0', '3000', '三条石金属铸造厂', '5号仓库', '3000');

-- ----------------------------
-- Table structure for t_consumeout
-- ----------------------------
DROP TABLE IF EXISTS `t_consumeout`;
CREATE TABLE `t_consumeout` (
  `INID` int(10) NOT NULL auto_increment,
  `PRID` varchar(60) NOT NULL,
  `PRNAME` varchar(60) NOT NULL,
  `PRKIND` varchar(60) default NULL,
  `MATERIAL` varchar(60) default NULL,
  `SPECIFICATION` varchar(60) default NULL,
  `PRQUANTITY` int(20) NOT NULL,
  `PRDATE` datetime NOT NULL,
  `CHECHER` varchar(30) NOT NULL,
  `WAREHOUSE` varchar(30) NOT NULL,
  `REMARKS` varchar(100) default NULL,
  PRIMARY KEY  (`INID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_consumeout
-- ----------------------------
INSERT INTO `t_consumeout` VALUES ('1', '9A91', '9A91', '无托小步枪', '精钢', '0.85m', '1000', '2017-03-17 11:15:09', '李晓', '1号仓', '步枪');
INSERT INTO `t_consumeout` VALUES ('2', 'yy', '中正式', 'yy', 'yy', 'yy', '234', '2017-03-25 00:00:00', 'yy', '2号仓库', 'yy');
INSERT INTO `t_consumeout` VALUES ('3', 'DFH-356', '生铁', '生铁', '矿石', '263kg', '300', '2017-02-28 00:00:00', '大东', '6号仓库', '无4奥运');
INSERT INTO `t_consumeout` VALUES ('4', 'DFH-356', '中正式', 'ii', '矿石', '263kg', '300', '2017-03-02 00:00:00', '多方通话', '4号仓库', '');
INSERT INTO `t_consumeout` VALUES ('5', 'ii', '中正式', '而已 ', '矿石', 'ii', '300', '2017-03-02 00:00:00', '多方通话', '4号仓库', '');
INSERT INTO `t_consumeout` VALUES ('6', 'DFH-356', 'ii', 'ii', 'yy', '263kg', '300', '2017-03-02 00:00:00', '多方通话', '5号仓库', '');
INSERT INTO `t_consumeout` VALUES ('7', 'yy', 'ii', '而已 ', 'yy', 'yy', '300', '2017-03-02 00:00:00', '多方通话', '2号仓库', '');
INSERT INTO `t_consumeout` VALUES ('8', 'DFH-356', '中正式', '而已 ', '矿石', '263kg', '300', '2017-03-07 00:00:00', '而问题', '2号仓库', '');
INSERT INTO `t_consumeout` VALUES ('9', '然而', 'ii', 'yy', '矿石', '色人员', '45675', '2017-03-07 00:00:00', 'ii', '3号仓库', '啊问题 ');
INSERT INTO `t_consumeout` VALUES ('10', 'dxfhy', 'uer', 'uyi', 'fdu ', 'h', '45675', '2017-02-26 00:00:00', 'yy', '3号仓库', 'rst');
INSERT INTO `t_consumeout` VALUES ('11', 'yy', '中正式', 'ii', 'fdu ', 'yy', '45675', '2017-03-11 00:00:00', '而问题', '6号仓库', '反弹沽');
INSERT INTO `t_consumeout` VALUES ('12', '然而', 'yy', 'yy', 'fdu ', '263kg', '45675', '2017-03-11 00:00:00', 'yy', '5号仓库', '访谈');
INSERT INTO `t_consumeout` VALUES ('13', 'ii', 'ii', '而已 ', '矿石', '色人员', '45675', '2017-03-07 00:00:00', 'ii', '7号仓库', '饿月 ');
INSERT INTO `t_consumeout` VALUES ('14', 'DFH-356', '中正式', 'ii', 'yy', '色人员', '45675', '2017-03-20 00:00:00', 'ii', '4号仓库', '地方工业');
INSERT INTO `t_consumeout` VALUES ('15', '然而', 'yy', 'uyi', 'yy', 'ii', '45675', '2017-03-23 00:00:00', 'yy', '5号仓库', '打野');
INSERT INTO `t_consumeout` VALUES ('16', 'wer', 'wer', 'wer', 'wer', 'wer', '3425', '2017-05-04 00:00:00', 'wer', '1号仓库', 'wer');
INSERT INTO `t_consumeout` VALUES ('17', 'iioo', 'cxgxf', 'jdfjs', 'asfsda', 'gsdfg', '2000', '2017-05-10 00:00:00', '海丰', '3号仓库', 'sdg');
INSERT INTO `t_consumeout` VALUES ('18', 'oooooo', 'ooo', 'oo', 'oo', 'ooo', '200', '2017-05-11 00:00:00', '海丰', '5号仓库', 'oo');
INSERT INTO `t_consumeout` VALUES ('19', 'oooooo', 'ooo', 'ooo', 'ooo', 'ooo', '800', '2017-05-11 00:00:00', '海', '5号仓库', '1000');

-- ----------------------------
-- Table structure for t_countmonthly
-- ----------------------------
DROP TABLE IF EXISTS `t_countmonthly`;
CREATE TABLE `t_countmonthly` (
  `INID` int(10) NOT NULL auto_increment,
  `PRID` varchar(60) NOT NULL,
  `PRNAME` varchar(60) NOT NULL,
  `INQUANTITY` int(20) default NULL,
  `OUTQUANTITY` int(20) default NULL,
  `PRDATE` date NOT NULL,
  `REMARKS` varchar(60) default NULL,
  PRIMARY KEY  (`INID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_countmonthly
-- ----------------------------
INSERT INTO `t_countmonthly` VALUES ('1', 'WE', 'WE', '23', '9', '2017-03-18', '');

-- ----------------------------
-- Table structure for t_customer
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer` (
  `customerId` varchar(20) NOT NULL,
  `customerCompany` varchar(50) default NULL,
  `customerAddress` varchar(50) default NULL,
  `customerPostcode` varchar(20) default NULL,
  `customerName` varchar(20) NOT NULL,
  `customerPhone` varchar(20) NOT NULL,
  `customerEmail` varchar(30) default NULL,
  PRIMARY KEY  (`customerId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_customer
-- ----------------------------
INSERT INTO `t_customer` VALUES ('c001', '中铁一局集团有限公司', '西安市雁塔北路1号', '320218', '唐先生', '18945585023', 'qiyang@163.com');
INSERT INTO `t_customer` VALUES ('c002', '中铁二局集团有限公司', '成都市马家花园路10号 ', '320218', '李易峰', '18895623542', 'qiyang@163.com');
INSERT INTO `t_customer` VALUES ('c003', '中铁三局集团有限公司', '太原市迎泽大街269号', '320218', '彭于晏', '18945585023', 'qiyang@163.com');
INSERT INTO `t_customer` VALUES ('c004', '中铁四局集团有限公司', '合肥市望江东路96号 ', '320218', '王大锤', '18945585023', 'qiyang@163.com');
INSERT INTO `t_customer` VALUES ('c005', '中铁五局集团有限公司', '贵阳市枣山路23号 ', '320218', '石榴姐', '18945585023', 'qiyang@163.com');
INSERT INTO `t_customer` VALUES ('c006', '中铁六局集团有限公司', '北京市海淀区万寿路2号 ', '320218', '李力持', '18945585023', 'qiyang@163.com');
INSERT INTO `t_customer` VALUES ('c007', '中铁七局集团有限公司', '郑州市航海东路1225号 ', '320218', '吴京', '18945585023', 'qiyang@163.com');
INSERT INTO `t_customer` VALUES ('c008', '中铁八局集团有限公司', '成都市一环路北二段100号', '320218', '甄子丹', '18945585023', 'qiyang@163.com');
INSERT INTO `t_customer` VALUES ('c009', '中铁九局集团有限公司', '沈阳市沈河区敬宾街3-1号', '320218', '姜文', '18945585023', 'qiyang@163.com');
INSERT INTO `t_customer` VALUES ('c010', '中铁十局集团有限公司', '济南市车站街167号 ', '320218', '姜武', '18945585023', 'qiyang@163.com');
INSERT INTO `t_customer` VALUES ('c011', '中铁十一局集团有限公司', '武汉市武昌区丁字桥103号 ', '320218', '张家辉', '18945585023', 'qiyang@163.com');
INSERT INTO `t_customer` VALUES ('c012', '中铁十二局集团有限公司', '太原市西矿街130号 ', '320218', '如花', '18945585023', 'qiyang@163.com');
INSERT INTO `t_customer` VALUES ('c013', '中铁十三局集团有限公司', '长春市二道区岭东路2138号', '320218', '丹尼尔克雷格', '18945585023', 'qiyang@163.com');
INSERT INTO `t_customer` VALUES ('c014', '中铁十四局集团有限公司', '济南市和平路1号', '320218', '吴孟达', '18945585023', 'qiyang@163.com');
INSERT INTO `t_customer` VALUES ('c015', '中铁十五局集团有限公司', '洛阳市四通路 ', '320218', '黄一山', '18945585023', 'qiyang@163.com');
INSERT INTO `t_customer` VALUES ('c016', '中铁十六局集团有限公司', '北京市朝阳区红松园北里甲2号 ', '320218', '胡其阳', '18945585023', 'qiyang@163.com');
INSERT INTO `t_customer` VALUES ('c017', '中铁十七局集团有限公司', '太原市平阳路266号 ', '5215422', '史蒂芬周', '1657321657864', 'qiyang@163.com');
INSERT INTO `t_customer` VALUES ('c018', '中铁十八局集团有限公司', '天津市河西区柳林 ', '320156', '达闻西', '16584598523', '保密');
INSERT INTO `t_customer` VALUES ('c019', '中铁十九局集团有限公司', '辽阳市和平路17号', '320218', '李修贤', '125648521', '');
INSERT INTO `t_customer` VALUES ('c020', '中铁二十局集团有限公司', '西安市太华路89号 ', '320218', '何先生', '15216845454', '');
INSERT INTO `t_customer` VALUES ('c021', '中铁二十一局集团有限公司', '兰州市和政路156号', '320218', '赵信', '15216845454', '无');
INSERT INTO `t_customer` VALUES ('c022', '中铁二十二局集团有限公司', '北京市复兴路40号', '320219', '白方礼', '16584598523', '');
INSERT INTO `t_customer` VALUES ('c023', '中铁二十三局集团有限公司', '成都市东门街84号', '320256', '郭吉祥', '15216845454', '无');
INSERT INTO `t_customer` VALUES ('c024', '中铁二十四局集团有限公司', '上海市会文路2号 ', '320219', '李连杰', '16584598523', '无');
INSERT INTO `t_customer` VALUES ('c025', '中铁二十五局集团有限公司', '广州市中山一路55号 ', '5215422', '何文辉', '18895623542', '无');
INSERT INTO `t_customer` VALUES ('c026', '采购商001', '保密', 'eeeeeeeeee', 'wwwww', '13246444545', 'wwww');

-- ----------------------------
-- Table structure for t_good
-- ----------------------------
DROP TABLE IF EXISTS `t_good`;
CREATE TABLE `t_good` (
  `id` int(11) NOT NULL auto_increment,
  `goodnumber` char(20) default NULL,
  `goodname` char(20) default NULL,
  `supplierid` int(11) default NULL,
  `goodcategoriesid` int(11) default NULL,
  `note` char(50) default NULL,
  `photo` char(50) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_t_good` (`supplierid`),
  KEY `F_t_good` (`goodcategoriesid`),
  CONSTRAINT `FK_t_good` FOREIGN KEY (`supplierid`) REFERENCES `t_supplier` (`id`),
  CONSTRAINT `F_t_good` FOREIGN KEY (`goodcategoriesid`) REFERENCES `t_goodcategories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_good
-- ----------------------------
INSERT INTO `t_good` VALUES ('1', '1', '复仇者', '1', '1', '商品1', 'images/page4-img3.jpg');
INSERT INTO `t_good` VALUES ('4', '2', '牧马人', '1', '1', '商品2', 'images/page4-img1.jpg');
INSERT INTO `t_good` VALUES ('7', '3', '塞德斯', '1', '2', '商品3', 'images/page4-img2.jpg');
INSERT INTO `t_good` VALUES ('9', '5', 'nica', '1', '2', 'shangpin3', 'images/page4-img4.jpg');
INSERT INTO `t_good` VALUES ('10', '4', 'fds', '1', '1', 'asd', 'images/page4-img5.jpg');
INSERT INTO `t_good` VALUES ('11', '6', 'asd', '1', '2', 'asd', 'images/page4-img6.jpg');

-- ----------------------------
-- Table structure for t_goodcategories
-- ----------------------------
DROP TABLE IF EXISTS `t_goodcategories`;
CREATE TABLE `t_goodcategories` (
  `id` int(11) NOT NULL auto_increment,
  `goodname` char(10) default NULL,
  `description` char(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goodcategories
-- ----------------------------
INSERT INTO `t_goodcategories` VALUES ('1', '鼠标', '牧马人');
INSERT INTO `t_goodcategories` VALUES ('2', '键盘', '复仇者');
INSERT INTO `t_goodcategories` VALUES ('3', '耳机', '萨德斯');
INSERT INTO `t_goodcategories` VALUES ('17', '正在z\'z', 'z\'z\'z');

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log` (
  `logid` int(20) NOT NULL auto_increment,
  `loguser` varchar(50) NOT NULL,
  `logtime` varchar(50) NOT NULL,
  `logtype` varchar(50) NOT NULL,
  PRIMARY KEY  (`logid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES ('1', 'admin', '2017-02-24 14:46:08', '1');
INSERT INTO `t_log` VALUES ('2', 'tom', '2017-02-24 15:02:39', '1');
INSERT INTO `t_log` VALUES ('3', 'admin', '2017-02-24 11:03:13', '0');
INSERT INTO `t_log` VALUES ('4', 'aaaa', '2017-02-24 14:46:08', '1');
INSERT INTO `t_log` VALUES ('5', 'admin', '2017-02-24 16:37:38', '1');
INSERT INTO `t_log` VALUES ('6', 'admin', '2017-02-24 17:00:01', '1');
INSERT INTO `t_log` VALUES ('7', 'tom', '2017-02-24 17:02:50', '1');
INSERT INTO `t_log` VALUES ('8', 'bond', '2017-02-24 17:03:56', '1');
INSERT INTO `t_log` VALUES ('9', 'admin', '2017-02-24 17:05:36', '1');
INSERT INTO `t_log` VALUES ('10', 'bond', '2017-02-24 17:09:05', '1');
INSERT INTO `t_log` VALUES ('11', 'bond', '2017-02-24 17:09:23', '0');
INSERT INTO `t_log` VALUES ('12', 'john', '2017-02-24 17:09:49', '1');
INSERT INTO `t_log` VALUES ('13', 'tom', '2017-02-24 17:11:13', '1');
INSERT INTO `t_log` VALUES ('14', 'tom', '2017-02-24 17:12:22', '0');
INSERT INTO `t_log` VALUES ('15', 'tom', '2017-02-24 17:14:00', '1');
INSERT INTO `t_log` VALUES ('16', 'admin', '2017-02-24 22:19:09', '1');
INSERT INTO `t_log` VALUES ('17', 'admin', '2017-02-24 22:30:14', '0');
INSERT INTO `t_log` VALUES ('18', 'super', '2017-02-24 22:30:24', '1');
INSERT INTO `t_log` VALUES ('19', 'super', '2017-02-24 22:37:29', '1');
INSERT INTO `t_log` VALUES ('20', 'admin', '2017-02-24 22:40:54', '1');
INSERT INTO `t_log` VALUES ('21', 'tom', '2017-02-25 16:54:52', '1');
INSERT INTO `t_log` VALUES ('22', 'admin', '2017-02-25 20:50:00', '1');
INSERT INTO `t_log` VALUES ('23', 'admin', '2017-02-25 21:57:34', '0');
INSERT INTO `t_log` VALUES ('24', 'super', '2017-02-25 21:57:49', '1');
INSERT INTO `t_log` VALUES ('25', 'admin', '2017-02-25 22:11:01', '1');
INSERT INTO `t_log` VALUES ('26', 'admin', '2017-02-25 23:21:53', '0');
INSERT INTO `t_log` VALUES ('27', 'hqy', '2017-02-25 23:22:10', '1');
INSERT INTO `t_log` VALUES ('28', 'hqy', '2017-02-26 11:43:04', '1');
INSERT INTO `t_log` VALUES ('29', 'hqy', '2017-02-26 11:48:46', '0');
INSERT INTO `t_log` VALUES ('30', 'tom', '2017-02-26 13:43:36', '1');
INSERT INTO `t_log` VALUES ('31', 'tom', '2017-02-26 13:55:14', '0');
INSERT INTO `t_log` VALUES ('32', 'hqy', '2017-02-26 13:56:21', '1');
INSERT INTO `t_log` VALUES ('33', 'admin', '2017-02-26 14:37:47', '1');
INSERT INTO `t_log` VALUES ('34', 'admin', '2017-02-26 14:48:06', '0');
INSERT INTO `t_log` VALUES ('35', 'super', '2017-02-26 14:48:18', '1');
INSERT INTO `t_log` VALUES ('36', 'john', '2017-02-26 14:54:05', '1');
INSERT INTO `t_log` VALUES ('37', 'super', '2017-02-26 15:32:02', '1');
INSERT INTO `t_log` VALUES ('38', 'super', '2017-02-26 15:51:17', '1');
INSERT INTO `t_log` VALUES ('39', 'admin', '2017-02-26 16:05:09', '1');
INSERT INTO `t_log` VALUES ('40', 'super', '2017-02-26 16:11:10', '1');
INSERT INTO `t_log` VALUES ('41', 'super', '2017-02-26 16:11:16', '0');
INSERT INTO `t_log` VALUES ('42', 'super', '2017-02-26 16:12:53', '1');
INSERT INTO `t_log` VALUES ('43', 'super', '2017-02-26 16:27:19', '1');
INSERT INTO `t_log` VALUES ('44', 'admin', '2017-02-26 16:39:07', '1');
INSERT INTO `t_log` VALUES ('45', 'admin', '2017-02-26 16:43:12', '0');
INSERT INTO `t_log` VALUES ('46', 'hqy', '2017-02-26 16:43:23', '1');
INSERT INTO `t_log` VALUES ('47', 'admin', '2017-02-26 17:16:26', '1');
INSERT INTO `t_log` VALUES ('48', 'super', '2017-02-26 18:50:36', '1');
INSERT INTO `t_log` VALUES ('49', 'super', '2017-02-26 18:57:49', '1');
INSERT INTO `t_log` VALUES ('50', 'hqy', '2017-02-26 20:35:46', '1');
INSERT INTO `t_log` VALUES ('51', 'admin', '2017-02-26 21:42:42', '1');
INSERT INTO `t_log` VALUES ('52', 'admin', '2017-02-26 21:42:57', '0');
INSERT INTO `t_log` VALUES ('53', 'admin', '2017-02-26 21:43:18', '1');
INSERT INTO `t_log` VALUES ('54', 'admin', '2017-02-26 21:43:37', '0');
INSERT INTO `t_log` VALUES ('55', 'admin', '2017-02-26 21:45:13', '1');
INSERT INTO `t_log` VALUES ('56', 'super', '2017-02-26 22:11:22', '1');
INSERT INTO `t_log` VALUES ('57', 'admin', '2017-02-26 22:19:12', '1');
INSERT INTO `t_log` VALUES ('58', 'admin', '2017-02-26 22:35:21', '0');
INSERT INTO `t_log` VALUES ('59', 'hqy', '2017-02-26 22:36:33', '1');
INSERT INTO `t_log` VALUES ('60', 'hqy', '2017-02-26 22:36:55', '0');
INSERT INTO `t_log` VALUES ('61', 'admin', '2017-02-26 22:39:03', '1');
INSERT INTO `t_log` VALUES ('62', 'admin', '2017-02-26 22:39:08', '0');
INSERT INTO `t_log` VALUES ('63', 'super', '2017-02-26 22:46:30', '1');
INSERT INTO `t_log` VALUES ('64', 'super', '2017-02-26 22:46:35', '0');
INSERT INTO `t_log` VALUES ('65', 'super', '2017-02-26 22:47:21', '1');
INSERT INTO `t_log` VALUES ('66', 'super', '2017-02-26 22:47:23', '0');
INSERT INTO `t_log` VALUES ('67', 'admin', '2017-02-26 22:55:28', '1');
INSERT INTO `t_log` VALUES ('68', 'admin', '2017-02-26 22:56:17', '0');
INSERT INTO `t_log` VALUES ('69', 'admin', '2017-02-26 22:58:40', '1');
INSERT INTO `t_log` VALUES ('70', 'admin', '2017-02-27 22:06:18', '1');
INSERT INTO `t_log` VALUES ('71', 'admin', '2017-02-27 22:08:46', '0');
INSERT INTO `t_log` VALUES ('72', 'super', '2017-02-27 22:12:37', '1');
INSERT INTO `t_log` VALUES ('73', 'super', '2017-03-01 20:56:41', '1');
INSERT INTO `t_log` VALUES ('74', 'admin', '2017-03-01 21:08:16', '1');
INSERT INTO `t_log` VALUES ('75', 'hqy', '2017-03-01 21:20:59', '1');
INSERT INTO `t_log` VALUES ('76', 'admin', '2017-03-01 21:23:00', '1');
INSERT INTO `t_log` VALUES ('77', 'admin', '2017-03-01 21:29:28', '1');
INSERT INTO `t_log` VALUES ('78', 'admin', '2017-03-01 21:39:26', '1');
INSERT INTO `t_log` VALUES ('79', 'super', '2017-03-01 21:43:25', '1');
INSERT INTO `t_log` VALUES ('80', 'admin', '2017-03-01 21:46:08', '1');
INSERT INTO `t_log` VALUES ('81', 'admin', '2017-03-01 21:56:46', '1');
INSERT INTO `t_log` VALUES ('82', 'admin', '2017-03-01 22:04:28', '1');
INSERT INTO `t_log` VALUES ('83', 'admin', '2017-03-01 22:16:38', '1');
INSERT INTO `t_log` VALUES ('84', 'a', '2017-03-01 22:24:50', '1');
INSERT INTO `t_log` VALUES ('85', 'a', '2017-03-01 22:30:44', '1');
INSERT INTO `t_log` VALUES ('86', 'a', '2017-03-01 22:36:36', '1');
INSERT INTO `t_log` VALUES ('87', 'a', '2017-03-02 23:16:37', '1');
INSERT INTO `t_log` VALUES ('88', 'a', '2017-03-02 23:23:42', '0');
INSERT INTO `t_log` VALUES ('89', 'a', '2017-03-04 21:51:24', '1');
INSERT INTO `t_log` VALUES ('90', 'admin', '2017-03-04 23:24:52', '1');
INSERT INTO `t_log` VALUES ('91', 'admin', '2017-03-04 23:28:39', '1');
INSERT INTO `t_log` VALUES ('92', 'admin', '2017-03-04 23:30:33', '0');
INSERT INTO `t_log` VALUES ('93', 'admin', '2017-03-04 23:34:29', '1');
INSERT INTO `t_log` VALUES ('94', 'admin', '2017-03-04 23:35:12', '0');
INSERT INTO `t_log` VALUES ('95', 'admin', '2017-03-04 23:36:49', '1');
INSERT INTO `t_log` VALUES ('96', 'admin', '2017-03-04 23:37:08', '0');
INSERT INTO `t_log` VALUES ('97', 'admin', '2017-03-04 23:37:59', '1');
INSERT INTO `t_log` VALUES ('98', 'admin', '2017-03-04 23:38:05', '0');
INSERT INTO `t_log` VALUES ('99', 'admin', '2017-03-04 23:39:06', '1');
INSERT INTO `t_log` VALUES ('100', 'admin', '2017-03-04 23:39:16', '0');
INSERT INTO `t_log` VALUES ('101', 'admin', '2017-03-04 23:42:59', '1');
INSERT INTO `t_log` VALUES ('102', 'admin', '2017-03-04 23:45:50', '0');
INSERT INTO `t_log` VALUES ('103', 'admin', '2017-03-04 23:46:37', '1');
INSERT INTO `t_log` VALUES ('104', 'admin', '2017-03-04 23:47:55', '0');
INSERT INTO `t_log` VALUES ('105', 'admin', '2017-03-04 23:52:38', '1');
INSERT INTO `t_log` VALUES ('106', 'admin', '2017-03-04 23:52:40', '0');
INSERT INTO `t_log` VALUES ('107', 'admin', '2017-03-04 23:56:47', '1');
INSERT INTO `t_log` VALUES ('108', 'admin', '2017-03-04 23:58:34', '0');
INSERT INTO `t_log` VALUES ('109', 'a', '2017-03-05 00:04:27', '1');
INSERT INTO `t_log` VALUES ('110', 'a', '2017-03-05 00:04:44', '0');
INSERT INTO `t_log` VALUES ('111', 'admin', '2017-03-05 00:05:58', '1');
INSERT INTO `t_log` VALUES ('112', 'admin', '2017-03-05 00:06:03', '0');
INSERT INTO `t_log` VALUES ('113', 'a', '2017-03-05 00:08:00', '1');
INSERT INTO `t_log` VALUES ('114', 'a', '2017-03-05 00:08:02', '0');
INSERT INTO `t_log` VALUES ('115', 'admin', '2017-03-05 00:12:02', '1');
INSERT INTO `t_log` VALUES ('116', 'admin', '2017-03-05 00:12:33', '0');
INSERT INTO `t_log` VALUES ('117', 'admin', '2017-03-06 22:28:55', '1');
INSERT INTO `t_log` VALUES ('118', 'admin', '2017-03-06 23:58:06', '0');
INSERT INTO `t_log` VALUES ('119', 'admin', '2017-03-07 22:39:49', '1');
INSERT INTO `t_log` VALUES ('120', 'admin', '2017-03-07 22:52:54', '0');
INSERT INTO `t_log` VALUES ('121', 'a', '2017-03-07 22:53:06', '1');
INSERT INTO `t_log` VALUES ('122', 'a', '2017-03-07 23:44:27', '0');
INSERT INTO `t_log` VALUES ('123', 'super', '2017-03-08 21:01:48', '1');
INSERT INTO `t_log` VALUES ('124', 'super', '2017-03-08 21:19:56', '0');
INSERT INTO `t_log` VALUES ('125', 'admin', '2017-03-08 21:29:23', '1');
INSERT INTO `t_log` VALUES ('126', 'admin', '2017-03-09 22:39:25', '1');
INSERT INTO `t_log` VALUES ('127', 'a', '2017-03-09 22:45:55', '1');
INSERT INTO `t_log` VALUES ('128', 'admin', '2017-03-09 22:50:00', '1');
INSERT INTO `t_log` VALUES ('129', 'admin', '2017-03-09 23:08:04', '0');
INSERT INTO `t_log` VALUES ('130', 'admin', '2017-03-10 21:27:39', '1');
INSERT INTO `t_log` VALUES ('131', 'admin', '2017-03-10 21:30:51', '1');
INSERT INTO `t_log` VALUES ('132', 'a', '2017-03-10 21:37:57', '1');
INSERT INTO `t_log` VALUES ('133', 'admin', '2017-03-10 21:54:51', '1');
INSERT INTO `t_log` VALUES ('134', 'a', '2017-03-10 22:56:27', '1');
INSERT INTO `t_log` VALUES ('135', 'a', '2017-03-10 23:01:25', '0');
INSERT INTO `t_log` VALUES ('136', 'super', '2017-03-10 23:01:40', '1');
INSERT INTO `t_log` VALUES ('137', 'a', '2017-03-10 23:04:17', '1');
INSERT INTO `t_log` VALUES ('138', 'a', '2017-03-10 23:07:34', '0');
INSERT INTO `t_log` VALUES ('139', 'super', '2017-03-10 23:14:44', '0');
INSERT INTO `t_log` VALUES ('140', 'a', '2017-03-10 23:15:37', '1');
INSERT INTO `t_log` VALUES ('141', 'a', '2017-03-10 23:15:39', '0');
INSERT INTO `t_log` VALUES ('142', 'admin', '2017-03-10 23:16:49', '1');
INSERT INTO `t_log` VALUES ('143', 'admin', '2017-03-10 23:16:50', '0');
INSERT INTO `t_log` VALUES ('144', 'a', '2017-03-10 23:20:50', '1');
INSERT INTO `t_log` VALUES ('145', 'a', '2017-03-10 23:20:55', '0');
INSERT INTO `t_log` VALUES ('146', 'a', '2017-03-10 23:23:31', '1');
INSERT INTO `t_log` VALUES ('147', 'a', '2017-03-10 23:23:33', '0');
INSERT INTO `t_log` VALUES ('148', 'admin', '2017-03-10 23:24:31', '1');
INSERT INTO `t_log` VALUES ('149', 'admin', '2017-03-10 23:24:43', '0');
INSERT INTO `t_log` VALUES ('150', 'admin', '2017-03-10 23:27:21', '1');
INSERT INTO `t_log` VALUES ('151', 'admin', '2017-03-10 23:27:25', '0');
INSERT INTO `t_log` VALUES ('152', 'a', '2017-03-10 23:29:24', '1');
INSERT INTO `t_log` VALUES ('153', 'a', '2017-03-10 23:29:27', '0');
INSERT INTO `t_log` VALUES ('154', 'admin', '2017-03-10 23:31:01', '1');
INSERT INTO `t_log` VALUES ('155', 'admin', '2017-03-10 23:31:03', '0');
INSERT INTO `t_log` VALUES ('156', 'a', '2017-03-11 14:01:35', '1');
INSERT INTO `t_log` VALUES ('157', 'admin', '2017-03-11 14:02:23', '1');
INSERT INTO `t_log` VALUES ('158', 'super', '2017-03-11 14:07:38', '1');
INSERT INTO `t_log` VALUES ('159', 'a', '2017-03-11 14:15:07', '1');
INSERT INTO `t_log` VALUES ('160', 'a', '2017-03-11 14:20:35', '0');
INSERT INTO `t_log` VALUES ('161', 'super', '2017-03-11 15:53:11', '0');
INSERT INTO `t_log` VALUES ('162', 'super', '2017-03-11 18:42:58', '1');
INSERT INTO `t_log` VALUES ('163', 'admin', '2017-03-11 20:00:52', '1');
INSERT INTO `t_log` VALUES ('164', 'admin', '2017-03-11 21:27:04', '1');
INSERT INTO `t_log` VALUES ('165', 'a', '2017-03-11 21:37:52', '1');
INSERT INTO `t_log` VALUES ('166', 'admin', '2017-03-11 21:42:33', '1');
INSERT INTO `t_log` VALUES ('167', 'a', '2017-03-11 21:55:00', '1');
INSERT INTO `t_log` VALUES ('168', 'a', '2017-03-11 22:05:45', '1');
INSERT INTO `t_log` VALUES ('169', 'a', '2017-03-11 22:11:37', '1');
INSERT INTO `t_log` VALUES ('170', 'a', '2017-03-11 22:35:45', '1');
INSERT INTO `t_log` VALUES ('171', 'a', '2017-03-11 22:40:33', '1');
INSERT INTO `t_log` VALUES ('172', 'a', '2017-03-11 23:10:04', '1');
INSERT INTO `t_log` VALUES ('173', 'admin', '2017-03-11 23:16:50', '1');
INSERT INTO `t_log` VALUES ('174', 'admin', '2017-03-11 23:29:36', '1');
INSERT INTO `t_log` VALUES ('175', 'a', '2017-03-11 23:51:31', '1');
INSERT INTO `t_log` VALUES ('176', 'super', '2017-03-12 12:26:09', '1');
INSERT INTO `t_log` VALUES ('177', 'a', '2017-03-12 12:34:55', '1');
INSERT INTO `t_log` VALUES ('178', 'a', '2017-03-12 16:13:44', '1');
INSERT INTO `t_log` VALUES ('179', 'a', '2017-03-12 16:21:22', '1');
INSERT INTO `t_log` VALUES ('180', 'admin', '2017-03-12 16:26:22', '1');
INSERT INTO `t_log` VALUES ('181', 'admin', '2017-03-12 16:30:45', '1');
INSERT INTO `t_log` VALUES ('182', 'a', '2017-03-12 16:33:33', '1');
INSERT INTO `t_log` VALUES ('183', 'a', '2017-03-12 17:12:55', '0');
INSERT INTO `t_log` VALUES ('184', 'admin', '2017-03-12 17:13:47', '1');
INSERT INTO `t_log` VALUES ('185', 'a', '2017-03-12 17:24:49', '1');
INSERT INTO `t_log` VALUES ('186', 'a', '2017-03-12 17:35:32', '1');
INSERT INTO `t_log` VALUES ('187', 'a', '2017-03-12 18:31:31', '0');
INSERT INTO `t_log` VALUES ('188', 'a', '2017-03-13 09:54:09', '1');
INSERT INTO `t_log` VALUES ('189', 'a', '2017-03-13 10:14:44', '0');
INSERT INTO `t_log` VALUES ('190', 'a', '2017-03-13 21:27:33', '1');
INSERT INTO `t_log` VALUES ('191', 'a', '2017-03-13 22:58:09', '1');
INSERT INTO `t_log` VALUES ('192', 'a', '2017-03-13 23:10:22', '1');
INSERT INTO `t_log` VALUES ('193', 'super', '2017-03-13 23:21:34', '1');
INSERT INTO `t_log` VALUES ('194', 'a', '2017-03-13 23:33:36', '1');
INSERT INTO `t_log` VALUES ('195', 'admin', '2017-03-13 23:41:27', '1');
INSERT INTO `t_log` VALUES ('196', 'a', '2017-03-14 09:49:58', '1');
INSERT INTO `t_log` VALUES ('197', 'a', '2017-03-14 10:16:31', '1');
INSERT INTO `t_log` VALUES ('198', 'a', '2017-03-14 10:20:27', '1');
INSERT INTO `t_log` VALUES ('199', 'a', '2017-03-14 10:55:07', '1');
INSERT INTO `t_log` VALUES ('200', 'a', '2017-03-14 11:22:58', '1');
INSERT INTO `t_log` VALUES ('201', 'a', '2017-03-14 11:26:00', '1');
INSERT INTO `t_log` VALUES ('202', 'a', '2017-03-14 11:54:47', '1');
INSERT INTO `t_log` VALUES ('203', 'a', '2017-03-14 12:00:35', '0');
INSERT INTO `t_log` VALUES ('204', 'a', '2017-03-14 15:29:05', '1');
INSERT INTO `t_log` VALUES ('205', 'a', '2017-03-14 16:03:41', '1');
INSERT INTO `t_log` VALUES ('206', 'a', '2017-03-15 11:11:46', '1');
INSERT INTO `t_log` VALUES ('207', 'a', '2017-03-15 11:16:16', '0');
INSERT INTO `t_log` VALUES ('208', 'a', '2017-03-15 11:17:12', '1');
INSERT INTO `t_log` VALUES ('209', 'a', '2017-03-15 11:22:22', '1');
INSERT INTO `t_log` VALUES ('210', 'a', '2017-03-15 11:29:13', '1');
INSERT INTO `t_log` VALUES ('211', 'a', '2017-03-15 11:45:06', '1');
INSERT INTO `t_log` VALUES ('212', 'a', '2017-03-15 11:59:47', '1');
INSERT INTO `t_log` VALUES ('213', 'a', '2017-03-15 13:16:47', '1');
INSERT INTO `t_log` VALUES ('214', 'a', '2017-03-15 13:20:09', '1');
INSERT INTO `t_log` VALUES ('215', 'a', '2017-03-15 16:36:50', '1');
INSERT INTO `t_log` VALUES ('216', 'admin', '2017-03-15 22:25:39', '1');
INSERT INTO `t_log` VALUES ('217', 'super', '2017-03-18 21:41:16', '1');
INSERT INTO `t_log` VALUES ('218', 'tjcu', '2017-03-18 22:25:08', '1');
INSERT INTO `t_log` VALUES ('219', 'a', '2017-03-19 14:45:18', '1');
INSERT INTO `t_log` VALUES ('220', 'admin', '2017-03-19 16:03:25', '1');
INSERT INTO `t_log` VALUES ('221', 'admin', '2017-03-19 16:11:38', '1');
INSERT INTO `t_log` VALUES ('222', 'admin', '2017-03-19 16:11:50', '0');
INSERT INTO `t_log` VALUES ('223', 'admin', '2017-03-19 16:12:00', '1');
INSERT INTO `t_log` VALUES ('224', 'a', '2017-03-19 17:06:20', '1');
INSERT INTO `t_log` VALUES ('225', 'admin', '2017-03-19 22:51:07', '1');
INSERT INTO `t_log` VALUES ('226', 'admin', '2017-03-19 23:02:47', '0');
INSERT INTO `t_log` VALUES ('227', 'admin', '2017-03-20 19:49:40', '1');
INSERT INTO `t_log` VALUES ('228', 'admin', '2017-03-20 19:49:48', '0');
INSERT INTO `t_log` VALUES ('229', 'a', '2017-03-20 19:50:57', '1');
INSERT INTO `t_log` VALUES ('230', 'a', '2017-03-20 21:47:03', '1');
INSERT INTO `t_log` VALUES ('231', 'admin', '2017-03-20 21:49:17', '1');
INSERT INTO `t_log` VALUES ('232', 'a', '2017-03-20 22:20:42', '1');
INSERT INTO `t_log` VALUES ('233', 'admin', '2017-03-20 22:56:22', '1');
INSERT INTO `t_log` VALUES ('234', 'admin', '2017-03-20 23:01:18', '1');
INSERT INTO `t_log` VALUES ('235', 'a', '2017-03-21 21:20:51', '1');
INSERT INTO `t_log` VALUES ('236', 'a', '2017-03-21 21:26:41', '1');
INSERT INTO `t_log` VALUES ('237', 'a', '2017-03-21 21:33:41', '1');
INSERT INTO `t_log` VALUES ('238', 'a', '2017-03-21 21:33:55', '1');
INSERT INTO `t_log` VALUES ('239', 'a', '2017-03-21 21:33:55', '1');
INSERT INTO `t_log` VALUES ('240', 'a', '2017-03-21 21:33:55', '1');
INSERT INTO `t_log` VALUES ('241', 'a', '2017-03-21 21:33:55', '1');
INSERT INTO `t_log` VALUES ('242', 'a', '2017-03-21 21:33:55', '1');
INSERT INTO `t_log` VALUES ('243', 'a', '2017-03-21 21:33:55', '1');
INSERT INTO `t_log` VALUES ('244', 'a', '2017-03-21 21:33:56', '1');
INSERT INTO `t_log` VALUES ('245', 'a', '2017-03-21 21:33:56', '1');
INSERT INTO `t_log` VALUES ('246', 'a', '2017-03-21 21:33:56', '1');
INSERT INTO `t_log` VALUES ('247', 'a', '2017-03-21 21:33:56', '1');
INSERT INTO `t_log` VALUES ('248', 'a', '2017-03-21 21:33:56', '1');
INSERT INTO `t_log` VALUES ('249', 'a', '2017-03-21 21:33:57', '1');
INSERT INTO `t_log` VALUES ('250', 'a', '2017-03-21 21:35:04', '1');
INSERT INTO `t_log` VALUES ('251', 'a', '2017-03-21 21:47:30', '1');
INSERT INTO `t_log` VALUES ('252', 'admin', '2017-03-21 21:57:41', '1');
INSERT INTO `t_log` VALUES ('253', 'a', '2017-03-21 22:02:54', '1');
INSERT INTO `t_log` VALUES ('254', 'a', '2017-03-21 22:09:34', '0');
INSERT INTO `t_log` VALUES ('255', 'admin', '2017-03-23 20:17:48', '1');
INSERT INTO `t_log` VALUES ('256', 'admin', '2017-03-23 21:31:02', '0');
INSERT INTO `t_log` VALUES ('257', 'super', '2017-03-23 21:33:51', '1');
INSERT INTO `t_log` VALUES ('258', 'super', '2017-03-23 21:50:48', '0');
INSERT INTO `t_log` VALUES ('259', 'a', '2017-03-23 21:52:00', '1');
INSERT INTO `t_log` VALUES ('260', 'a', '2017-03-23 21:57:51', '0');
INSERT INTO `t_log` VALUES ('261', 'admin', '2017-03-25 19:54:54', '1');
INSERT INTO `t_log` VALUES ('262', 'a', '2017-03-25 20:07:51', '1');
INSERT INTO `t_log` VALUES ('263', 'a', '2017-03-25 20:12:38', '1');
INSERT INTO `t_log` VALUES ('264', 'a', '2017-03-25 20:39:34', '0');
INSERT INTO `t_log` VALUES ('265', 'admin', '2017-03-28 20:22:16', '1');
INSERT INTO `t_log` VALUES ('266', 'a', '2017-03-28 20:59:06', '1');
INSERT INTO `t_log` VALUES ('267', 'super', '2017-03-28 21:04:22', '1');
INSERT INTO `t_log` VALUES ('268', 'super', '2017-03-28 21:29:38', '1');
INSERT INTO `t_log` VALUES ('269', 'admin', '2017-03-28 21:46:06', '1');
INSERT INTO `t_log` VALUES ('270', 'a', '2017-03-28 21:52:38', '1');
INSERT INTO `t_log` VALUES ('271', 'admin', '2017-03-28 22:10:59', '1');
INSERT INTO `t_log` VALUES ('272', 'admin', '2017-03-28 22:17:36', '0');
INSERT INTO `t_log` VALUES ('273', 'admin', '2017-03-28 22:18:15', '1');
INSERT INTO `t_log` VALUES ('274', 'admin', '2017-03-28 22:58:17', '1');
INSERT INTO `t_log` VALUES ('275', 'admin', '2017-03-29 14:53:23', '1');
INSERT INTO `t_log` VALUES ('276', 'admin', '2017-03-29 14:57:06', '0');
INSERT INTO `t_log` VALUES ('277', 'admin', '2017-03-29 18:15:17', '1');
INSERT INTO `t_log` VALUES ('278', 'admin', '2017-03-29 18:16:55', '0');
INSERT INTO `t_log` VALUES ('279', 'admin', '2017-03-29 20:25:41', '1');
INSERT INTO `t_log` VALUES ('280', 'admin', '2017-03-29 20:41:13', '0');
INSERT INTO `t_log` VALUES ('281', 'admin', '2017-03-29 20:41:59', '1');
INSERT INTO `t_log` VALUES ('282', 'admin', '2017-03-29 20:42:58', '0');
INSERT INTO `t_log` VALUES ('283', 'admin', '2017-03-30 21:16:11', '1');
INSERT INTO `t_log` VALUES ('284', 'admin', '2017-03-30 23:24:33', '0');
INSERT INTO `t_log` VALUES ('285', 'tjcu', '2017-03-30 23:25:28', '1');
INSERT INTO `t_log` VALUES ('286', 'a', '2017-04-01 21:12:55', '1');
INSERT INTO `t_log` VALUES ('287', 'tjcu', '2017-04-01 21:20:38', '1');
INSERT INTO `t_log` VALUES ('288', 'admin', '2017-04-01 21:24:40', '1');
INSERT INTO `t_log` VALUES ('289', 'admin', '2017-04-01 21:30:27', '1');
INSERT INTO `t_log` VALUES ('290', 'admin', '2017-04-01 21:33:16', '1');
INSERT INTO `t_log` VALUES ('291', 'super', '2017-04-01 22:08:15', '1');
INSERT INTO `t_log` VALUES ('292', 'admin', '2017-04-01 22:27:47', '1');
INSERT INTO `t_log` VALUES ('293', 'a', '2017-04-01 22:52:21', '1');
INSERT INTO `t_log` VALUES ('294', 'a', '2017-04-01 23:07:09', '0');
INSERT INTO `t_log` VALUES ('295', 'super', '2017-04-02 10:59:04', '1');
INSERT INTO `t_log` VALUES ('296', 'super', '2017-04-02 11:18:51', '0');
INSERT INTO `t_log` VALUES ('297', 'a', '2017-04-02 16:36:43', '1');
INSERT INTO `t_log` VALUES ('298', 'a', '2017-04-02 16:44:59', '0');
INSERT INTO `t_log` VALUES ('299', 'admin', '2017-04-02 16:45:42', '1');
INSERT INTO `t_log` VALUES ('300', 'admin', '2017-04-02 16:50:00', '1');
INSERT INTO `t_log` VALUES ('301', 'admin', '2017-04-02 18:07:07', '0');
INSERT INTO `t_log` VALUES ('302', 'admin', '2017-04-02 18:07:52', '1');
INSERT INTO `t_log` VALUES ('303', 'a', '2017-04-02 18:15:01', '1');
INSERT INTO `t_log` VALUES ('304', 'super', '2017-04-02 18:54:02', '1');
INSERT INTO `t_log` VALUES ('305', 'a', '2017-04-02 19:17:53', '1');
INSERT INTO `t_log` VALUES ('306', 'admin', '2017-04-02 19:50:52', '1');
INSERT INTO `t_log` VALUES ('307', 'admin', '2017-04-02 20:24:47', '0');
INSERT INTO `t_log` VALUES ('308', 'admin', '2017-04-02 20:24:47', '0');
INSERT INTO `t_log` VALUES ('309', 'super', '2017-04-02 20:26:02', '1');
INSERT INTO `t_log` VALUES ('310', 'admin', '2017-04-02 20:36:12', '1');
INSERT INTO `t_log` VALUES ('311', 'admin', '2017-04-02 20:41:52', '0');
INSERT INTO `t_log` VALUES ('312', 'a', '2017-04-02 22:06:57', '1');
INSERT INTO `t_log` VALUES ('313', 'admin', '2017-04-02 22:32:50', '1');
INSERT INTO `t_log` VALUES ('314', 'admin', '2017-04-02 22:50:38', '1');
INSERT INTO `t_log` VALUES ('315', 'admin', '2017-04-03 00:00:25', '1');
INSERT INTO `t_log` VALUES ('316', 'admin', '2017-04-03 00:27:09', '0');
INSERT INTO `t_log` VALUES ('317', 'admin', '2017-04-03 09:42:10', '1');
INSERT INTO `t_log` VALUES ('318', 'admin', '2017-04-03 10:01:48', '1');
INSERT INTO `t_log` VALUES ('319', 'a', '2017-04-03 11:49:55', '1');
INSERT INTO `t_log` VALUES ('320', 'a', '2017-04-03 11:52:30', '1');
INSERT INTO `t_log` VALUES ('321', 'a', '2017-04-03 11:52:35', '0');
INSERT INTO `t_log` VALUES ('322', 'a', '2017-04-03 15:14:07', '1');
INSERT INTO `t_log` VALUES ('323', 'super', '2017-04-03 16:43:37', '1');
INSERT INTO `t_log` VALUES ('324', 'super', '2017-04-03 16:44:09', '0');
INSERT INTO `t_log` VALUES ('325', 'admin', '2017-04-03 23:31:31', '1');
INSERT INTO `t_log` VALUES ('326', 'admin', '2017-04-03 23:53:51', '0');
INSERT INTO `t_log` VALUES ('327', 'a', '2017-04-04 10:03:00', '1');
INSERT INTO `t_log` VALUES ('328', 'a', '2017-04-04 10:14:53', '0');
INSERT INTO `t_log` VALUES ('329', 'admin', '2017-04-04 10:16:56', '1');
INSERT INTO `t_log` VALUES ('330', 'admin', '2017-04-04 12:12:58', '0');
INSERT INTO `t_log` VALUES ('331', 'admin', '2017-04-04 13:20:39', '1');
INSERT INTO `t_log` VALUES ('332', 'admin', '2017-04-04 13:31:46', '0');
INSERT INTO `t_log` VALUES ('333', 'admin', '2017-04-04 14:03:08', '1');
INSERT INTO `t_log` VALUES ('334', 'admin', '2017-04-04 14:03:52', '0');
INSERT INTO `t_log` VALUES ('335', 'admin', '2017-04-04 18:43:58', '1');
INSERT INTO `t_log` VALUES ('336', 'admin', '2017-04-04 18:49:26', '0');
INSERT INTO `t_log` VALUES ('337', 'admin', '2017-04-05 21:36:49', '1');
INSERT INTO `t_log` VALUES ('338', 'admin', '2017-04-05 21:37:11', '0');
INSERT INTO `t_log` VALUES ('339', 'admin', '2017-04-17 21:35:20', '1');
INSERT INTO `t_log` VALUES ('340', 'admin', '2017-04-17 22:35:15', '1');
INSERT INTO `t_log` VALUES ('341', 'admin', '2017-04-17 22:50:39', '1');
INSERT INTO `t_log` VALUES ('342', 'admin', '2017-04-17 22:50:58', '0');
INSERT INTO `t_log` VALUES ('343', 'tjcu', '2017-04-17 22:51:12', '1');
INSERT INTO `t_log` VALUES ('344', 'tjcu', '2017-04-17 22:55:15', '0');
INSERT INTO `t_log` VALUES ('345', 'super', '2017-04-17 22:55:26', '1');
INSERT INTO `t_log` VALUES ('346', 'a', '2017-04-17 23:02:04', '1');
INSERT INTO `t_log` VALUES ('347', 'super', '2017-04-18 21:24:44', '1');
INSERT INTO `t_log` VALUES ('348', 'super', '2017-04-18 21:52:43', '0');
INSERT INTO `t_log` VALUES ('349', 'admin', '2017-04-18 21:57:00', '1');
INSERT INTO `t_log` VALUES ('350', 'admin', '2017-04-18 21:57:02', '0');
INSERT INTO `t_log` VALUES ('351', 'admin', '2017-04-18 21:57:29', '1');
INSERT INTO `t_log` VALUES ('352', 'admin', '2017-04-18 21:57:31', '0');
INSERT INTO `t_log` VALUES ('353', 'admin', '2017-04-18 22:37:19', '1');
INSERT INTO `t_log` VALUES ('354', 'admin', '2017-04-18 22:37:26', '0');
INSERT INTO `t_log` VALUES ('355', 'a', '2017-04-18 23:03:03', '1');
INSERT INTO `t_log` VALUES ('356', 'a', '2017-04-18 23:03:32', '0');
INSERT INTO `t_log` VALUES ('357', 'admin', '2017-04-19 13:15:18', '1');
INSERT INTO `t_log` VALUES ('358', 'a', '2017-04-19 14:56:57', '1');
INSERT INTO `t_log` VALUES ('359', 'a', '2017-04-19 14:57:28', '0');
INSERT INTO `t_log` VALUES ('360', 'admin', '2017-04-19 15:22:21', '1');
INSERT INTO `t_log` VALUES ('361', 'admin', '2017-04-19 15:33:10', '0');
INSERT INTO `t_log` VALUES ('362', 'admin', '2017-04-26 22:27:03', '1');
INSERT INTO `t_log` VALUES ('363', 'admin', '2017-04-26 22:44:02', '0');
INSERT INTO `t_log` VALUES ('364', 'admin', '2017-04-27 23:20:01', '1');
INSERT INTO `t_log` VALUES ('365', 'admin', '2017-04-27 23:20:35', '0');
INSERT INTO `t_log` VALUES ('366', 'admin', '2017-04-29 10:28:58', '1');
INSERT INTO `t_log` VALUES ('367', 'admin', '2017-04-29 12:31:50', '0');
INSERT INTO `t_log` VALUES ('368', 'super', '2017-04-30 23:21:16', '1');
INSERT INTO `t_log` VALUES ('369', 'admin', '2017-05-01 00:03:52', '1');
INSERT INTO `t_log` VALUES ('370', 'super', '2017-05-01 00:06:02', '1');
INSERT INTO `t_log` VALUES ('371', 'admin', '2017-05-01 00:09:04', '1');
INSERT INTO `t_log` VALUES ('372', 'super', '2017-05-01 17:37:55', '1');
INSERT INTO `t_log` VALUES ('373', 'super', '2017-05-01 17:38:47', '0');
INSERT INTO `t_log` VALUES ('374', 'admin', '2017-05-02 20:54:05', '1');
INSERT INTO `t_log` VALUES ('375', 'tjcu', '2017-05-02 21:11:49', '1');
INSERT INTO `t_log` VALUES ('376', 'admin', '2017-05-03 14:34:20', '1');
INSERT INTO `t_log` VALUES ('377', 'admin', '2017-05-03 14:34:32', '0');
INSERT INTO `t_log` VALUES ('378', 'admin', '2017-05-03 14:50:31', '1');
INSERT INTO `t_log` VALUES ('379', 'admin', '2017-05-03 20:27:28', '1');
INSERT INTO `t_log` VALUES ('380', 'super', '2017-05-03 20:32:39', '1');
INSERT INTO `t_log` VALUES ('381', 'admin', '2017-05-03 22:59:16', '1');
INSERT INTO `t_log` VALUES ('382', 'super', '2017-05-04 20:58:11', '1');
INSERT INTO `t_log` VALUES ('383', 'tjcu', '2017-05-04 22:42:34', '1');
INSERT INTO `t_log` VALUES ('384', 'admin', '2017-05-04 22:47:34', '1');
INSERT INTO `t_log` VALUES ('385', 'admin', '2017-05-04 23:05:25', '1');
INSERT INTO `t_log` VALUES ('386', 'admin', '2017-05-04 23:10:23', '1');
INSERT INTO `t_log` VALUES ('387', 'admin', '2017-05-04 23:46:37', '0');
INSERT INTO `t_log` VALUES ('388', 'admin', '2017-05-05 23:37:03', '1');
INSERT INTO `t_log` VALUES ('389', 'admin', '2017-05-05 23:39:51', '1');
INSERT INTO `t_log` VALUES ('390', 'admin', '2017-05-05 23:45:03', '1');
INSERT INTO `t_log` VALUES ('391', 'admin', '2017-05-06 11:27:56', '1');
INSERT INTO `t_log` VALUES ('392', 'admin', '2017-05-06 11:37:43', '1');
INSERT INTO `t_log` VALUES ('393', 'admin', '2017-05-06 11:41:39', '1');
INSERT INTO `t_log` VALUES ('394', 'admin', '2017-05-06 11:44:49', '1');
INSERT INTO `t_log` VALUES ('395', 'admin', '2017-05-06 12:28:32', '1');
INSERT INTO `t_log` VALUES ('396', 'admin', '2017-05-06 12:30:16', '1');
INSERT INTO `t_log` VALUES ('397', 'admin', '2017-05-06 12:35:42', '1');
INSERT INTO `t_log` VALUES ('398', 'admin', '2017-05-06 12:49:36', '0');
INSERT INTO `t_log` VALUES ('399', 'admin', '2017-05-06 12:50:13', '1');
INSERT INTO `t_log` VALUES ('400', 'admin', '2017-05-06 14:19:29', '1');
INSERT INTO `t_log` VALUES ('401', 'admin', '2017-05-06 14:58:55', '1');
INSERT INTO `t_log` VALUES ('402', 'admin', '2017-05-06 15:03:53', '1');
INSERT INTO `t_log` VALUES ('403', 'admin', '2017-05-06 15:07:15', '1');
INSERT INTO `t_log` VALUES ('404', 'admin', '2017-05-06 15:16:08', '0');
INSERT INTO `t_log` VALUES ('405', 'admin', '2017-05-06 15:17:00', '1');
INSERT INTO `t_log` VALUES ('406', 'admin', '2017-05-06 15:19:49', '1');
INSERT INTO `t_log` VALUES ('407', 'admin', '2017-05-06 15:22:39', '0');
INSERT INTO `t_log` VALUES ('408', 'admin', '2017-05-06 15:28:43', '1');
INSERT INTO `t_log` VALUES ('409', 'admin', '2017-05-06 15:30:06', '0');
INSERT INTO `t_log` VALUES ('410', 'admin', '2017-05-06 20:17:39', '1');
INSERT INTO `t_log` VALUES ('411', 'admin', '2017-05-06 20:22:14', '1');
INSERT INTO `t_log` VALUES ('412', 'admin', '2017-05-06 20:26:43', '1');
INSERT INTO `t_log` VALUES ('413', 'admin', '2017-05-06 20:31:41', '1');
INSERT INTO `t_log` VALUES ('414', 'admin', '2017-05-06 20:33:19', '1');
INSERT INTO `t_log` VALUES ('415', 'admin', '2017-05-06 20:49:25', '1');
INSERT INTO `t_log` VALUES ('416', 'admin', '2017-05-06 20:57:07', '1');
INSERT INTO `t_log` VALUES ('417', 'admin', '2017-05-06 21:33:07', '1');
INSERT INTO `t_log` VALUES ('418', 'admin', '2017-05-06 21:35:20', '1');
INSERT INTO `t_log` VALUES ('419', 'admin', '2017-05-06 21:38:35', '1');
INSERT INTO `t_log` VALUES ('420', 'admin', '2017-05-07 00:30:07', '1');
INSERT INTO `t_log` VALUES ('421', 'admin', '2017-05-07 00:39:41', '0');
INSERT INTO `t_log` VALUES ('422', 'admin', '2017-05-07 12:06:21', '1');
INSERT INTO `t_log` VALUES ('423', 'admin', '2017-05-07 14:11:28', '1');
INSERT INTO `t_log` VALUES ('424', 'admin', '2017-05-07 15:05:18', '0');
INSERT INTO `t_log` VALUES ('425', 'admin', '2017-05-07 22:30:13', '1');
INSERT INTO `t_log` VALUES ('426', 'admin', '2017-05-08 21:20:12', '1');
INSERT INTO `t_log` VALUES ('427', 'admin', '2017-05-08 21:48:46', '1');
INSERT INTO `t_log` VALUES ('428', 'admin', '2017-05-08 21:51:10', '1');
INSERT INTO `t_log` VALUES ('429', 'admin', '2017-05-08 21:52:35', '0');
INSERT INTO `t_log` VALUES ('430', 'admin', '2017-05-08 21:53:09', '1');
INSERT INTO `t_log` VALUES ('431', 'admin', '2017-05-08 22:19:23', '1');
INSERT INTO `t_log` VALUES ('432', 'admin', '2017-05-08 22:29:14', '0');
INSERT INTO `t_log` VALUES ('433', 'admin', '2017-05-08 22:36:11', '1');
INSERT INTO `t_log` VALUES ('434', 'admin', '2017-05-08 22:36:42', '1');
INSERT INTO `t_log` VALUES ('435', 'admin', '2017-05-08 22:39:45', '1');
INSERT INTO `t_log` VALUES ('436', 'admin', '2017-05-08 22:40:02', '0');
INSERT INTO `t_log` VALUES ('437', 'admin', '2017-05-09 20:51:19', '1');
INSERT INTO `t_log` VALUES ('438', 'admin', '2017-05-09 20:53:12', '1');
INSERT INTO `t_log` VALUES ('439', 'admin', '2017-05-10 13:23:32', '1');
INSERT INTO `t_log` VALUES ('440', 'admin', '2017-05-10 13:26:40', '1');
INSERT INTO `t_log` VALUES ('441', 'admin', '2017-05-10 13:27:42', '1');
INSERT INTO `t_log` VALUES ('442', 'admin', '2017-05-10 13:30:26', '0');
INSERT INTO `t_log` VALUES ('443', 'admin', '2017-05-10 13:30:50', '1');
INSERT INTO `t_log` VALUES ('444', 'admin', '2017-05-10 13:36:07', '0');
INSERT INTO `t_log` VALUES ('445', 'super', '2017-05-10 14:55:44', '1');
INSERT INTO `t_log` VALUES ('446', 'super', '2017-05-10 14:56:55', '0');
INSERT INTO `t_log` VALUES ('447', 'admin', '2017-05-10 15:26:33', '1');
INSERT INTO `t_log` VALUES ('448', 'super', '2017-05-14 15:48:13', '1');
INSERT INTO `t_log` VALUES ('449', 'admin', '2017-05-14 18:16:08', '1');
INSERT INTO `t_log` VALUES ('450', 'super', '2017-05-14 23:42:37', '1');
INSERT INTO `t_log` VALUES ('451', 'admin', '2017-05-15 00:01:05', '1');
INSERT INTO `t_log` VALUES ('452', 'admin', '2017-05-15 00:08:33', '0');
INSERT INTO `t_log` VALUES ('453', 'admin', '2017-05-24 22:25:37', '1');
INSERT INTO `t_log` VALUES ('454', 'admin', '2017-05-25 19:33:17', '1');
INSERT INTO `t_log` VALUES ('455', 'super', '2017-05-26 22:02:28', '1');
INSERT INTO `t_log` VALUES ('456', 'admin', '2017-06-01 00:06:54', '1');
INSERT INTO `t_log` VALUES ('457', 'admin', '2017-06-01 00:22:11', '0');

-- ----------------------------
-- Table structure for t_materialreturn
-- ----------------------------
DROP TABLE IF EXISTS `t_materialreturn`;
CREATE TABLE `t_materialreturn` (
  `INID` int(20) NOT NULL auto_increment,
  `PRID` varchar(60) NOT NULL,
  `PRNAME` varchar(60) NOT NULL,
  `PRKIND` varchar(60) default NULL,
  `MATERIAL` varchar(60) default NULL,
  `SPECIFICATION` varchar(60) default NULL,
  `PRQUANTITY` int(20) NOT NULL,
  `PRDATE` datetime NOT NULL,
  `CHECHER` varchar(60) NOT NULL,
  `WAREHOUSE` varchar(60) NOT NULL,
  `REMARKS` varchar(100) default NULL,
  PRIMARY KEY  (`INID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_materialreturn
-- ----------------------------
INSERT INTO `t_materialreturn` VALUES ('1', 'asd-34', '轮毂', '轮毂', '铝钢', '36*45*89cm', '45', '2017-03-15 17:12:01', '周峰', '888号仓', '轮毂');
INSERT INTO `t_materialreturn` VALUES ('3', '啊哦', '二', '儿童', '儿童', '而我', '234', '2017-03-01 00:00:00', '为', '7号仓库', '同意');
INSERT INTO `t_materialreturn` VALUES ('4', 'we', 'we', 'we', 'we', 'we', '23', '2017-03-14 00:00:00', 'we', '2号仓库', 'we');
INSERT INTO `t_materialreturn` VALUES ('6', 'www', 'we', '儿童', '是的噶', '色图', '7683467', '2017-03-23 00:00:00', '3446', '6号仓库', '阿萨人员');
INSERT INTO `t_materialreturn` VALUES ('7', 'sfd232', '二', '儿童', 'qq', 'we', '7683467', '2017-03-23 00:00:00', 'qq', '3号仓库', '人头');
INSERT INTO `t_materialreturn` VALUES ('8', '啊哦', 'safag', 'we', 'q', 'q', '7683467', '2017-03-23 00:00:00', 'dfshs', '3号仓库', '送人头');
INSERT INTO `t_materialreturn` VALUES ('9', 'qq', '二', 'qq', '儿童', 'qq', '7683467', '2017-03-23 00:00:00', '为', '3号仓库', 'SDRAM');
INSERT INTO `t_materialreturn` VALUES ('10', 'sfd232', 'we', 'sadg', 'qq', '而我', '7683467', '2017-04-01 00:00:00', '为', '3号仓库', '而已');
INSERT INTO `t_materialreturn` VALUES ('11', '啊哦', 'we', '儿童', 'we', 'q', '7683467', '2017-04-01 00:00:00', 'dfshs', '3号仓库', '人的声音');
INSERT INTO `t_materialreturn` VALUES ('12', 'www', 'safag', 'qq', 'we', 'qq', '7683467', '2017-04-01 00:00:00', 'qq', '3号仓库', 'terse');
INSERT INTO `t_materialreturn` VALUES ('13', 'qq', '二', 'qq', 'q', '而我', '5346', '2017-04-20 00:00:00', '为', '7号仓库', '廻');
INSERT INTO `t_materialreturn` VALUES ('14', 'sfd232', 'safag', '儿童', 'qq', 'we', '52445', '2017-04-20 00:00:00', 'dfshs', '7号仓库', '啊问题');
INSERT INTO `t_materialreturn` VALUES ('15', 'RJH-67', '涡轮', '涡轮', '钢铁', '0.23T', '52445', '2017-04-12 00:00:00', '刘庭羽', '7号仓库', '地方衡阳市');
INSERT INTO `t_materialreturn` VALUES ('16', 'RJH-67', '涡轮', '涡轮', '钢铁', 'q', '52445', '2017-03-26 00:00:00', '刘庭羽', '3号仓库', '');
INSERT INTO `t_materialreturn` VALUES ('17', 'sfd232', '二', 'sadg', '儿童', 'qq', '52445', '2017-03-14 00:00:00', 'qq', '3号仓库', '');
INSERT INTO `t_materialreturn` VALUES ('18', 'ccc', 'ccc', 'ccc', 'ccc', 'ccc', '8000', '2017-04-05 00:00:00', '刘庭羽', '2号仓库', '9000');
INSERT INTO `t_materialreturn` VALUES ('19', 'vv', 'vv', 'vv', 'vv', 'vv', '1000', '2017-05-03 00:00:00', 'vv', '5号仓库', 'vv');
INSERT INTO `t_materialreturn` VALUES ('20', 'vv', 'vv', 'vv', 'vv', 'vv', '1000', '2017-05-11 00:00:00', 'rt', '5号仓库', '2000');
INSERT INTO `t_materialreturn` VALUES ('21', 'kk', 'kk', 'kk', 'kk', 'kk', '3000', '2017-05-03 00:00:00', 'kk', '5号仓库', '3000');

-- ----------------------------
-- Table structure for t_moneycheck
-- ----------------------------
DROP TABLE IF EXISTS `t_moneycheck`;
CREATE TABLE `t_moneycheck` (
  `mcid` int(10) NOT NULL auto_increment,
  `mctime` datetime default NULL,
  `mcname` varchar(30) NOT NULL,
  `mcproduct` varchar(30) NOT NULL,
  `mcshould` double(30,3) default '0.000',
  `mcalready` double(30,3) default '0.000',
  `mcdebt` double(30,3) default '0.000',
  PRIMARY KEY  (`mcid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_moneycheck
-- ----------------------------
INSERT INTO `t_moneycheck` VALUES ('1', '1865-01-25 00:00:00', '江南制造总局', '德国老毛瑟单响后膛步枪', '150000.000', '100000.000', '50000.000');
INSERT INTO `t_moneycheck` VALUES ('2', '1865-08-30 00:00:00', '江南制造总局', '美国温者士连珠后膛马枪', '230000.000', '230000.000', '0.000');
INSERT INTO `t_moneycheck` VALUES ('14', '2017-03-12 00:00:00', '福州船政局', '075D战舰主甲板', '1300000.000', '1200000.000', '100000.000');
INSERT INTO `t_moneycheck` VALUES ('15', '2017-03-30 00:00:00', '安庆内军械所', '仿真警棍', '15200.000', '15200.000', '0.000');
INSERT INTO `t_moneycheck` VALUES ('16', '2017-02-27 00:00:00', '轮船招商局', '通风管道', '120000.000', '0.000', '120000.000');
INSERT INTO `t_moneycheck` VALUES ('17', '2017-02-15 00:00:00', '开平矿务局', 'WY-47G掘进机钻头', '69800.000', '30000.000', '39800.000');
INSERT INTO `t_moneycheck` VALUES ('18', '2017-03-07 00:00:00', '海军衙门', '舰炮弹药存储箱', '95980.000', '70000.000', '25980.000');
INSERT INTO `t_moneycheck` VALUES ('19', '2017-03-16 00:00:00', '江南制造总局', '舰炮弹药存储箱', '10000000.000', '100000.000', '9900000.000');
INSERT INTO `t_moneycheck` VALUES ('20', '2017-03-21 00:00:00', '江南制造总局', '德国老毛瑟单响后膛步枪', '65786.000', '20000.000', '45786.000');
INSERT INTO `t_moneycheck` VALUES ('21', '2017-03-21 00:00:00', '海军衙门', '德国老毛瑟单响后膛步枪', '48641687.000', '526589.000', '48115098.000');
INSERT INTO `t_moneycheck` VALUES ('22', '2017-03-16 00:00:00', '海军衙门', '舰炮弹药存储箱', '48641687.000', '100000.000', '48541687.000');
INSERT INTO `t_moneycheck` VALUES ('23', '2017-03-14 00:00:00', '江南制造总局', '舰炮弹药存储箱', '95980.000', '10000.000', '85980.000');
INSERT INTO `t_moneycheck` VALUES ('24', '2017-03-18 00:00:00', '江南制造总局', '舰炮弹药存储箱', '150000.000', '100000.000', '50000.000');
INSERT INTO `t_moneycheck` VALUES ('25', '2017-04-08 00:00:00', '海军衙门', '舰炮弹药存储箱', '48641687.000', '100000.000', '48541687.000');
INSERT INTO `t_moneycheck` VALUES ('26', '2017-04-29 00:00:00', '时代光华', '十多个', '10000000.000', '100000.000', '9900000.000');

-- ----------------------------
-- Table structure for t_outstock
-- ----------------------------
DROP TABLE IF EXISTS `t_outstock`;
CREATE TABLE `t_outstock` (
  `outstockid` int(11) NOT NULL auto_increment,
  `goodid` int(11) default NULL,
  `saleprice` double default NULL,
  `outstockdate` date default NULL,
  `outstocknumber` int(11) default NULL,
  `outstocknote` char(30) default NULL,
  `quarter` char(20) default NULL,
  PRIMARY KEY  (`outstockid`),
  KEY `FHK_t_outstock` (`goodid`),
  CONSTRAINT `FHK_t_outstock` FOREIGN KEY (`goodid`) REFERENCES `t_good` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_outstock
-- ----------------------------

-- ----------------------------
-- Table structure for t_profitscount
-- ----------------------------
DROP TABLE IF EXISTS `t_profitscount`;
CREATE TABLE `t_profitscount` (
  `PRID` int(10) NOT NULL auto_increment,
  `PRMONTH` datetime NOT NULL,
  `PRSALES` double(30,2) default '0.00',
  `PRBUYSPEND` double(30,2) default '0.00',
  `PRREFUNDTOBUYER` double(30,2) default '0.00',
  `PRSUPPLIERREFUND` double(30,2) default '0.00',
  `PRPROFITS` double(30,2) default '0.00',
  `PRREMARKS` varchar(100) default NULL,
  PRIMARY KEY  (`PRID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_profitscount
-- ----------------------------
INSERT INTO `t_profitscount` VALUES ('1', '2017-03-01 00:00:00', '150000.00', '80000.00', '20000.00', '15000.00', '65000.00', '利润同比增长百分比6%，有待提高。');
INSERT INTO `t_profitscount` VALUES ('17', '2017-03-15 00:00:00', '150000.00', '80000.00', '20000.00', '15000.00', '65000.00', '17-40');
INSERT INTO `t_profitscount` VALUES ('18', '2017-03-15 00:00:00', '123000.00', '100152.00', '0.00', '0.00', '22848.00', '17-39');
INSERT INTO `t_profitscount` VALUES ('19', '2017-04-05 00:00:00', '145623.00', '120035.00', '1000.00', '2300.00', '26888.00', '17-43');
INSERT INTO `t_profitscount` VALUES ('20', '2017-02-27 00:00:00', '564800.00', '403225.00', '26000.00', '0.00', '135575.00', '无');
INSERT INTO `t_profitscount` VALUES ('21', '2017-03-13 00:00:00', '101000.00', '95620.00', '50000.00', '30000.00', '-14620.00', '有亏损');
INSERT INTO `t_profitscount` VALUES ('22', '2017-03-20 00:00:00', '26000.00', '56200.00', '0.00', '0.00', '-30200.00', '无');
INSERT INTO `t_profitscount` VALUES ('23', '2017-03-05 00:00:00', '50000.00', '95620.00', '50000.00', '30000.00', '-65620.00', '无');
INSERT INTO `t_profitscount` VALUES ('24', '2017-03-05 00:00:00', '50000.00', '100152.00', '1000.00', '15000.00', '-36152.00', '无');
INSERT INTO `t_profitscount` VALUES ('25', '2017-03-05 00:00:00', '50000.00', '0.00', '0.00', '15000.00', '65000.00', '65000');
INSERT INTO `t_profitscount` VALUES ('26', '2017-03-05 00:00:00', '50000.00', '100152.00', '1000.00', '0.00', '-51152.00', '04/01');
INSERT INTO `t_profitscount` VALUES ('27', '2017-03-05 00:00:00', '456765.00', '2543.00', '50000.00', '0.00', '404222.00', '核对两次');
INSERT INTO `t_profitscount` VALUES ('28', '2017-03-05 00:00:00', '0.00', '0.00', '50000.00', '0.00', '-50000.00', '亏损较大');
INSERT INTO `t_profitscount` VALUES ('29', '2017-03-05 00:00:00', '150000.00', '0.00', '0.00', '0.00', '150000.00', '无');
INSERT INTO `t_profitscount` VALUES ('30', '2017-03-05 00:00:00', '101000.00', '95620.00', '0.00', '15000.00', '20380.00', '暂无');

-- ----------------------------
-- Table structure for t_putinstorage
-- ----------------------------
DROP TABLE IF EXISTS `t_putinstorage`;
CREATE TABLE `t_putinstorage` (
  `INID` int(10) NOT NULL auto_increment,
  `PRID` varchar(50) NOT NULL,
  `PRNAME` varchar(50) NOT NULL,
  `PRKIND` varchar(50) default NULL,
  `MATERIAL` varchar(50) default NULL,
  `SPECIFICATION` varchar(50) default NULL,
  `PRCOST` double(20,2) default NULL,
  `PRQUANTITY` int(20) NOT NULL,
  `MANUFACTURER` varchar(50) default NULL,
  `PRDATE` datetime NOT NULL,
  `CHECHER` varchar(50) NOT NULL,
  `WAREHOUSE` varchar(50) NOT NULL,
  `REMARKS` varchar(50) default NULL,
  PRIMARY KEY  (`INID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_putinstorage
-- ----------------------------
INSERT INTO `t_putinstorage` VALUES ('1', 'AS-08S', '76-3G型搅拌机叶片', '搅拌机', '镍钢', '200*120*560CM/7.85KG', '160.00', '215', '三条石金属铸造厂', '2017-03-12 00:00:00', '李峰', '5号仓库', '无');
INSERT INTO `t_putinstorage` VALUES ('2', 'DUW678', 'GHT-45型起重机吊钩', '起重机', '高强度钨钢', '68KG', '2350.00', '12', '三条石金属铸造厂', '2017-03-12 00:00:00', '周福', '5号仓库', '吊钩');
INSERT INTO `t_putinstorage` VALUES ('27', '77', 'dh', 'dh', 'h', 'df', '600.00', '777', '三条石金属铸造厂', '2017-04-13 00:00:00', 'hd', '4号仓库', '777新增加到库存');
INSERT INTO `t_putinstorage` VALUES ('28', 'dujh', '铜瓦', '铜瓦', '铜铁合金', '23*52*45', '578.00', '161', '三条石金属铸造厂', '2017-03-14 00:00:00', '43656', '5号仓库', '');
INSERT INTO `t_putinstorage` VALUES ('36', '是地方与华盛顿', '水管', '水管', '铁', '0.85mm', '1000.00', '1000', '三条石金属铸造厂', '2017-04-13 00:00:00', '43656', '4号仓库', '库存表应为400');
INSERT INTO `t_putinstorage` VALUES ('39', 'test', 'test', 'test', 'test', 'test', '3000.00', '666', '三条石金属铸造厂', '2017-04-13 00:00:00', '黎明', '1号仓库', 'test新增到库存记录中');
INSERT INTO `t_putinstorage` VALUES ('42', 'test', 'test2', 'test2', 'test2', 'test2', '5600.00', '1000', '三条石金属铸造厂', '2017-04-01 00:00:00', '43656', '9号仓库', 'test，应该改变库存表，不该新增');
INSERT INTO `t_putinstorage` VALUES ('43', 'DD-56', '56型下水管', '水管', 'PVC', '16cm', '200.00', '888', '三条石金属铸造厂', '2017-04-02 00:00:00', '黎明', '7号仓库', '新增加DD-56');
INSERT INTO `t_putinstorage` VALUES ('44', 'DD-56', '56型下水管', '水管', 'PVC2', '16cm2', '200.00', '112', '三条石金属铸造厂', '2017-04-13 00:00:00', '黎明', '5号仓库', '生产修改+1，库存应为3000');
INSERT INTO `t_putinstorage` VALUES ('46', '007', '007', '007', '007', '007', '7.00', '70', '三条石金属铸造厂', '2017-04-02 00:00:00', '007', '2号仓库', '007');
INSERT INTO `t_putinstorage` VALUES ('53', 'aa', 'aa', 'aa', 'aa', 'aa', '2500.00', '200', '三条石金属铸造厂', '2017-04-20 00:00:00', '黎明', '4号仓库', '200');
INSERT INTO `t_putinstorage` VALUES ('54', 'bb', 'bb', 'bb', 'bb', 'bb', '2500.00', '999', '三条石金属铸造厂', '2017-04-20 00:00:00', '黎明', '4号仓库', '999');
INSERT INTO `t_putinstorage` VALUES ('55', '075D', '护卫舰', '战舰', '钢铁合金', '2000T', '260000000.00', '5', '三条石金属铸造厂', '2017-04-03 00:00:00', '海军衙门', '1号仓库', '无');
INSERT INTO `t_putinstorage` VALUES ('56', 'DG784', '784型三角架', '三脚架', '钢', '12*25*45', '265.00', '362', '三条石金属铸造厂', '2017-03-29 00:00:00', '大锤', '2号仓库', '三脚架');
INSERT INTO `t_putinstorage` VALUES ('57', 'panpan', '盼盼法式小面包', '面包', '淀粉', '300g', '9.00', '200', '三条石金属铸造厂', '2017-04-17 00:00:00', '大锤', '2号仓库', '面包新鲜出炉啦');
INSERT INTO `t_putinstorage` VALUES ('58', 'panpan', '盼盼法式小面包', '面包', '淀粉', '300g', '10.00', '500', '三条石金属铸造厂', '2017-04-11 00:00:00', '大锤', '9号仓库', '200，加上五百');
INSERT INTO `t_putinstorage` VALUES ('59', 'dddddddd', 'fcjcgyidry', 'vgjcfhyzdr', 'vgjchj', 'sefsz', '100.00', '200', '三条石金属铸造厂', '2017-05-04 00:00:00', '大锤', '4号仓库', 'fgvjc');

-- ----------------------------
-- Table structure for t_saleout
-- ----------------------------
DROP TABLE IF EXISTS `t_saleout`;
CREATE TABLE `t_saleout` (
  `INID` int(10) NOT NULL auto_increment,
  `PRID` varchar(60) NOT NULL,
  `PRNAME` varchar(60) NOT NULL,
  `PRKIND` varchar(60) default NULL,
  `MATERIAL` varchar(60) default NULL,
  `SPECIFICATION` varchar(60) default NULL,
  `ORIGINALPRICE` double(20,2) NOT NULL,
  `PRPRICE` double(20,2) NOT NULL,
  `PRQUANTITY` int(20) NOT NULL,
  `PRCOST` double(20,2) default NULL,
  `PRPROFITS` double(20,2) default NULL,
  `MANUFACTURER` varchar(60) default NULL,
  `PRDATE` datetime NOT NULL,
  `CHECHER` varchar(60) NOT NULL,
  `WAREHOUSE` varchar(60) NOT NULL,
  `REMARKS` varchar(60) NOT NULL,
  PRIMARY KEY  (`INID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_saleout
-- ----------------------------
INSERT INTO `t_saleout` VALUES ('1', 'are344', '涡轮', '涡轮', '钢铁合金', '68KG', '3000.00', '5000.00', '100', '500000.00', '200000.00', '三条石金属铸造厂', '2017-03-17 09:44:01', '张辽', '8号仓库', '涡轮');
INSERT INTO `t_saleout` VALUES ('4', 'ww', 'ww', 'ww', 'ww', 'ww', '200.00', '325.00', '10000', '3250000.00', '1250000.00', '江南制造总局', '2017-03-13 00:00:00', 'ww', '5号仓库', 'www');
INSERT INTO `t_saleout` VALUES ('5', '78-DHGFDY', '通风管道', '管道', '铁', '0.854mm', '23500.00', '3465.00', '768', '34654635.00', '765465.00', '俊峰铸造厂', '2017-03-07 00:00:00', '李富贵', '5号仓库', '');
INSERT INTO `t_saleout` VALUES ('6', '78-DHGFDY', '通风管道', '管道', '铁', '0.854mm', '23500.00', '3465.00', '768', '34654635.00', '765465.00', '河东区三原电力有限公司', '2017-03-23 00:00:00', '李富贵', '6号仓库', '');
INSERT INTO `t_saleout` VALUES ('7', 'GKSDH-345', '铜瓦片', '瓦片', '铜', '26KG', '200.00', '325.00', '20000', '6500000.00', '2500000.00', '江南制造总局', '2017-03-13 00:00:00', '张民', '5号仓库', '');
INSERT INTO `t_saleout` VALUES ('8', 'GKSDH-345', '铜瓦片', '管道', '铜', '26KG', '4680.00', '4699.00', '7683467', '34654635.00', '765465.00', '河东区三原电力有限公司', '2017-03-20 00:00:00', '李富贵', '10号仓库', '');
INSERT INTO `t_saleout` VALUES ('9', 'GKSDH-345', '铜瓦片', 'ertysd', '铜', 'dfgj', '4680.00', '4699.00', '7683467', '34654635.00', '765465.00', '河东区三原电力有限公司', '2017-02-26 00:00:00', '张民', '2号仓库', '');
INSERT INTO `t_saleout` VALUES ('10', 'yjtyk', '铜瓦片', 'sjhwr', 'sadg', 'qq', '4680.00', '4699.00', '7683467', '34654635.00', '765465.00', '俊峰铸造厂', '2017-03-10 00:00:00', '李富贵', '2号仓库', '');
INSERT INTO `t_saleout` VALUES ('11', 'GKSDH-345', '通风管道', 'ertysd', '铁', '0.854mm', '4680.00', '4699.00', '7683467', '34654635.00', '765465.00', '河东区三原电力有限公司', '2017-03-15 00:00:00', '张民', '7号仓库', '');
INSERT INTO `t_saleout` VALUES ('12', 'GKSDH-345', '铜瓦片', 'ertysd', '铁', '0.854mm', '4680.00', '4699.00', '7683467', '34654635.00', '765465.00', '俊峰铸造厂', '2017-03-27 00:00:00', 'dfhdyj', '8号仓库', '');
INSERT INTO `t_saleout` VALUES ('13', 'Cgeh', '铜瓦片', 'qq', '铜', '26KG', '4680.00', '4699.00', '7683467', '34654635.00', '765465.00', '河东区三原电力有限公司', '2017-03-25 00:00:00', 'dfhdyj', '7号仓库', '');
INSERT INTO `t_saleout` VALUES ('14', 'yjtyk', 'wey', 'sjhwr', '铜', 'qq', '4680.00', '4699.00', '7683467', '34654635.00', '765465.00', '河东区三原电力有限公司', '2017-03-21 00:00:00', 'dfhdyj', '5号仓库', '');
INSERT INTO `t_saleout` VALUES ('15', 'Cgeh', 'wey', 'ww', 'fj', 'qq', '4680.00', '4699.00', '7683467', '34654635.00', '765465.00', '河东区三原电力有限公司', '2017-03-15 00:00:00', 'dfsh', '7号仓库', '');
INSERT INTO `t_saleout` VALUES ('16', 'Cgeh', '铜瓦片', 'ertysd', '铜', '0.854mm', '4680.00', '4699.00', '7683467', '34654635.00', '765465.00', '河东区三原电力有限公司', '2017-03-24 00:00:00', '李富贵', '10号仓库', '');
INSERT INTO `t_saleout` VALUES ('17', 'qq', '通风管道', '管道', '铁', 'dfgj', '4680.00', '4699.00', '7683467', '34654635.00', '765465.00', '俊峰铸造厂', '2017-03-20 00:00:00', '张民', '7号仓库', '');
INSERT INTO `t_saleout` VALUES ('18', 'yyyyyy', 'yyyyyyyyyy', 'yyyyyyyyyyy', 'yyyyyyyy', 'yyyyyyyyyy', '52111.00', '5000000.00', '100', '500000000.00', '494788900.00', '中铁一局集团有限公司', '2017-05-04 00:00:00', 'rttrtt', '5号仓库', 'uiuytuty');

-- ----------------------------
-- Table structure for t_salesreturn
-- ----------------------------
DROP TABLE IF EXISTS `t_salesreturn`;
CREATE TABLE `t_salesreturn` (
  `INID` int(20) NOT NULL auto_increment,
  `PRID` varchar(60) NOT NULL,
  `PRNAME` varchar(60) NOT NULL,
  `PRKIND` varchar(60) default NULL,
  `MATERIAL` varchar(60) default NULL,
  `SPECIFICATION` varchar(60) default NULL,
  `PRPRICE` double(20,0) default NULL,
  `PRQUANTITY` int(20) NOT NULL,
  `PRCOST` double(20,2) default NULL,
  `CUSTOMER` varchar(60) NOT NULL,
  `PRDATE` datetime NOT NULL,
  `CHECHER` varchar(60) NOT NULL,
  `WAREHOUSE` varchar(60) NOT NULL,
  `REMARKS` varchar(100) default NULL,
  PRIMARY KEY  (`INID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_salesreturn
-- ----------------------------
INSERT INTO `t_salesreturn` VALUES ('1', 'QW-45', '汉阳造', '枪支', '梨木和钢铁', '1.6M,3.7KG', '7800', '2000', '15600000.00', '第四集团军', '2017-03-15 14:49:08', '李团长', '3号仓', '枪支退货');
INSERT INTO `t_salesreturn` VALUES ('4', 'QQQQ', 'HNDF', 'STY', 'ERGY', 'RTHUD', '0', '0', '0.00', '江南制造总局', '2017-03-10 00:00:00', 'SDYT', '2号仓库', 'FDJD');
INSERT INTO `t_salesreturn` VALUES ('5', 'DG-R645', '豆腐羹', '湿地福苑', '豆腐羹', '代挂', '18500', '768', '5787784.00', '俊峰铸造厂', '2017-03-14 00:00:00', '是电饭锅', '5号仓库', '的粉红色');
INSERT INTO `t_salesreturn` VALUES ('6', 'D', '发个', '湿地福苑', '多随意', '发货的', '18500', '768', '5787784.00', '河东区三原电力有限公司', '2017-03-02 00:00:00', '发个', '2号仓库', '风格化是的');
INSERT INTO `t_salesreturn` VALUES ('7', '瓦尔特', '撒旦个', '湿地福苑', '地方', '但是', '18500', '768', '5787784.00', '江南制造总局', '2017-03-31 00:00:00', '撒旦个', '2号仓库', '');
INSERT INTO `t_salesreturn` VALUES ('8', '地方换地图', '的双方各', '电话', '豆腐羹', '第三方', '18500', '768', '5787784.00', '江南制造总局', '2017-03-31 00:00:00', '发个', '2号仓库', '第三方');
INSERT INTO `t_salesreturn` VALUES ('9', '士大夫', '是的发生', '湿地福苑施工的故事哦', '上的故事', '涂鸦', '2345', '76834', '566.00', '江南制造总局', '2017-03-31 00:00:00', '345', '2号仓库', '电话');
INSERT INTO `t_salesreturn` VALUES ('10', '而我又 ', '而与', '福鼎', '的想法和我', '人头', '2345', '76834', '346546.00', '河东区三原电力有限公司', '2017-04-07 00:00:00', '第三个', '9号仓库', '色人员');
INSERT INTO `t_salesreturn` VALUES ('11', '色人员', '任瑟雍', '湿地福苑 ', '豆腐羹 ', '沙丁鱼2 ', '3465', '7683467', '34654635.00', '俊峰铸造厂', '2017-04-10 00:00:00', '士大夫', '3号仓库', '都是废话');
INSERT INTO `t_salesreturn` VALUES ('12', 'DG-R645', '豆腐羹', '湿地福苑施工的故事哦', '地方', '发货的', '3465', '7683467', '34654635.00', '江南制造总局', '2017-04-28 00:00:00', '第三个', '7号仓库', '撒旦个');
INSERT INTO `t_salesreturn` VALUES ('13', '士大夫', '的双方各', '电话', '上的故事', '但是', '3465', '7683467', '34654635.00', '俊峰铸造厂', '2017-04-19 00:00:00', '撒旦个', '10号仓库', '士大夫');
INSERT INTO `t_salesreturn` VALUES ('14', '瓦尔特', '撒旦个', '湿地福苑施工的故事哦', '多随意', '代挂', '3465', '7683467', '34654635.00', '河东区三原电力有限公司', '2017-04-28 00:00:00', '撒旦个', '10号仓库', '是的噶 ');
INSERT INTO `t_salesreturn` VALUES ('15', 'D', '的双方各', '福鼎', '多随意', '发货的', '3465', '7683467', '34654635.00', '江南制造总局', '2017-05-05 00:00:00', '上德若谷', '10号仓库', '十多个杀人');
INSERT INTO `t_salesreturn` VALUES ('16', '士大夫', '的双方各', '湿地福苑', '豆腐羹', '但是', '3465', '7683467', '34654635.00', '俊峰铸造厂', '2017-05-05 00:00:00', '是电饭锅', '6号仓库', '是东方化工');
INSERT INTO `t_salesreturn` VALUES ('17', 'D', '撒旦个', '湿地福苑施工的故事哦', '地方', '但是', '3465', '7683467', '34654635.00', '江南制造总局', '2017-06-03 00:00:00', '发个', '6号仓库', '儿童');
INSERT INTO `t_salesreturn` VALUES ('18', '士大夫', '豆腐羹', '湿地福苑施工的故事哦', '上的故事', '发货的', '3465', '7683467', '34654635.00', '俊峰铸造厂', '2017-06-06 00:00:00', '第三个', '3号仓库', '地铁');

-- ----------------------------
-- Table structure for t_stock
-- ----------------------------
DROP TABLE IF EXISTS `t_stock`;
CREATE TABLE `t_stock` (
  `stockid` int(11) NOT NULL auto_increment,
  `goodid` int(11) default NULL,
  `goodnumber` int(11) default NULL,
  `stocknote` char(30) default NULL,
  `outstockid` int(11) default NULL,
  `storageid` int(11) default NULL,
  PRIMARY KEY  (`stockid`),
  KEY `FK_t_stock` (`storageid`),
  KEY `F_t_stock` (`outstockid`),
  KEY `FKq_t_stock` (`goodid`),
  CONSTRAINT `FKq_t_stock` FOREIGN KEY (`goodid`) REFERENCES `t_good` (`id`),
  CONSTRAINT `FK_t_stock` FOREIGN KEY (`storageid`) REFERENCES `t_storage` (`id`),
  CONSTRAINT `F_t_stock` FOREIGN KEY (`outstockid`) REFERENCES `t_outstock` (`outstockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_stock
-- ----------------------------
INSERT INTO `t_stock` VALUES ('45', '9', '2', null, null, null);
INSERT INTO `t_stock` VALUES ('46', '10', '3', null, null, null);
INSERT INTO `t_stock` VALUES ('47', '11', '4', null, null, null);

-- ----------------------------
-- Table structure for t_storage
-- ----------------------------
DROP TABLE IF EXISTS `t_storage`;
CREATE TABLE `t_storage` (
  `id` int(11) NOT NULL auto_increment,
  `goodid` int(11) default NULL,
  `inprice` double default NULL,
  `storagedate` date default NULL,
  `storagenumber` int(11) default NULL,
  `storagenote` char(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_t_storage` (`goodid`),
  CONSTRAINT `FK_t_storage` FOREIGN KEY (`goodid`) REFERENCES `t_good` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_storage
-- ----------------------------
INSERT INTO `t_storage` VALUES ('4', null, null, null, null, null);

-- ----------------------------
-- Table structure for t_supplier
-- ----------------------------
DROP TABLE IF EXISTS `t_supplier`;
CREATE TABLE `t_supplier` (
  `id` int(11) NOT NULL auto_increment,
  `number` char(10) default NULL,
  `name` char(20) default NULL,
  `linkman` char(20) default NULL,
  `linkphone` char(20) default NULL,
  `note` char(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_supplier
-- ----------------------------
INSERT INTO `t_supplier` VALUES ('1', 's1', '江南制造总局', '黄斌', '18725032468', '镍、铬、铁。安徽合肥供应商，合作三年');
INSERT INTO `t_supplier` VALUES ('5', 's3', '骏驰铜铝合金有限公司', '郭海涛', '18762012654', '河南南阳供应商，合作一年。');
INSERT INTO `t_supplier` VALUES ('6', 's5', '海泰有色金属有限公司', '周达', '13545623018', '天津西青开发区');
INSERT INTO `t_supplier` VALUES ('7', 's4', '菏泽永利钢铁厂', '郭华', '15620318954', '山东菏泽，供应生铁。');
INSERT INTO `t_supplier` VALUES ('9', 's7', '东风铸造厂', '赵斌', '022-235641', '山东，供应铜套，铜瓦。');
INSERT INTO `t_supplier` VALUES ('10', 's8', '先达有色金属有限公司', '刘生', '0754-2564125', '山西太原，主要供应壳体原材料。');
INSERT INTO `t_supplier` VALUES ('11', 's9', '无锡三泰钢铁有限公司', '郭海涛', '18725032468', '江苏无锡，老合作伙伴。');
INSERT INTO `t_supplier` VALUES ('12', 's18', '达远合金铸造厂', '何伟', '027-125642', '广西郴州，供应多种合金。');
INSERT INTO `t_supplier` VALUES ('13', 's19', '斯科尔金属研究所', '丹尼尔*雷', '17865982150', '提供稀有金属铸造技术支持。');
INSERT INTO `t_supplier` VALUES ('14', 's20', '威斯克稀有金属有限公司', '詹姆斯*诺克', '022-2563218', '提供设备安装和维护服务。');
INSERT INTO `t_supplier` VALUES ('15', 's24', '汉江文和钢铁有限公司', '周一堂', '13207593699', '无');
INSERT INTO `t_supplier` VALUES ('16', 's21', '唐山有色金属冶炼厂', '周达', '13207593699', '');
INSERT INTO `t_supplier` VALUES ('17', 's6', '河北三菱重型机床有限公司', '蒋怀安', '13545623018', '无');
INSERT INTO `t_supplier` VALUES ('18', 's10', '无锡三泰煤炭有限公司', '周达', '13545623018', '');
INSERT INTO `t_supplier` VALUES ('19', 's11', '合肥尔泰有色金属冶炼厂', '李东生', '18725032468', '无');
INSERT INTO `t_supplier` VALUES ('20', 's12', '青岛创合煤炭有限公司', '詹迪', '187620126544', '');
INSERT INTO `t_supplier` VALUES ('21', 's13', '成都建辉高温瓦片有限公司', '翟冰', '187620126544', '暂无');
INSERT INTO `t_supplier` VALUES ('22', 'aaa', 'aaa', 'aaa', '132564', 'aaa');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL auto_increment,
  `userName` varchar(20) default NULL,
  `password` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('3', 'admin', '123456');
INSERT INTO `t_user` VALUES ('4', 'a', 'a');
INSERT INTO `t_user` VALUES ('5', 'super', '123');
INSERT INTO `t_user` VALUES ('6', 'tjcu', 'tjcu');
