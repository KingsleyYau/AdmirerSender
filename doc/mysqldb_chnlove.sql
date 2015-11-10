/*
SQLyog Ultimate v11.42 (32 bit)
MySQL - 5.5.17-log : Database - mysqldb_chnlove
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mysqldb_chnlove` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `mysqldb_chnlove`;

/*Table structure for table `account` */

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
  `stats_call1` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_call2` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_call3` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_call4` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_video` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_gift_flowers` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_virtual_gifts` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_cupiddate` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_profile_post` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_video_post` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `deduct_profile_post` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `deduct_video_post` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_punish` decimal(9,2) NOT NULL,
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
  `check_address` varchar(400) NOT NULL,
  `check_zipcode` varchar(100) NOT NULL DEFAULT '',
  `check_no` varchar(200) NOT NULL DEFAULT '',
  `check_date` date NOT NULL DEFAULT '0000-00-00',
  `check_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `check_currency` varchar(20) NOT NULL DEFAULT '',
  `check_status` char(2) NOT NULL DEFAULT 'N',
  `trans_wm` int(6) NOT NULL DEFAULT '0',
  `trans_mw` int(6) NOT NULL DEFAULT '0',
  `exchange_rate` float(10,4) NOT NULL DEFAULT '0.0000',
  `company` varchar(400) NOT NULL,
  `bank_account` varchar(25) NOT NULL,
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
  KEY `authorid` (`authorid`,`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

/*Table structure for table `account_20130406` */

DROP TABLE IF EXISTS `account_20130406`;

CREATE TABLE `account_20130406` (
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
  `stats_ot2` int(8) NOT NULL DEFAULT '0',
  `stats_lc` decimal(9,2) NOT NULL,
  `stats_call1` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_call2` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_call3` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_video` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_gift_flowers` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `stats_cupiddate` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `countmoney` decimal(8,2) DEFAULT '0.00',
  `stats_pay` decimal(8,2) DEFAULT '0.00',
  `infact_pay` decimal(8,2) DEFAULT '0.00',
  `flag_pay` char(1) DEFAULT '0',
  `pay_num` varchar(250) NOT NULL,
  `comm` text NOT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `credits` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `money_type` varchar(50) NOT NULL DEFAULT 'RMB',
  `systime` datetime NOT NULL,
  `check_payee` varchar(200) NOT NULL DEFAULT '',
  `check_address` varchar(400) NOT NULL,
  `check_zipcode` varchar(100) NOT NULL DEFAULT '',
  `check_no` varchar(200) NOT NULL DEFAULT '',
  `check_date` date NOT NULL DEFAULT '0000-00-00',
  `check_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `check_currency` varchar(20) NOT NULL DEFAULT '',
  `check_status` char(2) NOT NULL DEFAULT 'N',
  `trans_wm` int(6) NOT NULL DEFAULT '0',
  `trans_mw` int(6) NOT NULL DEFAULT '0',
  `exchange_rate` float(10,4) NOT NULL DEFAULT '0.0000',
  `company` varchar(400) NOT NULL,
  `bank_account` varchar(25) NOT NULL,
  `rate_date` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=2118 DEFAULT CHARSET=utf8;

/*Table structure for table `account_beneficiary` */

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
  `bank_address` varchar(300) NOT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Table structure for table `account_payment` */

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
  `bank_address` varchar(300) NOT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

/*Table structure for table `account_stats` */

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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Table structure for table `account_stats_by_lady` */

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
) ENGINE=MyISAM AUTO_INCREMENT=142 DEFAULT CHARSET=utf8;

/*Table structure for table `acl_department` */

DROP TABLE IF EXISTS `acl_department`;

CREATE TABLE `acl_department` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `level` char(1) NOT NULL,
  `classify` int(11) unsigned NOT NULL DEFAULT '0',
  `department_id` varchar(20) NOT NULL,
  `department_name` varchar(100) NOT NULL,
  `department_head` varchar(100) NOT NULL,
  `department_target` text NOT NULL,
  `department_duty` text NOT NULL,
  `department_member` text NOT NULL,
  `job_num` int(1) unsigned NOT NULL,
  `job_id_all` varchar(200) NOT NULL,
  `status` char(1) NOT NULL DEFAULT '1',
  `sort` decimal(5,1) NOT NULL DEFAULT '1.0',
  `add_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `division_staff` varchar(30) NOT NULL,
  `division_name` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `level` (`level`,`classify`,`status`),
  KEY `department_id` (`department_id`,`end_time`,`division_staff`)
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

/*Table structure for table `acl_esl_login` */

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
) ENGINE=MyISAM AUTO_INCREMENT=25732 DEFAULT CHARSET=utf8;

/*Table structure for table `acl_esl_pc` */

DROP TABLE IF EXISTS `acl_esl_pc`;

CREATE TABLE `acl_esl_pc` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `cpu_id` varchar(120) NOT NULL DEFAULT '',
  `disk_id` varchar(50) NOT NULL DEFAULT '',
  `computer_id` varchar(20) NOT NULL DEFAULT '',
  `location1` varchar(100) NOT NULL,
  `location2` varchar(100) NOT NULL,
  `auth` enum('Y','N','P','D') NOT NULL DEFAULT 'Y',
  `allow_login_ip` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `allow_login_country` varchar(300) DEFAULT NULL,
  `comment` text NOT NULL,
  `staff` varchar(40) NOT NULL DEFAULT '',
  `last_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `login_num` int(6) NOT NULL DEFAULT '0',
  `adddate` datetime NOT NULL,
  `authuser` varchar(250) NOT NULL,
  `dept` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=590 DEFAULT CHARSET=utf8;

/*Table structure for table `acl_job` */

DROP TABLE IF EXISTS `acl_job`;

CREATE TABLE `acl_job` (
  `j_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` varchar(20) NOT NULL,
  `job_name` varchar(30) NOT NULL,
  `dept` varchar(2) NOT NULL,
  `dept_id` varchar(20) NOT NULL,
  `superior` varchar(20) NOT NULL,
  `number` varchar(10) NOT NULL,
  `job_target` text NOT NULL,
  `job_duty` text NOT NULL,
  `kpi_index` text NOT NULL,
  `gender` varchar(1) NOT NULL,
  `age1` varchar(2) NOT NULL,
  `age2` varchar(2) NOT NULL,
  `profession` varchar(60) NOT NULL,
  `education` varchar(30) NOT NULL,
  `qualifications` varchar(60) NOT NULL,
  `skill` varchar(60) NOT NULL,
  `lore` varchar(60) NOT NULL,
  `train` text NOT NULL,
  `ability` text NOT NULL,
  `empiric` text NOT NULL,
  `other_claim` text NOT NULL,
  `job_grade` varchar(20) NOT NULL,
  `salary` varchar(30) NOT NULL,
  `working_time` varchar(30) NOT NULL,
  `record_file` varchar(100) NOT NULL,
  `add_time` datetime NOT NULL,
  `edit_time` datetime NOT NULL,
  `staff_id` varchar(20) NOT NULL,
  `staff_name` varchar(30) NOT NULL,
  `status` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`j_id`),
  KEY `job_id` (`job_id`,`dept`,`staff_id`)
) ENGINE=MyISAM AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;

/*Table structure for table `acl_job_user` */

DROP TABLE IF EXISTS `acl_job_user`;

CREATE TABLE `acl_job_user` (
  `ju_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` varchar(20) NOT NULL,
  `job_name` varchar(30) NOT NULL,
  `dept` varchar(2) NOT NULL,
  `staff_id` varchar(20) NOT NULL,
  `enname` varchar(30) NOT NULL,
  `realname` varchar(30) NOT NULL,
  `add_time` datetime NOT NULL,
  `edit_time` datetime NOT NULL,
  `status` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ju_id`),
  KEY `job_id` (`job_id`,`dept`,`staff_id`,`status`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

/*Table structure for table `acl_user` */

DROP TABLE IF EXISTS `acl_user`;

CREATE TABLE `acl_user` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `staff_id` varchar(20) NOT NULL DEFAULT '',
  `realname` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `enname` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
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
  `im_priv` text NOT NULL,
  `im_assist` tinyint(1) NOT NULL DEFAULT '0',
  `im_sendnotify` tinyint(1) NOT NULL DEFAULT '0',
  `im_creategrp` tinyint(1) NOT NULL DEFAULT '0',
  `adddate` datetime NOT NULL,
  `priv_loginhoadmin` char(1) NOT NULL DEFAULT 'Y',
  `email` varchar(200) NOT NULL,
  `mobile` varchar(200) NOT NULL,
  `attention_list` text NOT NULL,
  `department_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=MyISAM AUTO_INCREMENT=362 DEFAULT CHARSET=utf8;

/*Table structure for table `acl_user_agt` */

DROP TABLE IF EXISTS `acl_user_agt`;

CREATE TABLE `acl_user_agt` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` varchar(20) NOT NULL,
  `agent` text NOT NULL,
  `im_agent` text NOT NULL,
  `siteid` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=MyISAM AUTO_INCREMENT=402 DEFAULT CHARSET=utf8;

/*Table structure for table `acl_user_agt_am` */

DROP TABLE IF EXISTS `acl_user_agt_am`;

CREATE TABLE `acl_user_agt_am` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` varchar(20) NOT NULL,
  `agent` text NOT NULL,
  `im_agent` text NOT NULL,
  `siteid` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Table structure for table `acl_user_agt_ru` */

DROP TABLE IF EXISTS `acl_user_agt_ru`;

CREATE TABLE `acl_user_agt_ru` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` varchar(20) NOT NULL,
  `agent` text NOT NULL,
  `im_agent` text NOT NULL,
  `siteid` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `acl_user_agt_th` */

DROP TABLE IF EXISTS `acl_user_agt_th`;

CREATE TABLE `acl_user_agt_th` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` varchar(20) NOT NULL,
  `agent` text NOT NULL,
  `im_agent` text NOT NULL,
  `siteid` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Table structure for table `acl_user_cs` */

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
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

/*Table structure for table `acl_user_demo_auth` */

DROP TABLE IF EXISTS `acl_user_demo_auth`;

CREATE TABLE `acl_user_demo_auth` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `staff_account` varchar(30) NOT NULL,
  `staff_name` varchar(80) NOT NULL,
  `demo_account_list` varchar(500) NOT NULL,
  `adddate` datetime NOT NULL,
  `status` enum('Y','N') NOT NULL,
  `lastupdate` datetime NOT NULL,
  `session_id_www` varchar(50) NOT NULL,
  `session_id_demo` varchar(50) NOT NULL,
  `lastlogin_time` datetime NOT NULL,
  `lastlogin_account` varchar(20) NOT NULL,
  `login_sid` varchar(70) NOT NULL,
  `login_account` varchar(20) NOT NULL,
  `login_request_time` datetime NOT NULL,
  `login_status` enum('Y','N') DEFAULT NULL,
  `login_num` int(6) NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_account`),
  KEY `login_sid` (`login_sid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Table structure for table `activities_chinese_valentines_history` */

DROP TABLE IF EXISTS `activities_chinese_valentines_history`;

CREATE TABLE `activities_chinese_valentines_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `staff` varchar(4) NOT NULL,
  `win_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=681 DEFAULT CHARSET=utf8;

/*Table structure for table `activities_chinese_valentines_mb` */

DROP TABLE IF EXISTS `activities_chinese_valentines_mb`;

CREATE TABLE `activities_chinese_valentines_mb` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `sort` int(1) NOT NULL DEFAULT '0',
  `d_number` int(1) NOT NULL,
  `d_bird` int(1) NOT NULL,
  `d_score` int(1) NOT NULL,
  `d_result` varchar(50) NOT NULL,
  `d_date` datetime NOT NULL,
  `special` varchar(50) NOT NULL,
  `bird_number` int(2) NOT NULL DEFAULT '0',
  `last_bird_date` datetime NOT NULL,
  `get_credit` int(1) NOT NULL DEFAULT '0',
  `get_date` datetime NOT NULL,
  `adddate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

/*Table structure for table `address_request` */

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
  `womanname` varchar(75) NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `manid` (`manid`),
  KEY `womanid` (`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=13388 DEFAULT CHARSET=utf8;

/*Table structure for table `admin_logs` */

DROP TABLE IF EXISTS `admin_logs`;

CREATE TABLE `admin_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` varchar(15) NOT NULL,
  `staff_name` varchar(30) NOT NULL,
  `adddate` datetime NOT NULL,
  `ip` varchar(20) NOT NULL,
  `classify` tinyint(2) NOT NULL,
  `code` int(4) NOT NULL,
  `ref_id` varchar(50) NOT NULL,
  `ref_date` datetime NOT NULL,
  `ref_id2` varchar(50) NOT NULL,
  `comment` varchar(400) NOT NULL,
  `computer_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  KEY `ref_id` (`ref_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1139 DEFAULT CHARSET=utf8;

/*Table structure for table `admire_assistant_regulation` */

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `admire_assistant_send` */

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
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`,`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `admire_reply_rate` */

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
  PRIMARY KEY (`id`),
  KEY `staff` (`staff_id`,`smonth`),
  KEY `agent` (`agent`,`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;

/*Table structure for table `admire_temp` */

DROP TABLE IF EXISTS `admire_temp`;

CREATE TABLE `admire_temp` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `womanid` varchar(12) NOT NULL,
  `manid` varchar(10) NOT NULL,
  `agent` varchar(8) NOT NULL,
  `adddate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`),
  KEY `manid` (`manid`)
) ENGINE=MyISAM AUTO_INCREMENT=3873775 DEFAULT CHARSET=utf8;

/*Table structure for table `admire_template` */

DROP TABLE IF EXISTS `admire_template`;

CREATE TABLE `admire_template` (
  `at_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `at_adddate` datetime NOT NULL,
  `at_editdate` datetime NOT NULL,
  `at_code` varchar(20) NOT NULL,
  `at_msgid` int(11) unsigned NOT NULL,
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
  PRIMARY KEY (`at_id`),
  KEY `womanid` (`womanid`,`follower_staffid`),
  KEY `template_type` (`template_type`)
) ENGINE=MyISAM AUTO_INCREMENT=165 DEFAULT CHARSET=utf8;

/*Table structure for table `adv_user` */

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
) ENGINE=MyISAM AUTO_INCREMENT=2739 DEFAULT CHARSET=utf8;

/*Table structure for table `advertising_cost` */

DROP TABLE IF EXISTS `advertising_cost`;

CREATE TABLE `advertising_cost` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `loginid` varchar(40) NOT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=671 DEFAULT CHARSET=utf8;

/*Table structure for table `aff_payed` */

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

/*Table structure for table `affiliate_member` */

DROP TABLE IF EXISTS `affiliate_member`;

CREATE TABLE `affiliate_member` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `manid` char(12) NOT NULL,
  `affiliate_id` varchar(20) NOT NULL DEFAULT '',
  `accept` char(1) NOT NULL DEFAULT 'N',
  `date_join` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_active` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_review` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reviewer` varchar(50) NOT NULL,
  `payment_id` varchar(50) NOT NULL,
  `ip_active` varchar(20) NOT NULL DEFAULT '',
  `client_browser` varchar(250) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `affiliate` (`affiliate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4077 DEFAULT CHARSET=utf8;

/*Table structure for table `affiliate_month_detail` */

DROP TABLE IF EXISTS `affiliate_month_detail`;

CREATE TABLE `affiliate_month_detail` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `affiliate_id` varchar(30) NOT NULL,
  `month` date NOT NULL DEFAULT '0000-00-00',
  `mb_num` tinyint(5) NOT NULL DEFAULT '0',
  `per_mb_pay` float(8,2) NOT NULL DEFAULT '0.00',
  `total_earn` float(8,2) NOT NULL DEFAULT '0.00',
  `payment_status` tinyint(1) NOT NULL DEFAULT '0',
  `payment_id` varchar(50) NOT NULL,
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `affiliate_id` (`affiliate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=676 DEFAULT CHARSET=utf8;

/*Table structure for table `agent` */

DROP TABLE IF EXISTS `agent`;

CREATE TABLE `agent` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `authorid` varchar(12) NOT NULL,
  `agentid` varchar(20) NOT NULL DEFAULT '',
  `passwd` varchar(50) NOT NULL,
  `passwd_view` varchar(50) NOT NULL,
  `company` varchar(250) NOT NULL,
  `contact` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `country` varchar(200) NOT NULL DEFAULT '',
  `city` varchar(100) NOT NULL DEFAULT '',
  `inuse` char(1) NOT NULL DEFAULT '1',
  `org_addr` varchar(400) NOT NULL,
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
  `location` varchar(300) NOT NULL,
  `intro` text NOT NULL,
  `gift` char(2) NOT NULL DEFAULT 'N',
  `check_payee` varchar(150) NOT NULL DEFAULT '',
  `check_address` varchar(400) NOT NULL,
  `check_zipcode` varchar(20) NOT NULL DEFAULT '',
  `lastlogin` varchar(100) NOT NULL DEFAULT '',
  `minamount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `im_name` varchar(70) NOT NULL,
  `im_dept` varchar(800) NOT NULL,
  `cujin` varchar(30) NOT NULL,
  `jianguan` varchar(30) NOT NULL,
  `admire_max` tinyint(2) unsigned NOT NULL DEFAULT '10',
  `admire_sum_max` int(4) unsigned NOT NULL,
  `admire_sum_balance` int(4) NOT NULL,
  `admire_reviewer` char(1) NOT NULL DEFAULT 'E',
  `admire_lady_reviewer` char(1) NOT NULL DEFAULT 'A',
  `admire_material` char(1) NOT NULL DEFAULT '1',
  `admire_tpl_reviewer` char(1) NOT NULL DEFAULT 'E',
  `admire_assistant_send` char(1) NOT NULL DEFAULT 'N',
  `delete_grade` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `acc_show` char(1) NOT NULL DEFAULT 'N',
  `verify_code` varchar(10) NOT NULL,
  `man_credit` char(1) NOT NULL DEFAULT 'Y',
  `date_remind` date NOT NULL DEFAULT '0000-00-00',
  `date_stop` date NOT NULL DEFAULT '0000-00-00',
  `emfno` int(8) NOT NULL,
  `addtime` datetime NOT NULL,
  `cujin_a` char(1) NOT NULL,
  `cujin_b` tinyint(1) NOT NULL DEFAULT '0',
  `cujin_c` tinyint(1) NOT NULL DEFAULT '0',
  `remark` varchar(750) NOT NULL,
  `cupid_reviewer` char(1) NOT NULL DEFAULT 'A',
  `pay_remark` varchar(400) NOT NULL,
  `pay_remark_flag` char(1) NOT NULL DEFAULT 'Y',
  `timezone` int(3) NOT NULL DEFAULT '0',
  `style_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `wm_reply_max` int(1) unsigned NOT NULL DEFAULT '100',
  `benef_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`,`authorid`)
) ENGINE=MyISAM AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;

/*Table structure for table `agent_apply` */

DROP TABLE IF EXISTS `agent_apply`;

CREATE TABLE `agent_apply` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `company` varchar(300) NOT NULL,
  `city` varchar(100) NOT NULL,
  `address` varchar(400) NOT NULL,
  `contactor` varchar(60) NOT NULL,
  `telephone` varchar(30) NOT NULL,
  `email` varchar(60) NOT NULL,
  `website` varchar(100) NOT NULL,
  `opentime` varchar(30) NOT NULL,
  `staffnum` varchar(10) NOT NULL,
  `officesize` varchar(10) NOT NULL,
  `salescope` varchar(400) NOT NULL,
  `intro` text NOT NULL,
  `equipment` text NOT NULL,
  `experience` text NOT NULL,
  `knowme` text NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `apptime` datetime NOT NULL,
  `follow` text NOT NULL,
  `ip` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=241 DEFAULT CHARSET=utf8;

/*Table structure for table `agent_author` */

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
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

/*Table structure for table `agent_demo` */

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

/*Table structure for table `agent_help` */

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
) ENGINE=MyISAM AUTO_INCREMENT=859 DEFAULT CHARSET=utf8;

/*Table structure for table `agent_help2` */

