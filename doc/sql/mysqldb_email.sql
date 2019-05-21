/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.8.177_EMAIL
 Source Server Type    : MySQL
 Source Server Version : 50517
 Source Host           : 192.168.8.177
 Source Database       : mysqldb_email

 Target Server Type    : MySQL
 Target Server Version : 50517
 File Encoding         : utf-8

 Date: 04/03/2019 14:15:52 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `activities_mail`
-- ----------------------------
DROP TABLE IF EXISTS `activities_mail`;
CREATE TABLE `activities_mail` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `mailid` varchar(80) NOT NULL,
  `mailcode` varchar(50) NOT NULL,
  `adddate` datetime NOT NULL,
  `sql` varchar(5000) NOT NULL,
  `step` tinyint(2) NOT NULL,
  `siteid` tinyint(3) NOT NULL,
  `postdata` varchar(6000) NOT NULL,
  `lastupdate` datetime NOT NULL,
  `sent_date` datetime NOT NULL,
  `result` text NOT NULL,
  `total_mb_num` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mailid` (`mailid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `activities_mail_read_history`
-- ----------------------------
DROP TABLE IF EXISTS `activities_mail_read_history`;
CREATE TABLE `activities_mail_read_history` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `read_time` datetime NOT NULL,
  `last_read_time` datetime NOT NULL,
  `mailcode` varchar(60) NOT NULL,
  `mailid` int(11) NOT NULL,
  `times` int(5) NOT NULL,
  `manid` varchar(30) NOT NULL,
  `maildate` datetime NOT NULL,
  `sentdate` datetime NOT NULL,
  `bs_agent` varchar(500) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `ref_url` varchar(2048) NOT NULL,
  `email` varchar(100) NOT NULL,
  `siteid` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mailcode` (`mailid`,`manid`),
  KEY `mailcode_2` (`mailcode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `app_push_history`
