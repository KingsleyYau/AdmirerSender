/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.8.177_CD
 Source Server Type    : MySQL
 Source Server Version : 50517
 Source Host           : 192.168.8.177
 Source Database       : rudatematch_website

 Target Server Type    : MySQL
 Target Server Version : 50517
 File Encoding         : utf-8

 Date: 04/03/2019 14:15:19 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `agentid` varchar(10) NOT NULL DEFAULT '',
  `stats_month` date NOT NULL DEFAULT '0000-00-00',
  `authorid` varchar(10) NOT NULL,
  `benef_id` varchar(20) NOT NULL,
  `payment_id` varchar(25) NOT NULL,
  `pay_date` datetime NOT NULL,
  `stats_mw` int(8) DEFAULT '0',
  `stats_wm` int(8) DEFAULT '0',
  `stats_am` int(8) DEFAULT '0',
  `stats_add` int(8) DEFAULT '0',
  `stats_ot` int(8) DEFAULT '0',
  `stats_ot2` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_lc` decimal(9,2) NOT NULL,
  `stats_camshare` decimal(9,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_call1` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_call2` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_call3` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_call4` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_video` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_gift_flowers` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_virtual_gifts` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_cupidnote` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_cupiddate` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_profile_post` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_video_post` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `deduct_profile_post` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `deduct_video_post` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_encourage` decimal(9,2) NOT NULL DEFAULT '0.00',
  `stats_punish` decimal(9,2) NOT NULL DEFAULT '0.00',
  `countmoney` decimal(8,2) DEFAULT '0.00',
  `stats_pay` decimal(8,2) DEFAULT '0.00',
  `reward` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `infact_pay` decimal(8,2) DEFAULT '0.00',
  `flag_pay` char(1) DEFAULT '0',
  `pay_num` varchar(250) NOT NULL,
  `comm` text NOT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `credits` decimal(10,2) NOT NULL DEFAULT '0.00',
  `money_type` varchar(50) NOT NULL DEFAULT 'RMB',
  `systime` datetime NOT NULL,
  `check_payee` varchar(200) NOT NULL DEFAULT '',
  `check_address` varchar(400) NOT NULL DEFAULT '',
  `check_zipcode` varchar(100) NOT NULL DEFAULT '',
  `check_no` varchar(200) NOT NULL DEFAULT '',
  `check_date` date NOT NULL DEFAULT '0000-00-00',
  `check_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `check_currency` varchar(20) NOT NULL DEFAULT '',
  `check_status` char(2) NOT NULL DEFAULT 'N',
  `trans_wm` int(6) NOT NULL DEFAULT '0',
  `trans_mw` int(6) NOT NULL DEFAULT '0',
  `exchange_rate` float(10,4) NOT NULL DEFAULT '0.0000',
  `company` varchar(400) NOT NULL DEFAULT '',
  `bank_account` varchar(25) NOT NULL DEFAULT '',
  `rate_date` varchar(20) NOT NULL,
  `stats_woman_num` int(5) NOT NULL DEFAULT '-1',
  `stats_video_reward` decimal(8,2) NOT NULL,
  `deduct_video_reward` decimal(8,2) NOT NULL,
  `emf_private_wm` decimal(8,2) unsigned NOT NULL,
  `emf_private_mw` decimal(8,2) unsigned NOT NULL,
  `lc_private_mw` decimal(8,2) unsigned NOT NULL,
  `lc_private_wm` decimal(8,2) unsigned NOT NULL,
  `lc_video_mw` decimal(8,2) unsigned NOT NULL,
  `lc_video_wm` decimal(8,2) unsigned NOT NULL,
  `emf_video_mw` decimal(8,2) unsigned NOT NULL,
  `emf_video_wm` decimal(8,2) unsigned NOT NULL,
  `logs_txt` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=5830 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `account_beneficiary`
-- ----------------------------
DROP TABLE IF EXISTS `account_beneficiary`;
CREATE TABLE `account_beneficiary` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `benef_id` varchar(20) NOT NULL,
  `authorid` varchar(10) NOT NULL,
  `pay_method` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pay_currency` varchar(5) NOT NULL,
  `pay_fee` decimal(5,2) NOT NULL,
  `pay_account` tinyint(1) NOT NULL DEFAULT '0',
  `start_pay` decimal(6,2) unsigned NOT NULL DEFAULT '0.00',
  `status_flag` char(1) NOT NULL DEFAULT 'Y',
  `check_payee` varchar(200) NOT NULL,
  `check_recipient` varchar(200) NOT NULL,
  `check_address` varchar(300) NOT NULL,
  `check_zipcode` varchar(10) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `bank_acc_name` varchar(200) NOT NULL,
  `bank_acc_no` varchar(50) NOT NULL,
  `bank_benef_address` varchar(300) NOT NULL,
  `bank_address` varchar(300) NOT NULL,
  `bank_country` varchar(50) NOT NULL,
  `bank_benef_country` varchar(50) NOT NULL,
  `bank_swift_code` varchar(30) NOT NULL,
  `bank_name_c` varchar(255) NOT NULL,
  `bank_acc_no_c` varchar(50) NOT NULL,
  `bank_swift_code_c` varchar(30) NOT NULL,
  `bank_note` varchar(200) NOT NULL,
  `note` varchar(400) NOT NULL,
  `last_update` datetime NOT NULL,
  `submit_time` datetime NOT NULL,
  `submit_staffid` varchar(10) NOT NULL,
  `submit_staffname` varchar(50) NOT NULL,
  `pay_remark` varchar(400) NOT NULL,
  `paypal_email` varchar(120) NOT NULL,
  `logs_txt` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `authorid` (`authorid`,`benef_id`)
) ENGINE=MyISAM AUTO_INCREMENT=421 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `account_check`
-- ----------------------------
DROP TABLE IF EXISTS `account_check`;
CREATE TABLE `account_check` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `stats_month` varchar(12) NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `profile_add` decimal(10,2) NOT NULL,
  `profile_deduct` decimal(10,2) NOT NULL,
  `video_add` decimal(10,2) NOT NULL,
  `video_deduct` decimal(10,2) NOT NULL,
  `profile_add2` varchar(10) NOT NULL,
  `profile_deduct2` varchar(10) NOT NULL,
  `video_add2` varchar(10) NOT NULL,
  `video_deduct2` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3549 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `account_nopay`
-- ----------------------------
DROP TABLE IF EXISTS `account_nopay`;
CREATE TABLE `account_nopay` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `agentid` varchar(10) NOT NULL DEFAULT '',
  `stats_month` date NOT NULL DEFAULT '0000-00-00',
  `authorid` varchar(10) NOT NULL,
  `benef_id` varchar(20) NOT NULL,
  `payment_id` varchar(25) NOT NULL,
  `pay_date` datetime NOT NULL,
  `stats_mw` int(8) DEFAULT '0',
  `stats_wm` int(8) DEFAULT '0',
  `stats_am` int(8) DEFAULT '0',
  `stats_add` int(8) DEFAULT '0',
  `stats_ot` int(8) DEFAULT '0',
  `stats_ot2` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_lc` decimal(9,2) NOT NULL,
  `stats_call1` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_call2` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_call3` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_call4` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_video` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_gift_flowers` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_cupiddate` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_profile_post` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_video_post` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `deduct_profile_post` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `deduct_video_post` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `countmoney` decimal(8,2) DEFAULT '0.00',
  `stats_pay` decimal(8,2) DEFAULT '0.00',
  `infact_pay` decimal(8,2) DEFAULT '0.00',
  `flag_pay` char(1) DEFAULT '0',
  `pay_num` varchar(250) NOT NULL,
  `comm` text NOT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `credits` decimal(10,2) NOT NULL DEFAULT '0.00',
  `money_type` varchar(50) NOT NULL DEFAULT 'RMB',
  `systime` datetime NOT NULL,
  `check_payee` varchar(200) NOT NULL DEFAULT '',
  `check_address` varchar(400) NOT NULL DEFAULT '',
  `check_zipcode` varchar(100) NOT NULL DEFAULT '',
  `check_no` varchar(200) NOT NULL DEFAULT '',
  `check_date` date NOT NULL DEFAULT '0000-00-00',
  `check_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `check_currency` varchar(20) NOT NULL DEFAULT '',
  `check_status` char(2) NOT NULL DEFAULT 'N',
  `trans_wm` int(6) NOT NULL DEFAULT '0',
  `trans_mw` int(6) NOT NULL DEFAULT '0',
  `exchange_rate` float(10,4) NOT NULL DEFAULT '0.0000',
  `company` varchar(400) NOT NULL DEFAULT '',
  `bank_account` varchar(25) NOT NULL DEFAULT '',
  `rate_date` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=292 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `account_payment`
-- ----------------------------
DROP TABLE IF EXISTS `account_payment`;
CREATE TABLE `account_payment` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `benef_id` varchar(20) NOT NULL,
  `authorid` varchar(10) NOT NULL,
  `payment_id` varchar(25) NOT NULL,
  `create_time` datetime NOT NULL,
  `pay_method` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pay_account` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `stats_pay` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `infact_pay` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `pay_flag` char(1) NOT NULL DEFAULT '0',
  `currency` varchar(5) NOT NULL,
  `check_payee` varchar(200) NOT NULL,
  `check_recipient` varchar(200) NOT NULL,
  `check_address` varchar(300) NOT NULL,
  `check_zipcode` varchar(10) NOT NULL,
  `check_no` varchar(30) NOT NULL,
  `check_date` date NOT NULL,
  `check_status` char(1) NOT NULL DEFAULT 'N',
  `bank_name` varchar(255) NOT NULL,
  `bank_acc_name` varchar(200) NOT NULL,
  `bank_acc_no` varchar(50) NOT NULL,
  `bank_benef_address` varchar(300) NOT NULL,
  `bank_address` varchar(300) NOT NULL,
  `bank_country` varchar(50) NOT NULL,
  `bank_benef_country` varchar(50) NOT NULL,
  `bank_swift_code` varchar(30) NOT NULL,
  `bank_name_c` varchar(255) NOT NULL,
  `bank_acc_no_c` varchar(50) NOT NULL,
  `bank_swift_code_c` varchar(30) NOT NULL,
  `bank_fee` decimal(5,2) unsigned NOT NULL DEFAULT '0.00',
  `bank_note` varchar(200) NOT NULL,
  `note` varchar(300) NOT NULL,
  `logtxt` text NOT NULL,
  `paypal_email` varchar(120) NOT NULL,
  `cashed_date` date NOT NULL,
  `logs_txt` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `authorid` (`authorid`,`benef_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `account_stats`
-- ----------------------------
DROP TABLE IF EXISTS `account_stats`;
CREATE TABLE `account_stats` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `authorid` varchar(10) NOT NULL,
  `benef_id` varchar(20) NOT NULL,
  `pay_flag` char(1) NOT NULL DEFAULT 'N',
  `stats_amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `num` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `authorid` (`authorid`,`benef_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3338 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `account_stats_by_lady`
-- ----------------------------
DROP TABLE IF EXISTS `account_stats_by_lady`;
CREATE TABLE `account_stats_by_lady` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `agentid` varchar(10) NOT NULL,
  `womanid` varchar(15) NOT NULL,
  `stats_month` date NOT NULL DEFAULT '0000-00-00',
  `stats_mw` int(8) NOT NULL DEFAULT '0',
  `stats_wm` int(8) NOT NULL DEFAULT '0',
  `stats_add` int(8) NOT NULL DEFAULT '0',
  `stats_lc` decimal(9,2) NOT NULL DEFAULT '0.00',
  `stats_camshare` decimal(9,2) NOT NULL DEFAULT '0.00',
  `stats_video` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_gift_flowers` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_virtual_gifts` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_cupiddate` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_ot` int(8) NOT NULL DEFAULT '0',
  `stats_ot2` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_call1` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_call2` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_call3` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_call4` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_total` decimal(10,2) NOT NULL,
  `emf_private_wm` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `emf_private_mw` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `lc_private_mw` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `lc_private_wm` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `emf_video_wm` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `emf_video_mw` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `lc_video_mw` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `lc_video_wm` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`),
  KEY `stats_month` (`stats_month`,`agentid`,`womanid`),
  KEY `agentid` (`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `acl_esl_login`
-- ----------------------------
DROP TABLE IF EXISTS `acl_esl_login`;
CREATE TABLE `acl_esl_login` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `staff` varchar(20) NOT NULL DEFAULT '',
  `decode` varchar(200) NOT NULL DEFAULT '',
  `status` enum('Y','N') NOT NULL DEFAULT 'N',
  `timeout` varchar(20) NOT NULL DEFAULT '',
  `loginip` varchar(15) NOT NULL,
  `computer_id` varchar(20) NOT NULL,
  `adddate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `decode` (`decode`)
) ENGINE=MyISAM AUTO_INCREMENT=84370 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `acl_esl_pc`
-- ----------------------------
DROP TABLE IF EXISTS `acl_esl_pc`;
CREATE TABLE `acl_esl_pc` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `cpu_id` varchar(120) NOT NULL DEFAULT '',
  `disk_id` varchar(50) NOT NULL DEFAULT '',
  `computer_id` varchar(20) NOT NULL DEFAULT '',
  `location1` varchar(100) NOT NULL,
  `location2` varchar(100) NOT NULL,
  `auth` enum('Y','N','P','D') NOT NULL DEFAULT 'Y',
  `comment` text NOT NULL,
  `staff` varchar(40) NOT NULL DEFAULT '',
  `last_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `login_num` int(6) NOT NULL DEFAULT '0',
  `adddate` datetime NOT NULL,
  `authuser` varchar(250) NOT NULL,
  `dept` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=228 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `acl_user`
-- ----------------------------
DROP TABLE IF EXISTS `acl_user`;
CREATE TABLE `acl_user` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `staff_id` varchar(20) NOT NULL DEFAULT '',
  `realname` varchar(30) NOT NULL,
  `username` varchar(10) NOT NULL DEFAULT '',
  `enname` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `inuse` char(1) NOT NULL DEFAULT '0',
  `cs_email` varchar(100) NOT NULL,
  `cs_group` char(1) NOT NULL,
  `signature` varchar(255) NOT NULL,
  `agent` text NOT NULL,
  `quanxian` text NOT NULL,
  `im_name` varchar(40) NOT NULL DEFAULT '',
  `im_face` tinyint(1) NOT NULL DEFAULT '0',
  `im_dept` tinyint(1) NOT NULL DEFAULT '0',
  `im_agent` text NOT NULL,
  `contactinfo` text NOT NULL,
  `gender` char(1) NOT NULL DEFAULT 'F',
  `style_id` tinyint(1) NOT NULL DEFAULT '0',
  `lastlogin` datetime NOT NULL,
  `lastip` varchar(15) NOT NULL,
  `loginnum` int(8) NOT NULL,
  `csmail` char(1) NOT NULL DEFAULT 'N',
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_spadmin` tinyint(1) NOT NULL DEFAULT '2',
  `manage_sys` text NOT NULL,
  `guest_sys` text NOT NULL,
  `office` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `im_inuse` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=MyISAM AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `acl_user_agt`
-- ----------------------------
DROP TABLE IF EXISTS `acl_user_agt`;
CREATE TABLE `acl_user_agt` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` varchar(20) NOT NULL,
  `agent` text NOT NULL,
  `im_agent` text NOT NULL,
  `siteid` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=MyISAM AUTO_INCREMENT=271 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `acl_user_cs`
-- ----------------------------
DROP TABLE IF EXISTS `acl_user_cs`;
CREATE TABLE `acl_user_cs` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` varchar(20) NOT NULL,
  `cs_email` varchar(100) NOT NULL,
  `cs_group` char(1) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'N',
  `signature` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `activity_like_skip`
-- ----------------------------
DROP TABLE IF EXISTS `activity_like_skip`;
CREATE TABLE `activity_like_skip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `manname` varchar(70) NOT NULL,
  `adddate` datetime NOT NULL,
  `last_action_time` datetime NOT NULL,
  `progress` tinyint(1) NOT NULL DEFAULT '0',
  `womanlist` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `manid` (`manid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `address_request`
-- ----------------------------
DROP TABLE IF EXISTS `address_request`;
CREATE TABLE `address_request` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `manid` char(12) NOT NULL,
  `womanid` varchar(20) NOT NULL DEFAULT '',
  `agentid` varchar(20) NOT NULL DEFAULT '',
  `request_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `approved_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `view_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `usclient` char(1) NOT NULL DEFAULT 'N',
  `status` int(1) NOT NULL DEFAULT '0',
  `note` text NOT NULL,
  `view_times` int(5) NOT NULL DEFAULT '0',
  `other` text NOT NULL,
  `returned_credit` char(1) NOT NULL DEFAULT 'N',
  `signid` varchar(50) NOT NULL DEFAULT '',
  `note2` text NOT NULL,
  `manname` varchar(50) NOT NULL DEFAULT '',
  `womanname` varchar(75) NOT NULL DEFAULT '',
  UNIQUE KEY `id` (`id`),
  KEY `manid` (`manid`),
  KEY `womanid` (`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=26707 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `admin_logs`
-- ----------------------------
DROP TABLE IF EXISTS `admin_logs`;
CREATE TABLE `admin_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` varchar(15) NOT NULL,
  `staff_name` varchar(30) NOT NULL DEFAULT '',
  `adddate` datetime NOT NULL,
  `ip` varchar(20) NOT NULL,
  `classify` tinyint(2) NOT NULL,
  `code` int(4) NOT NULL,
  `ref_id` varchar(50) NOT NULL,
  `ref_date` datetime NOT NULL,
  `ref_id2` varchar(50) NOT NULL,
  `comment` varchar(400) NOT NULL DEFAULT '',
  `computer_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  KEY `ref_id` (`ref_id`)
) ENGINE=MyISAM AUTO_INCREMENT=174881 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `admire_assistant_regulation`
-- ----------------------------
DROP TABLE IF EXISTS `admire_assistant_regulation`;
CREATE TABLE `admire_assistant_regulation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `agentid` varchar(5) NOT NULL,
  `womanid` varchar(12) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `man_age1` year(4) NOT NULL,
  `man_age2` year(4) NOT NULL,
  `country` varchar(200) NOT NULL,
  `marry` tinyint(1) unsigned NOT NULL,
  `children` tinyint(1) unsigned NOT NULL,
  `photo` tinyint(1) unsigned NOT NULL,
  `ethnicity` tinyint(1) unsigned NOT NULL,
  `religion` tinyint(1) unsigned NOT NULL,
  `is_birthday` tinyint(1) unsigned NOT NULL,
  `template` varchar(1024) NOT NULL,
  `agent_follow_id` varchar(15) NOT NULL,
  `agent_follow_name` varchar(40) NOT NULL,
  `edit_time` datetime NOT NULL,
  `add_time` datetime NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`,`womanid`),
  KEY `status` (`status`,`edit_time`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `admire_assistant_send`
-- ----------------------------
DROP TABLE IF EXISTS `admire_assistant_send`;
CREATE TABLE `admire_assistant_send` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `agentid` varchar(5) NOT NULL,
  `womanid` varchar(12) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `groupid` varchar(10) NOT NULL,
  `regulation` varchar(1024) NOT NULL,
  `agent_follow_id` varchar(15) NOT NULL,
  `agent_follow_name` varchar(40) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `computer_id` varchar(10) NOT NULL,
  `add_time` datetime NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `num_sent` int(5) NOT NULL DEFAULT '0',
  `country` varchar(200) DEFAULT NULL,
  `staff_id` varchar(15) NOT NULL,
  `staff_name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`,`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `admire_reply_rate`
-- ----------------------------
DROP TABLE IF EXISTS `admire_reply_rate`;
CREATE TABLE `admire_reply_rate` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `agent` varchar(10) NOT NULL,
  `smonth` date NOT NULL,
  `staff_id` varchar(8) NOT NULL,
  `staff_name` varchar(35) NOT NULL,
  `num_submit` int(5) NOT NULL,
  `num_sent` int(5) NOT NULL,
  `num_reply` int(5) NOT NULL,
  `template_type` char(1) NOT NULL DEFAULT 'A',
  `lady_submit` int(5) NOT NULL,
  `agent_submit` int(5) NOT NULL,
  `assistant_submit` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `staff` (`staff_id`,`smonth`),
  KEY `agent` (`agent`,`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `admire_temp`
-- ----------------------------
DROP TABLE IF EXISTS `admire_temp`;
CREATE TABLE `admire_temp` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `womanid` varchar(12) NOT NULL,
  `manid` varchar(10) NOT NULL,
  `agent` varchar(8) NOT NULL,
  `template_type` char(1) NOT NULL DEFAULT 'A',
  `vg_id` varchar(10) NOT NULL,
  `adddate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`),
  KEY `manid` (`manid`),
  KEY `template_type` (`template_type`)
) ENGINE=MyISAM AUTO_INCREMENT=17575357 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `admire_template`
-- ----------------------------
DROP TABLE IF EXISTS `admire_template`;
CREATE TABLE `admire_template` (
  `at_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `at_adddate` datetime NOT NULL,
  `at_editdate` datetime NOT NULL,
  `at_code` varchar(20) NOT NULL,
  `owner` varchar(6) NOT NULL,
  `company` varchar(100) NOT NULL,
  `womanid` varchar(12) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `at_title` varchar(60) NOT NULL,
  `at_greet` varchar(25) NOT NULL,
  `at_content_cn` text NOT NULL,
  `at_show_cn` char(1) NOT NULL,
  `at_content_en` text NOT NULL,
  `attachment` varchar(170) NOT NULL,
  `follower` varchar(30) NOT NULL,
  `follower_staffid` varchar(10) NOT NULL,
  `at_dodate` datetime NOT NULL,
  `our_follower` varchar(30) NOT NULL,
  `our_follower_id` varchar(15) NOT NULL,
  `at_isedit` char(1) NOT NULL,
  `at_delete` char(1) NOT NULL,
  `at_no_approval` varchar(1000) NOT NULL,
  `at_review_method` tinyint(1) NOT NULL DEFAULT '1',
  `at_status` char(1) NOT NULL,
  `groupid` varchar(10) NOT NULL,
  `template_type` char(1) NOT NULL DEFAULT 'A',
  `vg_id` varchar(10) NOT NULL,
  `assistant_num` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`at_id`),
  KEY `womanid` (`womanid`,`follower_staffid`),
  KEY `template_type` (`template_type`)
) ENGINE=MyISAM AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `adv_user`
-- ----------------------------
DROP TABLE IF EXISTS `adv_user`;
CREATE TABLE `adv_user` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `loginid` varchar(35) NOT NULL DEFAULT '',
  `passwd` varchar(50) NOT NULL DEFAULT '',
  `inuse` tinyint(1) NOT NULL DEFAULT '1',
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL DEFAULT '',
  `company` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `paypal_email` varchar(60) NOT NULL DEFAULT '',
  `telephone` varchar(60) NOT NULL DEFAULT '',
  `fax` varchar(60) NOT NULL DEFAULT '',
  `payableto` varchar(200) NOT NULL,
  `country` varchar(50) NOT NULL,
  `street` varchar(250) NOT NULL DEFAULT '',
  `city` varchar(250) NOT NULL DEFAULT '',
  `state` varchar(200) NOT NULL,
  `address` varchar(250) NOT NULL DEFAULT '',
  `postcode` varchar(20) NOT NULL,
  `url` varchar(200) NOT NULL DEFAULT '',
  `site` varchar(150) NOT NULL,
  `remark` text NOT NULL,
  `clicknum` int(8) NOT NULL DEFAULT '0',
  `validclick` int(8) NOT NULL DEFAULT '0',
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `usertype` tinyint(1) NOT NULL,
  `startdate` date NOT NULL DEFAULT '0000-00-00',
  `vaildclick` int(8) DEFAULT '0',
  `totalclick` int(8) DEFAULT '0',
  `loginnum` int(7) DEFAULT '0',
  `ip` varchar(20) NOT NULL,
  `paid_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `balance` decimal(8,2) NOT NULL DEFAULT '0.00',
  `lastlogin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `joinmb` int(8) NOT NULL DEFAULT '0',
  `order_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `payplan1` float(5,2) NOT NULL DEFAULT '1.50',
  `payplan2` float(5,2) NOT NULL DEFAULT '1.50',
  `payplan3` float(5,2) NOT NULL DEFAULT '1.50',
  `request_pay` char(1) NOT NULL DEFAULT 'N',
  `request_pay_date` datetime NOT NULL,
  `request_pay_detail` text NOT NULL,
  `display` char(1) NOT NULL DEFAULT 'Y',
  `email_enabled` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id`),
  KEY `loginid` (`loginid`)
) ENGINE=MyISAM AUTO_INCREMENT=2916 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `advert_list`
-- ----------------------------
DROP TABLE IF EXISTS `advert_list`;
CREATE TABLE `advert_list` (
  `indexid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `adv_id` varchar(32) NOT NULL,
  `title` varchar(200) NOT NULL,
  `startime` datetime NOT NULL,
  `endtime` datetime NOT NULL,
  `user_range` tinyint(1) unsigned NOT NULL,
  `user_range_description` tinyint(3) NOT NULL,
  `show_mode` tinyint(1) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  `priority` int(10) unsigned NOT NULL,
  `matter_ids` varchar(200) NOT NULL,
  `staff_id` varchar(16) NOT NULL,
  `staff_name` varchar(32) NOT NULL,
  `insert_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`indexid`),
  UNIQUE KEY `adv_id` (`adv_id`)
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `advert_matter_list`
-- ----------------------------
DROP TABLE IF EXISTS `advert_matter_list`;
CREATE TABLE `advert_matter_list` (
  `indexid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `matter_id` varchar(32) NOT NULL,
  `title` varchar(200) NOT NULL,
  `device_type` tinyint(3) unsigned NOT NULL,
  `matter_type` tinyint(1) unsigned NOT NULL,
  `screen_type` tinyint(1) unsigned NOT NULL,
  `matter_size` tinyint(3) unsigned NOT NULL,
  `jump_url` varchar(1024) NOT NULL,
  `url_type` tinyint(1) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  `matter_normal` varchar(200) NOT NULL,
  `matter_wide` varchar(200) NOT NULL,
  `matter_code` text NOT NULL,
  `ga_trigger` tinyint(1) NOT NULL,
  `ga_click_point` varchar(32) NOT NULL,
  `ga_load_point` varchar(32) NOT NULL,
  `user_range` tinyint(1) unsigned NOT NULL,
  `user_range_description` tinyint(3) NOT NULL,
  `staff_id` varchar(16) NOT NULL,
  `staff_name` varchar(32) NOT NULL,
  `insert_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`indexid`),
  UNIQUE KEY `matter_id` (`matter_id`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `advert_relation_list`
-- ----------------------------
DROP TABLE IF EXISTS `advert_relation_list`;
CREATE TABLE `advert_relation_list` (
  `adp_indexid` int(5) NOT NULL DEFAULT '0',
  `adv_indexids` varchar(200) NOT NULL,
  `adv_count` int(5) NOT NULL,
  PRIMARY KEY (`adp_indexid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `advertising_cost`
-- ----------------------------
DROP TABLE IF EXISTS `advertising_cost`;
CREATE TABLE `advertising_cost` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `loginid` varchar(40) NOT NULL DEFAULT '',
  `amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `pay_date` date NOT NULL DEFAULT '0000-00-00',
  `pay_method` char(3) NOT NULL DEFAULT '',
  `pay_ref` varchar(100) NOT NULL DEFAULT '',
  `note` text NOT NULL,
  `check_clear` char(1) NOT NULL DEFAULT '',
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `usertype` int(11) NOT NULL DEFAULT '0',
  `client_note` text NOT NULL,
  `memberlist` text NOT NULL,
  `payableto` varchar(120) NOT NULL DEFAULT '',
  UNIQUE KEY `id` (`id`),
  KEY `loginid` (`loginid`)
) ENGINE=MyISAM AUTO_INCREMENT=697 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `aff_err`
-- ----------------------------
DROP TABLE IF EXISTS `aff_err`;
CREATE TABLE `aff_err` (
  `manid` varchar(12) NOT NULL,
  `joindate` date NOT NULL,
  `ip` varchar(15) NOT NULL,
  `brower` tinyint(1) NOT NULL,
  `system` tinyint(1) NOT NULL,
  `ads_vaild` char(1) NOT NULL DEFAULT 'N',
  `ads_payed` char(1) NOT NULL DEFAULT 'N',
  `resolutions` tinyint(1) NOT NULL,
  `colors` tinyint(1) NOT NULL,
  `ads_type` tinyint(1) NOT NULL,
  `adsuser` varchar(40) NOT NULL,
  `activedate` datetime NOT NULL,
  PRIMARY KEY (`manid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `aff_payed`
-- ----------------------------
DROP TABLE IF EXISTS `aff_payed`;
CREATE TABLE `aff_payed` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `loginid` varchar(200) NOT NULL,
  `amount` float(8,2) NOT NULL,
  `endtime` date NOT NULL,
  `comment` text NOT NULL,
  `adddate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `loginid` (`loginid`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `affiliate_member`
-- ----------------------------
DROP TABLE IF EXISTS `affiliate_member`;
CREATE TABLE `affiliate_member` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `manid` char(12) NOT NULL,
  `affiliate_id` varchar(20) NOT NULL DEFAULT '',
  `accept` char(1) NOT NULL DEFAULT 'N',
  `date_join` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_active` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_review` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reviewer` varchar(50) NOT NULL DEFAULT '',
  `payment_id` varchar(50) NOT NULL DEFAULT '',
  `ip_active` varchar(20) NOT NULL DEFAULT '',
  `client_browser` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `affiliate` (`affiliate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6859 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `affiliate_month_detail`
-- ----------------------------
DROP TABLE IF EXISTS `affiliate_month_detail`;
CREATE TABLE `affiliate_month_detail` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `affiliate_id` varchar(30) NOT NULL DEFAULT '',
  `month` date NOT NULL DEFAULT '0000-00-00',
  `mb_num` tinyint(5) NOT NULL DEFAULT '0',
  `per_mb_pay` float(8,2) NOT NULL DEFAULT '0.00',
  `total_earn` float(8,2) NOT NULL DEFAULT '0.00',
  `payment_status` tinyint(1) NOT NULL DEFAULT '0',
  `payment_id` varchar(50) NOT NULL DEFAULT '',
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `affiliate_id` (`affiliate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1204 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `agent`
-- ----------------------------
DROP TABLE IF EXISTS `agent`;
CREATE TABLE `agent` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `authorid` varchar(12) NOT NULL,
  `agentid` varchar(20) NOT NULL DEFAULT '',
  `passwd` varchar(50) NOT NULL DEFAULT '',
  `passwd_view` varchar(50) NOT NULL DEFAULT '',
  `company` varchar(250) NOT NULL DEFAULT '',
  `contact` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `country` varchar(200) NOT NULL DEFAULT '',
  `city` varchar(100) NOT NULL DEFAULT '',
  `inuse` char(1) NOT NULL DEFAULT '1',
  `org_addr` varchar(400) NOT NULL DEFAULT '',
  `contact_postcode` varchar(200) NOT NULL,
  `contact_tel` varchar(200) NOT NULL,
  `contact_fax` varchar(200) NOT NULL,
  `sp_name` varchar(200) NOT NULL,
  `sp_idcard` varchar(200) NOT NULL,
  `sp_home_addr` varchar(200) NOT NULL,
  `sp_postcode` varchar(200) NOT NULL,
  `sp_home_tel` varchar(200) NOT NULL,
  `sp_work_tel` varchar(200) NOT NULL,
  `sp_mobile` varchar(200) NOT NULL,
  `bank_name` varchar(200) NOT NULL,
  `bank_account_name` varchar(200) NOT NULL,
  `bank_addr` varchar(250) NOT NULL,
  `bank_account_num` varchar(200) NOT NULL,
  `money_type` varchar(20) NOT NULL DEFAULT 'USD',
  `pre_money` decimal(8,2) NOT NULL DEFAULT '1.50',
  `admirers` char(1) NOT NULL DEFAULT 'Y',
  `translation` char(1) NOT NULL DEFAULT 'N',
  `wmtrans` char(1) NOT NULL DEFAULT 'N',
  `helptrans` char(1) NOT NULL DEFAULT 'Y',
  `oicq` varchar(80) NOT NULL,
  `website` varchar(150) NOT NULL,
  `enname` varchar(255) NOT NULL DEFAULT '',
  `location` varchar(300) NOT NULL DEFAULT '',
  `intro` text NOT NULL,
  `gift` char(2) NOT NULL DEFAULT 'N',
  `rebate` decimal(8,2) NOT NULL,
  `check_payee` varchar(150) NOT NULL DEFAULT '',
  `check_address` varchar(400) NOT NULL DEFAULT '',
  `check_zipcode` varchar(20) NOT NULL DEFAULT '',
  `lastlogin` varchar(100) NOT NULL DEFAULT '',
  `minamount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `im_name` varchar(70) NOT NULL,
  `im_dept` varchar(800) NOT NULL DEFAULT '',
  `cujin` varchar(30) NOT NULL DEFAULT '',
  `jianguan` varchar(30) NOT NULL DEFAULT '',
  `admire_max` int(3) unsigned NOT NULL DEFAULT '10',
  `admire_max2` tinyint(2) unsigned NOT NULL DEFAULT '10',
  `admire_sum_max` int(4) unsigned NOT NULL,
  `admire_sum_balance` int(4) NOT NULL,
  `admire_sum_max2` int(1) unsigned NOT NULL DEFAULT '1000',
  `admire_sum_balance2` int(1) NOT NULL DEFAULT '1000',
  `admire_reviewer` char(1) NOT NULL DEFAULT 'E',
  `admire_tpl_reviewer` char(1) NOT NULL DEFAULT 'E',
  `admire_assistant_send` char(1) NOT NULL DEFAULT 'N',
  `grade` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `acc_show` char(1) NOT NULL DEFAULT 'N',
  `verify_code` varchar(10) NOT NULL,
  `man_credit` char(1) NOT NULL DEFAULT 'N',
  `date_remind` date NOT NULL DEFAULT '0000-00-00',
  `date_stop` date NOT NULL DEFAULT '0000-00-00',
  `emfno` int(8) NOT NULL,
  `addtime` datetime NOT NULL,
  `cujin_a` char(1) NOT NULL,
  `cujin_b` tinyint(1) NOT NULL DEFAULT '0',
  `cujin_c` tinyint(1) NOT NULL DEFAULT '0',
  `remark` varchar(750) NOT NULL DEFAULT '',
  `cupid_reviewer` char(1) NOT NULL DEFAULT 'A',
  `pay_remark` varchar(400) NOT NULL DEFAULT '',
  `pay_remark_flag` char(1) NOT NULL DEFAULT 'Y',
  `timezone` int(3) NOT NULL DEFAULT '0',
  `style_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `wm_reply_max` int(1) unsigned NOT NULL DEFAULT '20',
  `benef_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`,`authorid`)
) ENGINE=MyISAM AUTO_INCREMENT=148 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `agent_apply`
-- ----------------------------
DROP TABLE IF EXISTS `agent_apply`;
CREATE TABLE `agent_apply` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `company` varchar(300) NOT NULL DEFAULT '',
  `city` varchar(100) NOT NULL DEFAULT '',
  `address` varchar(400) NOT NULL DEFAULT '',
  `contactor` varchar(60) NOT NULL DEFAULT '',
  `telephone` varchar(30) NOT NULL,
  `email` varchar(60) NOT NULL DEFAULT '',
  `website` varchar(100) NOT NULL,
  `opentime` varchar(30) NOT NULL,
  `staffnum` varchar(10) NOT NULL,
  `officesize` varchar(10) NOT NULL,
  `salescope` varchar(400) NOT NULL DEFAULT '',
  `intro` text NOT NULL,
  `equipment` text NOT NULL,
  `experience` text NOT NULL,
  `knowme` text NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `apptime` datetime NOT NULL,
  `mobilephone` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `province` varchar(50) NOT NULL,
  `follow` text NOT NULL,
  `ip` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=772 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `agent_author`
-- ----------------------------
DROP TABLE IF EXISTS `agent_author`;
CREATE TABLE `agent_author` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `authorid` varchar(12) NOT NULL,
  `inuse` char(1) NOT NULL DEFAULT 'Y',
  `addtime` datetime NOT NULL,
  `addinfo` varchar(100) NOT NULL,
  `company` varchar(250) NOT NULL,
  `city` varchar(100) NOT NULL DEFAULT '',
  `address` varchar(300) NOT NULL,
  `postcode` varchar(200) NOT NULL,
  `website` varchar(200) NOT NULL,
  `contact` varchar(100) NOT NULL DEFAULT '',
  `contact_tel` varchar(200) NOT NULL,
  `contact_fax` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL DEFAULT '',
  `qq` varchar(200) NOT NULL DEFAULT '',
  `sp_name` varchar(200) NOT NULL,
  `sp_idcard` varchar(200) NOT NULL,
  `sp_home_addr` varchar(200) NOT NULL,
  `sp_postcode` varchar(200) NOT NULL,
  `sp_home_tel` varchar(200) NOT NULL,
  `sp_work_tel` varchar(200) NOT NULL,
  `sp_mobile` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `authorid` (`authorid`)
) ENGINE=MyISAM AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `agent_demo`
-- ----------------------------
DROP TABLE IF EXISTS `agent_demo`;
CREATE TABLE `agent_demo` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `authorid` varchar(12) NOT NULL,
  `agentid` varchar(20) NOT NULL DEFAULT '',
  `passwd` varchar(50) NOT NULL DEFAULT '',
  `passwd_view` varchar(50) NOT NULL DEFAULT '',
  `company` varchar(250) NOT NULL DEFAULT '',
  `contact` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `country` varchar(200) NOT NULL DEFAULT '',
  `city` varchar(100) NOT NULL DEFAULT '',
  `inuse` char(1) NOT NULL DEFAULT '1',
  `org_addr` varchar(400) NOT NULL DEFAULT '',
  `contact_postcode` varchar(200) NOT NULL,
  `contact_tel` varchar(200) NOT NULL,
  `contact_fax` varchar(200) NOT NULL,
  `sp_name` varchar(200) NOT NULL,
  `sp_idcard` varchar(200) NOT NULL,
  `sp_home_addr` varchar(200) NOT NULL,
  `sp_postcode` varchar(200) NOT NULL,
  `sp_home_tel` varchar(200) NOT NULL,
  `sp_work_tel` varchar(200) NOT NULL,
  `sp_mobile` varchar(200) NOT NULL,
  `bank_name` varchar(200) NOT NULL,
  `bank_account_name` varchar(200) NOT NULL,
  `bank_addr` varchar(250) NOT NULL,
  `bank_account_num` varchar(200) NOT NULL,
  `money_type` varchar(20) NOT NULL DEFAULT 'RMB',
  `pre_money` decimal(8,2) NOT NULL DEFAULT '11.00',
  `admirers` char(1) NOT NULL DEFAULT 'Y',
  `translation` char(1) NOT NULL DEFAULT 'N',
  `wmtrans` char(1) NOT NULL DEFAULT 'N',
  `helptrans` char(1) NOT NULL DEFAULT 'Y',
  `oicq` varchar(80) NOT NULL,
  `website` varchar(150) NOT NULL,
  `enname` varchar(255) NOT NULL DEFAULT '',
  `location` varchar(300) NOT NULL DEFAULT '',
  `intro` text NOT NULL,
  `gift` char(2) NOT NULL DEFAULT 'N',
  `check_payee` varchar(150) NOT NULL DEFAULT '',
  `check_address` varchar(400) NOT NULL DEFAULT '',
  `check_zipcode` varchar(20) NOT NULL DEFAULT '',
  `lastlogin` varchar(100) NOT NULL DEFAULT '',
  `minamount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `im_name` varchar(70) NOT NULL,
  `im_dept` varchar(800) NOT NULL DEFAULT '',
  `cujin` varchar(30) NOT NULL DEFAULT '',
  `jianguan` varchar(30) NOT NULL DEFAULT '',
  `admire_max` int(3) unsigned NOT NULL DEFAULT '10',
  `admire_sum_max` int(4) unsigned NOT NULL,
  `admire_sum_balance` int(4) NOT NULL,
  `admire_reviewer` char(1) NOT NULL DEFAULT 'E',
  `admire_tpl_reviewer` char(1) NOT NULL DEFAULT 'E',
  `grade` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `acc_show` char(1) NOT NULL DEFAULT 'N',
  `verify_code` varchar(10) NOT NULL,
  `man_credit` char(1) NOT NULL DEFAULT 'N',
  `date_remind` date NOT NULL DEFAULT '0000-00-00',
  `date_stop` date NOT NULL DEFAULT '0000-00-00',
  `emfno` int(8) NOT NULL,
  `addtime` datetime NOT NULL,
  `cujin_a` char(1) NOT NULL,
  `cujin_b` tinyint(1) NOT NULL DEFAULT '0',
  `cujin_c` tinyint(1) NOT NULL DEFAULT '0',
  `remark` varchar(750) NOT NULL DEFAULT '',
  `cupid_reviewer` char(1) NOT NULL DEFAULT 'A',
  `pay_remark` varchar(1000) NOT NULL,
  `pay_remark_flag` char(1) NOT NULL DEFAULT 'Y',
  `timezone` int(3) NOT NULL DEFAULT '0',
  `style_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `wm_reply_max` int(1) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`),
  KEY `agentid` (`authorid`,`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=198 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `agent_help`
-- ----------------------------
DROP TABLE IF EXISTS `agent_help`;
CREATE TABLE `agent_help` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `sort` char(2) NOT NULL DEFAULT '',
  `subsort` char(2) NOT NULL DEFAULT '',
  `question` varchar(255) NOT NULL DEFAULT '',
  `answer` text NOT NULL,
  `pxdate` datetime NOT NULL,
  `adddate` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=148 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `agent_help_en`
-- ----------------------------
DROP TABLE IF EXISTS `agent_help_en`;
CREATE TABLE `agent_help_en` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `sort` char(2) NOT NULL DEFAULT '',
  `subsort` char(2) NOT NULL DEFAULT '',
  `question` varchar(450) NOT NULL DEFAULT '',
  `answer` text NOT NULL,
  `pxdate` datetime NOT NULL,
  `adddate` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=145 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `agent_info`
-- ----------------------------
DROP TABLE IF EXISTS `agent_info`;
CREATE TABLE `agent_info` (
  `agentid` varchar(20) NOT NULL,
  `sms_name` varchar(60) NOT NULL DEFAULT '',
  `sms_tel` varchar(150) NOT NULL DEFAULT '',
  `lovecall` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `lovecall_instant` tinyint(1) NOT NULL DEFAULT '1',
  `lovecall_authcall` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `lovecall_2way` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `lovecall_submit_max` smallint(3) unsigned NOT NULL DEFAULT '1000',
  `lovecall_booking_max` smallint(3) unsigned NOT NULL DEFAULT '1000',
  `lovecall_woman_max` smallint(2) unsigned NOT NULL DEFAULT '1000',
  `lovecall_logs` text NOT NULL,
  `priv_livechat` tinyint(1) NOT NULL DEFAULT '1',
  `priv_camshare` tinyint(1) NOT NULL DEFAULT '0',
  `priv_postnew` tinyint(1) NOT NULL DEFAULT '1',
  `priv_refresh` tinyint(1) NOT NULL DEFAULT '1',
  `priv_hideall` tinyint(1) NOT NULL DEFAULT '0',
  `priv_videochat` tinyint(1) NOT NULL DEFAULT '0',
  `priv_contactreq` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `virtual_gifts` tinyint(1) NOT NULL DEFAULT '1',
  `lady_reply_emf` tinyint(1) NOT NULL DEFAULT '1',
  `lady_reply_emf_mode` tinyint(1) NOT NULL DEFAULT '2',
  `priv_livechat_auto` tinyint(1) NOT NULL DEFAULT '1',
  `priv_livechat_sendinvite` tinyint(1) NOT NULL DEFAULT '1',
  `livechat_tpl_agentmax` int(6) unsigned NOT NULL DEFAULT '2000',
  `livechat_tpl_ladymax` int(4) unsigned NOT NULL DEFAULT '20',
  `livechat_invite_autoflag` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `livechat_invite_autospeed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `album_review_mode` char(1) NOT NULL DEFAULT 'S',
  `priv_create_profileid` tinyint(1) NOT NULL DEFAULT '1',
  `private_album_upload` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `private_album_send` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `private_album_authority` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `private_short_video_upload` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `private_short_video_send` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `private_short_video_authority` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `profile_credit` tinyint(1) NOT NULL DEFAULT '0',
  `profile_credit_un` tinyint(1) NOT NULL DEFAULT '0',
  `profile_credit_time1` datetime NOT NULL,
  `profile_credit_time2` datetime NOT NULL,
  `videoshow_credit` tinyint(1) NOT NULL DEFAULT '0',
  `videoshow_credit_un` tinyint(1) NOT NULL DEFAULT '0',
  `videoshow_credit_time1` datetime NOT NULL,
  `videoshow_credit_time2` datetime NOT NULL,
  `cupid_agent_priv` tinyint(1) NOT NULL DEFAULT '1',
  `cupid_reply_max` int(10) unsigned NOT NULL DEFAULT '20',
  `cupid_lady_priv` tinyint(1) NOT NULL DEFAULT '1',
  `cupid_lady_review_mode` tinyint(1) NOT NULL,
  PRIMARY KEY (`agentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `agent_info_demo`
-- ----------------------------
DROP TABLE IF EXISTS `agent_info_demo`;
CREATE TABLE `agent_info_demo` (
  `agentid` varchar(20) NOT NULL,
  `sms_name` varchar(60) NOT NULL DEFAULT '',
  `sms_tel` varchar(150) NOT NULL DEFAULT '',
  `lovecall` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `lovecall_2way` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `lovecall_submit_max` smallint(3) unsigned NOT NULL DEFAULT '1000',
  `lovecall_booking_max` smallint(3) unsigned NOT NULL DEFAULT '1000',
  `lovecall_woman_max` smallint(2) unsigned NOT NULL DEFAULT '1000',
  `lovecall_logs` text NOT NULL,
  `priv_livechat` tinyint(1) NOT NULL DEFAULT '1',
  `priv_postnew` tinyint(1) NOT NULL DEFAULT '1',
  `priv_refresh` tinyint(1) NOT NULL DEFAULT '1',
  `priv_hideall` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`agentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `agent_livechat_activities`
-- ----------------------------
DROP TABLE IF EXISTS `agent_livechat_activities`;
CREATE TABLE `agent_livechat_activities` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `manid` varchar(20) CHARACTER SET latin1 NOT NULL,
  `submitdate` datetime NOT NULL,
  `agentid` varchar(15) CHARACTER SET latin1 NOT NULL,
  `womanid` varchar(20) CHARACTER SET latin1 NOT NULL,
  `freechat_time` datetime NOT NULL,
  `surplus_day` tinyint(1) NOT NULL DEFAULT '7',
  `credits` decimal(7,2) NOT NULL,
  `credits_day` decimal(7,2) unsigned NOT NULL,
  `first_emf` varchar(20) CHARACTER SET latin1 NOT NULL,
  `update_time` datetime NOT NULL,
  `adddate` datetime NOT NULL,
  `inviteid` varchar(32) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`,`womanid`),
  KEY `manid` (`manid`)
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `agent_livechat_activities_stats`
-- ----------------------------
DROP TABLE IF EXISTS `agent_livechat_activities_stats`;
CREATE TABLE `agent_livechat_activities_stats` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `stats_date` date NOT NULL,
  `surplus_num` int(10) NOT NULL,
  `surplus_manid_num` int(10) unsigned NOT NULL,
  `surplus_credits_num` int(10) NOT NULL,
  `surplus_credits` decimal(10,2) NOT NULL,
  `agent_credits` decimal(10,2) NOT NULL,
  `adddate` datetime NOT NULL,
  `agentid` varchar(15) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stats_date` (`stats_date`),
  KEY `agentid` (`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `agent_login`
-- ----------------------------
DROP TABLE IF EXISTS `agent_login`;
CREATE TABLE `agent_login` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `agent` varchar(10) NOT NULL DEFAULT '',
  `cookie` varchar(200) NOT NULL DEFAULT '',
  `decode` varchar(200) NOT NULL DEFAULT '',
  `status` enum('Y','N') NOT NULL DEFAULT 'N',
  `timeout` varchar(20) NOT NULL DEFAULT '',
  `loginip` varchar(25) NOT NULL DEFAULT '',
  `staff_id` varchar(20) NOT NULL DEFAULT '',
  `login_page` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `decode` (`decode`)
) ENGINE=MyISAM AUTO_INCREMENT=2411120 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `agent_login_monitor`
-- ----------------------------
DROP TABLE IF EXISTS `agent_login_monitor`;
CREATE TABLE `agent_login_monitor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stats_date` date NOT NULL,
  `authorid` varchar(12) NOT NULL,
  `agentid` varchar(12) NOT NULL,
  `authorized_pc_num` int(1) unsigned NOT NULL,
  `normal_staff_num` int(1) unsigned NOT NULL,
  `credits` decimal(8,2) unsigned NOT NULL,
  `daily_mean_login_num` int(1) unsigned NOT NULL,
  `login_ip_num` int(1) unsigned NOT NULL,
  `login_ip_city_num` int(1) unsigned NOT NULL,
  `login_staff_num` int(1) unsigned NOT NULL,
  `new_authorized_pc_num` int(1) unsigned NOT NULL,
  `new_authorized_pc_rejected_num` int(1) unsigned NOT NULL,
  `use_authorized_pc_rejected_num` int(1) unsigned NOT NULL,
  `agent_authorized_pc_close_num` int(1) unsigned NOT NULL,
  `addtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stats_date` (`stats_date`,`agentid`,`authorid`)
) ENGINE=MyISAM AUTO_INCREMENT=349 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `agent_punish1`
-- ----------------------------
DROP TABLE IF EXISTS `agent_punish1`;
CREATE TABLE `agent_punish1` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `punish_no` varchar(20) NOT NULL,
  `punish_date` date NOT NULL,
  `period_id` int(5) unsigned NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `womanid` varchar(12) NOT NULL,
  `punish_reason` varchar(100) NOT NULL,
  `req_dept` varchar(10) NOT NULL,
  `req_person` varchar(50) NOT NULL,
  `deduct_eval` int(4) NOT NULL,
  `deduct_credit` int(4) NOT NULL,
  `history_id` varchar(10) NOT NULL,
  `approved_no` varchar(30) NOT NULL,
  `approved_file` varchar(50) NOT NULL,
  `addtime` datetime NOT NULL,
  `addby_staffid` varchar(10) DEFAULT '',
  `addby_staffname` varchar(50) DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `agent_visible` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `punish_no` (`punish_no`),
  KEY `punish_date` (`punish_date`,`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `agent_punish2`
-- ----------------------------
DROP TABLE IF EXISTS `agent_punish2`;
CREATE TABLE `agent_punish2` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `punish_no` varchar(20) NOT NULL,
  `crime_desc` text NOT NULL,
  `punish_detail` text NOT NULL,
  `remark` text NOT NULL,
  `logtxt` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `punish_no` (`punish_no`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `agent_rate`
-- ----------------------------
DROP TABLE IF EXISTS `agent_rate`;
CREATE TABLE `agent_rate` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `agentid` varchar(20) NOT NULL,
  `enname` varchar(200) NOT NULL,
  `location` varchar(200) NOT NULL DEFAULT '',
  `join_date` date NOT NULL,
  `token` varchar(50) NOT NULL,
  `emf_score` varchar(30) NOT NULL,
  `fbscore_3m` varchar(30) NOT NULL,
  `fbscore_6m` varchar(30) NOT NULL,
  `fbscore_12m` varchar(30) NOT NULL,
  `lastupdate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=144 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `agent_rate_demo`
-- ----------------------------
DROP TABLE IF EXISTS `agent_rate_demo`;
CREATE TABLE `agent_rate_demo` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `agentid` varchar(20) NOT NULL,
  `enname` varchar(200) NOT NULL,
  `location` varchar(200) NOT NULL DEFAULT '',
  `join_date` date NOT NULL,
  `token` varchar(50) NOT NULL,
  `emf_score` varchar(30) NOT NULL,
  `fbscore_3m` varchar(30) NOT NULL,
  `fbscore_6m` varchar(30) NOT NULL,
  `fbscore_12m` varchar(30) NOT NULL,
  `lastupdate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=193 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `agent_staff_gzl_detail`
-- ----------------------------
DROP TABLE IF EXISTS `agent_staff_gzl_detail`;
CREATE TABLE `agent_staff_gzl_detail` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `staffid` varchar(20) NOT NULL,
  `staffname` varchar(40) NOT NULL DEFAULT '',
  `agentid` varchar(10) NOT NULL DEFAULT '',
  `adddate` datetime NOT NULL,
  `ref_id` varchar(50) NOT NULL DEFAULT '',
  `ref_date` datetime NOT NULL,
  `classify` tinyint(2) NOT NULL,
  `flag` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `staffid` (`agentid`,`staffid`)
) ENGINE=MyISAM AUTO_INCREMENT=3111397 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `agent_staff_gzl_stats`
-- ----------------------------
DROP TABLE IF EXISTS `agent_staff_gzl_stats`;
CREATE TABLE `agent_staff_gzl_stats` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `sdate` date NOT NULL,
  `agentid` varchar(12) NOT NULL,
  `staffid` varchar(20) NOT NULL,
  `staffname` varchar(40) NOT NULL DEFAULT '',
  `admire_submit` int(11) NOT NULL,
  `man_reply_cupid` int(11) NOT NULL,
  `man_reply_admire` int(11) NOT NULL,
  `emf_wm` int(11) NOT NULL,
  `emf_mw1` int(11) NOT NULL,
  `emf_mw2` int(11) NOT NULL,
  `emf_mw3` int(11) NOT NULL,
  `lady_reply_cupid` int(11) NOT NULL,
  `adddate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`,`staffid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `agent_vote_detail`
-- ----------------------------
DROP TABLE IF EXISTS `agent_vote_detail`;
CREATE TABLE `agent_vote_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `q1` tinyint(3) NOT NULL,
  `q2` tinyint(3) NOT NULL,
  `q3` tinyint(3) NOT NULL,
  `q4` tinyint(3) NOT NULL,
  `q5` tinyint(3) NOT NULL,
  `q6` tinyint(3) NOT NULL,
  `q7` tinyint(3) NOT NULL,
  `q8` tinyint(3) NOT NULL,
  `q9` tinyint(3) NOT NULL,
  `q10` tinyint(3) NOT NULL,
  `note` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1857 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `agent_vote_main`
-- ----------------------------
DROP TABLE IF EXISTS `agent_vote_main`;
CREATE TABLE `agent_vote_main` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `smonth` date NOT NULL,
  `agent` varchar(10) NOT NULL,
  `company` varchar(150) NOT NULL DEFAULT '',
  `agt_staffid` varchar(15) NOT NULL,
  `agt_staffsubmit` varchar(20) NOT NULL,
  `agt_staffname` varchar(30) NOT NULL DEFAULT '',
  `agt_staffphone` varchar(50) NOT NULL DEFAULT '',
  `chn_staffid` varchar(15) NOT NULL,
  `chn_staffname` varchar(30) NOT NULL DEFAULT '',
  `chn_staffen` varchar(20) NOT NULL,
  `score` tinyint(4) NOT NULL,
  `secscore` varchar(100) NOT NULL,
  `adddate` datetime NOT NULL,
  `votedate` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `comment` varchar(750) NOT NULL DEFAULT '',
  `daterange` varchar(40) NOT NULL,
  `display` char(1) NOT NULL DEFAULT 'Y',
  `ques_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `agent` (`agent`)
) ENGINE=MyISAM AUTO_INCREMENT=1857 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `agent_vote_ques`
-- ----------------------------
DROP TABLE IF EXISTS `agent_vote_ques`;
CREATE TABLE `agent_vote_ques` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `adddate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `agent_web`
-- ----------------------------
DROP TABLE IF EXISTS `agent_web`;
CREATE TABLE `agent_web` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `agentid` varchar(20) NOT NULL DEFAULT '',
  `status` char(1) NOT NULL DEFAULT 'Y',
  `company` varchar(350) NOT NULL DEFAULT '',
  `web_id` varchar(20) NOT NULL DEFAULT '',
  `web_top` text NOT NULL,
  `web_end` text NOT NULL,
  `web_contact` text NOT NULL,
  `domain` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `web_id` (`web_id`)
) ENGINE=MyISAM AUTO_INCREMENT=264 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `agent_web_demo`
-- ----------------------------
DROP TABLE IF EXISTS `agent_web_demo`;
CREATE TABLE `agent_web_demo` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `agentid` varchar(20) NOT NULL DEFAULT '',
  `status` char(1) NOT NULL DEFAULT 'Y',
  `company` varchar(350) NOT NULL DEFAULT '',
  `web_id` varchar(20) NOT NULL DEFAULT '',
  `web_top` text NOT NULL,
  `web_end` text NOT NULL,
  `web_contact` text NOT NULL,
  `domain` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `web_id` (`web_id`)
) ENGINE=MyISAM AUTO_INCREMENT=313 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ammsg01_1m`
-- ----------------------------
DROP TABLE IF EXISTS `ammsg01_1m`;
CREATE TABLE `ammsg01_1m` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `womanid` varchar(20) NOT NULL DEFAULT '',
  `womanname` varchar(50) NOT NULL DEFAULT '',
  `manid` varchar(20) NOT NULL DEFAULT '',
  `manname` varchar(40) NOT NULL DEFAULT '',
  `submit_date` datetime NOT NULL,
  `sent_date` datetime NOT NULL,
  `readflag` char(1) NOT NULL DEFAULT '',
  `replyflag` char(1) NOT NULL DEFAULT '',
  `hideflag` char(1) NOT NULL DEFAULT '',
  `agent` varchar(12) NOT NULL DEFAULT '',
  `agent_staff` varchar(35) NOT NULL DEFAULT '',
  `resubmit` char(1) NOT NULL DEFAULT '',
  `sendflag` char(1) NOT NULL DEFAULT '',
  `replyid` varchar(16) NOT NULL DEFAULT '',
  `form_no` varchar(20) NOT NULL,
  `deleted` char(1) NOT NULL DEFAULT 'N',
  `readdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_staff` varchar(30) NOT NULL DEFAULT '',
  `review_trans` varchar(20) NOT NULL DEFAULT '',
  `deduction` smallint(1) NOT NULL DEFAULT '0',
  `review_mode` smallint(1) NOT NULL DEFAULT '0',
  `dc_date` datetime NOT NULL,
  `attachnum` tinyint(1) NOT NULL,
  `attitude` tinyint(1) NOT NULL,
  `sendmode` tinyint(1) NOT NULL,
  `template_id` varchar(20) NOT NULL,
  `groupid` varchar(10) NOT NULL,
  `template_type` char(1) NOT NULL DEFAULT 'A',
  `vg_id` varchar(10) NOT NULL,
  `rmd_woman` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_assistant` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`),
  KEY `sent_date` (`sent_date`),
  KEY `submit_date` (`submit_date`,`manid`(10),`hideflag`),
  KEY `womanid` (`womanid`,`submit_date`),
  KEY `agent` (`agent`,`sendflag`,`hideflag`),
  KEY `agentid` (`agent`,`agent_staff`),
  KEY `template_type` (`template_type`),
  KEY `is_assistant` (`is_assistant`)
) ENGINE=MRG_MyISAM DEFAULT CHARSET=utf8 INSERT_METHOD=LAST UNION=(`ammsg01_201402`,`ammsg01_201403`);

-- ----------------------------
--  Table structure for `ammsg01_201312`
-- ----------------------------
DROP TABLE IF EXISTS `ammsg01_201312`;
CREATE TABLE `ammsg01_201312` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `womanid` varchar(20) NOT NULL DEFAULT '',
  `womanname` varchar(50) NOT NULL DEFAULT '',
  `manid` varchar(20) NOT NULL DEFAULT '',
  `manname` varchar(40) NOT NULL DEFAULT '',
  `submit_date` datetime NOT NULL,
  `sent_date` datetime NOT NULL,
  `readflag` char(1) NOT NULL DEFAULT '',
  `replyflag` char(1) NOT NULL DEFAULT '',
  `hideflag` char(1) NOT NULL DEFAULT '',
  `agent` varchar(12) NOT NULL DEFAULT '',
  `agent_staff` varchar(35) NOT NULL DEFAULT '',
  `resubmit` char(1) NOT NULL DEFAULT '',
  `sendflag` char(1) NOT NULL DEFAULT '',
  `replyid` varchar(16) NOT NULL DEFAULT '',
  `form_no` varchar(20) NOT NULL,
  `deleted` char(1) NOT NULL DEFAULT 'N',
  `readdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_staff` varchar(30) NOT NULL DEFAULT '',
  `review_trans` varchar(20) NOT NULL DEFAULT '',
  `deduction` smallint(1) NOT NULL DEFAULT '0',
  `review_mode` smallint(1) NOT NULL DEFAULT '0',
  `dc_date` datetime NOT NULL,
  `attachnum` tinyint(1) NOT NULL,
  `attitude` tinyint(1) NOT NULL,
  `sendmode` tinyint(1) NOT NULL,
  `template_id` varchar(20) NOT NULL,
  `groupid` varchar(10) NOT NULL,
  `template_type` char(1) NOT NULL DEFAULT 'A',
  `vg_id` varchar(10) NOT NULL,
  `rmd_woman` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_assistant` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`),
  KEY `sent_date` (`sent_date`),
  KEY `submit_date` (`submit_date`,`manid`(10),`hideflag`),
  KEY `womanid` (`womanid`,`submit_date`),
  KEY `agent` (`agent`,`sendflag`,`hideflag`),
  KEY `agentid` (`agent`,`agent_staff`),
  KEY `template_type` (`template_type`),
  KEY `is_assistant` (`is_assistant`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='admimier 201403';

-- ----------------------------
--  Table structure for `ammsg01_201401`
-- ----------------------------
DROP TABLE IF EXISTS `ammsg01_201401`;
CREATE TABLE `ammsg01_201401` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `womanid` varchar(20) NOT NULL DEFAULT '',
  `womanname` varchar(50) NOT NULL DEFAULT '',
  `manid` varchar(20) NOT NULL DEFAULT '',
  `manname` varchar(40) NOT NULL DEFAULT '',
  `submit_date` datetime NOT NULL,
  `sent_date` datetime NOT NULL,
  `readflag` char(1) NOT NULL DEFAULT '',
  `replyflag` char(1) NOT NULL DEFAULT '',
  `hideflag` char(1) NOT NULL DEFAULT '',
  `agent` varchar(12) NOT NULL DEFAULT '',
  `agent_staff` varchar(35) NOT NULL DEFAULT '',
  `resubmit` char(1) NOT NULL DEFAULT '',
  `sendflag` char(1) NOT NULL DEFAULT '',
  `replyid` varchar(16) NOT NULL DEFAULT '',
  `form_no` varchar(20) NOT NULL,
  `deleted` char(1) NOT NULL DEFAULT 'N',
  `readdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_staff` varchar(30) NOT NULL DEFAULT '',
  `review_trans` varchar(20) NOT NULL DEFAULT '',
  `deduction` smallint(1) NOT NULL DEFAULT '0',
  `review_mode` smallint(1) NOT NULL DEFAULT '0',
  `dc_date` datetime NOT NULL,
  `attachnum` tinyint(1) NOT NULL,
  `attitude` tinyint(1) NOT NULL,
  `sendmode` tinyint(1) NOT NULL,
  `template_id` varchar(20) NOT NULL,
  `groupid` varchar(10) NOT NULL,
  `template_type` char(1) NOT NULL DEFAULT 'A',
  `vg_id` varchar(10) NOT NULL,
  `rmd_woman` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_assistant` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`),
  KEY `sent_date` (`sent_date`),
  KEY `submit_date` (`submit_date`,`manid`(10),`hideflag`),
  KEY `womanid` (`womanid`,`submit_date`),
  KEY `agent` (`agent`,`sendflag`,`hideflag`),
  KEY `agentid` (`agent`,`agent_staff`),
  KEY `template_type` (`template_type`),
  KEY `is_assistant` (`is_assistant`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='admimier 201403';

-- ----------------------------
--  Table structure for `ammsg01_201402`
-- ----------------------------
DROP TABLE IF EXISTS `ammsg01_201402`;
CREATE TABLE `ammsg01_201402` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `womanid` varchar(20) NOT NULL DEFAULT '',
  `womanname` varchar(50) NOT NULL DEFAULT '',
  `manid` varchar(20) NOT NULL DEFAULT '',
  `manname` varchar(40) NOT NULL DEFAULT '',
  `submit_date` datetime NOT NULL,
  `sent_date` datetime NOT NULL,
  `readflag` char(1) NOT NULL DEFAULT '',
  `replyflag` char(1) NOT NULL DEFAULT '',
  `hideflag` char(1) NOT NULL DEFAULT '',
  `agent` varchar(12) NOT NULL DEFAULT '',
  `agent_staff` varchar(35) NOT NULL DEFAULT '',
  `resubmit` char(1) NOT NULL DEFAULT '',
  `sendflag` char(1) NOT NULL DEFAULT '',
  `replyid` varchar(16) NOT NULL DEFAULT '',
  `form_no` varchar(20) NOT NULL,
  `deleted` char(1) NOT NULL DEFAULT 'N',
  `readdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_staff` varchar(30) NOT NULL DEFAULT '',
  `review_trans` varchar(20) NOT NULL DEFAULT '',
  `deduction` smallint(1) NOT NULL DEFAULT '0',
  `review_mode` smallint(1) NOT NULL DEFAULT '0',
  `dc_date` datetime NOT NULL,
  `attachnum` tinyint(1) NOT NULL,
  `attitude` tinyint(1) NOT NULL,
  `sendmode` tinyint(1) NOT NULL,
  `template_id` varchar(20) NOT NULL,
  `groupid` varchar(10) NOT NULL,
  `template_type` char(1) NOT NULL DEFAULT 'A',
  `vg_id` varchar(10) NOT NULL,
  `rmd_woman` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_assistant` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`),
  KEY `sent_date` (`sent_date`),
  KEY `submit_date` (`submit_date`,`manid`(10),`hideflag`),
  KEY `womanid` (`womanid`,`submit_date`),
  KEY `agent` (`agent`,`sendflag`,`hideflag`),
  KEY `agentid` (`agent`,`agent_staff`),
  KEY `template_type` (`template_type`),
  KEY `is_assistant` (`is_assistant`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='admimier 201403';

-- ----------------------------
--  Table structure for `ammsg01_201403`
-- ----------------------------
DROP TABLE IF EXISTS `ammsg01_201403`;
CREATE TABLE `ammsg01_201403` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `womanid` varchar(20) NOT NULL DEFAULT '',
  `womanname` varchar(50) NOT NULL DEFAULT '',
  `manid` varchar(20) NOT NULL DEFAULT '',
  `manname` varchar(40) NOT NULL DEFAULT '',
  `submit_date` datetime NOT NULL,
  `sent_date` datetime NOT NULL,
  `readflag` char(1) NOT NULL DEFAULT '',
  `replyflag` char(1) NOT NULL DEFAULT '',
  `hideflag` char(1) NOT NULL DEFAULT '',
  `agent` varchar(12) NOT NULL DEFAULT '',
  `agent_staff` varchar(35) NOT NULL DEFAULT '',
  `resubmit` char(1) NOT NULL DEFAULT '',
  `sendflag` char(1) NOT NULL DEFAULT '',
  `replyid` varchar(16) NOT NULL DEFAULT '',
  `form_no` varchar(20) NOT NULL,
  `deleted` char(1) NOT NULL DEFAULT 'N',
  `readdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_staff` varchar(30) NOT NULL DEFAULT '',
  `review_trans` varchar(20) NOT NULL DEFAULT '',
  `deduction` smallint(1) NOT NULL DEFAULT '0',
  `review_mode` smallint(1) NOT NULL DEFAULT '0',
  `dc_date` datetime NOT NULL,
  `attachnum` tinyint(1) NOT NULL,
  `attitude` tinyint(1) NOT NULL,
  `sendmode` tinyint(1) NOT NULL,
  `template_id` varchar(20) NOT NULL,
  `groupid` varchar(10) NOT NULL,
  `template_type` char(1) NOT NULL DEFAULT 'A',
  `vg_id` varchar(10) NOT NULL,
  `rmd_woman` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_assistant` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`),
  KEY `sent_date` (`sent_date`),
  KEY `submit_date` (`submit_date`,`manid`(10),`hideflag`),
  KEY `womanid` (`womanid`,`submit_date`),
  KEY `agent` (`agent`,`sendflag`,`hideflag`),
  KEY `agentid` (`agent`,`agent_staff`),
  KEY `template_type` (`template_type`),
  KEY `is_assistant` (`is_assistant`)
) ENGINE=MyISAM AUTO_INCREMENT=17575357 DEFAULT CHARSET=utf8 COMMENT='admimier 201403';

-- ----------------------------
--  Table structure for `ammsg01_3m`
-- ----------------------------
DROP TABLE IF EXISTS `ammsg01_3m`;
CREATE TABLE `ammsg01_3m` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `womanid` varchar(20) NOT NULL DEFAULT '',
  `womanname` varchar(50) NOT NULL DEFAULT '',
  `manid` varchar(20) NOT NULL DEFAULT '',
  `manname` varchar(40) NOT NULL DEFAULT '',
  `submit_date` datetime NOT NULL,
  `sent_date` datetime NOT NULL,
  `readflag` char(1) NOT NULL DEFAULT '',
  `replyflag` char(1) NOT NULL DEFAULT '',
  `hideflag` char(1) NOT NULL DEFAULT '',
  `agent` varchar(12) NOT NULL DEFAULT '',
  `agent_staff` varchar(35) NOT NULL DEFAULT '',
  `resubmit` char(1) NOT NULL DEFAULT '',
  `sendflag` char(1) NOT NULL DEFAULT '',
  `replyid` varchar(16) NOT NULL DEFAULT '',
  `form_no` varchar(20) NOT NULL,
  `deleted` char(1) NOT NULL DEFAULT 'N',
  `readdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_staff` varchar(30) NOT NULL DEFAULT '',
  `review_trans` varchar(20) NOT NULL DEFAULT '',
  `deduction` smallint(1) NOT NULL DEFAULT '0',
  `review_mode` smallint(1) NOT NULL DEFAULT '0',
  `dc_date` datetime NOT NULL,
  `attachnum` tinyint(1) NOT NULL,
  `attitude` tinyint(1) NOT NULL,
  `sendmode` tinyint(1) NOT NULL,
  `template_id` varchar(20) NOT NULL,
  `groupid` varchar(10) NOT NULL,
  `template_type` char(1) NOT NULL DEFAULT 'A',
  `vg_id` varchar(10) NOT NULL,
  `rmd_woman` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_assistant` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`),
  KEY `sent_date` (`sent_date`),
  KEY `submit_date` (`submit_date`,`manid`(10),`hideflag`),
  KEY `womanid` (`womanid`,`submit_date`),
  KEY `agent` (`agent`,`sendflag`,`hideflag`),
  KEY `agentid` (`agent`,`agent_staff`),
  KEY `template_type` (`template_type`),
  KEY `is_assistant` (`is_assistant`)
) ENGINE=MRG_MyISAM DEFAULT CHARSET=utf8 INSERT_METHOD=LAST UNION=(`ammsg01_201312`,`ammsg01_201401`,`ammsg01_201402`,`ammsg01_201403`);

-- ----------------------------
--  Table structure for `ammsg01_new`
-- ----------------------------
DROP TABLE IF EXISTS `ammsg01_new`;
CREATE TABLE `ammsg01_new` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `womanid` varchar(20) NOT NULL DEFAULT '',
  `womanname` varchar(50) NOT NULL DEFAULT '',
  `manid` varchar(20) NOT NULL DEFAULT '',
  `manname` varchar(40) NOT NULL DEFAULT '',
  `submit_date` datetime NOT NULL,
  `sent_date` datetime NOT NULL,
  `readflag` char(1) NOT NULL DEFAULT '',
  `replyflag` char(1) NOT NULL DEFAULT '',
  `hideflag` char(1) NOT NULL DEFAULT '',
  `agent` varchar(12) NOT NULL DEFAULT '',
  `agent_staff` varchar(35) NOT NULL DEFAULT '',
  `resubmit` char(1) NOT NULL DEFAULT '',
  `sendflag` char(1) NOT NULL DEFAULT '',
  `replyid` varchar(16) NOT NULL DEFAULT '',
  `form_no` varchar(20) NOT NULL,
  `deleted` char(1) NOT NULL DEFAULT 'N',
  `readdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_staff` varchar(30) NOT NULL DEFAULT '',
  `review_trans` varchar(20) NOT NULL DEFAULT '',
  `deduction` smallint(1) NOT NULL DEFAULT '0',
  `review_mode` smallint(1) NOT NULL DEFAULT '0',
  `dc_date` datetime NOT NULL,
  `attachnum` tinyint(1) NOT NULL,
  `attitude` tinyint(1) NOT NULL,
  `sendmode` tinyint(1) NOT NULL,
  `template_id` varchar(20) NOT NULL,
  `groupid` varchar(10) NOT NULL,
  `template_type` char(1) NOT NULL DEFAULT 'A',
  `vg_id` varchar(10) NOT NULL,
  `rmd_woman` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_assistant` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`),
  KEY `sent_date` (`sent_date`),
  KEY `submit_date` (`submit_date`,`manid`(10),`hideflag`),
  KEY `womanid` (`womanid`,`submit_date`),
  KEY `agent` (`agent`,`sendflag`,`hideflag`),
  KEY `agentid` (`agent`,`agent_staff`),
  KEY `template_type` (`template_type`),
  KEY `is_assistant` (`is_assistant`)
) ENGINE=MRG_MyISAM DEFAULT CHARSET=utf8 INSERT_METHOD=LAST UNION=(`ammsg01_unsend`,`ammsg01_201312`,`ammsg01_201401`,`ammsg01_201402`,`ammsg01_201403`);

-- ----------------------------
--  Table structure for `ammsg01_unsend`
-- ----------------------------
DROP TABLE IF EXISTS `ammsg01_unsend`;
CREATE TABLE `ammsg01_unsend` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `womanid` varchar(20) NOT NULL DEFAULT '',
  `womanname` varchar(50) NOT NULL DEFAULT '',
  `manid` varchar(20) NOT NULL DEFAULT '',
  `manname` varchar(40) NOT NULL DEFAULT '',
  `submit_date` datetime NOT NULL,
  `sent_date` datetime NOT NULL,
  `readflag` char(1) NOT NULL DEFAULT '',
  `replyflag` char(1) NOT NULL DEFAULT '',
  `hideflag` char(1) NOT NULL DEFAULT '',
  `agent` varchar(12) NOT NULL DEFAULT '',
  `agent_staff` varchar(35) NOT NULL DEFAULT '',
  `resubmit` char(1) NOT NULL DEFAULT '',
  `sendflag` char(1) NOT NULL DEFAULT '',
  `replyid` varchar(16) NOT NULL DEFAULT '',
  `form_no` varchar(20) NOT NULL,
  `deleted` char(1) NOT NULL DEFAULT 'N',
  `readdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_staff` varchar(30) NOT NULL DEFAULT '',
  `review_trans` varchar(20) NOT NULL DEFAULT '',
  `deduction` smallint(1) NOT NULL DEFAULT '0',
  `review_mode` smallint(1) NOT NULL DEFAULT '0',
  `dc_date` datetime NOT NULL,
  `attachnum` tinyint(1) NOT NULL,
  `attitude` tinyint(1) NOT NULL,
  `sendmode` tinyint(1) NOT NULL,
  `template_id` varchar(20) NOT NULL,
  `groupid` varchar(10) NOT NULL,
  `template_type` char(1) NOT NULL DEFAULT 'A',
  `vg_id` varchar(10) NOT NULL,
  `rmd_woman` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_assistant` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`),
  KEY `sent_date` (`sent_date`),
  KEY `submit_date` (`submit_date`,`manid`(10),`hideflag`),
  KEY `womanid` (`womanid`,`submit_date`),
  KEY `agent` (`agent`,`sendflag`,`hideflag`),
  KEY `agentid` (`agent`,`agent_staff`),
  KEY `template_type` (`template_type`),
  KEY `is_assistant` (`is_assistant`)
) ENGINE=MyISAM AUTO_INCREMENT=17575117 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ammsg02_1m`
-- ----------------------------
DROP TABLE IF EXISTS `ammsg02_1m`;
CREATE TABLE `ammsg02_1m` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `body` text,
  `reviewer` varchar(30) NOT NULL DEFAULT '',
  `lady_tel` varchar(60) DEFAULT NULL,
  `denyreason` text,
  `review_history` text,
  `ip` varchar(20) DEFAULT NULL,
  `computerid` varchar(10) DEFAULT NULL,
  `review_comm` text,
  `reviewer_trans` varchar(30) NOT NULL DEFAULT '',
  `attachment` varchar(170) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MRG_MyISAM DEFAULT CHARSET=utf8 INSERT_METHOD=LAST UNION=(`ammsg02_201402`,`ammsg02_201403`);

-- ----------------------------
--  Table structure for `ammsg02_201312`
-- ----------------------------
DROP TABLE IF EXISTS `ammsg02_201312`;
CREATE TABLE `ammsg02_201312` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `body` text,
  `reviewer` varchar(30) NOT NULL DEFAULT '',
  `lady_tel` varchar(60) DEFAULT NULL,
  `denyreason` text,
  `review_history` text,
  `ip` varchar(20) DEFAULT NULL,
  `computerid` varchar(10) DEFAULT NULL,
  `review_comm` text,
  `reviewer_trans` varchar(30) NOT NULL DEFAULT '',
  `attachment` varchar(170) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ammsg02_201401`
-- ----------------------------
DROP TABLE IF EXISTS `ammsg02_201401`;
CREATE TABLE `ammsg02_201401` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `body` text,
  `reviewer` varchar(30) NOT NULL DEFAULT '',
  `lady_tel` varchar(60) DEFAULT NULL,
  `denyreason` text,
  `review_history` text,
  `ip` varchar(20) DEFAULT NULL,
  `computerid` varchar(10) DEFAULT NULL,
  `review_comm` text,
  `reviewer_trans` varchar(30) NOT NULL DEFAULT '',
  `attachment` varchar(170) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ammsg02_201402`
-- ----------------------------
DROP TABLE IF EXISTS `ammsg02_201402`;
CREATE TABLE `ammsg02_201402` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `body` text,
  `reviewer` varchar(30) NOT NULL DEFAULT '',
  `lady_tel` varchar(60) DEFAULT NULL,
  `denyreason` text,
  `review_history` text,
  `ip` varchar(20) DEFAULT NULL,
  `computerid` varchar(10) DEFAULT NULL,
  `review_comm` text,
  `reviewer_trans` varchar(30) NOT NULL DEFAULT '',
  `attachment` varchar(170) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ammsg02_201403`
-- ----------------------------
DROP TABLE IF EXISTS `ammsg02_201403`;
CREATE TABLE `ammsg02_201403` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `body` text,
  `reviewer` varchar(30) NOT NULL DEFAULT '',
  `lady_tel` varchar(60) DEFAULT NULL,
  `denyreason` text,
  `review_history` text,
  `ip` varchar(20) DEFAULT NULL,
  `computerid` varchar(10) DEFAULT NULL,
  `review_comm` text,
  `reviewer_trans` varchar(30) NOT NULL DEFAULT '',
  `attachment` varchar(170) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17575357 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ammsg02_3m`
-- ----------------------------
DROP TABLE IF EXISTS `ammsg02_3m`;
CREATE TABLE `ammsg02_3m` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `body` text,
  `reviewer` varchar(30) NOT NULL DEFAULT '',
  `lady_tel` varchar(60) DEFAULT NULL,
  `denyreason` text,
  `review_history` text,
  `ip` varchar(20) DEFAULT NULL,
  `computerid` varchar(10) DEFAULT NULL,
  `review_comm` text,
  `reviewer_trans` varchar(30) NOT NULL DEFAULT '',
  `attachment` varchar(170) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MRG_MyISAM DEFAULT CHARSET=utf8 INSERT_METHOD=LAST UNION=(`ammsg02_201312`,`ammsg02_201401`,`ammsg02_201402`,`ammsg02_201403`);

-- ----------------------------
--  Table structure for `ammsg02_new`
-- ----------------------------
DROP TABLE IF EXISTS `ammsg02_new`;
CREATE TABLE `ammsg02_new` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `body` text,
  `reviewer` varchar(30) NOT NULL DEFAULT '',
  `lady_tel` varchar(60) DEFAULT NULL,
  `denyreason` text,
  `review_history` text,
  `ip` varchar(20) DEFAULT NULL,
  `computerid` varchar(10) DEFAULT NULL,
  `review_comm` text,
  `reviewer_trans` varchar(30) NOT NULL DEFAULT '',
  `attachment` varchar(170) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MRG_MyISAM DEFAULT CHARSET=utf8 INSERT_METHOD=LAST UNION=(`ammsg02_unsend`,`ammsg02_201312`,`ammsg02_201401`,`ammsg02_201402`,`ammsg02_201403`);

-- ----------------------------
--  Table structure for `ammsg02_unsend`
-- ----------------------------
DROP TABLE IF EXISTS `ammsg02_unsend`;
CREATE TABLE `ammsg02_unsend` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `body` text,
  `reviewer` varchar(30) NOT NULL DEFAULT '',
  `lady_tel` varchar(60) DEFAULT NULL,
  `denyreason` text,
  `review_history` text,
  `ip` varchar(20) DEFAULT NULL,
  `computerid` varchar(10) DEFAULT NULL,
  `review_comm` text,
  `reviewer_trans` varchar(30) NOT NULL DEFAULT '',
  `attachment` varchar(170) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17575117 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ammsg_dc`
-- ----------------------------
DROP TABLE IF EXISTS `ammsg_dc`;
CREATE TABLE `ammsg_dc` (
  `ammsgid` int(8) unsigned NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `dc_reason` varchar(200) NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`ammsgid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `bandwidth`
-- ----------------------------
DROP TABLE IF EXISTS `bandwidth`;
CREATE TABLE `bandwidth` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) NOT NULL DEFAULT '',
  `country` varchar(10) NOT NULL DEFAULT '',
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `filesize` int(10) NOT NULL DEFAULT '0',
  `spentime` float(12,3) NOT NULL DEFAULT '0.000',
  `kbps` float(12,3) NOT NULL DEFAULT '0.000',
  `kbs` float(12,3) NOT NULL DEFAULT '0.000',
  PRIMARY KEY (`id`),
  KEY `adddate` (`adddate`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `bg_sign`
-- ----------------------------
DROP TABLE IF EXISTS `bg_sign`;
CREATE TABLE `bg_sign` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `signid` varchar(50) NOT NULL DEFAULT '',
  `manid` varchar(20) NOT NULL DEFAULT '',
  `womanid` varchar(20) NOT NULL DEFAULT '',
  `agentid` varchar(20) NOT NULL DEFAULT '',
  `relationid` varchar(20) NOT NULL DEFAULT '',
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sign_date` date NOT NULL DEFAULT '0000-00-00',
  `sign_status` char(1) NOT NULL DEFAULT '',
  `sign_type` char(1) NOT NULL DEFAULT '',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `review` char(1) NOT NULL DEFAULT '',
  `comment` text NOT NULL,
  `other` varchar(100) NOT NULL DEFAULT '',
  `q1` char(1) NOT NULL DEFAULT '',
  `q2` char(1) NOT NULL DEFAULT '',
  `q2_1` char(1) NOT NULL DEFAULT '',
  `q3` char(1) NOT NULL DEFAULT '',
  `q3_1` text NOT NULL,
  `q4` char(1) NOT NULL DEFAULT '',
  `q4_1` text NOT NULL,
  `q5` char(1) NOT NULL DEFAULT '',
  `q5_1` text NOT NULL,
  `q6` char(1) NOT NULL DEFAULT '',
  `q6_1` text NOT NULL,
  `q7` char(1) NOT NULL DEFAULT '',
  `q7_1` text NOT NULL,
  `q8` char(1) NOT NULL DEFAULT '',
  `q8_1` text NOT NULL,
  `q9` text NOT NULL,
  `q10` text NOT NULL,
  `firstname` varchar(50) NOT NULL DEFAULT '',
  `lastname` varchar(50) NOT NULL DEFAULT '',
  `city` varchar(50) NOT NULL DEFAULT '',
  `state` varchar(50) NOT NULL DEFAULT '',
  `zipcode` varchar(20) NOT NULL DEFAULT '',
  `reason` text NOT NULL,
  `staff` varchar(50) NOT NULL DEFAULT '',
  `uploaded` char(1) NOT NULL DEFAULT 'N',
  `update_history` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`,`womanid`),
  KEY `signid` (`signid`)
) ENGINE=MyISAM AUTO_INCREMENT=231370 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `black_country`
-- ----------------------------
DROP TABLE IF EXISTS `black_country`;
CREATE TABLE `black_country` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `code` char(2) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `status` char(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=477 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `blackwoman`
-- ----------------------------
DROP TABLE IF EXISTS `blackwoman`;
CREATE TABLE `blackwoman` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `womanid` varchar(12) NOT NULL DEFAULT '',
  `manid` varchar(12) NOT NULL DEFAULT '',
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `blockreason` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`),
  KEY `manid` (`manid`)
) ENGINE=MyISAM AUTO_INCREMENT=48492 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `chat_invite_expired_stats`
-- ----------------------------
DROP TABLE IF EXISTS `chat_invite_expired_stats`;
CREATE TABLE `chat_invite_expired_stats` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `stats_date` date NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `womanid` varchar(15) NOT NULL,
  `womanname` varchar(40) NOT NULL,
  `num` int(5) NOT NULL,
  `num_lady` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `stats_date` (`stats_date`,`agentid`,`womanid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `computer`
-- ----------------------------
DROP TABLE IF EXISTS `computer`;
CREATE TABLE `computer` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `authorid` varchar(12) NOT NULL,
  `agentid` varchar(10) NOT NULL DEFAULT '',
  `cpu_id` varchar(100) NOT NULL DEFAULT '',
  `disk_id` varchar(100) NOT NULL,
  `computer_id` varchar(20) NOT NULL DEFAULT '',
  `location1` varchar(150) NOT NULL DEFAULT '',
  `location2` varchar(150) NOT NULL DEFAULT '',
  `auth` enum('Y','N','P','D') NOT NULL DEFAULT 'Y',
  `auth_edit_time` datetime NOT NULL,
  `auth_final_operating` varchar(1) NOT NULL,
  `comment` text NOT NULL,
  `comment2` text NOT NULL,
  `manager` varchar(60) NOT NULL DEFAULT '',
  `telephone` varchar(50) NOT NULL DEFAULT '',
  `last_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `apply_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `approved_date` date NOT NULL DEFAULT '0000-00-00',
  `login_num` int(6) NOT NULL DEFAULT '0',
  `rcgz` char(1) NOT NULL DEFAULT 'Y',
  `nscx` char(1) NOT NULL DEFAULT 'Y',
  `update_history` text NOT NULL,
  `esl_history` text NOT NULL,
  `ip` varchar(32) NOT NULL,
  `ip_country` varchar(3) NOT NULL,
  `ip_isp` varchar(100) NOT NULL,
  `ip_region` varchar(100) NOT NULL,
  `ip_city` varchar(100) NOT NULL,
  `d_auth` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`),
  KEY `computer_id` (`computer_id`),
  KEY `agentid` (`authorid`,`agentid`),
  KEY `agentid_2` (`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=6238 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `contact`
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `womanid` varchar(12) NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `adddate` datetime NOT NULL,
  `status` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `index_bao` (`manid`,`womanid`,`agentid`,`status`)
) ENGINE=MyISAM AUTO_INCREMENT=170 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `contact_list`
-- ----------------------------
DROP TABLE IF EXISTS `contact_list`;
CREATE TABLE `contact_list` (
  `id` bigint(9) NOT NULL AUTO_INCREMENT,
  `manid` varchar(15) NOT NULL DEFAULT '',
  `womanid` varchar(15) NOT NULL DEFAULT '',
  `agentid` varchar(7) NOT NULL DEFAULT '',
  `first_service` varchar(30) NOT NULL DEFAULT '',
  `last_service` varchar(30) NOT NULL DEFAULT '',
  `expire_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_contact` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comments_id` int(9) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `consumed` char(1) NOT NULL DEFAULT 'N',
  `sendemf` int(6) NOT NULL DEFAULT '0',
  `sendemf_time1` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sendemf_time2` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reademf` int(6) NOT NULL DEFAULT '0',
  `reademf_time1` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reademf_time2` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `contactreq` int(6) NOT NULL DEFAULT '0',
  `contactreq_time1` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `contactreq_time2` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cupidnote` int(6) NOT NULL DEFAULT '0',
  `cupidnote_time1` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cupidnote_time2` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cupiddate` int(6) NOT NULL DEFAULT '0',
  `cupiddate_time1` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cupiddate_time2` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `bp` int(6) NOT NULL DEFAULT '0',
  `bp_time1` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `bp_time2` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `livechat` int(6) NOT NULL DEFAULT '0',
  `livechat_time1` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `livechat_time2` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `camshare` int(6) NOT NULL DEFAULT '0',
  `camshare_time1` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `camshare_time2` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `callconfirm` int(6) NOT NULL DEFAULT '0',
  `callconfirm_time1` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `callconfirm_time2` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `schedulecall` int(6) NOT NULL DEFAULT '0',
  `schedulecall_time1` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `schedulecall_time2` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `instantcall` int(6) NOT NULL DEFAULT '0',
  `instantcall_time1` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `instantcall_time2` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ladycallme` int(6) NOT NULL DEFAULT '0',
  `ladycallme_time1` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ladycallme_time2` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `videoshow` int(6) NOT NULL DEFAULT '0',
  `videoshow_time1` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `videoshow_time2` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `giftflower` int(6) NOT NULL DEFAULT '0',
  `giftflower_time1` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `giftflower_time2` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `vg_total` int(6) NOT NULL DEFAULT '0',
  `vg_mw` int(6) NOT NULL DEFAULT '0',
  `vg_mw_time1` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `vg_mw_time2` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `vg_wm` int(6) NOT NULL DEFAULT '0',
  `vg_wm_time1` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `vg_wm_time2` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `manid` (`manid`,`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `contact_request`
-- ----------------------------
DROP TABLE IF EXISTS `contact_request`;
CREATE TABLE `contact_request` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `reqid` varchar(20) NOT NULL,
  `submittime` datetime NOT NULL,
  `processtime` datetime NOT NULL,
  `firstview_time` datetime NOT NULL,
  `read_flag` char(1) NOT NULL DEFAULT 'N',
  `manid` varchar(15) NOT NULL,
  `manname` varchar(40) NOT NULL,
  `usmember` char(1) NOT NULL DEFAULT 'N',
  `womanid` varchar(20) NOT NULL,
  `womanname` varchar(40) NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `credit_deducte` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `credit_refund` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `manimbra` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `imbra_uptime` datetime NOT NULL,
  `request_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `nexttime_flag` char(1) NOT NULL DEFAULT 'Y',
  `item1` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `item2` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `item3` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `agent_credit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `opt_by` tinyint(1) NOT NULL DEFAULT '0',
  `opt1_id` varchar(10) NOT NULL,
  `opt1_name` varchar(20) NOT NULL,
  `opt2_id` varchar(10) NOT NULL,
  `opt2_name` varchar(20) NOT NULL,
  `history_man` varchar(15) NOT NULL,
  `history_agent` varchar(15) NOT NULL,
  `reject_reason` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `remark_esh` text NOT NULL,
  `logtxt` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reqid` (`reqid`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `country`
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `country` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `credits_adjust`
-- ----------------------------
DROP TABLE IF EXISTS `credits_adjust`;
CREATE TABLE `credits_adjust` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `agentid` varchar(12) NOT NULL,
  `credits` int(7) NOT NULL,
  `staffid` varchar(20) NOT NULL,
  `staffname` varchar(40) NOT NULL,
  `adddate` datetime NOT NULL,
  `refid` varchar(30) NOT NULL,
  `flag` tinyint(1) NOT NULL DEFAULT '0',
  `siteid` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=2518 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `cs_email_new`
-- ----------------------------
DROP TABLE IF EXISTS `cs_email_new`;
CREATE TABLE `cs_email_new` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `topic` varchar(20) NOT NULL DEFAULT '',
  `email_id` varchar(20) NOT NULL DEFAULT '',
  `method` char(2) NOT NULL DEFAULT '',
  `staff` varchar(20) NOT NULL DEFAULT '',
  `staff_name` varchar(50) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `senddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `creator` varchar(255) NOT NULL DEFAULT '',
  `attachment` tinyint(1) NOT NULL DEFAULT '0',
  `remark` text NOT NULL,
  `readflag` char(1) NOT NULL DEFAULT 'N',
  `sendflag` char(1) NOT NULL DEFAULT 'N',
  `adddate` datetime NOT NULL,
  `viewdate` datetime NOT NULL,
  `senderinfo` varchar(100) NOT NULL,
  `readerip` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `topic` (`topic`),
  KEY `staff` (`staff`)
) ENGINE=MyISAM AUTO_INCREMENT=288336 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `cs_staff_logs`
-- ----------------------------
DROP TABLE IF EXISTS `cs_staff_logs`;
CREATE TABLE `cs_staff_logs` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '脳脭露炉卤脿潞脜',
  `topic` varchar(20) NOT NULL COMMENT '脢脗脧卯卤脿潞脜',
  `email_id` varchar(20) NOT NULL COMMENT '脫脢录镁ID',
  `senddate` datetime NOT NULL COMMENT '路垄鲁枚脢卤录盲',
  `category` tinyint(1) NOT NULL COMMENT '脢脗脧卯路脰脌脿',
  `relateto` tinyint(1) NOT NULL COMMENT '脡忙录掳露脭脧贸',
  `staff` varchar(12) NOT NULL COMMENT '脨脜录镁脠脣脭卤卤脿潞脜',
  `sender` varchar(12) NOT NULL COMMENT '路垄脨脜脠脣脭卤卤脿潞脜',
  PRIMARY KEY (`id`),
  KEY `staff` (`staff`)
) ENGINE=MyISAM AUTO_INCREMENT=119320 DEFAULT CHARSET=utf8 COMMENT='驴脥路镁脫脢录镁路垄脣脥录脟脗录';

-- ----------------------------
--  Table structure for `cs_staff_stats`
-- ----------------------------
DROP TABLE IF EXISTS `cs_staff_stats`;
CREATE TABLE `cs_staff_stats` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '脳脭露炉卤脿潞脜',
  `staffid` varchar(12) NOT NULL COMMENT '鹿陇脳梅脠脣脭卤卤脿潞脜',
  `cnname` varchar(40) NOT NULL DEFAULT '',
  `enname` varchar(20) NOT NULL COMMENT '脫垄脦脛脨脮脙没',
  `sdate` date NOT NULL COMMENT '脠脮脝脷',
  `s1` int(3) NOT NULL COMMENT '露漏碌楼脢脗脧卯脢媒',
  `s2` int(3) NOT NULL COMMENT '脳脡脩炉脢脗脧卯脢媒',
  `s3` int(3) NOT NULL COMMENT '录录脢玫脢脗脧卯脢媒',
  `s4` int(3) NOT NULL COMMENT '脟贸脰煤脢脗脧卯脢媒',
  `s5` int(3) NOT NULL COMMENT '脥露脣脽CL脢脗脧卯脢媒',
  `s6` int(3) NOT NULL COMMENT '脥露脣脽禄煤鹿鹿脢脗脧卯脢媒',
  `s7` int(3) NOT NULL COMMENT '脥露脣脽脜庐脢驴脢脗脧卯脢媒',
  `s8` int(3) NOT NULL COMMENT '脥露脣脽脢脗脧卯脢媒-脦麓脡猫脡忙脥芒露脭脧贸',
  `d1` int(3) NOT NULL COMMENT '露漏碌楼禄脴赂麓脢媒',
  `d2` int(3) NOT NULL COMMENT '脳脡脩炉禄脴赂麓脢媒',
  `d3` int(3) NOT NULL COMMENT '录录脢玫禄脴赂麓脢媒',
  `d4` int(3) NOT NULL COMMENT '脟贸脰煤禄脴赂麓脢媒',
  `d5` int(3) NOT NULL COMMENT '脥露脣脽CL禄脴赂麓脢媒',
  `d6` int(3) NOT NULL COMMENT '脥露脣脽禄煤鹿鹿禄脴赂麓脢媒',
  `d7` int(3) NOT NULL COMMENT '脥露脣脽脜庐脢驴禄脴赂麓脢媒',
  `d8` int(3) NOT NULL COMMENT '脥露脣脽禄脴赂麓脢媒-脦麓脡猫脡忙脥芒露脭脧贸',
  `adddate` datetime NOT NULL COMMENT '录脟脗录脨麓脠毛脢卤录盲',
  PRIMARY KEY (`id`),
  KEY `staffid` (`staffid`,`sdate`)
) ENGINE=MyISAM AUTO_INCREMENT=15275 DEFAULT CHARSET=utf8 COMMENT='脩脟脙陆驴脥路镁脠脣脭卤鹿陇脳梅脕驴脥鲁';

-- ----------------------------
--  Table structure for `cs_subject_new`
-- ----------------------------
DROP TABLE IF EXISTS `cs_subject_new`;
CREATE TABLE `cs_subject_new` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `topic` varchar(20) NOT NULL DEFAULT '',
  `manid` char(12) NOT NULL,
  `status` varchar(5) NOT NULL DEFAULT '',
  `display` char(1) NOT NULL DEFAULT 'Y',
  `reply` char(1) NOT NULL DEFAULT 'N',
  `category` varchar(10) NOT NULL DEFAULT '',
  `groupby` varchar(10) NOT NULL DEFAULT '',
  `fullname` varchar(200) NOT NULL DEFAULT '',
  `man_email` varchar(200) NOT NULL,
  `subject` varchar(450) NOT NULL DEFAULT '',
  `cnsubject` varchar(450) NOT NULL DEFAULT '',
  `comment` text NOT NULL,
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastprocess` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `resolvedate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `creator` varchar(255) NOT NULL DEFAULT '',
  `creator_id` varchar(10) NOT NULL,
  `staff_id` varchar(10) NOT NULL,
  `staff_cnname` varchar(30) NOT NULL DEFAULT '',
  `follow` int(7) NOT NULL DEFAULT '0',
  `xtid` varchar(10) NOT NULL,
  `pjflag` tinyint(1) NOT NULL DEFAULT '0',
  `isgood` char(1) NOT NULL DEFAULT 'N',
  `example_class` char(2) NOT NULL,
  `example_subclass` char(2) NOT NULL,
  `unreadnum` tinyint(3) NOT NULL DEFAULT '0',
  `isedit` tinyint(1) NOT NULL DEFAULT '0',
  `fflag` tinyint(2) NOT NULL DEFAULT '0',
  `lastmailflag` char(1) NOT NULL DEFAULT 'M',
  `sid` varchar(20) NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `level` tinyint(4) NOT NULL DEFAULT '0',
  `womanid` varchar(50) NOT NULL,
  `relateto` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_2` (`manid`,`status`),
  KEY `sid` (`sid`),
  KEY `lastprocess` (`lastprocess`)
) ENGINE=MyISAM AUTO_INCREMENT=126080 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `csmail_seq`
-- ----------------------------
DROP TABLE IF EXISTS `csmail_seq`;
CREATE TABLE `csmail_seq` (
  `id` tinyint(2) NOT NULL AUTO_INCREMENT,
  `staffid` varchar(15) NOT NULL,
  `idx` tinyint(3) NOT NULL,
  `lastupdate` datetime NOT NULL,
  `group` char(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `cupid1`
-- ----------------------------
DROP TABLE IF EXISTS `cupid1`;
CREATE TABLE `cupid1` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `id2` varchar(35) NOT NULL,
  `manid` varchar(12) NOT NULL,
  `man_name` varchar(30) NOT NULL,
  `man_country` char(2) NOT NULL,
  `womanid` varchar(12) NOT NULL,
  `woman_name` varchar(40) NOT NULL DEFAULT '',
  `agentid` varchar(10) NOT NULL,
  `msg` varchar(150) NOT NULL,
  `emf_reply` char(1) NOT NULL DEFAULT 'N',
  `status` tinyint(1) NOT NULL,
  `unreview` int(2) NOT NULL DEFAULT '0',
  `read_flag` char(1) NOT NULL DEFAULT 'N',
  `review` char(1) NOT NULL DEFAULT 'N',
  `delete_flag` char(1) NOT NULL DEFAULT 'N',
  `allow_reply` char(1) NOT NULL DEFAULT 'Y',
  `adddate` datetime NOT NULL,
  `ip` varchar(20) NOT NULL,
  `lastreply` datetime NOT NULL,
  `reviewer` varchar(30) NOT NULL DEFAULT '',
  `staffid` varchar(10) NOT NULL,
  `emf_reply_date` datetime NOT NULL,
  `follower` varchar(10) NOT NULL,
  `bgpic` tinyint(1) NOT NULL DEFAULT '0',
  `alertflag` tinyint(1) NOT NULL DEFAULT '0',
  `groupid` varchar(10) NOT NULL,
  `consumed` char(1) NOT NULL DEFAULT 'N',
  `show_to_lady` char(1) NOT NULL DEFAULT 'N',
  `first_pay_time` datetime NOT NULL,
  `first_pay_service` tinyint(1) NOT NULL,
  `read_pay_num` int(3) NOT NULL,
  `read_free_num` int(3) NOT NULL,
  `woman_reply_num` int(3) NOT NULL,
  `woman_read_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id2` (`id2`),
  KEY `forsearch` (`manid`,`womanid`,`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=1070742 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `cupid2`
-- ----------------------------
DROP TABLE IF EXISTS `cupid2`;
CREATE TABLE `cupid2` (
  `rid` int(8) NOT NULL AUTO_INCREMENT,
  `id2` varchar(30) NOT NULL,
  `manid` varchar(12) NOT NULL,
  `man_name` varchar(30) NOT NULL,
  `womanid` varchar(12) NOT NULL,
  `woman_name` varchar(40) NOT NULL DEFAULT '',
  `agentid` varchar(10) NOT NULL,
  `note_addtime` datetime NOT NULL,
  `reply_method` tinyint(1) NOT NULL,
  `agt_staff` varchar(25) NOT NULL,
  `agt_staffname` varchar(30) NOT NULL DEFAULT '',
  `agt_reviewdate` datetime NOT NULL,
  `replymsg` text NOT NULL,
  `reason` tinyint(1) NOT NULL,
  `submitdate` datetime NOT NULL,
  `deleted` char(1) NOT NULL,
  `sendflag` tinyint(1) NOT NULL,
  `chn_staff` varchar(35) NOT NULL DEFAULT '',
  `reviewdate` datetime NOT NULL,
  `reject_reason` varchar(500) NOT NULL DEFAULT '',
  `review_comm` text NOT NULL,
  `comment` text NOT NULL,
  `senddate` datetime NOT NULL,
  `read_flag` char(1) NOT NULL DEFAULT 'N',
  `attachnum` tinyint(1) NOT NULL,
  `attachment` varchar(170) NOT NULL,
  `review_mode` tinyint(1) NOT NULL DEFAULT '0',
  `reviewer_id` varchar(7) NOT NULL,
  `reviewer_name` varchar(30) NOT NULL DEFAULT '',
  `groupid` varchar(10) NOT NULL,
  `read_free` char(1) NOT NULL DEFAULT 'N',
  `review_important` char(1) NOT NULL DEFAULT 'N',
  `read_time` datetime NOT NULL,
  `emf_reply_firsttime` datetime NOT NULL,
  `emf_reply_ids` varchar(100) NOT NULL,
  PRIMARY KEY (`rid`),
  KEY `id2` (`id2`),
  KEY `forsearch` (`manid`,`womanid`,`agentid`),
  KEY `foragent` (`agentid`,`sendflag`,`reply_method`)
) ENGINE=MyISAM AUTO_INCREMENT=1083594 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `cupid_limit_log`
-- ----------------------------
DROP TABLE IF EXISTS `cupid_limit_log`;
CREATE TABLE `cupid_limit_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) DEFAULT NULL,
  `womanid` varchar(12) DEFAULT NULL,
  `siteid` tinyint(1) NOT NULL DEFAULT '0',
  `send_datetime` datetime NOT NULL,
  `cupid_max_num` int(10) NOT NULL DEFAULT '0',
  `positive_total` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `cupiddate`
-- ----------------------------
DROP TABLE IF EXISTS `cupiddate`;
CREATE TABLE `cupiddate` (
  `cd_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cupiddate_id` varchar(20) NOT NULL,
  `order_id` varchar(20) NOT NULL,
  `manid` varchar(12) NOT NULL,
  `m_firstname` varchar(30) NOT NULL,
  `m_lastname` varchar(30) NOT NULL,
  `m_phone_cc` varchar(50) NOT NULL,
  `m_phone` varchar(50) NOT NULL,
  `m_mobile` varchar(50) NOT NULL,
  `m_us_client` varchar(1) NOT NULL,
  `m_imbra` varchar(40) NOT NULL,
  `submit_date` datetime NOT NULL,
  `canceled_date` datetime NOT NULL,
  `reservation_time` datetime NOT NULL,
  `stay_from_time` date NOT NULL,
  `stay_to_time` date NOT NULL,
  `priority_1st` datetime NOT NULL,
  `priority_2nd` datetime NOT NULL,
  `phone_number` varchar(100) NOT NULL,
  `hotel_address` varchar(1000) NOT NULL,
  `man_msg` varchar(250) NOT NULL,
  `agent_id` varchar(20) NOT NULL,
  `agent_staff` varchar(15) NOT NULL,
  `agent_name` varchar(50) NOT NULL,
  `womanid` varchar(12) NOT NULL,
  `w_firstname` varchar(20) NOT NULL,
  `w_lastname` varchar(20) NOT NULL,
  `w_imbra` varchar(34) NOT NULL,
  `division_note` text NOT NULL,
  `service_status` varchar(1) NOT NULL,
  `service_msg` varchar(250) NOT NULL,
  `service_contact` varchar(1000) NOT NULL,
  `reception_staff` varchar(15) NOT NULL,
  `reception_name` varchar(50) NOT NULL,
  `service_date` datetime NOT NULL,
  `service_address` varchar(250) NOT NULL,
  `service_brief` varchar(1000) NOT NULL,
  `service_evaluate` varchar(1) NOT NULL,
  `confirm_status` varchar(1) NOT NULL,
  `confirm_evidence` varchar(32) NOT NULL,
  `confirm_brief` varchar(1000) NOT NULL,
  `money` decimal(6,2) unsigned NOT NULL DEFAULT '0.00',
  `refund` decimal(6,2) unsigned NOT NULL DEFAULT '0.00',
  `credits` decimal(5,2) unsigned NOT NULL DEFAULT '0.00',
  `credits_add` decimal(5,2) unsigned NOT NULL DEFAULT '0.00',
  `cancel_result` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `credits_brief` text NOT NULL,
  `division_staff` varchar(20) NOT NULL,
  `division_name` varchar(30) NOT NULL,
  `service_process` varchar(1) NOT NULL,
  `status` varchar(1) NOT NULL,
  PRIMARY KEY (`cd_id`),
  KEY `manid` (`manid`,`womanid`,`service_process`,`status`),
  KEY `cupiddate_id` (`cupiddate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=790 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `cw_tab1`
-- ----------------------------
DROP TABLE IF EXISTS `cw_tab1`;
CREATE TABLE `cw_tab1` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `agentid` varchar(20) NOT NULL DEFAULT '',
  `ac_name` varchar(150) NOT NULL DEFAULT '',
  `ac_note` text NOT NULL,
  `flag` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=134 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `cw_tab2`
-- ----------------------------
DROP TABLE IF EXISTS `cw_tab2`;
CREATE TABLE `cw_tab2` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `agentid` varchar(20) NOT NULL DEFAULT '',
  `manid` varchar(12) NOT NULL DEFAULT '',
  `man_name` varchar(20) NOT NULL DEFAULT '',
  `womanid` varchar(12) NOT NULL DEFAULT '',
  `woman_name` varchar(30) NOT NULL DEFAULT '',
  `ac_no` varchar(16) NOT NULL DEFAULT '',
  `io` char(1) NOT NULL DEFAULT '',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `balance` decimal(12,2) NOT NULL DEFAULT '0.00',
  `description` varchar(100) NOT NULL DEFAULT '',
  `note` text NOT NULL,
  `danju` varchar(30) NOT NULL DEFAULT '',
  `event_date` date NOT NULL DEFAULT '0000-00-00',
  `addtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `staff_id` varchar(10) NOT NULL DEFAULT '',
  `staff_name` varchar(16) NOT NULL DEFAULT '',
  `update_history` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `datastats`
-- ----------------------------
DROP TABLE IF EXISTS `datastats`;
CREATE TABLE `datastats` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `description` varchar(50) NOT NULL,
  `sqltext` varchar(500) NOT NULL DEFAULT '',
  `lastupdate` datetime NOT NULL,
  `num` varchar(20) NOT NULL,
  `autoupdate` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `draft_msg01`
-- ----------------------------
DROP TABLE IF EXISTS `draft_msg01`;
CREATE TABLE `draft_msg01` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `sendfid` varchar(12) NOT NULL DEFAULT '',
  `sendfname` varchar(40) NOT NULL DEFAULT '',
  `sendtid` varchar(12) NOT NULL DEFAULT '',
  `sendtname` varchar(40) NOT NULL DEFAULT '',
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastupdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `agent` varchar(10) NOT NULL,
  `sendflag` char(1) NOT NULL DEFAULT 'N',
  `reply_id` varchar(25) NOT NULL,
  `reply_type` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sendfid` (`sendfid`),
  KEY `sendtid` (`sendtid`),
  KEY `lastupdate` (`lastupdate`)
) ENGINE=MyISAM AUTO_INCREMENT=6677 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `draft_msg02`
-- ----------------------------
DROP TABLE IF EXISTS `draft_msg02`;
CREATE TABLE `draft_msg02` (
  `id` int(3) NOT NULL DEFAULT '0',
  `body` text NOT NULL,
  `ip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `email`
-- ----------------------------
DROP TABLE IF EXISTS `email`;
CREATE TABLE `email` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `subject2` text NOT NULL,
  `mailfrom` varchar(255) NOT NULL DEFAULT '',
  `header` text NOT NULL,
  `varlist` text NOT NULL,
  `message` text NOT NULL,
  `replymail` varchar(255) NOT NULL DEFAULT '',
  `html` text NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=196 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `email_bak`
-- ----------------------------
DROP TABLE IF EXISTS `email_bak`;
CREATE TABLE `email_bak` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `mailfrom` varchar(255) NOT NULL DEFAULT '',
  `header` text NOT NULL,
  `varlist` text NOT NULL,
  `message` text NOT NULL,
  `replymail` varchar(255) NOT NULL DEFAULT '',
  `html` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `email_bak201304`
-- ----------------------------
DROP TABLE IF EXISTS `email_bak201304`;
CREATE TABLE `email_bak201304` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `mailfrom` varchar(255) NOT NULL DEFAULT '',
  `header` text NOT NULL,
  `varlist` text NOT NULL,
  `message` text NOT NULL,
  `replymail` varchar(255) NOT NULL DEFAULT '',
  `html` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `email_bk20130401`
-- ----------------------------
DROP TABLE IF EXISTS `email_bk20130401`;
CREATE TABLE `email_bk20130401` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `mailfrom` varchar(255) NOT NULL DEFAULT '',
  `header` text NOT NULL,
  `varlist` text NOT NULL,
  `message` text NOT NULL,
  `replymail` varchar(255) NOT NULL DEFAULT '',
  `html` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `email_bk20130415`
-- ----------------------------
DROP TABLE IF EXISTS `email_bk20130415`;
CREATE TABLE `email_bk20130415` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `subject2` text NOT NULL,
  `mailfrom` varchar(255) NOT NULL DEFAULT '',
  `header` text NOT NULL,
  `varlist` text NOT NULL,
  `message` text NOT NULL,
  `replymail` varchar(255) NOT NULL DEFAULT '',
  `html` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `emf_survey`
-- ----------------------------
DROP TABLE IF EXISTS `emf_survey`;
CREATE TABLE `emf_survey` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `womanid` varchar(12) NOT NULL,
  `agent` varchar(20) NOT NULL,
  `emfdate` datetime NOT NULL,
  `score` int(2) NOT NULL,
  `survey_date` datetime NOT NULL,
  `staffname` varchar(30) NOT NULL DEFAULT '',
  `staffid` varchar(15) NOT NULL,
  `msgid` int(9) NOT NULL,
  `manname` varchar(40) NOT NULL,
  `womanname` varchar(40) NOT NULL,
  `mancomment` varchar(500) NOT NULL,
  `commtoagent` char(1) NOT NULL DEFAULT 'Y',
  `agentmsg1` text NOT NULL,
  `agentmsg2` text NOT NULL,
  `isreviewed` char(1) NOT NULL DEFAULT 'N',
  `clremark` text NOT NULL,
  `remark` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `foragent` (`agent`,`staffid`,`score`),
  KEY `foradmin` (`score`,`agent`,`staffid`),
  KEY `survey_date` (`survey_date`)
) ENGINE=MyISAM AUTO_INCREMENT=276978 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `emf_update`
-- ----------------------------
DROP TABLE IF EXISTS `emf_update`;
CREATE TABLE `emf_update` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `msgid` int(10) NOT NULL,
  `womanid` varchar(20) NOT NULL DEFAULT '',
  `manid` varchar(20) NOT NULL DEFAULT '',
  `staff_id` varchar(15) NOT NULL,
  `staff_name` varchar(30) NOT NULL DEFAULT '',
  `agentid` varchar(20) NOT NULL,
  `body_src` text NOT NULL,
  `body_new` text NOT NULL,
  `ip` varchar(15) NOT NULL DEFAULT '',
  `adddate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `msgid` (`msgid`)
) ENGINE=MyISAM AUTO_INCREMENT=92664 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `esl_computer`
-- ----------------------------
DROP TABLE IF EXISTS `esl_computer`;
CREATE TABLE `esl_computer` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `cpu_id` varchar(120) NOT NULL DEFAULT '',
  `disk_id` varchar(50) NOT NULL DEFAULT '',
  `computer_id` varchar(20) NOT NULL DEFAULT '',
  `location1` varchar(100) NOT NULL DEFAULT '',
  `location2` varchar(100) NOT NULL DEFAULT '',
  `auth` enum('Y','N','P','D') NOT NULL DEFAULT 'Y',
  `comment` text NOT NULL,
  `staff` varchar(40) NOT NULL DEFAULT '',
  `last_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `login_num` int(6) NOT NULL DEFAULT '0',
  `adddate` datetime NOT NULL,
  `authuser` varchar(250) NOT NULL,
  `dept` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=198 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `esl_login`
-- ----------------------------
DROP TABLE IF EXISTS `esl_login`;
CREATE TABLE `esl_login` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `staff` varchar(20) NOT NULL DEFAULT '',
  `decode` varchar(200) NOT NULL DEFAULT '',
  `status` enum('Y','N') NOT NULL DEFAULT 'N',
  `timeout` varchar(20) NOT NULL DEFAULT '',
  `loginip` varchar(15) NOT NULL DEFAULT '',
  `computer_id` varchar(20) NOT NULL,
  `adddate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `decode` (`decode`)
) ENGINE=MyISAM AUTO_INCREMENT=72232 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `faqs`
-- ----------------------------
DROP TABLE IF EXISTS `faqs`;
CREATE TABLE `faqs` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL DEFAULT '',
  `answer` text NOT NULL,
  `category` char(2) NOT NULL DEFAULT '0',
  `position` int(3) NOT NULL DEFAULT '0',
  `topic` char(1) NOT NULL DEFAULT 'N',
  `sort` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=138 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `favorites`
-- ----------------------------
DROP TABLE IF EXISTS `favorites`;
CREATE TABLE `favorites` (
  `id` bigint(9) NOT NULL AUTO_INCREMENT,
  `manid` varchar(15) NOT NULL DEFAULT '',
  `womanid` varchar(15) NOT NULL DEFAULT '',
  `adddate` datetime NOT NULL,
  `agentid` varchar(7) NOT NULL,
  `admire_mail` tinyint(1) NOT NULL DEFAULT '0',
  `last_contact` datetime NOT NULL,
  `is_favorite` tinyint(1) NOT NULL DEFAULT '1',
  `comments_id` int(9) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`),
  KEY `womanid` (`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=7908441 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `favorites_comments`
-- ----------------------------
DROP TABLE IF EXISTS `favorites_comments`;
CREATE TABLE `favorites_comments` (
  `comments_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `comments` varchar(180) NOT NULL,
  `addtime` datetime NOT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`comments_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `favorites_comments_history`
-- ----------------------------
DROP TABLE IF EXISTS `favorites_comments_history`;
CREATE TABLE `favorites_comments_history` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `comments` varchar(180) NOT NULL,
  `manid` varchar(15) NOT NULL,
  `womanid` varchar(15) NOT NULL,
  `agentid` varchar(7) NOT NULL,
  `addtime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `favorites_lady`
-- ----------------------------
DROP TABLE IF EXISTS `favorites_lady`;
CREATE TABLE `favorites_lady` (
  `id` bigint(9) NOT NULL AUTO_INCREMENT,
  `manid` varchar(15) NOT NULL DEFAULT '',
  `womanid` varchar(15) NOT NULL DEFAULT '',
  `adddate` datetime NOT NULL,
  `agentid` varchar(7) NOT NULL,
  `man_country` varchar(30) NOT NULL,
  `man_province` varchar(20) NOT NULL,
  `man_photourl` varchar(50) NOT NULL,
  `man_marry` varchar(20) NOT NULL,
  `man_birthday` date NOT NULL,
  `man_firstname` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`),
  KEY `womanid` (`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=171 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `favorites_stats`
-- ----------------------------
DROP TABLE IF EXISTS `favorites_stats`;
CREATE TABLE `favorites_stats` (
  `id` bigint(9) NOT NULL AUTO_INCREMENT,
  `manid` varchar(15) NOT NULL DEFAULT '',
  `womanid` varchar(15) NOT NULL DEFAULT '',
  `adddate` datetime NOT NULL,
  `agentid` varchar(7) NOT NULL,
  `admire_mail` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`),
  KEY `womanid` (`womanid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `firstorder200910`
-- ----------------------------
DROP TABLE IF EXISTS `firstorder200910`;
CREATE TABLE `firstorder200910` (
  `manid` varchar(15) NOT NULL DEFAULT '',
  `amount` decimal(7,2) NOT NULL DEFAULT '0.00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `forums_cat`
-- ----------------------------
DROP TABLE IF EXISTS `forums_cat`;
CREATE TABLE `forums_cat` (
  `cat_id` int(8) NOT NULL AUTO_INCREMENT,
  `subject` varchar(250) NOT NULL DEFAULT '0',
  `intro` text NOT NULL,
  `rank` int(5) NOT NULL DEFAULT '0',
  `status` char(1) NOT NULL DEFAULT '',
  `topics_pending` int(5) NOT NULL DEFAULT '0',
  `topics_post` int(5) NOT NULL DEFAULT '0',
  `topics_hidden` int(5) NOT NULL DEFAULT '0',
  `reply_pending` int(5) NOT NULL DEFAULT '0',
  `reply_post` int(5) NOT NULL DEFAULT '0',
  `reply_hidden` int(5) NOT NULL DEFAULT '0',
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `full_text` text NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `forums_fav`
-- ----------------------------
DROP TABLE IF EXISTS `forums_fav`;
CREATE TABLE `forums_fav` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `manid` varchar(20) NOT NULL DEFAULT '',
  `cat_id` int(8) NOT NULL DEFAULT '0',
  `topics_id` int(8) NOT NULL DEFAULT '0',
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`)
) ENGINE=MyISAM AUTO_INCREMENT=4803 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `forums_msg`
-- ----------------------------
DROP TABLE IF EXISTS `forums_msg`;
CREATE TABLE `forums_msg` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `cat_id` int(8) NOT NULL DEFAULT '0',
  `topics_id` int(8) NOT NULL DEFAULT '0',
  `manid` varchar(20) NOT NULL DEFAULT '',
  `manname` varchar(60) NOT NULL,
  `manaddress` varchar(100) NOT NULL,
  `msg` text NOT NULL,
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rank` int(8) NOT NULL DEFAULT '0',
  `status` char(1) NOT NULL DEFAULT '',
  `ip` varchar(15) NOT NULL DEFAULT '',
  `quotebody` varchar(500) NOT NULL,
  `attachnum` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cat_id` (`cat_id`,`topics_id`,`manid`)
) ENGINE=MyISAM AUTO_INCREMENT=17793 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `forums_topics`
-- ----------------------------
DROP TABLE IF EXISTS `forums_topics`;
CREATE TABLE `forums_topics` (
  `topics_id` int(8) NOT NULL AUTO_INCREMENT,
  `cat_id` int(8) NOT NULL DEFAULT '0',
  `sub_catid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `manid` varchar(20) NOT NULL DEFAULT '',
  `manname` varchar(60) NOT NULL,
  `manaddress` varchar(100) NOT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `intro` text NOT NULL,
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip` varchar(15) NOT NULL DEFAULT '',
  `last_reply_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `num_pending` int(5) NOT NULL DEFAULT '0',
  `num_post` int(5) NOT NULL DEFAULT '0',
  `num_hidden` int(5) NOT NULL DEFAULT '0',
  `rank` int(8) NOT NULL DEFAULT '0',
  `status` char(1) NOT NULL DEFAULT '',
  `locked` char(1) NOT NULL DEFAULT 'N',
  `is_top` char(1) NOT NULL DEFAULT 'N',
  `highlight` char(1) NOT NULL DEFAULT 'N',
  `owner` char(1) NOT NULL DEFAULT 'M',
  `is_first` tinyint(1) NOT NULL DEFAULT '0',
  `attachnum` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`topics_id`),
  KEY `cat_id` (`cat_id`,`manid`)
) ENGINE=MyISAM AUTO_INCREMENT=3224 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `forward_adr`
-- ----------------------------
DROP TABLE IF EXISTS `forward_adr`;
CREATE TABLE `forward_adr` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `msgid` int(8) NOT NULL DEFAULT '0',
  `agentid` varchar(10) NOT NULL DEFAULT '',
  `sendtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sendto` varchar(180) NOT NULL DEFAULT '',
  `sendfrom` varchar(180) NOT NULL DEFAULT '',
  `manid` varchar(20) NOT NULL DEFAULT '',
  `womanid` varchar(20) NOT NULL DEFAULT '',
  `ip` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `id_2` (`msgid`)
) ENGINE=MyISAM AUTO_INCREMENT=20374 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `forward_emf`
-- ----------------------------
DROP TABLE IF EXISTS `forward_emf`;
CREATE TABLE `forward_emf` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `emf_id` bigint(10) NOT NULL DEFAULT '0',
  `agentid` varchar(10) NOT NULL DEFAULT '',
  `toflag` varchar(3) NOT NULL DEFAULT '',
  `sendtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sendto` varchar(180) NOT NULL DEFAULT '',
  `sendfrom` varchar(180) NOT NULL DEFAULT '',
  `manid` varchar(20) NOT NULL DEFAULT '',
  `womanid` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `emf_id` (`emf_id`),
  KEY `agentid` (`agentid`),
  KEY `forsearch` (`sendtime`,`manid`,`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=459981 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `gift_cart`
-- ----------------------------
DROP TABLE IF EXISTS `gift_cart`;
CREATE TABLE `gift_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manid` varchar(15) NOT NULL,
  `m_firstname` varchar(30) NOT NULL,
  `m_lastname` varchar(30) NOT NULL,
  `womanid` varchar(15) NOT NULL,
  `greeting_words` varchar(256) NOT NULL,
  `recipient` varchar(256) NOT NULL,
  `additional` varchar(256) NOT NULL,
  `add_date` datetime NOT NULL,
  `lastupdate` datetime NOT NULL,
  `expire_date` datetime NOT NULL,
  `give_free_card` tinyint(4) DEFAULT '0',
  `orderno` char(30) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `MW` (`manid`,`womanid`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `gift_cart_item`
-- ----------------------------
DROP TABLE IF EXISTS `gift_cart_item`;
CREATE TABLE `gift_cart_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gift_cart_id` int(11) NOT NULL,
  `item_code` varchar(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `add_date` datetime NOT NULL,
  `lastupdate` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `CARTID` (`gift_cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=264 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `gift_category`
-- ----------------------------
DROP TABLE IF EXISTS `gift_category`;
CREATE TABLE `gift_category` (
  `c_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `child` char(1) NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL,
  `category_type` varchar(1) NOT NULL,
  `title` varchar(255) NOT NULL,
  `taxis` smallint(1) unsigned NOT NULL DEFAULT '0',
  `staff_id` varchar(25) NOT NULL,
  `staff_name` varchar(50) NOT NULL,
  `addtime` datetime NOT NULL,
  `edittime` datetime NOT NULL,
  `status` char(1) NOT NULL,
  `give_free_card` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`c_id`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `gift_delivery`
-- ----------------------------
DROP TABLE IF EXISTS `gift_delivery`;
CREATE TABLE `gift_delivery` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `orderno` varchar(50) NOT NULL DEFAULT '',
  `orderdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordertype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `devno` varchar(55) NOT NULL DEFAULT '',
  `shippingno` varchar(50) NOT NULL DEFAULT '',
  `senddate` date NOT NULL DEFAULT '0000-00-00',
  `devnote` varchar(255) NOT NULL DEFAULT '',
  `manid` varchar(20) NOT NULL DEFAULT '',
  `man_name` varchar(30) NOT NULL DEFAULT '',
  `man_phone` varchar(20) NOT NULL DEFAULT '',
  `man_addr` varchar(100) NOT NULL DEFAULT '',
  `agentid` varchar(20) NOT NULL,
  `womanid` varchar(20) NOT NULL DEFAULT '',
  `woman_name` varchar(30) NOT NULL DEFAULT '',
  `woman_cnname` varchar(30) NOT NULL DEFAULT '',
  `woman_phone` varchar(40) NOT NULL,
  `woman_addr` varchar(100) NOT NULL DEFAULT '',
  `greeting_word` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `staff_id` varchar(20) NOT NULL DEFAULT '',
  `staff_name` varchar(30) NOT NULL DEFAULT '',
  `remark` text NOT NULL,
  `agent_remark` text NOT NULL,
  `cancel_date` datetime NOT NULL,
  `canceltype_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `delivery_date` datetime NOT NULL,
  `confirm_date` datetime NOT NULL,
  `confirm_person` varchar(30) NOT NULL DEFAULT '',
  `needaddcredit` char(1) NOT NULL DEFAULT 'N',
  `creditadded` char(1) NOT NULL DEFAULT 'N',
  `addrconfirmed` tinyint(1) NOT NULL,
  `postage` decimal(8,2) NOT NULL DEFAULT '0.00',
  `reminded` tinyint(1) NOT NULL DEFAULT '0',
  `provider` tinyint(3) NOT NULL,
  `audit_photo` varchar(72) NOT NULL,
  `base_credits` decimal(7,1) NOT NULL DEFAULT '0.0',
  `add_credits` decimal(7,1) NOT NULL DEFAULT '0.0',
  `audit_remark` varchar(20000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=20512 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `gift_item`
-- ----------------------------
DROP TABLE IF EXISTS `gift_item`;
CREATE TABLE `gift_item` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `category` tinyint(2) NOT NULL DEFAULT '0',
  `item_code` varchar(20) NOT NULL DEFAULT '',
  `item_name` varchar(100) NOT NULL DEFAULT '',
  `credits` int(3) NOT NULL DEFAULT '0',
  `agent_credit` decimal(6,1) unsigned NOT NULL DEFAULT '0.0',
  `rebate_on` tinyint(4) NOT NULL DEFAULT '2',
  `description` text NOT NULL,
  `price_show` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `n_price_s` decimal(6,2) NOT NULL DEFAULT '0.00',
  `n_price_m` decimal(6,2) NOT NULL DEFAULT '0.00',
  `n_price_l` decimal(6,2) NOT NULL DEFAULT '0.00',
  `h_price_s` decimal(6,2) NOT NULL DEFAULT '0.00',
  `h_price_m` decimal(6,2) NOT NULL DEFAULT '0.00',
  `h_price_l` decimal(6,2) NOT NULL DEFAULT '0.00',
  `y_price_s` decimal(6,2) NOT NULL DEFAULT '0.00',
  `desc_s` varchar(255) NOT NULL DEFAULT '',
  `desc_m` varchar(255) NOT NULL DEFAULT '',
  `desc_l` varchar(255) NOT NULL DEFAULT '',
  `display` char(1) NOT NULL DEFAULT 'N',
  `newcome` tinyint(1) NOT NULL DEFAULT '0',
  `paixu` int(5) unsigned NOT NULL DEFAULT '0',
  `shipping_region` varchar(100) NOT NULL,
  `remark` text NOT NULL,
  `n_credit_s` decimal(6,2) NOT NULL,
  `n_credit_m` decimal(6,2) NOT NULL,
  `n_credit_l` decimal(6,2) NOT NULL,
  `h_credit_s` decimal(6,2) NOT NULL,
  `h_credit_m` decimal(6,2) NOT NULL,
  `h_credit_l` decimal(6,2) NOT NULL,
  `siteid` tinyint(2) NOT NULL,
  `period` smallint(3) NOT NULL,
  `is_greeting_card` tinyint(1) NOT NULL DEFAULT '0',
  `integral` int(1) unsigned NOT NULL DEFAULT '0',
  `integral_price_s` decimal(6,2) unsigned NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=354 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `gift_recommend`
-- ----------------------------
DROP TABLE IF EXISTS `gift_recommend`;
CREATE TABLE `gift_recommend` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `cpid` varchar(20) NOT NULL,
  `zone` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `recommend` char(1) NOT NULL DEFAULT 'N',
  `px` int(5) unsigned NOT NULL DEFAULT '0',
  `px2` int(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1468 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `gift_remind`
-- ----------------------------
DROP TABLE IF EXISTS `gift_remind`;
CREATE TABLE `gift_remind` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `devno` varchar(55) NOT NULL DEFAULT '',
  `manid` varchar(20) NOT NULL DEFAULT '',
  `womanid` varchar(20) NOT NULL DEFAULT '',
  `agentid` varchar(10) NOT NULL DEFAULT '',
  `ordertype` tinyint(1) NOT NULL,
  `receviced_date` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `staffid` varchar(15) NOT NULL,
  `adddate` datetime NOT NULL,
  `dismiss_date` datetime NOT NULL,
  `ip` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forsearch` (`manid`,`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=12413 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `goods_item`
-- ----------------------------
DROP TABLE IF EXISTS `goods_item`;
CREATE TABLE `goods_item` (
  `g_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category` smallint(1) unsigned NOT NULL,
  `item_type` varchar(1) NOT NULL,
  `item_code` varchar(50) NOT NULL,
  `item_name` varchar(100) NOT NULL DEFAULT '',
  `credits` smallint(1) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `to_agency_desc` varchar(1000) NOT NULL,
  `n_price_s` decimal(6,2) NOT NULL DEFAULT '0.00',
  `desc_s` varchar(255) NOT NULL DEFAULT '',
  `newcome` varchar(1) NOT NULL DEFAULT '0',
  `paixu` smallint(1) unsigned NOT NULL DEFAULT '0',
  `remark` text NOT NULL,
  `siteid` varchar(1) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`g_id`),
  KEY `category` (`category`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `gss_acls`
-- ----------------------------
DROP TABLE IF EXISTS `gss_acls`;
CREATE TABLE `gss_acls` (
  `role_id` int(10) unsigned NOT NULL,
  `rule_id` int(10) unsigned NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `res_name` varchar(50) NOT NULL,
  `priv_name` varchar(32) NOT NULL,
  PRIMARY KEY (`role_id`,`rule_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ACL 访问控制表';

-- ----------------------------
--  Table structure for `gss_menus`
-- ----------------------------
DROP TABLE IF EXISTS `gss_menus`;
CREATE TABLE `gss_menus` (
  `menu_id` smallint(5) unsigned NOT NULL COMMENT '????',
  `menu_name` varchar(50) NOT NULL COMMENT '名称',
  `link_url` varchar(254) NOT NULL COMMENT '链接',
  `order_by` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `parent` smallint(5) unsigned NOT NULL COMMENT '所属菜单',
  PRIMARY KEY (`menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='菜单导航表';

-- ----------------------------
--  Table structure for `gss_modules`
-- ----------------------------
DROP TABLE IF EXISTS `gss_modules`;
CREATE TABLE `gss_modules` (
  `mod_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mod_name` varchar(50) NOT NULL,
  `mod_desc` varchar(200) NOT NULL,
  PRIMARY KEY (`mod_id`),
  UNIQUE KEY `mod_name` (`mod_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `gss_resources`
-- ----------------------------
DROP TABLE IF EXISTS `gss_resources`;
CREATE TABLE `gss_resources` (
  `res_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `res_name` varchar(50) NOT NULL COMMENT '资源名称',
  `res_desc` varchar(200) NOT NULL COMMENT '资源说明',
  `res_order` tinyint(2) NOT NULL COMMENT '资源排序',
  PRIMARY KEY (`res_id`),
  UNIQUE KEY `mod_name` (`res_name`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='ACL 资源表';

-- ----------------------------
--  Table structure for `gss_role_menus`
-- ----------------------------
DROP TABLE IF EXISTS `gss_role_menus`;
CREATE TABLE `gss_role_menus` (
  `role_id` int(10) unsigned NOT NULL COMMENT '角色编号',
  `menu_id` int(10) unsigned NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `gss_roles`
-- ----------------------------
DROP TABLE IF EXISTS `gss_roles`;
CREATE TABLE `gss_roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_name` varchar(50) NOT NULL COMMENT '角色名称',
  `role_desc` varchar(200) NOT NULL COMMENT '角色说明',
  `order_by` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  `is_use` tinyint(1) NOT NULL DEFAULT '0',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认角色',
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='ACL 权限角色表';

-- ----------------------------
--  Table structure for `gss_rules`
-- ----------------------------
DROP TABLE IF EXISTS `gss_rules`;
CREATE TABLE `gss_rules` (
  `rule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `res_name` varchar(50) NOT NULL COMMENT '资源名称',
  `priv_name` varchar(32) NOT NULL COMMENT '权限名称',
  `priv_explain` varchar(200) NOT NULL COMMENT '说明',
  `rule_order` tinyint(3) NOT NULL DEFAULT '0' COMMENT '权限排序',
  PRIMARY KEY (`rule_id`)
) ENGINE=MyISAM AUTO_INCREMENT=125 DEFAULT CHARSET=utf8 COMMENT='ACL 规则表';

-- ----------------------------
--  Table structure for `gss_user_roles`
-- ----------------------------
DROP TABLE IF EXISTS `gss_user_roles`;
CREATE TABLE `gss_user_roles` (
  `user_id` varchar(10) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`,`role_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `helpsys`
-- ----------------------------
DROP TABLE IF EXISTS `helpsys`;
CREATE TABLE `helpsys` (
  `h_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `serial_num` int(1) unsigned NOT NULL,
  `help_type` tinyint(1) NOT NULL,
  `class_id1` tinyint(1) NOT NULL,
  `class_id2` tinyint(1) NOT NULL,
  `type` varchar(1) NOT NULL,
  `number` varchar(50) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `remark` varchar(255) NOT NULL,
  `sort` int(1) NOT NULL,
  `follower_name` varchar(30) NOT NULL,
  `follower_staffid` varchar(30) NOT NULL,
  `submit_date` datetime NOT NULL,
  `operator_date` datetime NOT NULL,
  `status` varchar(1) NOT NULL,
  PRIMARY KEY (`h_id`),
  KEY `sort` (`sort`),
  KEY `help_type` (`help_type`,`class_id1`,`class_id2`,`serial_num`)
) ENGINE=MyISAM AUTO_INCREMENT=20057 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `helpsys_history`
-- ----------------------------
DROP TABLE IF EXISTS `helpsys_history`;
CREATE TABLE `helpsys_history` (
  `hh_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `h_id` int(11) unsigned NOT NULL,
  `serial_num` int(1) unsigned NOT NULL,
  `help_type` tinyint(1) NOT NULL,
  `class_id1` tinyint(1) NOT NULL,
  `class_id2` tinyint(1) NOT NULL,
  `type` varchar(1) NOT NULL,
  `number` varchar(50) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `remark` varchar(255) NOT NULL,
  `sort` int(1) NOT NULL,
  `follower_name` varchar(30) NOT NULL,
  `follower_staffid` varchar(30) NOT NULL,
  `submit_date` datetime NOT NULL,
  `operator_date` datetime NOT NULL,
  `status` varchar(1) NOT NULL,
  PRIMARY KEY (`hh_id`),
  KEY `sort` (`sort`),
  KEY `h_id` (`h_id`),
  KEY `help_type` (`help_type`,`class_id1`,`class_id2`,`serial_num`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `helpsys_history_lady`
-- ----------------------------
DROP TABLE IF EXISTS `helpsys_history_lady`;
CREATE TABLE `helpsys_history_lady` (
  `hh_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `h_id` int(11) unsigned NOT NULL,
  `serial_num` int(1) unsigned NOT NULL,
  `help_type` tinyint(1) NOT NULL,
  `class_id1` tinyint(1) NOT NULL,
  `class_id2` tinyint(1) NOT NULL,
  `type` varchar(1) NOT NULL,
  `number` varchar(50) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `remark` varchar(255) NOT NULL,
  `sort` int(1) NOT NULL,
  `follower_name` varchar(30) NOT NULL,
  `follower_staffid` varchar(30) NOT NULL,
  `submit_date` datetime NOT NULL,
  `operator_date` datetime NOT NULL,
  `status` varchar(1) NOT NULL,
  PRIMARY KEY (`hh_id`),
  KEY `sort` (`sort`),
  KEY `h_id` (`h_id`),
  KEY `help_type` (`help_type`,`class_id1`,`class_id2`,`serial_num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `helpsys_lady`
-- ----------------------------
DROP TABLE IF EXISTS `helpsys_lady`;
CREATE TABLE `helpsys_lady` (
  `h_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `serial_num` int(1) unsigned NOT NULL,
  `help_type` tinyint(1) NOT NULL,
  `class_id1` tinyint(1) NOT NULL,
  `class_id2` tinyint(1) NOT NULL,
  `type` varchar(1) NOT NULL,
  `number` varchar(50) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `remark` varchar(255) NOT NULL,
  `sort` int(1) NOT NULL,
  `follower_name` varchar(30) NOT NULL,
  `follower_staffid` varchar(30) NOT NULL,
  `submit_date` datetime NOT NULL,
  `operator_date` datetime NOT NULL,
  `status` varchar(1) NOT NULL,
  PRIMARY KEY (`h_id`),
  KEY `sort` (`sort`),
  KEY `help_type` (`help_type`,`class_id1`,`class_id2`,`serial_num`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `history`
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `agent` varchar(10) NOT NULL DEFAULT '',
  `flag` char(2) NOT NULL DEFAULT '',
  `credit` varchar(5) NOT NULL DEFAULT '1',
  `comm` text,
  `msgid` varchar(10) NOT NULL DEFAULT '',
  `manid` varchar(15) NOT NULL DEFAULT '',
  `womanid` varchar(15) NOT NULL DEFAULT '',
  `balance` int(8) NOT NULL DEFAULT '0',
  `comm2` varchar(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `siteid` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`),
  KEY `womanid` (`womanid`),
  KEY `forstat` (`adddate`,`agent`,`flag`)
) ENGINE=MyISAM AUTO_INCREMENT=4979496 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `history200910`
-- ----------------------------
DROP TABLE IF EXISTS `history200910`;
CREATE TABLE `history200910` (
  `manid` varchar(15) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `hotmember`
-- ----------------------------
DROP TABLE IF EXISTS `hotmember`;
CREATE TABLE `hotmember` (
  `memberid` varchar(15) NOT NULL DEFAULT '',
  `mbtype` char(1) NOT NULL DEFAULT 'w',
  `agent` varchar(8) NOT NULL,
  `num` int(5) NOT NULL,
  `mw_num` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `wm_num` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `adddate` datetime NOT NULL,
  PRIMARY KEY (`memberid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `integral_relation`
-- ----------------------------
DROP TABLE IF EXISTS `integral_relation`;
CREATE TABLE `integral_relation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `womanid` varchar(12) NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `mw_msgid` bigint(11) unsigned NOT NULL,
  `wm_msgid` bigint(11) unsigned NOT NULL,
  `wm_all_msgid` varchar(100) NOT NULL,
  `lady_reply_read_num` tinyint(1) unsigned NOT NULL,
  `lady_reply_reply_num` tinyint(1) unsigned NOT NULL,
  `wm_all_msgid2` varchar(100) NOT NULL,
  `lady_reply_read_num2` tinyint(1) unsigned NOT NULL,
  `lady_reply_reply_num2` tinyint(1) unsigned NOT NULL,
  `reply_type` char(1) NOT NULL DEFAULT '1',
  `adddate` datetime NOT NULL,
  `status` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `index_bao` (`manid`,`womanid`,`agentid`,`status`)
) ENGINE=MyISAM AUTO_INCREMENT=145 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `integral_statistics`
-- ----------------------------
DROP TABLE IF EXISTS `integral_statistics`;
CREATE TABLE `integral_statistics` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cycle_month` date NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `company` varchar(250) NOT NULL,
  `man_integral_num` int(1) NOT NULL,
  `lady_reply_num` int(1) NOT NULL,
  `lady_reply_read_num` int(1) NOT NULL,
  `lady_reply_reply_num` int(1) NOT NULL,
  `mw_all_msgid` text NOT NULL,
  `wm_all_msgid` text NOT NULL,
  `man_integral_num2` int(1) unsigned NOT NULL,
  `lady_reply_num2` int(1) unsigned NOT NULL,
  `lady_reply_read_num2` int(1) unsigned NOT NULL,
  `lady_reply_reply_num2` int(1) unsigned NOT NULL,
  `mw_all_msgid2` text NOT NULL,
  `wm_all_msgid2` text NOT NULL,
  `adddate` datetime NOT NULL,
  `editdate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cycle_month` (`cycle_month`,`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ip_to_country`
-- ----------------------------
DROP TABLE IF EXISTS `ip_to_country`;
CREATE TABLE `ip_to_country` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `ip_from` double(15,0) NOT NULL DEFAULT '0',
  `ip_to` double(15,0) NOT NULL DEFAULT '0',
  `code` varchar(10) NOT NULL DEFAULT '',
  `code2` char(3) NOT NULL DEFAULT '',
  `name` varchar(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `ip_from` (`ip_from`,`ip_to`)
) ENGINE=MyISAM AUTO_INCREMENT=732163 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `km`
-- ----------------------------
DROP TABLE IF EXISTS `km`;
CREATE TABLE `km` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `pid` int(8) NOT NULL DEFAULT '0',
  `child` tinyint(1) NOT NULL DEFAULT '0',
  `path` varchar(100) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `summary` text NOT NULL,
  `demand` text NOT NULL,
  `scheme` text NOT NULL,
  `advert` text NOT NULL,
  `author` varchar(30) NOT NULL DEFAULT '',
  `addauthor` varchar(30) NOT NULL DEFAULT '',
  `number` varchar(10) NOT NULL,
  `addip` varchar(15) NOT NULL DEFAULT '',
  `taxis` int(1) NOT NULL DEFAULT '1',
  `addtime` datetime NOT NULL,
  `edittime` datetime NOT NULL,
  `status` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `taxis` (`taxis`),
  KEY `title` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=322 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `km_attach`
-- ----------------------------
DROP TABLE IF EXISTS `km_attach`;
CREATE TABLE `km_attach` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `km_id` int(11) unsigned NOT NULL,
  `depict` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `km_id` (`km_id`,`date`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=193 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `live_admiremail_deleted`
-- ----------------------------
DROP TABLE IF EXISTS `live_admiremail_deleted`;
CREATE TABLE `live_admiremail_deleted` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `adddate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `livechat_stat_invite`
-- ----------------------------
DROP TABLE IF EXISTS `livechat_stat_invite`;
CREATE TABLE `livechat_stat_invite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agentid` varchar(20) NOT NULL DEFAULT '',
  `stat_date` date NOT NULL,
  `stat_week` varchar(10) NOT NULL,
  `stat_month` varchar(10) NOT NULL,
  `adddate` datetime NOT NULL,
  `manual_total` int(8) NOT NULL,
  `manual_succeed` int(8) NOT NULL,
  `auto_total` int(8) NOT NULL,
  `auto_succeed` int(8) NOT NULL,
  `man_toal` int(8) NOT NULL,
  `man_succeed` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `agent_date` (`stat_date`,`agentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `lock_short_video`
-- ----------------------------
DROP TABLE IF EXISTS `lock_short_video`;
CREATE TABLE `lock_short_video` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `womanid` varchar(10) NOT NULL,
  `firstname` varchar(40) NOT NULL,
  `lastname` varchar(40) NOT NULL,
  `agentid` varchar(15) NOT NULL,
  `video_name` varchar(50) NOT NULL,
  `video_md5` varchar(50) NOT NULL,
  `video_img_md5` varchar(50) NOT NULL,
  `video_time` time NOT NULL,
  `delete_flag` char(1) NOT NULL DEFAULT 'N',
  `submit_mode` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `video_no` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `agent_follow_id` varchar(15) NOT NULL,
  `agent_follow_name` varchar(40) NOT NULL,
  `division_follow_id` varchar(15) NOT NULL,
  `division_follow_name` varchar(40) NOT NULL,
  `operation_log` varchar(10240) NOT NULL,
  `edit_time` datetime NOT NULL,
  `device_type` varchar(2) NOT NULL DEFAULT '10',
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`,`agentid`),
  KEY `delete_flag` (`delete_flag`,`submit_mode`,`video_no`),
  KEY `edit_time` (`edit_time`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `login_esltoagt`
-- ----------------------------
DROP TABLE IF EXISTS `login_esltoagt`;
CREATE TABLE `login_esltoagt` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `staff` varchar(20) NOT NULL DEFAULT '',
  `agt_staffid` varchar(20) NOT NULL,
  `decode` varchar(200) NOT NULL DEFAULT '',
  `status` enum('Y','N') NOT NULL DEFAULT 'N',
  `timeout` varchar(20) NOT NULL DEFAULT '',
  `loginip` varchar(15) NOT NULL,
  `computer_id` varchar(20) NOT NULL,
  `adddate` datetime NOT NULL,
  `loginurl` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `decode` (`decode`),
  KEY `agt_staffid` (`agt_staffid`)
) ENGINE=MyISAM AUTO_INCREMENT=6545 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `lovecall_credit_history`
-- ----------------------------
DROP TABLE IF EXISTS `lovecall_credit_history`;
CREATE TABLE `lovecall_credit_history` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `dataid` varchar(35) NOT NULL,
  `manid` varchar(12) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `formno` varchar(20) NOT NULL,
  `callid` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `credits` decimal(10,2) NOT NULL DEFAULT '0.00',
  `balance` decimal(7,2) NOT NULL,
  `addtime` datetime NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`,`formno`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `lovecall_member`
-- ----------------------------
DROP TABLE IF EXISTS `lovecall_member`;
CREATE TABLE `lovecall_member` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `pin` char(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `manid` (`manid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `lovecall_reward`
-- ----------------------------
DROP TABLE IF EXISTS `lovecall_reward`;
CREATE TABLE `lovecall_reward` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `formno` varchar(20) NOT NULL,
  `credits` decimal(5,2) unsigned NOT NULL DEFAULT '0.00',
  `manid` varchar(12) NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `adddate` datetime NOT NULL,
  `ref_id` int(6) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `formno` (`formno`),
  KEY `ref_id` (`ref_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `man_cancel_req`
-- ----------------------------
DROP TABLE IF EXISTS `man_cancel_req`;
CREATE TABLE `man_cancel_req` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `manid` varchar(20) NOT NULL,
  `manname` varchar(50) NOT NULL,
  `joindate` datetime NOT NULL,
  `reason` int(3) NOT NULL,
  `ip` varchar(15) NOT NULL DEFAULT '',
  `adddate` datetime NOT NULL,
  `other` text NOT NULL,
  `country` char(5) NOT NULL,
  `status` int(3) NOT NULL,
  `email` varchar(100) NOT NULL DEFAULT '',
  `paidamount` float(8,2) NOT NULL DEFAULT '0.00',
  `q1` char(1) NOT NULL DEFAULT '0',
  `q2` char(1) NOT NULL DEFAULT '0',
  `q3` char(1) NOT NULL DEFAULT '0',
  `q4` char(1) NOT NULL DEFAULT '0',
  `q5` char(1) NOT NULL DEFAULT '0',
  `q6` char(1) NOT NULL DEFAULT '0',
  `q8` char(1) NOT NULL DEFAULT '0',
  `q9` char(1) NOT NULL DEFAULT '0',
  `q10` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`)
) ENGINE=MyISAM AUTO_INCREMENT=23738 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `man_report_abuse`
-- ----------------------------
DROP TABLE IF EXISTS `man_report_abuse`;
CREATE TABLE `man_report_abuse` (
  `ra_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mra_id` varchar(25) NOT NULL,
  `submitdate` datetime NOT NULL,
  `abuse_type` varchar(1) NOT NULL,
  `related_id` varchar(40) NOT NULL,
  `toflag` tinyint(1) NOT NULL DEFAULT '0',
  `manid` varchar(20) NOT NULL,
  `m_firstname` varchar(20) NOT NULL,
  `m_lastname` varchar(20) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `w_firstname` varchar(20) NOT NULL,
  `w_lastname` varchar(20) NOT NULL,
  `agent_id` varchar(20) NOT NULL,
  `agent_name` varchar(250) NOT NULL,
  `reason` varchar(1) NOT NULL,
  `comments` text NOT NULL,
  `evidence` text NOT NULL,
  `photo` varchar(32) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `follower_name` varchar(30) NOT NULL,
  `follower_staffid` varchar(15) NOT NULL,
  `remarks` text NOT NULL,
  `agent_status` varchar(1) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ra_id`),
  KEY `abuse_type` (`abuse_type`,`manid`,`womanid`,`agent_id`,`reason`,`status`),
  KEY `mra_id` (`mra_id`),
  KEY `toflag` (`toflag`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `man_survey`
-- ----------------------------
DROP TABLE IF EXISTS `man_survey`;
CREATE TABLE `man_survey` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `agentid` varchar(10) NOT NULL,
  `manid` varchar(20) NOT NULL,
  `manname` varchar(50) NOT NULL,
  `woman_info` varchar(50) NOT NULL,
  `meet_date` date NOT NULL,
  `visit_type` tinyint(1) NOT NULL DEFAULT '0',
  `score` tinyint(1) NOT NULL,
  `survey_date` datetime NOT NULL,
  `comm_meet` text NOT NULL,
  `comm_service` text NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'P',
  `submit_ip` varchar(15) NOT NULL,
  `process_remark` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `survey_date` (`survey_date`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=693 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `man_temp`
-- ----------------------------
DROP TABLE IF EXISTS `man_temp`;
CREATE TABLE `man_temp` (
  `manid` varchar(15) NOT NULL DEFAULT '',
  `submitdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `firstname` char(20) NOT NULL,
  `lastname` char(20) NOT NULL,
  `email` char(100) NOT NULL,
  `money` int(6) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `adsuser` char(20) NOT NULL,
  `loginnum` int(6) NOT NULL DEFAULT '0',
  `paid_amount` float(8,2) NOT NULL DEFAULT '0.00',
  `last_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `country` char(5) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `csmail` int(11) NOT NULL DEFAULT '0',
  `source` varchar(8) NOT NULL DEFAULT 'pfishy',
  KEY `manid` (`manid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `manfaqs_am`
-- ----------------------------
DROP TABLE IF EXISTS `manfaqs_am`;
CREATE TABLE `manfaqs_am` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL DEFAULT '',
  `answer` text NOT NULL,
  `section` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `category` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_px` int(5) NOT NULL DEFAULT '0',
  `date_update` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `top_quest` char(1) NOT NULL DEFAULT 'N',
  `top_px` int(5) NOT NULL DEFAULT '0',
  `question_cn` varchar(255) NOT NULL,
  `answer_cn` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `note` varchar(255) NOT NULL,
  `staff_id` varchar(20) NOT NULL,
  `staff_name` varchar(20) NOT NULL,
  `addtime` datetime NOT NULL,
  `lastupdate_staff` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=589 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `manfaqs_am_20100110`
-- ----------------------------
DROP TABLE IF EXISTS `manfaqs_am_20100110`;
CREATE TABLE `manfaqs_am_20100110` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL DEFAULT '',
  `answer` text NOT NULL,
  `section` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `category` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_px` int(5) NOT NULL DEFAULT '0',
  `date_update` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `top_quest` char(1) NOT NULL DEFAULT 'N',
  `top_px` int(5) NOT NULL DEFAULT '0',
  `question_cn` varchar(255) NOT NULL,
  `answer_cn` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `note` varchar(255) NOT NULL,
  `staff_id` varchar(20) NOT NULL,
  `staff_name` varchar(20) NOT NULL,
  `addtime` datetime NOT NULL,
  `lastupdate_staff` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=355 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `manfaqs_am_20121102`
-- ----------------------------
DROP TABLE IF EXISTS `manfaqs_am_20121102`;
CREATE TABLE `manfaqs_am_20121102` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL DEFAULT '',
  `answer` text NOT NULL,
  `section` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `category` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_px` int(5) NOT NULL DEFAULT '0',
  `date_update` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `top_quest` char(1) NOT NULL DEFAULT 'N',
  `top_px` int(5) NOT NULL DEFAULT '0',
  `question_cn` varchar(255) NOT NULL,
  `answer_cn` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `note` varchar(255) NOT NULL,
  `staff_id` varchar(20) NOT NULL,
  `staff_name` varchar(20) NOT NULL,
  `addtime` datetime NOT NULL,
  `lastupdate_staff` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=377 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `manfaqs_am_bak140811`
-- ----------------------------
DROP TABLE IF EXISTS `manfaqs_am_bak140811`;
CREATE TABLE `manfaqs_am_bak140811` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL DEFAULT '',
  `answer` text NOT NULL,
  `section` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `category` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_px` int(5) NOT NULL DEFAULT '0',
  `date_update` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `top_quest` char(1) NOT NULL DEFAULT 'N',
  `top_px` int(5) NOT NULL DEFAULT '0',
  `question_cn` varchar(255) NOT NULL,
  `answer_cn` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `note` varchar(255) NOT NULL,
  `staff_id` varchar(20) NOT NULL,
  `staff_name` varchar(20) NOT NULL,
  `addtime` datetime NOT NULL,
  `lastupdate_staff` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=561 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `manorder`
-- ----------------------------
DROP TABLE IF EXISTS `manorder`;
CREATE TABLE `manorder` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `manid` varchar(20) NOT NULL DEFAULT '',
  `orderdate` date NOT NULL DEFAULT '0000-00-00',
  `submitdate` date NOT NULL DEFAULT '0000-00-00',
  `days` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7383 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `matchmaker_msg01_1m`
-- ----------------------------
DROP TABLE IF EXISTS `matchmaker_msg01_1m`;
CREATE TABLE `matchmaker_msg01_1m` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `womanid` varchar(20) NOT NULL DEFAULT '',
  `womanname` varchar(50) NOT NULL DEFAULT '',
  `manid` varchar(20) NOT NULL DEFAULT '',
  `manname` varchar(40) NOT NULL DEFAULT '',
  `submit_date` datetime NOT NULL,
  `sent_date` datetime NOT NULL,
  `readflag` char(1) NOT NULL DEFAULT '',
  `replyflag` char(1) NOT NULL DEFAULT '',
  `hideflag` char(1) NOT NULL DEFAULT '',
  `agent` varchar(12) NOT NULL DEFAULT '',
  `agent_staff` varchar(35) NOT NULL DEFAULT '',
  `resubmit` char(1) NOT NULL DEFAULT '',
  `sendflag` char(1) NOT NULL DEFAULT '',
  `replyid` varchar(16) NOT NULL DEFAULT '',
  `form_no` varchar(20) NOT NULL,
  `deleted` char(1) NOT NULL DEFAULT 'N',
  `readdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_staff` varchar(30) NOT NULL DEFAULT '',
  `review_trans` varchar(20) NOT NULL DEFAULT '',
  `deduction` smallint(1) NOT NULL DEFAULT '0',
  `review_mode` smallint(1) NOT NULL DEFAULT '0',
  `dc_date` datetime NOT NULL,
  `attachnum` tinyint(1) NOT NULL,
  `attitude` tinyint(1) NOT NULL,
  `sendmode` tinyint(1) NOT NULL,
  `template_id` varchar(20) NOT NULL,
  `groupid` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`),
  KEY `sent_date` (`sent_date`),
  KEY `submit_date` (`submit_date`,`manid`(10),`hideflag`),
  KEY `womanid` (`womanid`,`submit_date`),
  KEY `agent` (`agent`,`sendflag`,`hideflag`)
) ENGINE=MRG_MyISAM DEFAULT CHARSET=utf8 INSERT_METHOD=LAST UNION=(`matchmaker_msg01_201105`,`matchmaker_msg01_201106`);

-- ----------------------------
--  Table structure for `matchmaker_msg01_201103`
-- ----------------------------
DROP TABLE IF EXISTS `matchmaker_msg01_201103`;
CREATE TABLE `matchmaker_msg01_201103` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `womanid` varchar(20) NOT NULL DEFAULT '',
  `womanname` varchar(50) NOT NULL DEFAULT '',
  `manid` varchar(20) NOT NULL DEFAULT '',
  `manname` varchar(40) NOT NULL DEFAULT '',
  `submit_date` datetime NOT NULL,
  `sent_date` datetime NOT NULL,
  `readflag` char(1) NOT NULL DEFAULT '',
  `replyflag` char(1) NOT NULL DEFAULT '',
  `hideflag` char(1) NOT NULL DEFAULT '',
  `agent` varchar(12) NOT NULL DEFAULT '',
  `agent_staff` varchar(35) NOT NULL DEFAULT '',
  `resubmit` char(1) NOT NULL DEFAULT '',
  `sendflag` char(1) NOT NULL DEFAULT '',
  `replyid` varchar(16) NOT NULL DEFAULT '',
  `form_no` varchar(20) NOT NULL,
  `deleted` char(1) NOT NULL DEFAULT 'N',
  `readdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_staff` varchar(30) NOT NULL DEFAULT '',
  `review_trans` varchar(20) NOT NULL DEFAULT '',
  `deduction` smallint(1) NOT NULL DEFAULT '0',
  `review_mode` smallint(1) NOT NULL DEFAULT '0',
  `dc_date` datetime NOT NULL,
  `attachnum` tinyint(1) NOT NULL,
  `attitude` tinyint(1) NOT NULL,
  `sendmode` tinyint(1) NOT NULL,
  `template_id` varchar(20) NOT NULL,
  `groupid` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`),
  KEY `sent_date` (`sent_date`),
  KEY `submit_date` (`submit_date`,`manid`(10),`hideflag`),
  KEY `womanid` (`womanid`,`submit_date`),
  KEY `agent` (`agent`,`sendflag`,`hideflag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='admimier 201106';

-- ----------------------------
--  Table structure for `matchmaker_msg01_201104`
-- ----------------------------
DROP TABLE IF EXISTS `matchmaker_msg01_201104`;
CREATE TABLE `matchmaker_msg01_201104` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `womanid` varchar(20) NOT NULL DEFAULT '',
  `womanname` varchar(50) NOT NULL DEFAULT '',
  `manid` varchar(20) NOT NULL DEFAULT '',
  `manname` varchar(40) NOT NULL DEFAULT '',
  `submit_date` datetime NOT NULL,
  `sent_date` datetime NOT NULL,
  `readflag` char(1) NOT NULL DEFAULT '',
  `replyflag` char(1) NOT NULL DEFAULT '',
  `hideflag` char(1) NOT NULL DEFAULT '',
  `agent` varchar(12) NOT NULL DEFAULT '',
  `agent_staff` varchar(35) NOT NULL DEFAULT '',
  `resubmit` char(1) NOT NULL DEFAULT '',
  `sendflag` char(1) NOT NULL DEFAULT '',
  `replyid` varchar(16) NOT NULL DEFAULT '',
  `form_no` varchar(20) NOT NULL,
  `deleted` char(1) NOT NULL DEFAULT 'N',
  `readdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_staff` varchar(30) NOT NULL DEFAULT '',
  `review_trans` varchar(20) NOT NULL DEFAULT '',
  `deduction` smallint(1) NOT NULL DEFAULT '0',
  `review_mode` smallint(1) NOT NULL DEFAULT '0',
  `dc_date` datetime NOT NULL,
  `attachnum` tinyint(1) NOT NULL,
  `attitude` tinyint(1) NOT NULL,
  `sendmode` tinyint(1) NOT NULL,
  `template_id` varchar(20) NOT NULL,
  `groupid` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`),
  KEY `sent_date` (`sent_date`),
  KEY `submit_date` (`submit_date`,`manid`(10),`hideflag`),
  KEY `womanid` (`womanid`,`submit_date`),
  KEY `agent` (`agent`,`sendflag`,`hideflag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='admimier 201106';

-- ----------------------------
--  Table structure for `matchmaker_msg01_201105`
-- ----------------------------
DROP TABLE IF EXISTS `matchmaker_msg01_201105`;
CREATE TABLE `matchmaker_msg01_201105` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `womanid` varchar(20) NOT NULL DEFAULT '',
  `womanname` varchar(50) NOT NULL DEFAULT '',
  `manid` varchar(20) NOT NULL DEFAULT '',
  `manname` varchar(40) NOT NULL DEFAULT '',
  `submit_date` datetime NOT NULL,
  `sent_date` datetime NOT NULL,
  `readflag` char(1) NOT NULL DEFAULT '',
  `replyflag` char(1) NOT NULL DEFAULT '',
  `hideflag` char(1) NOT NULL DEFAULT '',
  `agent` varchar(12) NOT NULL DEFAULT '',
  `agent_staff` varchar(35) NOT NULL DEFAULT '',
  `resubmit` char(1) NOT NULL DEFAULT '',
  `sendflag` char(1) NOT NULL DEFAULT '',
  `replyid` varchar(16) NOT NULL DEFAULT '',
  `form_no` varchar(20) NOT NULL,
  `deleted` char(1) NOT NULL DEFAULT 'N',
  `readdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_staff` varchar(30) NOT NULL DEFAULT '',
  `review_trans` varchar(20) NOT NULL DEFAULT '',
  `deduction` smallint(1) NOT NULL DEFAULT '0',
  `review_mode` smallint(1) NOT NULL DEFAULT '0',
  `dc_date` datetime NOT NULL,
  `attachnum` tinyint(1) NOT NULL,
  `attitude` tinyint(1) NOT NULL,
  `sendmode` tinyint(1) NOT NULL,
  `template_id` varchar(20) NOT NULL,
  `groupid` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`),
  KEY `sent_date` (`sent_date`),
  KEY `submit_date` (`submit_date`,`manid`(10),`hideflag`),
  KEY `womanid` (`womanid`,`submit_date`),
  KEY `agent` (`agent`,`sendflag`,`hideflag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='admimier 201106';

-- ----------------------------
--  Table structure for `matchmaker_msg01_201106`
-- ----------------------------
DROP TABLE IF EXISTS `matchmaker_msg01_201106`;
CREATE TABLE `matchmaker_msg01_201106` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `womanid` varchar(20) NOT NULL DEFAULT '',
  `womanname` varchar(50) NOT NULL DEFAULT '',
  `manid` varchar(20) NOT NULL DEFAULT '',
  `manname` varchar(40) NOT NULL DEFAULT '',
  `submit_date` datetime NOT NULL,
  `sent_date` datetime NOT NULL,
  `readflag` char(1) NOT NULL DEFAULT '',
  `replyflag` char(1) NOT NULL DEFAULT '',
  `hideflag` char(1) NOT NULL DEFAULT '',
  `agent` varchar(12) NOT NULL DEFAULT '',
  `agent_staff` varchar(35) NOT NULL DEFAULT '',
  `resubmit` char(1) NOT NULL DEFAULT '',
  `sendflag` char(1) NOT NULL DEFAULT '',
  `replyid` varchar(16) NOT NULL DEFAULT '',
  `form_no` varchar(20) NOT NULL,
  `deleted` char(1) NOT NULL DEFAULT 'N',
  `readdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_staff` varchar(30) NOT NULL DEFAULT '',
  `review_trans` varchar(20) NOT NULL DEFAULT '',
  `deduction` smallint(1) NOT NULL DEFAULT '0',
  `review_mode` smallint(1) NOT NULL DEFAULT '0',
  `dc_date` datetime NOT NULL,
  `attachnum` tinyint(1) NOT NULL,
  `attitude` tinyint(1) NOT NULL,
  `sendmode` tinyint(1) NOT NULL,
  `template_id` varchar(20) NOT NULL,
  `groupid` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`),
  KEY `sent_date` (`sent_date`),
  KEY `submit_date` (`submit_date`,`manid`(10),`hideflag`),
  KEY `womanid` (`womanid`,`submit_date`),
  KEY `agent` (`agent`,`sendflag`,`hideflag`)
) ENGINE=MyISAM AUTO_INCREMENT=17575016 DEFAULT CHARSET=utf8 COMMENT='admimier 201106';

-- ----------------------------
--  Table structure for `matchmaker_msg01_3m`
-- ----------------------------
DROP TABLE IF EXISTS `matchmaker_msg01_3m`;
CREATE TABLE `matchmaker_msg01_3m` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `womanid` varchar(20) NOT NULL DEFAULT '',
  `womanname` varchar(50) NOT NULL DEFAULT '',
  `manid` varchar(20) NOT NULL DEFAULT '',
  `manname` varchar(40) NOT NULL DEFAULT '',
  `submit_date` datetime NOT NULL,
  `sent_date` datetime NOT NULL,
  `readflag` char(1) NOT NULL DEFAULT '',
  `replyflag` char(1) NOT NULL DEFAULT '',
  `hideflag` char(1) NOT NULL DEFAULT '',
  `agent` varchar(12) NOT NULL DEFAULT '',
  `agent_staff` varchar(35) NOT NULL DEFAULT '',
  `resubmit` char(1) NOT NULL DEFAULT '',
  `sendflag` char(1) NOT NULL DEFAULT '',
  `replyid` varchar(16) NOT NULL DEFAULT '',
  `form_no` varchar(20) NOT NULL,
  `deleted` char(1) NOT NULL DEFAULT 'N',
  `readdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_staff` varchar(30) NOT NULL DEFAULT '',
  `review_trans` varchar(20) NOT NULL DEFAULT '',
  `deduction` smallint(1) NOT NULL DEFAULT '0',
  `review_mode` smallint(1) NOT NULL DEFAULT '0',
  `dc_date` datetime NOT NULL,
  `attachnum` tinyint(1) NOT NULL,
  `attitude` tinyint(1) NOT NULL,
  `sendmode` tinyint(1) NOT NULL,
  `template_id` varchar(20) NOT NULL,
  `groupid` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`),
  KEY `sent_date` (`sent_date`),
  KEY `submit_date` (`submit_date`,`manid`(10),`hideflag`),
  KEY `womanid` (`womanid`,`submit_date`),
  KEY `agent` (`agent`,`sendflag`,`hideflag`)
) ENGINE=MRG_MyISAM DEFAULT CHARSET=utf8 INSERT_METHOD=LAST UNION=(`matchmaker_msg01_201103`,`matchmaker_msg01_201104`,`matchmaker_msg01_201105`,`matchmaker_msg01_201106`);

-- ----------------------------
--  Table structure for `matchmaker_msg01_new`
-- ----------------------------
DROP TABLE IF EXISTS `matchmaker_msg01_new`;
CREATE TABLE `matchmaker_msg01_new` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `womanid` varchar(20) NOT NULL DEFAULT '',
  `womanname` varchar(50) NOT NULL DEFAULT '',
  `manid` varchar(20) NOT NULL DEFAULT '',
  `manname` varchar(40) NOT NULL DEFAULT '',
  `submit_date` datetime NOT NULL,
  `sent_date` datetime NOT NULL,
  `readflag` char(1) NOT NULL DEFAULT '',
  `replyflag` char(1) NOT NULL DEFAULT '',
  `hideflag` char(1) NOT NULL DEFAULT '',
  `agent` varchar(12) NOT NULL DEFAULT '',
  `agent_staff` varchar(35) NOT NULL DEFAULT '',
  `resubmit` char(1) NOT NULL DEFAULT '',
  `sendflag` char(1) NOT NULL DEFAULT '',
  `replyid` varchar(16) NOT NULL DEFAULT '',
  `form_no` varchar(20) NOT NULL,
  `deleted` char(1) NOT NULL DEFAULT 'N',
  `readdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_staff` varchar(30) NOT NULL DEFAULT '',
  `review_trans` varchar(20) NOT NULL DEFAULT '',
  `deduction` smallint(1) NOT NULL DEFAULT '0',
  `review_mode` smallint(1) NOT NULL DEFAULT '0',
  `dc_date` datetime NOT NULL,
  `attachnum` tinyint(1) NOT NULL,
  `attitude` tinyint(1) NOT NULL,
  `sendmode` tinyint(1) NOT NULL,
  `template_id` varchar(20) NOT NULL,
  `groupid` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`),
  KEY `sent_date` (`sent_date`),
  KEY `submit_date` (`submit_date`,`manid`(10),`hideflag`),
  KEY `womanid` (`womanid`,`submit_date`),
  KEY `agent` (`agent`,`sendflag`,`hideflag`)
) ENGINE=MRG_MyISAM DEFAULT CHARSET=utf8 UNION=(`matchmaker_msg01_unsend`,`matchmaker_msg01_201103`,`matchmaker_msg01_201104`,`matchmaker_msg01_201105`,`matchmaker_msg01_201106`);

-- ----------------------------
--  Table structure for `matchmaker_msg01_unsend`
-- ----------------------------
DROP TABLE IF EXISTS `matchmaker_msg01_unsend`;
CREATE TABLE `matchmaker_msg01_unsend` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `womanid` varchar(20) NOT NULL DEFAULT '',
  `womanname` varchar(50) NOT NULL DEFAULT '',
  `manid` varchar(20) NOT NULL DEFAULT '',
  `manname` varchar(40) NOT NULL DEFAULT '',
  `submit_date` datetime NOT NULL,
  `sent_date` datetime NOT NULL,
  `readflag` char(1) NOT NULL DEFAULT '',
  `replyflag` char(1) NOT NULL DEFAULT '',
  `hideflag` char(1) NOT NULL DEFAULT '',
  `agent` varchar(12) NOT NULL DEFAULT '',
  `agent_staff` varchar(35) NOT NULL DEFAULT '',
  `resubmit` char(1) NOT NULL DEFAULT '',
  `sendflag` char(1) NOT NULL DEFAULT '',
  `replyid` varchar(16) NOT NULL DEFAULT '',
  `form_no` varchar(20) NOT NULL,
  `deleted` char(1) NOT NULL DEFAULT 'N',
  `readdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_staff` varchar(30) NOT NULL DEFAULT '',
  `review_trans` varchar(20) NOT NULL DEFAULT '',
  `deduction` smallint(1) NOT NULL DEFAULT '0',
  `review_mode` smallint(1) NOT NULL DEFAULT '0',
  `dc_date` datetime NOT NULL,
  `attachnum` tinyint(1) NOT NULL,
  `attitude` tinyint(1) NOT NULL,
  `sendmode` tinyint(1) NOT NULL,
  `template_id` varchar(20) NOT NULL,
  `groupid` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`),
  KEY `sent_date` (`sent_date`),
  KEY `submit_date` (`submit_date`,`manid`(10),`hideflag`),
  KEY `womanid` (`womanid`,`submit_date`),
  KEY `agent` (`agent`,`sendflag`,`hideflag`)
) ENGINE=MyISAM AUTO_INCREMENT=17575015 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `matchmaker_msg02_1m`
-- ----------------------------
DROP TABLE IF EXISTS `matchmaker_msg02_1m`;
CREATE TABLE `matchmaker_msg02_1m` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `body` text,
  `reviewer` varchar(30) NOT NULL DEFAULT '',
  `lady_tel` varchar(60) DEFAULT NULL,
  `denyreason` text,
  `review_history` text,
  `ip` varchar(20) DEFAULT NULL,
  `computerid` varchar(10) DEFAULT NULL,
  `review_comm` text,
  `reviewer_trans` varchar(30) NOT NULL DEFAULT '',
  `attachment` varchar(170) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MRG_MyISAM DEFAULT CHARSET=utf8 INSERT_METHOD=LAST UNION=(`matchmaker_msg02_201105`,`matchmaker_msg02_201106`);

-- ----------------------------
--  Table structure for `matchmaker_msg02_201103`
-- ----------------------------
DROP TABLE IF EXISTS `matchmaker_msg02_201103`;
CREATE TABLE `matchmaker_msg02_201103` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `body` text,
  `reviewer` varchar(30) NOT NULL DEFAULT '',
  `lady_tel` varchar(60) DEFAULT NULL,
  `denyreason` text,
  `review_history` text,
  `ip` varchar(20) DEFAULT NULL,
  `computerid` varchar(10) DEFAULT NULL,
  `review_comm` text,
  `reviewer_trans` varchar(30) NOT NULL DEFAULT '',
  `attachment` varchar(170) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `matchmaker_msg02_201104`
-- ----------------------------
DROP TABLE IF EXISTS `matchmaker_msg02_201104`;
CREATE TABLE `matchmaker_msg02_201104` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `body` text,
  `reviewer` varchar(30) NOT NULL DEFAULT '',
  `lady_tel` varchar(60) DEFAULT NULL,
  `denyreason` text,
  `review_history` text,
  `ip` varchar(20) DEFAULT NULL,
  `computerid` varchar(10) DEFAULT NULL,
  `review_comm` text,
  `reviewer_trans` varchar(30) NOT NULL DEFAULT '',
  `attachment` varchar(170) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `matchmaker_msg02_201105`
-- ----------------------------
DROP TABLE IF EXISTS `matchmaker_msg02_201105`;
CREATE TABLE `matchmaker_msg02_201105` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `body` text,
  `reviewer` varchar(30) NOT NULL DEFAULT '',
  `lady_tel` varchar(60) DEFAULT NULL,
  `denyreason` text,
  `review_history` text,
  `ip` varchar(20) DEFAULT NULL,
  `computerid` varchar(10) DEFAULT NULL,
  `review_comm` text,
  `reviewer_trans` varchar(30) NOT NULL DEFAULT '',
  `attachment` varchar(170) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `matchmaker_msg02_201106`
-- ----------------------------
DROP TABLE IF EXISTS `matchmaker_msg02_201106`;
CREATE TABLE `matchmaker_msg02_201106` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `body` text,
  `reviewer` varchar(30) NOT NULL DEFAULT '',
  `lady_tel` varchar(60) DEFAULT NULL,
  `denyreason` text,
  `review_history` text,
  `ip` varchar(20) DEFAULT NULL,
  `computerid` varchar(10) DEFAULT NULL,
  `review_comm` text,
  `reviewer_trans` varchar(30) NOT NULL DEFAULT '',
  `attachment` varchar(170) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17575016 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `matchmaker_msg02_3m`
-- ----------------------------
DROP TABLE IF EXISTS `matchmaker_msg02_3m`;
CREATE TABLE `matchmaker_msg02_3m` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `body` text,
  `reviewer` varchar(30) NOT NULL DEFAULT '',
  `lady_tel` varchar(60) DEFAULT NULL,
  `denyreason` text,
  `review_history` text,
  `ip` varchar(20) DEFAULT NULL,
  `computerid` varchar(10) DEFAULT NULL,
  `review_comm` text,
  `reviewer_trans` varchar(30) NOT NULL DEFAULT '',
  `attachment` varchar(170) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MRG_MyISAM DEFAULT CHARSET=utf8 INSERT_METHOD=LAST UNION=(`matchmaker_msg02_201103`,`matchmaker_msg02_201104`,`matchmaker_msg02_201105`,`matchmaker_msg02_201106`);

-- ----------------------------
--  Table structure for `matchmaker_msg02_new`
-- ----------------------------
DROP TABLE IF EXISTS `matchmaker_msg02_new`;
CREATE TABLE `matchmaker_msg02_new` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `body` text,
  `reviewer` varchar(30) NOT NULL DEFAULT '',
  `lady_tel` varchar(60) DEFAULT NULL,
  `denyreason` text,
  `review_history` text,
  `ip` varchar(20) DEFAULT NULL,
  `computerid` varchar(10) DEFAULT NULL,
  `review_comm` text,
  `reviewer_trans` varchar(30) NOT NULL DEFAULT '',
  `attachment` varchar(170) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MRG_MyISAM DEFAULT CHARSET=utf8 INSERT_METHOD=LAST UNION=(`matchmaker_msg02_unsend`,`matchmaker_msg02_201103`,`matchmaker_msg02_201104`,`matchmaker_msg02_201105`,`matchmaker_msg02_201106`);

-- ----------------------------
--  Table structure for `matchmaker_msg02_unsend`
-- ----------------------------
DROP TABLE IF EXISTS `matchmaker_msg02_unsend`;
CREATE TABLE `matchmaker_msg02_unsend` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `body` text,
  `reviewer` varchar(30) NOT NULL DEFAULT '',
  `lady_tel` varchar(60) DEFAULT NULL,
  `denyreason` text,
  `review_history` text,
  `ip` varchar(20) DEFAULT NULL,
  `computerid` varchar(10) DEFAULT NULL,
  `review_comm` text,
  `reviewer_trans` varchar(30) NOT NULL DEFAULT '',
  `attachment` varchar(170) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17575015 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `matchmaker_template`
-- ----------------------------
DROP TABLE IF EXISTS `matchmaker_template`;
CREATE TABLE `matchmaker_template` (
  `at_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `at_adddate` datetime NOT NULL,
  `at_editdate` datetime NOT NULL,
  `at_code` varchar(20) NOT NULL,
  `owner` varchar(6) NOT NULL,
  `company` varchar(100) NOT NULL,
  `womanid` varchar(12) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `at_title` varchar(60) NOT NULL,
  `at_greet` varchar(25) NOT NULL,
  `at_content_cn` text NOT NULL,
  `at_show_cn` char(1) NOT NULL,
  `at_content_en` text NOT NULL,
  `attachment` varchar(170) NOT NULL,
  `follower` varchar(30) NOT NULL,
  `follower_staffid` varchar(10) NOT NULL,
  `at_dodate` datetime NOT NULL,
  `our_follower` varchar(30) NOT NULL,
  `our_follower_id` varchar(15) NOT NULL,
  `at_isedit` char(1) NOT NULL,
  `at_delete` char(1) NOT NULL,
  `at_no_approval` varchar(1000) NOT NULL,
  `at_review_method` tinyint(1) NOT NULL DEFAULT '1',
  `at_status` char(1) NOT NULL,
  `groupid` varchar(10) NOT NULL,
  PRIMARY KEY (`at_id`),
  KEY `womanid` (`womanid`,`follower_staffid`)
) ENGINE=MyISAM AUTO_INCREMENT=136 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `member_activity`
-- ----------------------------
DROP TABLE IF EXISTS `member_activity`;
CREATE TABLE `member_activity` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `manid` varchar(15) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `last_login` datetime NOT NULL,
  `paid_amount` decimal(9,2) NOT NULL,
  `prom_code` varchar(15) NOT NULL,
  `prom_url` varchar(150) NOT NULL,
  `prom_title` varchar(255) NOT NULL,
  `readdate` datetime NOT NULL,
  `readflag` tinyint(1) NOT NULL,
  `replystatus` tinyint(1) NOT NULL,
  `ticketid` varchar(20) NOT NULL,
  `expiredate` datetime NOT NULL,
  `dismiss` tinyint(1) NOT NULL,
  `dismissdate` datetime NOT NULL,
  `adddate` datetime NOT NULL,
  `comment` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`)
) ENGINE=MyISAM AUTO_INCREMENT=460335 DEFAULT CHARSET=utf8 COMMENT='»áÔ±Í¨Öª±í';

-- ----------------------------
--  Table structure for `member_stats`
-- ----------------------------
DROP TABLE IF EXISTS `member_stats`;
CREATE TABLE `member_stats` (
  `manid` varchar(15) NOT NULL,
  `emf` int(5) NOT NULL,
  `admire` int(5) NOT NULL,
  `cupid` int(5) NOT NULL,
  `csmail` int(5) NOT NULL,
  `lastupdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `adddate` datetime NOT NULL,
  PRIMARY KEY (`manid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `member_zlje`
-- ----------------------------
DROP TABLE IF EXISTS `member_zlje`;
CREATE TABLE `member_zlje` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `country` char(2) NOT NULL,
  `adddate` date NOT NULL,
  `join_num` int(1) NOT NULL,
  `amount` float(8,2) NOT NULL,
  `paidmb` int(1) NOT NULL,
  `zlje` float(6,2) NOT NULL,
  `info` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10051 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `member_zlje_month`
-- ----------------------------
DROP TABLE IF EXISTS `member_zlje_month`;
CREATE TABLE `member_zlje_month` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `adddate` date NOT NULL,
  `country` char(2) NOT NULL,
  `smonth` varchar(7) NOT NULL,
  `member` int(11) NOT NULL,
  `amount` float(8,2) NOT NULL,
  `zlje` float(8,2) NOT NULL,
  `paidmb` int(2) NOT NULL,
  `info` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `adddate` (`adddate`,`country`)
) ENGINE=MyISAM AUTO_INCREMENT=12800 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `monitor_user`
-- ----------------------------
DROP TABLE IF EXISTS `monitor_user`;
CREATE TABLE `monitor_user` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `staff_id` varchar(20) NOT NULL DEFAULT '',
  `realname` varchar(30) NOT NULL DEFAULT '',
  `username` varchar(10) NOT NULL DEFAULT '',
  `enname` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `inuse` char(1) NOT NULL DEFAULT '0',
  `cs_email` varchar(100) NOT NULL,
  `cs_group` char(1) NOT NULL,
  `signature` varchar(255) NOT NULL,
  `agent` text NOT NULL,
  `quanxian` text NOT NULL,
  `im_name` varchar(40) NOT NULL DEFAULT '',
  `im_face` tinyint(1) NOT NULL DEFAULT '0',
  `im_dept` tinyint(1) NOT NULL DEFAULT '0',
  `im_agent` text NOT NULL,
  `contactinfo` text NOT NULL,
  `gender` char(1) NOT NULL DEFAULT 'F',
  `style_id` tinyint(1) NOT NULL DEFAULT '0',
  `lastlogin` datetime NOT NULL,
  `lastip` varchar(15) NOT NULL DEFAULT '',
  `loginnum` int(8) NOT NULL,
  `csmail` char(1) NOT NULL DEFAULT 'N',
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_spadmin` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `manage_sys` text NOT NULL,
  `guest_sys` text NOT NULL,
  `office` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=MyISAM AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `msg01`
-- ----------------------------
DROP TABLE IF EXISTS `msg01`;
CREATE TABLE `msg01` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `sendfid` varchar(12) NOT NULL DEFAULT '',
  `sendfname` varchar(40) NOT NULL DEFAULT '',
  `sendtid` varchar(12) NOT NULL DEFAULT '',
  `sendtname` varchar(40) NOT NULL DEFAULT '',
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `readflag` char(1) NOT NULL DEFAULT '0',
  `rflag` char(1) NOT NULL DEFAULT '0',
  `pflag` char(1) NOT NULL DEFAULT '0',
  `fflag` char(1) NOT NULL DEFAULT '0',
  `tflag` char(1) NOT NULL DEFAULT '0',
  `dflag` char(1) NOT NULL DEFAULT 'N',
  `agent` varchar(10) NOT NULL,
  `toflag` int(1) NOT NULL DEFAULT '0',
  `ykf` char(1) NOT NULL DEFAULT '',
  `kf_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `translator` varchar(20) NOT NULL,
  `wk_trans` varchar(10) NOT NULL DEFAULT '',
  `sendflag` char(1) NOT NULL DEFAULT 'Y',
  `rmethod` char(3) NOT NULL DEFAULT '',
  `status2` char(2) NOT NULL DEFAULT 'N',
  `review_level` char(3) NOT NULL DEFAULT '0',
  `review_flag` char(2) NOT NULL DEFAULT 'N',
  `reply_no` int(8) NOT NULL,
  `forward` char(1) NOT NULL DEFAULT 'N',
  `delay_rflag` char(1) NOT NULL DEFAULT 'N',
  `delay_rdisplay` char(1) NOT NULL DEFAULT 'N',
  `progress` char(1) NOT NULL DEFAULT '0',
  `score` tinyint(2) NOT NULL DEFAULT '0',
  `survey_date` datetime NOT NULL,
  `follower` varchar(10) NOT NULL,
  `attachnum` tinyint(1) NOT NULL,
  `sms` tinyint(1) NOT NULL DEFAULT '0',
  `groupid` varchar(10) NOT NULL,
  `integral` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `virtual_gifts` varchar(25) NOT NULL DEFAULT '0',
  `readflag_lady` char(1) NOT NULL DEFAULT '0',
  `isshow_on_lady` tinyint(1) NOT NULL DEFAULT '2',
  `reply_by` tinyint(1) NOT NULL DEFAULT '0',
  `simplebody` varchar(255) DEFAULT NULL,
  `is_collect` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `short_video` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `short_video_credit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `letter_paper` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sendfid` (`sendfid`),
  KEY `sendtid` (`sendtid`),
  KEY `agent` (`agent`),
  KEY `forreview` (`toflag`,`review_flag`,`review_level`,`adddate`),
  KEY `foremf` (`toflag`,`forward`,`sendflag`,`adddate`)
) ENGINE=MRG_MyISAM DEFAULT CHARSET=utf8 INSERT_METHOD=LAST UNION=(`msg01_2009`);

-- ----------------------------
--  Table structure for `msg01_2008`
-- ----------------------------
DROP TABLE IF EXISTS `msg01_2008`;
CREATE TABLE `msg01_2008` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `sendfid` varchar(12) NOT NULL DEFAULT '',
  `sendfname` varchar(40) NOT NULL DEFAULT '',
  `sendtid` varchar(12) NOT NULL DEFAULT '',
  `sendtname` varchar(40) NOT NULL DEFAULT '',
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `readflag` char(1) NOT NULL DEFAULT '0',
  `rflag` char(1) NOT NULL DEFAULT '0',
  `pflag` char(1) NOT NULL DEFAULT '0',
  `fflag` char(1) NOT NULL DEFAULT '0',
  `tflag` char(1) NOT NULL DEFAULT '0',
  `dflag` char(1) NOT NULL DEFAULT 'N',
  `agent` varchar(10) NOT NULL,
  `toflag` int(1) NOT NULL DEFAULT '0',
  `ykf` char(1) NOT NULL DEFAULT '',
  `kf_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `translator` varchar(20) NOT NULL,
  `wk_trans` varchar(10) NOT NULL DEFAULT '',
  `sendflag` char(1) NOT NULL DEFAULT 'Y',
  `rmethod` char(3) NOT NULL DEFAULT '',
  `status2` char(2) NOT NULL DEFAULT 'N',
  `review_level` char(3) NOT NULL DEFAULT '0',
  `review_flag` char(2) NOT NULL DEFAULT 'N',
  `reply_no` int(8) NOT NULL,
  `forward` char(1) NOT NULL DEFAULT 'N',
  `delay_rflag` char(1) NOT NULL DEFAULT 'N',
  `delay_rdisplay` char(1) NOT NULL DEFAULT 'N',
  `progress` char(1) NOT NULL DEFAULT '0',
  `score` tinyint(2) NOT NULL DEFAULT '0',
  `survey_date` datetime NOT NULL,
  `follower` varchar(10) NOT NULL,
  `attachnum` tinyint(1) NOT NULL,
  `sms` tinyint(1) NOT NULL DEFAULT '0',
  `groupid` varchar(10) NOT NULL,
  `integral` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `virtual_gifts` varchar(25) NOT NULL DEFAULT '0',
  `readflag_lady` char(1) NOT NULL DEFAULT '0',
  `isshow_on_lady` tinyint(1) NOT NULL DEFAULT '2',
  `reply_by` tinyint(1) NOT NULL DEFAULT '0',
  `simplebody` varchar(255) DEFAULT NULL,
  `is_collect` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `letter_paper` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sendfid` (`sendfid`),
  KEY `sendtid` (`sendtid`),
  KEY `agent` (`agent`),
  KEY `forreview` (`toflag`,`review_flag`,`review_level`,`adddate`),
  KEY `foremf` (`toflag`,`forward`,`sendflag`,`adddate`)
) ENGINE=MyISAM AUTO_INCREMENT=2454221 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `msg01_2009`
-- ----------------------------
DROP TABLE IF EXISTS `msg01_2009`;
CREATE TABLE `msg01_2009` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `sendfid` varchar(12) NOT NULL DEFAULT '',
  `sendfname` varchar(40) NOT NULL DEFAULT '',
  `sendtid` varchar(12) NOT NULL DEFAULT '',
  `sendtname` varchar(40) NOT NULL DEFAULT '',
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `readflag` char(1) NOT NULL DEFAULT '0',
  `rflag` char(1) NOT NULL DEFAULT '0',
  `pflag` char(1) NOT NULL DEFAULT '0',
  `fflag` char(1) NOT NULL DEFAULT '0',
  `tflag` char(1) NOT NULL DEFAULT '0',
  `dflag` char(1) NOT NULL DEFAULT 'N',
  `agent` varchar(10) NOT NULL,
  `toflag` int(1) NOT NULL DEFAULT '0',
  `ykf` char(1) NOT NULL DEFAULT '',
  `kf_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `translator` varchar(20) NOT NULL,
  `wk_trans` varchar(10) NOT NULL DEFAULT '',
  `sendflag` char(1) NOT NULL DEFAULT 'Y',
  `rmethod` char(3) NOT NULL DEFAULT '',
  `status2` char(2) NOT NULL DEFAULT 'N',
  `review_level` char(3) NOT NULL DEFAULT '0',
  `review_flag` char(2) NOT NULL DEFAULT 'N',
  `reply_no` int(8) NOT NULL,
  `forward` char(1) NOT NULL DEFAULT 'N',
  `delay_rflag` char(1) NOT NULL DEFAULT 'N',
  `delay_rdisplay` char(1) NOT NULL DEFAULT 'N',
  `progress` char(1) NOT NULL DEFAULT '0',
  `score` tinyint(2) NOT NULL DEFAULT '0',
  `survey_date` datetime NOT NULL,
  `follower` varchar(10) NOT NULL,
  `attachnum` tinyint(1) NOT NULL,
  `sms` tinyint(1) NOT NULL DEFAULT '0',
  `groupid` varchar(10) NOT NULL,
  `integral` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `virtual_gifts` varchar(25) NOT NULL DEFAULT '0',
  `readflag_lady` char(1) NOT NULL DEFAULT '0',
  `isshow_on_lady` tinyint(1) NOT NULL DEFAULT '2',
  `reply_by` tinyint(1) NOT NULL DEFAULT '0',
  `simplebody` varchar(255) DEFAULT NULL,
  `is_collect` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `short_video` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `short_video_credit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `letter_paper` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sendfid` (`sendfid`),
  KEY `sendtid` (`sendtid`),
  KEY `agent` (`agent`),
  KEY `forreview` (`toflag`,`review_flag`,`review_level`,`adddate`),
  KEY `foremf` (`toflag`,`forward`,`sendflag`,`adddate`)
) ENGINE=MyISAM AUTO_INCREMENT=5748545 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `msg01_2010`
-- ----------------------------
DROP TABLE IF EXISTS `msg01_2010`;
CREATE TABLE `msg01_2010` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `sendfid` varchar(12) NOT NULL DEFAULT '',
  `sendfname` varchar(40) NOT NULL DEFAULT '',
  `sendtid` varchar(12) NOT NULL DEFAULT '',
  `sendtname` varchar(40) NOT NULL DEFAULT '',
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `readflag` char(1) NOT NULL DEFAULT '0',
  `rflag` char(1) NOT NULL DEFAULT '0',
  `pflag` char(1) NOT NULL DEFAULT '0',
  `fflag` char(1) NOT NULL DEFAULT '0',
  `tflag` char(1) NOT NULL DEFAULT '0',
  `dflag` char(1) NOT NULL DEFAULT 'N',
  `agent` varchar(10) NOT NULL,
  `toflag` int(1) NOT NULL DEFAULT '0',
  `ykf` char(1) NOT NULL DEFAULT '',
  `translator` varchar(20) NOT NULL,
  `wk_trans` varchar(10) NOT NULL DEFAULT '',
  `sendflag` char(1) NOT NULL DEFAULT 'Y',
  `rmethod` char(3) NOT NULL DEFAULT '',
  `status2` char(2) NOT NULL DEFAULT 'N',
  `review_level` char(3) NOT NULL DEFAULT '0',
  `review_flag` char(2) NOT NULL DEFAULT 'N',
  `reply_no` int(8) NOT NULL,
  `forward` char(1) NOT NULL DEFAULT 'N',
  `delay_rflag` char(1) NOT NULL DEFAULT 'N',
  `delay_rdisplay` char(1) NOT NULL DEFAULT 'N',
  `progress` char(1) NOT NULL DEFAULT '0',
  `score` tinyint(2) NOT NULL DEFAULT '0',
  `survey_date` datetime NOT NULL,
  `follower` varchar(10) NOT NULL,
  `attachnum` tinyint(1) NOT NULL,
  `sms` tinyint(1) NOT NULL DEFAULT '0',
  `groupid` varchar(10) NOT NULL,
  `integral` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `virtual_gifts` varchar(25) NOT NULL DEFAULT '0',
  `readflag_lady` char(1) NOT NULL DEFAULT '0',
  `simplebody` varchar(255) DEFAULT NULL,
  `is_collect` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `letter_paper` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sendfid` (`sendfid`),
  KEY `sendtid` (`sendtid`),
  KEY `agent` (`agent`),
  KEY `forreview` (`toflag`,`review_flag`,`review_level`,`adddate`),
  KEY `foremf` (`toflag`,`forward`,`sendflag`,`adddate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `msg01_draft`
-- ----------------------------
DROP TABLE IF EXISTS `msg01_draft`;
CREATE TABLE `msg01_draft` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `sendfid` varchar(12) NOT NULL DEFAULT '',
  `sendfname` varchar(40) NOT NULL DEFAULT '',
  `sendtid` varchar(12) NOT NULL DEFAULT '',
  `sendtname` varchar(40) NOT NULL DEFAULT '',
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `readflag` char(1) NOT NULL DEFAULT '0',
  `rflag` char(1) NOT NULL DEFAULT '0',
  `pflag` char(1) NOT NULL DEFAULT '0',
  `fflag` char(1) NOT NULL DEFAULT '0',
  `tflag` char(1) NOT NULL DEFAULT '0',
  `dflag` char(1) NOT NULL DEFAULT 'N',
  `agent` varchar(10) NOT NULL,
  `toflag` int(1) NOT NULL DEFAULT '0',
  `ykf` char(1) NOT NULL DEFAULT '',
  `translator` varchar(20) NOT NULL,
  `wk_trans` varchar(10) NOT NULL DEFAULT '',
  `sendflag` char(1) NOT NULL DEFAULT 'Y',
  `rmethod` char(3) NOT NULL DEFAULT '',
  `status2` char(2) NOT NULL DEFAULT 'N',
  `review_level` char(3) NOT NULL DEFAULT '0',
  `review_flag` char(2) NOT NULL DEFAULT 'N',
  `reply_no` int(8) NOT NULL,
  `forward` char(1) NOT NULL DEFAULT 'N',
  `delay_rflag` char(1) NOT NULL DEFAULT 'N',
  `delay_rdisplay` char(1) NOT NULL DEFAULT 'N',
  `progress` char(1) NOT NULL DEFAULT '0',
  `score` tinyint(2) NOT NULL DEFAULT '0',
  `survey_date` datetime NOT NULL,
  `follower` varchar(10) NOT NULL,
  `attachnum` tinyint(1) NOT NULL,
  `sms` tinyint(1) NOT NULL DEFAULT '0',
  `groupid` varchar(10) NOT NULL,
  `integral` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `virtual_gifts` varchar(25) NOT NULL DEFAULT '0',
  `isshow_on_lady` tinyint(1) NOT NULL DEFAULT '2',
  `reply_by` tinyint(1) NOT NULL DEFAULT '0',
  `readflag_lady` char(1) NOT NULL DEFAULT '0',
  `simplebody` varchar(255) DEFAULT NULL,
  `is_collect` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `short_video` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `short_video_credit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `letter_paper` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sendfid` (`sendfid`),
  KEY `sendtid` (`sendtid`),
  KEY `agent` (`agent`),
  KEY `forreview` (`toflag`,`review_flag`,`review_level`,`adddate`),
  KEY `foremf` (`toflag`,`forward`,`sendflag`,`adddate`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `msg01_earlier`
-- ----------------------------
DROP TABLE IF EXISTS `msg01_earlier`;
CREATE TABLE `msg01_earlier` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `sendfid` varchar(12) NOT NULL DEFAULT '',
  `sendfname` varchar(40) NOT NULL DEFAULT '',
  `sendtid` varchar(12) NOT NULL DEFAULT '',
  `sendtname` varchar(40) NOT NULL DEFAULT '',
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `readflag` char(1) NOT NULL DEFAULT '0',
  `rflag` char(1) NOT NULL DEFAULT '0',
  `pflag` char(1) NOT NULL DEFAULT '0',
  `fflag` char(1) NOT NULL DEFAULT '0',
  `tflag` char(1) NOT NULL DEFAULT '0',
  `dflag` char(1) NOT NULL DEFAULT 'N',
  `agent` varchar(10) NOT NULL,
  `toflag` int(1) NOT NULL DEFAULT '0',
  `ykf` char(1) NOT NULL DEFAULT '',
  `kf_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `translator` varchar(20) NOT NULL,
  `wk_trans` varchar(10) NOT NULL DEFAULT '',
  `sendflag` char(1) NOT NULL DEFAULT 'Y',
  `rmethod` char(3) NOT NULL DEFAULT '',
  `status2` char(2) NOT NULL DEFAULT 'N',
  `review_level` char(3) NOT NULL DEFAULT '0',
  `review_flag` char(2) NOT NULL DEFAULT 'N',
  `reply_no` int(8) NOT NULL,
  `forward` char(1) NOT NULL DEFAULT 'N',
  `delay_rflag` char(1) NOT NULL DEFAULT 'N',
  `delay_rdisplay` char(1) NOT NULL DEFAULT 'N',
  `progress` char(1) NOT NULL DEFAULT '0',
  `score` tinyint(2) NOT NULL DEFAULT '0',
  `survey_date` datetime NOT NULL,
  `follower` varchar(10) NOT NULL,
  `attachnum` tinyint(1) NOT NULL,
  `sms` tinyint(1) NOT NULL DEFAULT '0',
  `groupid` varchar(10) NOT NULL,
  `integral` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `virtual_gifts` varchar(25) NOT NULL DEFAULT '0',
  `readflag_lady` char(1) NOT NULL DEFAULT '0',
  `isshow_on_lady` tinyint(1) NOT NULL DEFAULT '2',
  `reply_by` tinyint(1) NOT NULL DEFAULT '0',
  `simplebody` varchar(255) DEFAULT NULL,
  `is_collect` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `short_video` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `short_video_credit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `letter_paper` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sendfid` (`sendfid`),
  KEY `sendtid` (`sendtid`),
  KEY `agent` (`agent`),
  KEY `forreview` (`toflag`,`review_flag`,`review_level`,`adddate`),
  KEY `foremf` (`toflag`,`forward`,`sendflag`,`adddate`)
) ENGINE=MRG_MyISAM DEFAULT CHARSET=utf8 INSERT_METHOD=LAST UNION=(`msg01_2009`);

-- ----------------------------
--  Table structure for `msg01_last7days`
-- ----------------------------
DROP TABLE IF EXISTS `msg01_last7days`;
CREATE TABLE `msg01_last7days` (
  `id` bigint(10) NOT NULL DEFAULT '0',
  `sendfid` varchar(12) NOT NULL DEFAULT '',
  `sendfname` varchar(40) NOT NULL DEFAULT '',
  `sendtid` varchar(12) NOT NULL DEFAULT '',
  `sendtname` varchar(40) NOT NULL DEFAULT '',
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `agent` varchar(20) NOT NULL,
  `readflag` char(1) NOT NULL DEFAULT '0',
  `rflag` char(1) NOT NULL DEFAULT '0',
  `pflag` char(1) NOT NULL DEFAULT '0',
  `fflag` char(1) NOT NULL DEFAULT '0',
  `wk_trans` varchar(10) NOT NULL DEFAULT '',
  `sendflag` char(1) NOT NULL DEFAULT 'Y',
  `attachnum` tinyint(1) NOT NULL,
  `groupid` varchar(10) NOT NULL,
  `reply_by` tinyint(1) NOT NULL DEFAULT '1',
  `body_md5` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wk_trans` (`wk_trans`),
  KEY `agent` (`agent`,`groupid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `msg02`
-- ----------------------------
DROP TABLE IF EXISTS `msg02`;
CREATE TABLE `msg02` (
  `id` bigint(10) NOT NULL DEFAULT '0',
  `body` text NOT NULL,
  `translation` text,
  `transtime` datetime DEFAULT NULL,
  `comment` text NOT NULL,
  `ip` varchar(50) NOT NULL DEFAULT '',
  `denyreason` text NOT NULL,
  `reviewer` varchar(20) NOT NULL DEFAULT '',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_comm` text NOT NULL,
  `lady_tel` varchar(50) NOT NULL DEFAULT '',
  `computerid` varchar(20) NOT NULL DEFAULT '',
  `delay_reason` text,
  `notetoman` text NOT NULL,
  `attachment` varchar(170) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MRG_MyISAM DEFAULT CHARSET=utf8 INSERT_METHOD=LAST UNION=(`msg02_2009`);

-- ----------------------------
--  Table structure for `msg02_2008`
-- ----------------------------
DROP TABLE IF EXISTS `msg02_2008`;
CREATE TABLE `msg02_2008` (
  `id` bigint(10) NOT NULL DEFAULT '0',
  `body` text NOT NULL,
  `translation` text,
  `transtime` datetime DEFAULT NULL,
  `comment` text NOT NULL,
  `ip` varchar(50) NOT NULL DEFAULT '',
  `denyreason` text NOT NULL,
  `reviewer` varchar(20) NOT NULL DEFAULT '',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_comm` text NOT NULL,
  `lady_tel` varchar(50) NOT NULL DEFAULT '',
  `computerid` varchar(20) NOT NULL DEFAULT '',
  `delay_reason` text,
  `notetoman` text NOT NULL,
  `attachment` varchar(170) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `msg02_2009`
-- ----------------------------
DROP TABLE IF EXISTS `msg02_2009`;
CREATE TABLE `msg02_2009` (
  `id` bigint(10) NOT NULL DEFAULT '0',
  `body` text NOT NULL,
  `translation` text,
  `transtime` datetime DEFAULT NULL,
  `comment` text NOT NULL,
  `ip` varchar(50) NOT NULL DEFAULT '',
  `denyreason` text NOT NULL,
  `reviewer` varchar(20) NOT NULL DEFAULT '',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_comm` text NOT NULL,
  `lady_tel` varchar(50) NOT NULL DEFAULT '',
  `computerid` varchar(20) NOT NULL DEFAULT '',
  `delay_reason` text,
  `notetoman` text NOT NULL,
  `attachment` varchar(170) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `msg02_2010`
-- ----------------------------
DROP TABLE IF EXISTS `msg02_2010`;
CREATE TABLE `msg02_2010` (
  `id` bigint(10) NOT NULL DEFAULT '0',
  `body` text NOT NULL,
  `translation` text,
  `transtime` datetime DEFAULT NULL,
  `comment` text NOT NULL,
  `ip` varchar(50) NOT NULL DEFAULT '',
  `denyreason` text NOT NULL,
  `reviewer` varchar(20) NOT NULL DEFAULT '',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_comm` text NOT NULL,
  `lady_tel` varchar(50) NOT NULL DEFAULT '',
  `computerid` varchar(20) NOT NULL DEFAULT '',
  `delay_reason` text,
  `notetoman` text NOT NULL,
  `attachment` varchar(170) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `msg02_all`
-- ----------------------------
DROP TABLE IF EXISTS `msg02_all`;
CREATE TABLE `msg02_all` (
  `id` bigint(10) NOT NULL DEFAULT '0',
  `body` text NOT NULL,
  `translation` text,
  `transtime` datetime DEFAULT NULL,
  `comment` text NOT NULL,
  `ip` varchar(50) NOT NULL DEFAULT '',
  `denyreason` text NOT NULL,
  `reviewer` varchar(20) NOT NULL DEFAULT '',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_comm` text NOT NULL,
  `lady_tel` varchar(50) NOT NULL DEFAULT '',
  `computerid` varchar(20) NOT NULL DEFAULT '',
  `delay_reason` text,
  `notetoman` text NOT NULL,
  `attachment` varchar(170) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MRG_MyISAM DEFAULT CHARSET=utf8 INSERT_METHOD=LAST UNION=(`msg02_2008`,`msg02_2009`);

-- ----------------------------
--  Table structure for `msg02_draft`
-- ----------------------------
DROP TABLE IF EXISTS `msg02_draft`;
CREATE TABLE `msg02_draft` (
  `id` bigint(10) NOT NULL DEFAULT '0',
  `body` text NOT NULL,
  `translation` text,
  `transtime` datetime DEFAULT NULL,
  `comment` text NOT NULL,
  `ip` varchar(50) NOT NULL DEFAULT '',
  `denyreason` text NOT NULL,
  `reviewer` varchar(20) NOT NULL DEFAULT '',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_comm` text NOT NULL,
  `lady_tel` varchar(50) NOT NULL DEFAULT '',
  `computerid` varchar(20) NOT NULL DEFAULT '',
  `delay_reason` text,
  `notetoman` text NOT NULL,
  `attachment` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `msg_lady_01`
-- ----------------------------
DROP TABLE IF EXISTS `msg_lady_01`;
CREATE TABLE `msg_lady_01` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `manemfid` bigint(10) NOT NULL,
  `emfid` bigint(10) NOT NULL,
  `sendfid` varchar(12) NOT NULL DEFAULT '',
  `sendfname` varchar(40) NOT NULL DEFAULT '',
  `sendtid` varchar(12) NOT NULL DEFAULT '',
  `sendtname` varchar(40) NOT NULL DEFAULT '',
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `readflag` char(1) NOT NULL DEFAULT '0',
  `rflag` char(1) NOT NULL DEFAULT '0',
  `pflag` char(1) NOT NULL DEFAULT '0',
  `fflag` char(1) NOT NULL DEFAULT '0',
  `tflag` char(1) NOT NULL DEFAULT '0',
  `dflag` char(1) NOT NULL DEFAULT 'N',
  `agent` varchar(10) NOT NULL,
  `toflag` int(1) NOT NULL DEFAULT '0',
  `ykf` char(1) NOT NULL DEFAULT '',
  `translator` varchar(20) NOT NULL,
  `wk_trans` varchar(10) NOT NULL DEFAULT '',
  `sendflag` char(1) NOT NULL DEFAULT 'Y',
  `rmethod` char(3) NOT NULL DEFAULT '',
  `status2` char(2) NOT NULL DEFAULT 'N',
  `review_level` char(3) NOT NULL DEFAULT '0',
  `review_flag` char(2) NOT NULL DEFAULT 'N',
  `reply_no` int(8) NOT NULL,
  `forward` char(1) NOT NULL DEFAULT 'N',
  `delay_rflag` char(1) NOT NULL DEFAULT 'N',
  `delay_rdisplay` char(1) NOT NULL DEFAULT 'N',
  `progress` char(1) NOT NULL DEFAULT '0',
  `score` tinyint(2) NOT NULL DEFAULT '0',
  `survey_date` datetime NOT NULL,
  `follower` varchar(10) NOT NULL,
  `follower_name` varchar(70) NOT NULL,
  `division_staff` varchar(10) NOT NULL,
  `division_name` varchar(70) NOT NULL,
  `attachnum` tinyint(1) NOT NULL,
  `sms` tinyint(1) NOT NULL DEFAULT '0',
  `groupid` varchar(10) NOT NULL,
  `integral` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `virtual_gifts` varchar(25) NOT NULL DEFAULT '0',
  `check_reason` tinyint(1) NOT NULL DEFAULT '0',
  `check_by` char(5) DEFAULT NULL,
  `check_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `sendfid` (`sendfid`),
  KEY `sendtid` (`sendtid`),
  KEY `agent` (`agent`),
  KEY `forreview` (`toflag`,`review_flag`,`review_level`,`adddate`),
  KEY `foremf` (`toflag`,`forward`,`sendflag`,`adddate`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `msg_lady_02`
-- ----------------------------
DROP TABLE IF EXISTS `msg_lady_02`;
CREATE TABLE `msg_lady_02` (
  `id` bigint(10) NOT NULL DEFAULT '0',
  `body` text NOT NULL,
  `translation` text,
  `transtime` datetime DEFAULT NULL,
  `comment` text NOT NULL,
  `ip` varchar(50) NOT NULL DEFAULT '',
  `denyreason` text NOT NULL,
  `reviewer` varchar(20) NOT NULL DEFAULT '',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_comm` text NOT NULL,
  `lady_tel` varchar(50) NOT NULL DEFAULT '',
  `computerid` varchar(20) NOT NULL DEFAULT '',
  `delay_reason` text,
  `notetoman` text NOT NULL,
  `attachment` varchar(170) NOT NULL,
  `check_note` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `my_addresslist`
-- ----------------------------
DROP TABLE IF EXISTS `my_addresslist`;
CREATE TABLE `my_addresslist` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `owner` varchar(20) NOT NULL DEFAULT '',
  `firstname` varchar(30) NOT NULL DEFAULT '',
  `lastname` varchar(30) NOT NULL DEFAULT '',
  `enname` varchar(30) NOT NULL DEFAULT '',
  `area` int(2) unsigned NOT NULL DEFAULT '0',
  `city` varchar(50) NOT NULL DEFAULT '',
  `guilei` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `shuxing` tinyint(1) NOT NULL DEFAULT '0',
  `phone_office` varchar(50) NOT NULL DEFAULT '',
  `phone_home` varchar(50) NOT NULL DEFAULT '',
  `phone_mobile` varchar(50) NOT NULL DEFAULT '',
  `addr_home` varchar(200) NOT NULL DEFAULT '',
  `company` varchar(150) NOT NULL DEFAULT '',
  `addr_company` varchar(200) NOT NULL DEFAULT '',
  `email` varchar(150) NOT NULL DEFAULT '',
  `other` text NOT NULL,
  `lastupdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=136 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `news_media`
-- ----------------------------
DROP TABLE IF EXISTS `news_media`;
CREATE TABLE `news_media` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `status` char(1) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `brief` varchar(600) NOT NULL,
  `body` text NOT NULL,
  `subdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `index_image` varchar(200) NOT NULL,
  `index_image_big` varchar(200) NOT NULL,
  `tag` varchar(300) NOT NULL,
  `is_recommend` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `subdate` (`subdate`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `note_sys_bak20100527`
-- ----------------------------
DROP TABLE IF EXISTS `note_sys_bak20100527`;
CREATE TABLE `note_sys_bak20100527` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `noteobj` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `refid` varchar(20) NOT NULL,
  `notetype` tinyint(1) unsigned NOT NULL,
  `subject` varchar(200) NOT NULL,
  `note` text NOT NULL,
  `addtime` datetime NOT NULL,
  `follower_id` varchar(10) NOT NULL,
  `follower_name` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `noteobj` (`noteobj`,`refid`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `notify`
-- ----------------------------
DROP TABLE IF EXISTS `notify`;
CREATE TABLE `notify` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `owner` char(1) NOT NULL DEFAULT 'A',
  `category` tinyint(1) NOT NULL DEFAULT '0',
  `status` char(1) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `brief` varchar(600) NOT NULL,
  `body` text NOT NULL,
  `subdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `validtime` int(10) NOT NULL DEFAULT '0',
  `overviewtime` datetime NOT NULL,
  `visible` varchar(50) NOT NULL,
  `visibletype` varchar(300) NOT NULL,
  `n_image` varchar(200) NOT NULL,
  `w_image` varchar(200) NOT NULL,
  `index_image` varchar(200) NOT NULL,
  `index_image_big` varchar(200) NOT NULL,
  `tag` varchar(300) NOT NULL,
  `position` tinyint(1) NOT NULL DEFAULT '1',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `subdate` (`subdate`)
) ENGINE=MyISAM AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `notify_bak140811`
-- ----------------------------
DROP TABLE IF EXISTS `notify_bak140811`;
CREATE TABLE `notify_bak140811` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `owner` char(1) NOT NULL DEFAULT 'A',
  `category` tinyint(1) NOT NULL DEFAULT '0',
  `status` char(1) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `brief` varchar(600) NOT NULL,
  `body` text NOT NULL,
  `subdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `validtime` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `subdate` (`subdate`)
) ENGINE=MyISAM AUTO_INCREMENT=246 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `order_black_list`
-- ----------------------------
DROP TABLE IF EXISTS `order_black_list`;
CREATE TABLE `order_black_list` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `datatype` char(1) NOT NULL,
  `manid` varchar(15) NOT NULL DEFAULT '',
  `ip1` double(15,0) NOT NULL,
  `ip2` double(15,0) NOT NULL,
  `holder` varchar(35) NOT NULL,
  `comment` varchar(500) NOT NULL,
  `adddate` datetime NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'Y',
  `creator` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3002 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `order_detail`
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `orderno` char(30) NOT NULL,
  `name` char(255) NOT NULL,
  `quantity` int(5) NOT NULL DEFAULT '0',
  `price` decimal(6,2) NOT NULL DEFAULT '0.00',
  `objtype` char(25) NOT NULL,
  `creditsnum` int(5) NOT NULL DEFAULT '0',
  `total` decimal(6,2) NOT NULL DEFAULT '0.00',
  `item_code` varchar(15) NOT NULL,
  `price2` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orderno` (`orderno`)
) ENGINE=MyISAM AUTO_INCREMENT=555451 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `order_main`
-- ----------------------------
DROP TABLE IF EXISTS `order_main`;
CREATE TABLE `order_main` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `orderno` varchar(30) NOT NULL DEFAULT '',
  `txnid` varchar(50) NOT NULL DEFAULT '',
  `orderdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `manid` varchar(15) NOT NULL DEFAULT '',
  `manname` varchar(40) NOT NULL DEFAULT '',
  `status` char(2) NOT NULL DEFAULT '',
  `amount` decimal(7,2) NOT NULL DEFAULT '0.00',
  `creditsnum` int(5) NOT NULL DEFAULT '0',
  `source` varchar(5) NOT NULL DEFAULT '',
  `agent` varchar(200) NOT NULL DEFAULT '',
  `ip` varchar(30) NOT NULL DEFAULT '',
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `callback` text NOT NULL,
  `comment` text NOT NULL,
  `proxy` char(1) NOT NULL DEFAULT 'N',
  `proxy_info` text NOT NULL,
  `other` text NOT NULL,
  `order_instruction` text NOT NULL,
  `gift_exist` tinyint(1) NOT NULL DEFAULT '0',
  `token` varchar(50) NOT NULL,
  `payerid` varchar(30) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `agentid` varchar(12) NOT NULL,
  `cnname` varchar(30) NOT NULL,
  `greetingwords` varchar(750) NOT NULL,
  `recipient` varchar(600) NOT NULL,
  `additional` text NOT NULL,
  `order_tel` varchar(90) NOT NULL,
  `order_name` varchar(90) NOT NULL,
  `order_email` varchar(90) NOT NULL,
  `order_addr` varchar(250) NOT NULL,
  `order_city` varchar(60) NOT NULL,
  `order_country` varchar(6) NOT NULL,
  `siteid` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `orderno` (`orderno`),
  KEY `status` (`status`),
  KEY `token` (`token`)
) ENGINE=MyISAM AUTO_INCREMENT=542613 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `order_pending`
-- ----------------------------
DROP TABLE IF EXISTS `order_pending`;
CREATE TABLE `order_pending` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `orderno` varchar(30) NOT NULL DEFAULT '',
  `txnid` varchar(50) NOT NULL DEFAULT '',
  `orderdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `manid` varchar(15) NOT NULL DEFAULT '',
  `manname` varchar(40) NOT NULL DEFAULT '',
  `amount` decimal(7,2) NOT NULL DEFAULT '0.00',
  `currency` varchar(5) NOT NULL DEFAULT '',
  `creditsnum` int(5) NOT NULL DEFAULT '0',
  `beforenum` int(5) NOT NULL DEFAULT '0',
  `source` varchar(5) NOT NULL DEFAULT '',
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `audit` char(1) NOT NULL DEFAULT 'N',
  `order_name` varchar(50) NOT NULL DEFAULT '',
  `first_order` char(1) NOT NULL DEFAULT 'N',
  `affiliate_id` varchar(20) NOT NULL DEFAULT '',
  `affiliate_type` tinyint(1) NOT NULL DEFAULT '0',
  `client_mail` tinyint(1) NOT NULL DEFAULT '0',
  `delivery_no` varchar(200) NOT NULL DEFAULT '',
  `gift_exist` tinyint(1) NOT NULL DEFAULT '0',
  `orderflag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `huikuan` varchar(12) NOT NULL,
  `ip` char(15) NOT NULL,
  `proxy` char(1) NOT NULL DEFAULT 'N',
  `black_manid` tinyint(1) NOT NULL DEFAULT '0',
  `black_ip` tinyint(1) NOT NULL DEFAULT '0',
  `black_holder` tinyint(1) NOT NULL DEFAULT '0',
  `paypal` varchar(30) NOT NULL,
  `ip2` varchar(20) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'N',
  `ordernum` int(5) NOT NULL,
  `mblevel` tinyint(1) NOT NULL,
  `orderlevel` tinyint(1) NOT NULL,
  `siteid` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `orderno` (`orderno`),
  KEY `audit` (`audit`),
  KEY `txnid` (`txnid`)
) ENGINE=MyISAM AUTO_INCREMENT=860 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `order_pending_detail`
-- ----------------------------
DROP TABLE IF EXISTS `order_pending_detail`;
CREATE TABLE `order_pending_detail` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `callback` text NOT NULL,
  `comment` text NOT NULL,
  `order_tel` varchar(50) NOT NULL DEFAULT '',
  `order_email` varchar(60) NOT NULL DEFAULT '',
  `order_addr` varchar(255) NOT NULL DEFAULT '',
  `order_city` varchar(50) NOT NULL DEFAULT '',
  `order_state` varchar(50) NOT NULL DEFAULT '',
  `order_country` varchar(60) NOT NULL DEFAULT '',
  `order_zipcode` varchar(20) NOT NULL DEFAULT '',
  `others` text NOT NULL,
  `comment2` text NOT NULL,
  `order_instruction` text NOT NULL,
  `proxyinfo` varchar(500) NOT NULL,
  `cbdata` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=860 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `order_succeed`
-- ----------------------------
DROP TABLE IF EXISTS `order_succeed`;
CREATE TABLE `order_succeed` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `orderno` varchar(30) NOT NULL DEFAULT '',
  `txnid` varchar(50) NOT NULL DEFAULT '',
  `orderdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `manid` varchar(15) NOT NULL DEFAULT '',
  `manname` varchar(40) NOT NULL DEFAULT '',
  `amount` decimal(7,2) NOT NULL DEFAULT '0.00',
  `currency` varchar(5) NOT NULL DEFAULT '',
  `creditsnum` int(5) NOT NULL DEFAULT '0',
  `beforenum` int(5) NOT NULL DEFAULT '0',
  `source` varchar(5) NOT NULL DEFAULT '',
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `audit` char(1) NOT NULL DEFAULT 'N',
  `order_name` varchar(50) NOT NULL DEFAULT '',
  `first_order` char(1) NOT NULL DEFAULT 'N',
  `affiliate_id` varchar(20) NOT NULL DEFAULT '',
  `affiliate_type` tinyint(1) NOT NULL DEFAULT '0',
  `client_mail` tinyint(1) NOT NULL DEFAULT '0',
  `delivery_no` varchar(200) NOT NULL DEFAULT '',
  `gift_exist` tinyint(1) NOT NULL DEFAULT '0',
  `orderflag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `huikuan` varchar(12) NOT NULL,
  `ip` char(15) NOT NULL,
  `proxy` char(1) NOT NULL DEFAULT 'N',
  `ordernum` int(5) NOT NULL,
  `mblevel` tinyint(1) NOT NULL,
  `orderlevel` tinyint(1) NOT NULL,
  `agentid` varchar(6) NOT NULL,
  `womanid` varchar(12) NOT NULL,
  `cnname` varchar(30) NOT NULL,
  `siteid` tinyint(2) NOT NULL DEFAULT '0',
  `integral_status` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id`),
  KEY `orderno` (`orderno`),
  KEY `audit` (`audit`),
  KEY `txnid` (`txnid`)
) ENGINE=MyISAM AUTO_INCREMENT=326678 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `order_succeed_detail`
-- ----------------------------
DROP TABLE IF EXISTS `order_succeed_detail`;
CREATE TABLE `order_succeed_detail` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `callback` text NOT NULL,
  `comment` text NOT NULL,
  `order_tel` varchar(50) NOT NULL DEFAULT '',
  `order_email` varchar(60) NOT NULL DEFAULT '',
  `order_addr` varchar(255) NOT NULL DEFAULT '',
  `order_city` varchar(50) NOT NULL DEFAULT '',
  `order_state` varchar(50) NOT NULL DEFAULT '',
  `order_country` varchar(60) NOT NULL DEFAULT '',
  `order_zipcode` varchar(20) NOT NULL DEFAULT '',
  `others` text NOT NULL,
  `comment2` text NOT NULL,
  `order_instruction` text NOT NULL,
  `proxyinfo` varchar(500) NOT NULL,
  `greetingwords` varchar(750) NOT NULL,
  `recipient` varchar(600) NOT NULL,
  `additional` varchar(900) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=326678 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `order_verify`
-- ----------------------------
DROP TABLE IF EXISTS `order_verify`;
CREATE TABLE `order_verify` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `orderno` char(50) NOT NULL,
  `manid` varchar(15) NOT NULL DEFAULT '',
  `manname` varchar(40) NOT NULL DEFAULT '',
  `order_date` datetime NOT NULL,
  `amount` decimal(7,2) NOT NULL,
  `order_name` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `follow` varchar(20) NOT NULL,
  `verify_whys` text NOT NULL,
  `verify_follow` text NOT NULL,
  `adddate` datetime NOT NULL,
  `status` char(1) NOT NULL DEFAULT '0',
  `siteid` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `orderno` (`orderno`,`manid`,`order_date`,`order_name`,`phone`)
) ENGINE=MyISAM AUTO_INCREMENT=1781 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `pageas`
-- ----------------------------
DROP TABLE IF EXISTS `pageas`;
CREATE TABLE `pageas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pageid` varchar(12) NOT NULL DEFAULT '',
  `pagename` varchar(40) NOT NULL DEFAULT '',
  `ip` varchar(15) NOT NULL DEFAULT '',
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `other` varchar(255) NOT NULL DEFAULT '',
  `getvars` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pageid` (`pageid`)
) ENGINE=MyISAM AUTO_INCREMENT=68226 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `payback`
-- ----------------------------
DROP TABLE IF EXISTS `payback`;
CREATE TABLE `payback` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `agentid` varchar(10) NOT NULL DEFAULT '',
  `xnid` int(5) unsigned NOT NULL DEFAULT '0',
  `paydate` date NOT NULL,
  `amount` decimal(9,2) NOT NULL,
  `refid` varchar(30) NOT NULL,
  `kind` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(150) NOT NULL DEFAULT '',
  `comment` text NOT NULL,
  `receiver` varchar(100) NOT NULL DEFAULT '',
  `staff_id` varchar(10) NOT NULL,
  `staff_name` varchar(30) NOT NULL DEFAULT '',
  `addtime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `payback_agent_year`
-- ----------------------------
DROP TABLE IF EXISTS `payback_agent_year`;
CREATE TABLE `payback_agent_year` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `agentid` varchar(10) NOT NULL DEFAULT '',
  `yearidx` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  `pay_total` decimal(9,2) NOT NULL,
  `pay_finish` char(1) NOT NULL DEFAULT 'N',
  `is_curyear` char(1) NOT NULL DEFAULT 'N',
  `remark` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `payback_sale`
-- ----------------------------
DROP TABLE IF EXISTS `payback_sale`;
CREATE TABLE `payback_sale` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `payback_id` varchar(12) NOT NULL,
  `paydate` date NOT NULL DEFAULT '0000-00-00',
  `payer` char(2) NOT NULL,
  `pay_ref` varchar(30) NOT NULL,
  `receive_acc` tinyint(4) NOT NULL DEFAULT '0',
  `currency` char(1) NOT NULL DEFAULT 'U',
  `amount_usd` decimal(11,2) NOT NULL DEFAULT '0.00',
  `amount_hkd` decimal(11,2) NOT NULL DEFAULT '0.00',
  `infact_hkd` decimal(11,2) NOT NULL DEFAULT '0.00',
  `infact_usd` decimal(11,2) NOT NULL DEFAULT '0.00',
  `remark` text NOT NULL,
  `addtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `staff_id` varchar(10) NOT NULL DEFAULT '',
  `staff_name` varchar(30) NOT NULL DEFAULT '',
  `order_sdate` date NOT NULL,
  `order_edate` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payback_id` (`payback_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1554 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `payment_pa`
-- ----------------------------
DROP TABLE IF EXISTS `payment_pa`;
CREATE TABLE `payment_pa` (
  `id` int(8) NOT NULL DEFAULT '0',
  `manid` varchar(15) NOT NULL DEFAULT '',
  `payment` char(15) NOT NULL DEFAULT '0',
  PRIMARY KEY (`manid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `paypalmb`
-- ----------------------------
DROP TABLE IF EXISTS `paypalmb`;
CREATE TABLE `paypalmb` (
  `manid` varchar(20) NOT NULL,
  PRIMARY KEY (`manid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `pc_man_game`
-- ----------------------------
DROP TABLE IF EXISTS `pc_man_game`;
CREATE TABLE `pc_man_game` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `womanid` varchar(12) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `status` int(1) NOT NULL,
  `answer_time` datetime NOT NULL,
  `last_update_time` datetime NOT NULL,
  `movies_id` varchar(30) NOT NULL,
  `songs_id` varchar(30) NOT NULL,
  `games_toys_id` varchar(30) NOT NULL,
  `fairy_tales_id` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`),
  KEY `agentid` (`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `phone_invest`
-- ----------------------------
DROP TABLE IF EXISTS `phone_invest`;
CREATE TABLE `phone_invest` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `lx` smallint(1) NOT NULL DEFAULT '0',
  `recordid` varchar(20) NOT NULL DEFAULT '',
  `agent` varchar(10) NOT NULL DEFAULT '',
  `womanid` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT '',
  `phone` varchar(60) NOT NULL DEFAULT '',
  `staff` varchar(10) NOT NULL,
  `staff_name` varchar(30) NOT NULL,
  `call_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `isfollow` tinyint(1) NOT NULL DEFAULT '2',
  `txt1` text NOT NULL,
  `voice_url` varchar(500) NOT NULL,
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `phone_invest_20140303`
-- ----------------------------
DROP TABLE IF EXISTS `phone_invest_20140303`;
CREATE TABLE `phone_invest_20140303` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `lx` smallint(1) NOT NULL DEFAULT '0',
  `recordid` varchar(20) NOT NULL DEFAULT '',
  `womanid` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `phone` varchar(60) NOT NULL DEFAULT '',
  `staff` varchar(10) NOT NULL DEFAULT '',
  `call_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `q1` smallint(1) NOT NULL DEFAULT '0',
  `q2` smallint(1) NOT NULL DEFAULT '0',
  `q3` smallint(1) NOT NULL DEFAULT '0',
  `q4` smallint(1) NOT NULL DEFAULT '0',
  `q5` smallint(1) NOT NULL DEFAULT '0',
  `q6` smallint(1) NOT NULL DEFAULT '0',
  `q7` smallint(1) NOT NULL DEFAULT '0',
  `txt1` text NOT NULL,
  `txt2` text NOT NULL,
  `txt3` text NOT NULL,
  `txt4` text NOT NULL,
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `agent` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `private_album`
-- ----------------------------
DROP TABLE IF EXISTS `private_album`;
CREATE TABLE `private_album` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `agentid` varchar(10) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `album_name` varchar(50) NOT NULL,
  `album_desc` varchar(255) NOT NULL,
  `delflag` char(1) NOT NULL DEFAULT 'N',
  `device_type` varchar(2) NOT NULL DEFAULT '10',
  `formlady` tinyint(1) NOT NULL DEFAULT '0',
  `addtime` datetime NOT NULL,
  `staff_id` varchar(10) NOT NULL,
  `staff_name` varchar(50) NOT NULL,
  `delete_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `private_album_photo`
-- ----------------------------
DROP TABLE IF EXISTS `private_album_photo`;
CREATE TABLE `private_album_photo` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `agentid` varchar(10) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `albumid` int(7) unsigned NOT NULL DEFAULT '0',
  `photo_desc` varchar(255) NOT NULL,
  `filename` varchar(50) NOT NULL,
  `file_md5` varchar(50) NOT NULL,
  `delflag` char(1) NOT NULL DEFAULT 'N',
  `addtime` datetime NOT NULL,
  `review_mode` char(1) NOT NULL DEFAULT 'S',
  `review_group` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `logtxt` varchar(2000) NOT NULL,
  `review_flag` char(1) NOT NULL DEFAULT 'P',
  `agent_upload_staffid` varchar(10) NOT NULL,
  `reviewed_staff` varchar(50) NOT NULL,
  `reviewed_time` datetime NOT NULL,
  `resubmit` char(1) NOT NULL DEFAULT 'N',
  `reject_reason` char(1) NOT NULL,
  `device_type` varchar(2) NOT NULL DEFAULT '10',
  `formlady` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `albumid` (`albumid`),
  KEY `womanid` (`womanid`),
  KEY `agentid` (`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `private_photo_agent_stats`
-- ----------------------------
DROP TABLE IF EXISTS `private_photo_agent_stats`;
CREATE TABLE `private_photo_agent_stats` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `agentid` varchar(20) NOT NULL,
  `all_lady` int(11) NOT NULL,
  `review_pass_lady` int(11) NOT NULL,
  `wait_agent_review` int(11) NOT NULL,
  `wait_company_review` int(11) NOT NULL,
  `agent_pass` int(11) NOT NULL,
  `company_pass` int(11) NOT NULL,
  `agent_company_pass` int(11) NOT NULL,
  `resubmit` int(11) NOT NULL,
  `review_nopass` int(11) NOT NULL,
  `photo_total` int(11) NOT NULL,
  `last_update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `private_photo_send`
-- ----------------------------
DROP TABLE IF EXISTS `private_photo_send`;
CREATE TABLE `private_photo_send` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `m_id` int(11) unsigned NOT NULL,
  `manid` varchar(32) NOT NULL,
  `m_firstname` varchar(64) NOT NULL,
  `m_lastname` varchar(64) NOT NULL,
  `agent_id` varchar(16) NOT NULL,
  `groupid` varchar(16) NOT NULL,
  `follower` varchar(32) NOT NULL,
  `follower_staffid` varchar(16) NOT NULL,
  `womanid` varchar(16) NOT NULL,
  `w_firstname` varchar(32) NOT NULL,
  `w_lastname` varchar(32) NOT NULL,
  `send_sender` char(1) NOT NULL,
  `send_mode` char(1) NOT NULL,
  `send_time` datetime NOT NULL,
  `photo_position` int(11) unsigned NOT NULL,
  `photo_name` varchar(64) NOT NULL,
  `photo_md5` char(32) NOT NULL,
  `association_id` varchar(64) NOT NULL,
  `fee_deduction` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `fee_deduction_credit` decimal(4,2) unsigned NOT NULL DEFAULT '0.00',
  `fee_deduction_time` datetime NOT NULL,
  `fee_deduction_id` int(11) unsigned NOT NULL,
  `show_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `division_operation_log` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`,`womanid`,`agent_id`),
  KEY `send_fee` (`send_sender`,`send_mode`,`fee_deduction`),
  KEY `groupid` (`groupid`,`follower_staffid`),
  KEY `association_id` (`association_id`),
  KEY `agent_id` (`agent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `private_photo_send_free`
-- ----------------------------
DROP TABLE IF EXISTS `private_photo_send_free`;
CREATE TABLE `private_photo_send_free` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `m_id` int(11) unsigned NOT NULL,
  `manid` varchar(32) NOT NULL,
  `m_firstname` varchar(64) NOT NULL,
  `m_lastname` varchar(64) NOT NULL,
  `agent_id` varchar(16) NOT NULL,
  `groupid` varchar(16) NOT NULL,
  `follower` varchar(32) NOT NULL,
  `follower_staffid` varchar(16) NOT NULL,
  `womanid` varchar(16) NOT NULL,
  `w_firstname` varchar(32) NOT NULL,
  `w_lastname` varchar(32) NOT NULL,
  `send_sender` char(1) NOT NULL,
  `send_mode` char(1) NOT NULL,
  `send_time` datetime NOT NULL,
  `photo_position` int(11) unsigned NOT NULL,
  `photo_name` varchar(64) NOT NULL,
  `photo_md5` char(32) NOT NULL,
  `association_id` varchar(64) NOT NULL,
  `fee_deduction` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `fee_deduction_credit` decimal(4,2) unsigned NOT NULL DEFAULT '0.00',
  `fee_deduction_time` datetime NOT NULL,
  `fee_deduction_id` int(11) unsigned NOT NULL,
  `show_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `division_operation_log` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`,`womanid`,`agent_id`),
  KEY `send_fee` (`send_sender`,`send_mode`,`fee_deduction`),
  KEY `groupid` (`groupid`,`follower_staffid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `private_photo_total`
-- ----------------------------
DROP TABLE IF EXISTS `private_photo_total`;
CREATE TABLE `private_photo_total` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `total_date` date NOT NULL,
  `agent_id` varchar(20) NOT NULL,
  `woman_lc_send` int(11) unsigned NOT NULL,
  `woman_lc_credit` int(11) unsigned NOT NULL,
  `woman_emf_send` int(11) unsigned NOT NULL,
  `woman_emf_credit` int(11) unsigned NOT NULL,
  `woman_emf_credit_1` int(11) unsigned NOT NULL,
  `man_lc_send` int(11) unsigned NOT NULL,
  `man_emf_send` int(11) unsigned NOT NULL,
  `man_emf_credit` int(11) unsigned NOT NULL,
  `edit_time` datetime NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stat` (`total_date`,`agent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `private_short_video`
-- ----------------------------
DROP TABLE IF EXISTS `private_short_video`;
CREATE TABLE `private_short_video` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `womanid` varchar(10) NOT NULL,
  `w_firstname` varchar(40) NOT NULL,
  `w_lastname` varchar(40) NOT NULL,
  `agentid` varchar(15) NOT NULL,
  `album_id` int(7) unsigned NOT NULL,
  `video_name` varchar(50) NOT NULL,
  `video_desc` varchar(255) NOT NULL,
  `video_md5` varchar(50) NOT NULL,
  `video_key` varchar(50) NOT NULL,
  `video_sort` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `video_img_md5` varchar(50) NOT NULL,
  `video_time` time NOT NULL,
  `delete_flag` char(1) NOT NULL DEFAULT 'N',
  `review_group` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `review_mode` char(1) NOT NULL DEFAULT 'E',
  `review_flag` char(1) NOT NULL DEFAULT 'P',
  `review_reason` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `review_reason_txt` varchar(255) NOT NULL,
  `require_flag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `resubmit` char(1) NOT NULL DEFAULT 'Y',
  `agent_follow_id` varchar(15) NOT NULL,
  `agent_follow_name` varchar(40) NOT NULL,
  `agent_follow_time` datetime NOT NULL,
  `division_follow_id` varchar(15) NOT NULL,
  `division_follow_name` varchar(40) NOT NULL,
  `division_follow_time` datetime NOT NULL,
  `operation_log` varchar(10240) NOT NULL,
  `edit_time` datetime NOT NULL,
  `add_time` datetime NOT NULL,
  `video_file_status` tinyint(1) NOT NULL DEFAULT '0',
  `device_type` varchar(2) NOT NULL DEFAULT '10',
  `formlady` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`,`agentid`),
  KEY `delete_flag` (`delete_flag`,`review_group`,`review_mode`,`review_flag`),
  KEY `edit_time` (`edit_time`),
  KEY `agentid` (`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `private_short_video_album`
-- ----------------------------
DROP TABLE IF EXISTS `private_short_video_album`;
CREATE TABLE `private_short_video_album` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `agentid` varchar(10) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `album_name` varchar(50) NOT NULL,
  `album_desc` varchar(255) NOT NULL,
  `delflag` char(1) NOT NULL DEFAULT 'N',
  `agent_follow_id` varchar(15) NOT NULL,
  `agent_follow_name` varchar(40) NOT NULL,
  `edit_time` datetime NOT NULL,
  `addtime` datetime NOT NULL,
  `device_type` varchar(2) NOT NULL DEFAULT '10',
  `formlady` tinyint(1) NOT NULL DEFAULT '0',
  `staff_id` varchar(10) NOT NULL,
  `staff_name` varchar(50) NOT NULL,
  `delete_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`,`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `private_short_video_history`
-- ----------------------------
DROP TABLE IF EXISTS `private_short_video_history`;
CREATE TABLE `private_short_video_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `send_id` int(11) unsigned NOT NULL,
  `manid` varchar(32) NOT NULL,
  `m_firstname` varchar(64) NOT NULL,
  `m_lastname` varchar(64) NOT NULL,
  `agent_id` varchar(16) NOT NULL,
  `womanid` varchar(16) NOT NULL,
  `w_firstname` varchar(32) NOT NULL,
  `w_lastname` varchar(32) NOT NULL,
  `fee_deduction` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `fee_deduction_credit` decimal(4,2) unsigned NOT NULL DEFAULT '0.00',
  `fee_deduction_time` datetime NOT NULL,
  `fee_deduction_id` int(11) unsigned NOT NULL,
  `send_mode` char(1) NOT NULL DEFAULT '0',
  `status` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `manid` (`send_id`,`manid`,`womanid`,`agent_id`),
  KEY `fee_deduction` (`fee_deduction`,`fee_deduction_id`,`fee_deduction_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `private_short_video_send`
-- ----------------------------
DROP TABLE IF EXISTS `private_short_video_send`;
CREATE TABLE `private_short_video_send` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `m_id` int(11) unsigned NOT NULL,
  `manid` varchar(32) NOT NULL,
  `m_firstname` varchar(64) NOT NULL,
  `m_lastname` varchar(64) NOT NULL,
  `agent_id` varchar(16) NOT NULL,
  `groupid` varchar(16) NOT NULL,
  `follower` varchar(32) NOT NULL,
  `follower_staffid` varchar(16) NOT NULL,
  `womanid` varchar(16) NOT NULL,
  `w_firstname` varchar(32) NOT NULL,
  `w_lastname` varchar(32) NOT NULL,
  `send_sender` char(1) NOT NULL,
  `send_mode` char(1) NOT NULL,
  `send_time` datetime NOT NULL,
  `photo_position` int(11) unsigned NOT NULL,
  `photo_name` varchar(64) NOT NULL,
  `photo_md5` char(32) NOT NULL,
  `association_id` varchar(64) NOT NULL,
  `fee_deduction` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `fee_deduction_credit` decimal(4,2) unsigned NOT NULL DEFAULT '0.00',
  `fee_deduction_time` datetime NOT NULL,
  `fee_deduction_id` int(11) unsigned NOT NULL,
  `history_credits` decimal(8,2) unsigned NOT NULL,
  `history_credits_num` int(1) unsigned NOT NULL DEFAULT '0',
  `history_id_view` int(11) unsigned NOT NULL DEFAULT '0',
  `show_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `division_operation_log` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`,`womanid`,`agent_id`),
  KEY `send_fee` (`send_sender`,`send_mode`,`fee_deduction`),
  KEY `groupid` (`groupid`,`follower_staffid`),
  KEY `send_time` (`send_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `private_short_video_total`
-- ----------------------------
DROP TABLE IF EXISTS `private_short_video_total`;
CREATE TABLE `private_short_video_total` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `total_date` date NOT NULL,
  `agent_id` varchar(20) NOT NULL,
  `woman_lc_send` int(10) unsigned NOT NULL,
  `woman_lc_credit` int(10) unsigned NOT NULL,
  `woman_emf_send` int(10) unsigned NOT NULL,
  `woman_emf_credit` int(10) unsigned NOT NULL,
  `woman_emf_credit_1` int(10) unsigned NOT NULL,
  `edit_time` datetime NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stat` (`total_date`,`agent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `profile_view_history`
-- ----------------------------
DROP TABLE IF EXISTS `profile_view_history`;
CREATE TABLE `profile_view_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `manid` varchar(20) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `num` int(5) NOT NULL,
  `adddate` datetime NOT NULL,
  `lastupdate` datetime NOT NULL,
  `ip` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `manid` (`manid`,`womanid`)
) ENGINE=InnoDB AUTO_INCREMENT=25014 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `prom_linksite`
-- ----------------------------
DROP TABLE IF EXISTS `prom_linksite`;
CREATE TABLE `prom_linksite` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `category` tinyint(2) NOT NULL DEFAULT '1',
  `title` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `comment` varchar(600) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `submitdate` datetime NOT NULL,
  `status` char(1) NOT NULL,
  `ipaddress` varchar(15) NOT NULL,
  `sortdate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `submitdate` (`submitdate`)
) ENGINE=MyISAM AUTO_INCREMENT=1767 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `prom_user`
-- ----------------------------
DROP TABLE IF EXISTS `prom_user`;
CREATE TABLE `prom_user` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `email` varchar(120) NOT NULL,
  `url` varchar(120) NOT NULL,
  `sitegroup` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `loginid` varchar(20) NOT NULL,
  `sendnum` int(3) NOT NULL DEFAULT '0',
  `submitdate` datetime NOT NULL,
  `lasttime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4928 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `questions`
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL DEFAULT '',
  `answer` text NOT NULL,
  `type` char(1) NOT NULL DEFAULT '',
  `category` tinyint(2) NOT NULL DEFAULT '0',
  `date_px` int(5) NOT NULL DEFAULT '0',
  `date_update` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `top_quest` char(1) NOT NULL DEFAULT 'N',
  `top_px` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `quickmatch_lady`
-- ----------------------------
DROP TABLE IF EXISTS `quickmatch_lady`;
CREATE TABLE `quickmatch_lady` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `womanid` varchar(15) NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `device_type` varchar(2) NOT NULL,
  `addtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `manid_womanid` (`manid`,`womanid`),
  KEY `manid` (`manid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `related_topics`
-- ----------------------------
DROP TABLE IF EXISTS `related_topics`;
CREATE TABLE `related_topics` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` tinyint(1) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `rank` int(8) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `relation`
-- ----------------------------
DROP TABLE IF EXISTS `relation`;
CREATE TABLE `relation` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `manid` varchar(15) NOT NULL DEFAULT '',
  `womanid` varchar(15) NOT NULL DEFAULT '',
  `agentid` varchar(10) NOT NULL DEFAULT '',
  `mw_num` int(6) NOT NULL DEFAULT '0',
  `wm_num` int(6) NOT NULL DEFAULT '0',
  `wm_reply_num` int(1) unsigned NOT NULL DEFAULT '0',
  `viewadd` enum('Y','N') DEFAULT 'N',
  `viewadddate` datetime DEFAULT NULL,
  `lastdate` datetime DEFAULT NULL,
  `lastflag` enum('MW','WM') DEFAULT NULL,
  `lastmsgid` int(9) DEFAULT NULL,
  `firstdate` datetime DEFAULT NULL,
  `bg_sign` tinyint(5) NOT NULL DEFAULT '0',
  `cupid` int(10) NOT NULL,
  `cupid_consumed` char(1) NOT NULL DEFAULT 'N',
  `cupid_first_paytime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cupid_first_payby` tinyint(1) NOT NULL DEFAULT '0',
  `admire` int(10) NOT NULL,
  `livechat` int(4) NOT NULL,
  `lovecall` int(4) NOT NULL,
  `videodate` int(4) NOT NULL,
  `cupiddate` int(1) DEFAULT '0',
  `videoshow` int(4) NOT NULL DEFAULT '0',
  `integral` int(6) NOT NULL DEFAULT '0',
  `virtual_gifts` int(6) NOT NULL DEFAULT '0',
  `virtual_gifts_wm` int(6) NOT NULL DEFAULT '0',
  `virtual_gifts_mw` int(6) NOT NULL DEFAULT '0',
  `isshow` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`,`lastdate`),
  KEY `womanid` (`womanid`,`lastdate`)
) ENGINE=MyISAM AUTO_INCREMENT=463566 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `remittance`
-- ----------------------------
DROP TABLE IF EXISTS `remittance`;
CREATE TABLE `remittance` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `mtcn` varchar(60) NOT NULL DEFAULT '',
  `currency` varchar(10) NOT NULL DEFAULT '',
  `amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `status` char(2) NOT NULL DEFAULT 'N',
  `method` varchar(10) NOT NULL DEFAULT '',
  `manid` varchar(20) NOT NULL DEFAULT '',
  `firstname` varchar(50) NOT NULL DEFAULT '',
  `lastname` varchar(50) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `addr2` varchar(150) NOT NULL DEFAULT '',
  `country` varchar(60) NOT NULL DEFAULT '',
  `zipcode` varchar(20) NOT NULL DEFAULT '',
  `phone` varchar(60) NOT NULL DEFAULT '',
  `note` text NOT NULL,
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `rfirstname` varchar(100) NOT NULL DEFAULT '',
  `rlastname` varchar(100) NOT NULL DEFAULT '',
  `rcountry` varchar(20) NOT NULL DEFAULT 'HK',
  `raddress` text NOT NULL,
  `time_pickup` date NOT NULL,
  `staff_pickup` varchar(10) NOT NULL,
  `ruzhang_no` varchar(50) NOT NULL,
  `process` text NOT NULL,
  `orderno` varchar(32) NOT NULL,
  `siteid` tinyint(2) NOT NULL DEFAULT '0',
  UNIQUE KEY `id` (`id`),
  KEY `orderno` (`orderno`)
) ENGINE=MyISAM AUTO_INCREMENT=7419 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ru_male_mail_statistics`
-- ----------------------------
DROP TABLE IF EXISTS `ru_male_mail_statistics`;
CREATE TABLE `ru_male_mail_statistics` (
  `statis_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ç»Ÿè®¡è¡¨ID,æƒŸä¸€',
  `manid` varchar(12) NOT NULL COMMENT 'ä¼šå‘˜ID,ä¸Žä¼šå‘˜è¡¨ç›¸å…³è”',
  `mail_new` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'æ‰€æ”¶åˆ°çš„æ–°é‚®ä»¶æ•°é‡',
  `mail_f_to_m` smallint(1) NOT NULL DEFAULT '0' COMMENT 'å¥³å£«å›žå¤è¯¥ç”·å£«çš„æ„å‘ä¿¡æ•°é‡',
  `mail_m_to_f` smallint(1) NOT NULL DEFAULT '0' COMMENT 'ç”·å£«å†™ä¿¡ç»™å¥³å£«çš„æ„å‘ä¿¡æ•°é‡',
  `mail_count` mediumint(2) NOT NULL DEFAULT '0' COMMENT 'æ‰€æ”¶åˆ°çš„æ–°é‚®ä»¶æ€»æ•°',
  `admire_new` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'æŽ¥æ”¶åˆ°ä¸”æœªé˜…è¯»çš„æ„å‘ä¿¡æ•°é‡',
  `admire_count` smallint(1) NOT NULL DEFAULT '0' COMMENT 'æ‰€æ”¶æ„å‘ä¿¡æ€»æ•°',
  `cupid_reply_new` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'æœªé˜…è¯»çš„ä¸˜æ¯”ç‰¹å›žå¤æ•°é‡',
  `cupid_reply` smallint(1) NOT NULL DEFAULT '0' COMMENT 'ä¸˜æ¯”ç‰¹å›žå¤çš„æ•°é‡',
  `cupid_count` mediumint(2) NOT NULL DEFAULT '0' COMMENT 'æ‰€å‘ä¸˜æ¯”ç‰¹æ€»æ•°',
  `ph_tran_count` smallint(1) NOT NULL DEFAULT '0' COMMENT 'ç”µè¯ç¿»è¯‘æœåŠ¡æ€»æ•°',
  `ph_tran_pending` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'å¾…å¤„ç†çš„ç”µè¯ç¿»è¯‘æ•°é‡',
  `ph_tran_used` smallint(1) NOT NULL DEFAULT '0' COMMENT 'å·²ä½¿ç”¨çš„ç”µè¯ç¿»è¯‘æ•°é‡',
  `meet_me_pending` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'å¾…ç¡®è®¤çš„çº¦ä¼šè¯·æ±‚æ•°é‡',
  `meet_me_count` smallint(1) NOT NULL DEFAULT '0' COMMENT 'çº¦ä¼šè¯·æ±‚æ€»æ•°é‡',
  `gift_order` smallint(1) NOT NULL DEFAULT '0' COMMENT 'æ‰€é€ç¤¼ç‰©æ•°é‡',
  `cs_mail` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'å®¢æœé‚®ä»¶å¾…å¤„ç†æ•°',
  PRIMARY KEY (`statis_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `search_request`
-- ----------------------------
DROP TABLE IF EXISTS `search_request`;
CREATE TABLE `search_request` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `manid` varchar(20) NOT NULL DEFAULT '',
  `manname` varchar(50) NOT NULL DEFAULT '',
  `womanid` varchar(20) NOT NULL DEFAULT '',
  `womanname` varchar(50) NOT NULL DEFAULT '',
  `addtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expiretime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` char(1) NOT NULL DEFAULT '',
  `agentid` varchar(10) NOT NULL DEFAULT '',
  `staffid` varchar(40) NOT NULL DEFAULT '',
  `sign` varchar(50) NOT NULL DEFAULT '',
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4908 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `sendtofriend`
-- ----------------------------
DROP TABLE IF EXISTS `sendtofriend`;
CREATE TABLE `sendtofriend` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `friendname` varchar(60) NOT NULL DEFAULT '',
  `friendmail` varchar(100) NOT NULL DEFAULT '',
  `myname` varchar(60) NOT NULL DEFAULT '',
  `mymail` varchar(100) NOT NULL DEFAULT '',
  `mailbody` text NOT NULL,
  `sendtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `member` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24307 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `sms_data`
-- ----------------------------
DROP TABLE IF EXISTS `sms_data`;
CREATE TABLE `sms_data` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL,
  `classify` tinyint(1) NOT NULL,
  `send_fname` varchar(30) NOT NULL DEFAULT '',
  `send_ftel` varchar(15) NOT NULL,
  `send_tname` varchar(30) NOT NULL DEFAULT '',
  `send_ttel` varchar(15) NOT NULL,
  `send_tid` varchar(20) NOT NULL DEFAULT '',
  `agentid` varchar(10) NOT NULL DEFAULT '',
  `msg` varchar(500) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `adddate` datetime NOT NULL,
  `msgid` varchar(200) NOT NULL,
  `manlist` varchar(200) NOT NULL,
  `senddate` datetime NOT NULL,
  `retrynum` tinyint(1) NOT NULL,
  `expiredate` datetime NOT NULL,
  `other` varchar(300) NOT NULL DEFAULT '',
  `verify_code` varchar(10) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `emfnum` int(11) NOT NULL,
  `step` tinyint(1) NOT NULL DEFAULT '0',
  `agentinfo` varchar(100) NOT NULL DEFAULT '',
  `follower` varchar(30) NOT NULL,
  `channels` tinyint(1) NOT NULL,
  `sms_num` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `send_tid` (`send_tid`,`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=244173 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `sms_pending`
-- ----------------------------
DROP TABLE IF EXISTS `sms_pending`;
CREATE TABLE `sms_pending` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `manname` varchar(35) NOT NULL,
  `manid` varchar(20) NOT NULL,
  `womanname` varchar(35) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `agentid` varchar(10) NOT NULL DEFAULT '',
  `adddate` datetime NOT NULL,
  `msgid` int(8) NOT NULL,
  `cnname` varchar(30) NOT NULL DEFAULT '',
  `follower` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `send_tid` (`agentid`,`womanid`),
  KEY `msgid` (`msgid`)
) ENGINE=MyISAM AUTO_INCREMENT=947192 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `sp_agent`
-- ----------------------------
DROP TABLE IF EXISTS `sp_agent`;
CREATE TABLE `sp_agent` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `agent` varchar(10) NOT NULL DEFAULT '',
  `chn_staff` varchar(50) NOT NULL DEFAULT '',
  `classify` tinyint(1) NOT NULL DEFAULT '0',
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `suggestion` text NOT NULL,
  `status` char(1) NOT NULL DEFAULT '',
  `other` text NOT NULL,
  `womanid` varchar(20) NOT NULL DEFAULT '',
  `manid` varchar(20) NOT NULL DEFAULT '',
  `progress` text NOT NULL,
  `rpstatus` char(1) NOT NULL DEFAULT 'Y',
  `lastreply` int(8) NOT NULL DEFAULT '0',
  `agent_tel` varchar(50) NOT NULL DEFAULT '',
  `agent_contact` varchar(30) NOT NULL DEFAULT '',
  `fb_type` tinyint(1) NOT NULL DEFAULT '0',
  `delflag` char(1) NOT NULL DEFAULT 'N',
  `visible` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `jianguan_id` varchar(10) NOT NULL,
  `jianguan_name` varchar(30) NOT NULL DEFAULT '',
  `cstopic` varchar(20) NOT NULL,
  `anti_scam_id` varchar(25) NOT NULL,
  `remark` text NOT NULL,
  `postdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7455 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `sp_email`
-- ----------------------------
DROP TABLE IF EXISTS `sp_email`;
CREATE TABLE `sp_email` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `topic` int(8) NOT NULL DEFAULT '0',
  `method` char(2) NOT NULL DEFAULT '',
  `manid` varchar(12) NOT NULL DEFAULT '',
  `man_email` varchar(200) NOT NULL DEFAULT '',
  `staff` varchar(20) NOT NULL DEFAULT '',
  `staff_email` varchar(200) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `senddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `attachfile` char(2) NOT NULL DEFAULT '',
  `pos` int(8) NOT NULL DEFAULT '0',
  `creator` varchar(255) NOT NULL DEFAULT '',
  `after` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `topic` (`topic`,`manid`)
) ENGINE=MyISAM AUTO_INCREMENT=11631 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `sp_feedback`
-- ----------------------------
DROP TABLE IF EXISTS `sp_feedback`;
CREATE TABLE `sp_feedback` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `ticketno` varchar(20) NOT NULL DEFAULT '',
  `agent` varchar(10) NOT NULL DEFAULT '',
  `fb_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `agent_staff` varchar(50) NOT NULL DEFAULT '',
  `fb_text` text NOT NULL,
  `other` varchar(100) NOT NULL DEFAULT '',
  `dflag` char(2) NOT NULL DEFAULT 'N',
  `replier_type` char(2) NOT NULL DEFAULT '1',
  `chn_staff` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `ticketno` (`ticketno`)
) ENGINE=MyISAM AUTO_INCREMENT=9832 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `sp_mailsample`
-- ----------------------------
DROP TABLE IF EXISTS `sp_mailsample`;
CREATE TABLE `sp_mailsample` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `sort` char(2) NOT NULL DEFAULT '',
  `subsort` char(2) NOT NULL DEFAULT '',
  `question` varchar(255) NOT NULL DEFAULT '',
  `answer` text NOT NULL,
  `pxdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `adddate` date NOT NULL DEFAULT '0000-00-00',
  `class` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=582 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ss_comments`
-- ----------------------------
DROP TABLE IF EXISTS `ss_comments`;
CREATE TABLE `ss_comments` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `commentid` varchar(20) NOT NULL DEFAULT '',
  `agent` varchar(10) NOT NULL DEFAULT '',
  `status` enum('E','V','H') NOT NULL DEFAULT 'E',
  `subject_en` varchar(255) NOT NULL DEFAULT '',
  `text_cn` text NOT NULL,
  `text_en` text NOT NULL,
  `staff` varchar(40) NOT NULL DEFAULT '',
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip` varchar(15) NOT NULL DEFAULT '',
  `paixu_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gender` enum('M','F') NOT NULL DEFAULT 'M',
  `memberid` varchar(20) NOT NULL DEFAULT '',
  `member_name` varchar(50) NOT NULL DEFAULT '',
  `credits` int(4) NOT NULL DEFAULT '0',
  `postdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `remark` text NOT NULL,
  `isfeatured` tinyint(1) NOT NULL DEFAULT '0',
  `ad_subject` varchar(100) NOT NULL,
  `ad_content` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=566 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ss_matches`
-- ----------------------------
DROP TABLE IF EXISTS `ss_matches`;
CREATE TABLE `ss_matches` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `matchid` varchar(10) NOT NULL DEFAULT '',
  `status` enum('E','V','H') NOT NULL DEFAULT 'E',
  `onchnsite` char(1) NOT NULL DEFAULT 'N',
  `agent` varchar(10) NOT NULL DEFAULT '',
  `manid` varchar(20) NOT NULL DEFAULT '0',
  `man_name` varchar(40) NOT NULL DEFAULT '',
  `man_city` varchar(20) NOT NULL DEFAULT '0',
  `man_country` varchar(20) NOT NULL DEFAULT '0',
  `man_joindate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastupdate` varchar(255) NOT NULL DEFAULT '',
  `womanid` varchar(20) NOT NULL DEFAULT '',
  `woman_name` varchar(30) NOT NULL DEFAULT '',
  `woman_city` varchar(20) NOT NULL DEFAULT '',
  `woman_country` varchar(20) NOT NULL DEFAULT '',
  `first_contact` date NOT NULL DEFAULT '0000-00-00',
  `marriage_date` date NOT NULL DEFAULT '0000-00-00',
  `text_cn` text NOT NULL,
  `text_en` text NOT NULL,
  `staff` varchar(40) NOT NULL DEFAULT '',
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip` varchar(15) NOT NULL DEFAULT '',
  `paixu_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `credits` int(4) NOT NULL DEFAULT '0',
  `postdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `remark` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `matchid` (`matchid`)
) ENGINE=MyISAM AUTO_INCREMENT=728 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `stat_order`
-- ----------------------------
DROP TABLE IF EXISTS `stat_order`;
CREATE TABLE `stat_order` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `manid` varchar(15) NOT NULL DEFAULT '',
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `submitdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `days` int(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34744 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `stats_freechat_ticket`
-- ----------------------------
DROP TABLE IF EXISTS `stats_freechat_ticket`;
CREATE TABLE `stats_freechat_ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manid` varchar(20) NOT NULL DEFAULT '',
  `manname` varchar(50) NOT NULL DEFAULT '',
  `stat_date` date NOT NULL,
  `stat_week` varchar(10) NOT NULL,
  `stat_month` varchar(10) NOT NULL,
  `stat_year` varchar(4) NOT NULL,
  `times` int(4) NOT NULL,
  `charge` int(4) NOT NULL,
  `credits` decimal(10,2) NOT NULL,
  `adddate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stat` (`manid`,`stat_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tc_authcall1`
-- ----------------------------
DROP TABLE IF EXISTS `tc_authcall1`;
CREATE TABLE `tc_authcall1` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `auth_no` varchar(20) NOT NULL,
  `lovecall_id` bigint(8) unsigned NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `manid` varchar(15) NOT NULL,
  `manname` varchar(40) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `womanname` varchar(40) NOT NULL,
  `addtime` datetime NOT NULL,
  `actiontime` datetime NOT NULL,
  `deletedtime` datetime NOT NULL,
  `mantimezone` int(3) unsigned NOT NULL,
  `womantimezone` int(3) unsigned NOT NULL,
  `man_gmt_offset` float NOT NULL DEFAULT '0',
  `acc_calltime_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `acc_calltime1` int(10) NOT NULL,
  `acc_calltime2` int(10) NOT NULL,
  `acc_callweek` varchar(15) NOT NULL,
  `countrycode` char(2) NOT NULL,
  `phone_cc` varchar(5) NOT NULL,
  `phone_ac` varchar(5) NOT NULL,
  `phone_number` varchar(30) NOT NULL,
  `auth_flag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `delete_flag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `total_callednum` int(3) unsigned NOT NULL DEFAULT '0',
  `succ_callednum` int(3) unsigned NOT NULL DEFAULT '0',
  `costcredit` decimal(6,2) unsigned NOT NULL DEFAULT '0.00',
  `lastcalltime` datetime NOT NULL,
  `needtrans` char(1) NOT NULL DEFAULT 'Y',
  `initiator` char(1) NOT NULL DEFAULT 'L',
  `transphone` varchar(30) NOT NULL,
  `ladyphone` varchar(30) NOT NULL,
  `followerid` varchar(10) NOT NULL,
  `followername` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_no` (`auth_no`),
  KEY `forlist` (`manid`,`agentid`,`womanid`,`auth_flag`),
  KEY `actiontime` (`actiontime`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tc_authcall2`
-- ----------------------------
DROP TABLE IF EXISTS `tc_authcall2`;
CREATE TABLE `tc_authcall2` (
  `auth_no` varchar(20) NOT NULL,
  `translator` varchar(30) NOT NULL,
  `decline_note` varchar(255) NOT NULL,
  `delete_note` varchar(255) NOT NULL,
  `clremark` text NOT NULL,
  `logstxt` text NOT NULL,
  KEY `auth_no` (`auth_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tc_authcall_history`
-- ----------------------------
DROP TABLE IF EXISTS `tc_authcall_history`;
CREATE TABLE `tc_authcall_history` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `auth_no` varchar(20) NOT NULL,
  `call_no` varchar(25) NOT NULL,
  `dialno` varchar(20) NOT NULL,
  `lovecall_id` varchar(10) NOT NULL,
  `manid` varchar(12) NOT NULL,
  `manname` varchar(40) NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `womanname` varchar(40) NOT NULL,
  `dialtime` datetime NOT NULL,
  `startmeeting` datetime NOT NULL,
  `endmeeting` datetime NOT NULL,
  `costtime` int(3) NOT NULL,
  `credits` float NOT NULL,
  `statusflag` tinyint(1) NOT NULL DEFAULT '0',
  `voicefile` varchar(50) NOT NULL,
  `voicelogs` text NOT NULL,
  `clremark` text NOT NULL,
  `agtremark` text NOT NULL,
  `lastremark` datetime NOT NULL,
  `failreason1` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `failreason2` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `followerid` varchar(10) NOT NULL,
  `kf_mode` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `auth_no` (`auth_no`,`call_no`,`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tc_callform1`
-- ----------------------------
DROP TABLE IF EXISTS `tc_callform1`;
CREATE TABLE `tc_callform1` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `formno` varchar(20) NOT NULL,
  `bookingcode` int(4) unsigned NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `manid` varchar(12) NOT NULL,
  `manname` varchar(40) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `womanname` varchar(40) NOT NULL,
  `addtime` datetime NOT NULL,
  `mantimezone` int(3) NOT NULL,
  `womantimezone` int(3) NOT NULL,
  `bookingtime` datetime NOT NULL,
  `bookingbjtime` datetime NOT NULL,
  `bookinggmtime` int(10) unsigned NOT NULL DEFAULT '0',
  `submittime` datetime NOT NULL,
  `actiontime` datetime NOT NULL,
  `invflag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `instant_flag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `callednum` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastcalltime` datetime NOT NULL,
  `costcredit` decimal(5,2) unsigned NOT NULL DEFAULT '0.00',
  `needtrans` char(1) NOT NULL DEFAULT 'Y',
  `mandelflag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `agtdelflag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `followerid` varchar(10) NOT NULL,
  `followername` varchar(20) NOT NULL,
  `device_type` varchar(2) NOT NULL DEFAULT '10',
  PRIMARY KEY (`id`),
  KEY `formno` (`formno`),
  KEY `invflag` (`invflag`),
  KEY `bookingbjtime` (`bookingbjtime`),
  KEY `manid` (`manid`)
) ENGINE=MyISAM AUTO_INCREMENT=147 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tc_callform2`
-- ----------------------------
DROP TABLE IF EXISTS `tc_callform2`;
CREATE TABLE `tc_callform2` (
  `formno` varchar(20) NOT NULL,
  `countrycode` varchar(8) NOT NULL,
  `translator` varchar(30) NOT NULL,
  `transphone_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `transphone_ac` varchar(4) NOT NULL,
  `transphone` varchar(50) NOT NULL,
  `transphone2_ac` varchar(4) NOT NULL,
  `transphone2` varchar(20) NOT NULL,
  `womanphone_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `womanphone_ac` varchar(4) NOT NULL,
  `womanphone` varchar(50) NOT NULL,
  `note` text NOT NULL,
  `clremark` text NOT NULL,
  `agtremark` text NOT NULL,
  `logstxt` text NOT NULL,
  KEY `formno` (`formno`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tc_callhistory`
-- ----------------------------
DROP TABLE IF EXISTS `tc_callhistory`;
CREATE TABLE `tc_callhistory` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `formno` varchar(20) NOT NULL,
  `callid` tinyint(1) NOT NULL DEFAULT '1',
  `dialno` varchar(20) NOT NULL,
  `authcode` char(6) NOT NULL,
  `bookingcode` char(5) NOT NULL,
  `manid` varchar(12) NOT NULL,
  `manname` varchar(40) NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `womanname` varchar(40) NOT NULL,
  `dialtime` datetime NOT NULL,
  `startmeeting` datetime NOT NULL,
  `endmeeting` datetime NOT NULL,
  `costtime` int(3) NOT NULL,
  `credits` float NOT NULL,
  `statusflag` tinyint(1) NOT NULL DEFAULT '0',
  `call_mode` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `voicefile` varchar(50) NOT NULL,
  `voicelogs` text NOT NULL,
  `clremark` text NOT NULL,
  `agtremark` text NOT NULL,
  `lastremark` datetime NOT NULL,
  `failreason1` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `failreason2` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `formno` (`formno`,`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tc_invrecord`
-- ----------------------------
DROP TABLE IF EXISTS `tc_invrecord`;
CREATE TABLE `tc_invrecord` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `invno` varchar(30) NOT NULL,
  `manid` varchar(12) NOT NULL,
  `manname` varchar(40) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `womanname` varchar(40) NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `sendtime` datetime NOT NULL,
  `emfid` varchar(15) NOT NULL,
  `emfbefore` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `statusflag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `mandelflag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `agtremark` text NOT NULL,
  `followerid` varchar(10) NOT NULL,
  `followername` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tc_privlist`
-- ----------------------------
DROP TABLE IF EXISTS `tc_privlist`;
CREATE TABLE `tc_privlist` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `privindex` tinyint(2) unsigned NOT NULL,
  `manid` varchar(15) NOT NULL,
  `relateid` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`),
  KEY `relateid` (`relateid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `temptable`
-- ----------------------------
DROP TABLE IF EXISTS `temptable`;
CREATE TABLE `temptable` (
  `id` int(8) NOT NULL DEFAULT '0',
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `agent` varchar(10) NOT NULL DEFAULT '',
  `flag` char(2) NOT NULL DEFAULT '',
  `credit` varchar(5) NOT NULL DEFAULT '1',
  `comm` text,
  `msgid` varchar(10) NOT NULL DEFAULT '',
  `manid` varchar(15) NOT NULL DEFAULT '',
  `womanid` varchar(15) NOT NULL DEFAULT '',
  `balance` int(8) NOT NULL DEFAULT '0',
  `comm2` varchar(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `terms_updates`
-- ----------------------------
DROP TABLE IF EXISTS `terms_updates`;
CREATE TABLE `terms_updates` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `vdate` date NOT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `update_text` text NOT NULL,
  `reason` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tips_advices`
-- ----------------------------
DROP TABLE IF EXISTS `tips_advices`;
CREATE TABLE `tips_advices` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `category` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `paixu` int(5) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL,
  `sub_content` varchar(800) NOT NULL,
  `content` text NOT NULL,
  `imgnum` tinyint(1) NOT NULL DEFAULT '0',
  `forum_msgid` varchar(10) NOT NULL,
  `postdate` datetime NOT NULL,
  `sys_remark` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `paixu` (`paixu`),
  KEY `forlist` (`category`,`status`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tips_advices_20130510`
-- ----------------------------
DROP TABLE IF EXISTS `tips_advices_20130510`;
CREATE TABLE `tips_advices_20130510` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `category` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `paixu` int(5) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL,
  `sub_content` varchar(800) NOT NULL,
  `content` text NOT NULL,
  `imgnum` tinyint(1) NOT NULL DEFAULT '0',
  `forum_msgid` varchar(10) NOT NULL,
  `postdate` datetime NOT NULL,
  `sys_remark` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `paixu` (`paixu`),
  KEY `forlist` (`category`,`status`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tips_advices_bak140811`
-- ----------------------------
DROP TABLE IF EXISTS `tips_advices_bak140811`;
CREATE TABLE `tips_advices_bak140811` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `category` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `paixu` int(5) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL,
  `sub_content` varchar(800) NOT NULL,
  `content` text NOT NULL,
  `imgnum` tinyint(1) NOT NULL DEFAULT '0',
  `forum_msgid` varchar(10) NOT NULL,
  `postdate` datetime NOT NULL,
  `sys_remark` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `paixu` (`paixu`),
  KEY `forlist` (`category`,`status`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `translation_mail`
-- ----------------------------
DROP TABLE IF EXISTS `translation_mail`;
CREATE TABLE `translation_mail` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `sendtid` varchar(15) NOT NULL DEFAULT '',
  `sendfid` varchar(15) NOT NULL DEFAULT '',
  `agent` varchar(10) NOT NULL,
  `cnbody` text NOT NULL,
  `enbody` text NOT NULL,
  `submitdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `senddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sendflag` char(1) NOT NULL,
  `mail_type` char(1) NOT NULL,
  `reply_mail_id` int(8) DEFAULT '0',
  `msgid` int(8) DEFAULT '0',
  `translator` varchar(10) NOT NULL DEFAULT '',
  `wk_trans` varchar(10) NOT NULL DEFAULT '',
  `rmethod` char(2) NOT NULL DEFAULT '',
  `comment` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(15) NOT NULL DEFAULT '',
  `computerid` varchar(8) NOT NULL DEFAULT '',
  `lady_tel` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `sendtid` (`sendtid`),
  KEY `sendfid` (`sendfid`)
) ENGINE=MyISAM AUTO_INCREMENT=4474 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `translator`
-- ----------------------------
DROP TABLE IF EXISTS `translator`;
CREATE TABLE `translator` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `authorid` varchar(12) NOT NULL,
  `agentid` varchar(10) NOT NULL DEFAULT '',
  `cnname` varchar(50) NOT NULL DEFAULT '',
  `lastname_cn` varchar(35) NOT NULL,
  `enname` varchar(50) NOT NULL DEFAULT '',
  `lastname_en` varchar(35) NOT NULL,
  `gender` char(1) NOT NULL DEFAULT 'F',
  `birthday` varchar(20) NOT NULL DEFAULT '',
  `telephone` varchar(100) NOT NULL DEFAULT '',
  `mobile` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(150) NOT NULL DEFAULT '',
  `profession` varchar(60) NOT NULL DEFAULT '',
  `education` varchar(50) NOT NULL DEFAULT '',
  `school` varchar(150) NOT NULL DEFAULT '',
  `wk_contact` char(1) NOT NULL DEFAULT 'N',
  `wk_trans` char(1) NOT NULL DEFAULT 'N',
  `inuse` char(1) NOT NULL DEFAULT 'N',
  `comment` varchar(255) NOT NULL DEFAULT '',
  `staff_id` varchar(10) NOT NULL DEFAULT '',
  `idcard` varchar(18) NOT NULL DEFAULT '',
  `delete_position` enum('Y','N') NOT NULL DEFAULT 'N',
  `indate` date NOT NULL DEFAULT '0000-00-00',
  `outdate` date NOT NULL DEFAULT '0000-00-00',
  `username` varchar(15) NOT NULL,
  `passwd` varchar(20) NOT NULL DEFAULT '',
  `yingji` enum('Y','N') NOT NULL DEFAULT 'N',
  `login_times` int(8) NOT NULL DEFAULT '0',
  `last_login` datetime NOT NULL,
  `red_addr` varchar(255) NOT NULL DEFAULT '',
  `oicq` varchar(20) NOT NULL DEFAULT '',
  `inuse2` char(2) NOT NULL DEFAULT 'N',
  `delete_emf_qx` char(1) NOT NULL DEFAULT 'Y',
  `delete_cupid_qx` char(1) NOT NULL DEFAULT 'Y',
  `idcard_flag` char(1) NOT NULL DEFAULT 'N',
  `delete_admirer` char(1) NOT NULL DEFAULT 'Y',
  `admirer_comm` text NOT NULL,
  `account_level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `addtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `super_admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `delete_style_id` tinyint(1) NOT NULL DEFAULT '0',
  `delete_cw` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `delete_guanlian` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `delete_admirer_review` tinyint(1) NOT NULL DEFAULT '0',
  `delete_cupid_review` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `job` varchar(20) NOT NULL DEFAULT '',
  `update_history` text NOT NULL,
  `dept` tinyint(2) NOT NULL,
  `max_bind` tinyint(2) NOT NULL DEFAULT '10',
  `only_local_login` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  KEY `agentid` (`authorid`,`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=3844 DEFAULT CHARSET=utf8 COMMENT='Agent Translator ';

-- ----------------------------
--  Table structure for `translator_demo`
-- ----------------------------
DROP TABLE IF EXISTS `translator_demo`;
CREATE TABLE `translator_demo` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `authorid` varchar(12) NOT NULL,
  `agentid` varchar(10) NOT NULL DEFAULT '',
  `cnname` varchar(50) NOT NULL DEFAULT '',
  `enname` varchar(50) NOT NULL DEFAULT '',
  `lastname_en` varchar(35) NOT NULL,
  `gender` char(1) NOT NULL DEFAULT 'F',
  `birthday` varchar(20) NOT NULL DEFAULT '',
  `telephone` varchar(100) NOT NULL DEFAULT '',
  `mobile` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(150) NOT NULL DEFAULT '',
  `profession` varchar(60) NOT NULL DEFAULT '',
  `education` varchar(50) NOT NULL DEFAULT '',
  `school` varchar(150) NOT NULL DEFAULT '',
  `wk_contact` char(1) NOT NULL DEFAULT 'N',
  `wk_trans` char(1) NOT NULL DEFAULT 'N',
  `inuse` char(1) NOT NULL DEFAULT 'N',
  `comment` varchar(255) NOT NULL DEFAULT '',
  `staff_id` varchar(10) NOT NULL DEFAULT '',
  `idcard` varchar(18) NOT NULL DEFAULT '',
  `indate` date NOT NULL DEFAULT '0000-00-00',
  `outdate` date NOT NULL DEFAULT '0000-00-00',
  `username` varchar(15) NOT NULL,
  `passwd` varchar(20) NOT NULL DEFAULT '',
  `yingji` enum('Y','N') NOT NULL DEFAULT 'N',
  `login_times` int(8) NOT NULL DEFAULT '0',
  `last_login` datetime NOT NULL,
  `red_addr` varchar(255) NOT NULL DEFAULT '',
  `oicq` varchar(20) NOT NULL DEFAULT '',
  `inuse2` char(2) NOT NULL DEFAULT 'N',
  `idcard_flag` char(1) NOT NULL DEFAULT 'N',
  `admirer_comm` text NOT NULL,
  `account_level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `addtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `super_admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `job` varchar(20) NOT NULL DEFAULT '',
  `update_history` text NOT NULL,
  `dept` tinyint(2) NOT NULL,
  `max_bind` tinyint(2) NOT NULL DEFAULT '10',
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  KEY `agentid` (`authorid`,`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=3887 DEFAULT CHARSET=utf8 COMMENT='Agent Translator ';

-- ----------------------------
--  Table structure for `translator_priv`
-- ----------------------------
DROP TABLE IF EXISTS `translator_priv`;
CREATE TABLE `translator_priv` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `agentid` varchar(10) NOT NULL,
  `staffid` varchar(15) NOT NULL,
  `opt_qx` tinyint(1) NOT NULL DEFAULT '0',
  `emf_qx` char(1) NOT NULL DEFAULT 'Y',
  `cupid_qx` char(1) NOT NULL DEFAULT 'Y',
  `admirer` char(1) NOT NULL DEFAULT 'Y',
  `admirer_review` tinyint(1) NOT NULL DEFAULT '0',
  `private_photo` char(1) NOT NULL DEFAULT 'N',
  `private_short_video` char(1) NOT NULL DEFAULT 'Y',
  `cupid_review` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `profile_group_qx` tinyint(1) NOT NULL DEFAULT '0',
  `emf_group_qx` tinyint(1) NOT NULL DEFAULT '0',
  `album_review_qx` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`,`staffid`)
) ENGINE=MyISAM AUTO_INCREMENT=2767 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `translator_priv_demo`
-- ----------------------------
DROP TABLE IF EXISTS `translator_priv_demo`;
CREATE TABLE `translator_priv_demo` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `agentid` varchar(10) NOT NULL,
  `staffid` varchar(15) NOT NULL,
  `opt_qx` tinyint(1) NOT NULL DEFAULT '0',
  `emf_qx` char(1) NOT NULL DEFAULT 'Y',
  `cupid_qx` char(1) NOT NULL DEFAULT 'Y',
  `admirer` char(1) NOT NULL DEFAULT 'Y',
  `admirer_review` tinyint(1) NOT NULL DEFAULT '0',
  `cupid_review` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `profile_group_qx` tinyint(1) NOT NULL DEFAULT '0',
  `emf_group_qx` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`,`staffid`)
) ENGINE=MyISAM AUTO_INCREMENT=2783 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `translator_work_stats`
-- ----------------------------
DROP TABLE IF EXISTS `translator_work_stats`;
CREATE TABLE `translator_work_stats` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` varchar(10) NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `stats_month` date NOT NULL,
  `emf_reply` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`,`agentid`,`stats_month`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tt_datalog`
-- ----------------------------
DROP TABLE IF EXISTS `tt_datalog`;
CREATE TABLE `tt_datalog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sttaf_id` int(10) unsigned NOT NULL,
  `sttaf_sn` varchar(10) NOT NULL,
  `sttaf_enname` varchar(32) NOT NULL,
  `reference_id` text NOT NULL,
  `modify_type` text NOT NULL,
  `adddate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=622 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tt_recode`
-- ----------------------------
DROP TABLE IF EXISTS `tt_recode`;
CREATE TABLE `tt_recode` (
  `rid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rsn` varchar(16) NOT NULL,
  `owner_id` varchar(35) NOT NULL,
  `woman_id` varchar(35) NOT NULL,
  `result_r` int(1) unsigned NOT NULL,
  `result_p` int(1) unsigned NOT NULL,
  `result_s` int(1) unsigned NOT NULL,
  `result_o` int(1) unsigned NOT NULL,
  `adddate` datetime NOT NULL,
  `recodedate` datetime NOT NULL,
  `operator` varchar(35) NOT NULL,
  `recode` int(1) unsigned NOT NULL,
  `remark` text NOT NULL,
  `status` int(1) unsigned NOT NULL,
  PRIMARY KEY (`rid`),
  UNIQUE KEY `rsn` (`rsn`)
) ENGINE=MyISAM AUTO_INCREMENT=591 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tt_sub_recode`
-- ----------------------------
DROP TABLE IF EXISTS `tt_sub_recode`;
CREATE TABLE `tt_sub_recode` (
  `srid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `result_r` int(1) unsigned NOT NULL,
  `result_p` int(1) unsigned NOT NULL,
  `result_s` int(1) unsigned NOT NULL,
  `result_o` int(1) unsigned NOT NULL,
  `adddate` datetime NOT NULL,
  `recodedate` datetime NOT NULL,
  `operator` varchar(35) NOT NULL,
  `recode` int(1) unsigned NOT NULL,
  `remark` text NOT NULL,
  `status` int(1) unsigned NOT NULL,
  PRIMARY KEY (`srid`)
) ENGINE=MyISAM AUTO_INCREMENT=349 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `virtual_background`
-- ----------------------------
DROP TABLE IF EXISTS `virtual_background`;
CREATE TABLE `virtual_background` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `small_picture` varchar(100) NOT NULL,
  `big_picture` varchar(100) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `virtual_class`
-- ----------------------------
DROP TABLE IF EXISTS `virtual_class`;
CREATE TABLE `virtual_class` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(36) NOT NULL,
  `sequence` int(10) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  `mode` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `virtual_gift_man`
-- ----------------------------
DROP TABLE IF EXISTS `virtual_gift_man`;
CREATE TABLE `virtual_gift_man` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vgm_id` varchar(45) NOT NULL,
  `vg_id` varchar(10) NOT NULL,
  `manid` varchar(15) NOT NULL,
  `m_firstname` varchar(30) NOT NULL,
  `m_lastname` varchar(30) NOT NULL,
  `ip` varchar(32) NOT NULL,
  `agent_id` varchar(20) NOT NULL,
  `agent_follow_staff` varchar(20) NOT NULL,
  `agent_follow_name` varchar(60) NOT NULL,
  `agent_staff` varchar(20) NOT NULL,
  `agent_name` varchar(60) NOT NULL,
  `groupid` varchar(20) NOT NULL,
  `womanid` varchar(15) NOT NULL,
  `w_firstname` varchar(20) NOT NULL,
  `w_lastname` varchar(20) NOT NULL,
  `man_msg` varchar(480) NOT NULL,
  `read_flag` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `read_time_agent` datetime NOT NULL,
  `read_time_lady` datetime NOT NULL,
  `reply_flag` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `reply_time` datetime NOT NULL,
  `reply_mode` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `reply_mode_id` varchar(35) NOT NULL,
  `delete_flag` char(1) NOT NULL DEFAULT 'N',
  `delete_time` datetime NOT NULL,
  `send_mode` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `send_mode_id` varchar(35) NOT NULL,
  `show_on_lady` tinyint(1) NOT NULL DEFAULT '2',
  `division_note` text NOT NULL,
  `division_staff` varchar(20) NOT NULL,
  `division_name` varchar(30) NOT NULL,
  `man_credits` decimal(4,2) NOT NULL,
  `add_time` datetime NOT NULL,
  `device_type` varchar(2) NOT NULL DEFAULT '10',
  PRIMARY KEY (`id`),
  KEY `vgm_id` (`vgm_id`),
  KEY `manid` (`manid`),
  KEY `womanid` (`womanid`),
  KEY `agent_id` (`agent_id`,`send_mode`,`agent_follow_staff`)
) ENGINE=MyISAM AUTO_INCREMENT=310 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `virtual_gift_woman`
-- ----------------------------
DROP TABLE IF EXISTS `virtual_gift_woman`;
CREATE TABLE `virtual_gift_woman` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mw_id` int(10) NOT NULL,
  `vgm_id` varchar(45) NOT NULL,
  `vg_id` varchar(10) NOT NULL,
  `manid` varchar(15) NOT NULL,
  `m_firstname` varchar(30) NOT NULL,
  `m_lastname` varchar(30) NOT NULL,
  `ip` varchar(32) NOT NULL,
  `agent_id` varchar(20) NOT NULL,
  `agent_follow_staff` varchar(20) NOT NULL,
  `agent_follow_name` varchar(60) NOT NULL,
  `agent_staff` varchar(20) NOT NULL,
  `agent_name` varchar(60) NOT NULL,
  `groupid` varchar(20) NOT NULL,
  `womanid` varchar(15) NOT NULL,
  `w_firstname` varchar(20) NOT NULL,
  `w_lastname` varchar(20) NOT NULL,
  `man_msg` varchar(480) NOT NULL,
  `read_flag` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `read_time` datetime NOT NULL,
  `read_time_agent` datetime NOT NULL,
  `read_time_lady` datetime NOT NULL,
  `reply_flag` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `reply_by_who` tinyint(1) NOT NULL DEFAULT '1',
  `reply_time` datetime NOT NULL,
  `reply_mode` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `reply_mode_id` varchar(35) NOT NULL,
  `delete_flag` char(1) NOT NULL DEFAULT 'N',
  `delete_time` datetime NOT NULL,
  `send_mode` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `send_mode_id` varchar(35) NOT NULL,
  `show_on_lady` tinyint(1) NOT NULL DEFAULT '2',
  `division_note` text NOT NULL,
  `division_staff` varchar(20) NOT NULL,
  `division_name` varchar(30) NOT NULL,
  `man_credits` decimal(4,2) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vgm_id` (`vgm_id`),
  KEY `manid` (`manid`),
  KEY `womanid` (`womanid`),
  KEY `agent_id` (`agent_id`,`send_mode`,`agent_follow_staff`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `virtual_gifts`
-- ----------------------------
DROP TABLE IF EXISTS `virtual_gifts`;
CREATE TABLE `virtual_gifts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_id` int(10) unsigned NOT NULL,
  `vg_id` varchar(10) NOT NULL,
  `title` varchar(40) NOT NULL,
  `small_picture` varchar(100) NOT NULL,
  `big_picture` varchar(100) NOT NULL,
  `flash_picture` varchar(100) NOT NULL,
  `w_bigpic` varchar(100) NOT NULL,
  `w_midpic` varchar(100) NOT NULL,
  `w_smallpic` varchar(100) NOT NULL,
  `w_3gp` varchar(100) NOT NULL,
  `w_mp4` varchar(100) NOT NULL,
  `background_id` int(10) unsigned NOT NULL,
  `mall_price` decimal(4,2) NOT NULL,
  `other_price` decimal(4,2) NOT NULL,
  `show_price` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `show_new` tinyint(1) unsigned NOT NULL,
  `show_hot` tinyint(1) unsigned NOT NULL,
  `agency_credits` decimal(4,2) NOT NULL,
  `other_credits` decimal(4,2) NOT NULL,
  `sequence` int(10) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `mode` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `class_id` (`class_id`,`vg_id`,`background_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `virtual_gifts_stat_by_agent`
-- ----------------------------
DROP TABLE IF EXISTS `virtual_gifts_stat_by_agent`;
CREATE TABLE `virtual_gifts_stat_by_agent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agentid` varchar(10) NOT NULL,
  `agentname` varchar(250) NOT NULL,
  `mall_total` int(10) unsigned NOT NULL,
  `mall_pay` decimal(8,2) NOT NULL,
  `emf_total` int(10) unsigned NOT NULL,
  `emf_pay` decimal(8,2) NOT NULL,
  `livechat_total` int(10) unsigned NOT NULL,
  `livechat_pay` decimal(8,2) NOT NULL,
  `wm_emf_total` int(10) unsigned NOT NULL,
  `datetime` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=115234 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `weekly_man`
-- ----------------------------
DROP TABLE IF EXISTS `weekly_man`;
CREATE TABLE `weekly_man` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `manid` varchar(20) NOT NULL DEFAULT '',
  `firstname` varchar(50) NOT NULL DEFAULT '',
  `lastname` varchar(50) NOT NULL DEFAULT '',
  `children` char(1) NOT NULL DEFAULT '',
  `marry` char(1) NOT NULL DEFAULT '',
  `education` tinyint(4) NOT NULL DEFAULT '0',
  `country` varchar(200) NOT NULL DEFAULT '',
  `age1` int(4) NOT NULL DEFAULT '0',
  `age2` int(4) NOT NULL DEFAULT '0',
  `email` varchar(120) NOT NULL DEFAULT '',
  `status` char(1) NOT NULL DEFAULT '',
  `uid` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`)
) ENGINE=MyISAM AUTO_INCREMENT=170657 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `weekly_stats_by_lady`
-- ----------------------------
DROP TABLE IF EXISTS `weekly_stats_by_lady`;
CREATE TABLE `weekly_stats_by_lady` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `agentid` varchar(10) NOT NULL,
  `womanid` varchar(15) NOT NULL,
  `stats_date` date NOT NULL DEFAULT '0000-00-00',
  `stats_mw` int(8) NOT NULL DEFAULT '0',
  `stats_wm` int(8) NOT NULL DEFAULT '0',
  `stats_add` int(8) NOT NULL DEFAULT '0',
  `stats_lc` decimal(9,2) NOT NULL DEFAULT '0.00',
  `stats_video` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_gift_flowers` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_virtual_gifts` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_cupiddate` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_ot` int(8) NOT NULL DEFAULT '0',
  `stats_ot2` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_call1` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_call2` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_call3` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_call4` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `verify_video_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`),
  KEY `stats_month` (`stats_date`,`agentid`,`womanid`),
  KEY `agentid` (`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `weekly_update`
-- ----------------------------
DROP TABLE IF EXISTS `weekly_update`;
CREATE TABLE `weekly_update` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `sdate` date NOT NULL DEFAULT '0000-00-00',
  `edate` date NOT NULL DEFAULT '0000-00-00',
  `status` char(1) NOT NULL DEFAULT '',
  `sendtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `start` int(8) NOT NULL DEFAULT '0',
  `total` int(8) NOT NULL DEFAULT '0',
  `progress` char(1) NOT NULL DEFAULT 'N',
  `endtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `woman` tinyint(8) NOT NULL DEFAULT '0',
  `scheduled_start_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `weekly_update_failure`
-- ----------------------------
DROP TABLE IF EXISTS `weekly_update_failure`;
CREATE TABLE `weekly_update_failure` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `adddate` datetime NOT NULL,
  `manlist` text NOT NULL,
  `num` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `weekly_woman`
-- ----------------------------
DROP TABLE IF EXISTS `weekly_woman`;
CREATE TABLE `weekly_woman` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `womanid` varchar(20) NOT NULL DEFAULT '',
  `firstname` varchar(60) NOT NULL,
  `lastname` varchar(60) NOT NULL,
  `country` varchar(50) NOT NULL DEFAULT '',
  `province` varchar(50) NOT NULL DEFAULT '',
  `city` varchar(50) NOT NULL DEFAULT '',
  `age` tinyint(2) NOT NULL DEFAULT '0',
  `marry` tinyint(1) NOT NULL DEFAULT '0',
  `children` char(1) NOT NULL DEFAULT '',
  `education` tinyint(1) NOT NULL DEFAULT '0',
  `owner` varchar(10) NOT NULL,
  `weight` int(3) NOT NULL DEFAULT '0',
  `height` int(3) NOT NULL DEFAULT '0',
  `postdate` date NOT NULL,
  `jj` varchar(350) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=43722 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman`
-- ----------------------------
DROP TABLE IF EXISTS `woman`;
CREATE TABLE `woman` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `womanid` varchar(12) NOT NULL DEFAULT '',
  `owner` varchar(6) NOT NULL DEFAULT '',
  `submitdate` date NOT NULL DEFAULT '0000-00-00',
  `submit_audit_time` datetime NOT NULL,
  `postdate` datetime DEFAULT NULL,
  `status1` char(1) DEFAULT '1',
  `pending_s_time` datetime NOT NULL,
  `pending_e_time` datetime NOT NULL,
  `status2` char(1) DEFAULT '1',
  `firstname` varchar(20) DEFAULT NULL,
  `lastname` varchar(20) DEFAULT NULL,
  `idcard_enname` varchar(50) NOT NULL,
  `country` varchar(100) DEFAULT NULL,
  `province` varchar(50) NOT NULL DEFAULT '',
  `submit_by` varchar(40) NOT NULL DEFAULT '',
  `city` varchar(50) NOT NULL DEFAULT '',
  `birthday` date DEFAULT NULL,
  `height` int(3) DEFAULT NULL,
  `weight` int(3) DEFAULT NULL,
  `hair` tinyint(1) unsigned NOT NULL,
  `eye` tinyint(1) unsigned NOT NULL,
  `smoke` tinyint(1) DEFAULT NULL,
  `drink` tinyint(1) DEFAULT NULL,
  `interests` varchar(50) DEFAULT NULL,
  `english` tinyint(1) DEFAULT NULL,
  `religion` tinyint(1) DEFAULT NULL,
  `children` char(1) DEFAULT NULL,
  `education` tinyint(1) DEFAULT NULL,
  `profession` tinyint(1) DEFAULT NULL,
  `marry` tinyint(1) DEFAULT NULL,
  `remark` text,
  `jj_en` text,
  `email` varchar(100) DEFAULT NULL,
  `emailforward` tinyint(1) DEFAULT NULL,
  `postaddr` tinyint(1) NOT NULL DEFAULT '1',
  `lovecall` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `lovecall_instant` tinyint(1) NOT NULL DEFAULT '0',
  `lovecall_instant2` tinyint(1) NOT NULL DEFAULT '1',
  `gift_flower` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `gift_flower2` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `cnname` varchar(255) NOT NULL,
  `idcard` varchar(20) DEFAULT NULL,
  `cool` char(1) NOT NULL DEFAULT '0',
  `deleted` char(1) NOT NULL DEFAULT '0',
  `publish_post_address` char(1) NOT NULL DEFAULT 'N',
  `publish_home_tel` char(1) NOT NULL DEFAULT 'Y',
  `publish_office_tel` char(1) NOT NULL DEFAULT 'Y',
  `publish_mobile_tel` char(1) NOT NULL DEFAULT 'Y',
  `publish_email` char(1) NOT NULL DEFAULT 'Y',
  `apptable` char(1) NOT NULL DEFAULT 'N',
  `auditflag` char(1) NOT NULL DEFAULT '0',
  `pr_auditflag` tinyint(1) NOT NULL DEFAULT '0',
  `qa_auditflag` tinyint(1) NOT NULL DEFAULT '0',
  `photo_flag` char(1) NOT NULL DEFAULT 'N',
  `idcard_flag` char(1) NOT NULL DEFAULT 'N',
  `black` char(1) NOT NULL DEFAULT 'N',
  `comment` text NOT NULL,
  `hidden_reason` text NOT NULL,
  `chn_remark` text NOT NULL,
  `last_update` datetime DEFAULT NULL,
  `cupid_flag` char(1) NOT NULL DEFAULT 'Y',
  `man_age1` year(4) NOT NULL,
  `man_age2` year(4) NOT NULL,
  `follower` varchar(30) NOT NULL DEFAULT '',
  `follower_staffid` varchar(10) NOT NULL,
  `groupid` varchar(10) NOT NULL,
  `zodiac` tinyint(1) NOT NULL DEFAULT '0',
  `problem` tinyint(1) NOT NULL DEFAULT '0',
  `smsflag` tinyint(1) NOT NULL DEFAULT '1',
  `sms_verify` tinyint(1) NOT NULL DEFAULT '0',
  `template` int(4) NOT NULL DEFAULT '0',
  `keyword` varchar(30) NOT NULL,
  `keyword_d` varchar(30) NOT NULL,
  `lastlogin` datetime NOT NULL,
  `loginnum` int(6) NOT NULL,
  `lc_staffname` varchar(30) NOT NULL,
  `lc_staffid` varchar(10) NOT NULL,
  `lc_lang` varchar(5) NOT NULL DEFAULT 'en',
  `video_num` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `photo_num` tinyint(2) NOT NULL DEFAULT '0',
  `verify_video_status` tinyint(1) NOT NULL DEFAULT '0',
  `credit_paid` decimal(6,2) unsigned NOT NULL DEFAULT '0.00',
  `credit_deducte` decimal(6,2) unsigned NOT NULL DEFAULT '0.00',
  `credit_lastupdate` datetime NOT NULL,
  `ordervalue` int(4) NOT NULL DEFAULT '50',
  `contact_request` tinyint(1) NOT NULL DEFAULT '1',
  `private_album_upload` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `private_album_send` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `private_album_num` tinyint(1) unsigned NOT NULL DEFAULT '3',
  `private_short_video_upload` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `private_short_video_send` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `private_short_video_num` tinyint(1) unsigned NOT NULL DEFAULT '3',
  `online_status` tinyint(1) NOT NULL DEFAULT '3',
  `cam2isopen` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `fromid` varchar(10) NOT NULL DEFAULT '',
  `additional_lang` varchar(12) NOT NULL,
  `lock_short_video` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`),
  KEY `submitdate` (`submitdate`),
  KEY `postdate` (`postdate`),
  KEY `owner` (`owner`),
  KEY `status1` (`status1`,`deleted`),
  KEY `groupid` (`groupid`)
) ENGINE=MyISAM AUTO_INCREMENT=43743 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_album`
-- ----------------------------
DROP TABLE IF EXISTS `woman_album`;
CREATE TABLE `woman_album` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `agentid` varchar(10) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `album_name` varchar(50) NOT NULL,
  `album_desc` varchar(255) NOT NULL,
  `delflag` char(1) NOT NULL DEFAULT 'N',
  `addtime` datetime NOT NULL,
  `staff_id` varchar(10) NOT NULL,
  `staff_name` varchar(50) NOT NULL,
  `delete_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=74997 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_album_demo`
-- ----------------------------
DROP TABLE IF EXISTS `woman_album_demo`;
CREATE TABLE `woman_album_demo` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `agentid` varchar(10) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `album_name` varchar(50) NOT NULL,
  `album_desc` varchar(255) NOT NULL,
  `photo_num` tinyint(2) NOT NULL DEFAULT '0',
  `delflag` char(1) NOT NULL DEFAULT 'N',
  `addtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=75023 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_album_photo`
-- ----------------------------
DROP TABLE IF EXISTS `woman_album_photo`;
CREATE TABLE `woman_album_photo` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `agentid` varchar(10) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `albumid` int(7) unsigned NOT NULL DEFAULT '0',
  `photo_desc` varchar(255) NOT NULL,
  `filename` varchar(50) NOT NULL,
  `delflag` char(1) NOT NULL DEFAULT 'N',
  `addtime` datetime NOT NULL,
  `review_mode` char(1) NOT NULL DEFAULT 'S',
  `review_flag` char(1) NOT NULL DEFAULT 'P',
  `review_group` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `logtxt` varchar(300) NOT NULL,
  `agent_upload_staffid` varchar(10) NOT NULL,
  `reviewed_staff` varchar(50) NOT NULL,
  `reviewed_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `albumid` (`albumid`),
  KEY `womanid` (`womanid`),
  KEY `agentid` (`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=1033768 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_album_photo_demo`
-- ----------------------------
DROP TABLE IF EXISTS `woman_album_photo_demo`;
CREATE TABLE `woman_album_photo_demo` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `agentid` varchar(10) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `albumid` int(7) unsigned NOT NULL DEFAULT '0',
  `photo_desc` varchar(255) NOT NULL,
  `filename` varchar(50) NOT NULL,
  `delflag` char(1) NOT NULL DEFAULT 'N',
  `addtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `albumid` (`albumid`),
  KEY `womanid` (`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=1034337 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_album_photo_review`
-- ----------------------------
DROP TABLE IF EXISTS `woman_album_photo_review`;
CREATE TABLE `woman_album_photo_review` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `agentid` varchar(10) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `albumid` int(7) unsigned NOT NULL DEFAULT '0',
  `photo_desc` varchar(255) NOT NULL,
  `filename` varchar(50) NOT NULL,
  `delflag` char(1) NOT NULL DEFAULT 'N',
  `addtime` datetime NOT NULL,
  `reviewed` int(1) NOT NULL DEFAULT '0',
  `needdelete` int(1) NOT NULL DEFAULT '0',
  `staff_id` varchar(50) NOT NULL,
  `review_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `albumid` (`albumid`),
  KEY `womanid` (`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=829243 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_all`
-- ----------------------------
DROP TABLE IF EXISTS `woman_all`;
CREATE TABLE `woman_all` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `womanid` varchar(12) NOT NULL DEFAULT '',
  `owner` varchar(6) NOT NULL DEFAULT '',
  `submitdate` date NOT NULL DEFAULT '0000-00-00',
  `submit_audit_time` datetime NOT NULL,
  `postdate` datetime DEFAULT NULL,
  `status1` char(1) DEFAULT '1',
  `pending_s_time` datetime NOT NULL,
  `pending_e_time` datetime NOT NULL,
  `status2` char(1) DEFAULT '1',
  `firstname` varchar(20) DEFAULT NULL,
  `lastname` varchar(20) DEFAULT NULL,
  `idcard_enname` varchar(50) NOT NULL,
  `country` varchar(100) DEFAULT NULL,
  `province` varchar(50) NOT NULL DEFAULT '',
  `submit_by` varchar(40) NOT NULL DEFAULT '',
  `city` varchar(50) NOT NULL DEFAULT '',
  `birthday` date DEFAULT NULL,
  `height` int(3) DEFAULT NULL,
  `weight` int(3) DEFAULT NULL,
  `hair` tinyint(1) unsigned NOT NULL,
  `eye` tinyint(1) unsigned NOT NULL,
  `smoke` tinyint(1) DEFAULT NULL,
  `drink` tinyint(1) DEFAULT NULL,
  `interests` varchar(50) DEFAULT NULL,
  `english` tinyint(1) DEFAULT NULL,
  `religion` tinyint(1) DEFAULT NULL,
  `children` char(1) DEFAULT NULL,
  `education` tinyint(1) DEFAULT NULL,
  `profession` tinyint(1) DEFAULT NULL,
  `marry` tinyint(1) DEFAULT NULL,
  `remark` text,
  `jj_en` text,
  `email` varchar(100) DEFAULT NULL,
  `emailforward` tinyint(1) DEFAULT NULL,
  `postaddr` tinyint(1) NOT NULL DEFAULT '1',
  `lovecall` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `lovecall_instant` tinyint(1) NOT NULL DEFAULT '0',
  `lovecall_instant2` tinyint(1) NOT NULL DEFAULT '1',
  `gift_flower` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `gift_flower2` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `cnname` varchar(255) NOT NULL,
  `idcard` varchar(20) DEFAULT NULL,
  `cool` char(1) NOT NULL DEFAULT '0',
  `deleted` char(1) NOT NULL DEFAULT '0',
  `publish_post_address` char(1) NOT NULL DEFAULT 'N',
  `publish_home_tel` char(1) NOT NULL DEFAULT 'Y',
  `publish_office_tel` char(1) NOT NULL DEFAULT 'Y',
  `publish_mobile_tel` char(1) NOT NULL DEFAULT 'Y',
  `publish_email` char(1) NOT NULL DEFAULT 'Y',
  `apptable` char(1) NOT NULL DEFAULT 'N',
  `auditflag` char(1) NOT NULL DEFAULT '0',
  `pr_auditflag` tinyint(1) NOT NULL DEFAULT '0',
  `qa_auditflag` tinyint(1) NOT NULL DEFAULT '0',
  `photo_flag` char(1) NOT NULL DEFAULT 'N',
  `idcard_flag` char(1) NOT NULL DEFAULT 'N',
  `black` char(1) NOT NULL DEFAULT 'N',
  `comment` text NOT NULL,
  `hidden_reason` text NOT NULL,
  `chn_remark` text NOT NULL,
  `last_update` datetime DEFAULT NULL,
  `cupid_flag` char(1) NOT NULL DEFAULT 'Y',
  `man_age1` year(4) NOT NULL,
  `man_age2` year(4) NOT NULL,
  `follower` varchar(30) NOT NULL DEFAULT '',
  `follower_staffid` varchar(10) NOT NULL,
  `groupid` varchar(10) NOT NULL,
  `zodiac` tinyint(1) NOT NULL DEFAULT '0',
  `problem` tinyint(1) NOT NULL DEFAULT '0',
  `smsflag` tinyint(1) NOT NULL DEFAULT '1',
  `sms_verify` tinyint(1) NOT NULL DEFAULT '0',
  `template` int(4) NOT NULL DEFAULT '0',
  `keyword` varchar(30) NOT NULL,
  `keyword_d` varchar(30) NOT NULL,
  `lastlogin` datetime NOT NULL,
  `loginnum` int(6) NOT NULL,
  `lc_staffname` varchar(30) NOT NULL,
  `lc_staffid` varchar(10) NOT NULL,
  `lc_lang` varchar(5) NOT NULL DEFAULT 'en',
  `video_num` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `photo_num` tinyint(2) NOT NULL DEFAULT '0',
  `verify_video_status` tinyint(1) NOT NULL DEFAULT '0',
  `credit_paid` decimal(6,2) unsigned NOT NULL DEFAULT '0.00',
  `credit_deducte` decimal(6,2) unsigned NOT NULL DEFAULT '0.00',
  `credit_lastupdate` datetime NOT NULL,
  `ordervalue` int(4) NOT NULL DEFAULT '50',
  `contact_request` tinyint(1) NOT NULL DEFAULT '1',
  `private_album_upload` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `private_album_send` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `private_album_num` tinyint(1) unsigned NOT NULL DEFAULT '3',
  `private_short_video_upload` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `private_short_video_send` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `private_short_video_num` tinyint(1) unsigned NOT NULL DEFAULT '3',
  `online_status` tinyint(1) NOT NULL DEFAULT '3',
  `cam2isopen` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `fromid` varchar(10) NOT NULL DEFAULT '',
  `additional_lang` varchar(12) NOT NULL,
  `lock_short_video` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`),
  KEY `submitdate` (`submitdate`),
  KEY `postdate` (`postdate`),
  KEY `owner` (`owner`),
  KEY `status1` (`status1`,`deleted`),
  KEY `groupid` (`groupid`)
) ENGINE=MRG_MyISAM DEFAULT CHARSET=utf8 INSERT_METHOD=FIRST UNION=(`woman`,`woman_deleted`);

-- ----------------------------
--  Table structure for `woman_batch_hidden`
-- ----------------------------
DROP TABLE IF EXISTS `woman_batch_hidden`;
CREATE TABLE `woman_batch_hidden` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `agentid` varchar(20) NOT NULL,
  `company` varchar(200) NOT NULL,
  `num` int(5) NOT NULL,
  `adddate` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `womanlist` text NOT NULL,
  `staff_restore` varchar(50) NOT NULL,
  `staff_add` varchar(50) NOT NULL,
  `restore_date` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `num_restore` int(5) NOT NULL,
  `womanlist2` text NOT NULL,
  `reason` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_birthday`
-- ----------------------------
DROP TABLE IF EXISTS `woman_birthday`;
CREATE TABLE `woman_birthday` (
  `id` int(6) NOT NULL DEFAULT '0',
  `womanid` varchar(15) NOT NULL,
  `firstname` varchar(30) DEFAULT NULL,
  `lastname` varchar(30) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `owner` varchar(6) NOT NULL DEFAULT '',
  PRIMARY KEY (`womanid`),
  KEY `birthday` (`birthday`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_black`
-- ----------------------------
DROP TABLE IF EXISTS `woman_black`;
CREATE TABLE `woman_black` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `womanid` varchar(12) NOT NULL,
  `agentid` varchar(8) NOT NULL,
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `create_staff_name` varchar(40) NOT NULL,
  `create_staff_id` varchar(10) NOT NULL,
  `delete_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `delete_staff_name` varchar(40) NOT NULL,
  `delete_staff_id` varchar(10) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'N',
  `submitip` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`),
  KEY `agentid` (`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_choose_mate`
-- ----------------------------
DROP TABLE IF EXISTS `woman_choose_mate`;
CREATE TABLE `woman_choose_mate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `womanid` varchar(12) NOT NULL,
  `education` int(2) NOT NULL DEFAULT '0',
  `marriage` tinyint(1) NOT NULL DEFAULT '0',
  `nevermarried` tinyint(1) NOT NULL DEFAULT '0',
  `divorced` tinyint(1) NOT NULL DEFAULT '0',
  `widowed` tinyint(1) NOT NULL DEFAULT '0',
  `separated` tinyint(1) NOT NULL DEFAULT '0',
  `married` tinyint(1) NOT NULL DEFAULT '0',
  `child` int(2) NOT NULL DEFAULT '0',
  `weightlimit` tinyint(1) NOT NULL DEFAULT '0',
  `weightmin` int(2) unsigned NOT NULL,
  `weightmax` int(2) unsigned NOT NULL,
  `staturelimit` tinyint(1) NOT NULL DEFAULT '0',
  `staturemin` int(2) unsigned NOT NULL,
  `staturemax` int(2) unsigned NOT NULL,
  `countrylimit` tinyint(1) NOT NULL DEFAULT '0',
  `unitedstates` tinyint(1) NOT NULL DEFAULT '0',
  `canada` tinyint(1) NOT NULL DEFAULT '0',
  `newzealand` tinyint(1) NOT NULL DEFAULT '0',
  `australia` tinyint(1) NOT NULL DEFAULT '0',
  `unitedkingdom` tinyint(1) NOT NULL DEFAULT '0',
  `germany` tinyint(1) NOT NULL DEFAULT '0',
  `othercountries` tinyint(1) NOT NULL DEFAULT '0',
  `racelimit` tinyint(1) NOT NULL DEFAULT '0',
  `asian` tinyint(1) NOT NULL DEFAULT '0',
  `badescent` tinyint(1) NOT NULL DEFAULT '0',
  `caucasian` tinyint(1) NOT NULL DEFAULT '0',
  `eastindian` tinyint(1) NOT NULL DEFAULT '0',
  `hispaniclatino` tinyint(1) NOT NULL DEFAULT '0',
  `nativeamerican` tinyint(1) NOT NULL DEFAULT '0',
  `pacificislander` tinyint(1) NOT NULL DEFAULT '0',
  `semitic` tinyint(1) NOT NULL DEFAULT '0',
  `otherrace` tinyint(1) NOT NULL DEFAULT '0',
  `constellationlimit` tinyint(1) NOT NULL DEFAULT '0',
  `aquarius` tinyint(1) NOT NULL DEFAULT '0',
  `pisces` tinyint(1) NOT NULL DEFAULT '0',
  `aries` tinyint(1) NOT NULL DEFAULT '0',
  `taurus` tinyint(1) NOT NULL DEFAULT '0',
  `gemini` tinyint(1) NOT NULL DEFAULT '0',
  `cancer` tinyint(1) NOT NULL DEFAULT '0',
  `leo` tinyint(1) NOT NULL DEFAULT '0',
  `virgo` tinyint(1) NOT NULL DEFAULT '0',
  `libra` tinyint(1) NOT NULL DEFAULT '0',
  `scorpio` tinyint(1) NOT NULL DEFAULT '0',
  `sagittarius` tinyint(1) NOT NULL DEFAULT '0',
  `capricorn` tinyint(1) NOT NULL DEFAULT '0',
  `interestslimit` tinyint(1) NOT NULL DEFAULT '0',
  `goingtorestaurants` tinyint(1) NOT NULL DEFAULT '0',
  `cooking` tinyint(1) NOT NULL DEFAULT '0',
  `travel` tinyint(1) NOT NULL DEFAULT '0',
  `hoactivities` tinyint(1) NOT NULL DEFAULT '0',
  `dancing` tinyint(1) NOT NULL DEFAULT '0',
  `watchingmovies` tinyint(1) NOT NULL DEFAULT '0',
  `shopping` tinyint(1) NOT NULL DEFAULT '0',
  `havingpets` tinyint(1) NOT NULL DEFAULT '0',
  `reading` tinyint(1) NOT NULL DEFAULT '0',
  `sportsexercise` tinyint(1) NOT NULL DEFAULT '0',
  `playingcardschess` tinyint(1) NOT NULL DEFAULT '0',
  `musicplayinstruments` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `womanid` (`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_cool`
-- ----------------------------
DROP TABLE IF EXISTS `woman_cool`;
CREATE TABLE `woman_cool` (
  `womanid` varchar(12) NOT NULL,
  `agentid` varchar(8) NOT NULL,
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `create_staff_name` varchar(40) NOT NULL,
  `create_staff_id` varchar(10) NOT NULL,
  `cool` int(1) NOT NULL DEFAULT '0',
  `hotorder` int(4) unsigned NOT NULL,
  PRIMARY KEY (`womanid`),
  KEY `agentid` (`agentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_deleted`
-- ----------------------------
DROP TABLE IF EXISTS `woman_deleted`;
CREATE TABLE `woman_deleted` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `womanid` varchar(12) NOT NULL DEFAULT '',
  `owner` varchar(6) NOT NULL DEFAULT '',
  `submitdate` date NOT NULL DEFAULT '0000-00-00',
  `submit_audit_time` datetime NOT NULL,
  `postdate` datetime DEFAULT NULL,
  `status1` char(1) DEFAULT '1',
  `pending_s_time` datetime NOT NULL,
  `pending_e_time` datetime NOT NULL,
  `status2` char(1) DEFAULT '1',
  `firstname` varchar(20) DEFAULT NULL,
  `lastname` varchar(20) DEFAULT NULL,
  `idcard_enname` varchar(50) NOT NULL,
  `country` varchar(100) DEFAULT NULL,
  `province` varchar(50) NOT NULL DEFAULT '',
  `submit_by` varchar(40) NOT NULL DEFAULT '',
  `city` varchar(50) NOT NULL DEFAULT '',
  `birthday` date DEFAULT NULL,
  `height` int(3) DEFAULT NULL,
  `weight` int(3) DEFAULT NULL,
  `hair` tinyint(1) unsigned NOT NULL,
  `eye` tinyint(1) unsigned NOT NULL,
  `smoke` tinyint(1) DEFAULT NULL,
  `drink` tinyint(1) DEFAULT NULL,
  `interests` varchar(50) DEFAULT NULL,
  `english` tinyint(1) DEFAULT NULL,
  `religion` tinyint(1) DEFAULT NULL,
  `children` char(1) DEFAULT NULL,
  `education` tinyint(1) DEFAULT NULL,
  `profession` tinyint(1) DEFAULT NULL,
  `marry` tinyint(1) DEFAULT NULL,
  `remark` text,
  `jj_en` text,
  `email` varchar(100) DEFAULT NULL,
  `emailforward` tinyint(1) DEFAULT NULL,
  `postaddr` tinyint(1) NOT NULL DEFAULT '1',
  `lovecall` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `lovecall_instant` tinyint(1) NOT NULL DEFAULT '0',
  `lovecall_instant2` tinyint(1) NOT NULL DEFAULT '1',
  `gift_flower` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `gift_flower2` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `cnname` varchar(255) NOT NULL,
  `idcard` varchar(20) DEFAULT NULL,
  `cool` char(1) NOT NULL DEFAULT '0',
  `deleted` char(1) NOT NULL DEFAULT '0',
  `publish_post_address` char(1) NOT NULL DEFAULT 'N',
  `publish_home_tel` char(1) NOT NULL DEFAULT 'Y',
  `publish_office_tel` char(1) NOT NULL DEFAULT 'Y',
  `publish_mobile_tel` char(1) NOT NULL DEFAULT 'Y',
  `publish_email` char(1) NOT NULL DEFAULT 'Y',
  `apptable` char(1) NOT NULL DEFAULT 'N',
  `auditflag` char(1) NOT NULL DEFAULT '0',
  `pr_auditflag` tinyint(1) NOT NULL DEFAULT '0',
  `qa_auditflag` tinyint(1) NOT NULL DEFAULT '0',
  `photo_flag` char(1) NOT NULL DEFAULT 'N',
  `idcard_flag` char(1) NOT NULL DEFAULT 'N',
  `black` char(1) NOT NULL DEFAULT 'N',
  `comment` text NOT NULL,
  `hidden_reason` text NOT NULL,
  `chn_remark` text NOT NULL,
  `last_update` datetime DEFAULT NULL,
  `cupid_flag` char(1) NOT NULL DEFAULT 'Y',
  `man_age1` year(4) NOT NULL,
  `man_age2` year(4) NOT NULL,
  `follower` varchar(30) NOT NULL DEFAULT '',
  `follower_staffid` varchar(10) NOT NULL,
  `groupid` varchar(10) NOT NULL,
  `zodiac` tinyint(1) NOT NULL DEFAULT '0',
  `problem` tinyint(1) NOT NULL DEFAULT '0',
  `smsflag` tinyint(1) NOT NULL DEFAULT '1',
  `sms_verify` tinyint(1) NOT NULL DEFAULT '0',
  `template` int(4) NOT NULL DEFAULT '0',
  `keyword` varchar(30) NOT NULL,
  `keyword_d` varchar(30) NOT NULL,
  `lastlogin` datetime NOT NULL,
  `loginnum` int(6) NOT NULL,
  `lc_staffname` varchar(30) NOT NULL,
  `lc_staffid` varchar(10) NOT NULL,
  `lc_lang` varchar(5) NOT NULL DEFAULT 'en',
  `video_num` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `photo_num` tinyint(2) NOT NULL DEFAULT '0',
  `verify_video_status` tinyint(1) NOT NULL DEFAULT '0',
  `credit_paid` decimal(6,2) unsigned NOT NULL DEFAULT '0.00',
  `credit_deducte` decimal(6,2) unsigned NOT NULL DEFAULT '0.00',
  `credit_lastupdate` datetime NOT NULL,
  `ordervalue` int(4) NOT NULL DEFAULT '50',
  `contact_request` tinyint(1) NOT NULL DEFAULT '1',
  `private_album_upload` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `private_album_send` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `private_album_num` tinyint(1) unsigned NOT NULL DEFAULT '3',
  `private_short_video_upload` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `private_short_video_send` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `private_short_video_num` tinyint(1) unsigned NOT NULL DEFAULT '3',
  `online_status` tinyint(1) NOT NULL DEFAULT '3',
  `cam2isopen` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `fromid` varchar(10) NOT NULL DEFAULT '',
  `additional_lang` varchar(12) NOT NULL,
  `lock_short_video` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`),
  KEY `submitdate` (`submitdate`),
  KEY `postdate` (`postdate`),
  KEY `owner` (`owner`),
  KEY `status1` (`status1`,`deleted`),
  KEY `groupid` (`groupid`)
) ENGINE=MyISAM AUTO_INCREMENT=43743 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_demo`
-- ----------------------------
DROP TABLE IF EXISTS `woman_demo`;
CREATE TABLE `woman_demo` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `womanid` varchar(12) NOT NULL DEFAULT '',
  `owner` varchar(6) NOT NULL DEFAULT '',
  `submitdate` date NOT NULL DEFAULT '0000-00-00',
  `postdate` datetime DEFAULT NULL,
  `status1` char(1) DEFAULT '1',
  `status2` char(1) DEFAULT '1',
  `firstname` varchar(20) DEFAULT NULL,
  `lastname` varchar(20) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `province` varchar(50) NOT NULL DEFAULT '',
  `submit_by` varchar(40) NOT NULL DEFAULT '',
  `city` varchar(50) NOT NULL DEFAULT '',
  `birthday` date DEFAULT NULL,
  `height` int(3) DEFAULT NULL,
  `weight` int(3) DEFAULT NULL,
  `smoke` tinyint(1) DEFAULT NULL,
  `drink` tinyint(1) DEFAULT NULL,
  `english` tinyint(1) DEFAULT NULL,
  `religion` tinyint(1) DEFAULT NULL,
  `children` char(1) DEFAULT NULL,
  `education` tinyint(1) DEFAULT NULL,
  `profession` tinyint(1) DEFAULT NULL,
  `marry` tinyint(1) DEFAULT NULL,
  `remark` text,
  `jj_en` text,
  `email` varchar(100) DEFAULT NULL,
  `emailforward` tinyint(1) DEFAULT NULL,
  `postaddr` tinyint(1) NOT NULL DEFAULT '1',
  `lovecall` tinyint(1) DEFAULT '1',
  `cnname` varchar(255) DEFAULT NULL,
  `idcard` varchar(20) DEFAULT NULL,
  `cool` char(1) NOT NULL DEFAULT '0',
  `deleted` char(1) NOT NULL DEFAULT '0',
  `publish_post_address` char(1) NOT NULL DEFAULT 'N',
  `publish_home_tel` char(1) NOT NULL DEFAULT 'Y',
  `publish_office_tel` char(1) NOT NULL DEFAULT 'Y',
  `publish_mobile_tel` char(1) NOT NULL DEFAULT 'Y',
  `publish_email` char(1) NOT NULL DEFAULT 'Y',
  `apptable` char(1) NOT NULL DEFAULT 'N',
  `auditflag` char(1) NOT NULL DEFAULT '0',
  `photo_flag` char(1) NOT NULL DEFAULT 'N',
  `idcard_flag` char(1) NOT NULL DEFAULT 'N',
  `black` char(1) NOT NULL DEFAULT 'N',
  `comment` text NOT NULL,
  `hidden_reason` text NOT NULL,
  `chn_remark` text NOT NULL,
  `last_update` datetime DEFAULT NULL,
  `video_flag` tinyint(1) NOT NULL DEFAULT '0',
  `cupid_flag` char(1) NOT NULL DEFAULT 'Y',
  `man_age1` year(4) NOT NULL,
  `man_age2` year(4) NOT NULL,
  `follower` varchar(30) NOT NULL DEFAULT '',
  `follower_staffid` varchar(10) NOT NULL,
  `groupid` varchar(10) NOT NULL,
  `agent_comm_bak` varchar(255) NOT NULL,
  `zodiac` tinyint(1) NOT NULL DEFAULT '0',
  `problem` tinyint(1) NOT NULL DEFAULT '0',
  `smsflag` tinyint(1) NOT NULL DEFAULT '1',
  `sms_verify` tinyint(1) NOT NULL DEFAULT '0',
  `template` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `keyword` varchar(30) NOT NULL,
  `keyword_d` varchar(30) NOT NULL,
  `lastlogin` datetime NOT NULL,
  `loginnum` int(6) NOT NULL,
  `lc_staffname` varchar(30) NOT NULL,
  `lc_staffid` varchar(10) NOT NULL,
  `lc_lang` varchar(5) NOT NULL DEFAULT 'zh',
  `video_num` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`),
  KEY `submitdate` (`submitdate`),
  KEY `postdate` (`postdate`),
  KEY `owner` (`owner`),
  KEY `status1` (`status1`,`deleted`),
  KEY `groupid` (`groupid`)
) ENGINE=MyISAM AUTO_INCREMENT=44063 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_group`
-- ----------------------------
DROP TABLE IF EXISTS `woman_group`;
CREATE TABLE `woman_group` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `agentid` varchar(10) NOT NULL,
  `groupid` varchar(10) NOT NULL,
  `follower_staffid` varchar(10) NOT NULL,
  `follower_name` varchar(50) NOT NULL,
  `sfollower_staffid` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forseek` (`agentid`,`groupid`)
) ENGINE=MyISAM AUTO_INCREMENT=2624 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_group_demo`
-- ----------------------------
DROP TABLE IF EXISTS `woman_group_demo`;
CREATE TABLE `woman_group_demo` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `agentid` varchar(10) NOT NULL,
  `groupid` varchar(10) NOT NULL,
  `follower_staffid` varchar(10) NOT NULL,
  `follower_name` varchar(50) NOT NULL,
  `sfollower_staffid` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forseek` (`agentid`,`groupid`)
) ENGINE=MyISAM AUTO_INCREMENT=2745 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_group_task`
-- ----------------------------
DROP TABLE IF EXISTS `woman_group_task`;
CREATE TABLE `woman_group_task` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `agentid` varchar(10) NOT NULL,
  `womanid` varchar(12) NOT NULL,
  `cnname` varchar(30) NOT NULL,
  `enname` varchar(30) NOT NULL,
  `from_group` varchar(10) NOT NULL,
  `to_group` varchar(10) NOT NULL,
  `submit_time` datetime NOT NULL,
  `submit_by` varchar(50) NOT NULL,
  `status_flag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`,`womanid`,`status_flag`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_info`
-- ----------------------------
DROP TABLE IF EXISTS `woman_info`;
CREATE TABLE `woman_info` (
  `womanid` varchar(20) NOT NULL DEFAULT '',
  `video_desc` text NOT NULL,
  `video_reason` text NOT NULL,
  `video_server` tinyint(1) NOT NULL DEFAULT '0',
  `agentid` varchar(6) NOT NULL,
  `jj_cn` text NOT NULL,
  `addr_cn` varchar(500) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `homephone_cc` varchar(4) NOT NULL,
  `homephone_ac` varchar(4) NOT NULL,
  `homephone` varchar(50) NOT NULL,
  `offphone_cc` varchar(4) NOT NULL,
  `offphone_ac` varchar(4) NOT NULL,
  `offphone_ext` varchar(4) NOT NULL,
  `offphone` varchar(50) NOT NULL,
  `callphone_cc` varchar(4) NOT NULL,
  `callphone_ac` varchar(4) NOT NULL,
  `callphone` varchar(50) NOT NULL,
  `home_addr` varchar(254) NOT NULL,
  `home_postcode` varchar(10) NOT NULL,
  `agent_comm` varchar(255) NOT NULL,
  `post_emf_note` varchar(50) NOT NULL,
  `addr_en` varchar(254) NOT NULL,
  `lovecall_logs` text NOT NULL,
  `agentpro_id` varchar(12) NOT NULL,
  `hidden_time` datetime NOT NULL,
  `delete_time` datetime NOT NULL,
  PRIMARY KEY (`womanid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_info_demo`
-- ----------------------------
DROP TABLE IF EXISTS `woman_info_demo`;
CREATE TABLE `woman_info_demo` (
  `womanid` varchar(20) NOT NULL DEFAULT '',
  `video_desc` text NOT NULL,
  `video_reason` text NOT NULL,
  `video_server` tinyint(1) NOT NULL DEFAULT '0',
  `agentid` varchar(6) NOT NULL,
  `jj_cn` text NOT NULL,
  `addr_cn` varchar(500) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `homephone_cc` varchar(4) NOT NULL,
  `homephone_ac` varchar(4) NOT NULL,
  `homephone` varchar(50) NOT NULL,
  `offphone_cc` varchar(4) NOT NULL,
  `offphone_ac` varchar(4) NOT NULL,
  `offphone_ext` varchar(4) NOT NULL,
  `offphone` varchar(50) NOT NULL,
  `callphone_cc` varchar(4) NOT NULL,
  `callphone_ac` varchar(4) NOT NULL,
  `callphone` varchar(50) NOT NULL,
  `home_addr` varchar(254) NOT NULL,
  `home_postcode` varchar(10) NOT NULL,
  `agent_comm` varchar(255) NOT NULL,
  `post_emf_note` varchar(50) NOT NULL,
  `addr_en` varchar(254) NOT NULL,
  `lovecall_logs` text NOT NULL,
  PRIMARY KEY (`womanid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_lovecall`
-- ----------------------------
DROP TABLE IF EXISTS `woman_lovecall`;
CREATE TABLE `woman_lovecall` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `womanid` varchar(12) NOT NULL,
  `agentid` varchar(6) NOT NULL,
  `valid_gmt1` int(6) NOT NULL DEFAULT '0',
  `valid_gmt2` int(6) NOT NULL DEFAULT '0',
  `valid_gmt3` int(6) NOT NULL DEFAULT '0',
  `valid_gmt4` int(6) NOT NULL DEFAULT '0',
  `timezone` int(3) unsigned NOT NULL DEFAULT '0',
  `repeat_mode` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `specific_gmt1` int(10) unsigned NOT NULL DEFAULT '0',
  `specific_gmt2` int(10) unsigned NOT NULL DEFAULT '0',
  `lovecall_2way` tinyint(1) NOT NULL DEFAULT '0',
  `lady_no` varchar(30) NOT NULL,
  `trans_no` varchar(30) NOT NULL,
  `logtxt` text NOT NULL,
  `tmp_gmt` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`,`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_multiple_search`
-- ----------------------------
DROP TABLE IF EXISTS `woman_multiple_search`;
CREATE TABLE `woman_multiple_search` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `searchtype` tinyint(1) NOT NULL,
  `manid` varchar(12) NOT NULL,
  `searchcondition` text,
  `searchsql` varchar(50) DEFAULT NULL,
  `uptime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_other`
-- ----------------------------
DROP TABLE IF EXISTS `woman_other`;
CREATE TABLE `woman_other` (
  `womanid` varchar(12) NOT NULL,
  `qa_staff` varchar(50) NOT NULL,
  `qa_date` datetime NOT NULL,
  `qa_note` varchar(500) NOT NULL,
  `logstxt` text NOT NULL,
  KEY `womanid` (`womanid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_overview`
-- ----------------------------
DROP TABLE IF EXISTS `woman_overview`;
CREATE TABLE `woman_overview` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `womanid` varchar(12) NOT NULL,
  `agentid` varchar(8) NOT NULL,
  `rmd_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`,`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_photo_20190218`
-- ----------------------------
DROP TABLE IF EXISTS `woman_photo_20190218`;
CREATE TABLE `woman_photo_20190218` (
  `id` int(6) NOT NULL DEFAULT '0',
  `womanid` varchar(20) NOT NULL DEFAULT '',
  `owner` varchar(12) NOT NULL DEFAULT '',
  `firstname` varchar(50) DEFAULT NULL,
  `photo_num` int(1) NOT NULL DEFAULT '0',
  `photo_list` text NOT NULL,
  `siteid` int(1) NOT NULL DEFAULT '0',
  `diff_info` varchar(50) NOT NULL DEFAULT '',
  `diff_num` int(1) NOT NULL DEFAULT '0',
  `local_diff_list` text NOT NULL,
  `local_diff_num` int(5) NOT NULL,
  `old_photo_num` int(11) NOT NULL,
  `old_photo_list` text NOT NULL,
  `last_update` datetime NOT NULL,
  `status1` tinyint(4) NOT NULL,
  `postdate` datetime NOT NULL,
  `diff_info2` varchar(50) NOT NULL DEFAULT '',
  `diff_num2` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`womanid`),
  KEY `id` (`id`),
  KEY `owner` (`owner`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_photo_20190218_bak`
-- ----------------------------
DROP TABLE IF EXISTS `woman_photo_20190218_bak`;
CREATE TABLE `woman_photo_20190218_bak` (
  `id` int(6) NOT NULL DEFAULT '0',
  `womanid` varchar(20) NOT NULL DEFAULT '',
  `owner` varchar(12) NOT NULL DEFAULT '',
  `firstname` varchar(50) DEFAULT NULL,
  `photo_num` int(1) NOT NULL DEFAULT '0',
  `photo_list` text NOT NULL,
  `siteid` int(1) NOT NULL DEFAULT '0',
  `diff_info` varchar(50) NOT NULL DEFAULT '',
  `diff_num` int(1) NOT NULL DEFAULT '0',
  `local_diff_list` text NOT NULL,
  `local_diff_num` int(5) NOT NULL,
  `old_photo_num` int(11) NOT NULL,
  `old_photo_list` text NOT NULL,
  `last_update` datetime NOT NULL,
  `status1` tinyint(4) NOT NULL,
  `postdate` datetime NOT NULL,
  `diff_info2` varchar(50) NOT NULL DEFAULT '',
  `diff_num2` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`womanid`),
  KEY `id` (`id`),
  KEY `owner` (`owner`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_priv`
-- ----------------------------
DROP TABLE IF EXISTS `woman_priv`;
CREATE TABLE `woman_priv` (
  `womanid` varchar(12) NOT NULL,
  `agentid` varchar(5) NOT NULL,
  `passwd` varchar(20) NOT NULL,
  `passwd_lady` varchar(30) NOT NULL,
  `allowlogin` tinyint(1) NOT NULL DEFAULT '1',
  `allowlogin2` tinyint(1) NOT NULL DEFAULT '1',
  `livechat` tinyint(1) NOT NULL DEFAULT '1',
  `livechat2` tinyint(1) NOT NULL DEFAULT '1',
  `camshare` tinyint(1) NOT NULL DEFAULT '1',
  `camshare2` tinyint(1) NOT NULL DEFAULT '1',
  `admirer` tinyint(1) NOT NULL DEFAULT '1',
  `admirer2` tinyint(1) NOT NULL DEFAULT '1',
  `admire_assistant_send` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `admire_assistant_send2` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `videochat` tinyint(1) NOT NULL DEFAULT '1',
  `videochat2` tinyint(1) NOT NULL DEFAULT '1',
  `searchman` tinyint(1) NOT NULL DEFAULT '1',
  `searchman2` tinyint(1) NOT NULL DEFAULT '1',
  `livechat_trans` tinyint(1) NOT NULL DEFAULT '0',
  `wm_reply_max` int(1) unsigned NOT NULL,
  `lovecall_authcall` char(2) NOT NULL DEFAULT 'YY',
  `virtual_gifts` tinyint(1) NOT NULL DEFAULT '1',
  `livechat_autochat1` tinyint(1) NOT NULL DEFAULT '0',
  `livechat_autochat2` tinyint(1) NOT NULL DEFAULT '0',
  `livechat_invite_autoflag1` tinyint(1) NOT NULL DEFAULT '1',
  `livechat_invite_autoflag2` tinyint(1) NOT NULL DEFAULT '1',
  `livechat_invite_autoflagcam` tinyint(1) NOT NULL DEFAULT '0',
  `livechat_sendinvite` tinyint(1) NOT NULL DEFAULT '1',
  `lady_reply_emf` tinyint(1) NOT NULL DEFAULT '1',
  `first_emf` tinyint(1) NOT NULL DEFAULT '1',
  `lady_reply_emf_agent` tinyint(1) NOT NULL DEFAULT '1',
  `lady_show_emf_mode` tinyint(1) NOT NULL DEFAULT '2',
  `lady_emf_ischeck` tinyint(1) NOT NULL DEFAULT '1',
  `lady_only_local_login` char(1) NOT NULL DEFAULT 'N',
  `mail_album_upload` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `daily_emf_reply_max1` int(1) NOT NULL DEFAULT '500',
  `daily_emf_reply_max2` int(1) NOT NULL DEFAULT '300',
  `emf_reply_time` int(1) unsigned NOT NULL DEFAULT '300',
  `emf_reply_woman_time` int(1) unsigned NOT NULL DEFAULT '0',
  `cupid_lady_priv` tinyint(1) NOT NULL DEFAULT '1',
  `cupid_lady_priv2` tinyint(1) NOT NULL DEFAULT '1',
  `cupid_reply_max` int(3) NOT NULL DEFAULT '20',
  `cupid_reply_freq1` int(3) NOT NULL,
  `cupid_reply_freq2` int(3) NOT NULL,
  `cupid_lady_ischeck` tinyint(1) NOT NULL,
  PRIMARY KEY (`womanid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_priv_demo`
-- ----------------------------
DROP TABLE IF EXISTS `woman_priv_demo`;
CREATE TABLE `woman_priv_demo` (
  `womanid` varchar(12) NOT NULL,
  `agentid` varchar(5) NOT NULL,
  `passwd` varchar(20) NOT NULL,
  `passwd_lady` varchar(30) NOT NULL,
  `allowlogin` tinyint(1) NOT NULL DEFAULT '1',
  `allowlogin2` tinyint(1) NOT NULL DEFAULT '1',
  `livechat` tinyint(1) NOT NULL DEFAULT '1',
  `livechat2` tinyint(1) NOT NULL DEFAULT '1',
  `admirer` tinyint(1) NOT NULL DEFAULT '1',
  `admirer2` tinyint(1) NOT NULL DEFAULT '1',
  `videochat` tinyint(1) NOT NULL DEFAULT '1',
  `videochat2` tinyint(1) NOT NULL DEFAULT '1',
  `searchman` tinyint(1) NOT NULL DEFAULT '1',
  `searchman2` tinyint(1) NOT NULL DEFAULT '1',
  `livechat_trans` tinyint(1) NOT NULL DEFAULT '0',
  `wm_reply_max` int(1) unsigned NOT NULL,
  PRIMARY KEY (`womanid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_problem`
-- ----------------------------
DROP TABLE IF EXISTS `woman_problem`;
CREATE TABLE `woman_problem` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `womanid` varchar(20) NOT NULL,
  `agentid` varchar(10) NOT NULL DEFAULT '',
  `womanname` varchar(30) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL,
  `assistid` varchar(12) NOT NULL,
  `enddate` datetime NOT NULL,
  `agt_staff_id` varchar(12) NOT NULL,
  `agt_staff` varchar(30) NOT NULL DEFAULT '',
  `chn_staff_id` varchar(20) NOT NULL,
  `chn_staff` varchar(30) NOT NULL DEFAULT '',
  `subject` varchar(300) NOT NULL DEFAULT '',
  `adddate` datetime NOT NULL,
  `ip` varchar(15) NOT NULL DEFAULT '',
  `comment` varchar(500) NOT NULL,
  `cstopic` varchar(20) NOT NULL,
  `detail` text NOT NULL,
  `replystatus` char(1) NOT NULL DEFAULT 'N',
  `lastreply` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=610 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_profileid`
-- ----------------------------
DROP TABLE IF EXISTS `woman_profileid`;
CREATE TABLE `woman_profileid` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `womanid` varchar(12) NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `womanid` (`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=16220 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_promotion`
-- ----------------------------
DROP TABLE IF EXISTS `woman_promotion`;
CREATE TABLE `woman_promotion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `womanid` varchar(12) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `sortid` int(2) NOT NULL DEFAULT '0',
  `recommend` char(1) NOT NULL DEFAULT 'N',
  `status` int(1) NOT NULL DEFAULT '0',
  `adddate` datetime NOT NULL,
  `reviewed_time` datetime NOT NULL,
  `reviewed_staff` varchar(50) NOT NULL,
  `reviewd_groupid` tinyint(1) NOT NULL DEFAULT '0',
  `contents` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`,`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_search_request`
-- ----------------------------
DROP TABLE IF EXISTS `woman_search_request`;
CREATE TABLE `woman_search_request` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `md5` varchar(32) NOT NULL,
  `sql` varchar(1024) NOT NULL,
  `adddate` datetime NOT NULL,
  `total` int(8) NOT NULL,
  `times` int(8) NOT NULL,
  `lastupdate` datetime NOT NULL,
  `dbname` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `md5` (`md5`)
) ENGINE=MyISAM AUTO_INCREMENT=1013 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_sms_verify`
-- ----------------------------
DROP TABLE IF EXISTS `woman_sms_verify`;
CREATE TABLE `woman_sms_verify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `womanid` varchar(20) NOT NULL,
  `agentid` varchar(10) NOT NULL DEFAULT '',
  `cnname` varchar(30) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL,
  `adddate` datetime NOT NULL,
  `vcode` varchar(15) NOT NULL,
  `vdate` datetime NOT NULL,
  `vtype` tinyint(1) NOT NULL DEFAULT '0',
  `chn_info` varchar(300) NOT NULL,
  `agt_info` varchar(600) NOT NULL,
  `mobile_tel` varchar(15) NOT NULL,
  `smsid` int(11) NOT NULL,
  `sentdate` datetime NOT NULL,
  `senttimes` tinyint(1) NOT NULL DEFAULT '0',
  `mobile_tel_old` varchar(50) NOT NULL,
  `sms_verify_old` tinyint(1) NOT NULL DEFAULT '0',
  `womanupdate_id` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=16321 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_stats_daily`
-- ----------------------------
DROP TABLE IF EXISTS `woman_stats_daily`;
CREATE TABLE `woman_stats_daily` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `agentid` varchar(10) NOT NULL,
  `womanid` varchar(15) NOT NULL,
  `birthday` date NOT NULL,
  `postdate` datetime NOT NULL,
  `verify_video_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `stats_date` date NOT NULL DEFAULT '0000-00-00',
  `stats_mw` int(8) NOT NULL DEFAULT '0',
  `stats_wm` int(8) NOT NULL DEFAULT '0',
  `stats_add` int(8) NOT NULL DEFAULT '0',
  `stats_lc` decimal(9,2) NOT NULL DEFAULT '0.00',
  `stats_camshare` decimal(9,2) NOT NULL DEFAULT '0.00',
  `stats_video` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_gift_flowers` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_virtual_gifts` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_cupiddate` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_ot` int(8) NOT NULL DEFAULT '0',
  `stats_ot2` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_call1` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_call2` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_call3` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_call4` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `credit_deduct` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `credit_gain` decimal(9,2) unsigned NOT NULL DEFAULT '0.00',
  `admire_num` int(5) NOT NULL DEFAULT '0',
  `bp_num` int(5) NOT NULL DEFAULT '0',
  `cupid_num` int(5) NOT NULL DEFAULT '0',
  `chat_invite_total_num` int(5) NOT NULL DEFAULT '0',
  `chat_invite_lady_num` int(5) NOT NULL DEFAULT '0',
  `emf_private_mw` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `emf_private_wm` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `lc_private_mw` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `lc_private_wm` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `emf_private_mw_num` int(5) NOT NULL DEFAULT '0',
  `emf_private_wm_num` int(5) NOT NULL DEFAULT '0',
  `lc_private_mw_num` int(5) NOT NULL DEFAULT '0',
  `lc_private_wm_num` int(5) NOT NULL DEFAULT '0',
  `emf_reply_num` int(5) unsigned NOT NULL DEFAULT '0',
  `chat_gain_num` int(5) unsigned NOT NULL DEFAULT '0',
  `lc_video_mw` decimal(8,2) unsigned NOT NULL,
  `lc_video_wm` decimal(8,2) unsigned NOT NULL,
  `emf_video_mw` decimal(8,2) unsigned NOT NULL,
  `emf_video_wm` decimal(8,2) unsigned NOT NULL,
  `lc_video_mw_num` int(5) unsigned NOT NULL,
  `lc_video_wm_num` int(5) unsigned NOT NULL,
  `emf_video_mw_num` int(5) unsigned NOT NULL,
  `emf_video_wm_num` int(5) unsigned NOT NULL,
  `cupid_receive` int(5) unsigned DEFAULT '0',
  `cupid_free_reply` int(5) unsigned DEFAULT '0',
  `cupid_pay_reply` int(5) unsigned DEFAULT '0',
  `cupid_paid_read` int(5) unsigned DEFAULT '0',
  `cupid_consumed` int(5) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`),
  KEY `stats_month` (`stats_date`,`agentid`,`womanid`),
  KEY `agentid` (`agentid`)
) ENGINE=MRG_MyISAM DEFAULT CHARSET=utf8 INSERT_METHOD=LAST UNION=(`woman_stats_daily_2014q3`,`woman_stats_daily_2014q4`);

-- ----------------------------
--  Table structure for `woman_stats_daily_2014q3`
-- ----------------------------
DROP TABLE IF EXISTS `woman_stats_daily_2014q3`;
CREATE TABLE `woman_stats_daily_2014q3` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `agentid` varchar(10) NOT NULL,
  `womanid` varchar(15) NOT NULL,
  `birthday` date NOT NULL,
  `postdate` datetime NOT NULL,
  `verify_video_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `stats_date` date NOT NULL DEFAULT '0000-00-00',
  `stats_mw` int(8) NOT NULL DEFAULT '0',
  `stats_wm` int(8) NOT NULL DEFAULT '0',
  `stats_add` int(8) NOT NULL DEFAULT '0',
  `stats_lc` decimal(9,2) NOT NULL DEFAULT '0.00',
  `stats_camshare` decimal(9,2) NOT NULL DEFAULT '0.00',
  `stats_video` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_gift_flowers` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_virtual_gifts` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_cupiddate` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_ot` int(8) NOT NULL DEFAULT '0',
  `stats_ot2` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_call1` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_call2` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_call3` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_call4` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `credit_deduct` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `credit_gain` decimal(9,2) unsigned NOT NULL DEFAULT '0.00',
  `admire_num` int(5) NOT NULL DEFAULT '0',
  `bp_num` int(5) NOT NULL DEFAULT '0',
  `cupid_num` int(5) NOT NULL DEFAULT '0',
  `chat_invite_total_num` int(5) NOT NULL DEFAULT '0',
  `chat_invite_lady_num` int(5) NOT NULL DEFAULT '0',
  `emf_private_mw` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `emf_private_wm` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `lc_private_mw` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `lc_private_wm` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `emf_private_mw_num` int(5) NOT NULL DEFAULT '0',
  `emf_private_wm_num` int(5) NOT NULL DEFAULT '0',
  `lc_private_mw_num` int(5) NOT NULL DEFAULT '0',
  `lc_private_wm_num` int(5) NOT NULL DEFAULT '0',
  `emf_reply_num` int(5) unsigned NOT NULL DEFAULT '0',
  `chat_gain_num` int(5) unsigned NOT NULL DEFAULT '0',
  `lc_video_mw` decimal(8,2) unsigned NOT NULL,
  `lc_video_wm` decimal(8,2) unsigned NOT NULL,
  `emf_video_mw` decimal(8,2) unsigned NOT NULL,
  `emf_video_wm` decimal(8,2) unsigned NOT NULL,
  `lc_video_mw_num` int(5) unsigned NOT NULL,
  `lc_video_wm_num` int(5) unsigned NOT NULL,
  `emf_video_mw_num` int(5) unsigned NOT NULL,
  `emf_video_wm_num` int(5) unsigned NOT NULL,
  `cupid_receive` int(5) unsigned DEFAULT '0',
  `cupid_free_reply` int(5) unsigned DEFAULT '0',
  `cupid_pay_reply` int(5) unsigned DEFAULT '0',
  `cupid_paid_read` int(5) unsigned DEFAULT '0',
  `cupid_consumed` int(5) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`),
  KEY `stats_month` (`stats_date`,`agentid`,`womanid`),
  KEY `agentid` (`agentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_stats_daily_2014q4`
-- ----------------------------
DROP TABLE IF EXISTS `woman_stats_daily_2014q4`;
CREATE TABLE `woman_stats_daily_2014q4` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `agentid` varchar(10) NOT NULL,
  `womanid` varchar(15) NOT NULL,
  `birthday` date NOT NULL,
  `postdate` datetime NOT NULL,
  `verify_video_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `stats_date` date NOT NULL DEFAULT '0000-00-00',
  `stats_mw` int(8) NOT NULL DEFAULT '0',
  `stats_wm` int(8) NOT NULL DEFAULT '0',
  `stats_add` int(8) NOT NULL DEFAULT '0',
  `stats_lc` decimal(9,2) NOT NULL DEFAULT '0.00',
  `stats_camshare` decimal(9,2) NOT NULL DEFAULT '0.00',
  `stats_video` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_gift_flowers` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_virtual_gifts` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_cupiddate` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_ot` int(8) NOT NULL DEFAULT '0',
  `stats_ot2` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_call1` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_call2` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_call3` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_call4` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `credit_deduct` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `credit_gain` decimal(9,2) unsigned NOT NULL DEFAULT '0.00',
  `admire_num` int(5) NOT NULL DEFAULT '0',
  `bp_num` int(5) NOT NULL DEFAULT '0',
  `cupid_num` int(5) NOT NULL DEFAULT '0',
  `chat_invite_total_num` int(5) NOT NULL DEFAULT '0',
  `chat_invite_lady_num` int(5) NOT NULL DEFAULT '0',
  `emf_private_mw` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `emf_private_wm` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `lc_private_mw` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `lc_private_wm` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `emf_private_mw_num` int(5) NOT NULL DEFAULT '0',
  `emf_private_wm_num` int(5) NOT NULL DEFAULT '0',
  `lc_private_mw_num` int(5) NOT NULL DEFAULT '0',
  `lc_private_wm_num` int(5) NOT NULL DEFAULT '0',
  `emf_reply_num` int(5) unsigned NOT NULL DEFAULT '0',
  `chat_gain_num` int(5) unsigned NOT NULL DEFAULT '0',
  `lc_video_mw` decimal(8,2) unsigned NOT NULL,
  `lc_video_wm` decimal(8,2) unsigned NOT NULL,
  `emf_video_mw` decimal(8,2) unsigned NOT NULL,
  `emf_video_wm` decimal(8,2) unsigned NOT NULL,
  `lc_video_mw_num` int(5) unsigned NOT NULL,
  `lc_video_wm_num` int(5) unsigned NOT NULL,
  `emf_video_mw_num` int(5) unsigned NOT NULL,
  `emf_video_wm_num` int(5) unsigned NOT NULL,
  `cupid_receive` int(5) unsigned DEFAULT '0',
  `cupid_free_reply` int(5) unsigned DEFAULT '0',
  `cupid_pay_reply` int(5) unsigned DEFAULT '0',
  `cupid_paid_read` int(5) unsigned DEFAULT '0',
  `cupid_consumed` int(5) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`),
  KEY `stats_month` (`stats_date`,`agentid`,`womanid`),
  KEY `agentid` (`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_tags_history`
-- ----------------------------
DROP TABLE IF EXISTS `woman_tags_history`;
CREATE TABLE `woman_tags_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `manid` varchar(15) NOT NULL,
  `womanid` varchar(15) NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `tagid` tinyint(2) unsigned NOT NULL,
  `adddate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid_womanid_tagid` (`manid`,`womanid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_tags_total`
-- ----------------------------
DROP TABLE IF EXISTS `woman_tags_total`;
CREATE TABLE `woman_tags_total` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tagid` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `womanid` varchar(15) NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `num` int(8) unsigned NOT NULL DEFAULT '0',
  `adddate` datetime NOT NULL,
  `editdate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tagid_womanid` (`tagid`,`womanid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_tmp`
-- ----------------------------
DROP TABLE IF EXISTS `woman_tmp`;
CREATE TABLE `woman_tmp` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `womanid` varchar(12) NOT NULL DEFAULT '',
  `owner` varchar(6) NOT NULL DEFAULT '',
  `submitdate` date NOT NULL DEFAULT '0000-00-00',
  `postdate` datetime DEFAULT NULL,
  `status1` char(1) DEFAULT '1',
  `status2` char(1) DEFAULT '1',
  `firstname` varchar(20) DEFAULT NULL,
  `lastname` varchar(20) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `province` varchar(50) NOT NULL DEFAULT '',
  `submit_by` varchar(40) NOT NULL DEFAULT '',
  `city` varchar(50) NOT NULL DEFAULT '',
  `birthday` date DEFAULT NULL,
  `height` int(3) DEFAULT NULL,
  `weight` int(3) DEFAULT NULL,
  `smoke` tinyint(1) DEFAULT NULL,
  `drink` tinyint(1) DEFAULT NULL,
  `english` tinyint(1) DEFAULT NULL,
  `religion` tinyint(1) DEFAULT NULL,
  `children` char(1) DEFAULT NULL,
  `education` tinyint(1) DEFAULT NULL,
  `profession` tinyint(1) DEFAULT NULL,
  `marry` tinyint(1) DEFAULT NULL,
  `remark` text,
  `jj_en` text,
  `email` varchar(100) DEFAULT NULL,
  `emailforward` tinyint(1) DEFAULT NULL,
  `postaddr` tinyint(1) NOT NULL DEFAULT '1',
  `lovecall` tinyint(1) DEFAULT NULL,
  `cnname` varchar(255) DEFAULT NULL,
  `idcard` varchar(20) DEFAULT NULL,
  `cool` char(1) NOT NULL DEFAULT '0',
  `deleted` char(1) NOT NULL DEFAULT '0',
  `publish_home_tel` char(1) NOT NULL DEFAULT 'Y',
  `publish_office_tel` char(1) NOT NULL DEFAULT 'Y',
  `publish_mobile_tel` char(1) NOT NULL DEFAULT 'Y',
  `publish_email` char(1) NOT NULL DEFAULT 'Y',
  `apptable` char(1) NOT NULL DEFAULT 'N',
  `auditflag` char(1) NOT NULL DEFAULT '0',
  `photo_flag` char(1) NOT NULL DEFAULT 'N',
  `idcard_flag` char(1) NOT NULL DEFAULT 'N',
  `black` char(1) NOT NULL DEFAULT 'N',
  `comment` text NOT NULL,
  `hidden_reason` text NOT NULL,
  `chn_remark` text NOT NULL,
  `last_update` datetime DEFAULT NULL,
  `video_flag` tinyint(1) NOT NULL DEFAULT '0',
  `cupid_flag` char(1) NOT NULL DEFAULT 'Y',
  `man_age1` year(4) NOT NULL,
  `man_age2` year(4) NOT NULL,
  `follower` varchar(30) NOT NULL DEFAULT '',
  `follower_staffid` varchar(10) NOT NULL,
  `zodiac` tinyint(1) NOT NULL DEFAULT '0',
  `problem` tinyint(1) NOT NULL DEFAULT '0',
  `smsflag` tinyint(1) NOT NULL DEFAULT '1',
  `sms_verify` tinyint(1) NOT NULL DEFAULT '0',
  `template` tinyint(10) NOT NULL DEFAULT '0',
  `keyword` varchar(30) NOT NULL,
  `keyword_d` varchar(30) NOT NULL,
  `lastlogin` datetime NOT NULL,
  `loginnum` int(6) NOT NULL,
  `callphone_cc` varchar(4) NOT NULL,
  `callphone` varchar(50) NOT NULL,
  `ip` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`),
  KEY `submitdate` (`submitdate`),
  KEY `postdate` (`postdate`),
  KEY `owner` (`owner`),
  KEY `status1` (`status1`,`deleted`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_update`
-- ----------------------------
DROP TABLE IF EXISTS `woman_update`;
CREATE TABLE `woman_update` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `flag` char(1) NOT NULL DEFAULT '',
  `agentid` varchar(10) NOT NULL DEFAULT '',
  `womanid` varchar(20) NOT NULL DEFAULT '',
  `submit_date` datetime DEFAULT NULL,
  `agent_request` text NOT NULL,
  `agent_staff` varchar(40) NOT NULL DEFAULT '',
  `chn_staff` varchar(40) NOT NULL DEFAULT '',
  `status` char(1) NOT NULL DEFAULT '',
  `chn_notes` text NOT NULL,
  `result` text NOT NULL,
  `ip` varchar(15) NOT NULL DEFAULT '',
  `process_date` datetime DEFAULT NULL,
  `telephone` varchar(50) DEFAULT NULL,
  `video_name` varchar(50) NOT NULL,
  `video_md5` varchar(50) NOT NULL,
  `video_img_md5` varchar(50) NOT NULL,
  `video_time` time NOT NULL,
  `video_no` tinyint(1) unsigned NOT NULL,
  `video_key` varchar(50) NOT NULL,
  `video_file_status` tinyint(1) NOT NULL DEFAULT '0',
  `show_status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`),
  KEY `video_no` (`video_no`,`video_file_status`,`show_status`)
) ENGINE=MyISAM AUTO_INCREMENT=197908 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_value_history`
-- ----------------------------
DROP TABLE IF EXISTS `woman_value_history`;
CREATE TABLE `woman_value_history` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `womanid` varchar(12) NOT NULL,
  `agentid` varchar(6) NOT NULL,
  `womanname` varchar(30) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `val` int(3) NOT NULL,
  `balance` int(4) NOT NULL DEFAULT '0',
  `note` varchar(300) NOT NULL,
  `addtime` datetime NOT NULL,
  `addby` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`,`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_verify_video`
-- ----------------------------
DROP TABLE IF EXISTS `woman_verify_video`;
CREATE TABLE `woman_verify_video` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `womanid` varchar(15) NOT NULL,
  `realname` varchar(50) NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `verify_video_filename` varchar(50) NOT NULL,
  `verify_video_filesize` decimal(5,2) NOT NULL,
  `verify_video_status` tinyint(1) NOT NULL DEFAULT '1',
  `verify_video_reason` varchar(255) NOT NULL DEFAULT '',
  `submitdate` datetime DEFAULT NULL,
  `verifytime` datetime DEFAULT NULL,
  `verifier` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`,`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_video1`
-- ----------------------------
DROP TABLE IF EXISTS `woman_video1`;
CREATE TABLE `woman_video1` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `videoid` varchar(12) NOT NULL,
  `videoname` varchar(50) NOT NULL,
  `videosortid` int(10) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `womanname` varchar(40) NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `submittime` int(10) unsigned NOT NULL,
  `postedtime` int(10) unsigned NOT NULL,
  `actiontime` int(10) unsigned NOT NULL,
  `statusflag` tinyint(1) unsigned NOT NULL,
  `hotflag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hotorder` int(4) unsigned NOT NULL,
  `thumb_file` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `original_video` varchar(50) NOT NULL,
  `original_filesize` decimal(5,2) NOT NULL DEFAULT '0.00',
  `processed_video` varchar(50) NOT NULL,
  `processed_filesize` decimal(5,2) unsigned NOT NULL,
  `videotimes` int(3) unsigned NOT NULL DEFAULT '0',
  `credit_paid` decimal(6,2) unsigned NOT NULL DEFAULT '0.00',
  `credit_deducte` decimal(6,2) unsigned NOT NULL DEFAULT '0.00',
  `credit_lastupdate` datetime NOT NULL,
  `edit_status` tinyint(1) NOT NULL DEFAULT '1',
  `sign` char(1) NOT NULL DEFAULT 'N',
  `is_reward` char(1) NOT NULL DEFAULT 'N',
  `view_stats` int(10) NOT NULL,
  `reward_status` char(1) NOT NULL,
  `reward_deducte` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `videoid` (`videoid`),
  KEY `postedtime` (`postedtime`),
  KEY `statusflag` (`statusflag`),
  KEY `agentid` (`agentid`),
  KEY `womanid` (`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_video2`
-- ----------------------------
DROP TABLE IF EXISTS `woman_video2`;
CREATE TABLE `woman_video2` (
  `videoid` varchar(12) NOT NULL,
  `description` text NOT NULL,
  `transcription` text NOT NULL,
  `audit_note` text NOT NULL,
  `remark_esh` text NOT NULL,
  `logtxt` text NOT NULL,
  UNIQUE KEY `videoid` (`videoid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_video_favorite`
-- ----------------------------
DROP TABLE IF EXISTS `woman_video_favorite`;
CREATE TABLE `woman_video_favorite` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `manid` varchar(15) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `videoid` varchar(12) NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`),
  KEY `addtime` (`addtime`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_video_history`
-- ----------------------------
DROP TABLE IF EXISTS `woman_video_history`;
CREATE TABLE `woman_video_history` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `manid` varchar(20) NOT NULL,
  `manname` varchar(40) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `womanname` varchar(40) NOT NULL,
  `historyid` varchar(10) NOT NULL,
  `videoid` varchar(12) NOT NULL,
  `viewtime` int(10) unsigned NOT NULL,
  `freeflag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`),
  KEY `womanid` (`womanid`),
  KEY `viewtime` (`viewtime`)
) ENGINE=MyISAM AUTO_INCREMENT=160 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_video_sort`
-- ----------------------------
DROP TABLE IF EXISTS `woman_video_sort`;
CREATE TABLE `woman_video_sort` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sname` varchar(100) NOT NULL,
  `zh_sname` varchar(50) NOT NULL,
  `adddate` int(10) unsigned NOT NULL,
  `lastupdate` datetime NOT NULL,
  `opt_staffid` varchar(10) NOT NULL,
  `opt_staffname` varchar(20) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'N',
  `paixu` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `woman_week`
-- ----------------------------
DROP TABLE IF EXISTS `woman_week`;
CREATE TABLE `woman_week` (
  `id` int(6) unsigned NOT NULL,
  `womanid` varchar(15) NOT NULL DEFAULT '',
  `birthday` date NOT NULL,
  `weight` tinyint(1) unsigned NOT NULL,
  `height` tinyint(2) unsigned NOT NULL,
  `marry` tinyint(1) NOT NULL DEFAULT '0',
  `country` varchar(10) NOT NULL,
  `postdate` datetime NOT NULL,
  `owner` varchar(6) NOT NULL,
  `province` varchar(50) NOT NULL,
  `video_flag` tinyint(1) unsigned NOT NULL,
  `lastname` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