DROP TABLE IF EXISTS `agent_help2`;

CREATE TABLE `agent_help2` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `sort` char(2) NOT NULL DEFAULT '',
  `subsort` char(2) NOT NULL DEFAULT '',
  `question` varchar(255) NOT NULL DEFAULT '',
  `answer` text NOT NULL,
  `pxdate` datetime NOT NULL,
  `adddate` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=145 DEFAULT CHARSET=utf8;

/*Table structure for table `agent_help_bak` */

DROP TABLE IF EXISTS `agent_help_bak`;

CREATE TABLE `agent_help_bak` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `sort` char(2) NOT NULL DEFAULT '',
  `subsort` char(2) NOT NULL DEFAULT '',
  `question` varchar(255) NOT NULL DEFAULT '',
  `answer` text NOT NULL,
  `pxdate` datetime NOT NULL,
  `adddate` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;

/*Table structure for table `agent_help_en` */

DROP TABLE IF EXISTS `agent_help_en`;

CREATE TABLE `agent_help_en` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `sort` char(2) NOT NULL DEFAULT '',
  `subsort` char(2) NOT NULL DEFAULT '',
  `question` varchar(450) NOT NULL,
  `answer` text NOT NULL,
  `pxdate` datetime NOT NULL,
  `adddate` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=145 DEFAULT CHARSET=utf8;

/*Table structure for table `agent_info` */

DROP TABLE IF EXISTS `agent_info`;