-- ----------------------------
DROP TABLE IF EXISTS `app_push_history`;
CREATE TABLE `app_push_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL DEFAULT '',
  `man_name` varchar(32) NOT NULL DEFAULT '',
  `womanid` varchar(12) NOT NULL DEFAULT '',
  `woman_name` varchar(32) NOT NULL DEFAULT '',
  `siteid` tinyint(1) NOT NULL DEFAULT '0',
  `service_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ref_id` varchar(36) NOT NULL DEFAULT '',
  `push_data` varchar(1024) NOT NULL DEFAULT '',
  `device_type` tinyint(4) NOT NULL,
  `device_token` varchar(160) NOT NULL,
  `device_id` varchar(64) NOT NULL,
  `send` tinyint(4) NOT NULL DEFAULT '0',
  `server_return` text,
  `add_time` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `app_push_msg`
-- ----------------------------
DROP TABLE IF EXISTS `app_push_msg`;
CREATE TABLE `app_push_msg` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL DEFAULT '',
  `man_name` varchar(32) NOT NULL DEFAULT '',
  `womanid` varchar(12) NOT NULL DEFAULT '',
  `woman_name` varchar(32) NOT NULL DEFAULT '',
  `siteid` tinyint(1) NOT NULL DEFAULT '0',
  `service_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ref_id` varchar(36) NOT NULL DEFAULT '',
  `push_data` varchar(1024) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `app_push_msg_success`
-- ----------------------------
DROP TABLE IF EXISTS `app_push_msg_success`;
CREATE TABLE `app_push_msg_success` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL DEFAULT '',
  `man_name` varchar(32) NOT NULL DEFAULT '',
  `womanid` varchar(12) NOT NULL DEFAULT '',
  `woman_name` varchar(32) NOT NULL DEFAULT '',
  `siteid` tinyint(1) NOT NULL DEFAULT '0',
  `service_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ref_id` varchar(36) NOT NULL DEFAULT '',
  `push_data` varchar(1024) NOT NULL DEFAULT '',
  `push_time` datetime NOT NULL,
  `device_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `device_token` varchar(160) NOT NULL DEFAULT '',
  `device_id` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`),
  KEY `device_id` (`device_id`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `email_read_history`
-- ----------------------------
DROP TABLE IF EXISTS `email_read_history`;
CREATE TABLE `email_read_history` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `read_time` datetime NOT NULL,
  `last_read_time` datetime NOT NULL,
  `mailcode` varchar(60) NOT NULL,
  `mailid` int(11) NOT NULL,
  `times` int(5) NOT NULL,
  `manid` varchar(30) NOT NULL,
  `maildate` datetime NOT NULL,
  `sentdate` datetime NOT NULL,
  `bs_agent` varchar(500) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `ref_url` varchar(2048) NOT NULL,
  `email` varchar(100) NOT NULL,
  `siteid` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mailcode` (`mailid`,`manid`),
  KEY `mailcode_2` (`mailcode`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `email_statistics_day`
-- ----------------------------
DROP TABLE IF EXISTS `email_statistics_day`;
CREATE TABLE `email_statistics_day` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `mailcode` varchar(30) NOT NULL,
  `adddate` datetime NOT NULL,
  `statday` date NOT NULL DEFAULT '0000-00-00',
  `stat_week` varchar(30) NOT NULL DEFAULT '0000-00',
  `stat_month` varchar(30) NOT NULL DEFAULT '0000-00',
  `siteid` tinyint(1) NOT NULL,
  `sent_num` int(9) NOT NULL,
  `read_num` int(9) NOT NULL,
  `total_read_num` int(9) NOT NULL,
  `mail_type` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mailcode` (`mailcode`),
  KEY `statday` (`statday`)
) ENGINE=MyISAM AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `email_statistics_weekly`
-- ----------------------------
DROP TABLE IF EXISTS `email_statistics_weekly`;
CREATE TABLE `email_statistics_weekly` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `adddate` datetime NOT NULL,
  `statweekly` varchar(30) NOT NULL DEFAULT '0000-00',
  `siteid` tinyint(1) NOT NULL,
  `sent_num` int(9) NOT NULL,
  `read_num` int(9) NOT NULL,
  `total_red_num` int(9) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `statweekly` (`statweekly`)
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `email_template`
-- ----------------------------
DROP TABLE IF EXISTS `email_template`;
CREATE TABLE `email_template` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `subject2` mediumtext NOT NULL,
  `mailfrom` varchar(255) NOT NULL DEFAULT '',
  `header` text NOT NULL,
  `varlist` text NOT NULL,
  `message` text NOT NULL,
  `replymail` varchar(255) NOT NULL DEFAULT '',
  `html` text NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `siteid` int(4) NOT NULL DEFAULT '0',
  `sub_siteid` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`,`siteid`,`sub_siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=212 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `mail_list`
-- ----------------------------
DROP TABLE IF EXISTS `mail_list`;
CREATE TABLE `mail_list` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `mailcode` varchar(30) NOT NULL,
  `altbody` text NOT NULL,
  `body` mediumtext NOT NULL,
  `mailfrom` varchar(50) NOT NULL,
  `fromname` varchar(50) NOT NULL,
  `mailto` varchar(100) NOT NULL,
  `toname` varchar(60) NOT NULL,
  `replyto` varchar(60) NOT NULL,
  `subject` varchar(150) NOT NULL,
  `custom_header` varchar(150) NOT NULL,
  `htmlformat` tinyint(1) NOT NULL,
  `charcode` varchar(10) NOT NULL,
  `adddate` datetime NOT NULL,
  `ip` varchar(20) NOT NULL,
  `sentdate` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `relaydelivery` tinyint(1) NOT NULL,
  `attachfile` text NOT NULL,
  `attachfile_num` tinyint(2) NOT NULL,
  `siteid` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mailcode` (`mailcode`),
  KEY `status` (`status`)
) ENGINE=MRG_MyISAM DEFAULT CHARSET=utf8 INSERT_METHOD=LAST UNION=(`mail_list_201105`,`mail_list_201106`);