CREATE TABLE `agent_info` (
  `agentid` varchar(20) NOT NULL,
  `sms_name` varchar(60) NOT NULL,
  `sms_tel` varchar(150) NOT NULL,
  `lovecall` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `lovecall_instant` tinyint(1) NOT NULL DEFAULT '1',
  `lovecall_authcall` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `lovecall_2way` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `lovecall_submit_max` smallint(3) unsigned NOT NULL DEFAULT '1000',
  `lovecall_booking_max` smallint(3) unsigned NOT NULL DEFAULT '1000',
  `lovecall_woman_max` smallint(2) unsigned NOT NULL DEFAULT '1000',
  `lovecall_logs` text NOT NULL,
  `priv_livechat` tinyint(1) NOT NULL DEFAULT '1',
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
  PRIMARY KEY (`agentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `agent_info_demo` */

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

/*Table structure for table `agent_livechat_activities` */

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
) ENGINE=MyISAM AUTO_INCREMENT=391 DEFAULT CHARSET=utf8;

/*Table structure for table `agent_livechat_activities_stats` */

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
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Table structure for table `agent_login` */

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
) ENGINE=MyISAM AUTO_INCREMENT=1002486 DEFAULT CHARSET=utf8;

/*Table structure for table `agent_login_monitor` */

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
) ENGINE=MyISAM AUTO_INCREMENT=705 DEFAULT CHARSET=latin1;

/*Table structure for table `agent_punish1` */

DROP TABLE IF EXISTS `agent_punish1`;

CREATE TABLE `agent_punish1` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `punish_no` varchar(20) NOT NULL,
  `punish_date` date NOT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

/*Table structure for table `agent_punish2` */

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
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

/*Table structure for table `agent_rate` */

DROP TABLE IF EXISTS `agent_rate`;

CREATE TABLE `agent_rate` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `agentid` varchar(20) NOT NULL,
  `enname` varchar(200) NOT NULL,
  `location` varchar(200) NOT NULL,
  `join_date` date NOT NULL,
  `token` varchar(50) NOT NULL,
  `emf_score` varchar(30) NOT NULL,
  `fbscore_3m` varchar(30) NOT NULL,
  `fbscore_6m` varchar(30) NOT NULL,
  `fbscore_12m` varchar(30) NOT NULL,
  `lastupdate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

/*Table structure for table `agent_rate_demo` */

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

/*Table structure for table `agent_relation` */

DROP TABLE IF EXISTS `agent_relation`;

CREATE TABLE `agent_relation` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `authorid` varchar(12) NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `agent_name` varchar(200) NOT NULL,
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `addinfo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `authorid` (`authorid`,`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

/*Table structure for table `agent_staff_gzl_detail` */

DROP TABLE IF EXISTS `agent_staff_gzl_detail`;

CREATE TABLE `agent_staff_gzl_detail` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `staffid` varchar(20) NOT NULL,
  `staffname` varchar(40) NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `adddate` datetime NOT NULL,
  `ref_id` varchar(50) NOT NULL,
  `ref_date` datetime NOT NULL,
  `classify` tinyint(2) NOT NULL,
  `flag` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `staffid` (`agentid`,`staffid`)
) ENGINE=MyISAM AUTO_INCREMENT=569 DEFAULT CHARSET=utf8;

/*Table structure for table `agent_stats` */

DROP TABLE IF EXISTS `agent_stats`;

CREATE TABLE `agent_stats` (
  `agentid` varchar(12) NOT NULL,
  `addrequest` int(6) NOT NULL,
  `emf1` int(6) NOT NULL,
  `emf2` int(6) NOT NULL,
  `emf3` tinyint(5) NOT NULL,
  `assist` int(6) NOT NULL,
  `newcupid` int(6) NOT NULL,
  `survey` int(6) NOT NULL,
  `cupid` int(6) NOT NULL,
  PRIMARY KEY (`agentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `agent_vote_detail` */

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
) ENGINE=MyISAM AUTO_INCREMENT=325 DEFAULT CHARSET=utf8;

/*Table structure for table `agent_vote_main` */

DROP TABLE IF EXISTS `agent_vote_main`;

CREATE TABLE `agent_vote_main` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `smonth` date NOT NULL,
  `agent` varchar(10) NOT NULL,
  `company` varchar(150) NOT NULL,
  `agt_staffid` varchar(15) NOT NULL,
  `agt_staffsubmit` varchar(20) NOT NULL,
  `agt_staffname` varchar(30) NOT NULL,
  `agt_staffphone` varchar(50) NOT NULL,
  `chn_staffid` varchar(15) NOT NULL,
  `chn_staffname` varchar(30) NOT NULL,
  `chn_staffen` varchar(20) NOT NULL,
  `score` tinyint(4) NOT NULL,
  `secscore` varchar(100) NOT NULL,
  `adddate` datetime NOT NULL,
  `votedate` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `comment` varchar(750) NOT NULL,
  `daterange` varchar(40) NOT NULL,
  `display` char(1) NOT NULL DEFAULT 'Y',
  `ques_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `agent` (`agent`)
) ENGINE=MyISAM AUTO_INCREMENT=325 DEFAULT CHARSET=utf8;

/*Table structure for table `agent_vote_ques` */

DROP TABLE IF EXISTS `agent_vote_ques`;

CREATE TABLE `agent_vote_ques` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `adddate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Table structure for table `agent_web` */

DROP TABLE IF EXISTS `agent_web`;

CREATE TABLE `agent_web` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `agentid` varchar(20) NOT NULL DEFAULT '',
  `status` char(1) NOT NULL DEFAULT 'Y',
  `company` varchar(350) NOT NULL,
  `web_id` varchar(20) NOT NULL DEFAULT '',
  `web_top` text NOT NULL,
  `web_end` text NOT NULL,
  `web_contact` text NOT NULL,
  `domain` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `web_id` (`web_id`)
) ENGINE=MyISAM AUTO_INCREMENT=246 DEFAULT CHARSET=utf8;

/*Table structure for table `agent_web_demo` */

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

/*Table structure for table `ammsg01_1m` */

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

/*Table structure for table `ammsg01_201312` */

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

/*Table structure for table `ammsg01_201401` */

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

/*Table structure for table `ammsg01_201402` */

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

/*Table structure for table `ammsg01_201403` */

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
) ENGINE=MyISAM AUTO_INCREMENT=3873775 DEFAULT CHARSET=utf8 COMMENT='admimier 201403';

/*Table structure for table `ammsg01_3m` */

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

/*Table structure for table `ammsg01_new` */

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

/*Table structure for table `ammsg01_unsend` */

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
) ENGINE=MyISAM AUTO_INCREMENT=3872213 DEFAULT CHARSET=utf8;

/*Table structure for table `ammsg02_1m` */

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

/*Table structure for table `ammsg02_201312` */

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

/*Table structure for table `ammsg02_201401` */

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

/*Table structure for table `ammsg02_201402` */

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

/*Table structure for table `ammsg02_201403` */

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
) ENGINE=MyISAM AUTO_INCREMENT=3873775 DEFAULT CHARSET=utf8;

/*Table structure for table `ammsg02_3m` */

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

/*Table structure for table `ammsg02_new` */

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

/*Table structure for table `ammsg02_unsend` */

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
) ENGINE=MyISAM AUTO_INCREMENT=3872213 DEFAULT CHARSET=utf8;

/*Table structure for table `ammsg_dc` */

DROP TABLE IF EXISTS `ammsg_dc`;

CREATE TABLE `ammsg_dc` (
  `ammsgid` int(8) unsigned NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `dc_reason` varchar(200) NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`ammsgid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `ask_comment` */

DROP TABLE IF EXISTS `ask_comment`;

CREATE TABLE `ask_comment` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `aid` int(8) unsigned NOT NULL,
  `content` varchar(800) NOT NULL,
  `manid` varchar(20) NOT NULL,
  `manname` varchar(60) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `rank` int(6) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `adddate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

/*Table structure for table `ask_experts` */

DROP TABLE IF EXISTS `ask_experts`;

CREATE TABLE `ask_experts` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `category` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `question` text NOT NULL,
  `forum_msgid` varchar(10) NOT NULL,
  `rank` int(6) unsigned NOT NULL,
  `isrecommend` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `adddate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Table structure for table `bandwidth` */

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

/*Table structure for table `bg_sign` */

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
  `other` varchar(100) NOT NULL,
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
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=75367 DEFAULT CHARSET=utf8;

/*Table structure for table `black_country` */

DROP TABLE IF EXISTS `black_country`;

CREATE TABLE `black_country` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `code` char(2) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `status` char(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=242 DEFAULT CHARSET=utf8;

/*Table structure for table `blackwoman` */

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
) ENGINE=MyISAM AUTO_INCREMENT=12014 DEFAULT CHARSET=utf8;

/*Table structure for table `computer` */

DROP TABLE IF EXISTS `computer`;

CREATE TABLE `computer` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `authorid` varchar(12) NOT NULL,
  `agentid` varchar(10) NOT NULL DEFAULT '',
  `cpu_id` varchar(100) NOT NULL DEFAULT '',
  `disk_id` varchar(100) NOT NULL,
  `computer_id` varchar(20) NOT NULL DEFAULT '',
  `location1` varchar(150) NOT NULL,
  `location2` varchar(150) NOT NULL,
  `auth` enum('Y','N','P','D') NOT NULL DEFAULT 'Y',
  `auth_edit_time` datetime NOT NULL,
  `auth_final_operating` varchar(1) NOT NULL,
  `comment` text NOT NULL,
  `comment2` text NOT NULL,
  `manager` varchar(60) NOT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=3492 DEFAULT CHARSET=utf8;

/*Table structure for table `contact` */

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
) ENGINE=MyISAM AUTO_INCREMENT=447 DEFAULT CHARSET=utf8;

/*Table structure for table `contact_request` */

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
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

/*Table structure for table `country` */

DROP TABLE IF EXISTS `country`;

CREATE TABLE `country` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `country` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Table structure for table `cs1234_bak` */

DROP TABLE IF EXISTS `cs1234_bak`;

CREATE TABLE `cs1234_bak` (
  `id` int(8) NOT NULL,
  `topic` varchar(20) NOT NULL DEFAULT '',
  `manid` char(12) NOT NULL,
  `status` varchar(5) NOT NULL DEFAULT '',
  `display` char(1) NOT NULL DEFAULT 'Y',
  `reply` char(1) NOT NULL DEFAULT 'N',
  `category` varchar(10) NOT NULL DEFAULT '',
  `groupby` varchar(10) NOT NULL DEFAULT '',
  `fullname` varchar(200) NOT NULL DEFAULT '',
  `man_email` varchar(200) NOT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `cnsubject` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastprocess` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `resolvedate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `creatora` varchar(255) NOT NULL DEFAULT '',
  `creator_id` varchar(10) NOT NULL,
  `staff_id` varchar(10) NOT NULL,
  `staff_cnname` varchar(12) NOT NULL,
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
  `email_id` varchar(20) NOT NULL DEFAULT '',
  `method` char(2) NOT NULL DEFAULT '',
  `staff` varchar(20) NOT NULL DEFAULT '',
  `staff_name` varchar(50) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `senddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `creatorb` varchar(255) NOT NULL DEFAULT '',
  `attachment` tinyint(1) NOT NULL DEFAULT '0',
  `remark` text NOT NULL,
  `readflag` char(1) NOT NULL DEFAULT 'N',
  `sendflag` char(1) NOT NULL DEFAULT 'N',
  `viewdate` datetime NOT NULL,
  `senderinfo` varchar(100) NOT NULL,
  `readerip` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `cs_email_new` */

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
) ENGINE=MyISAM AUTO_INCREMENT=132874 DEFAULT CHARSET=utf8;

/*Table structure for table `cs_staff_logs` */

DROP TABLE IF EXISTS `cs_staff_logs`;

CREATE TABLE `cs_staff_logs` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '×Ô¶¯±àºÅ',
  `topic` varchar(20) NOT NULL COMMENT 'ÊÂÏî±àºÅ',
  `email_id` varchar(20) NOT NULL COMMENT 'ÓÊ¼þID',
  `senddate` datetime NOT NULL COMMENT '·¢³öÊ±¼ä',
  `category` tinyint(1) NOT NULL COMMENT 'ÊÂÏî·ÖÀà',
  `relateto` tinyint(1) NOT NULL COMMENT 'Éæ¼°¶ÔÏó',
  `staff` varchar(12) NOT NULL COMMENT 'ÐÅ¼þÈËÔ±±àºÅ',
  `sender` varchar(12) NOT NULL COMMENT '·¢ÐÅÈËÔ±±àºÅ',
  PRIMARY KEY (`id`),
  KEY `staff` (`staff`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Table structure for table `cs_staff_stats` */

DROP TABLE IF EXISTS `cs_staff_stats`;

CREATE TABLE `cs_staff_stats` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '×Ô¶¯±àºÅ',
  `staffid` varchar(12) NOT NULL COMMENT '¹¤×÷ÈËÔ±±àºÅ',
  `cnname` varchar(18) NOT NULL COMMENT '¹¤×÷ÈËÔ±ÐÕÃû',
  `enname` varchar(20) NOT NULL COMMENT 'Ó¢ÎÄÐÕÃû',
  `sdate` date NOT NULL COMMENT 'ÈÕÆÚ',
  `s1` int(3) NOT NULL COMMENT '¶©µ¥ÊÂÏîÊý',
  `s2` int(3) NOT NULL COMMENT '×ÉÑ¯ÊÂÏîÊý',
  `s3` int(3) NOT NULL COMMENT '¼¼ÊõÊÂÏîÊý',
  `s4` int(3) NOT NULL COMMENT 'ÇóÖúÊÂÏîÊý',
  `s5` int(3) NOT NULL COMMENT 'Í¶ËßCLÊÂÏîÊý',
  `s6` int(3) NOT NULL COMMENT 'Í¶Ëß»ú¹¹ÊÂÏîÊý',
  `s7` int(3) NOT NULL COMMENT 'Í¶ËßÅ®Ê¿ÊÂÏîÊý',
  `s8` int(3) NOT NULL COMMENT 'Í¶ËßÊÂÏîÊý-Î´ÉèÉæÍâ¶ÔÏó',
  `d1` int(3) NOT NULL COMMENT '¶©µ¥»Ø¸´Êý',
  `d2` int(3) NOT NULL COMMENT '×ÉÑ¯»Ø¸´Êý',
  `d3` int(3) NOT NULL COMMENT '¼¼Êõ»Ø¸´Êý',
  `d4` int(3) NOT NULL COMMENT 'ÇóÖú»Ø¸´Êý',
  `d5` int(3) NOT NULL COMMENT 'Í¶ËßCL»Ø¸´Êý',
  `d6` int(3) NOT NULL COMMENT 'Í¶Ëß»ú¹¹»Ø¸´Êý',
  `d7` int(3) NOT NULL COMMENT 'Í¶ËßÅ®Ê¿»Ø¸´Êý',
  `d8` int(3) NOT NULL COMMENT 'Í¶Ëß»Ø¸´Êý-Î´ÉèÉæÍâ¶ÔÏó',
  `adddate` datetime NOT NULL COMMENT '¼ÇÂ¼Ð´ÈëÊ±¼ä',
  PRIMARY KEY (`id`),
  KEY `staffid` (`staffid`,`sdate`)
) ENGINE=MyISAM AUTO_INCREMENT=7687 DEFAULT CHARSET=utf8;

/*Table structure for table `cs_subject_new` */

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
  `subject` varchar(450) NOT NULL,
  `cnsubject` varchar(450) NOT NULL,
  `comment` text NOT NULL,
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastprocess` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `resolvedate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `creator` varchar(255) NOT NULL DEFAULT '',
  `creator_id` varchar(10) NOT NULL,
  `staff_id` varchar(10) NOT NULL,
  `staff_cnname` varchar(30) NOT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=59819 DEFAULT CHARSET=utf8;

/*Table structure for table `csmail_seq` */

DROP TABLE IF EXISTS `csmail_seq`;

CREATE TABLE `csmail_seq` (
  `id` tinyint(2) NOT NULL AUTO_INCREMENT,
  `staffid` varchar(15) NOT NULL,
  `idx` tinyint(3) NOT NULL,
  `lastupdate` datetime NOT NULL,
  `group` char(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Table structure for table `cupid1` */

DROP TABLE IF EXISTS `cupid1`;

CREATE TABLE `cupid1` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `id2` varchar(35) NOT NULL,
  `manid` varchar(12) NOT NULL,
  `man_name` varchar(30) NOT NULL,
  `man_country` char(2) NOT NULL,
  `womanid` varchar(12) NOT NULL,
  `woman_name` varchar(40) NOT NULL,
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
  `reviewer` varchar(30) NOT NULL,
  `staffid` varchar(10) NOT NULL,
  `emf_reply_date` datetime NOT NULL,
  `follower` varchar(10) NOT NULL,
  `bgpic` tinyint(1) NOT NULL DEFAULT '0',
  `alertflag` tinyint(1) NOT NULL DEFAULT '0',
  `groupid` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id2` (`id2`),
  KEY `forsearch` (`manid`,`womanid`,`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=246014 DEFAULT CHARSET=utf8;

/*Table structure for table `cupid1_2008` */

DROP TABLE IF EXISTS `cupid1_2008`;

CREATE TABLE `cupid1_2008` (
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
  PRIMARY KEY (`id`),
  KEY `id2` (`id2`),
  KEY `forsearch` (`manid`,`womanid`,`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=1318265 DEFAULT CHARSET=utf8;

/*Table structure for table `cupid1_2009` */

DROP TABLE IF EXISTS `cupid1_2009`;

CREATE TABLE `cupid1_2009` (
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
  PRIMARY KEY (`id`),
  KEY `id2` (`id2`),
  KEY `forsearch` (`manid`,`womanid`,`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=1318265 DEFAULT CHARSET=utf8;

/*Table structure for table `cupid1_2010` */

DROP TABLE IF EXISTS `cupid1_2010`;

CREATE TABLE `cupid1_2010` (
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
  PRIMARY KEY (`id`),
  KEY `id2` (`id2`),
  KEY `forsearch` (`manid`,`womanid`,`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=1318265 DEFAULT CHARSET=utf8;

/*Table structure for table `cupid1_2011` */

DROP TABLE IF EXISTS `cupid1_2011`;

CREATE TABLE `cupid1_2011` (
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
  PRIMARY KEY (`id`),
  KEY `id2` (`id2`),
  KEY `forsearch` (`manid`,`womanid`,`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=1318265 DEFAULT CHARSET=utf8;

/*Table structure for table `cupid1_2012` */

DROP TABLE IF EXISTS `cupid1_2012`;

CREATE TABLE `cupid1_2012` (
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
  PRIMARY KEY (`id`),
  KEY `id2` (`id2`),
  KEY `forsearch` (`manid`,`womanid`,`agentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `cupid1_new` */

DROP TABLE IF EXISTS `cupid1_new`;

CREATE TABLE `cupid1_new` (
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
  PRIMARY KEY (`id`),
  KEY `id2` (`id2`),
  KEY `forsearch` (`manid`,`womanid`,`agentid`)
) ENGINE=MRG_MyISAM DEFAULT CHARSET=utf8 INSERT_METHOD=LAST UNION=(`cupid1_2010`,`cupid1_2011`);

/*Table structure for table `cupid2` */

DROP TABLE IF EXISTS `cupid2`;

CREATE TABLE `cupid2` (
  `rid` int(8) NOT NULL AUTO_INCREMENT,
  `id2` varchar(30) NOT NULL,
  `manid` varchar(12) NOT NULL,
  `man_name` varchar(30) NOT NULL,
  `womanid` varchar(12) NOT NULL,
  `woman_name` varchar(40) NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `note_addtime` datetime NOT NULL,
  `reply_method` tinyint(1) NOT NULL,
  `agt_staff` varchar(25) NOT NULL,
  `agt_staffname` varchar(30) NOT NULL,
  `replymsg` text NOT NULL,
  `reason` tinyint(1) NOT NULL,
  `submitdate` datetime NOT NULL,
  `deleted` char(1) NOT NULL,
  `sendflag` tinyint(1) NOT NULL,
  `chn_staff` varchar(35) NOT NULL,
  `reject_reason` varchar(500) NOT NULL,
  `review_comm` text NOT NULL,
  `comment` text NOT NULL,
  `senddate` datetime NOT NULL,
  `read_flag` char(1) NOT NULL DEFAULT 'N',
  `attachnum` tinyint(1) NOT NULL,
  `attachment` varchar(170) NOT NULL,
  `review_mode` tinyint(1) NOT NULL DEFAULT '0',
  `reviewer_id` varchar(7) NOT NULL,
  `reviewer_name` varchar(30) NOT NULL,
  `groupid` varchar(10) NOT NULL,
  PRIMARY KEY (`rid`),
  KEY `id2` (`id2`),
  KEY `forsearch` (`manid`,`womanid`,`agentid`),
  KEY `forresubmit` (`agentid`,`sendflag`,`reply_method`)
) ENGINE=MyISAM AUTO_INCREMENT=238604 DEFAULT CHARSET=utf8;

/*Table structure for table `cupid2_2008` */

DROP TABLE IF EXISTS `cupid2_2008`;

CREATE TABLE `cupid2_2008` (
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
  `replymsg` text NOT NULL,
  `reason` tinyint(1) NOT NULL,
  `submitdate` datetime NOT NULL,
  `deleted` char(1) NOT NULL,
  `sendflag` tinyint(1) NOT NULL,
  `chn_staff` varchar(35) NOT NULL DEFAULT '',
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
  PRIMARY KEY (`rid`),
  KEY `id2` (`id2`),
  KEY `forsearch` (`manid`,`womanid`,`agentid`),
  KEY `foragent` (`agentid`,`sendflag`,`reply_method`)
) ENGINE=MyISAM AUTO_INCREMENT=1361519 DEFAULT CHARSET=utf8;

/*Table structure for table `cupid2_2009` */

DROP TABLE IF EXISTS `cupid2_2009`;

CREATE TABLE `cupid2_2009` (
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
  `replymsg` text NOT NULL,
  `reason` tinyint(1) NOT NULL,
  `submitdate` datetime NOT NULL,
  `deleted` char(1) NOT NULL,
  `sendflag` tinyint(1) NOT NULL,
  `chn_staff` varchar(35) NOT NULL DEFAULT '',
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
  PRIMARY KEY (`rid`),
  KEY `id2` (`id2`),
  KEY `forsearch` (`manid`,`womanid`,`agentid`),
  KEY `foragent` (`agentid`,`sendflag`,`reply_method`)
) ENGINE=MyISAM AUTO_INCREMENT=1361519 DEFAULT CHARSET=utf8;

/*Table structure for table `cupid2_2010` */

DROP TABLE IF EXISTS `cupid2_2010`;

CREATE TABLE `cupid2_2010` (
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
  `replymsg` text NOT NULL,
  `reason` tinyint(1) NOT NULL,
  `submitdate` datetime NOT NULL,
  `deleted` char(1) NOT NULL,
  `sendflag` tinyint(1) NOT NULL,
  `chn_staff` varchar(35) NOT NULL DEFAULT '',
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
  PRIMARY KEY (`rid`),
  KEY `id2` (`id2`),
  KEY `forsearch` (`manid`,`womanid`,`agentid`),
  KEY `foragent` (`agentid`,`sendflag`,`reply_method`)
) ENGINE=MyISAM AUTO_INCREMENT=1361519 DEFAULT CHARSET=utf8;

/*Table structure for table `cupid2_2011` */

DROP TABLE IF EXISTS `cupid2_2011`;

CREATE TABLE `cupid2_2011` (
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
  `replymsg` text NOT NULL,
  `reason` tinyint(1) NOT NULL,
  `submitdate` datetime NOT NULL,
  `deleted` char(1) NOT NULL,
  `sendflag` tinyint(1) NOT NULL,
  `chn_staff` varchar(35) NOT NULL DEFAULT '',
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
  PRIMARY KEY (`rid`),
  KEY `id2` (`id2`),
  KEY `forsearch` (`manid`,`womanid`,`agentid`),
  KEY `foragent` (`agentid`,`sendflag`,`reply_method`)
) ENGINE=MyISAM AUTO_INCREMENT=1361519 DEFAULT CHARSET=utf8;

/*Table structure for table `cupid2_2012` */

DROP TABLE IF EXISTS `cupid2_2012`;

CREATE TABLE `cupid2_2012` (
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
  `replymsg` text NOT NULL,
  `reason` tinyint(1) NOT NULL,
  `submitdate` datetime NOT NULL,
  `deleted` char(1) NOT NULL,
  `sendflag` tinyint(1) NOT NULL,
  `chn_staff` varchar(35) NOT NULL DEFAULT '',
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
  PRIMARY KEY (`rid`),
  KEY `id2` (`id2`),
  KEY `forsearch` (`manid`,`womanid`,`agentid`),
  KEY `foragent` (`agentid`,`sendflag`,`reply_method`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `cupid2_new` */

DROP TABLE IF EXISTS `cupid2_new`;

CREATE TABLE `cupid2_new` (
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
  `replymsg` text NOT NULL,
  `reason` tinyint(1) NOT NULL,
  `submitdate` datetime NOT NULL,
  `deleted` char(1) NOT NULL,
  `sendflag` tinyint(1) NOT NULL,
  `chn_staff` varchar(35) NOT NULL DEFAULT '',
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
  PRIMARY KEY (`rid`),
  KEY `id2` (`id2`),
  KEY `forsearch` (`manid`,`womanid`,`agentid`),
  KEY `foragent` (`agentid`,`sendflag`,`reply_method`)
) ENGINE=MRG_MyISAM DEFAULT CHARSET=utf8 INSERT_METHOD=LAST UNION=(`cupid2_2010`,`cupid2_2011`);

/*Table structure for table `cupid_limit_log` */

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Table structure for table `cupiddate` */

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
) ENGINE=MyISAM AUTO_INCREMENT=194 DEFAULT CHARSET=utf8;

/*Table structure for table `cw_tab1` */

DROP TABLE IF EXISTS `cw_tab1`;

CREATE TABLE `cw_tab1` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `agentid` varchar(20) NOT NULL DEFAULT '',
  `ac_name` varchar(150) NOT NULL,
  `ac_note` text NOT NULL,
  `flag` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=133 DEFAULT CHARSET=utf8;

/*Table structure for table `cw_tab2` */

DROP TABLE IF EXISTS `cw_tab2`;

CREATE TABLE `cw_tab2` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `agentid` varchar(20) NOT NULL DEFAULT '',
  `manid` varchar(12) NOT NULL DEFAULT '',
  `man_name` varchar(20) NOT NULL DEFAULT '',
  `womanid` varchar(12) NOT NULL DEFAULT '',
  `woman_name` varchar(30) NOT NULL,
  `ac_no` varchar(16) NOT NULL,
  `io` char(1) NOT NULL DEFAULT '',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `balance` decimal(12,2) NOT NULL DEFAULT '0.00',
  `description` varchar(100) NOT NULL,
  `note` text NOT NULL,
  `danju` varchar(30) NOT NULL,
  `event_date` date NOT NULL DEFAULT '0000-00-00',
  `addtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `staff_id` varchar(10) NOT NULL DEFAULT '',
  `staff_name` varchar(16) NOT NULL,
  `update_history` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;

/*Table structure for table `datastats` */

DROP TABLE IF EXISTS `datastats`;

CREATE TABLE `datastats` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `description` varchar(50) NOT NULL,
  `sqltext` varchar(500) NOT NULL,
  `lastupdate` datetime NOT NULL,
  `num` varchar(20) NOT NULL,
  `autoupdate` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Table structure for table `david_temp_lady` */

DROP TABLE IF EXISTS `david_temp_lady`;

CREATE TABLE `david_temp_lady` (
  `womanid` varchar(30) NOT NULL DEFAULT '',
  `lastlogin` datetime NOT NULL,
  `credits` decimal(7,2) NOT NULL DEFAULT '0.00',
  `postdate` datetime DEFAULT NULL,
  `cupid` int(11) NOT NULL,
  `admire` int(11) NOT NULL,
  `bp_emf` int(11) NOT NULL,
  `livechat_free` int(11) NOT NULL,
  `livechat_byman` int(11) NOT NULL,
  KEY `womanid` (`womanid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `draft_msg01` */

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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Table structure for table `draft_msg02` */

DROP TABLE IF EXISTS `draft_msg02`;

CREATE TABLE `draft_msg02` (
  `id` int(3) NOT NULL DEFAULT '0',
  `body` text NOT NULL,
  `ip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `email` */

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;

/*Table structure for table `email_bak201005` */

DROP TABLE IF EXISTS `email_bak201005`;

CREATE TABLE `email_bak201005` (
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
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

/*Table structure for table `email_bak201302` */

DROP TABLE IF EXISTS `email_bak201302`;

CREATE TABLE `email_bak201302` (
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
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

/*Table structure for table `email_bak201304` */

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
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

/*Table structure for table `email_bk20130401` */

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

/*Table structure for table `email_bk20130415` */

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
) ENGINE=MyISAM AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;

/*Table structure for table `emf_pending` */

DROP TABLE IF EXISTS `emf_pending`;

CREATE TABLE `emf_pending` (
  `id` int(8) NOT NULL,
  `agentid` varchar(12) NOT NULL,
  `adddate` datetime NOT NULL,
  `updatetime` datetime NOT NULL,
  `sendflag` varchar(1) NOT NULL,
  `comment` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `emf_survey` */

DROP TABLE IF EXISTS `emf_survey`;

CREATE TABLE `emf_survey` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `womanid` varchar(12) NOT NULL,
  `agent` varchar(20) NOT NULL,
  `emfdate` datetime NOT NULL,
  `score` int(2) NOT NULL,
  `survey_date` datetime NOT NULL,
  `staffname` varchar(30) NOT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=49612 DEFAULT CHARSET=utf8;

/*Table structure for table `emf_unpaid` */

DROP TABLE IF EXISTS `emf_unpaid`;

CREATE TABLE `emf_unpaid` (
  `id` int(8) NOT NULL,
  `agentid` varchar(12) NOT NULL,
  `staff_id` varchar(8) NOT NULL,
  `womanid` varchar(15) NOT NULL,
  `manid` varchar(15) NOT NULL,
  `adddate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `emf_update` */

DROP TABLE IF EXISTS `emf_update`;

CREATE TABLE `emf_update` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `msgid` int(10) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `manid` varchar(20) NOT NULL,
  `staff_id` varchar(15) NOT NULL,
  `staff_name` varchar(30) NOT NULL,
  `agentid` varchar(20) NOT NULL,
  `body_src` text NOT NULL,
  `body_new` text NOT NULL,
  `ip` varchar(15) NOT NULL,
  `adddate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `msgid` (`msgid`)
) ENGINE=MyISAM AUTO_INCREMENT=4846 DEFAULT CHARSET=utf8;

/*Table structure for table `favorites` */

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
) ENGINE=MyISAM AUTO_INCREMENT=5395900 DEFAULT CHARSET=utf8;

/*Table structure for table `favorites_comments` */

DROP TABLE IF EXISTS `favorites_comments`;

CREATE TABLE `favorites_comments` (
  `comments_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `comments` varchar(180) NOT NULL,
  `addtime` datetime NOT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`comments_id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

/*Table structure for table `favorites_comments_history` */

DROP TABLE IF EXISTS `favorites_comments_history`;

CREATE TABLE `favorites_comments_history` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `comments` varchar(180) NOT NULL,
  `manid` varchar(15) NOT NULL,
  `womanid` varchar(15) NOT NULL,
  `agentid` varchar(7) NOT NULL,
  `addtime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;

/*Table structure for table `favorites_lady` */

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
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

/*Table structure for table `favorites_stats` */

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

/*Table structure for table `forums_cat` */

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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Table structure for table `forums_fav` */

DROP TABLE IF EXISTS `forums_fav`;

CREATE TABLE `forums_fav` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `manid` varchar(20) NOT NULL DEFAULT '',
  `cat_id` int(8) NOT NULL DEFAULT '0',
  `topics_id` int(8) NOT NULL DEFAULT '0',
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`)
) ENGINE=MyISAM AUTO_INCREMENT=1183 DEFAULT CHARSET=utf8;

/*Table structure for table `forums_msg` */

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
  `ip` varchar(15) NOT NULL,
  `quotebody` varchar(500) NOT NULL,
  `attachnum` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cat_id` (`cat_id`,`topics_id`,`manid`)
) ENGINE=MyISAM AUTO_INCREMENT=4046 DEFAULT CHARSET=utf8;

/*Table structure for table `forums_topics` */

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
  `ip` varchar(15) NOT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=1073 DEFAULT CHARSET=utf8;

/*Table structure for table `forward_adr` */

DROP TABLE IF EXISTS `forward_adr`;

CREATE TABLE `forward_adr` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `msgid` int(8) NOT NULL DEFAULT '0',
  `agentid` varchar(10) NOT NULL DEFAULT '',
  `sendtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sendto` varchar(180) NOT NULL DEFAULT '',
  `sendfrom` varchar(180) NOT NULL DEFAULT '',
  `manid` varchar(20) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `ip` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_2` (`msgid`)
) ENGINE=MyISAM AUTO_INCREMENT=8082 DEFAULT CHARSET=utf8;

/*Table structure for table `forward_emf` */

DROP TABLE IF EXISTS `forward_emf`;

CREATE TABLE `forward_emf` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `emf_id` bigint(10) NOT NULL DEFAULT '0',
  `agentid` varchar(10) NOT NULL DEFAULT '',
  `toflag` varchar(3) NOT NULL,
  `sendtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sendto` varchar(180) NOT NULL DEFAULT '',
  `sendfrom` varchar(180) NOT NULL DEFAULT '',
  `manid` varchar(20) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emf_id` (`emf_id`),
  KEY `agentid` (`agentid`),
  KEY `forsearch` (`sendtime`,`manid`,`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=174527 DEFAULT CHARSET=utf8;

/*Table structure for table `gift_category` */

DROP TABLE IF EXISTS `gift_category`;

CREATE TABLE `gift_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(100) NOT NULL,
  `sortby` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `addtime` datetime NOT NULL,
  `uptime` datetime NOT NULL,
  `staff_id` varchar(20) NOT NULL,
  `staff_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Table structure for table `gift_delivery` */

DROP TABLE IF EXISTS `gift_delivery`;

CREATE TABLE `gift_delivery` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `orderno` varchar(50) NOT NULL,
  `orderdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordertype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `devno` varchar(55) NOT NULL,
  `shippingno` varchar(50) NOT NULL DEFAULT '',
  `senddate` date NOT NULL DEFAULT '0000-00-00',
  `devnote` varchar(255) NOT NULL DEFAULT '',
  `manid` varchar(20) NOT NULL DEFAULT '',
  `man_name` varchar(30) NOT NULL DEFAULT '',
  `man_phone` varchar(20) NOT NULL DEFAULT '',
  `man_addr` varchar(100) NOT NULL DEFAULT '',
  `agentid` varchar(20) NOT NULL,
  `womanid` varchar(20) NOT NULL DEFAULT '',
  `woman_name` varchar(30) NOT NULL,
  `woman_cnname` varchar(30) NOT NULL,
  `woman_phone` varchar(40) NOT NULL,
  `woman_addr` varchar(100) NOT NULL DEFAULT '',
  `greeting_word` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `staff_id` varchar(20) NOT NULL DEFAULT '',
  `staff_name` varchar(30) NOT NULL,
  `remark` text NOT NULL,
  `delivery_date` datetime NOT NULL,
  `confirm_date` datetime NOT NULL,
  `confirm_person` varchar(30) NOT NULL,
  `needaddcredit` char(1) NOT NULL DEFAULT 'N',
  `creditadded` char(1) NOT NULL DEFAULT 'N',
  `addrconfirmed` tinyint(1) NOT NULL,
  `postage` decimal(8,2) NOT NULL DEFAULT '0.00',
  `reminded` tinyint(1) NOT NULL DEFAULT '0',
  `provider` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=5772 DEFAULT CHARSET=utf8;

/*Table structure for table `gift_delivery_new` */

DROP TABLE IF EXISTS `gift_delivery_new`;

CREATE TABLE `gift_delivery_new` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `orderno` varchar(50) NOT NULL,
  `orderdate` datetime NOT NULL,
  `ordertype` tinyint(1) NOT NULL,
  `devno` varchar(55) NOT NULL,
  `shippingno` varchar(50) DEFAULT NULL,
  `senddate` datetime NOT NULL,
  `manid` varchar(20) DEFAULT NULL,
  `man_name` varchar(30) DEFAULT NULL,
  `man_phone` varchar(20) DEFAULT NULL,
  `man_addr` varchar(100) DEFAULT NULL,
  `agentid` varchar(20) DEFAULT NULL,
  `womanid` varchar(20) DEFAULT NULL,
  `woman_name` varchar(30) DEFAULT NULL,
  `woman_cnname` varchar(30) DEFAULT NULL,
  `woman_addressbookid` int(11) NOT NULL DEFAULT '0',
  `woman_phone` varchar(40) DEFAULT NULL,
  `woman_addr` varchar(500) DEFAULT NULL,
  `address_isverify` tinyint(1) NOT NULL DEFAULT '1',
  `order_status` tinyint(1) NOT NULL DEFAULT '0',
  `order_result` tinyint(1) NOT NULL DEFAULT '0',
  `agent_orderstatus` tinyint(1) NOT NULL DEFAULT '0',
  `express_orderstatus` tinyint(1) NOT NULL DEFAULT '0',
  `canceltype` tinyint(1) NOT NULL DEFAULT '0',
  `delivery_createdatetime` datetime NOT NULL,
  `delivery_verifytime` datetime NOT NULL,
  `delivery_finishtime` datetime NOT NULL,
  `delivery_canceltime` datetime NOT NULL,
  `delivery_waittime` datetime DEFAULT NULL,
  `delivery_sendouttime` datetime DEFAULT NULL,
  `staff_id` varchar(20) DEFAULT NULL,
  `staff_name` varchar(30) DEFAULT NULL,
  `delivery_date` datetime NOT NULL,
  `isprint` tinyint(1) NOT NULL DEFAULT '0',
  `agent_confirmdate` datetime NOT NULL,
  `express_confirmdate` datetime NOT NULL,
  `postage` decimal(8,2) NOT NULL DEFAULT '0.00',
  `provider` tinyint(1) NOT NULL DEFAULT '0',
  `express_company` int(11) NOT NULL DEFAULT '0',
  `agency_suposed_credit` float NOT NULL,
  `agency_actual_credite` float NOT NULL,
  `agency_stuff_id` varchar(30) DEFAULT NULL,
  `agency_accept_id` varchar(30) DEFAULT NULL,
  `agency_stuff_name` varchar(30) DEFAULT NULL,
  `date_agency_credited` datetime NOT NULL,
  `member_history_id` int(8) unsigned NOT NULL DEFAULT '0',
  `isproblem` tinyint(1) NOT NULL DEFAULT '0',
  `problemtype` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

/*Table structure for table `gift_delivery_new_details` */

DROP TABLE IF EXISTS `gift_delivery_new_details`;

CREATE TABLE `gift_delivery_new_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `devno` varchar(55) NOT NULL,
  `devnote` varchar(255) DEFAULT NULL,
  `greeting_word` varchar(255) DEFAULT NULL,
  `additional` varchar(255) DEFAULT NULL,
  `cancel_remark` text,
  `remark` text,
  `agency_message` varchar(140) DEFAULT NULL,
  `remark_agency_credited` varchar(255) DEFAULT NULL,
  `modify_records` text,
  `modify_records_agency` text NOT NULL,
  `problemtxt` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

/*Table structure for table `gift_delivery_product` */

DROP TABLE IF EXISTS `gift_delivery_product`;

CREATE TABLE `gift_delivery_product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_code` varchar(20) DEFAULT NULL,
  `price` decimal(6,2) NOT NULL DEFAULT '0.00',
  `qty` int(11) NOT NULL DEFAULT '0',
  `devno` varchar(55) DEFAULT NULL,
  `creditsnum` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

/*Table structure for table `gift_item` */

DROP TABLE IF EXISTS `gift_item`;

CREATE TABLE `gift_item` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `category` tinyint(2) NOT NULL DEFAULT '0',
  `item_code` varchar(20) NOT NULL DEFAULT '',
  `item_name` varchar(100) NOT NULL DEFAULT '',
  `credits` int(3) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `price_show` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `n_price_s` decimal(6,2) NOT NULL DEFAULT '0.00',
  `n_price_m` decimal(6,2) NOT NULL DEFAULT '0.00',
  `n_price_l` decimal(6,2) NOT NULL DEFAULT '0.00',
  `h_price_s` decimal(6,2) NOT NULL DEFAULT '0.00',
  `h_price_m` decimal(6,2) NOT NULL DEFAULT '0.00',
  `h_price_l` decimal(6,2) NOT NULL DEFAULT '0.00',
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
  PRIMARY KEY (`id`),
  KEY `item_code` (`item_code`)
) ENGINE=MyISAM AUTO_INCREMENT=330 DEFAULT CHARSET=utf8;

/*Table structure for table `gift_item_new` */

DROP TABLE IF EXISTS `gift_item_new`;

CREATE TABLE `gift_item_new` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category` tinyint(1) NOT NULL DEFAULT '0',
  `item_code` varchar(20) NOT NULL,
  `item_name` varchar(100) DEFAULT NULL,
  `expresstype` tinyint(1) NOT NULL DEFAULT '0',
  `description` text,
  `price_show` tinyint(1) NOT NULL DEFAULT '0',
  `n_price_s` decimal(6,2) NOT NULL DEFAULT '0.00',
  `h_price_s` decimal(6,2) NOT NULL DEFAULT '0.00',
  `y_price_s` decimal(6,2) NOT NULL DEFAULT '0.00',
  `desc_s` varchar(255) DEFAULT NULL,
  `display` char(1) NOT NULL DEFAULT 'Y',
  `newcome` tinyint(1) NOT NULL DEFAULT '0',
  `paixu` int(11) NOT NULL DEFAULT '0',
  `remark` text,
  `agency_credit` float NOT NULL DEFAULT '0',
  `item_name_cn` varchar(255) DEFAULT NULL,
  `description_cn` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

/*Table structure for table `gift_order_createlist` */

DROP TABLE IF EXISTS `gift_order_createlist`;

CREATE TABLE `gift_order_createlist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `orderno` varchar(50) NOT NULL,
  `pclist` varchar(255) DEFAULT NULL,
  `remark` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

/*Table structure for table `gift_recommend` */

DROP TABLE IF EXISTS `gift_recommend`;

CREATE TABLE `gift_recommend` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `cpid` varchar(20) NOT NULL,
  `zone` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `recommend` char(1) NOT NULL DEFAULT 'N',
  `px` int(5) unsigned NOT NULL DEFAULT '0',
  `px2` int(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=412 DEFAULT CHARSET=utf8;

/*Table structure for table `gift_remind` */

DROP TABLE IF EXISTS `gift_remind`;

CREATE TABLE `gift_remind` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `devno` varchar(55) NOT NULL,
  `manid` varchar(20) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `ordertype` tinyint(1) NOT NULL,
  `receviced_date` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `staffid` varchar(15) NOT NULL,
  `adddate` datetime NOT NULL,
  `dismiss_date` datetime NOT NULL,
  `ip` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forsearch` (`manid`,`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Table structure for table `gss_acls` */

DROP TABLE IF EXISTS `gss_acls`;

CREATE TABLE `gss_acls` (
  `role_id` int(10) unsigned NOT NULL,
  `rule_id` int(10) unsigned NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `res_name` varchar(50) NOT NULL,
  `priv_name` varchar(32) NOT NULL,
  PRIMARY KEY (`role_id`,`rule_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ACL è®¿é—®æŽ§åˆ¶è¡¨';

/*Table structure for table `gss_menus` */

DROP TABLE IF EXISTS `gss_menus`;

CREATE TABLE `gss_menus` (
  `menu_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'èœå•ç¼–å·',
  `menu_name` varchar(50) NOT NULL COMMENT 'åç§°',
  `link_url` varchar(254) NOT NULL COMMENT 'é“¾æŽ¥',
  `order_by` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'æŽ’åº',
  `parent` smallint(5) unsigned NOT NULL COMMENT 'æ‰€å±žèœå•',
  PRIMARY KEY (`menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='èœå•å¯¼èˆªè¡¨';

/*Table structure for table `gss_modules` */

DROP TABLE IF EXISTS `gss_modules`;

CREATE TABLE `gss_modules` (
  `mod_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mod_name` varchar(50) NOT NULL,
  `mod_desc` varchar(200) NOT NULL,
  PRIMARY KEY (`mod_id`),
  UNIQUE KEY `mod_name` (`mod_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `gss_resources` */

DROP TABLE IF EXISTS `gss_resources`;

CREATE TABLE `gss_resources` (
  `res_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `res_name` varchar(50) NOT NULL COMMENT 'èµ„æºåç§°',
  `res_desc` varchar(200) NOT NULL COMMENT 'èµ„æºè¯´æ˜Ž',
  `res_order` tinyint(2) NOT NULL COMMENT 'èµ„æºæŽ’åº',
  PRIMARY KEY (`res_id`),
  UNIQUE KEY `mod_name` (`res_name`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='ACL èµ„æºè¡¨';

/*Table structure for table `gss_role_menus` */

DROP TABLE IF EXISTS `gss_role_menus`;

CREATE TABLE `gss_role_menus` (
  `role_id` int(10) unsigned NOT NULL COMMENT 'è§’è‰²ç¼–å·',
  `menu_id` int(10) unsigned NOT NULL COMMENT 'èœå•ç¼–å·',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `gss_roles` */

DROP TABLE IF EXISTS `gss_roles`;

CREATE TABLE `gss_roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ä¸»é”®',
  `role_name` varchar(50) NOT NULL COMMENT 'è§’è‰²åç§°',
  `role_desc` varchar(200) NOT NULL COMMENT 'è§’è‰²è¯´æ˜Ž',
  `order_by` smallint(6) NOT NULL DEFAULT '0' COMMENT 'æŽ’åº',
  `is_use` tinyint(1) NOT NULL DEFAULT '0',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'æ˜¯å¦é»˜è®¤è§’è‰²',
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='ACL æƒé™è§’è‰²è¡¨';

/*Table structure for table `gss_rules` */

DROP TABLE IF EXISTS `gss_rules`;

CREATE TABLE `gss_rules` (
  `rule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ä¸»é”®',
  `res_name` varchar(50) NOT NULL COMMENT 'èµ„æºåç§°',
  `priv_name` varchar(32) NOT NULL COMMENT 'æƒé™åç§°',
  `priv_explain` varchar(200) NOT NULL COMMENT 'è¯´æ˜Ž',
  `rule_order` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'æƒé™æŽ’åº',
  PRIMARY KEY (`rule_id`)
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COMMENT='ACL è§„åˆ™è¡¨';

/*Table structure for table `gss_user_roles` */

DROP TABLE IF EXISTS `gss_user_roles`;

CREATE TABLE `gss_user_roles` (
  `user_id` varchar(10) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`,`role_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `helpsys` */

DROP TABLE IF EXISTS `helpsys`;

CREATE TABLE `helpsys` (
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
) ENGINE=MyISAM AUTO_INCREMENT=10105 DEFAULT CHARSET=utf8;

/*Table structure for table `helpsys_20130123` */

DROP TABLE IF EXISTS `helpsys_20130123`;

CREATE TABLE `helpsys_20130123` (
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
) ENGINE=MyISAM AUTO_INCREMENT=10039 DEFAULT CHARSET=utf8;

/*Table structure for table `helpsys_history` */

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
) ENGINE=MyISAM AUTO_INCREMENT=10021 DEFAULT CHARSET=utf8;

/*Table structure for table `helpsys_history_lady` */

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
) ENGINE=MyISAM AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;

/*Table structure for table `helpsys_lady` */

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
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

/*Table structure for table `hotmember` */

DROP TABLE IF EXISTS `hotmember`;

CREATE TABLE `hotmember` (
  `memberid` varchar(15) NOT NULL,
  `mbtype` char(1) NOT NULL DEFAULT 'w',
  `agent` varchar(8) NOT NULL,
  `num` int(5) NOT NULL,
  `mw_num` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `wm_num` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `adddate` datetime NOT NULL,
  PRIMARY KEY (`memberid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `integral_relation` */

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
) ENGINE=MyISAM AUTO_INCREMENT=345 DEFAULT CHARSET=utf8;

/*Table structure for table `integral_statistics` */

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
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

/*Table structure for table `intent01` */

DROP TABLE IF EXISTS `intent01`;

CREATE TABLE `intent01` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `womanid` varchar(12) NOT NULL,
  `groupid` varchar(10) NOT NULL,
  `w_firstname` varchar(30) NOT NULL,
  `w_lastname` varchar(30) NOT NULL,
  `agentid` varchar(20) NOT NULL,
  `agent_staff` varchar(15) NOT NULL,
  `agent_name` varchar(50) NOT NULL,
  `manid` varchar(12) NOT NULL,
  `m_firstname` varchar(30) NOT NULL,
  `m_lastname` varchar(30) NOT NULL,
  `submit_date` datetime NOT NULL,
  `edit_date` datetime NOT NULL,
  `sent_date` datetime NOT NULL,
  `division_staff` varchar(20) NOT NULL,
  `division_name` varchar(30) NOT NULL,
  `read_date` datetime NOT NULL,
  `read_flag` varchar(1) NOT NULL DEFAULT 'N',
  `reply_flag` varchar(1) NOT NULL DEFAULT '0',
  `reply_id` varchar(16) NOT NULL,
  `letter_process` varchar(1) NOT NULL,
  `submit_area` varchar(1) NOT NULL,
  `send_flag` char(1) NOT NULL DEFAULT '1',
  `notpass_reason` varchar(1) NOT NULL,
  `material_jpg` char(1) NOT NULL DEFAULT '1',
  `material_video` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`,`manid`,`send_flag`,`agentid`,`groupid`,`agent_staff`,`division_staff`,`material_jpg`,`material_video`)
) ENGINE=MyISAM AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;

/*Table structure for table `intent02` */

DROP TABLE IF EXISTS `intent02`;

CREATE TABLE `intent02` (
  `id` int(11) unsigned NOT NULL,
  `body` text NOT NULL,
  `attachment` varchar(200) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `computerid` varchar(10) NOT NULL,
  `agent_remark` text NOT NULL,
  `division_remark` text NOT NULL,
  `logs` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `ip_to_country` */

DROP TABLE IF EXISTS `ip_to_country`;

CREATE TABLE `ip_to_country` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `ip_from` double(15,0) NOT NULL DEFAULT '0',
  `ip_to` double(15,0) NOT NULL DEFAULT '0',
  `code` varchar(10) NOT NULL DEFAULT '',
  `code2` char(3) NOT NULL DEFAULT '',
  `name` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ip_from` (`ip_from`,`ip_to`)
) ENGINE=MyISAM AUTO_INCREMENT=314825 DEFAULT CHARSET=utf8;

/*Table structure for table `ip_to_country_old` */

DROP TABLE IF EXISTS `ip_to_country_old`;

CREATE TABLE `ip_to_country_old` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `ip_from` double(15,0) NOT NULL DEFAULT '0',
  `ip_to` double(15,0) NOT NULL DEFAULT '0',
  `code` varchar(10) NOT NULL DEFAULT '',
  `code2` char(3) NOT NULL DEFAULT '',
  `name` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ip_from` (`ip_from`,`ip_to`)
) ENGINE=MyISAM AUTO_INCREMENT=111802 DEFAULT CHARSET=utf8;

/*Table structure for table `km` */

DROP TABLE IF EXISTS `km`;

CREATE TABLE `km` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '·ÖÀà±àºÅ',
  `pid` int(8) NOT NULL DEFAULT '0' COMMENT '¸¸·ÖÀà±àºÅ,×îÉÏµ¼·ÖÀà±àºÅ´Ë´¦Îª0',
  `child` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ÊÇ·ñÓÐ×ÓÀà',
  `path` varchar(100) NOT NULL COMMENT '·ÖÀàÂ·¾¶ÀàËÆÓÚ:0,2,5 ±íÃ÷ËûÊÇ·ÖÀà2ÏÂÃæµÄ·ÖÀà5µÄ×Ó·ÖÀà,ËûµÄ¸¸±àºÅÒ²ÊÇ5,¶ÔÓÚ¶¥µ¼µÄ·ÖÀà´Ë´¦Îª0',
  `title` varchar(200) NOT NULL COMMENT '·ÖÀàÃû³Æ',
  `content` text NOT NULL COMMENT '…¢¿¼´ð°¸',
  `summary` text NOT NULL COMMENT 'ÄÚÈÝ¸ÅÒª',
  `demand` text NOT NULL COMMENT 'ÄÐÊ¿ÐèÇó·ÖÎö',
  `scheme` text NOT NULL COMMENT '´¦Àí·½°¸',
  `advert` text NOT NULL COMMENT '´¦Àí×¢ÒâÊÂÏî',
  `author` varchar(30) NOT NULL COMMENT '×÷Õß',
  `addauthor` varchar(30) NOT NULL COMMENT 'Ìí¼ÓÕß',
  `number` varchar(10) NOT NULL,
  `addip` varchar(15) NOT NULL COMMENT 'Ìí¼ÓIP',
  `taxis` int(1) NOT NULL DEFAULT '1' COMMENT 'ÅÅÐò',
  `addtime` datetime NOT NULL,
  `edittime` datetime NOT NULL,
  `status` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `taxis` (`taxis`),
  KEY `title` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=11111131 DEFAULT CHARSET=utf8 COMMENT='²úÆ·ÀàÐÍ±í';

/*Table structure for table `km_attach` */

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
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

/*Table structure for table `livechat_friend` */

DROP TABLE IF EXISTS `livechat_friend`;

CREATE TABLE `livechat_friend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ownerid` varchar(20) NOT NULL,
  `friendid` varchar(20) NOT NULL,
  `adddate` datetime NOT NULL,
  `agentid` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ownerid` (`ownerid`,`friendid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Table structure for table `login_esltoagt` */

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
) ENGINE=MyISAM AUTO_INCREMENT=7724 DEFAULT CHARSET=utf8;

/*Table structure for table `lovecall_reward` */

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

/*Table structure for table `m_flight` */

DROP TABLE IF EXISTS `m_flight`;

CREATE TABLE `m_flight` (
  `f_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id` int(11) unsigned NOT NULL,
  `manid` char(30) NOT NULL,
  `type` char(1) NOT NULL,
  `flight_no` varchar(32) NOT NULL,
  `takeoff_date` datetime NOT NULL,
  `arrival_date` datetime NOT NULL,
  `takeoff_city` varchar(32) NOT NULL,
  `takeoff_port` varchar(32) NOT NULL,
  `arrival_city` varchar(10) NOT NULL,
  `arrival_port` varchar(10) NOT NULL,
  `otherinfo` varchar(64) NOT NULL,
  PRIMARY KEY (`f_id`),
  KEY `manid` (`manid`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Table structure for table `m_follow` */

DROP TABLE IF EXISTS `m_follow`;

CREATE TABLE `m_follow` (
  `fo_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id` int(11) unsigned NOT NULL,
  `type` char(1) NOT NULL,
  `sender` varchar(20) NOT NULL,
  `sendtime` datetime NOT NULL,
  `content` text NOT NULL,
  `isview` char(1) NOT NULL DEFAULT '0',
  `isdeleted` char(1) NOT NULL DEFAULT '0',
  `otherinfo` varchar(32) NOT NULL,
  PRIMARY KEY (`fo_id`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Table structure for table `m_hotel` */

DROP TABLE IF EXISTS `m_hotel`;

CREATE TABLE `m_hotel` (
  `h_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id` int(11) unsigned NOT NULL,
  `manid` char(30) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `address_en` varchar(255) NOT NULL,
  `in_date` datetime NOT NULL,
  `out_date` datetime NOT NULL,
  `otherinfo` varchar(64) NOT NULL,
  PRIMARY KEY (`h_id`),
  KEY `manid` (`manid`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `m_info` */

DROP TABLE IF EXISTS `m_info`;

CREATE TABLE `m_info` (
  `id` int(11) unsigned NOT NULL,
  `note_woman` text NOT NULL,
  `note_arrange` text NOT NULL,
  `bill_note_agency` text NOT NULL,
  `bill_note_cl` text NOT NULL,
  `gift_note` text NOT NULL,
  `note_cl` text NOT NULL,
  `note_agent` text NOT NULL,
  `woman2_id` varchar(12) NOT NULL,
  `woman2_info` varchar(100) NOT NULL,
  `gift_receive_date` datetime NOT NULL,
  `man_phone` varchar(32) NOT NULL,
  `woman_info` varchar(100) NOT NULL,
  `meet_place` text NOT NULL,
  `follow_service` varchar(100) NOT NULL,
  `pickuper` varchar(100) NOT NULL,
  `note_hotel` text NOT NULL,
  `note_flight` text NOT NULL,
  `note_hotel_man` text NOT NULL,
  `note_flight_man` text NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `m_main` */

DROP TABLE IF EXISTS `m_main`;

CREATE TABLE `m_main` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_no` char(12) NOT NULL,
  `order_no_main` varchar(30) NOT NULL,
  `manid` char(30) NOT NULL,
  `manname` varchar(40) NOT NULL,
  `agentid` varchar(6) NOT NULL,
  `agent_name_en` varchar(200) NOT NULL,
  `womanid` char(12) NOT NULL,
  `service` varchar(50) NOT NULL,
  `gift` varchar(30) NOT NULL,
  `meet_type` char(1) NOT NULL,
  `meet_date` datetime NOT NULL,
  `meet_date2` datetime NOT NULL,
  `arrive_date` datetime NOT NULL,
  `arrive_date2` datetime NOT NULL,
  `leave_date` datetime NOT NULL,
  `leave_date2` datetime NOT NULL,
  `hotel` char(1) NOT NULL,
  `flight` char(1) NOT NULL,
  `confirm_switch` char(1) NOT NULL,
  `confirm_otherinfo` varchar(64) NOT NULL,
  `bill_type` char(1) NOT NULL,
  `order_ip` varchar(32) NOT NULL,
  `order_date` datetime NOT NULL,
  `follow_order_staff` varchar(15) NOT NULL,
  `follow_order_info` varchar(32) NOT NULL,
  `follow_cl_staff` varchar(20) NOT NULL,
  `follow_cl` varchar(20) NOT NULL,
  `follow_msg_count` int(1) NOT NULL,
  `follow_msg_cl` int(1) NOT NULL DEFAULT '0',
  `follow_msg_agency` int(1) NOT NULL DEFAULT '0',
  `status` char(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_no` (`order_no`,`manid`,`womanid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Table structure for table `m_order_detail` */

DROP TABLE IF EXISTS `m_order_detail`;

CREATE TABLE `m_order_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_no` char(12) NOT NULL,
  `manid` char(30) NOT NULL,
  `manname` varchar(40) NOT NULL,
  `agentid` varchar(6) NOT NULL,
  `agent_name_en` varchar(200) NOT NULL,
  `womanid` char(12) NOT NULL,
  `woman_info` varchar(100) NOT NULL,
  `service` varchar(50) NOT NULL,
  `meet_type` char(1) NOT NULL,
  `meet_place` text NOT NULL,
  `meet_date` datetime NOT NULL,
  `bill_type` char(1) NOT NULL,
  `order_ip` varchar(32) NOT NULL,
  `order_date` datetime NOT NULL,
  `status` char(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_no` (`order_no`,`manid`,`womanid`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `m_service` */

DROP TABLE IF EXISTS `m_service`;

CREATE TABLE `m_service` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `serviceid` char(5) NOT NULL,
  `subject_cn` varchar(64) NOT NULL,
  `content_cn` text NOT NULL,
  `price` int(1) NOT NULL,
  `subject_en` varchar(100) NOT NULL,
  `content_en` text NOT NULL,
  `isvalid` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `serviceid` (`serviceid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Table structure for table `man2007stat` */

DROP TABLE IF EXISTS `man2007stat`;

CREATE TABLE `man2007stat` (
  `manid` char(12) NOT NULL,
  `order_num` int(8) NOT NULL DEFAULT '0',
  `submitdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `education` int(4) NOT NULL,
  `income` int(4) NOT NULL,
  `profession` varchar(60) NOT NULL,
  `step` char(1) NOT NULL DEFAULT '1',
  `age` int(6) DEFAULT NULL,
  `paidmb` int(1) NOT NULL DEFAULT '0',
  KEY `education` (`education`),
  KEY `income` (`income`),
  KEY `profession` (`profession`),
  KEY `paidmb` (`paidmb`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `man_cancel_payment` */

DROP TABLE IF EXISTS `man_cancel_payment`;

CREATE TABLE `man_cancel_payment` (
  `id` int(8) NOT NULL,
  `manid` char(20) NOT NULL,
  `q11` char(1) NOT NULL DEFAULT '0',
  `q12` char(1) NOT NULL DEFAULT '0',
  `q13` char(1) NOT NULL DEFAULT '0',
  `q14` char(1) NOT NULL DEFAULT '0',
  `q15` char(1) NOT NULL DEFAULT '0',
  `q16` char(1) NOT NULL DEFAULT '0',
  `q17` char(1) NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `q18` text NOT NULL,
  PRIMARY KEY (`manid`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `man_cancel_req` */

DROP TABLE IF EXISTS `man_cancel_req`;

CREATE TABLE `man_cancel_req` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `manid` varchar(20) NOT NULL,
  `manname` varchar(50) NOT NULL,
  `joindate` datetime NOT NULL,
  `reason` int(3) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `adddate` datetime NOT NULL,
  `other` text NOT NULL,
  `country` char(5) NOT NULL,
  `status` int(3) NOT NULL,
  `email` varchar(100) NOT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=2328 DEFAULT CHARSET=utf8;

/*Table structure for table `man_report_abuse` */

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
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

/*Table structure for table `man_survey` */

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
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

/*Table structure for table `man_temp` */

DROP TABLE IF EXISTS `man_temp`;

CREATE TABLE `man_temp` (
  `manid` varchar(15) NOT NULL,
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

/*Table structure for table `manfaqs_am` */

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
) ENGINE=MyISAM AUTO_INCREMENT=494 DEFAULT CHARSET=utf8;

/*Table structure for table `manfaqs_am_bak0714` */

DROP TABLE IF EXISTS `manfaqs_am_bak0714`;

CREATE TABLE `manfaqs_am_bak0714` (
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
) ENGINE=MyISAM AUTO_INCREMENT=230 DEFAULT CHARSET=utf8;

/*Table structure for table `manfaqs_am_bak1211` */

DROP TABLE IF EXISTS `manfaqs_am_bak1211`;

CREATE TABLE `manfaqs_am_bak1211` (
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
) ENGINE=MyISAM AUTO_INCREMENT=230 DEFAULT CHARSET=utf8;

/*Table structure for table `manfaqs_am_bak140811` */

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
) ENGINE=MyISAM AUTO_INCREMENT=472 DEFAULT CHARSET=utf8;

/*Table structure for table `manfaqs_am_bak20100121` */

DROP TABLE IF EXISTS `manfaqs_am_bak20100121`;

CREATE TABLE `manfaqs_am_bak20100121` (
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

/*Table structure for table `manfaqs_am_bak20121102` */

DROP TABLE IF EXISTS `manfaqs_am_bak20121102`;

CREATE TABLE `manfaqs_am_bak20121102` (
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
) ENGINE=MyISAM AUTO_INCREMENT=369 DEFAULT CHARSET=utf8;

/*Table structure for table `matchmaker_msg01_1m` */

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

/*Table structure for table `matchmaker_msg01_201103` */

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

/*Table structure for table `matchmaker_msg01_201104` */

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

/*Table structure for table `matchmaker_msg01_201105` */

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

/*Table structure for table `matchmaker_msg01_201106` */

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
) ENGINE=MyISAM AUTO_INCREMENT=3872137 DEFAULT CHARSET=utf8 COMMENT='admimier 201106';

/*Table structure for table `matchmaker_msg01_3m` */

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

/*Table structure for table `matchmaker_msg01_new` */

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
) ENGINE=MRG_MyISAM DEFAULT CHARSET=utf8 INSERT_METHOD=LAST UNION=(`matchmaker_msg01_unsend`,`matchmaker_msg01_201103`,`matchmaker_msg01_201104`,`matchmaker_msg01_201105`,`matchmaker_msg01_201106`);

/*Table structure for table `matchmaker_msg01_unsend` */

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
) ENGINE=MyISAM AUTO_INCREMENT=10428525 DEFAULT CHARSET=utf8;

/*Table structure for table `matchmaker_msg02_1m` */

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

/*Table structure for table `matchmaker_msg02_201103` */

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

/*Table structure for table `matchmaker_msg02_201104` */

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

/*Table structure for table `matchmaker_msg02_201105` */

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

/*Table structure for table `matchmaker_msg02_201106` */

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
) ENGINE=MyISAM AUTO_INCREMENT=3872137 DEFAULT CHARSET=utf8;

/*Table structure for table `matchmaker_msg02_3m` */

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

/*Table structure for table `matchmaker_msg02_new` */

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

/*Table structure for table `matchmaker_msg02_unsend` */

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
) ENGINE=MyISAM AUTO_INCREMENT=10428526 DEFAULT CHARSET=utf8;

/*Table structure for table `matchmaker_template` */

DROP TABLE IF EXISTS `matchmaker_template`;

CREATE TABLE `matchmaker_template` (
  `at_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `at_adddate` datetime NOT NULL,
  `at_editdate` datetime NOT NULL,
  `at_code` varchar(20) NOT NULL,
  `at_msgid` int(11) unsigned NOT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=158 DEFAULT CHARSET=utf8;

/*Table structure for table `mb_contact_history` */

DROP TABLE IF EXISTS `mb_contact_history`;

CREATE TABLE `mb_contact_history` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `member_id` varchar(20) NOT NULL,
  `mbtype` char(1) NOT NULL,
  `adddate` datetime NOT NULL,
  `lastupdate` datetime NOT NULL,
  `subject` varchar(150) NOT NULL,
  `message` text NOT NULL,
  `refid` varchar(20) NOT NULL,
  `reftype` char(5) NOT NULL,
  `creator` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `member_activity` */

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
) ENGINE=MyISAM AUTO_INCREMENT=311437 DEFAULT CHARSET=utf8;

/*Table structure for table `member_activity_exp` */

DROP TABLE IF EXISTS `member_activity_exp`;

CREATE TABLE `member_activity_exp` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ÒÑ¹ýÆÚµÄÄÐÊ¿»áÔ±ÏµÍ³Í¨Öª/´ÙÏú»î¶¯±í';

/*Table structure for table `member_stats` */

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

/*Table structure for table `member_zlje` */

DROP TABLE IF EXISTS `member_zlje`;

CREATE TABLE `member_zlje` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `country` char(2) NOT NULL,
  `adddate` date NOT NULL,
  `join_num` int(1) NOT NULL,
  `amount` float(8,2) NOT NULL,
  `paidmb` int(1) NOT NULL,
  `zlje` float(6,2) NOT NULL,
  `info` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=151 DEFAULT CHARSET=utf8;

/*Table structure for table `member_zlje_month` */

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
  `info` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `adddate` (`adddate`,`country`)
) ENGINE=MyISAM AUTO_INCREMENT=842 DEFAULT CHARSET=utf8;

/*Table structure for table `msg01` */

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
  `isshow_on_lady` tinyint(1) NOT NULL DEFAULT '2',
  `reply_by` tinyint(1) NOT NULL DEFAULT '0',
  `readflag_lady` char(1) NOT NULL DEFAULT '0',
  `simplebody` varchar(150) DEFAULT NULL,
  `is_collect` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `short_video` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `short_video_credit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sendfid` (`sendfid`),
  KEY `sendtid` (`sendtid`),
  KEY `agent` (`agent`),
  KEY `forreview` (`toflag`,`review_flag`,`review_level`,`adddate`),
  KEY `foremf` (`toflag`,`forward`,`sendflag`,`adddate`)
) ENGINE=MRG_MyISAM DEFAULT CHARSET=utf8 INSERT_METHOD=LAST UNION=(`msg01_2013`);

/*Table structure for table `msg01_2008` */

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
  `is_collect` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sendfid` (`sendfid`),
  KEY `sendtid` (`sendtid`),
  KEY `agent` (`agent`),
  KEY `forreview` (`toflag`,`review_flag`,`review_level`,`adddate`),
  KEY `foremf` (`toflag`,`forward`,`sendflag`,`adddate`)
) ENGINE=MyISAM AUTO_INCREMENT=2454221 DEFAULT CHARSET=utf8;

/*Table structure for table `msg01_2009` */

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
  `is_collect` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sendfid` (`sendfid`),
  KEY `sendtid` (`sendtid`),
  KEY `agent` (`agent`),
  KEY `forreview` (`toflag`,`review_flag`,`review_level`,`adddate`),
  KEY `foremf` (`toflag`,`forward`,`sendflag`,`adddate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `msg01_2009_new` */

DROP TABLE IF EXISTS `msg01_2009_new`;

CREATE TABLE `msg01_2009_new` (
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
  PRIMARY KEY (`id`),
  KEY `sendfid` (`sendfid`),
  KEY `sendtid` (`sendtid`),
  KEY `agent` (`agent`),
  KEY `forreview` (`toflag`,`review_flag`,`review_level`,`adddate`),
  KEY `foremf` (`toflag`,`forward`,`sendflag`,`adddate`)
) ENGINE=MyISAM AUTO_INCREMENT=7441965 DEFAULT CHARSET=utf8;

/*Table structure for table `msg01_2010` */

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
  `is_collect` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sendfid` (`sendfid`),
  KEY `sendtid` (`sendtid`),
  KEY `agent` (`agent`),
  KEY `forreview` (`toflag`,`review_flag`,`review_level`,`adddate`),
  KEY `foremf` (`toflag`,`forward`,`sendflag`,`adddate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `msg01_2011` */

DROP TABLE IF EXISTS `msg01_2011`;

CREATE TABLE `msg01_2011` (
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
  `isshow_on_lady` tinyint(1) NOT NULL DEFAULT '2',
  `reply_by` tinyint(1) NOT NULL DEFAULT '0',
  `readflag_lady` char(1) NOT NULL DEFAULT '0',
  `simplebody` varchar(150) DEFAULT NULL,
  `is_collect` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sendfid` (`sendfid`),
  KEY `sendtid` (`sendtid`),
  KEY `agent` (`agent`),
  KEY `forreview` (`toflag`,`review_flag`,`review_level`,`adddate`),
  KEY `foremf` (`toflag`,`forward`,`sendflag`,`adddate`)
) ENGINE=MyISAM AUTO_INCREMENT=7441965 DEFAULT CHARSET=utf8;

/*Table structure for table `msg01_2012` */

DROP TABLE IF EXISTS `msg01_2012`;

CREATE TABLE `msg01_2012` (
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
  `isshow_on_lady` tinyint(1) NOT NULL DEFAULT '2',
  `reply_by` tinyint(1) NOT NULL DEFAULT '0',
  `readflag_lady` char(1) NOT NULL DEFAULT '0',
  `simplebody` varchar(150) DEFAULT NULL,
  `is_collect` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sendfid` (`sendfid`),
  KEY `sendtid` (`sendtid`),
  KEY `agent` (`agent`),
  KEY `forreview` (`toflag`,`review_flag`,`review_level`,`adddate`),
  KEY `foremf` (`toflag`,`forward`,`sendflag`,`adddate`)
) ENGINE=MyISAM AUTO_INCREMENT=7455070 DEFAULT CHARSET=utf8;

/*Table structure for table `msg01_2013` */

DROP TABLE IF EXISTS `msg01_2013`;

CREATE TABLE `msg01_2013` (
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
  `isshow_on_lady` tinyint(1) NOT NULL DEFAULT '2',
  `reply_by` tinyint(1) NOT NULL DEFAULT '0',
  `readflag_lady` char(1) NOT NULL DEFAULT '0',
  `simplebody` varchar(150) DEFAULT NULL,
  `is_collect` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `short_video` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `short_video_credit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sendfid` (`sendfid`),
  KEY `sendtid` (`sendtid`),
  KEY `agent` (`agent`),
  KEY `forreview` (`toflag`,`review_flag`,`review_level`,`adddate`),
  KEY `foremf` (`toflag`,`forward`,`sendflag`,`adddate`)
) ENGINE=MyISAM AUTO_INCREMENT=19371135 DEFAULT CHARSET=utf8;

/*Table structure for table `msg01_all` */

DROP TABLE IF EXISTS `msg01_all`;

CREATE TABLE `msg01_all` (
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
  `isshow_on_lady` tinyint(1) NOT NULL DEFAULT '2',
  `reply_by` tinyint(1) NOT NULL DEFAULT '0',
  `readflag_lady` char(1) NOT NULL DEFAULT '0',
  `simplebody` varchar(150) DEFAULT NULL,
  `is_collect` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `short_video` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `short_video_credit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sendfid` (`sendfid`),
  KEY `sendtid` (`sendtid`),
  KEY `agent` (`agent`),
  KEY `forreview` (`toflag`,`review_flag`,`review_level`,`adddate`),
  KEY `foremf` (`toflag`,`forward`,`sendflag`,`adddate`)
) ENGINE=MRG_MyISAM DEFAULT CHARSET=utf8 INSERT_METHOD=LAST UNION=(`msg01_2013`);

/*Table structure for table `msg01_earlier` */

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
  `isshow_on_lady` tinyint(1) NOT NULL DEFAULT '2',
  `reply_by` tinyint(1) NOT NULL DEFAULT '0',
  `readflag_lady` char(1) NOT NULL DEFAULT '0',
  `simplebody` varchar(150) DEFAULT NULL,
  `is_collect` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sendfid` (`sendfid`),
  KEY `sendtid` (`sendtid`),
  KEY `agent` (`agent`),
  KEY `forreview` (`toflag`,`review_flag`,`review_level`,`adddate`),
  KEY `foremf` (`toflag`,`forward`,`sendflag`,`adddate`)
) ENGINE=MRG_MyISAM DEFAULT CHARSET=utf8 INSERT_METHOD=LAST UNION=(`msg01_2012`,`msg01_2011`);

/*Table structure for table `msg01_last7days` */

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
  PRIMARY KEY (`id`),
  KEY `wk_trans` (`wk_trans`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `msg01_old` */

DROP TABLE IF EXISTS `msg01_old`;

CREATE TABLE `msg01_old` (
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
  `isshow_on_lady` tinyint(1) NOT NULL DEFAULT '2',
  `reply_by` tinyint(1) NOT NULL DEFAULT '0',
  `readflag_lady` char(1) NOT NULL DEFAULT '0',
  `simplebody` varchar(150) DEFAULT NULL,
  `is_collect` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sendfid` (`sendfid`),
  KEY `sendtid` (`sendtid`),
  KEY `agent` (`agent`),
  KEY `forreview` (`toflag`,`review_flag`,`review_level`,`adddate`),
  KEY `foremf` (`toflag`,`forward`,`sendflag`,`adddate`)
) ENGINE=MRG_MyISAM DEFAULT CHARSET=utf8 INSERT_METHOD=LAST UNION=(`msg01_2012`);

/*Table structure for table `msg01_test` */

DROP TABLE IF EXISTS `msg01_test`;

CREATE TABLE `msg01_test` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id`),
  KEY `sendfid` (`sendfid`),
  KEY `sendtid` (`sendtid`),
  KEY `agent` (`agent`),
  KEY `forreview` (`toflag`,`review_flag`,`review_level`,`adddate`),
  KEY `foremf` (`toflag`,`forward`,`sendflag`,`adddate`)
) ENGINE=MyISAM AUTO_INCREMENT=311809 DEFAULT CHARSET=utf8;

/*Table structure for table `msg01_verify` */

DROP TABLE IF EXISTS `msg01_verify`;

CREATE TABLE `msg01_verify` (
  `id` bigint(10) NOT NULL DEFAULT '0',
  `ykf` char(1) NOT NULL DEFAULT '',
  `readflag` char(1) NOT NULL DEFAULT '0',
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ykf` (`ykf`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `msg02` */

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
) ENGINE=MRG_MyISAM DEFAULT CHARSET=utf8 INSERT_METHOD=LAST UNION=(`msg02_2013`);

/*Table structure for table `msg02_2008` */

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

/*Table structure for table `msg02_2009` */

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

/*Table structure for table `msg02_2009_new` */

DROP TABLE IF EXISTS `msg02_2009_new`;

CREATE TABLE `msg02_2009_new` (
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

/*Table structure for table `msg02_2010` */

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

/*Table structure for table `msg02_2011` */

DROP TABLE IF EXISTS `msg02_2011`;

CREATE TABLE `msg02_2011` (
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

/*Table structure for table `msg02_2012` */

DROP TABLE IF EXISTS `msg02_2012`;

CREATE TABLE `msg02_2012` (
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

/*Table structure for table `msg02_2013` */

DROP TABLE IF EXISTS `msg02_2013`;

CREATE TABLE `msg02_2013` (
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

/*Table structure for table `msg02_all` */

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
) ENGINE=MRG_MyISAM DEFAULT CHARSET=utf8 INSERT_METHOD=LAST UNION=(`msg02_2008`,`msg02_2009`,`msg02_2010`,`msg02_2011`,`msg02_2012`);

/*Table structure for table `msg02_earlier` */

DROP TABLE IF EXISTS `msg02_earlier`;

CREATE TABLE `msg02_earlier` (
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
) ENGINE=MRG_MyISAM DEFAULT CHARSET=utf8 INSERT_METHOD=LAST UNION=(`msg02_2012`,`msg02_2011`);

/*Table structure for table `msg02_old` */

DROP TABLE IF EXISTS `msg02_old`;

CREATE TABLE `msg02_old` (
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
) ENGINE=MRG_MyISAM DEFAULT CHARSET=utf8 INSERT_METHOD=LAST UNION=(`msg02_2008`,`msg02_2009`,`msg02_2010`);

/*Table structure for table `msg_lady_01` */

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
) ENGINE=MyISAM AUTO_INCREMENT=150 DEFAULT CHARSET=utf8;

/*Table structure for table `msg_lady_02` */

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

/*Table structure for table `my_addresslist` */

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
) ENGINE=MyISAM AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

/*Table structure for table `news_media` */

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
  `tag` varchar(300) NOT NULL,
  `is_recommend` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `subdate` (`subdate`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

/*Table structure for table `notify` */

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
  `tag` varchar(300) NOT NULL,
  `position` tinyint(1) NOT NULL DEFAULT '1',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `subdate` (`subdate`)
) ENGINE=MyISAM AUTO_INCREMENT=421 DEFAULT CHARSET=utf8;

/*Table structure for table `notify_bak140811` */

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
  `overviewtime` datetime NOT NULL,
  `visible` varchar(50) NOT NULL,
  `visibletype` varchar(300) NOT NULL,
  `n_image` varchar(200) NOT NULL,
  `w_image` varchar(200) NOT NULL,
  `index_image` varchar(200) NOT NULL,
  `tag` varchar(300) NOT NULL,
  `position` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `subdate` (`subdate`)
) ENGINE=MyISAM AUTO_INCREMENT=244 DEFAULT CHARSET=utf8;

/*Table structure for table `pageas` */

DROP TABLE IF EXISTS `pageas`;

CREATE TABLE `pageas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pageid` varchar(12) NOT NULL DEFAULT '',
  `pagename` varchar(40) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `other` varchar(255) NOT NULL DEFAULT '',
  `getvars` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pageid` (`pageid`)
) ENGINE=MyISAM AUTO_INCREMENT=68226 DEFAULT CHARSET=utf8;

/*Table structure for table `payback` */

DROP TABLE IF EXISTS `payback`;

CREATE TABLE `payback` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `agentid` varchar(10) NOT NULL,
  `xnid` int(5) unsigned NOT NULL DEFAULT '0',
  `paydate` date NOT NULL,
  `amount` decimal(9,2) NOT NULL,
  `refid` varchar(30) NOT NULL,
  `kind` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(150) NOT NULL,
  `comment` text NOT NULL,
  `receiver` varchar(100) NOT NULL,
  `staff_id` varchar(10) NOT NULL,
  `staff_name` varchar(30) NOT NULL,
  `addtime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

/*Table structure for table `payback_agent_year` */

DROP TABLE IF EXISTS `payback_agent_year`;

CREATE TABLE `payback_agent_year` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `agentid` varchar(10) NOT NULL,
  `yearidx` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  `pay_total` decimal(9,2) NOT NULL,
  `pay_finish` char(1) NOT NULL DEFAULT 'N',
  `is_curyear` char(1) NOT NULL DEFAULT 'N',
  `remark` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

/*Table structure for table `payback_sale` */

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
  `staff_id` varchar(10) NOT NULL,
  `staff_name` varchar(30) NOT NULL,
  `order_sdate` date NOT NULL,
  `order_edate` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payback_id` (`payback_id`)
) ENGINE=MyISAM AUTO_INCREMENT=413 DEFAULT CHARSET=utf8;

/*Table structure for table `paypalmb` */

DROP TABLE IF EXISTS `paypalmb`;

CREATE TABLE `paypalmb` (
  `manid` varchar(20) NOT NULL,
  PRIMARY KEY (`manid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `pc_man_game` */

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
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

/*Table structure for table `phone_invest` */

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
) ENGINE=MyISAM AUTO_INCREMENT=158 DEFAULT CHARSET=utf8;

/*Table structure for table `phone_invest_20140303` */

DROP TABLE IF EXISTS `phone_invest_20140303`;

CREATE TABLE `phone_invest_20140303` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `lx` smallint(1) NOT NULL DEFAULT '0',
  `recordid` varchar(20) NOT NULL DEFAULT '',
  `womanid` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT '',
  `phone` varchar(60) NOT NULL DEFAULT '',
  `staff` varchar(10) NOT NULL,
  `call_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `txt1` text NOT NULL,
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `agent` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

/*Table structure for table `private_album` */

DROP TABLE IF EXISTS `private_album`;

CREATE TABLE `private_album` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `agentid` varchar(10) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `album_name` varchar(50) NOT NULL,
  `album_desc` varchar(255) NOT NULL,
  `delflag` char(1) NOT NULL DEFAULT 'N',
  `addtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

/*Table structure for table `private_album_photo` */

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
  PRIMARY KEY (`id`),
  KEY `albumid` (`albumid`),
  KEY `womanid` (`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

/*Table structure for table `private_photo_agent_stats` */

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Table structure for table `private_photo_send` */

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
  KEY `send_time` (`send_time`),
  KEY `association_id` (`association_id`),
  KEY `agent_id` (`agent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4235 DEFAULT CHARSET=latin1;

/*Table structure for table `private_photo_send_free` */

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
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

/*Table structure for table `private_photo_total` */

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
) ENGINE=MyISAM AUTO_INCREMENT=394 DEFAULT CHARSET=utf8;

/*Table structure for table `private_short_video` */

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
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`,`agentid`),
  KEY `delete_flag` (`delete_flag`,`review_group`,`review_mode`,`review_flag`),
  KEY `edit_time` (`edit_time`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

/*Table structure for table `private_short_video_album` */

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
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`,`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Table structure for table `private_short_video_history` */

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
) ENGINE=MyISAM AUTO_INCREMENT=212 DEFAULT CHARSET=latin1;

/*Table structure for table `private_short_video_send` */

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
) ENGINE=MyISAM AUTO_INCREMENT=292 DEFAULT CHARSET=latin1;

/*Table structure for table `private_short_video_total` */

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
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Table structure for table `profile_view_history` */

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
) ENGINE=InnoDB AUTO_INCREMENT=11181 DEFAULT CHARSET=utf8;

/*Table structure for table `prom_linksite` */

DROP TABLE IF EXISTS `prom_linksite`;

CREATE TABLE `prom_linksite` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `website` char(1) NOT NULL,
  `category` tinyint(2) NOT NULL DEFAULT '1',
  `title` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `reciprocal_link` varchar(300) NOT NULL,
  `comment` varchar(600) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `submitdate` datetime NOT NULL,
  `status` char(1) NOT NULL,
  `ipaddress` varchar(15) NOT NULL,
  `sortdate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `submitdate` (`submitdate`),
  KEY `website` (`website`)
) ENGINE=MyISAM AUTO_INCREMENT=1183 DEFAULT CHARSET=utf8;

/*Table structure for table `prom_user` */

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
) ENGINE=MyISAM AUTO_INCREMENT=4930 DEFAULT CHARSET=utf8;

/*Table structure for table `questions` */

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

/*Table structure for table `quickmatch_lady` */

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

/*Table structure for table `related_topics` */

DROP TABLE IF EXISTS `related_topics`;

CREATE TABLE `related_topics` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` tinyint(1) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `rank` int(8) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Table structure for table `relation` */

DROP TABLE IF EXISTS `relation`;

CREATE TABLE `relation` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `manid` varchar(15) NOT NULL,
  `womanid` varchar(15) NOT NULL,
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
  `admire` int(10) NOT NULL,
  `livechat` int(4) NOT NULL,
  `lovecall` int(4) NOT NULL,
  `videodate` int(4) NOT NULL,
  `videoshow` int(4) NOT NULL DEFAULT '0',
  `integral` int(6) NOT NULL DEFAULT '0',
  `virtual_gifts` int(6) NOT NULL DEFAULT '0',
  `virtual_gifts_wm` int(6) NOT NULL DEFAULT '0',
  `virtual_gifts_mw` int(6) NOT NULL DEFAULT '0',
  `isshow` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`,`lastdate`),
  KEY `womanid` (`womanid`,`lastdate`)
) ENGINE=MyISAM AUTO_INCREMENT=177047 DEFAULT CHARSET=utf8;

/*Table structure for table `relation_20140326` */

DROP TABLE IF EXISTS `relation_20140326`;

CREATE TABLE `relation_20140326` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `manid` varchar(15) NOT NULL,
  `womanid` varchar(15) NOT NULL,
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
  `admire` int(10) NOT NULL,
  `livechat` int(4) NOT NULL,
  `lovecall` int(4) NOT NULL,
  `videodate` int(4) NOT NULL,
  `videoshow` int(4) NOT NULL DEFAULT '0',
  `integral` int(6) NOT NULL DEFAULT '0',
  `virtual_gifts` int(6) NOT NULL DEFAULT '0',
  `virtual_gifts_wm` int(6) NOT NULL DEFAULT '0',
  `virtual_gifts_mw` int(6) NOT NULL DEFAULT '0',
  `isshow` int(1) NOT NULL DEFAULT '1',
  `firstemfid` int(9) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`,`lastdate`),
  KEY `womanid` (`womanid`,`lastdate`)
) ENGINE=MyISAM AUTO_INCREMENT=171815 DEFAULT CHARSET=utf8;

/*Table structure for table `relation_videoshow` */

DROP TABLE IF EXISTS `relation_videoshow`;

CREATE TABLE `relation_videoshow` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `manid` varchar(15) NOT NULL DEFAULT '',
  `womanid` varchar(15) NOT NULL DEFAULT '',
  `agentid` varchar(10) NOT NULL DEFAULT '',
  `num` int(4) NOT NULL DEFAULT '0',
  `flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`,`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Table structure for table `search_request` */

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
  `agentid` varchar(10) NOT NULL,
  `staffid` varchar(40) NOT NULL,
  `sign` varchar(50) NOT NULL DEFAULT '',
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1915 DEFAULT CHARSET=utf8;

/*Table structure for table `sendtofriend` */

DROP TABLE IF EXISTS `sendtofriend`;

CREATE TABLE `sendtofriend` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `friendname` varchar(60) NOT NULL DEFAULT '',
  `friendmail` varchar(100) NOT NULL,
  `myname` varchar(60) NOT NULL DEFAULT '',
  `mymail` varchar(100) NOT NULL,
  `mailbody` text NOT NULL,
  `sendtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `member` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8503 DEFAULT CHARSET=utf8;

/*Table structure for table `sms_data` */

DROP TABLE IF EXISTS `sms_data`;

CREATE TABLE `sms_data` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL,
  `classify` tinyint(1) NOT NULL,
  `send_fname` varchar(30) NOT NULL,
  `send_ftel` varchar(15) NOT NULL,
  `send_tname` varchar(30) NOT NULL,
  `send_ttel` varchar(15) NOT NULL,
  `send_tid` varchar(20) NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `msg` varchar(500) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `adddate` datetime NOT NULL,
  `msgid` varchar(200) NOT NULL,
  `manlist` varchar(200) NOT NULL,
  `senddate` datetime NOT NULL,
  `retrynum` tinyint(1) NOT NULL,
  `expiredate` datetime NOT NULL,
  `other` varchar(300) NOT NULL,
  `verify_code` varchar(10) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `emfnum` int(11) NOT NULL,
  `step` tinyint(1) NOT NULL DEFAULT '0',
  `agentinfo` varchar(100) NOT NULL,
  `follower` varchar(30) NOT NULL,
  `channels` tinyint(1) NOT NULL,
  `sms_num` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `send_tid` (`send_tid`,`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;

/*Table structure for table `sms_pending` */

DROP TABLE IF EXISTS `sms_pending`;

CREATE TABLE `sms_pending` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `manname` varchar(35) NOT NULL,
  `manid` varchar(20) NOT NULL,
  `womanname` varchar(35) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `adddate` datetime NOT NULL,
  `msgid` int(8) NOT NULL,
  `cnname` varchar(30) NOT NULL,
  `follower` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `send_tid` (`agentid`,`womanid`),
  KEY `msgid` (`msgid`)
) ENGINE=MyISAM AUTO_INCREMENT=340 DEFAULT CHARSET=utf8;

/*Table structure for table `sp_agent` */

DROP TABLE IF EXISTS `sp_agent`;

CREATE TABLE `sp_agent` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `agent` varchar(10) NOT NULL,
  `chn_staff` varchar(50) NOT NULL DEFAULT '',
  `classify` tinyint(1) NOT NULL DEFAULT '0',
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `suggestion` text NOT NULL,
  `status` char(1) NOT NULL,
  `other` text NOT NULL,
  `womanid` varchar(20) NOT NULL DEFAULT '',
  `manid` varchar(20) NOT NULL DEFAULT '',
  `progress` text NOT NULL,
  `rpstatus` char(1) NOT NULL DEFAULT 'Y',
  `lastreply` int(8) NOT NULL DEFAULT '0',
  `agent_tel` varchar(50) NOT NULL DEFAULT '',
  `agent_contact` varchar(30) NOT NULL,
  `fb_type` tinyint(1) NOT NULL DEFAULT '0',
  `delflag` char(1) NOT NULL DEFAULT 'N',
  `visible` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `jianguan_id` varchar(10) NOT NULL,
  `jianguan_name` varchar(30) NOT NULL,
  `cstopic` varchar(20) NOT NULL,
  `anti_scam_id` varchar(25) NOT NULL,
  `remark` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5215 DEFAULT CHARSET=utf8;

/*Table structure for table `sp_email` */

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

/*Table structure for table `sp_feedback` */

DROP TABLE IF EXISTS `sp_feedback`;

CREATE TABLE `sp_feedback` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `ticketno` varchar(20) NOT NULL DEFAULT '',
  `agent` varchar(10) NOT NULL DEFAULT '',
  `fb_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `agent_staff` varchar(50) NOT NULL,
  `fb_text` text NOT NULL,
  `attachment_num` tinyint(2) NOT NULL DEFAULT '0',
  `other` varchar(100) NOT NULL DEFAULT '',
  `dflag` char(2) NOT NULL DEFAULT 'N',
  `replier_type` char(2) NOT NULL DEFAULT '1',
  `chn_staff` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticketno` (`ticketno`)
) ENGINE=MyISAM AUTO_INCREMENT=6388 DEFAULT CHARSET=utf8;

/*Table structure for table `sp_mailsample` */

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
) ENGINE=MyISAM AUTO_INCREMENT=537 DEFAULT CHARSET=utf8;

/*Table structure for table `ss_case_relevance` */

DROP TABLE IF EXISTS `ss_case_relevance`;

CREATE TABLE `ss_case_relevance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relevance_id` varchar(20) NOT NULL,
  `agent` varchar(15) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `woman_name` varchar(30) NOT NULL,
  `manid` varchar(20) NOT NULL,
  `man_name` varchar(40) NOT NULL,
  `siteid` tinyint(4) NOT NULL,
  `matchid` varchar(10) NOT NULL,
  `commentid` varchar(20) NOT NULL,
  `videoid` varchar(20) NOT NULL,
  `articleid` varchar(20) NOT NULL,
  `marrylifeid` varchar(20) NOT NULL,
  `is_close` tinyint(4) NOT NULL,
  `create_staff` varchar(30) NOT NULL,
  `update_staff` varchar(30) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

/*Table structure for table `ss_comments` */

DROP TABLE IF EXISTS `ss_comments`;

CREATE TABLE `ss_comments` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `commentid` varchar(20) NOT NULL DEFAULT '',
  `agent` varchar(15) NOT NULL DEFAULT '',
  `status` enum('E','V','H','D') NOT NULL DEFAULT 'E',
  `siteid` tinyint(4) NOT NULL,
  `from` tinyint(4) NOT NULL,
  `subject_en` varchar(255) NOT NULL DEFAULT '',
  `subject_cn` varchar(255) NOT NULL,
  `text_cn` text NOT NULL,
  `text_en` text NOT NULL,
  `staff` varchar(30) NOT NULL DEFAULT '',
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `paixu_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gender` enum('M','F') NOT NULL DEFAULT 'M',
  `memberid` varchar(20) NOT NULL DEFAULT '',
  `member_name` varchar(100) NOT NULL DEFAULT '',
  `womanid` varchar(100) NOT NULL,
  `woman_name` varchar(100) NOT NULL,
  `credits` int(4) NOT NULL DEFAULT '0',
  `credit_suggest` tinyint(4) NOT NULL,
  `postdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `remark` text NOT NULL,
  `agent_remark` text NOT NULL,
  `isfeatured` tinyint(1) NOT NULL DEFAULT '0',
  `ad_subject` varchar(100) NOT NULL,
  `ad_content` varchar(300) NOT NULL,
  `photonum` tinyint(4) NOT NULL,
  `originalnum` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=558 DEFAULT CHARSET=utf8;

/*Table structure for table `ss_comments_agency` */

DROP TABLE IF EXISTS `ss_comments_agency`;

CREATE TABLE `ss_comments_agency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commentid` varchar(20) NOT NULL,
  `agent` varchar(15) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `siteid` tinyint(4) NOT NULL,
  `from` tinyint(4) NOT NULL,
  `subject_en` varchar(255) NOT NULL,
  `subject_cn` varchar(255) NOT NULL,
  `text_cn` text NOT NULL,
  `text_en` text NOT NULL,
  `staff` varchar(30) NOT NULL,
  `adddate` datetime NOT NULL,
  `lastupdatedate` datetime NOT NULL,
  `verifydate` datetime NOT NULL,
  `ip` varchar(20) NOT NULL,
  `gender` enum('F','M') NOT NULL,
  `memberid` varchar(100) NOT NULL,
  `member_name` varchar(100) NOT NULL,
  `womanid` varchar(100) NOT NULL,
  `woman_name` varchar(100) NOT NULL,
  `remark` text NOT NULL,
  `agent_remark` text NOT NULL,
  `photonum` tinyint(4) NOT NULL,
  `originalnum` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2360 DEFAULT CHARSET=latin1;

/*Table structure for table `ss_comments_old` */

DROP TABLE IF EXISTS `ss_comments_old`;

CREATE TABLE `ss_comments_old` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `commentid` varchar(20) NOT NULL DEFAULT '',
  `agent` varchar(15) NOT NULL DEFAULT '',
  `status` enum('E','V','H') NOT NULL DEFAULT 'E',
  `subject_en` varchar(255) NOT NULL DEFAULT '',
  `text_cn` text NOT NULL,
  `text_en` text NOT NULL,
  `staff` varchar(30) NOT NULL DEFAULT '',
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `paixu_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gender` enum('M','F') NOT NULL DEFAULT 'M',
  `memberid` varchar(20) NOT NULL DEFAULT '',
  `member_name` varchar(100) NOT NULL DEFAULT '',
  `credits` int(4) NOT NULL DEFAULT '0',
  `postdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `remark` text NOT NULL,
  `isfeatured` tinyint(1) NOT NULL DEFAULT '0',
  `ad_subject` varchar(100) NOT NULL,
  `ad_content` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=497 DEFAULT CHARSET=utf8;

/*Table structure for table `ss_matches` */

DROP TABLE IF EXISTS `ss_matches`;

CREATE TABLE `ss_matches` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `matchid` varchar(10) NOT NULL DEFAULT '',
  `status` varchar(1) NOT NULL DEFAULT 'D',
  `onchnsite` char(1) NOT NULL DEFAULT 'N',
  `siteid` tinyint(4) NOT NULL,
  `from` tinyint(4) NOT NULL,
  `agent` varchar(10) NOT NULL DEFAULT '',
  `manid` varchar(20) NOT NULL DEFAULT '0',
  `man_name` varchar(40) NOT NULL DEFAULT '0',
  `man_city` varchar(20) NOT NULL DEFAULT '0',
  `man_country` varchar(20) NOT NULL DEFAULT '0',
  `man_joindate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastupdate` varchar(255) NOT NULL DEFAULT '',
  `womanid` varchar(20) NOT NULL DEFAULT '',
  `woman_name` varchar(30) NOT NULL,
  `woman_city` varchar(20) NOT NULL DEFAULT '',
  `woman_country` varchar(20) NOT NULL DEFAULT '',
  `first_contact` date NOT NULL DEFAULT '0000-00-00',
  `marriage_date` date NOT NULL DEFAULT '0000-00-00',
  `first_meet` date NOT NULL,
  `title_cn` varchar(600) NOT NULL,
  `text_cn` text NOT NULL,
  `title_en` varchar(600) NOT NULL,
  `text_en` text NOT NULL,
  `category` tinyint(4) NOT NULL,
  `use_service` varchar(30) NOT NULL,
  `is_featured` tinyint(4) NOT NULL,
  `staff` varchar(40) NOT NULL,
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip` varchar(15) NOT NULL,
  `paixu_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `credits` int(4) NOT NULL DEFAULT '0',
  `credit_suggest` tinyint(4) NOT NULL,
  `postdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `photonum` tinyint(4) NOT NULL,
  `relation_id` smallint(6) NOT NULL,
  `agency_remark` text NOT NULL,
  `remark` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `matchid` (`matchid`)
) ENGINE=MyISAM AUTO_INCREMENT=525 DEFAULT CHARSET=utf8;

/*Table structure for table `ss_matches_agency` */

DROP TABLE IF EXISTS `ss_matches_agency`;

CREATE TABLE `ss_matches_agency` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `matchid` varchar(10) NOT NULL,
  `siteid` tinyint(4) NOT NULL,
  `from` tinyint(4) NOT NULL,
  `agent` varchar(10) NOT NULL,
  `manid` varchar(20) NOT NULL,
  `man_name` varchar(40) NOT NULL,
  `man_city` varchar(20) NOT NULL,
  `man_country` varchar(20) NOT NULL,
  `man_joindate` datetime NOT NULL,
  `lastupdate` varchar(255) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `woman_name` varchar(30) NOT NULL,
  `woman_city` varchar(20) NOT NULL,
  `woman_country` varchar(20) NOT NULL,
  `first_contact` date NOT NULL,
  `first_meet` date NOT NULL,
  `marriage_date` date NOT NULL,
  `title_cn` varchar(600) NOT NULL,
  `text_cn` text NOT NULL,
  `title_en` varchar(600) NOT NULL,
  `text_en` text NOT NULL,
  `category` tinyint(4) NOT NULL,
  `use_service` varchar(30) NOT NULL,
  `staff` varchar(40) NOT NULL,
  `adddate` datetime NOT NULL,
  `lastupdatedate` datetime NOT NULL,
  `verifydate` datetime NOT NULL,
  `status` tinyint(4) NOT NULL,
  `photonum` tinyint(4) NOT NULL,
  `remark` text NOT NULL,
  `agency_remark` text NOT NULL,
  `ip` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=891 DEFAULT CHARSET=latin1;

/*Table structure for table `ss_matches_old` */

DROP TABLE IF EXISTS `ss_matches_old`;

CREATE TABLE `ss_matches_old` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `matchid` varchar(10) NOT NULL DEFAULT '',
  `status` varchar(1) NOT NULL DEFAULT 'D',
  `onchnsite` char(1) NOT NULL DEFAULT 'N',
  `agent` varchar(10) NOT NULL DEFAULT '',
  `manid` varchar(20) NOT NULL DEFAULT '0',
  `man_name` varchar(40) NOT NULL DEFAULT '0',
  `man_city` varchar(20) NOT NULL DEFAULT '0',
  `man_country` varchar(20) NOT NULL DEFAULT '0',
  `man_joindate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastupdate` varchar(255) NOT NULL DEFAULT '',
  `womanid` varchar(20) NOT NULL DEFAULT '',
  `woman_name` varchar(30) NOT NULL,
  `woman_city` varchar(20) NOT NULL DEFAULT '',
  `woman_country` varchar(20) NOT NULL DEFAULT '',
  `first_contact` date NOT NULL DEFAULT '0000-00-00',
  `marriage_date` date NOT NULL DEFAULT '0000-00-00',
  `text_cn` text NOT NULL,
  `text_en` text NOT NULL,
  `staff` varchar(40) NOT NULL,
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip` varchar(15) NOT NULL,
  `paixu_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `credits` int(4) NOT NULL DEFAULT '0',
  `postdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `remark` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `matchid` (`matchid`)
) ENGINE=MyISAM AUTO_INCREMENT=415 DEFAULT CHARSET=utf8;

/*Table structure for table `ss_videos` */

DROP TABLE IF EXISTS `ss_videos`;

CREATE TABLE `ss_videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `videoid` varchar(20) NOT NULL,
  `status` enum('E','V','D','H') NOT NULL DEFAULT 'E',
  `siteid` tinyint(4) NOT NULL,
  `agent` varchar(10) NOT NULL,
  `manid` varchar(20) NOT NULL,
  `man_name` varchar(40) NOT NULL,
  `man_city` varchar(20) NOT NULL,
  `man_country` varchar(20) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `woman_name` varchar(30) NOT NULL,
  `woman_city` varchar(20) NOT NULL,
  `woman_country` varchar(20) NOT NULL,
  `category` tinyint(4) NOT NULL,
  `relationtype` tinyint(4) NOT NULL,
  `marriage_date` date NOT NULL,
  `subject_intro` varchar(255) NOT NULL,
  `text_intro` text NOT NULL,
  `adddate` datetime NOT NULL,
  `postdate` datetime NOT NULL,
  `paixu_date` datetime NOT NULL,
  `ip` varchar(20) NOT NULL,
  `staff` varchar(30) NOT NULL,
  `originalvideo` varchar(200) NOT NULL,
  `ori_video_size` int(10) unsigned NOT NULL,
  `currentvideo` varchar(200) NOT NULL,
  `video_size` int(6) unsigned NOT NULL,
  `agent_remark` text NOT NULL,
  `remark` text NOT NULL,
  `credits` int(11) NOT NULL,
  `credit_suggest` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Table structure for table `ss_videos_agency` */

DROP TABLE IF EXISTS `ss_videos_agency`;

CREATE TABLE `ss_videos_agency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `videoid` varchar(20) NOT NULL,
  `agent` varchar(15) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `siteid` tinyint(4) NOT NULL,
  `manid` varchar(20) NOT NULL,
  `man_name` varchar(40) NOT NULL,
  `man_city` varchar(20) NOT NULL,
  `man_country` varchar(20) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `woman_name` varchar(30) NOT NULL,
  `woman_city` varchar(20) NOT NULL,
  `woman_country` varchar(20) NOT NULL,
  `category` tinyint(4) NOT NULL,
  `relationtype` tinyint(4) NOT NULL,
  `marriage_date` date NOT NULL,
  `video_name` varchar(100) NOT NULL,
  `video_size` int(6) unsigned NOT NULL,
  `subject_intro` varchar(255) NOT NULL,
  `text_intro` text NOT NULL,
  `agent_remark` text NOT NULL,
  `remark` text NOT NULL,
  `adddate` datetime NOT NULL,
  `verifydate` datetime NOT NULL,
  `lastupdatedate` datetime NOT NULL,
  `ip` varchar(20) NOT NULL,
  `staff` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

/*Table structure for table `staff_work_logs` */

DROP TABLE IF EXISTS `staff_work_logs`;

CREATE TABLE `staff_work_logs` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `log_date` date NOT NULL,
  `work_content` varchar(100) NOT NULL,
  `work_desc` varchar(2048) NOT NULL,
  `work_next` varchar(800) NOT NULL,
  `work_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `addtime` datetime NOT NULL,
  `lastupdate` datetime NOT NULL,
  `staff_id` varchar(10) NOT NULL,
  `staff_name` varchar(20) NOT NULL,
  `staff_enname` varchar(20) NOT NULL,
  `dept` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  KEY `dept` (`dept`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

/*Table structure for table `stat_order` */

DROP TABLE IF EXISTS `stat_order`;

CREATE TABLE `stat_order` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `manid` varchar(15) NOT NULL,
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `submitdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `days` int(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `tanabata` */

DROP TABLE IF EXISTS `tanabata`;

CREATE TABLE `tanabata` (
  `tid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` char(1) NOT NULL DEFAULT '1',
  `womanid` varchar(12) NOT NULL,
  `w_firstname` varchar(20) NOT NULL,
  `w_lastname` varchar(20) NOT NULL,
  `manid` varchar(12) NOT NULL,
  `m_firstname` varchar(30) NOT NULL,
  `m_lastname` varchar(30) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `addtime` datetime NOT NULL,
  PRIMARY KEY (`tid`),
  KEY `womanid` (`womanid`,`manid`)
) ENGINE=MyISAM AUTO_INCREMENT=127 DEFAULT CHARSET=utf8;

/*Table structure for table `tanabata_wishing` */

DROP TABLE IF EXISTS `tanabata_wishing`;

CREATE TABLE `tanabata_wishing` (
  `twi_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` char(1) NOT NULL DEFAULT '1',
  `manid` varchar(12) NOT NULL,
  `m_firstname` varchar(30) NOT NULL,
  `m_lastname` varchar(30) NOT NULL,
  `country` varchar(2) NOT NULL,
  `wishing_brief` char(1) NOT NULL,
  `wishing` text NOT NULL,
  `is_follow_up` char(1) NOT NULL DEFAULT '1',
  `follow_up_info` text NOT NULL,
  `remarks` text NOT NULL,
  `ip` varchar(50) NOT NULL,
  `addtime` datetime NOT NULL,
  `division_staff` varchar(20) NOT NULL,
  `division_name` varchar(30) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`twi_id`),
  KEY `manid` (`manid`,`status`)
) ENGINE=MyISAM AUTO_INCREMENT=166 DEFAULT CHARSET=utf8;

/*Table structure for table `tanabata_woman` */

DROP TABLE IF EXISTS `tanabata_woman`;

CREATE TABLE `tanabata_woman` (
  `tw_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` char(1) NOT NULL DEFAULT '1',
  `womanid` varchar(12) NOT NULL,
  `w_firstname` varchar(20) NOT NULL,
  `w_lastname` varchar(20) NOT NULL,
  `votes` int(1) unsigned NOT NULL DEFAULT '0',
  `endtime` datetime NOT NULL,
  `endmanid` varchar(12) NOT NULL,
  PRIMARY KEY (`tw_id`),
  KEY `womanid` (`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

/*Table structure for table `tc_authcall1` */

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
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

/*Table structure for table `tc_authcall2` */

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

/*Table structure for table `tc_authcall_history` */

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
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Table structure for table `tc_callform1` */

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
  `bonusflag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `formno` (`formno`),
  KEY `invflag` (`invflag`),
  KEY `bookingbjtime` (`bookingbjtime`),
  KEY `manid` (`manid`)
) ENGINE=MyISAM AUTO_INCREMENT=318 DEFAULT CHARSET=utf8;

/*Table structure for table `tc_callform2` */

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

/*Table structure for table `tc_callhistory` */

DROP TABLE IF EXISTS `tc_callhistory`;

CREATE TABLE `tc_callhistory` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `formno` varchar(20) NOT NULL,
  `callid` tinyint(1) NOT NULL DEFAULT '1',
  `dialno` varchar(20) NOT NULL,
  `authcode` char(6) NOT NULL,
  `bookingcode` varchar(10) NOT NULL,
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
  KEY `formno` (`formno`),
  KEY `agentid` (`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Table structure for table `tc_invrecord` */

DROP TABLE IF EXISTS `tc_invrecord`;

CREATE TABLE `tc_invrecord` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `invno` varchar(20) NOT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

/*Table structure for table `tc_privlist` */

DROP TABLE IF EXISTS `tc_privlist`;

CREATE TABLE `tc_privlist` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `privindex` tinyint(2) unsigned NOT NULL,
  `manid` varchar(15) NOT NULL,
  `relateid` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`),
  KEY `relateid` (`relateid`)
) ENGINE=MyISAM AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

/*Table structure for table `terms_updates` */

DROP TABLE IF EXISTS `terms_updates`;

CREATE TABLE `terms_updates` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `vdate` date NOT NULL,
  `subject` varchar(255) NOT NULL,
  `update_text` text NOT NULL,
  `reason` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Table structure for table `test` */

DROP TABLE IF EXISTS `test`;

CREATE TABLE `test` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `t` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `test_tab` */

DROP TABLE IF EXISTS `test_tab`;

CREATE TABLE `test_tab` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `val` varchar(500) NOT NULL,
  `strcode` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

/*Table structure for table `testagent` */

DROP TABLE IF EXISTS `testagent`;

CREATE TABLE `testagent` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `agentid` varchar(20) NOT NULL DEFAULT '',
  `company` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

/*Table structure for table `tips_advice_bak0714` */

DROP TABLE IF EXISTS `tips_advice_bak0714`;

CREATE TABLE `tips_advice_bak0714` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `category` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `paixu` int(5) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL,
  `sub_content` varchar(500) NOT NULL,
  `content` text NOT NULL,
  `imgnum` tinyint(1) NOT NULL DEFAULT '0',
  `forum_msgid` varchar(10) NOT NULL,
  `postdate` datetime NOT NULL,
  `sys_remark` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `paixu` (`paixu`),
  KEY `forlist` (`category`,`status`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Table structure for table `tips_advices` */

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
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

/*Table structure for table `tips_advices_bak091211` */

DROP TABLE IF EXISTS `tips_advices_bak091211`;

CREATE TABLE `tips_advices_bak091211` (
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
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Table structure for table `tips_advices_bak140811` */

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
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Table structure for table `tmp_woman_addr` */

DROP TABLE IF EXISTS `tmp_woman_addr`;

CREATE TABLE `tmp_woman_addr` (
  `womanid` varchar(20) NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `addr_en` varchar(400) NOT NULL,
  `addr_cn` varchar(255) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `province` varchar(30) NOT NULL,
  KEY `womanid` (`womanid`,`agentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `tmp_woman_addr2` */

DROP TABLE IF EXISTS `tmp_woman_addr2`;

CREATE TABLE `tmp_woman_addr2` (
  `womanid` varchar(20) NOT NULL,
  `addr_cn` varchar(255) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `province` varchar(30) NOT NULL,
  KEY `womanid` (`womanid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `tmp_woman_credit` */

DROP TABLE IF EXISTS `tmp_woman_credit`;

CREATE TABLE `tmp_woman_credit` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `womanid` varchar(12) NOT NULL,
  `agentid` varchar(6) NOT NULL,
  `birthday` date NOT NULL,
  `postdate` datetime NOT NULL,
  `credit_total` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `credit_emf` decimal(11,2) unsigned NOT NULL DEFAULT '0.00',
  `credit_chat` decimal(11,2) unsigned NOT NULL DEFAULT '0.00',
  `credit_gb` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `mb_num` int(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `tmp_woman_credit2` */

DROP TABLE IF EXISTS `tmp_woman_credit2`;

CREATE TABLE `tmp_woman_credit2` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `womanid` varchar(12) NOT NULL,
  `agentid` varchar(6) NOT NULL,
  `birthday` date NOT NULL,
  `postdate` datetime NOT NULL,
  `english` tinyint(1) DEFAULT NULL,
  `children` char(1) DEFAULT NULL,
  `marry` tinyint(1) DEFAULT NULL,
  `total_2008` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `emf_2008` decimal(11,2) unsigned NOT NULL DEFAULT '0.00',
  `chat_2008` decimal(11,2) unsigned NOT NULL DEFAULT '0.00',
  `gb_2008` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `mb_2008` int(5) unsigned NOT NULL DEFAULT '0',
  `total_2009` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `emf_2009` decimal(11,2) unsigned NOT NULL DEFAULT '0.00',
  `chat_2009` decimal(11,2) unsigned NOT NULL DEFAULT '0.00',
  `gb_2009` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `mb_2009` int(5) unsigned NOT NULL DEFAULT '0',
  `total_2010` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `emf_2010` decimal(11,2) unsigned NOT NULL DEFAULT '0.00',
  `chat_2010` decimal(11,2) unsigned NOT NULL DEFAULT '0.00',
  `gb_2010` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `mb_2010` int(5) unsigned NOT NULL DEFAULT '0',
  `total_2011` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `emf_2011` decimal(11,2) unsigned NOT NULL DEFAULT '0.00',
  `chat_2011` decimal(11,2) unsigned NOT NULL DEFAULT '0.00',
  `gb_2011` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `mb_2011` int(5) unsigned NOT NULL DEFAULT '0',
  `total_2012` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `emf_2012` decimal(11,2) unsigned NOT NULL DEFAULT '0.00',
  `chat_2012` decimal(11,2) unsigned NOT NULL DEFAULT '0.00',
  `gb_2012` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `mb_2012` int(5) unsigned NOT NULL DEFAULT '0',
  `total_2013` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `emf_2013` decimal(11,2) unsigned NOT NULL DEFAULT '0.00',
  `chat_2013` decimal(11,2) unsigned NOT NULL DEFAULT '0.00',
  `gb_2013` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `mb_2013` int(5) unsigned NOT NULL DEFAULT '0',
  `total_2014` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `emf_2014` decimal(11,2) unsigned NOT NULL DEFAULT '0.00',
  `chat_2014` decimal(11,2) unsigned NOT NULL DEFAULT '0.00',
  `gb_2014` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `mb_2014` int(5) unsigned NOT NULL DEFAULT '0',
  `total_2014_7` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `emf_2014_7` decimal(11,2) unsigned NOT NULL DEFAULT '0.00',
  `chat_2014_7` decimal(11,2) unsigned NOT NULL DEFAULT '0.00',
  `gb_2014_7` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `mb_2014_7` int(5) unsigned NOT NULL DEFAULT '0',
  `total_2015_7` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `emf_2015_7` decimal(11,2) unsigned NOT NULL DEFAULT '0.00',
  `chat_2015_7` decimal(11,2) unsigned NOT NULL DEFAULT '0.00',
  `gb_2015_7` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `mb_2015_7` int(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `translation_mail` */

DROP TABLE IF EXISTS `translation_mail`;

CREATE TABLE `translation_mail` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `sendtid` varchar(15) NOT NULL,
  `sendfid` varchar(15) NOT NULL,
  `agent` varchar(10) NOT NULL,
  `cnbody` text NOT NULL,
  `enbody` text NOT NULL,
  `submitdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `senddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sendflag` char(1) NOT NULL,
  `mail_type` char(1) NOT NULL,
  `reply_mail_id` int(8) DEFAULT '0',
  `msgid` int(8) DEFAULT '0',
  `translator` varchar(10) NOT NULL,
  `wk_trans` varchar(10) NOT NULL DEFAULT '0',
  `rmethod` char(2) NOT NULL,
  `comment` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(15) NOT NULL,
  `computerid` varchar(8) NOT NULL DEFAULT '',
  `lady_tel` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `sendtid` (`sendtid`),
  KEY `sendfid` (`sendfid`)
) ENGINE=MyISAM AUTO_INCREMENT=4474 DEFAULT CHARSET=utf8;

/*Table structure for table `translator` */

DROP TABLE IF EXISTS `translator`;

CREATE TABLE `translator` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `authorid` varchar(12) NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `cnname` varchar(50) NOT NULL,
  `enname` varchar(50) NOT NULL,
  `lastname_en` varchar(35) NOT NULL,
  `gender` char(1) NOT NULL DEFAULT 'F',
  `birthday` varchar(20) NOT NULL,
  `telephone` varchar(100) NOT NULL DEFAULT '',
  `mobile` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(150) NOT NULL DEFAULT '',
  `profession` varchar(60) NOT NULL,
  `education` varchar(50) NOT NULL,
  `school` varchar(150) NOT NULL DEFAULT '',
  `wk_contact` char(1) NOT NULL DEFAULT 'N',
  `wk_trans` char(1) NOT NULL DEFAULT 'N',
  `inuse` char(1) NOT NULL DEFAULT 'N',
  `comment` varchar(255) NOT NULL DEFAULT '',
  `staff_id` varchar(15) NOT NULL,
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
  `account_examine` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ÍøÉÏÎÞ¸Ã×Ö¶Î',
  `account_comm` varchar(500) NOT NULL COMMENT 'ÍøÉÏÎÞ¸Ã×Ö¶Î',
  `addtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `delete_style_id` tinyint(1) NOT NULL DEFAULT '0',
  `delete_cw` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `delete_guanlian` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `super_admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `delete_admirer_review` tinyint(1) NOT NULL DEFAULT '0',
  `delete_cupid_review` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `job` varchar(20) NOT NULL,
  `update_history` text NOT NULL,
  `dept` tinyint(2) NOT NULL,
  `max_bind` tinyint(2) NOT NULL DEFAULT '1',
  `only_local_login` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  KEY `agentid` (`authorid`,`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=3844 DEFAULT CHARSET=utf8 COMMENT='Agent Translator ';

/*Table structure for table `translator_assess` */

DROP TABLE IF EXISTS `translator_assess`;

CREATE TABLE `translator_assess` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `staffid` varchar(10) NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `examine_num` tinyint(1) NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `assess_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `staffid` (`staffid`,`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Table structure for table `translator_demo` */

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

/*Table structure for table `translator_livechat` */

DROP TABLE IF EXISTS `translator_livechat`;

CREATE TABLE `translator_livechat` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `agentid` varchar(10) NOT NULL DEFAULT '',
  `cnname` varchar(50) NOT NULL DEFAULT '',
  `firstname_cn` varchar(30) NOT NULL,
  `lastname_cn` varchar(30) NOT NULL,
  `enname` varchar(50) NOT NULL DEFAULT '',
  `lastname_en` varchar(30) NOT NULL,
  `gender` char(1) NOT NULL DEFAULT 'F',
  `birthday` varchar(20) NOT NULL DEFAULT '',
  `telephone` varchar(100) NOT NULL DEFAULT '',
  `mobile` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(150) NOT NULL DEFAULT '',
  `profession` varchar(60) NOT NULL DEFAULT '',
  `education` varchar(50) NOT NULL DEFAULT '',
  `school` varchar(150) NOT NULL DEFAULT '',
  `inuse` char(1) NOT NULL DEFAULT 'N',
  `comment` varchar(255) NOT NULL DEFAULT '',
  `staff_id` varchar(10) NOT NULL DEFAULT '',
  `idcard` varchar(18) NOT NULL DEFAULT '',
  `position` enum('Y','N') NOT NULL DEFAULT 'N',
  `indate` date NOT NULL DEFAULT '0000-00-00',
  `outdate` date NOT NULL DEFAULT '0000-00-00',
  `passwd` varchar(20) NOT NULL DEFAULT '',
  `yingji` enum('Y','N') NOT NULL DEFAULT 'N',
  `idcard_received` enum('Y','N') NOT NULL DEFAULT 'N',
  `login_times` int(8) NOT NULL DEFAULT '0',
  `last_login` datetime NOT NULL,
  `red_addr` varchar(255) NOT NULL DEFAULT '',
  `oicq` varchar(20) NOT NULL DEFAULT '',
  `inuse2` char(2) NOT NULL DEFAULT 'N',
  `idcard_flag` char(1) NOT NULL DEFAULT 'N',
  `account_level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `addtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `style_id` tinyint(1) NOT NULL DEFAULT '0',
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `job` varchar(20) NOT NULL DEFAULT '',
  `update_history` text NOT NULL,
  `dept` tinyint(2) NOT NULL,
  `max_bind` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`),
  KEY `staff_id` (`staff_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Agent Translator for livechat';

/*Table structure for table `translator_paper` */

DROP TABLE IF EXISTS `translator_paper`;

CREATE TABLE `translator_paper` (
  `number` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `property` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `inuse` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`number`)
) ENGINE=MyISAM AUTO_INCREMENT=1020 DEFAULT CHARSET=utf8;

/*Table structure for table `translator_priv` */

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
) ENGINE=MyISAM AUTO_INCREMENT=2733 DEFAULT CHARSET=utf8;

/*Table structure for table `translator_priv_demo` */

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

/*Table structure for table `translator_work_stats` */

DROP TABLE IF EXISTS `translator_work_stats`;

CREATE TABLE `translator_work_stats` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` varchar(10) NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `stats_month` date NOT NULL,
  `emf_reply` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`,`agentid`,`stats_month`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Table structure for table `virtual_background` */

DROP TABLE IF EXISTS `virtual_background`;

CREATE TABLE `virtual_background` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `small_picture` varchar(100) NOT NULL,
  `big_picture` varchar(100) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Table structure for table `virtual_class` */

DROP TABLE IF EXISTS `virtual_class`;

CREATE TABLE `virtual_class` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(36) NOT NULL,
  `sequence` int(10) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  `mode` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Table structure for table `virtual_gift_man` */

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
  PRIMARY KEY (`id`),
  KEY `vgm_id` (`vgm_id`),
  KEY `manid` (`manid`),
  KEY `womanid` (`womanid`),
  KEY `agent_id` (`agent_id`,`send_mode`,`agent_follow_staff`)
) ENGINE=MyISAM AUTO_INCREMENT=841 DEFAULT CHARSET=utf8;

/*Table structure for table `virtual_gift_woman` */

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
  `agent_name` varchar(30) NOT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;

/*Table structure for table `virtual_gifts` */

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
  UNIQUE KEY `vg_id` (`vg_id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

/*Table structure for table `virtual_gifts_stat_by_agent` */

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
) ENGINE=MyISAM AUTO_INCREMENT=115190 DEFAULT CHARSET=utf8;

/*Table structure for table `weekly_man` */

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
) ENGINE=MyISAM AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;

/*Table structure for table `weekly_stats_by_lady` */

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

/*Table structure for table `weekly_update` */

DROP TABLE IF EXISTS `weekly_update`;

CREATE TABLE `weekly_update` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `sdate` date NOT NULL DEFAULT '0000-00-00',
  `edate` date NOT NULL DEFAULT '0000-00-00',
  `status` char(1) NOT NULL,
  `sendtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `start` int(8) NOT NULL DEFAULT '0',
  `total` int(8) NOT NULL DEFAULT '0',
  `progress` char(1) NOT NULL DEFAULT 'N',
  `endtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `woman` tinyint(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Table structure for table `weekly_woman` */

DROP TABLE IF EXISTS `weekly_woman`;

CREATE TABLE `weekly_woman` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `womanid` varchar(20) NOT NULL DEFAULT '',
  `firstname` varchar(60) NOT NULL,
  `lastname` varchar(60) NOT NULL,
  `country` varchar(100) NOT NULL DEFAULT '',
  `province` varchar(50) NOT NULL DEFAULT '',
  `city` varchar(50) NOT NULL DEFAULT '',
  `age` tinyint(2) NOT NULL DEFAULT '0',
  `marry` tinyint(1) NOT NULL DEFAULT '0',
  `children` char(1) NOT NULL DEFAULT '',
  `education` tinyint(1) NOT NULL DEFAULT '0',
  `owner` varchar(10) NOT NULL,
  `weight` int(3) NOT NULL,
  `height` int(3) NOT NULL,
  `postdate` date NOT NULL,
  `jj` varchar(350) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=43722 DEFAULT CHARSET=utf8;

/*Table structure for table `woman` */

DROP TABLE IF EXISTS `woman`;

CREATE TABLE `woman` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `womanid` varchar(12) NOT NULL DEFAULT '',
  `owner` varchar(6) NOT NULL DEFAULT '',
  `submitdate` date NOT NULL DEFAULT '0000-00-00',
  `submit_audit_time` datetime NOT NULL,
  `postdate` datetime DEFAULT NULL,
  `status1` char(1) DEFAULT '1',
  `status2` char(1) DEFAULT '1',
  `firstname` varchar(20) DEFAULT NULL,
  `lastname` varchar(20) DEFAULT NULL,
  `idcard_enname` varchar(50) NOT NULL,
  `country` varchar(100) DEFAULT NULL,
  `province` varchar(50) NOT NULL DEFAULT '',
  `submit_by` varchar(40) NOT NULL,
  `city` varchar(50) NOT NULL DEFAULT '',
  `birthday` date DEFAULT NULL,
  `height` int(3) DEFAULT NULL,
  `weight` int(3) DEFAULT NULL,
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
  `postaddr` tinyint(1) DEFAULT '1',
  `lovecall` tinyint(1) DEFAULT NULL,
  `lovecall_instant` tinyint(1) NOT NULL DEFAULT '0',
  `lovecall_instant2` tinyint(1) NOT NULL DEFAULT '1',
  `gift_flower` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `gift_flower2` tinyint(1) unsigned NOT NULL DEFAULT '1',
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
  `pr_auditflag` tinyint(1) NOT NULL DEFAULT '0',
  `qa_auditflag` tinyint(1) NOT NULL DEFAULT '0',
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
  `follower` varchar(30) NOT NULL,
  `follower_staffid` varchar(10) NOT NULL,
  `groupid` varchar(10) NOT NULL,
  `zodiac` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT 'ÐÇ×ù',
  `problem` tinyint(1) NOT NULL DEFAULT '0',
  `smsflag` tinyint(1) NOT NULL DEFAULT '0',
  `sms_verify` tinyint(1) NOT NULL DEFAULT '0',
  `template` int(4) NOT NULL DEFAULT '0',
  `keyword` varchar(30) NOT NULL COMMENT 'å¥³å£«ä¼šå‘˜å…³é”®è¯',
  `keyword_d` varchar(30) NOT NULL COMMENT 'å¥³å£«ä¼šå‘˜DESC',
  `lastlogin` datetime NOT NULL,
  `loginnum` int(6) NOT NULL,
  `lc_staffname` varchar(30) NOT NULL,
  `lc_staffid` varchar(10) NOT NULL,
  `lc_lang` varchar(5) NOT NULL DEFAULT 'zh',
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
  `fromid` varchar(10) NOT NULL DEFAULT '',
  `additional_lang` varchar(12) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`),
  KEY `submitdate` (`submitdate`),
  KEY `postdate` (`postdate`),
  KEY `owner` (`owner`),
  KEY `status1` (`status1`,`deleted`),
  KEY `zodiac` (`zodiac`),
  KEY `groupid` (`groupid`)
) ENGINE=MyISAM AUTO_INCREMENT=48755 DEFAULT CHARSET=utf8;

/*Table structure for table `woman_addressbook` */

DROP TABLE IF EXISTS `woman_addressbook`;

CREATE TABLE `woman_addressbook` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `agentid` varchar(20) DEFAULT NULL,
  `womanid` varchar(20) DEFAULT NULL,
  `woman_name` varchar(30) DEFAULT NULL,
  `woman_cnname` varchar(30) DEFAULT NULL,
  `woman_addr` varchar(800) DEFAULT NULL,
  `lastusedtime` datetime NOT NULL,
  `addtime` datetime NOT NULL,
  `isedit` tinyint(1) NOT NULL DEFAULT '1',
  `isdefault` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

/*Table structure for table `woman_album` */

DROP TABLE IF EXISTS `woman_album`;

CREATE TABLE `woman_album` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `agentid` varchar(10) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `album_name` varchar(50) NOT NULL,
  `album_desc` varchar(255) NOT NULL,
  `delflag` char(1) NOT NULL DEFAULT 'N',
  `addtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=75052 DEFAULT CHARSET=utf8;

/*Table structure for table `woman_album_demo` */

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

/*Table structure for table `woman_album_photo` */

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
  `review_group` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `logtxt` varchar(400) NOT NULL,
  `review_flag` char(1) NOT NULL DEFAULT 'P',
  `agent_upload_staffid` varchar(10) NOT NULL,
  `reviewed_staff` varchar(50) NOT NULL,
  `reviewed_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `albumid` (`albumid`),
  KEY `womanid` (`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=1033895 DEFAULT CHARSET=utf8;

/*Table structure for table `woman_album_photo_demo` */

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

/*Table structure for table `woman_album_photo_review` */

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
) ENGINE=MyISAM AUTO_INCREMENT=1616956 DEFAULT CHARSET=utf8;

/*Table structure for table `woman_batch_hidden` */

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
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Table structure for table `woman_birthday` */

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

/*Table structure for table `woman_black` */

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
) ENGINE=MyISAM AUTO_INCREMENT=1380 DEFAULT CHARSET=utf8;

/*Table structure for table `woman_choose_mate` */

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
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Table structure for table `woman_demo` */

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

/*Table structure for table `woman_group` */

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
) ENGINE=MyISAM AUTO_INCREMENT=2626 DEFAULT CHARSET=utf8;

/*Table structure for table `woman_group_demo` */

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

/*Table structure for table `woman_group_task` */

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
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Table structure for table `woman_id` */

DROP TABLE IF EXISTS `woman_id`;

CREATE TABLE `woman_id` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `womanid` varchar(20) NOT NULL,
  `agentid` varchar(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42043 DEFAULT CHARSET=utf8;

/*Table structure for table `woman_info` */

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
  `pending_s_time` datetime NOT NULL,
  `pending_e_time` datetime NOT NULL,
  `hidden_time` datetime NOT NULL,
  `delete_time` datetime NOT NULL,
  PRIMARY KEY (`womanid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `woman_info_demo` */

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

/*Table structure for table `woman_lovecall` */

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
  `womanphone_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `womanphone_ac` varchar(4) NOT NULL,
  `womanphone` varchar(50) NOT NULL,
  `lady_no` varchar(30) NOT NULL,
  `transphone_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `transphone_ac` varchar(4) NOT NULL,
  `transphone` varchar(50) NOT NULL,
  `trans_no` varchar(30) NOT NULL,
  `logtxt` text NOT NULL,
  `tmp_gmt` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`,`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Table structure for table `woman_multiple_search` */

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
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

/*Table structure for table `woman_net` */

DROP TABLE IF EXISTS `woman_net`;

CREATE TABLE `woman_net` (
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
  `submit_by` varchar(20) DEFAULT NULL,
  `city` varchar(50) NOT NULL DEFAULT '',
  `birthday` date DEFAULT NULL,
  `height` int(4) DEFAULT NULL,
  `weight` int(4) DEFAULT NULL,
  `smoke` tinyint(4) DEFAULT NULL,
  `drink` tinyint(4) DEFAULT NULL,
  `english` tinyint(4) DEFAULT NULL,
  `religion` tinyint(4) DEFAULT NULL,
  `children` char(1) DEFAULT NULL,
  `education` tinyint(4) DEFAULT NULL,
  `profession` tinyint(4) DEFAULT NULL,
  `marry` tinyint(4) DEFAULT NULL,
  `remark` text,
  `jj_en` text,
  `jj_cn` text,
  `addr_en` varchar(254) DEFAULT NULL,
  `addr_cn` varchar(254) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `emailforward` tinyint(4) DEFAULT NULL,
  `postaddr` tinyint(4) DEFAULT '1',
  `lovecall` tinyint(4) DEFAULT NULL,
  `cnname` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `idcard` varchar(20) DEFAULT NULL,
  `homephone` varchar(50) DEFAULT NULL,
  `offphone` varchar(50) DEFAULT NULL,
  `callphone` varchar(50) DEFAULT NULL,
  `cool` char(1) NOT NULL DEFAULT '0',
  `deleted` char(1) NOT NULL DEFAULT '0',
  `publish_home_tel` char(1) NOT NULL DEFAULT 'Y',
  `publish_office_tel` char(1) NOT NULL DEFAULT 'Y',
  `publish_mobile_tel` char(1) NOT NULL DEFAULT 'Y',
  `publish_email` char(1) NOT NULL DEFAULT 'Y',
  `apptable` char(1) NOT NULL DEFAULT 'N',
  `auditflag` char(2) NOT NULL DEFAULT '0',
  `photo_flag` char(2) NOT NULL DEFAULT 'N',
  `idcard_flag` char(2) NOT NULL DEFAULT 'N',
  `black` char(2) NOT NULL DEFAULT 'N',
  `comment` text NOT NULL,
  `hidden_reason` text NOT NULL,
  `chn_remark` text NOT NULL,
  `last_update` datetime DEFAULT NULL,
  `post_emf_note` varchar(50) NOT NULL DEFAULT '',
  `home_addr` varchar(254) NOT NULL DEFAULT '',
  `home_postcode` varchar(10) NOT NULL DEFAULT '',
  `video_flag` tinyint(1) NOT NULL DEFAULT '0',
  `cupid_flag` char(1) NOT NULL DEFAULT 'Y',
  `man_age1` year(4) NOT NULL,
  `man_age2` year(4) NOT NULL,
  `follower` varchar(20) NOT NULL,
  `follower_staffid` varchar(10) NOT NULL,
  `agent_comm` varchar(255) NOT NULL,
  `zodiac` tinyint(1) NOT NULL DEFAULT '0',
  `problem` tinyint(1) NOT NULL DEFAULT '0',
  `smsflag` tinyint(1) NOT NULL DEFAULT '0',
  `sms_verify` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`),
  KEY `submitdate` (`submitdate`),
  KEY `postdate` (`postdate`),
  KEY `owner` (`owner`),
  KEY `status1` (`status1`,`deleted`)
) ENGINE=MyISAM AUTO_INCREMENT=18409 DEFAULT CHARSET=utf8;

/*Table structure for table `woman_other` */

DROP TABLE IF EXISTS `woman_other`;

CREATE TABLE `woman_other` (
  `womanid` varchar(12) NOT NULL,
  `qa_staff` varchar(50) NOT NULL,
  `qa_date` datetime NOT NULL,
  `qa_note` varchar(500) NOT NULL,
  `logstxt` text NOT NULL,
  KEY `womanid` (`womanid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `woman_overview` */

DROP TABLE IF EXISTS `woman_overview`;

CREATE TABLE `woman_overview` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `womanid` varchar(12) NOT NULL,
  `agentid` varchar(8) NOT NULL,
  `rmd_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`,`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Table structure for table `woman_priv` */

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
  `admirer` tinyint(1) NOT NULL DEFAULT '1',
  `admire_agent_reviewer` tinyint(1) NOT NULL DEFAULT '1',
  `admirer2` tinyint(1) NOT NULL DEFAULT '1',
  `admire_assistant_send` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `admire_assistant_send2` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `videochat` tinyint(1) NOT NULL DEFAULT '1',
  `videochat2` tinyint(1) NOT NULL DEFAULT '1',
  `searchman` tinyint(1) NOT NULL DEFAULT '1',
  `searchman2` tinyint(1) NOT NULL DEFAULT '1',
  `livechat_trans` tinyint(1) NOT NULL DEFAULT '0',
  `wm_reply_max` int(1) unsigned NOT NULL,
  `virtual_gifts` tinyint(1) NOT NULL DEFAULT '1',
  `livechat_autochat1` tinyint(1) NOT NULL DEFAULT '1',
  `livechat_autochat2` tinyint(1) NOT NULL DEFAULT '1',
  `livechat_invite_autoflag1` tinyint(1) NOT NULL DEFAULT '1',
  `livechat_invite_autoflag2` tinyint(1) NOT NULL DEFAULT '1',
  `livechat_sendinvite` tinyint(1) NOT NULL DEFAULT '1',
  `lovecall_authcall` char(2) NOT NULL DEFAULT 'YY',
  `lady_reply_emf` tinyint(1) NOT NULL DEFAULT '1',
  `first_emf` tinyint(1) NOT NULL DEFAULT '1',
  `lady_reply_emf_agent` tinyint(1) NOT NULL DEFAULT '1',
  `lady_show_emf_mode` tinyint(1) NOT NULL DEFAULT '2',
  `lady_emf_ischeck` tinyint(1) NOT NULL DEFAULT '1',
  `lady_only_local_login` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`womanid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `woman_priv_demo` */

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

/*Table structure for table `woman_problem` */

DROP TABLE IF EXISTS `woman_problem`;

CREATE TABLE `woman_problem` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `womanid` varchar(20) NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `womanname` varchar(30) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `assistid` varchar(12) NOT NULL,
  `enddate` datetime NOT NULL,
  `agt_staff_id` varchar(12) NOT NULL,
  `agt_staff` varchar(30) NOT NULL,
  `chn_staff_id` varchar(20) NOT NULL,
  `chn_staff` varchar(30) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `adddate` datetime NOT NULL,
  `ip` varchar(15) NOT NULL,
  `comment` varchar(500) NOT NULL,
  `cstopic` varchar(20) NOT NULL,
  `detail` text NOT NULL,
  `replystatus` char(1) NOT NULL DEFAULT 'N',
  `lastreply` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

/*Table structure for table `woman_profileid` */

DROP TABLE IF EXISTS `woman_profileid`;

CREATE TABLE `woman_profileid` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `womanid` varchar(12) NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `printpaper_times` int(7) unsigned NOT NULL DEFAULT '0',
  `print_times` int(7) unsigned NOT NULL DEFAULT '0',
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `womanid` (`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=16416 DEFAULT CHARSET=utf8;