-- ----------------------------
--  Table structure for `mail_list_201007`
-- ----------------------------
DROP TABLE IF EXISTS `mail_list_201007`;
CREATE TABLE `mail_list_201007` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `mailcode` varchar(30) NOT NULL,
  `altbody` text NOT NULL,
  `body` text NOT NULL,
  `mailfrom` varchar(50) NOT NULL,
  `fromname` varchar(50) NOT NULL,
  `mailto` varchar(100) NOT NULL,
  `toname` varchar(60) NOT NULL,
  `replyto` varchar(60) NOT NULL,
  `subject` varchar(150) NOT NULL,
  `custom_header` varchar(150) NOT NULL,
  `htmlformat` tinyint(1) NOT NULL,
  `charcode` varchar(10) NOT NULL,
  `adddate` datetime NOT NULL,
  `ip` varchar(20) NOT NULL,
  `sentdate` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `relaydelivery` tinyint(1) NOT NULL,
  `attachfile` text NOT NULL,
  `attachfile_num` tinyint(2) NOT NULL,
  `siteid` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mailcode` (`mailcode`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `mail_list_201008`
-- ----------------------------
DROP TABLE IF EXISTS `mail_list_201008`;
CREATE TABLE `mail_list_201008` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `mailcode` varchar(30) NOT NULL,
  `altbody` text NOT NULL,
  `body` text NOT NULL,
  `mailfrom` varchar(50) NOT NULL,
  `fromname` varchar(50) NOT NULL,
  `mailto` varchar(100) NOT NULL,
  `toname` varchar(60) NOT NULL,
  `replyto` varchar(60) NOT NULL,
  `subject` varchar(150) NOT NULL,
  `custom_header` varchar(150) NOT NULL,
  `htmlformat` tinyint(1) NOT NULL,
  `charcode` varchar(10) NOT NULL,
  `adddate` datetime NOT NULL,
  `ip` varchar(20) NOT NULL,
  `sentdate` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `relaydelivery` tinyint(1) NOT NULL,
  `attachfile` text NOT NULL,
  `attachfile_num` tinyint(2) NOT NULL,
  `siteid` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mailcode` (`mailcode`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=578 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `mail_list_201105`
-- ----------------------------
DROP TABLE IF EXISTS `mail_list_201105`;
CREATE TABLE `mail_list_201105` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `mailcode` varchar(30) NOT NULL,
  `altbody` text NOT NULL,
  `body` mediumtext NOT NULL,
  `mailfrom` varchar(50) NOT NULL,
  `fromname` varchar(50) NOT NULL,
  `mailto` varchar(100) NOT NULL,
  `toname` varchar(60) NOT NULL,
  `replyto` varchar(60) NOT NULL,
  `subject` varchar(150) NOT NULL,
  `custom_header` varchar(150) NOT NULL,
  `htmlformat` tinyint(1) NOT NULL,
  `charcode` varchar(10) NOT NULL,
  `adddate` datetime NOT NULL,
  `ip` varchar(20) NOT NULL,
  `sentdate` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `relaydelivery` tinyint(1) NOT NULL,
  `attachfile` text NOT NULL,
  `attachfile_num` tinyint(2) NOT NULL,
  `siteid` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mailcode` (`mailcode`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `mail_list_201106`
-- ----------------------------
DROP TABLE IF EXISTS `mail_list_201106`;
CREATE TABLE `mail_list_201106` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `mailcode` varchar(30) NOT NULL,
  `altbody` text NOT NULL,
  `body` mediumtext NOT NULL,
  `mailfrom` varchar(50) NOT NULL,
  `fromname` varchar(50) NOT NULL,
  `mailto` varchar(100) NOT NULL,
  `toname` varchar(60) NOT NULL,
  `replyto` varchar(60) NOT NULL,
  `subject` varchar(150) NOT NULL,
  `custom_header` varchar(150) NOT NULL,
  `htmlformat` tinyint(1) NOT NULL,
  `charcode` varchar(10) NOT NULL,
  `adddate` datetime NOT NULL,
  `ip` varchar(20) NOT NULL,
  `sentdate` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `relaydelivery` tinyint(1) NOT NULL,
  `attachfile` text NOT NULL,
  `attachfile_num` tinyint(2) NOT NULL,
  `siteid` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mailcode` (`mailcode`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=3307 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `mail_list_qp_new`
-- ----------------------------
DROP TABLE IF EXISTS `mail_list_qp_new`;
CREATE TABLE `mail_list_qp_new` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `mailcode` varchar(30) NOT NULL,
  `altbody` text NOT NULL,
  `body` text NOT NULL,
  `mailfrom` varchar(50) NOT NULL,
  `fromname` varchar(50) NOT NULL,
  `mailto` varchar(100) NOT NULL,
  `toname` varchar(60) NOT NULL,
  `replyto` varchar(60) NOT NULL,
  `subject` varchar(150) NOT NULL,
  `custom_header` varchar(150) NOT NULL,
  `htmlformat` tinyint(1) NOT NULL,
  `charcode` varchar(10) NOT NULL,
  `adddate` datetime NOT NULL,
  `ip` varchar(20) NOT NULL,
  `sentdate` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `relaydelivery` tinyint(1) NOT NULL,
  `attachfile` text NOT NULL,
  `attachfile_num` tinyint(2) NOT NULL,
  `siteid` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mailcode` (`mailcode`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `mail_list_read_history`
-- ----------------------------
DROP TABLE IF EXISTS `mail_list_read_history`;
CREATE TABLE `mail_list_read_history` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `mailid` int(11) NOT NULL,
  `times` int(5) NOT NULL,
  `adddate` datetime NOT NULL,
  `bs_agent` varchar(500) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `manid` varchar(35) NOT NULL,
  `ref_url` varchar(2048) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mailid` (`mailid`)
) ENGINE=MyISAM AUTO_INCREMENT=5918 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `member_list_qp_new`
-- ----------------------------
DROP TABLE IF EXISTS `member_list_qp_new`;
CREATE TABLE `member_list_qp_new` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `email` varchar(80) NOT NULL,
  `step` tinyint(1) NOT NULL DEFAULT '1',
  `email_verified` char(1) NOT NULL DEFAULT 'N',
  `loginnum` int(7) NOT NULL,
  `last_login` datetime NOT NULL,
  `siteid` tinyint(1) NOT NULL,
  `sid` varchar(32) NOT NULL,
  `ipstatus` tinyint(1) NOT NULL DEFAULT '1',
  `paid_amount` decimal(10,2) NOT NULL,
  `order_num` int(5) NOT NULL,
  `money` decimal(7,2) NOT NULL,
  `integral_total` int(1) NOT NULL DEFAULT '0',
  `integral` int(1) NOT NULL DEFAULT '0',
  `device_type` varchar(2) NOT NULL DEFAULT '10',
  `verified_credit_card` tinyint(2) NOT NULL DEFAULT '0',
  `lc_freetrial` int(5) NOT NULL,
  `lc_freetrial_total` int(5) NOT NULL,
  `last_order_date` date NOT NULL DEFAULT '0000-00-00',
  `mb_level` char(1) NOT NULL DEFAULT 'E',
  `living` varchar(2) DEFAULT NULL,
  `birthday` date NOT NULL,
  `submitdate` datetime NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `mailcode` varchar(60) NOT NULL,
  `msgid` int(8) NOT NULL,
  `ref_freeticket` varchar(30) NOT NULL,
  `ref_integral` varchar(30) NOT NULL,
  `ref_coupon` varchar(30) NOT NULL,
  `read_time` datetime NOT NULL,
  `read_num` int(5) NOT NULL,
  `sent_date` date NOT NULL,
  `adddate` datetime NOT NULL,
  `login_num1` int(5) NOT NULL,
  `login_num2` int(5) NOT NULL,
  `login_num3` int(5) NOT NULL,
  `freeticket1` int(5) NOT NULL,
  `freeticket2` int(5) NOT NULL,
  `freeticket3` int(5) NOT NULL,
  `order_num1` int(5) NOT NULL,
  `order_num2` int(5) NOT NULL,
  `order_num3` int(5) NOT NULL,
  `coupon_num1` int(3) NOT NULL,
  `coupon_num2` int(3) NOT NULL,
  `coupon_num3` int(3) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`),
  KEY `email` (`email`),
  KEY `mailcode` (`mailcode`,`sent_date`),
  KEY `manid` (`manid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `msg_process_list`
-- ----------------------------
DROP TABLE IF EXISTS `msg_process_list`;
CREATE TABLE `msg_process_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `email` varchar(80) NOT NULL,
  `sid` varchar(32) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `addtime` datetime NOT NULL,
  `senthour` tinyint(4) NOT NULL,
  `womansiteid` tinyint(4) NOT NULL,
  `info` mediumtext NOT NULL,
  `number` tinyint(4) NOT NULL,
  `lastupdatetime` datetime NOT NULL,
  `processtime` datetime NOT NULL,
  `status` varchar(10) NOT NULL,
  `send_time` datetime NOT NULL,
  `sub_siteid` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`)
) ENGINE=MyISAM AUTO_INCREMENT=57251458 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `msg_process_list_json`
-- ----------------------------
DROP TABLE IF EXISTS `msg_process_list_json`;
CREATE TABLE `msg_process_list_json` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `email` varchar(80) NOT NULL,
  `sid` varchar(32) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `addtime` datetime NOT NULL,
  `senthour` tinyint(4) NOT NULL,
  `womansiteid` tinyint(4) NOT NULL,
  `info` mediumtext NOT NULL,
  `number` tinyint(4) NOT NULL,
  `lastupdatetime` datetime NOT NULL,
  `processtime` datetime NOT NULL,
  `status` varchar(10) NOT NULL,
  `send_time` datetime NOT NULL,
  `sub_siteid` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`)
) ENGINE=MyISAM AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `weeklymail_read_history`
-- ----------------------------
DROP TABLE IF EXISTS `weeklymail_read_history`;
CREATE TABLE `weeklymail_read_history` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `read_time` datetime NOT NULL,
  `last_read_time` datetime NOT NULL,
  `weekly` int(11) NOT NULL,
  `mailid` int(11) NOT NULL,
  `times` int(5) NOT NULL,
  `manid` varchar(30) NOT NULL,
  `maildate` datetime NOT NULL,
  `sentdate` datetime NOT NULL,
  `bs_agent` varchar(500) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `ref_url` varchar(2048) NOT NULL,
  `email` varchar(100) NOT NULL,
  `siteid` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `weekly` (`weekly`,`mailid`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
