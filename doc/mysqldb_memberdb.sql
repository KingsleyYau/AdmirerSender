/*
SQLyog Ultimate v11.42 (32 bit)
MySQL - 5.5.17-log : Database - mysqldb_memberdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mysqldb_memberdb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mysqldb_memberdb`;

/*Table structure for table `account_setting_session` */

DROP TABLE IF EXISTS `account_setting_session`;

CREATE TABLE `account_setting_session` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `adddate` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `siteid` tinyint(2) NOT NULL,
  `sid` varchar(50) NOT NULL,
  `sitename` varchar(50) NOT NULL,
  `sessionid` varchar(40) NOT NULL,
  `qpid_sessionid` varchar(40) NOT NULL,
  `device_type` varchar(2) NOT NULL DEFAULT '10',
  `device_id` varchar(40) NOT NULL,
  `goto_siteid` tinyint(2) NOT NULL DEFAULT '99',
  `goto_url` varchar(300) NOT NULL,
  `womanid` varchar(30) NOT NULL,
  `agentid` varchar(12) NOT NULL,
  `agent_staffid` varchar(20) NOT NULL,
  `ref_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`,`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=10384 DEFAULT CHARSET=utf8;

/*Table structure for table `activeation_history` */

DROP TABLE IF EXISTS `activeation_history`;

CREATE TABLE `activeation_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID,æƒŸä¸€æ ‡è¯†ï¼Œè‡ªå¢ž',
  `manid` varchar(12) NOT NULL COMMENT 'ç”·å£«ID',
  `ads_type` tinyint(4) NOT NULL COMMENT 'ä¼šå‘˜æ¥æº,æ­¤ä¼šå‘˜æ˜¯ä»Žå“ªä¸ªæ¸ é“æ³¨å†Œè€Œæ¥ï¼ï¼šè°·æ­ŒæŽ¨å¹¿ã€€1ã€€æœºæž„æŽ¨å¹¿ 2:',
  `adsuser` varchar(40) NOT NULL COMMENT 'æœºæž„ID',
  `site_id` tinyint(4) NOT NULL COMMENT 'ç½‘ç«™ID,ä»Žå“ªä¸ªç½‘ç«™æ¿€æ´»',
  `ip` varchar(15) NOT NULL COMMENT 'æ¿€æ´»IP',
  `submitdate` datetime NOT NULL COMMENT 'æ³¨å†Œæ—¶é—´',
  `activeationtime` datetime NOT NULL COMMENT 'æ¿€æ´»æ—¶é—´',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COMMENT='æ¿€æ´»åŽ†å²è¡¨';

/*Table structure for table `agent_diary_report` */

DROP TABLE IF EXISTS `agent_diary_report`;

CREATE TABLE `agent_diary_report` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `stat_date` date NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `siteid` int(3) NOT NULL DEFAULT '0',
  `stat_week` varchar(8) NOT NULL,
  `stat_month` varchar(8) NOT NULL,
  `total` decimal(11,2) NOT NULL,
  `emf_mw` decimal(10,2) NOT NULL,
  `emf_wm` decimal(10,2) NOT NULL,
  `address` decimal(10,2) NOT NULL,
  `admire` decimal(10,2) NOT NULL,
  `livechat` decimal(10,2) NOT NULL,
  `lovecall1` decimal(10,2) NOT NULL,
  `lovecall2` decimal(10,2) NOT NULL,
  `lovecall3` decimal(10,2) NOT NULL,
  `relation` int(8) NOT NULL,
  `videoshow` decimal(10,2) NOT NULL,
  `cupiddate` decimal(10,2) NOT NULL,
  `other` decimal(10,2) NOT NULL,
  `deducted` decimal(10,2) NOT NULL,
  `adddate` datetime NOT NULL,
  `firstemf` decimal(10,2) NOT NULL,
  `gifts` decimal(9,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stat` (`stat_date`,`agentid`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=2459 DEFAULT CHARSET=utf8;

/*Table structure for table `agent_history` */

DROP TABLE IF EXISTS `agent_history`;

CREATE TABLE `agent_history` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `agentid` varchar(10) NOT NULL DEFAULT '',
  `flag` char(3) NOT NULL DEFAULT '',
  `credit` decimal(7,2) NOT NULL,
  `manid` varchar(15) NOT NULL DEFAULT '',
  `womanid` varchar(15) NOT NULL DEFAULT '',
  `msgid` varchar(10) DEFAULT NULL,
  `comm` text,
  `comm2` varchar(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `siteid` tinyint(2) NOT NULL DEFAULT '0',
  `ref_id` varchar(35) NOT NULL DEFAULT '',
  `service_endtime` datetime DEFAULT NULL,
  `history_id` varchar(10) NOT NULL DEFAULT '',
  `last_update` datetime DEFAULT NULL,
  `logstxt` text,
  PRIMARY KEY (`id`),
  KEY `history_id` (`history_id`),
  KEY `ref_id` (`ref_id`),
  KEY `forstat` (`adddate`,`agentid`,`flag`)
) ENGINE=MyISAM AUTO_INCREMENT=1974 DEFAULT CHARSET=utf8;

/*Table structure for table `area_code` */

DROP TABLE IF EXISTS `area_code`;

CREATE TABLE `area_code` (
  `area_id` mediumint(4) NOT NULL AUTO_INCREMENT,
  `area_pid` mediumint(4) NOT NULL,
  `area_name` varchar(40) NOT NULL,
  `area_order` mediumint(4) NOT NULL,
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `cancel_reactive_log` */

DROP TABLE IF EXISTS `cancel_reactive_log`;

CREATE TABLE `cancel_reactive_log` (
  `rid` varchar(50) NOT NULL,
  `manid` varchar(12) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `joindate` datetime NOT NULL,
  `ip` varchar(15) NOT NULL,
  `adddate` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `add_flag` tinyint(1) NOT NULL,
  `siteid` tinyint(1) NOT NULL,
  `email` varchar(80) NOT NULL,
  `paid_amount` float(8,2) NOT NULL DEFAULT '0.00',
  `q1` tinyint(1) NOT NULL DEFAULT '0',
  `q2` tinyint(1) NOT NULL DEFAULT '0',
  `q3` tinyint(1) NOT NULL DEFAULT '0',
  `q4` tinyint(1) NOT NULL DEFAULT '0',
  `q5` tinyint(1) NOT NULL DEFAULT '0',
  `q6` tinyint(1) NOT NULL DEFAULT '0',
  `q7` tinyint(1) NOT NULL DEFAULT '0',
  `q8` tinyint(4) NOT NULL DEFAULT '0',
  `qother_flag` tinyint(1) NOT NULL DEFAULT '0',
  `qother` text NOT NULL,
  PRIMARY KEY (`rid`),
  KEY `manid_index` (`manid`),
  KEY `date_flag_index` (`adddate`,`add_flag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `change_email` */

DROP TABLE IF EXISTS `change_email`;

CREATE TABLE `change_email` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL DEFAULT '',
  `old_email` varchar(150) NOT NULL DEFAULT '',
  `new_email` varchar(150) NOT NULL DEFAULT '',
  `authcode` varchar(20) NOT NULL DEFAULT '',
  `status` char(1) NOT NULL DEFAULT 'N',
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`)
) ENGINE=InnoDB AUTO_INCREMENT=12079 DEFAULT CHARSET=utf8;

/*Table structure for table `clear_contact_info` */

DROP TABLE IF EXISTS `clear_contact_info`;

CREATE TABLE `clear_contact_info` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `manid` varchar(30) NOT NULL,
  `paid_amount` decimal(8,2) NOT NULL,
  `adddate` datetime NOT NULL,
  `status` tinyint(4) NOT NULL,
  `process_date` datetime NOT NULL,
  `info` varchar(500) NOT NULL,
  `ref_id` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `credits_clear_history` */

DROP TABLE IF EXISTS `credits_clear_history`;

CREATE TABLE `credits_clear_history` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `manid` varchar(20) NOT NULL,
  `credit` decimal(7,2) NOT NULL,
  `adddate` datetime NOT NULL,
  `lastlogin` datetime NOT NULL,
  `expiredate` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`)
) ENGINE=InnoDB AUTO_INCREMENT=11787 DEFAULT CHARSET=utf8;

/*Table structure for table `cupiddate_us_client` */

DROP TABLE IF EXISTS `cupiddate_us_client`;

CREATE TABLE `cupiddate_us_client` (
  `manid` varchar(20) NOT NULL DEFAULT '',
  `is_save` varchar(1) NOT NULL,
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
  `firstname` varchar(30) NOT NULL DEFAULT '',
  `lastname` varchar(30) NOT NULL DEFAULT '',
  `city` varchar(50) NOT NULL DEFAULT '',
  `state` varchar(50) NOT NULL DEFAULT '',
  `zipcode` varchar(20) NOT NULL DEFAULT '',
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `lastupdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `complete` char(1) NOT NULL DEFAULT 'N',
  UNIQUE KEY `manid` (`manid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `david_20150428` */

DROP TABLE IF EXISTS `david_20150428`;

CREATE TABLE `david_20150428` (
  `manid` varchar(12) NOT NULL,
  `mb_level` char(1) NOT NULL DEFAULT 'E',
  `lc_freetrial` int(5) NOT NULL,
  `last_login` datetime NOT NULL,
  `lastfreeticket` datetime NOT NULL,
  KEY `manid` (`manid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `david_20150428_2` */

DROP TABLE IF EXISTS `david_20150428_2`;

CREATE TABLE `david_20150428_2` (
  `id` int(11) NOT NULL DEFAULT '0',
  `manid` varchar(20) NOT NULL,
  `adddate` datetime NOT NULL,
  KEY `manid` (`manid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `david_20150428_3` */

DROP TABLE IF EXISTS `david_20150428_3`;

CREATE TABLE `david_20150428_3` (
  `manid` varchar(12) NOT NULL,
  `mb_level` char(1) NOT NULL DEFAULT 'E',
  `lc_freetrial` int(5) NOT NULL,
  `last_login` datetime NOT NULL,
  `lastfreeticket` datetime NOT NULL,
  `lastticketdate` datetime DEFAULT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `submitdate` datetime NOT NULL,
  `expire_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `emf_stats_crond` */

DROP TABLE IF EXISTS `emf_stats_crond`;

CREATE TABLE `emf_stats_crond` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `adddate` datetime NOT NULL,
  `maxid` varchar(15) NOT NULL,
  `fail_sql` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Table structure for table `expire_credits` */

DROP TABLE IF EXISTS `expire_credits`;

CREATE TABLE `expire_credits` (
  `id` int(10) NOT NULL DEFAULT '0',
  `manid` varchar(12) NOT NULL,
  `last_login` datetime NOT NULL,
  `money` int(6) NOT NULL,
  `credits_expire_date` date NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `find_password` */

DROP TABLE IF EXISTS `find_password`;

CREATE TABLE `find_password` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `serial_number` varchar(40) NOT NULL,
  `manid` varchar(30) NOT NULL,
  `firstname` varchar(40) NOT NULL,
  `lastname` varchar(40) NOT NULL,
  `add_time` datetime NOT NULL,
  `change_time` datetime NOT NULL,
  `old_password` varchar(64) NOT NULL,
  `new_password_hash` varchar(64) NOT NULL,
  `new_password` varchar(30) NOT NULL,
  `status` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `serial_number` (`serial_number`,`manid`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Table structure for table `firstemf_unpaid` */

DROP TABLE IF EXISTS `firstemf_unpaid`;

CREATE TABLE `firstemf_unpaid` (
  `msgid` int(8) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `manid` varchar(20) NOT NULL,
  `agentid` varchar(20) NOT NULL,
  `adddate` datetime NOT NULL,
  `paiddate` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `siteid` tinyint(1) NOT NULL,
  PRIMARY KEY (`msgid`,`siteid`),
  KEY `paiddate` (`paiddate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `freechat_ticket` */

DROP TABLE IF EXISTS `freechat_ticket`;

CREATE TABLE `freechat_ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticketid` varchar(20) NOT NULL,
  `manid` varchar(20) NOT NULL,
  `manname` varchar(50) NOT NULL,
  `adddate` datetime NOT NULL,
  `actionid` int(10) NOT NULL,
  `able_lady` tinyint(2) NOT NULL DEFAULT '0',
  `able_siteid` tinyint(2) NOT NULL DEFAULT '-1',
  `used_siteid` tinyint(2) NOT NULL DEFAULT '-1',
  `cycle` tinyint(2) NOT NULL DEFAULT '0',
  `action_type` tinyint(1) NOT NULL DEFAULT '0',
  `classify` varchar(50) NOT NULL DEFAULT '0',
  `reason` varchar(250) NOT NULL,
  `useorder` tinyint(2) NOT NULL DEFAULT '0',
  `startdate` datetime NOT NULL,
  `enddate` datetime NOT NULL,
  `useflag` tinyint(2) NOT NULL DEFAULT '0',
  `used_date` datetime NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `agent` varchar(10) NOT NULL,
  `inviteid` varchar(32) NOT NULL,
  `charge` tinyint(1) NOT NULL DEFAULT '0',
  `order_num` int(5) NOT NULL DEFAULT '0',
  `submitdate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid_use` (`ticketid`,`manid`,`used_siteid`),
  KEY `manid_check` (`manid`,`able_siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=6618856 DEFAULT CHARSET=utf8;

/*Table structure for table `freechat_ticket_delete_bak` */

DROP TABLE IF EXISTS `freechat_ticket_delete_bak`;

CREATE TABLE `freechat_ticket_delete_bak` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticketid` varchar(20) NOT NULL,
  `manid` varchar(20) NOT NULL,
  `manname` varchar(50) NOT NULL,
  `adddate` datetime NOT NULL,
  `actionid` int(10) NOT NULL,
  `able_lady` tinyint(2) NOT NULL DEFAULT '0',
  `able_siteid` tinyint(2) NOT NULL DEFAULT '-1',
  `used_siteid` tinyint(2) NOT NULL DEFAULT '-1',
  `cycle` tinyint(2) NOT NULL DEFAULT '0',
  `action_type` tinyint(1) NOT NULL DEFAULT '0',
  `classify` int(4) NOT NULL DEFAULT '0',
  `reason` varchar(250) NOT NULL,
  `useorder` tinyint(2) NOT NULL DEFAULT '0',
  `startdate` datetime NOT NULL,
  `enddate` datetime NOT NULL,
  `useflag` tinyint(2) NOT NULL DEFAULT '0',
  `used_date` datetime NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `agent` varchar(10) NOT NULL,
  `inviteid` varchar(32) NOT NULL,
  `charge` tinyint(1) NOT NULL DEFAULT '0',
  `order_num` int(5) NOT NULL DEFAULT '0',
  `submitdate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid_use` (`ticketid`,`manid`,`used_siteid`),
  KEY `manid_check` (`manid`,`able_siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=369 DEFAULT CHARSET=utf8;

/*Table structure for table `freechat_ticket_delete_log` */

DROP TABLE IF EXISTS `freechat_ticket_delete_log`;

CREATE TABLE `freechat_ticket_delete_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticketid` varchar(20) NOT NULL,
  `manid` varchar(20) NOT NULL,
  `manname` varchar(50) NOT NULL,
  `adddate` datetime NOT NULL,
  `actionid` int(10) NOT NULL,
  `able_lady` tinyint(2) NOT NULL DEFAULT '0',
  `able_siteid` tinyint(2) NOT NULL DEFAULT '-1',
  `used_siteid` tinyint(2) NOT NULL DEFAULT '-1',
  `cycle` tinyint(2) NOT NULL DEFAULT '0',
  `action_type` tinyint(1) NOT NULL DEFAULT '0',
  `classify` int(4) NOT NULL DEFAULT '0',
  `reason` varchar(250) NOT NULL,
  `useorder` tinyint(2) NOT NULL DEFAULT '0',
  `startdate` datetime NOT NULL,
  `enddate` datetime NOT NULL,
  `useflag` tinyint(2) NOT NULL DEFAULT '0',
  `used_date` datetime NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `agent` varchar(10) NOT NULL,
  `inviteid` varchar(32) NOT NULL,
  `charge` tinyint(1) NOT NULL DEFAULT '0',
  `order_num` int(5) NOT NULL DEFAULT '0',
  `submitdate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid_use` (`ticketid`,`manid`,`used_siteid`),
  KEY `manid_check` (`manid`,`able_siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

/*Table structure for table `freechat_ticket_log` */

DROP TABLE IF EXISTS `freechat_ticket_log`;

CREATE TABLE `freechat_ticket_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logid` varchar(20) NOT NULL,
  `manid` varchar(20) NOT NULL,
  `ticket_type` tinyint(1) unsigned NOT NULL,
  `adddate` datetime NOT NULL,
  `ticket_num` int(6) NOT NULL,
  `ticket_before` int(6) NOT NULL,
  `ticket_now` int(6) NOT NULL,
  `manname` varchar(50) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `creator` varchar(30) NOT NULL,
  `creator_id` varchar(15) NOT NULL DEFAULT '',
  `action_type` tinyint(1) unsigned NOT NULL,
  `ip` varchar(25) NOT NULL,
  `classify` varchar(50) NOT NULL,
  `noteflag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `logId` (`logid`,`manid`)
) ENGINE=MyISAM AUTO_INCREMENT=655116 DEFAULT CHARSET=utf8;

/*Table structure for table `freechat_ticket_rule` */

DROP TABLE IF EXISTS `freechat_ticket_rule`;

CREATE TABLE `freechat_ticket_rule` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `rule_id` varchar(50) NOT NULL,
  `rule_name` varchar(100) NOT NULL,
  `ticket_num` int(4) NOT NULL,
  `mb_type` tinyint(1) NOT NULL,
  `mb_level` varchar(30) NOT NULL,
  `comment` text NOT NULL,
  `reason` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `cycle` tinyint(2) NOT NULL,
  `days` int(4) NOT NULL,
  `site_type` tinyint(1) NOT NULL,
  `able_lady` tinyint(2) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `adddate` datetime NOT NULL,
  `creator` varchar(30) NOT NULL,
  `creator_id` varchar(15) NOT NULL,
  `ip` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

/*Table structure for table `ida_freechat_ticket_mb` */

DROP TABLE IF EXISTS `ida_freechat_ticket_mb`;

CREATE TABLE `ida_freechat_ticket_mb` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `manid` varchar(20) NOT NULL,
  `send1` tinyint(1) NOT NULL,
  `send2` tinyint(1) NOT NULL,
  `send3` tinyint(1) NOT NULL,
  `adddate1` datetime NOT NULL,
  `adddate2` datetime NOT NULL,
  `adddate3` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `manid` (`manid`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Table structure for table `ida_value_member` */

DROP TABLE IF EXISTS `ida_value_member`;

CREATE TABLE `ida_value_member` (
  `manid` varchar(15) NOT NULL,
  UNIQUE KEY `manid` (`manid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `info_adv_log` */

DROP TABLE IF EXISTS `info_adv_log`;

CREATE TABLE `info_adv_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manid` varchar(30) NOT NULL,
  `click_id` int(11) NOT NULL DEFAULT '0',
  `clicktime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ipaddress` varchar(15) NOT NULL DEFAULT '',
  `adv_user` varchar(40) NOT NULL DEFAULT '',
  `adv_type` tinyint(1) NOT NULL DEFAULT '0',
  `referer_page` varchar(1024) NOT NULL,
  `refresh_flag` int(1) NOT NULL DEFAULT '0',
  `ad_placement` varchar(200) NOT NULL,
  `ad_keyword` varchar(200) NOT NULL,
  `ad_target` varchar(32) NOT NULL,
  `ad_matchtype` varchar(1) NOT NULL,
  `ad_adposition` varchar(32) NOT NULL,
  `ad_network` varchar(1) NOT NULL,
  `ad_device` varchar(1) NOT NULL,
  `ad_aceid` varchar(32) NOT NULL,
  `ad_creative` varchar(32) NOT NULL,
  `ad_additional` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ip_clicktime` (`ipaddress`,`clicktime`),
  KEY `adv_user` (`adv_user`,`clicktime`),
  KEY `manid` (`manid`,`click_id`)
) ENGINE=MyISAM AUTO_INCREMENT=726 DEFAULT CHARSET=utf8;

/*Table structure for table `info_albums` */

DROP TABLE IF EXISTS `info_albums`;

CREATE TABLE `info_albums` (
  `pt_id` int(6) NOT NULL AUTO_INCREMENT,
  `pt_uid` varchar(12) NOT NULL,
  `pt_dir` varchar(20) NOT NULL,
  `pt_filename` varchar(50) NOT NULL,
  `pt_order` tinyint(1) NOT NULL,
  `pt_ispass` tinyint(1) NOT NULL DEFAULT '2' COMMENT '1:å®¡æ ¸ä¸é€šè¿‡ 2:å¤„ç†ä¸­ 3:å®¡æ ¸é€šè¿‡',
  `pt_time` int(10) NOT NULL COMMENT 'å·²å®¡æ ¸æ—¶é—´',
  PRIMARY KEY (`pt_id`),
  KEY `pt_uid` (`pt_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8;

/*Table structure for table `info_basic` */

DROP TABLE IF EXISTS `info_basic`;

CREATE TABLE `info_basic` (
  `manid` varchar(12) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `birthday` date NOT NULL,
  `last_update` datetime NOT NULL,
  `country` varchar(2) NOT NULL,
  `living` varchar(2) DEFAULT NULL,
  `gender` varchar(1) NOT NULL DEFAULT 'M',
  `ethnicity` tinyint(1) NOT NULL DEFAULT '0',
  `language` tinyint(1) NOT NULL DEFAULT '0',
  `height` tinyint(1) NOT NULL DEFAULT '0',
  `weight` tinyint(1) NOT NULL DEFAULT '0',
  `zodiac` tinyint(1) DEFAULT '0',
  `education` tinyint(1) NOT NULL DEFAULT '0',
  `profession` tinyint(1) NOT NULL DEFAULT '0',
  `income` tinyint(1) NOT NULL DEFAULT '0',
  `interests` varchar(50) DEFAULT NULL,
  `smoke` tinyint(1) NOT NULL DEFAULT '0',
  `drink` tinyint(1) NOT NULL DEFAULT '0',
  `children` tinyint(1) NOT NULL DEFAULT '0',
  `religion` tinyint(1) NOT NULL DEFAULT '0',
  `province` varchar(20) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `findingway` varchar(50) DEFAULT NULL,
  `us_client` varchar(1) NOT NULL DEFAULT '0',
  `sendmailnum` tinyint(1) NOT NULL DEFAULT '0',
  `submitdate` datetime NOT NULL,
  `photo` tinyint(1) NOT NULL DEFAULT '0',
  `marry` tinyint(1) NOT NULL DEFAULT '0',
  `relationship` varchar(15) NOT NULL DEFAULT '0',
  `black` varchar(1) NOT NULL DEFAULT 'N',
  `emf_level` tinyint(4) NOT NULL DEFAULT '0',
  `emf_kf` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `vip` varchar(1) NOT NULL DEFAULT 'N',
  `alert_flag` varchar(1) NOT NULL DEFAULT 'N',
  `alert_msg` varchar(1) NOT NULL DEFAULT '0',
  `agt_valid_cl` tinyint(1) NOT NULL DEFAULT '0',
  `agt_valid_th` tinyint(1) NOT NULL DEFAULT '0',
  `agt_valid_ru` tinyint(1) NOT NULL DEFAULT '0',
  `agt_valid_ld` tinyint(1) NOT NULL DEFAULT '0',
  `ladycallme_mode` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`manid`),
  KEY `submitdate` (`submitdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `info_core` */

DROP TABLE IF EXISTS `info_core`;

CREATE TABLE `info_core` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `email` varchar(80) NOT NULL,
  `passwd` varchar(70) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '2',
  `review` tinyint(1) NOT NULL DEFAULT '0',
  `step` tinyint(1) NOT NULL DEFAULT '1',
  `finishstep` varchar(10) NOT NULL,
  `verified` char(1) NOT NULL DEFAULT 'N',
  `email_verified` char(1) NOT NULL DEFAULT 'N',
  `loginnum` int(7) NOT NULL,
  `last_login` datetime NOT NULL,
  `siteid` tinyint(1) NOT NULL,
  `regipcc` varchar(2) NOT NULL,
  `sid` varchar(32) NOT NULL,
  `chnlove` tinyint(1) NOT NULL DEFAULT '5',
  `thaimatches` tinyint(1) NOT NULL DEFAULT '5',
  `qpidworld` tinyint(1) NOT NULL DEFAULT '5',
  `latamdate` tinyint(1) NOT NULL DEFAULT '5',
  `charmingdate` tinyint(1) NOT NULL DEFAULT '5',
  `qpidthai` tinyint(1) NOT NULL DEFAULT '5',
  `nickname` varchar(20) NOT NULL,
  `ipstatus` tinyint(1) NOT NULL DEFAULT '1',
  `loginipcc` varchar(3) NOT NULL,
  `paid_amount` decimal(10,2) NOT NULL,
  `order_num` int(5) NOT NULL,
  `firstorder_time` datetime NOT NULL,
  `money` decimal(7,2) NOT NULL,
  `payment_pre` varchar(30) NOT NULL DEFAULT 'CY|PVSC',
  `payment` varchar(30) NOT NULL,
  `credits` decimal(7,2) NOT NULL,
  `integral_total` int(1) NOT NULL DEFAULT '0',
  `integral` int(1) NOT NULL DEFAULT '0',
  `credits_expire_date` date NOT NULL,
  `device_type` varchar(2) NOT NULL DEFAULT '10',
  `verified_credit_card` tinyint(2) NOT NULL DEFAULT '0',
  `role_id_list` varchar(255) NOT NULL DEFAULT '',
  `exp_list` varchar(255) NOT NULL,
  `is_rolelist` tinyint(1) NOT NULL DEFAULT '0',
  `is_explist` tinyint(1) NOT NULL DEFAULT '0',
  `lc_freetrial` int(5) NOT NULL,
  `lc_freetrial_total` int(5) NOT NULL,
  `last_order_date` date NOT NULL DEFAULT '0000-00-00',
  `mb_level` char(1) NOT NULL DEFAULT 'E',
  PRIMARY KEY (`id`),
  UNIQUE KEY `manid` (`manid`),
  KEY `nickname` (`nickname`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=395476 DEFAULT CHARSET=utf8;

/*Table structure for table `info_core1` */

DROP TABLE IF EXISTS `info_core1`;

CREATE TABLE `info_core1` (
  `id` int(10) NOT NULL DEFAULT '0',
  `manid` varchar(12) NOT NULL,
  `email` varchar(80) NOT NULL,
  `passwd` varchar(70) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '2',
  `review` tinyint(1) NOT NULL DEFAULT '0',
  `step` tinyint(1) NOT NULL DEFAULT '1',
  `finishstep` varchar(10) NOT NULL,
  `verified` char(1) NOT NULL DEFAULT 'N',
  `email_verified` char(1) NOT NULL DEFAULT 'N',
  `loginnum` int(7) NOT NULL,
  `last_login` datetime NOT NULL,
  `siteid` tinyint(1) NOT NULL,
  `regipcc` varchar(2) NOT NULL,
  `sid` varchar(32) NOT NULL,
  `chnlove` tinyint(1) NOT NULL DEFAULT '5',
  `thaimatches` tinyint(1) NOT NULL DEFAULT '5',
  `qpidworld` tinyint(1) NOT NULL DEFAULT '5',
  `latamdate` tinyint(1) NOT NULL DEFAULT '5',
  `charmingdate` tinyint(1) NOT NULL DEFAULT '5',
  `nickname` varchar(20) NOT NULL,
  `ipstatus` tinyint(1) NOT NULL DEFAULT '1',
  `loginipcc` varchar(3) NOT NULL,
  `paid_amount` decimal(10,2) NOT NULL,
  `order_num` int(5) NOT NULL,
  `firstorder_time` datetime NOT NULL,
  `money` decimal(11,2) NOT NULL,
  `payment_pre` varchar(30) NOT NULL DEFAULT 'CY|PVSC',
  `payment` varchar(30) NOT NULL,
  `payment_app` varchar(30) NOT NULL DEFAULT 'PVSC',
  `credits` decimal(7,2) NOT NULL,
  `integral_total` int(1) NOT NULL DEFAULT '0',
  `integral` int(1) NOT NULL DEFAULT '0',
  `credits_expire_date` date NOT NULL,
  `device_type` varchar(2) NOT NULL DEFAULT '10',
  `verified_credit_card` tinyint(2) NOT NULL DEFAULT '0',
  `role_id_list` varchar(255) NOT NULL,
  `exp_list` varchar(255) NOT NULL,
  `is_rolelist` tinyint(1) NOT NULL DEFAULT '0',
  `is_explist` tinyint(1) NOT NULL DEFAULT '0',
  `lc_freetrial` int(5) NOT NULL,
  `lc_freetrial_total` int(5) NOT NULL,
  `last_order_date` date NOT NULL DEFAULT '0000-00-00',
  `mb_level` char(1) NOT NULL DEFAULT 'E'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `info_core_old` */

DROP TABLE IF EXISTS `info_core_old`;

CREATE TABLE `info_core_old` (
  `id` int(10) NOT NULL DEFAULT '0',
  `manid` varchar(12) NOT NULL,
  `email` varchar(80) NOT NULL,
  `passwd` varchar(70) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '2',
  `review` tinyint(1) NOT NULL DEFAULT '0',
  `step` tinyint(1) NOT NULL DEFAULT '1',
  `finishstep` varchar(10) NOT NULL,
  `verified` char(1) NOT NULL DEFAULT 'N',
  `email_verified` char(1) NOT NULL DEFAULT 'N',
  `loginnum` int(7) NOT NULL,
  `last_login` datetime NOT NULL,
  `siteid` tinyint(1) NOT NULL,
  `regipcc` varchar(2) NOT NULL,
  `sid` varchar(32) NOT NULL,
  `chnlove` tinyint(1) NOT NULL DEFAULT '5',
  `thaimatches` tinyint(1) NOT NULL DEFAULT '5',
  `qpidworld` tinyint(1) NOT NULL DEFAULT '5',
  `latamdate` tinyint(1) NOT NULL DEFAULT '5',
  `charmingdate` tinyint(1) NOT NULL DEFAULT '5',
  `nickname` varchar(20) NOT NULL,
  `ipstatus` tinyint(1) NOT NULL DEFAULT '1',
  `loginipcc` varchar(3) NOT NULL,
  `paid_amount` decimal(10,2) NOT NULL,
  `order_num` int(5) NOT NULL,
  `firstorder_time` datetime NOT NULL,
  `money` decimal(11,2) NOT NULL,
  `payment_pre` varchar(30) NOT NULL DEFAULT 'CY|PVSC',
  `payment` varchar(30) NOT NULL,
  `payment_app` varchar(30) NOT NULL DEFAULT 'PVSC',
  `credits` decimal(7,2) NOT NULL,
  `integral_total` int(1) NOT NULL DEFAULT '0',
  `integral` int(1) NOT NULL DEFAULT '0',
  `credits_expire_date` date NOT NULL,
  `device_type` varchar(2) NOT NULL DEFAULT '10',
  `verified_credit_card` tinyint(2) NOT NULL DEFAULT '0',
  `role_id_list` varchar(255) NOT NULL,
  `exp_list` varchar(255) NOT NULL,
  `is_rolelist` tinyint(1) NOT NULL DEFAULT '0',
  `is_explist` tinyint(1) NOT NULL DEFAULT '0',
  `lc_freetrial` int(5) NOT NULL,
  `lc_freetrial_total` int(5) NOT NULL,
  `last_order_date` date NOT NULL DEFAULT '0000-00-00',
  `mb_level` char(1) NOT NULL DEFAULT 'E'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `info_desc` */

DROP TABLE IF EXISTS `info_desc`;

CREATE TABLE `info_desc` (
  `manid` varchar(12) NOT NULL,
  `headline` varchar(50) NOT NULL,
  `jj` text NOT NULL,
  `meet` varchar(100) NOT NULL,
  `address1` varchar(200) NOT NULL,
  `address2` varchar(200) NOT NULL,
  `city` varchar(40) NOT NULL,
  `checkmailflag` tinyint(1) NOT NULL DEFAULT '0',
  `telephone_cc` char(2) NOT NULL,
  `telephone` varchar(25) NOT NULL,
  `landline_cc` char(2) NOT NULL,
  `landline_ac` varchar(5) NOT NULL,
  `landline` varchar(20) NOT NULL,
  `fax` varchar(25) NOT NULL,
  `alternate_email` varchar(70) NOT NULL,
  `comment` text NOT NULL,
  `rs_content` text NOT NULL,
  `rs_subtime` int(10) unsigned NOT NULL,
  `rs_status` tinyint(1) NOT NULL DEFAULT '2',
  PRIMARY KEY (`manid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `info_desc_log` */

DROP TABLE IF EXISTS `info_desc_log`;

CREATE TABLE `info_desc_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `manid` varchar(15) NOT NULL,
  `manname` varchar(60) NOT NULL,
  `group_id` tinyint(1) NOT NULL DEFAULT '0',
  `content_old` text NOT NULL,
  `content_edit` text NOT NULL,
  `content_ok` text NOT NULL,
  `rs_subtime` int(10) unsigned NOT NULL DEFAULT '0',
  `rs_status` tinyint(1) NOT NULL DEFAULT '1',
  `rs_examtime` int(10) unsigned NOT NULL DEFAULT '0',
  `staff_id` varchar(10) NOT NULL,
  `staff_name` varchar(30) NOT NULL,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`),
  KEY `rs_examtime` (`rs_examtime`),
  KEY `group_id` (`group_id`,`rs_subtime`,`rs_status`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8;

/*Table structure for table `info_gd` */

DROP TABLE IF EXISTS `info_gd`;

CREATE TABLE `info_gd` (
  `manid` varchar(12) NOT NULL COMMENT 'ä¼šå‘˜IDä»¥CMå¼€å¤´çš„',
  `ap_hair` tinyint(1) NOT NULL COMMENT 'å¤´å‘é¢œè‰²,å€¼åœ¨æ•°ç»„é‡Œé¢å®šä¹‰,åä¸º$haircolor',
  `ap_eye` tinyint(1) NOT NULL COMMENT 'çœ¼ç›é¢œè‰²,å€¼åœ¨æ•°ç»„é‡Œé¢å®šä¹‰,åä¸º$eyecolor',
  `ap_body` tinyint(1) NOT NULL COMMENT 'èº«ä½“ç‰¹å¾,å€¼åœ¨æ•°ç»„é‡Œé¢å®šä¹‰,åä¸º$bodytype',
  `ap_feature` tinyint(1) NOT NULL COMMENT 'å¤–è²Œç‰¹å¾,å€¼åœ¨æ•°ç»„é‡Œé¢å®šä¹‰,åä¸º$feture',
  `ap_apper` tinyint(1) NOT NULL COMMENT 'ä¼šå‘˜å¤–è¡¨,å€¼åœ¨æ•°ç»„é‡Œé¢å®šä¹‰,åä¸º$appearance',
  `lfs_childnum` tinyint(1) NOT NULL COMMENT 'å­©å­ä¸ªæ•°',
  `lfs_daily` tinyint(1) NOT NULL COMMENT 'æ—¥å¸¸èµ·å±…,å€¼åœ¨æ•°ç»„é‡Œé¢å®šä¹‰,åä¸º$daily',
  `lfs_describe` tinyint(1) NOT NULL COMMENT 'åˆ«äººå¯¹è‡ªå·±çš„è¯„ä»·,å€¼åœ¨æ•°ç»„å®šä¹‰,æ•°ç»„åä¸º$describe',
  `lfs_live` tinyint(1) NOT NULL COMMENT 'ç”Ÿæ´»æ–¹å¼å€¼åœ¨æ•°ç»„å®šä¹‰,æ•°ç»„åä¸º$alone',
  `lg_nation` varchar(3) NOT NULL COMMENT 'å›½ç±æ°‘æ—,ä¸Žcountryå¯¹åº”',
  `lg_egability` tinyint(1) NOT NULL COMMENT 'è‹±è¯­èƒ½åŠ›,å€¼åœ¨æ•°ç»„é‡Œé¢å®šä¹‰,åä¸º$eggrade',
  `it_exercise` tinyint(1) NOT NULL COMMENT 'è¿åŠ¨å‘¨æœŸ,å€¼åœ¨æ•°ç»„é‡Œé¢å®šä¹‰,åä¸º$exercise',
  `it_fvexercise` varchar(20) NOT NULL COMMENT 'æœ€å–œæ¬¢çš„è¿åŠ¨,å€¼åœ¨æ•°ç»„é‡Œé¢å®šä¹‰,åä¸º$favexercise',
  `it_diet` tinyint(1) NOT NULL COMMENT 'é¥®é£Ÿçˆ±å¥½,å€¼åœ¨æ•°ç»„é‡Œé¢å®šä¹‰,ä¸º$diet',
  `it_likefood` varchar(90) NOT NULL COMMENT 'å–œæ¬¢çš„é£Ÿç‰©,å€¼åœ¨æ•°ç»„é‡Œé¢å®šä¹‰,åä¸º$foottype',
  `it_doing` varchar(90) NOT NULL COMMENT 'ç©ºé—²çš„æ—¶å€™æƒ³åšä»€ä¹ˆ,å€¼åœ¨æ•°ç»„é‡Œé¢å®šä¹‰,åä¸º$freetime',
  `it_gowhere` varchar(90) NOT NULL COMMENT 'ç©ºé—²çš„æ—¶å€™æƒ³åŽ»å“ª,å€¼åœ¨æ•°ç»„é‡Œé¢å®šä¹‰,åä¸º$where',
  `it_fvmusic` varchar(90) NOT NULL COMMENT 'æœ€å–œæ¬¢çš„éŸ³ä¹,å€¼åœ¨æ•°ç»„é‡Œé¢å®šä¹‰,åä¸º$musictype',
  `it_read` varchar(90) NOT NULL COMMENT 'è¯»ä¹¦çš„ç±»åž‹,å€¼åœ¨æ•°ç»„é‡Œé¢å®šä¹‰,åä¸º$read',
  `m_personality` varchar(90) NOT NULL COMMENT 'ä¸ªæ€§ç±»åž‹,å€¼åœ¨æ•°ç»„é‡Œé¢å®šä¹‰,åä¸º$personality',
  `m_childplan` varchar(1) NOT NULL COMMENT 'Y/N',
  `m_bodyart` varchar(90) NOT NULL COMMENT 'èº«ä½“è‰ºæœ¯,å€¼ä¿å­˜åœ¨æ•°ç»„é‡Œ,æ•°ç»„åä¸º$bodyart',
  `m_looking` varchar(20) NOT NULL COMMENT 'äº¤å‹çš„ç±»åž‹,å€¼åœ¨æ•°ç»„é‡Œé¢å®šä¹‰,åä¸º$lookingfor',
  `speak_lang` varchar(90) NOT NULL,
  PRIMARY KEY (`manid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `info_gift_history` */

DROP TABLE IF EXISTS `info_gift_history`;

CREATE TABLE `info_gift_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `orderno` varchar(30) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `submitdate` datetime NOT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `adddate` datetime NOT NULL,
  `note` varchar(500) DEFAULT NULL,
  `integral` int(1) NOT NULL,
  `integral_id` int(1) NOT NULL,
  `freechat` int(1) NOT NULL,
  `freechat_id` int(1) NOT NULL,
  `siteid` varchar(2) NOT NULL,
  `paid_amount` decimal(9,2) NOT NULL DEFAULT '0.00',
  `upgrade` char(1) NOT NULL DEFAULT 'N',
  `first_order_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `index_suo` (`manid`,`orderno`)
) ENGINE=MyISAM AUTO_INCREMENT=223 DEFAULT CHARSET=utf8;

/*Table structure for table `info_login_token` */

DROP TABLE IF EXISTS `info_login_token`;

CREATE TABLE `info_login_token` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `manid` varchar(15) NOT NULL,
  `fb_token` varchar(450) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Table structure for table `info_match_cl` */

DROP TABLE IF EXISTS `info_match_cl`;

CREATE TABLE `info_match_cl` (
  `manid` varchar(12) NOT NULL,
  `age1` tinyint(1) NOT NULL,
  `age2` tinyint(1) NOT NULL,
  `m_country` varchar(50) NOT NULL,
  `m_city` text,
  `m_marry` tinyint(4) NOT NULL,
  `m_children` tinyint(4) NOT NULL,
  `m_education` tinyint(4) NOT NULL,
  `m_height1` tinyint(4) NOT NULL,
  `m_height2` tinyint(4) NOT NULL,
  `m_smoke` tinyint(4) NOT NULL,
  `m_drike` tinyint(4) NOT NULL,
  `m_interests` varchar(50) DEFAULT NULL,
  `mi_hair` tinyint(4) NOT NULL,
  `mi_eye` tinyint(4) NOT NULL,
  `mi_body` tinyint(4) NOT NULL,
  `mi_ethnict` tinyint(4) NOT NULL,
  `mi_religion` tinyint(4) NOT NULL,
  `mi_language` varchar(50) NOT NULL,
  `mi_profess` tinyint(4) NOT NULL,
  `mi_income` tinyint(4) NOT NULL,
  `mi_kids` tinyint(4) NOT NULL,
  PRIMARY KEY (`manid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `info_match_ld` */

DROP TABLE IF EXISTS `info_match_ld`;

CREATE TABLE `info_match_ld` (
  `manid` varchar(12) NOT NULL,
  `age1` tinyint(1) NOT NULL,
  `age2` tinyint(1) NOT NULL,
  `m_country` varchar(50) NOT NULL,
  `m_marry` tinyint(4) NOT NULL,
  `m_children` tinyint(4) NOT NULL,
  `m_education` tinyint(4) NOT NULL,
  `m_height1` tinyint(4) NOT NULL,
  `m_height2` tinyint(4) NOT NULL,
  `m_smoke` tinyint(4) NOT NULL,
  `m_drike` tinyint(4) NOT NULL,
  `mi_hair` tinyint(4) NOT NULL,
  `mi_eye` tinyint(4) NOT NULL,
  `mi_body` tinyint(4) NOT NULL,
  `mi_ethnict` tinyint(4) NOT NULL,
  `mi_religion` tinyint(4) NOT NULL,
  `mi_language` varchar(50) NOT NULL,
  `mi_profess` tinyint(4) NOT NULL,
  `mi_income` tinyint(4) NOT NULL,
  `mi_kids` tinyint(4) NOT NULL,
  PRIMARY KEY (`manid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `info_match_qp` */

DROP TABLE IF EXISTS `info_match_qp`;

CREATE TABLE `info_match_qp` (
  `manid` varchar(12) NOT NULL,
  `age1` int(3) NOT NULL,
  `age2` int(3) NOT NULL,
  `m_country` varchar(2) NOT NULL COMMENT 'å›½å®¶ä»£ç ',
  `m_marry` tinyint(1) NOT NULL COMMENT 'å½“å‰å©šå§»çŠ¶æ€',
  `m_children` tinyint(1) NOT NULL COMMENT 'æ˜¯å¦æœ‰å°å­©',
  `m_education` tinyint(1) NOT NULL COMMENT 'å—æ•™è‚²ç¨‹åº¦',
  `m_height1` tinyint(1) NOT NULL COMMENT 'ä¼šå‘˜æœ€ä½Žèº«é«˜',
  `m_height2` tinyint(1) NOT NULL COMMENT 'ä¼šå‘˜æœ€é«˜èº«é«˜',
  `m_smoke` tinyint(1) NOT NULL COMMENT 'æ˜¯å¦å¸çƒŸ',
  `m_drike` tinyint(1) NOT NULL COMMENT 'æ˜¯å¦å–é…’',
  `mi_hair` tinyint(1) NOT NULL COMMENT 'å¤´å‘é¢œè‰²,å€¼åœ¨$haircolor',
  `mi_eye` tinyint(1) NOT NULL COMMENT 'çœ¼ç›é¢œè‰²,åœ¨æ•°ç»„é‡Œå®šä¹‰$eyecolor',
  `mi_body` tinyint(1) NOT NULL COMMENT 'èº«ä½“ç‰¹å¾,å€¼åœ¨æ•°ç»„é‡Œå®šä¹‰,å˜é‡ä¸º$bodytype',
  `mi_ethnict` tinyint(1) NOT NULL COMMENT 'ç§æ—',
  `mi_religion` tinyint(1) NOT NULL COMMENT 'å®—æ•™',
  `mi_language` varchar(50) NOT NULL COMMENT 'è¯­è¨€',
  `mi_profess` tinyint(1) NOT NULL COMMENT 'ä¸“ä¸š',
  `mi_income` tinyint(1) NOT NULL COMMENT 'å¹´è–ª',
  `mi_province` varchar(10) NOT NULL COMMENT 'åŒ¹é…çš„åœ°åŒº(çœ)',
  `m_gender` varchar(1) NOT NULL DEFAULT 'F' COMMENT 'åŒ¹é…çš„æ€§åˆ«  ç”·æˆ–è€…å¥³(MorF)',
  `mi_kids` tinyint(4) NOT NULL,
  PRIMARY KEY (`manid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `info_match_qt` */

DROP TABLE IF EXISTS `info_match_qt`;

CREATE TABLE `info_match_qt` (
  `manid` varchar(12) NOT NULL,
  `age1` tinyint(1) NOT NULL,
  `age2` tinyint(1) NOT NULL,
  `m_country` varchar(50) NOT NULL,
  `m_marry` tinyint(4) NOT NULL,
  `m_children` tinyint(4) NOT NULL,
  `m_education` tinyint(4) NOT NULL,
  `m_height1` tinyint(4) NOT NULL,
  `m_height2` tinyint(4) NOT NULL,
  `m_smoke` tinyint(4) NOT NULL,
  `m_drike` tinyint(4) NOT NULL,
  `mi_hair` tinyint(4) NOT NULL,
  `mi_eye` tinyint(4) NOT NULL,
  `mi_body` tinyint(4) NOT NULL,
  `mi_ethnict` tinyint(4) NOT NULL,
  `mi_religion` tinyint(4) NOT NULL,
  `mi_language` varchar(50) NOT NULL,
  `mi_profess` tinyint(4) NOT NULL,
  `mi_income` tinyint(4) NOT NULL,
  `mi_kids` tinyint(4) NOT NULL,
  `m_gender` varchar(1) NOT NULL,
  PRIMARY KEY (`manid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `info_match_ru` */

DROP TABLE IF EXISTS `info_match_ru`;

CREATE TABLE `info_match_ru` (
  `manid` varchar(12) NOT NULL,
  `age1` tinyint(1) NOT NULL,
  `age2` tinyint(1) NOT NULL,
  `m_country` varchar(50) NOT NULL,
  `m_marry` tinyint(4) NOT NULL,
  `m_children` tinyint(4) NOT NULL,
  `m_education` tinyint(4) NOT NULL,
  `m_height1` tinyint(4) NOT NULL,
  `m_height2` tinyint(4) NOT NULL,
  `m_smoke` tinyint(4) NOT NULL,
  `m_drike` tinyint(4) NOT NULL,
  `mi_hair` tinyint(4) NOT NULL,
  `mi_eye` tinyint(4) NOT NULL,
  `mi_body` tinyint(4) NOT NULL,
  `mi_ethnict` tinyint(4) NOT NULL,
  `mi_religion` tinyint(4) NOT NULL,
  `mi_language` varchar(50) NOT NULL,
  `mi_profess` tinyint(4) NOT NULL,
  `mi_income` tinyint(4) NOT NULL,
  `mi_kids` tinyint(4) NOT NULL,
  PRIMARY KEY (`manid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `info_match_th` */

DROP TABLE IF EXISTS `info_match_th`;

CREATE TABLE `info_match_th` (
  `manid` varchar(12) NOT NULL,
  `age1` tinyint(1) NOT NULL,
  `age2` tinyint(1) NOT NULL,
  `m_country` varchar(50) NOT NULL,
  `m_marry` tinyint(4) NOT NULL,
  `m_children` tinyint(4) NOT NULL,
  `m_education` tinyint(4) NOT NULL,
  `m_height1` tinyint(4) NOT NULL,
  `m_height2` tinyint(4) NOT NULL,
  `m_smoke` tinyint(4) NOT NULL,
  `m_drike` tinyint(4) NOT NULL,
  `mi_hair` tinyint(4) NOT NULL,
  `mi_eye` tinyint(4) NOT NULL,
  `mi_body` tinyint(4) NOT NULL,
  `mi_ethnict` tinyint(4) NOT NULL,
  `mi_religion` tinyint(4) NOT NULL,
  `mi_language` varchar(50) NOT NULL,
  `mi_profess` tinyint(4) NOT NULL,
  `mi_income` tinyint(4) NOT NULL,
  `mi_kids` tinyint(4) NOT NULL,
  `m_gender` varchar(1) NOT NULL,
  PRIMARY KEY (`manid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `info_modify` */

DROP TABLE IF EXISTS `info_modify`;

CREATE TABLE `info_modify` (
  `manid` varchar(12) NOT NULL,
  `modify_passwd_time` datetime NOT NULL,
  PRIMARY KEY (`manid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `info_modify_log` */

DROP TABLE IF EXISTS `info_modify_log`;

CREATE TABLE `info_modify_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `manid` varchar(20) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `old_password_hash` varchar(64) NOT NULL,
  `new_password_hash` varchar(64) NOT NULL,
  `old_email` varchar(128) NOT NULL,
  `new_email` varchar(128) NOT NULL,
  `find_ps_sn` varchar(64) NOT NULL,
  `find_ps_email` varchar(128) NOT NULL,
  `country` char(2) NOT NULL,
  `living` char(2) NOT NULL,
  `ip` varchar(32) NOT NULL,
  `ip_isp` varchar(100) NOT NULL,
  `ip_country` varchar(100) NOT NULL,
  `ip_region` varchar(100) NOT NULL,
  `ip_city` varchar(100) NOT NULL,
  `modify_mode` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `modify_time` datetime NOT NULL,
  `modify_num` int(1) unsigned NOT NULL DEFAULT '0',
  `device_id` varchar(40) NOT NULL,
  `browser` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`,`modify_time`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Table structure for table `info_physical` */

DROP TABLE IF EXISTS `info_physical`;

CREATE TABLE `info_physical` (
  `manid` varchar(12) NOT NULL,
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
  `device_id` varchar(40) NOT NULL,
  `device_model` varchar(30) NOT NULL,
  `referer_page` varchar(1024) NOT NULL DEFAULT '',
  `ga_uid` varchar(50) NOT NULL,
  PRIMARY KEY (`manid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `info_repetition` */

DROP TABLE IF EXISTS `info_repetition`;

CREATE TABLE `info_repetition` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `siteid` tinyint(1) NOT NULL DEFAULT '0',
  `country` char(2) NOT NULL,
  `reg_time` datetime NOT NULL,
  `reg_cookie` varchar(20) NOT NULL,
  `reg_compid` varchar(30) NOT NULL,
  `reg_ip` varchar(16) NOT NULL,
  `reg_cookie_total` int(10) NOT NULL DEFAULT '0',
  `reg_compid_total` int(10) NOT NULL DEFAULT '0',
  `reg_ip_total` int(10) NOT NULL DEFAULT '0',
  `is_repeat` tinyint(4) NOT NULL DEFAULT '0',
  `is_repeat_sign` tinyint(1) NOT NULL DEFAULT '0',
  `repeat_type` tinyint(4) NOT NULL DEFAULT '0',
  `repeat_total` int(10) unsigned NOT NULL,
  `dispose_status` tinyint(1) NOT NULL DEFAULT '0',
  `staff_id` varchar(10) NOT NULL,
  `staff_name` varchar(30) NOT NULL,
  `dispose_time` datetime NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `add_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8;

/*Table structure for table `info_repetition_exp` */

DROP TABLE IF EXISTS `info_repetition_exp`;

CREATE TABLE `info_repetition_exp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `exp_cookie` varchar(20) NOT NULL,
  `exp_compid` varchar(40) NOT NULL,
  `exp_ip` varchar(16) NOT NULL,
  `exp_type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `remarks` varchar(255) NOT NULL,
  `add_time` datetime NOT NULL,
  `staff_id_add` varchar(10) NOT NULL,
  `staff_name_add` varchar(30) NOT NULL,
  `edit_time` datetime NOT NULL,
  `staff_id_edit` varchar(10) NOT NULL,
  `staff_name_edit` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Table structure for table `info_site_cl` */

DROP TABLE IF EXISTS `info_site_cl`;

CREATE TABLE `info_site_cl` (
  `manid` varchar(12) NOT NULL,
  `updatebyemail` char(1) NOT NULL DEFAULT 'y',
  `sendadm` tinyint(4) NOT NULL DEFAULT '1',
  `admirer_notify` tinyint(4) NOT NULL DEFAULT '1',
  `cupid_notify` tinyint(4) NOT NULL DEFAULT '1',
  `emf_notify` tinyint(4) NOT NULL DEFAULT '1',
  `lovecall_notify` tinyint(4) NOT NULL DEFAULT '1',
  `activity_notify` tinyint(4) NOT NULL DEFAULT '1',
  `sendadm2` tinyint(1) NOT NULL DEFAULT '1',
  `permit` char(1) NOT NULL DEFAULT 'Y',
  `cupid_max_num` int(4) unsigned NOT NULL DEFAULT '5',
  `chat_sendvoice` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `private_album_free` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `private_album_send` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `private_album_receive` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `private_short_receive` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`manid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `info_site_ld` */

DROP TABLE IF EXISTS `info_site_ld`;

CREATE TABLE `info_site_ld` (
  `manid` varchar(12) NOT NULL,
  `updatebyemail` char(1) NOT NULL DEFAULT 'y',
  `sendadm` tinyint(4) NOT NULL DEFAULT '1',
  `admirer_notify` tinyint(4) NOT NULL DEFAULT '1',
  `cupid_notify` tinyint(4) NOT NULL DEFAULT '1',
  `emf_notify` tinyint(4) NOT NULL DEFAULT '1',
  `lovecall_notify` tinyint(4) NOT NULL DEFAULT '1',
  `activity_notify` tinyint(4) NOT NULL DEFAULT '1',
  `sendadm2` tinyint(1) NOT NULL DEFAULT '1',
  `permit` char(1) NOT NULL DEFAULT 'Y',
  `cupid_max_num` int(4) unsigned NOT NULL DEFAULT '5',
  `chat_sendvoice` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `private_album_free` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `private_album_send` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `private_album_receive` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `private_short_receive` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`manid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `info_site_qp` */

DROP TABLE IF EXISTS `info_site_qp`;

CREATE TABLE `info_site_qp` (
  `manid` varchar(12) NOT NULL,
  `updatebyemail` char(1) NOT NULL DEFAULT 'y' COMMENT 'æ˜¯å¦æŽ¥å—æ¯å‘¨æ›´æ–°',
  `show_hidden` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'èµ„æ–™æ˜¯å¦éšè—1:æ˜¾ç¤º 0:éšè—',
  `permit` char(1) NOT NULL DEFAULT 'Y' COMMENT 'æœåŠ¡è®¸å¯çŠ¶æ€Y:å…è®¸(default) N:ç¦æ­¢ S:å†»ç»“',
  `service_start` int(10) NOT NULL COMMENT 'ä»˜è´¹å¼€å§‹æ—¶é—´',
  `service_expired` int(10) NOT NULL DEFAULT '0' COMMENT 'æœˆè´¹åˆ°æœŸæ—¶é—´',
  `service_pkg` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'æœåŠ¡å¥—é¤åž‹1:ä»£è¡¨ä¸€ä¸ªæœˆ2:ä»£è¡¨ä¸‰ä¸ªæœˆ3:ä»£è¡¨å…­ä¸ªæœˆ',
  `trial_flag` char(1) NOT NULL DEFAULT 'N' COMMENT 'æ˜¯å¦äº«å—è¿‡å…è´¹å¥—é¤',
  `is_renew` tinyint(1) NOT NULL COMMENT 'æ˜¯å¦è‡ªåŠ¨ç»­è´¹1:æ˜¯  2:å¦',
  `paynum` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'ä¼šå‘˜åœ¨æœ¬ç«™æ¶ˆè´¹æ¬¡æ•°',
  `email_notify` tinyint(1) NOT NULL DEFAULT '4' COMMENT 'å¤šé•¿æ—¶é—´é€šçŸ¥è¯¥ä¼šå‘˜é‚®ä»¶æŽ¥æ”¶æƒ…å†µ1:æ¯å°éƒ½é€šçŸ¥2:æ¯å¤© 3:ä¸€å‘¨ä¸¤æ¬¡ 4:ä»Žä¸',
  `tpsv_ispass` char(1) NOT NULL DEFAULT '3' COMMENT '1:æœªé€šè¿‡   2:å·²é€šè¿‡ 3:å®¡æ ¸ä¸­',
  PRIMARY KEY (`manid`),
  KEY `show_hidden` (`show_hidden`),
  KEY `service_start` (`service_start`,`service_expired`),
  KEY `service_expired` (`service_expired`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `info_site_qt` */

DROP TABLE IF EXISTS `info_site_qt`;

CREATE TABLE `info_site_qt` (
  `manid` varchar(12) NOT NULL,
  `updatebyemail` char(1) NOT NULL DEFAULT 'y' COMMENT 'æ˜¯å¦æŽ¥å—æ¯å‘¨æ›´æ–°',
  `show_hidden` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'èµ„æ–™æ˜¯å¦éšè—1:æ˜¾ç¤º 0:éšè—',
  `permit` char(1) NOT NULL DEFAULT 'Y' COMMENT 'æœåŠ¡è®¸å¯çŠ¶æ€Y:å…è®¸(default) N:ç¦æ­¢ S:å†»ç»“',
  `service_start` int(10) NOT NULL COMMENT 'ä»˜è´¹å¼€å§‹æ—¶é—´',
  `service_expired` int(10) NOT NULL DEFAULT '0' COMMENT 'æœˆè´¹åˆ°æœŸæ—¶é—´',
  `is_renew` tinyint(1) NOT NULL COMMENT 'æ˜¯å¦è‡ªåŠ¨ç»­è´¹1:æ˜¯  2:å¦',
  `email_notify` tinyint(1) NOT NULL DEFAULT '4' COMMENT 'å¤šé•¿æ—¶é—´é€šçŸ¥è¯¥ä¼šå‘˜é‚®ä»¶æŽ¥æ”¶æƒ…å†µ1:æ¯å°éƒ½é€šçŸ¥2:æ¯å¤© 3:ä¸€å‘¨ä¸¤æ¬¡ 4:ä»Žä¸',
  PRIMARY KEY (`manid`),
  KEY `show_hidden` (`show_hidden`),
  KEY `service_start` (`service_start`,`service_expired`),
  KEY `service_expired` (`service_expired`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `info_site_ru` */

DROP TABLE IF EXISTS `info_site_ru`;

CREATE TABLE `info_site_ru` (
  `manid` varchar(12) NOT NULL,
  `updatebyemail` char(1) NOT NULL DEFAULT 'y',
  `sendadm` tinyint(4) NOT NULL DEFAULT '1',
  `admirer_notify` tinyint(4) NOT NULL DEFAULT '1',
  `cupid_notify` tinyint(4) NOT NULL DEFAULT '1',
  `emf_notify` tinyint(4) NOT NULL DEFAULT '1',
  `lovecall_notify` tinyint(4) NOT NULL DEFAULT '1',
  `activity_notify` tinyint(4) NOT NULL DEFAULT '1',
  `sendadm2` tinyint(1) NOT NULL DEFAULT '1',
  `permit` char(1) NOT NULL DEFAULT 'Y',
  `cupid_max_num` int(4) unsigned NOT NULL DEFAULT '5',
  `chat_sendvoice` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `private_album_free` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `private_album_send` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `private_album_receive` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `private_short_receive` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`manid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `info_site_th` */

DROP TABLE IF EXISTS `info_site_th`;

CREATE TABLE `info_site_th` (
  `manid` varchar(12) NOT NULL,
  `updatebyemail` char(1) NOT NULL DEFAULT 'y',
  `sendadm` tinyint(4) NOT NULL DEFAULT '1',
  `admirer_notify` tinyint(4) NOT NULL DEFAULT '1',
  `cupid_notify` tinyint(4) NOT NULL DEFAULT '1',
  `emf_notify` tinyint(4) NOT NULL DEFAULT '1',
  `lovecall_notify` tinyint(4) NOT NULL DEFAULT '1',
  `activity_notify` tinyint(4) NOT NULL DEFAULT '1',
  `sendadm2` tinyint(1) NOT NULL DEFAULT '1',
  `permit` char(1) NOT NULL DEFAULT 'Y',
  `cupid_max_num` int(4) unsigned NOT NULL DEFAULT '5',
  `chat_sendvoice` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `private_album_free` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `private_album_send` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `private_album_receive` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `private_short_receive` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`manid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `info_unique_check` */

DROP TABLE IF EXISTS `info_unique_check`;

CREATE TABLE `info_unique_check` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniq_type` tinyint(3) NOT NULL,
  `uniq_data` varchar(150) NOT NULL,
  `adddate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_data` (`uniq_data`,`uniq_type`)
) ENGINE=InnoDB AUTO_INCREMENT=1753 DEFAULT CHARSET=utf8;

/*Table structure for table `integral` */

DROP TABLE IF EXISTS `integral`;

CREATE TABLE `integral` (
  `ig_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `serial_number` varchar(16) NOT NULL,
  `manid` varchar(12) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `siteid` varchar(1) NOT NULL,
  `add_time` datetime NOT NULL,
  `rule_code` char(6) NOT NULL,
  `rule_name_cn` varchar(255) NOT NULL,
  `rule_name_en` varchar(255) NOT NULL,
  `associate_id` varchar(25) NOT NULL,
  `integral` int(1) NOT NULL DEFAULT '0',
  `integral_total` int(1) NOT NULL DEFAULT '0',
  `integral_type` char(1) NOT NULL,
  `follower` varchar(30) NOT NULL,
  `follower_staffid` varchar(20) NOT NULL,
  `expire_flag` tinyint(1) NOT NULL DEFAULT '0',
  `expire_time` datetime NOT NULL,
  `expire_id` int(11) NOT NULL DEFAULT '0',
  `balance` int(3) NOT NULL DEFAULT '0',
  `used_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `used_times` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ig_id`),
  KEY `serial_number` (`serial_number`,`manid`,`rule_code`,`integral_type`)
) ENGINE=MyISAM AUTO_INCREMENT=8101 DEFAULT CHARSET=utf8;

/*Table structure for table `integral_expired_log` */

DROP TABLE IF EXISTS `integral_expired_log`;

CREATE TABLE `integral_expired_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `dc_integral` decimal(32,0) DEFAULT NULL,
  `integral` int(5) NOT NULL DEFAULT '0',
  `dc_integral_last` int(5) NOT NULL DEFAULT '0',
  `mb_level` char(1) NOT NULL DEFAULT 'E',
  `last_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(1) NOT NULL DEFAULT '1',
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `integral_mark` */

DROP TABLE IF EXISTS `integral_mark`;

CREATE TABLE `integral_mark` (
  `im_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `integral_201301` char(1) NOT NULL DEFAULT '1',
  `integral_201302` char(1) NOT NULL DEFAULT '1',
  `integral_201303` char(1) NOT NULL DEFAULT '1',
  `integral_201304` char(1) NOT NULL DEFAULT '1',
  `serial_number` varchar(16) NOT NULL,
  `rule_code` char(6) NOT NULL,
  `operating_time` datetime NOT NULL,
  PRIMARY KEY (`im_id`),
  KEY `manid` (`manid`,`serial_number`,`rule_code`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

/*Table structure for table `lovecall_credit_history` */

DROP TABLE IF EXISTS `lovecall_credit_history`;

CREATE TABLE `lovecall_credit_history` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `dataid` varchar(35) NOT NULL,
  `manid` varchar(12) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `formno` varchar(20) NOT NULL,
  `callid` int(4) unsigned NOT NULL DEFAULT '1',
  `call_mode` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `credits` decimal(10,2) NOT NULL DEFAULT '0.00',
  `balance` decimal(7,2) NOT NULL,
  `addtime` datetime NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`,`formno`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `lovecall_member_bak` */

DROP TABLE IF EXISTS `lovecall_member_bak`;

CREATE TABLE `lovecall_member_bak` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `pin` char(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `manid` (`manid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Table structure for table `man_report` */

DROP TABLE IF EXISTS `man_report`;

CREATE TABLE `man_report` (
  `r_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` tinyint(1) NOT NULL DEFAULT '0',
  `report_id` varchar(12) NOT NULL,
  `type` varchar(1) NOT NULL DEFAULT 'A',
  `manid` varchar(12) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `title` varchar(50) NOT NULL,
  `report_type` varchar(100) NOT NULL,
  `report_explain` text NOT NULL,
  `agent_id` varchar(6) NOT NULL,
  `report_staff` varchar(10) NOT NULL,
  `report_name` varchar(30) NOT NULL,
  `division_staff` varchar(10) NOT NULL,
  `division_name` varchar(30) NOT NULL,
  `report_time` datetime NOT NULL,
  `edit_time` datetime NOT NULL,
  `remarks` text NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT '1',
  `im_dept` varchar(100) NOT NULL,
  PRIMARY KEY (`r_id`),
  KEY `report_id` (`report_id`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

/*Table structure for table `mb_actions` */

DROP TABLE IF EXISTS `mb_actions`;

CREATE TABLE `mb_actions` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL COMMENT 'ä¼šå‘˜ID',
  `act_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'åŠ¨ä½œç±»åž‹(0:ç”·å£«è¯»EMFå›žä¿¡)',
  `act_time` datetime NOT NULL COMMENT 'åŠ¨ä½œæ—¶é—´',
  `refid` varchar(20) NOT NULL COMMENT 'å‚è€ƒå·(EMFä¿¡ä»¶IDç­‰)',
  `siteid` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ç«™ç‚¹ID',
  PRIMARY KEY (`id`),
  KEY `refid` (`refid`)
) ENGINE=MyISAM AUTO_INCREMENT=643 DEFAULT CHARSET=utf8;

/*Table structure for table `mb_credit_balance` */

DROP TABLE IF EXISTS `mb_credit_balance`;

CREATE TABLE `mb_credit_balance` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `manname` varchar(40) NOT NULL,
  `money` decimal(6,2) NOT NULL DEFAULT '0.00',
  `addtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `addtime` (`addtime`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Table structure for table `mb_online` */

DROP TABLE IF EXISTS `mb_online`;

CREATE TABLE `mb_online` (
  `manid` varchar(12) NOT NULL,
  `lastuptime` int(10) NOT NULL,
  KEY `manid` (`manid`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

/*Table structure for table `member_blacked` */

DROP TABLE IF EXISTS `member_blacked`;

CREATE TABLE `member_blacked` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `manid` varchar(20) NOT NULL,
  `adddate` datetime NOT NULL,
  `staff` varchar(20) NOT NULL,
  `staffid` varchar(12) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `manid` (`manid`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

/*Table structure for table `member_credits_ansy` */

DROP TABLE IF EXISTS `member_credits_ansy`;

CREATE TABLE `member_credits_ansy` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `manid` varchar(30) NOT NULL,
  `credits` decimal(9,2) NOT NULL,
  `time1` datetime NOT NULL,
  `time2` datetime NOT NULL,
  `adddate` datetime NOT NULL,
  `status` tinyint(4) NOT NULL,
  `result` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`)
) ENGINE=InnoDB AUTO_INCREMENT=691 DEFAULT CHARSET=utf8;

/*Table structure for table `member_credits_logs` */

DROP TABLE IF EXISTS `member_credits_logs`;

CREATE TABLE `member_credits_logs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `last_login` datetime NOT NULL,
  `adddate` datetime NOT NULL,
  `money_before` decimal(11,2) NOT NULL,
  `money_after` decimal(11,2) NOT NULL,
  `credits` decimal(11,2) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`),
  KEY `adddate` (`adddate`)
) ENGINE=MRG_MyISAM DEFAULT CHARSET=utf8 INSERT_METHOD=LAST UNION=(`member_credits_logs_201302`,`member_credits_logs_201303`);

/*Table structure for table `member_credits_logs_201302` */

DROP TABLE IF EXISTS `member_credits_logs_201302`;

CREATE TABLE `member_credits_logs_201302` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `last_login` datetime NOT NULL,
  `adddate` datetime NOT NULL,
  `money_before` decimal(11,2) NOT NULL,
  `money_after` decimal(11,2) NOT NULL,
  `credits` decimal(11,2) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`),
  KEY `adddate` (`adddate`)
) ENGINE=MyISAM AUTO_INCREMENT=512 DEFAULT CHARSET=utf8;

/*Table structure for table `member_credits_logs_201303` */

DROP TABLE IF EXISTS `member_credits_logs_201303`;

CREATE TABLE `member_credits_logs_201303` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `last_login` datetime NOT NULL,
  `adddate` datetime NOT NULL,
  `money_before` decimal(11,2) NOT NULL,
  `money_after` decimal(11,2) NOT NULL,
  `credits` decimal(11,2) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`),
  KEY `adddate` (`adddate`)
) ENGINE=MyISAM AUTO_INCREMENT=597787 DEFAULT CHARSET=utf8;

/*Table structure for table `member_facebook` */

DROP TABLE IF EXISTS `member_facebook`;

CREATE TABLE `member_facebook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `siteid` tinyint(1) NOT NULL DEFAULT '0',
  `fb_uid` varchar(20) NOT NULL,
  `fb_email` varchar(80) NOT NULL,
  `fb_token` varchar(255) NOT NULL,
  `uptime` int(10) unsigned NOT NULL,
  `losetime` int(10) unsigned NOT NULL,
  `bindtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Table structure for table `member_facebook_info` */

DROP TABLE IF EXISTS `member_facebook_info`;

CREATE TABLE `member_facebook_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `manid` varchar(15) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `siteid` tinyint(1) NOT NULL DEFAULT '0',
  `first_bindtime` int(10) unsigned NOT NULL DEFAULT '0',
  `is_facebook` tinyint(1) NOT NULL DEFAULT '0',
  `is_cl` tinyint(1) NOT NULL DEFAULT '0',
  `is_ida` tinyint(1) NOT NULL DEFAULT '0',
  `is_cd` tinyint(1) NOT NULL DEFAULT '0',
  `is_ld` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`),
  KEY `first_bindtime` (`first_bindtime`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Table structure for table `member_grade_list` */

DROP TABLE IF EXISTS `member_grade_list`;

CREATE TABLE `member_grade_list` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `manid` varchar(15) NOT NULL,
  `ads_type` tinyint(1) NOT NULL,
  `adsuser` varchar(40) NOT NULL,
  `login_num` int(1) unsigned NOT NULL,
  `reg_time` datetime NOT NULL,
  `stat_time` datetime NOT NULL,
  `fs_login` int(5) NOT NULL DEFAULT '0',
  `fs_email_verified` int(5) NOT NULL DEFAULT '0',
  `fs_upload_photo` int(5) NOT NULL DEFAULT '0',
  `fs_view_profile` int(5) NOT NULL DEFAULT '0',
  `fs_admire` int(5) NOT NULL DEFAULT '0',
  `fs_bp_emf` int(5) NOT NULL DEFAULT '0',
  `fs_free_livechat` int(5) NOT NULL DEFAULT '0',
  `fs_order` int(5) NOT NULL DEFAULT '0',
  `fs_verified_creditcard` int(5) NOT NULL DEFAULT '0',
  `dc_ip` int(5) NOT NULL DEFAULT '0',
  `dc_device` int(5) NOT NULL DEFAULT '0',
  `dc_proxy` int(5) NOT NULL DEFAULT '0',
  `my_grade` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `manid` (`manid`),
  KEY `adsuser` (`adsuser`,`ads_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2565 DEFAULT CHARSET=utf8;

/*Table structure for table `member_grade_list_tmp` */

DROP TABLE IF EXISTS `member_grade_list_tmp`;

CREATE TABLE `member_grade_list_tmp` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `manid` varchar(15) NOT NULL,
  `reg_time` datetime NOT NULL,
  `stat_time` datetime NOT NULL,
  `fs_login` int(5) NOT NULL DEFAULT '0',
  `fs_email_verified` int(5) NOT NULL DEFAULT '0',
  `fs_upload_photo` int(5) NOT NULL DEFAULT '0',
  `fs_view_profile` int(5) NOT NULL DEFAULT '0',
  `fs_admire` int(5) NOT NULL DEFAULT '0',
  `fs_bp_emf` int(5) NOT NULL DEFAULT '0',
  `fs_free_livechat` int(5) NOT NULL DEFAULT '0',
  `fs_order` int(5) NOT NULL DEFAULT '0',
  `fs_verified_creditcard` int(5) NOT NULL DEFAULT '0',
  `dc_ip` int(5) NOT NULL DEFAULT '0',
  `dc_device` int(5) NOT NULL DEFAULT '0',
  `dc_proxy` int(5) NOT NULL DEFAULT '0',
  `my_grade` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `manid` (`manid`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;

/*Table structure for table `member_history` */

DROP TABLE IF EXISTS `member_history`;

CREATE TABLE `member_history` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `agent` varchar(10) NOT NULL,
  `flag` char(3) NOT NULL,
  `credit` decimal(7,2) NOT NULL,
  `comm` text,
  `msgid` varchar(10) DEFAULT NULL,
  `manid` varchar(15) NOT NULL,
  `womanid` varchar(15) NOT NULL,
  `balance` decimal(7,2) NOT NULL,
  `comm2` varchar(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `siteid` tinyint(2) NOT NULL DEFAULT '0',
  `device_type` varchar(2) NOT NULL DEFAULT '10',
  `device_id` varchar(40) NOT NULL DEFAULT '',
  `ref_id` varchar(35) NOT NULL DEFAULT '',
  `service_endtime` datetime DEFAULT NULL,
  `flag_agent` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `credit_agent` decimal(7,2) NOT NULL DEFAULT '0.00',
  `last_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`),
  KEY `womanid` (`womanid`),
  KEY `forstat` (`adddate`,`agent`,`flag`),
  KEY `ref_id` (`ref_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2060947 DEFAULT CHARSET=utf8;

/*Table structure for table `member_history_2012` */

DROP TABLE IF EXISTS `member_history_2012`;

CREATE TABLE `member_history_2012` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `agent` varchar(10) NOT NULL DEFAULT '',
  `flag` char(3) NOT NULL,
  `credit` decimal(7,2) NOT NULL,
  `comm` text,
  `msgid` varchar(10) NOT NULL DEFAULT '',
  `manid` varchar(15) NOT NULL DEFAULT '',
  `womanid` varchar(15) NOT NULL DEFAULT '',
  `balance` decimal(7,2) NOT NULL,
  `comm2` varchar(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `siteid` tinyint(2) NOT NULL DEFAULT '0',
  `device_type` varchar(2) NOT NULL DEFAULT '10',
  `device_id` varchar(40) NOT NULL DEFAULT '',
  `ref_id` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`),
  KEY `womanid` (`womanid`),
  KEY `forstat` (`adddate`,`agent`,`flag`)
) ENGINE=MyISAM AUTO_INCREMENT=16896066 DEFAULT CHARSET=utf8;

/*Table structure for table `member_history_2012_verfiy` */

DROP TABLE IF EXISTS `member_history_2012_verfiy`;

CREATE TABLE `member_history_2012_verfiy` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `agent` varchar(10) NOT NULL DEFAULT '',
  `flag` char(3) NOT NULL,
  `credit` decimal(7,2) NOT NULL,
  `comm` text,
  `msgid` varchar(10) NOT NULL DEFAULT '',
  `manid` varchar(15) NOT NULL DEFAULT '',
  `womanid` varchar(15) NOT NULL DEFAULT '',
  `balance` decimal(7,2) NOT NULL,
  `comm2` varchar(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `siteid` tinyint(2) NOT NULL DEFAULT '0',
  `device_type` varchar(2) NOT NULL DEFAULT '10',
  `device_id` varchar(40) NOT NULL DEFAULT '',
  `ref_id` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`),
  KEY `womanid` (`womanid`),
  KEY `forstat` (`adddate`,`agent`,`flag`)
) ENGINE=MyISAM AUTO_INCREMENT=16896066 DEFAULT CHARSET=utf8;

/*Table structure for table `member_history_acc` */

DROP TABLE IF EXISTS `member_history_acc`;

CREATE TABLE `member_history_acc` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `agent` varchar(10) NOT NULL,
  `flag` char(3) NOT NULL,
  `credit` decimal(7,2) NOT NULL,
  `comm` text,
  `msgid` varchar(10) DEFAULT NULL,
  `manid` varchar(15) NOT NULL,
  `womanid` varchar(15) NOT NULL,
  `balance` decimal(7,2) NOT NULL,
  `comm2` varchar(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `siteid` tinyint(2) NOT NULL DEFAULT '0',
  `device_type` varchar(2) NOT NULL DEFAULT '10',
  `device_id` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`),
  KEY `womanid` (`womanid`),
  KEY `forstat` (`adddate`,`agent`,`flag`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Table structure for table `member_history_acc1` */

DROP TABLE IF EXISTS `member_history_acc1`;

CREATE TABLE `member_history_acc1` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `agent` varchar(10) NOT NULL,
  `flag` char(3) NOT NULL,
  `credit` decimal(7,2) NOT NULL,
  `comm` text,
  `msgid` varchar(10) DEFAULT NULL,
  `manid` varchar(15) NOT NULL,
  `womanid` varchar(15) NOT NULL,
  `balance` decimal(7,2) NOT NULL,
  `comm2` varchar(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `siteid` tinyint(2) NOT NULL DEFAULT '0',
  `device_type` varchar(2) NOT NULL DEFAULT '10',
  `device_id` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`),
  KEY `womanid` (`womanid`),
  KEY `forstat` (`adddate`,`agent`,`flag`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `member_history_fix` */

DROP TABLE IF EXISTS `member_history_fix`;

CREATE TABLE `member_history_fix` (
  `id` int(8) NOT NULL DEFAULT '0',
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `agent` varchar(10) NOT NULL DEFAULT '',
  `flag` char(3) NOT NULL,
  `credit` decimal(7,2) NOT NULL,
  `comm` text,
  `msgid` varchar(10) NOT NULL DEFAULT '',
  `manid` varchar(15) NOT NULL DEFAULT '',
  `womanid` varchar(15) NOT NULL DEFAULT '',
  `balance` decimal(7,2) NOT NULL,
  `comm2` varchar(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `siteid` tinyint(2) NOT NULL DEFAULT '0',
  `device_type` varchar(2) NOT NULL DEFAULT '10',
  `device_id` varchar(40) NOT NULL DEFAULT '',
  `ref_id` varchar(35) NOT NULL DEFAULT '',
  `service_endtime` datetime DEFAULT NULL,
  `flag_agent` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `credit_agent` decimal(7,2) NOT NULL DEFAULT '0.00',
  `last_update` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL,
  `processed` tinyint(4) NOT NULL,
  `processed_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`,`processed`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `member_history_innodb` */

DROP TABLE IF EXISTS `member_history_innodb`;

CREATE TABLE `member_history_innodb` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `agent` varchar(10) NOT NULL DEFAULT '',
  `flag` char(2) NOT NULL DEFAULT '',
  `credit` decimal(7,2) NOT NULL,
  `comm` varchar(650) DEFAULT NULL,
  `msgid` varchar(10) NOT NULL DEFAULT '',
  `manid` varchar(15) NOT NULL DEFAULT '',
  `womanid` varchar(15) NOT NULL DEFAULT '',
  `balance` decimal(7,2) NOT NULL,
  `comm2` varchar(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `siteid` tinyint(2) NOT NULL DEFAULT '0',
  `device_type` varchar(2) NOT NULL DEFAULT '10',
  `device_id` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`adddate`),
  KEY `manid` (`manid`),
  KEY `womanid` (`womanid`),
  KEY `forstat` (`adddate`,`agent`,`flag`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8
/*!50100 PARTITION BY RANGE (year(adddate))
(PARTITION part2007 VALUES LESS THAN (2008) ENGINE = InnoDB,
 PARTITION part2008 VALUES LESS THAN (2009) ENGINE = InnoDB,
 PARTITION part2009 VALUES LESS THAN (2010) ENGINE = InnoDB,
 PARTITION part2010 VALUES LESS THAN (2011) ENGINE = InnoDB,
 PARTITION part2011 VALUES LESS THAN (2012) ENGINE = InnoDB,
 PARTITION part2012 VALUES LESS THAN (2013) ENGINE = InnoDB,
 PARTITION part2013 VALUES LESS THAN (2014) ENGINE = InnoDB,
 PARTITION part2014 VALUES LESS THAN (2015) ENGINE = InnoDB,
 PARTITION partother VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;

/*Table structure for table `member_history_temp` */

DROP TABLE IF EXISTS `member_history_temp`;

CREATE TABLE `member_history_temp` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `agent` varchar(10) NOT NULL,
  `flag` char(2) NOT NULL DEFAULT '',
  `credit` decimal(7,2) NOT NULL,
  `comm` varchar(50) NOT NULL,
  `msgid` varchar(10) DEFAULT NULL,
  `manid` varchar(15) NOT NULL,
  `womanid` varchar(15) NOT NULL,
  `balance` decimal(7,2) NOT NULL,
  `comm2` varchar(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `siteid` tinyint(2) NOT NULL DEFAULT '0',
  `device_type` varchar(2) NOT NULL DEFAULT '10',
  `device_id` varchar(40) NOT NULL DEFAULT '',
  `ref_id` varchar(35) NOT NULL DEFAULT '0',
  `service_endtime` datetime DEFAULT NULL,
  `flag_agent` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `credit_agent` decimal(7,2) NOT NULL DEFAULT '0.00',
  `last_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comm` (`comm`),
  KEY `ref_id` (`ref_id`)
) ENGINE=MyISAM AUTO_INCREMENT=131416 DEFAULT CHARSET=utf8;

/*Table structure for table `member_history_videoshow` */

DROP TABLE IF EXISTS `member_history_videoshow`;

CREATE TABLE `member_history_videoshow` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `agent` varchar(10) NOT NULL DEFAULT '',
  `flag` char(2) NOT NULL DEFAULT '',
  `credit` decimal(7,2) NOT NULL,
  `comm` text,
  `msgid` varchar(10) NOT NULL DEFAULT '',
  `manid` varchar(15) NOT NULL DEFAULT '',
  `womanid` varchar(15) NOT NULL DEFAULT '',
  `balance` decimal(7,2) NOT NULL,
  `comm2` varchar(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `siteid` tinyint(2) NOT NULL DEFAULT '0',
  `device_type` varchar(2) NOT NULL DEFAULT '10',
  `device_id` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`),
  KEY `womanid` (`womanid`),
  KEY `forstat` (`adddate`,`agent`,`flag`)
) ENGINE=MyISAM AUTO_INCREMENT=1918968 DEFAULT CHARSET=utf8;

/*Table structure for table `member_lab` */

DROP TABLE IF EXISTS `member_lab`;

CREATE TABLE `member_lab` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `birthday` date NOT NULL,
  `submitdate` datetime NOT NULL,
  `mb_level` char(1) NOT NULL,
  `firstorder_time` datetime DEFAULT NULL,
  `order_num` int(3) NOT NULL DEFAULT '0',
  `paid_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `money` decimal(7,2) NOT NULL DEFAULT '0.00',
  `last_login` datetime NOT NULL,
  `promuser` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `adddate` datetime NOT NULL,
  `validtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `manid` (`manid`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Table structure for table `member_mau3plus` */

DROP TABLE IF EXISTS `member_mau3plus`;

CREATE TABLE `member_mau3plus` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `manid` varchar(15) NOT NULL,
  `stats_month` date DEFAULT NULL,
  `login_num` bigint(21) NOT NULL DEFAULT '0',
  `siteid` tinyint(1) NOT NULL,
  `submitdate` datetime NOT NULL,
  `ads_type` tinyint(1) NOT NULL DEFAULT '0',
  `adsuser` varchar(15) NOT NULL,
  `history_num` int(8) NOT NULL DEFAULT '0',
  `credits` decimal(7,2) NOT NULL,
  `paid_amount` decimal(10,2) DEFAULT NULL,
  `order_num` int(5) DEFAULT NULL,
  `firstorder_time` datetime NOT NULL,
  `ad_advertiser_id` int(5) NOT NULL,
  `ad_site_id` int(5) NOT NULL,
  `ad_account_id` int(5) NOT NULL,
  `ad_campaigns_id` int(5) NOT NULL,
  `ad_prom_country` varchar(2) NOT NULL,
  `ad_prom_type` tinyint(1) NOT NULL,
  `ad_websitetype` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`),
  KEY `stats_month` (`stats_month`),
  KEY `adsuser` (`adsuser`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `member_pending_review` */

DROP TABLE IF EXISTS `member_pending_review`;

CREATE TABLE `member_pending_review` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `submitdate` datetime NOT NULL,
  `gender` varchar(1) NOT NULL DEFAULT 'M',
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `birthday` date NOT NULL,
  `country` varchar(2) NOT NULL,
  `marry` tinyint(1) NOT NULL DEFAULT '0',
  `siteid` tinyint(1) NOT NULL,
  `adsuser` varchar(40) NOT NULL,
  `regipcc` varchar(2) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `device_type` varchar(2) NOT NULL DEFAULT '10',
  `ipstatus` tinyint(1) NOT NULL DEFAULT '1',
  `adddate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `manid` (`manid`)
) ENGINE=InnoDB AUTO_INCREMENT=387711 DEFAULT CHARSET=utf8;

/*Table structure for table `member_priv` */

DROP TABLE IF EXISTS `member_priv`;

CREATE TABLE `member_priv` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `manid` varchar(16) NOT NULL,
  `code` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `siteid` tinyint(2) NOT NULL DEFAULT '0',
  `adddate` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `lastupdate` datetime NOT NULL,
  `classify` tinyint(2) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `info` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

/*Table structure for table `member_priv_deleted` */

DROP TABLE IF EXISTS `member_priv_deleted`;

CREATE TABLE `member_priv_deleted` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `manid` varchar(16) NOT NULL,
  `code` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `siteid` tinyint(2) NOT NULL DEFAULT '0',
  `adddate` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `lastupdate` datetime NOT NULL,
  `classify` tinyint(2) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `info` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `member_protocol_limit` */

DROP TABLE IF EXISTS `member_protocol_limit`;

CREATE TABLE `member_protocol_limit` (
  `mpl_id` int(11) NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `trigger_date` datetime NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`mpl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `member_register_audit` */

DROP TABLE IF EXISTS `member_register_audit`;

CREATE TABLE `member_register_audit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `reg_email` varchar(80) NOT NULL,
  `siteid` tinyint(1) NOT NULL DEFAULT '0',
  `country` char(2) NOT NULL,
  `nationality` char(2) NOT NULL,
  `card_holder` varchar(100) NOT NULL,
  `reg_cookie` varchar(20) NOT NULL,
  `reg_compid` varchar(40) NOT NULL,
  `reg_ip` varchar(16) NOT NULL,
  `reg_time` datetime NOT NULL,
  `trigger_fx` tinyint(1) NOT NULL DEFAULT '0',
  `trigger_repetition` tinyint(1) NOT NULL DEFAULT '0',
  `trigger_country` tinyint(1) NOT NULL DEFAULT '0',
  `fx_list` varchar(255) NOT NULL,
  `reg_cookie_total` int(10) unsigned NOT NULL DEFAULT '0',
  `reg_compid_total` int(10) unsigned NOT NULL DEFAULT '0',
  `reg_ip_total` int(10) unsigned NOT NULL DEFAULT '0',
  `repeat_type` tinyint(1) NOT NULL DEFAULT '0',
  `audit_status` tinyint(1) NOT NULL DEFAULT '0',
  `email_sended` tinyint(1) NOT NULL DEFAULT '0',
  `staff_id` varchar(10) NOT NULL,
  `staff_name` varchar(30) NOT NULL,
  `audit_time` datetime NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=659 DEFAULT CHARSET=utf8;

/*Table structure for table `member_repetition_history` */

DROP TABLE IF EXISTS `member_repetition_history`;

CREATE TABLE `member_repetition_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `siteid` tinyint(1) NOT NULL DEFAULT '0',
  `country` char(2) NOT NULL,
  `reg_time` datetime NOT NULL,
  `reg_cookie` varchar(20) NOT NULL,
  `reg_compid` varchar(40) NOT NULL,
  `reg_ip` varchar(16) NOT NULL,
  `reg_cookie_total` int(10) unsigned NOT NULL DEFAULT '0',
  `reg_compid_total` int(10) unsigned NOT NULL DEFAULT '0',
  `reg_ip_total` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=966 DEFAULT CHARSET=utf8;

/*Table structure for table `member_req_action` */

DROP TABLE IF EXISTS `member_req_action`;

CREATE TABLE `member_req_action` (
  `mo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `action_id` varchar(20) NOT NULL,
  `manid` varchar(12) NOT NULL,
  `manname` varchar(100) NOT NULL,
  `template_id` varchar(20) NOT NULL,
  `valid_startdate` datetime NOT NULL,
  `valid_enddate` datetime NOT NULL,
  `action_end` tinyint(1) NOT NULL DEFAULT '0',
  `option_selected` varchar(255) NOT NULL,
  `level_word` text NOT NULL,
  `attachment_list` text NOT NULL,
  `action_status` tinyint(1) NOT NULL DEFAULT '0',
  `action_delete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `audit_status` tinyint(1) NOT NULL DEFAULT '0',
  `nopass_reason` varchar(255) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `staff_id` varchar(10) NOT NULL,
  `staff_name` varchar(30) NOT NULL,
  `audit_datetime` datetime NOT NULL,
  `uptime` int(10) unsigned NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  `template_name` varchar(300) NOT NULL,
  `template_info` text NOT NULL,
  `changelog` text NOT NULL,
  `attach_file_idx` int(5) DEFAULT '0',
  PRIMARY KEY (`mo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

/*Table structure for table `member_req_action_template` */

DROP TABLE IF EXISTS `member_req_action_template`;

CREATE TABLE `member_req_action_template` (
  `mat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template_id` varchar(20) NOT NULL,
  `template_type` tinyint(1) NOT NULL DEFAULT '0',
  `template_name` varchar(255) NOT NULL,
  `action_desc` text NOT NULL,
  `is_digest` tinyint(1) NOT NULL DEFAULT '1',
  `digest_content` varchar(1000) NOT NULL,
  `digest_title` varchar(255) NOT NULL,
  `is_select` tinyint(1) NOT NULL DEFAULT '1',
  `select_option` text NOT NULL,
  `allow_word` tinyint(1) NOT NULL DEFAULT '1',
  `attachment_total` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_limit` tinyint(1) NOT NULL DEFAULT '0',
  `action_audit` tinyint(1) NOT NULL DEFAULT '1',
  `audit_title` varchar(450) NOT NULL,
  `button_show` tinyint(1) NOT NULL DEFAULT '1',
  `button_txt` varchar(200) NOT NULL,
  `template_status` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `use_times` int(8) NOT NULL,
  `adddate` datetime NOT NULL,
  `changelog` text NOT NULL,
  `sensitive_info` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`mat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Table structure for table `member_review_detail` */

DROP TABLE IF EXISTS `member_review_detail`;

CREATE TABLE `member_review_detail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `submitdate` datetime NOT NULL,
  `gender` varchar(1) NOT NULL DEFAULT 'M',
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `birthday` date NOT NULL,
  `country` varchar(2) NOT NULL,
  `marry` tinyint(1) NOT NULL DEFAULT '0',
  `siteid` tinyint(1) NOT NULL,
  `adsuser` varchar(40) NOT NULL,
  `regipcc` varchar(2) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `device_type` varchar(2) NOT NULL DEFAULT '10',
  `ipstatus` tinyint(1) NOT NULL DEFAULT '1',
  `adddate` datetime NOT NULL,
  `reviewdate` datetime NOT NULL,
  `reviewer` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `manid` (`manid`)
) ENGINE=InnoDB AUTO_INCREMENT=387710 DEFAULT CHARSET=utf8;

/*Table structure for table `member_review_logs` */

DROP TABLE IF EXISTS `member_review_logs`;

CREATE TABLE `member_review_logs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `lastid` int(10) NOT NULL,
  `lastupdate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `member_sample_list` */

DROP TABLE IF EXISTS `member_sample_list`;

CREATE TABLE `member_sample_list` (
  `ms_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ms_code` varchar(10) NOT NULL,
  `manid` varchar(12) NOT NULL,
  `validity_starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `validity_endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `first_time` int(10) unsigned NOT NULL DEFAULT '0',
  `up_total` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ms_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Table structure for table `member_signin_history` */

DROP TABLE IF EXISTS `member_signin_history`;

CREATE TABLE `member_signin_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `siteid` tinyint(1) NOT NULL DEFAULT '0',
  `ipaddress` varchar(16) NOT NULL,
  `signin_date` int(8) unsigned NOT NULL,
  `isgoon` tinyint(1) NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `member_signin_total` */

DROP TABLE IF EXISTS `member_signin_total`;

CREATE TABLE `member_signin_total` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `last_siteid` tinyint(1) NOT NULL DEFAULT '0',
  `last_ipaddress` varchar(16) NOT NULL,
  `last_signin_date` int(8) unsigned NOT NULL,
  `last_isgoon` tinyint(1) NOT NULL DEFAULT '0',
  `signin_total` int(10) unsigned NOT NULL,
  `signin_addup` int(10) unsigned NOT NULL,
  `signin_num` int(10) unsigned NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `member_sms_history` */

DROP TABLE IF EXISTS `member_sms_history`;

CREATE TABLE `member_sms_history` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `vid` varchar(20) NOT NULL,
  `addtime` datetime NOT NULL,
  `manid` varchar(15) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `ip` varchar(32) NOT NULL,
  `brower` tinyint(1) NOT NULL,
  `system` tinyint(1) NOT NULL,
  `resolutions` tinyint(1) NOT NULL,
  `colors` tinyint(1) NOT NULL,
  `device_id` varchar(40) NOT NULL,
  `device_type` varchar(2) NOT NULL,
  `phone_cc` varchar(3) NOT NULL,
  `phone_ac` varchar(5) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `init_status` varchar(2) NOT NULL,
  `callback_status` char(1) NOT NULL,
  `callback_id` varchar(10) NOT NULL,
  `callback_cost` varchar(8) NOT NULL,
  `callback_other` varchar(255) NOT NULL,
  `callback_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vid` (`vid`),
  KEY `manid` (`manid`,`callback_status`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Table structure for table `member_upload_photo` */

DROP TABLE IF EXISTS `member_upload_photo`;

CREATE TABLE `member_upload_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manid` varchar(20) NOT NULL,
  `gender` char(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `filename` varchar(100) NOT NULL,
  `filesize` int(11) NOT NULL,
  `adddate` datetime NOT NULL,
  `ip` varchar(20) NOT NULL,
  `staff_name` varchar(20) NOT NULL,
  `staff_id` varchar(12) NOT NULL,
  `process_time` datetime NOT NULL,
  `process_ip` varchar(20) NOT NULL,
  `zipfilename` varchar(80) NOT NULL,
  `download` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`)
) ENGINE=MyISAM AUTO_INCREMENT=1205 DEFAULT CHARSET=utf8;

/*Table structure for table `member_value_7days` */

DROP TABLE IF EXISTS `member_value_7days`;

CREATE TABLE `member_value_7days` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `submitdate` datetime NOT NULL,
  `ads_type` tinyint(1) NOT NULL,
  `adsuser` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `manid` (`manid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=395474 DEFAULT CHARSET=utf8;

/*Table structure for table `private_photo` */

DROP TABLE IF EXISTS `private_photo`;

CREATE TABLE `private_photo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `m_id` int(11) NOT NULL,
  `manid` varchar(32) NOT NULL,
  `create_mode` char(1) NOT NULL,
  `create_site` char(1) NOT NULL,
  `photo_name` varchar(64) NOT NULL,
  `photo_md5` char(32) NOT NULL,
  `status` char(1) NOT NULL DEFAULT '1',
  `edit_time` datetime NOT NULL,
  `add_time` datetime NOT NULL,
  `send_mode` varchar(1) NOT NULL,
  `association_id` varchar(64) NOT NULL,
  `division_operation_log` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`,`create_mode`,`create_site`,`status`),
  KEY `edit_time` (`edit_time`)
) ENGINE=MyISAM AUTO_INCREMENT=687 DEFAULT CHARSET=utf8;

/*Table structure for table `qpid_coupon` */

DROP TABLE IF EXISTS `qpid_coupon`;

CREATE TABLE `qpid_coupon` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `coupon_id` varchar(10) NOT NULL,
  `coupon_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `cash_usd` decimal(5,2) unsigned NOT NULL DEFAULT '0.00',
  `valid_time1` datetime NOT NULL,
  `valid_time2` datetime NOT NULL,
  `manid` varchar(15) NOT NULL,
  `manname` varchar(30) NOT NULL,
  `add_time` datetime NOT NULL,
  `add_method` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `used_time` datetime NOT NULL,
  `orderno` varchar(20) NOT NULL,
  `order_siteid` tinyint(1) NOT NULL DEFAULT '0',
  `note_man` varchar(100) NOT NULL,
  `note_esl` varchar(255) NOT NULL,
  `flag_status` char(1) NOT NULL DEFAULT 'Y',
  `flag_use` char(1) NOT NULL DEFAULT 'N',
  `logtxt` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `coupon_id` (`coupon_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `qpid_seal` */

DROP TABLE IF EXISTS `qpid_seal`;

CREATE TABLE `qpid_seal` (
  `qs_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `firsttime` datetime NOT NULL,
  `lasttime` datetime NOT NULL,
  `lastverify` datetime NOT NULL,
  `mobile_cc` char(2) NOT NULL,
  `mobile` varchar(40) NOT NULL,
  `mobile_country` char(2) NOT NULL,
  `mobile_timezone` varchar(5) NOT NULL,
  `mobile_to_1` time NOT NULL,
  `mobile_to_2` time NOT NULL,
  `landline_cc` char(2) NOT NULL,
  `landline_ac` varchar(5) NOT NULL,
  `landline` varchar(40) NOT NULL,
  `landline_country` char(2) NOT NULL,
  `landline_timezone` varchar(5) NOT NULL,
  `landline_to_1` time NOT NULL,
  `landline_to_2` time NOT NULL,
  `phone_opertime` datetime NOT NULL,
  `phone_verifytime` datetime NOT NULL,
  `mobile_status` char(1) NOT NULL DEFAULT '1',
  `landline_status` char(1) NOT NULL DEFAULT '1',
  `v_phone` char(1) NOT NULL DEFAULT '1',
  `v_id` char(1) NOT NULL DEFAULT '0',
  `v_id_file_number` varchar(30) NOT NULL,
  `v_address` char(1) NOT NULL DEFAULT '0',
  `v_address_file_number` varchar(30) NOT NULL,
  `v_education` char(1) NOT NULL DEFAULT '0',
  `v_education_file_number` varchar(30) NOT NULL,
  `v_profession` char(1) NOT NULL DEFAULT '0',
  `v_profession_file_number` varchar(30) NOT NULL,
  `qs_follower` varchar(30) NOT NULL,
  `qs_follower_staffid` varchar(20) NOT NULL,
  `label_status` char(1) NOT NULL DEFAULT '1',
  `label_opertime` datetime NOT NULL,
  `label_remark` varchar(500) NOT NULL,
  PRIMARY KEY (`qs_id`),
  KEY `manid` (`manid`,`v_phone`,`v_id`,`v_address`,`v_education`,`label_status`,`qs_follower_staffid`)
) ENGINE=MyISAM AUTO_INCREMENT=625 DEFAULT CHARSET=utf8;

/*Table structure for table `qpid_seal_address` */

DROP TABLE IF EXISTS `qpid_seal_address`;

CREATE TABLE `qpid_seal_address` (
  `qsa_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `file_number` varchar(30) NOT NULL,
  `file_name` varchar(50) NOT NULL,
  `i_address1` varchar(200) NOT NULL,
  `i_address2` varchar(200) NOT NULL,
  `i_zipcode` varchar(10) NOT NULL,
  `i_city` varchar(40) NOT NULL,
  `i_province` varchar(20) NOT NULL,
  `i_country` char(2) NOT NULL,
  `uploadtime` datetime NOT NULL,
  `status` char(1) NOT NULL DEFAULT '1',
  `follower` varchar(30) NOT NULL,
  `follower_staffid` varchar(20) NOT NULL,
  `opertime` datetime NOT NULL,
  `reason` varchar(1) NOT NULL,
  `reason_text` varchar(100) NOT NULL,
  `remark` text NOT NULL,
  PRIMARY KEY (`qsa_id`),
  KEY `manid` (`manid`,`uploadtime`,`status`,`follower_staffid`,`reason`)
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

/*Table structure for table `qpid_seal_country` */

DROP TABLE IF EXISTS `qpid_seal_country`;

CREATE TABLE `qpid_seal_country` (
  `qsc_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `country` char(2) NOT NULL,
  `country_name` varchar(40) NOT NULL,
  `country_code` char(3) NOT NULL,
  `call_price` varchar(5) NOT NULL,
  `sms_price` varchar(5) NOT NULL,
  `opertime` datetime NOT NULL,
  `follower` varchar(30) NOT NULL,
  `follower_staffid` varchar(20) NOT NULL,
  `status` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`qsc_id`),
  KEY `country` (`country`,`country_code`,`status`)
) ENGINE=MyISAM AUTO_INCREMENT=238 DEFAULT CHARSET=utf8;

/*Table structure for table `qpid_seal_id` */

DROP TABLE IF EXISTS `qpid_seal_id`;

CREATE TABLE `qpid_seal_id` (
  `qsi_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `file_number` varchar(30) NOT NULL,
  `file_name` varchar(50) NOT NULL,
  `i_firstname` varchar(30) NOT NULL,
  `i_lastname` varchar(30) NOT NULL,
  `i_birthday` date NOT NULL,
  `i_gender` char(1) NOT NULL DEFAULT 'M',
  `uploadtime` datetime NOT NULL,
  `status` char(1) NOT NULL DEFAULT '1',
  `follower` varchar(30) NOT NULL,
  `follower_staffid` varchar(20) NOT NULL,
  `opertime` datetime NOT NULL,
  `reason` varchar(1) NOT NULL,
  `reason_text` varchar(100) NOT NULL,
  `remark` text NOT NULL,
  PRIMARY KEY (`qsi_id`),
  KEY `manid` (`manid`,`uploadtime`,`status`,`follower_staffid`,`reason`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

/*Table structure for table `qpid_seal_other` */

DROP TABLE IF EXISTS `qpid_seal_other`;

CREATE TABLE `qpid_seal_other` (
  `qso_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `file_number` varchar(30) NOT NULL,
  `file_name` varchar(50) NOT NULL,
  `type` char(1) NOT NULL,
  `type_record` tinyint(1) NOT NULL DEFAULT '0',
  `uploadtime` datetime NOT NULL,
  `status` char(1) NOT NULL DEFAULT '1',
  `follower` varchar(30) NOT NULL,
  `follower_staffid` varchar(20) NOT NULL,
  `opertime` datetime NOT NULL,
  `reason` varchar(1) NOT NULL,
  `reason_text` varchar(100) NOT NULL,
  `remark` text NOT NULL,
  PRIMARY KEY (`qso_id`),
  KEY `manid` (`manid`,`type`,`uploadtime`,`status`,`follower_staffid`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

/*Table structure for table `qpid_seal_phone` */

DROP TABLE IF EXISTS `qpid_seal_phone`;

CREATE TABLE `qpid_seal_phone` (
  `qsp_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vid` varchar(20) NOT NULL,
  `sendtime` datetime NOT NULL,
  `manid` varchar(12) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `ip` varchar(32) NOT NULL,
  `brower` tinyint(1) NOT NULL DEFAULT '2',
  `system` tinyint(1) NOT NULL,
  `resolutions` tinyint(1) NOT NULL,
  `colors` tinyint(1) NOT NULL,
  `device_id` varchar(40) NOT NULL,
  `device_type` varchar(2) NOT NULL DEFAULT '10',
  `verify_type` char(1) NOT NULL,
  `phone_type` char(1) NOT NULL,
  `phone_cc` varchar(2) NOT NULL,
  `phone_ac` varchar(5) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `send_number` varchar(40) NOT NULL,
  `verify_code` char(6) NOT NULL,
  `send_status` varchar(2) NOT NULL,
  `return_status` char(1) NOT NULL,
  `return_id` varchar(10) NOT NULL,
  `return_cost` varchar(8) NOT NULL,
  `return_other` varchar(255) NOT NULL,
  `remark` text NOT NULL,
  `returntime` datetime NOT NULL,
  `verify_time` datetime NOT NULL,
  `phone_status` char(1) NOT NULL,
  PRIMARY KEY (`qsp_id`),
  KEY `vid` (`vid`,`verify_type`,`phone_type`,`send_status`,`return_id`,`phone_status`)
) ENGINE=MyISAM AUTO_INCREMENT=333 DEFAULT CHARSET=utf8;

/*Table structure for table `qpid_seal_white_list` */

DROP TABLE IF EXISTS `qpid_seal_white_list`;

CREATE TABLE `qpid_seal_white_list` (
  `qswl_id` int(11) NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `addtime` datetime NOT NULL,
  `phone_type` char(1) NOT NULL DEFAULT '0',
  `phone_cc` char(2) NOT NULL,
  `phone_ac` varchar(5) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `verify_status` char(1) NOT NULL DEFAULT '2',
  `opertime` datetime NOT NULL,
  `follower` varchar(30) NOT NULL,
  `follower_staffid` varchar(20) NOT NULL,
  `status` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`qswl_id`),
  KEY `manid` (`manid`,`phone_type`,`status`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Table structure for table `register_free_video_record` */

DROP TABLE IF EXISTS `register_free_video_record`;

CREATE TABLE `register_free_video_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `videoid` varchar(12) NOT NULL,
  `viewtime` int(10) NOT NULL,
  `siteid` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

/*Table structure for table `register_track` */

DROP TABLE IF EXISTS `register_track`;

CREATE TABLE `register_track` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `manid` varchar(15) NOT NULL,
  `submitdate` date NOT NULL,
  `siteid` tinyint(1) unsigned NOT NULL,
  `country` varchar(2) NOT NULL,
  `living` varchar(2) NOT NULL,
  `register_id` varchar(20) NOT NULL,
  `register_rrocess` int(1) unsigned NOT NULL,
  `register_terminal` int(1) unsigned NOT NULL,
  `is_facebook` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `joindate_site` (`submitdate`,`siteid`),
  KEY `joindate_regid` (`submitdate`,`register_id`),
  KEY `joindate_living` (`submitdate`,`living`)
) ENGINE=MyISAM AUTO_INCREMENT=4298 DEFAULT CHARSET=utf8;

/*Table structure for table `register_track_old` */

DROP TABLE IF EXISTS `register_track_old`;

CREATE TABLE `register_track_old` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `manid` varchar(15) NOT NULL,
  `submitdate` datetime NOT NULL,
  `siteid` tinyint(1) unsigned NOT NULL,
  `country` varchar(2) NOT NULL,
  `living` varchar(2) NOT NULL,
  `register_id` varchar(20) NOT NULL,
  `register_rrocess` int(1) unsigned NOT NULL,
  `register_terminal` int(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`,`siteid`,`country`,`living`,`register_id`,`register_rrocess`,`register_terminal`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

/*Table structure for table `rs_black_card` */

DROP TABLE IF EXISTS `rs_black_card`;

CREATE TABLE `rs_black_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_ref_id` varchar(35) NOT NULL,
  `roles_id_to` varchar(100) NOT NULL,
  `manid` varchar(15) NOT NULL,
  `staff_id` varchar(10) NOT NULL,
  `staff_name` varchar(30) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `lastupdate` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

/*Table structure for table `rs_black_cardholder` */

DROP TABLE IF EXISTS `rs_black_cardholder`;

CREATE TABLE `rs_black_cardholder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_holder` varchar(100) NOT NULL,
  `roles_id_to` varchar(100) NOT NULL,
  `manid` varchar(15) NOT NULL,
  `staff_id` varchar(10) NOT NULL,
  `staff_name` varchar(30) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `lastupdate` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

/*Table structure for table `rs_black_country` */

DROP TABLE IF EXISTS `rs_black_country`;

CREATE TABLE `rs_black_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_code` char(2) NOT NULL,
  `country_name` varchar(50) NOT NULL,
  `roles_id_to` varchar(100) NOT NULL,
  `manid` varchar(15) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `staff_id` varchar(10) NOT NULL,
  `staff_name` varchar(30) NOT NULL,
  `lastupdate` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

/*Table structure for table `rs_black_email` */

DROP TABLE IF EXISTS `rs_black_email`;

CREATE TABLE `rs_black_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `roles_id_to` varchar(100) NOT NULL,
  `manid` varchar(15) NOT NULL,
  `staff_id` varchar(10) NOT NULL,
  `staff_name` varchar(30) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `lastupdate` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

/*Table structure for table `rs_black_ip` */

DROP TABLE IF EXISTS `rs_black_ip`;

CREATE TABLE `rs_black_ip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip1` double(15,0) NOT NULL,
  `ip2` double(15,0) NOT NULL,
  `roles_id_to` varchar(100) NOT NULL,
  `manid` varchar(15) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `staff_id` varchar(10) NOT NULL,
  `staff_name` varchar(30) NOT NULL,
  `lastupdate` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

/*Table structure for table `rs_black_terminal` */

DROP TABLE IF EXISTS `rs_black_terminal`;

CREATE TABLE `rs_black_terminal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mcid` varchar(40) NOT NULL,
  `device_type` varchar(2) NOT NULL DEFAULT '10',
  `roles_id_to` varchar(100) NOT NULL,
  `manid` varchar(15) NOT NULL,
  `staff_id` varchar(10) NOT NULL,
  `staff_name` varchar(30) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `lastupdate` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

/*Table structure for table `rs_danger_logs` */

DROP TABLE IF EXISTS `rs_danger_logs`;

CREATE TABLE `rs_danger_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manid` varchar(15) NOT NULL,
  `danger_type_id` tinyint(1) NOT NULL DEFAULT '0',
  `remote_addr` varchar(16) NOT NULL,
  `country_code` char(2) NOT NULL,
  `siteid` tinyint(1) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `trigger_id` varchar(255) NOT NULL,
  `adddate` datetime NOT NULL,
  `is_change_role` tinyint(1) NOT NULL DEFAULT '0',
  `isdispose` tinyint(1) NOT NULL DEFAULT '0',
  `remarks` varchar(255) NOT NULL,
  `staff_id` varchar(10) NOT NULL,
  `staff_name` varchar(30) NOT NULL,
  `dispose_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `adddate` (`adddate`)
) ENGINE=MyISAM AUTO_INCREMENT=2703 DEFAULT CHARSET=utf8;

/*Table structure for table `rs_exp_card` */

DROP TABLE IF EXISTS `rs_exp_card`;

CREATE TABLE `rs_exp_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manid` varchar(15) NOT NULL,
  `card_ref_id` varchar(35) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `staff_id` varchar(10) NOT NULL,
  `staff_name` varchar(30) NOT NULL,
  `adddate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Table structure for table `rs_exp_cardholder` */

DROP TABLE IF EXISTS `rs_exp_cardholder`;

CREATE TABLE `rs_exp_cardholder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manid` varchar(15) NOT NULL,
  `card_holder` varchar(100) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `staff_id` varchar(10) NOT NULL,
  `staff_name` varchar(30) NOT NULL,
  `adddate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Table structure for table `rs_exp_country` */

DROP TABLE IF EXISTS `rs_exp_country`;

CREATE TABLE `rs_exp_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manid` varchar(15) NOT NULL,
  `country_code` char(2) NOT NULL,
  `country_name` varchar(50) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `staff_id` varchar(10) NOT NULL,
  `staff_name` varchar(30) NOT NULL,
  `adddate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

/*Table structure for table `rs_exp_email` */

DROP TABLE IF EXISTS `rs_exp_email`;

CREATE TABLE `rs_exp_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manid` varchar(15) NOT NULL,
  `email` varchar(200) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `staff_id` varchar(10) NOT NULL,
  `staff_name` varchar(30) NOT NULL,
  `adddate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Table structure for table `rs_exp_ip` */

DROP TABLE IF EXISTS `rs_exp_ip`;

CREATE TABLE `rs_exp_ip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manid` varchar(15) NOT NULL,
  `ip1` double(15,0) NOT NULL,
  `ip2` double(15,0) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `staff_id` varchar(10) NOT NULL,
  `staff_name` varchar(30) NOT NULL,
  `adddate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Table structure for table `rs_exp_terminal` */

DROP TABLE IF EXISTS `rs_exp_terminal`;

CREATE TABLE `rs_exp_terminal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manid` varchar(15) NOT NULL,
  `mcid` varchar(30) NOT NULL,
  `device_type` varchar(2) NOT NULL DEFAULT '10',
  `remarks` varchar(255) NOT NULL,
  `staff_id` varchar(10) NOT NULL,
  `staff_name` varchar(30) NOT NULL,
  `adddate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Table structure for table `rs_favorites_crontab` */

DROP TABLE IF EXISTS `rs_favorites_crontab`;

CREATE TABLE `rs_favorites_crontab` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` tinyint(1) NOT NULL DEFAULT '0',
  `up_counts` int(11) NOT NULL DEFAULT '0',
  `favorites_upid` int(11) NOT NULL DEFAULT '0',
  `uptime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Table structure for table `rs_favorites_stat` */

DROP TABLE IF EXISTS `rs_favorites_stat`;

CREATE TABLE `rs_favorites_stat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manid` varchar(15) NOT NULL,
  `cl_counts` int(11) NOT NULL DEFAULT '0',
  `cl_counts_total` int(11) NOT NULL DEFAULT '0',
  `ida_counts` int(11) NOT NULL DEFAULT '0',
  `ida_counts_total` int(11) NOT NULL DEFAULT '0',
  `cd_counts` int(11) NOT NULL DEFAULT '0',
  `cd_counts_total` int(11) NOT NULL DEFAULT '0',
  `ld_counts` int(11) NOT NULL DEFAULT '0',
  `ld_counts_total` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `uptime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `rs_favorites_total` */

DROP TABLE IF EXISTS `rs_favorites_total`;

CREATE TABLE `rs_favorites_total` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manid` varchar(15) NOT NULL,
  `cl_counts` int(11) NOT NULL DEFAULT '0',
  `cl_counts_total` int(11) NOT NULL DEFAULT '0',
  `ida_counts` int(11) NOT NULL DEFAULT '0',
  `ida_counts_total` int(11) NOT NULL DEFAULT '0',
  `cd_counts` int(11) NOT NULL DEFAULT '0',
  `cd_counts_total` int(11) NOT NULL DEFAULT '0',
  `ld_counts` int(11) NOT NULL DEFAULT '0',
  `ld_counts_total` int(11) NOT NULL DEFAULT '0',
  `uptime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`)
) ENGINE=InnoDB AUTO_INCREMENT=373180 DEFAULT CHARSET=utf8;

/*Table structure for table `rs_once_order` */

DROP TABLE IF EXISTS `rs_once_order`;

CREATE TABLE `rs_once_order` (
  `ral_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `trigger_date` datetime NOT NULL,
  `order_num` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ral_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Table structure for table `rs_order_fail` */

DROP TABLE IF EXISTS `rs_order_fail`;

CREATE TABLE `rs_order_fail` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `manid` varchar(15) NOT NULL,
  `addtime` datetime NOT NULL,
  `orderno` varchar(15) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`,`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=340 DEFAULT CHARSET=utf8;

/*Table structure for table `rs_permission` */

DROP TABLE IF EXISTS `rs_permission`;

CREATE TABLE `rs_permission` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(150) NOT NULL,
  `permission_code` varchar(10) NOT NULL,
  `permission_desc` varchar(200) NOT NULL,
  `permission_sort` int(11) NOT NULL DEFAULT '0',
  `siteid` tinyint(3) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Table structure for table `rs_permission_20141014` */

DROP TABLE IF EXISTS `rs_permission_20141014`;

CREATE TABLE `rs_permission_20141014` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(150) NOT NULL,
  `permission_code` varchar(10) NOT NULL,
  `permission_desc` varchar(200) NOT NULL,
  `permission_sort` int(11) NOT NULL DEFAULT '0',
  `siteid` tinyint(3) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Table structure for table `rs_roles` */

DROP TABLE IF EXISTS `rs_roles`;

CREATE TABLE `rs_roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) NOT NULL,
  `role_desc` varchar(200) NOT NULL,
  `role_sort` int(11) NOT NULL,
  `isdeleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Table structure for table `rs_roles_20141014` */

DROP TABLE IF EXISTS `rs_roles_20141014`;

CREATE TABLE `rs_roles_20141014` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) NOT NULL,
  `role_desc` varchar(200) NOT NULL,
  `role_sort` int(11) NOT NULL,
  `isdeleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Table structure for table `rs_roles_logs` */

DROP TABLE IF EXISTS `rs_roles_logs`;

CREATE TABLE `rs_roles_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manid` varchar(15) NOT NULL,
  `manname` varchar(80) NOT NULL,
  `country_code` char(2) NOT NULL,
  `siteid` tinyint(1) NOT NULL DEFAULT '0',
  `trigger_id` varchar(255) NOT NULL,
  `roles_id_old` varchar(255) NOT NULL,
  `roles_id_new` varchar(255) NOT NULL,
  `staff_id` varchar(10) NOT NULL,
  `staff_name` varchar(30) NOT NULL,
  `adddate` datetime NOT NULL,
  `isauto` tinyint(1) NOT NULL DEFAULT '0',
  `danger_id` int(11) NOT NULL,
  `remarks` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`),
  KEY `adddate` (`adddate`)
) ENGINE=MyISAM AUTO_INCREMENT=764 DEFAULT CHARSET=utf8;

/*Table structure for table `rs_roles_permission` */

DROP TABLE IF EXISTS `rs_roles_permission`;

CREATE TABLE `rs_roles_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL DEFAULT '0',
  `permission_id` int(11) NOT NULL DEFAULT '0',
  `permission_code` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;

/*Table structure for table `rs_roles_permission_20141014` */

DROP TABLE IF EXISTS `rs_roles_permission_20141014`;

CREATE TABLE `rs_roles_permission_20141014` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL DEFAULT '0',
  `permission_id` int(11) NOT NULL DEFAULT '0',
  `permission_code` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

/*Table structure for table `rs_vp_stat` */

DROP TABLE IF EXISTS `rs_vp_stat`;

CREATE TABLE `rs_vp_stat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manid` varchar(15) NOT NULL,
  `login_time` datetime NOT NULL,
  `cl_counts` int(11) NOT NULL,
  `ida_counts` int(11) NOT NULL,
  `cd_counts` int(11) NOT NULL,
  `ld_counts` int(11) NOT NULL,
  `adddate` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cl_counts` (`cl_counts`,`ida_counts`,`cd_counts`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

/*Table structure for table `stats_admire_cl` */

DROP TABLE IF EXISTS `stats_admire_cl`;

CREATE TABLE `stats_admire_cl` (
  `manid` varchar(12) NOT NULL,
  `day1` tinyint(2) NOT NULL DEFAULT '0',
  `day2` tinyint(2) NOT NULL DEFAULT '0',
  `day3` tinyint(2) NOT NULL DEFAULT '0',
  `day4` tinyint(2) NOT NULL DEFAULT '0',
  `day5` tinyint(2) NOT NULL DEFAULT '0',
  `day6` tinyint(2) NOT NULL DEFAULT '0',
  `day7` tinyint(2) NOT NULL DEFAULT '0',
  `total` tinyint(4) NOT NULL DEFAULT '0',
  `submitdate` datetime NOT NULL,
  `last_login` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  `sent` tinyint(2) NOT NULL DEFAULT '0',
  `admire_num` smallint(1) NOT NULL DEFAULT '0' COMMENT 'å‘é€æ„å‘ä¿¡æ•°é‡,ç‰¹æ®Šæƒ…å†µ',
  PRIMARY KEY (`manid`),
  KEY `last_update` (`last_update`),
  KEY `last_login` (`last_login`),
  KEY `submitdate` (`submitdate`),
  KEY `total` (`total`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `stats_admire_ld` */

DROP TABLE IF EXISTS `stats_admire_ld`;

CREATE TABLE `stats_admire_ld` (
  `manid` varchar(12) NOT NULL,
  `day1` tinyint(2) NOT NULL DEFAULT '0',
  `day2` tinyint(2) NOT NULL DEFAULT '0',
  `day3` tinyint(2) NOT NULL DEFAULT '0',
  `day4` tinyint(2) NOT NULL DEFAULT '0',
  `day5` tinyint(2) NOT NULL DEFAULT '0',
  `day6` tinyint(2) NOT NULL DEFAULT '0',
  `day7` tinyint(2) NOT NULL DEFAULT '0',
  `total` tinyint(4) NOT NULL DEFAULT '0',
  `submitdate` datetime NOT NULL,
  `last_login` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  `sent` tinyint(2) NOT NULL DEFAULT '0',
  `admire_num` smallint(1) NOT NULL DEFAULT '0' COMMENT 'å‘é€æ„å‘ä¿¡æ•°é‡,ç‰¹æ®Šæƒ…å†µ',
  PRIMARY KEY (`manid`),
  KEY `last_update` (`last_update`),
  KEY `last_login` (`last_login`),
  KEY `submitdate` (`submitdate`),
  KEY `total` (`total`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `stats_admire_ru` */

DROP TABLE IF EXISTS `stats_admire_ru`;

CREATE TABLE `stats_admire_ru` (
  `manid` varchar(12) NOT NULL,
  `day1` tinyint(2) NOT NULL DEFAULT '0',
  `day2` tinyint(2) NOT NULL DEFAULT '0',
  `day3` tinyint(2) NOT NULL DEFAULT '0',
  `day4` tinyint(2) NOT NULL DEFAULT '0',
  `day5` tinyint(2) NOT NULL DEFAULT '0',
  `day6` tinyint(2) NOT NULL DEFAULT '0',
  `day7` tinyint(2) NOT NULL DEFAULT '0',
  `total` tinyint(4) NOT NULL DEFAULT '0',
  `submitdate` datetime NOT NULL,
  `last_login` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  `sent` tinyint(4) NOT NULL DEFAULT '0',
  `admire_num` smallint(1) NOT NULL,
  PRIMARY KEY (`manid`),
  KEY `last_update` (`last_update`),
  KEY `last_login` (`last_login`),
  KEY `submitdate` (`submitdate`),
  KEY `total` (`total`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `stats_admire_th` */

DROP TABLE IF EXISTS `stats_admire_th`;

CREATE TABLE `stats_admire_th` (
  `manid` varchar(12) NOT NULL,
  `day1` tinyint(2) NOT NULL DEFAULT '0',
  `day2` tinyint(2) NOT NULL DEFAULT '0',
  `day3` tinyint(2) NOT NULL DEFAULT '0',
  `day4` tinyint(2) NOT NULL DEFAULT '0',
  `day5` tinyint(2) NOT NULL DEFAULT '0',
  `day6` tinyint(2) NOT NULL DEFAULT '0',
  `day7` tinyint(2) NOT NULL DEFAULT '0',
  `total` tinyint(4) NOT NULL DEFAULT '0',
  `submitdate` datetime NOT NULL,
  `last_login` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  `sent` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`manid`),
  KEY `last_update` (`last_update`),
  KEY `last_login` (`last_login`),
  KEY `submitdate` (`submitdate`),
  KEY `total` (`total`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `stats_freechat_ticket` */

DROP TABLE IF EXISTS `stats_freechat_ticket`;

CREATE TABLE `stats_freechat_ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(4) NOT NULL DEFAULT '0',
  `manid` varchar(20) NOT NULL DEFAULT '',
  `manname` varchar(50) NOT NULL DEFAULT '',
  `stat_date` date NOT NULL,
  `stat_week` varchar(10) NOT NULL,
  `stat_month` varchar(10) NOT NULL,
  `offer` int(4) unsigned NOT NULL DEFAULT '0',
  `times` int(4) NOT NULL,
  `charge` int(4) NOT NULL,
  `credits` decimal(10,2) NOT NULL,
  `ordernum` int(4) DEFAULT '0',
  `adddate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stat` (`stat_date`,`siteid`,`manid`),
  KEY `manid` (`manid`)
) ENGINE=MyISAM AUTO_INCREMENT=1097 DEFAULT CHARSET=utf8;

/*Table structure for table `stats_member_credit` */

DROP TABLE IF EXISTS `stats_member_credit`;

CREATE TABLE `stats_member_credit` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `flag` char(2) NOT NULL DEFAULT '0',
  `stat_date` date NOT NULL,
  `stat_week` varchar(8) NOT NULL,
  `stat_month` varchar(8) NOT NULL,
  `stat_year` varchar(4) NOT NULL,
  `total` decimal(11,2) NOT NULL,
  `app_01` decimal(11,2) NOT NULL,
  `app_02` decimal(11,2) NOT NULL,
  `app_03` decimal(11,2) NOT NULL,
  `app_04` decimal(11,2) NOT NULL,
  `app_05` decimal(11,2) NOT NULL,
  `app_06` decimal(11,2) NOT NULL,
  `app_07` decimal(11,2) NOT NULL,
  `app_08` decimal(11,2) NOT NULL,
  `app_09` decimal(11,2) NOT NULL,
  `app_10` decimal(11,2) NOT NULL,
  `app_11` decimal(11,2) NOT NULL,
  `app_12` decimal(11,2) NOT NULL,
  `app_13` decimal(11,2) NOT NULL,
  `app_14` decimal(11,2) NOT NULL,
  `app_15` decimal(11,2) NOT NULL,
  `app_16` decimal(11,2) NOT NULL,
  `app_17` decimal(11,2) NOT NULL,
  `app_18` decimal(11,2) NOT NULL,
  `app_19` decimal(11,2) NOT NULL,
  `app_20` decimal(11,2) NOT NULL,
  `adddate` datetime NOT NULL,
  `siteid` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stat` (`stat_date`,`siteid`,`flag`)
) ENGINE=MyISAM AUTO_INCREMENT=2383 DEFAULT CHARSET=utf8;

/*Table structure for table `stats_member_emf` */

DROP TABLE IF EXISTS `stats_member_emf`;

CREATE TABLE `stats_member_emf` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `stat_date` date NOT NULL,
  `stat_week` varchar(8) NOT NULL,
  `stat_month` varchar(8) NOT NULL,
  `stat_year` varchar(4) NOT NULL,
  `total` int(8) NOT NULL,
  `app_01` int(8) NOT NULL,
  `app_02` int(8) NOT NULL,
  `app_03` int(8) NOT NULL,
  `app_04` int(8) NOT NULL,
  `app_05` int(8) NOT NULL,
  `app_06` int(8) NOT NULL,
  `app_07` int(8) NOT NULL,
  `app_08` int(8) NOT NULL,
  `app_09` int(8) NOT NULL,
  `app_10` int(8) NOT NULL,
  `app_11` int(8) NOT NULL,
  `app_12` int(8) NOT NULL,
  `app_13` int(8) NOT NULL,
  `app_14` int(8) NOT NULL,
  `app_15` int(8) NOT NULL,
  `app_16` int(8) NOT NULL,
  `app_17` int(8) NOT NULL,
  `app_18` int(8) NOT NULL,
  `app_19` int(8) NOT NULL,
  `app_20` int(8) NOT NULL,
  `adddate` datetime NOT NULL,
  `siteid` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stat` (`stat_date`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=151 DEFAULT CHARSET=utf8;

/*Table structure for table `stats_member_join` */

DROP TABLE IF EXISTS `stats_member_join`;

CREATE TABLE `stats_member_join` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `joindate` date NOT NULL,
  `total` int(8) NOT NULL,
  `male_num` int(8) NOT NULL,
  `female_num` int(8) NOT NULL,
  `female_1` int(8) NOT NULL,
  `female_2` int(8) NOT NULL,
  `female_3` int(8) NOT NULL,
  `male_1` int(8) NOT NULL,
  `male_2` int(8) NOT NULL,
  `male_3` int(8) NOT NULL,
  `joinweek` varchar(7) NOT NULL,
  `adddate` datetime NOT NULL,
  `siteid` int(3) NOT NULL DEFAULT '0',
  `autoreg` int(5) NOT NULL,
  `affreg` int(5) NOT NULL,
  `ppcreg` int(5) NOT NULL,
  `testreg_total` int(5) unsigned NOT NULL,
  `testreg_self` int(5) unsigned NOT NULL,
  `testreg_aff` int(5) NOT NULL,
  `testreg_ppc` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `joindate` (`joindate`)
) ENGINE=InnoDB AUTO_INCREMENT=7037 DEFAULT CHARSET=utf8;

/*Table structure for table `stats_member_join_device` */

DROP TABLE IF EXISTS `stats_member_join_device`;

CREATE TABLE `stats_member_join_device` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `stat_date` date NOT NULL,
  `stat_week` varchar(8) NOT NULL,
  `stat_month` varchar(8) NOT NULL,
  `stat_year` varchar(4) NOT NULL,
  `total` int(8) NOT NULL,
  `app_01` int(8) NOT NULL,
  `app_02` int(8) NOT NULL,
  `app_03` int(8) NOT NULL,
  `app_04` int(8) NOT NULL,
  `app_05` int(8) NOT NULL,
  `app_06` int(8) NOT NULL,
  `app_07` int(8) NOT NULL,
  `app_08` int(8) NOT NULL,
  `app_09` int(8) NOT NULL,
  `app_10` int(8) NOT NULL,
  `app_11` int(8) NOT NULL,
  `app_12` int(8) NOT NULL,
  `app_13` int(8) NOT NULL,
  `app_14` int(8) NOT NULL,
  `app_15` int(8) NOT NULL,
  `app_16` int(8) NOT NULL,
  `app_17` int(8) NOT NULL,
  `app_18` int(8) NOT NULL,
  `app_19` int(8) NOT NULL,
  `app_20` int(8) NOT NULL,
  `adddate` datetime NOT NULL,
  `siteid` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stat` (`stat_date`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=719 DEFAULT CHARSET=utf8;

/*Table structure for table `stats_member_livechat` */

DROP TABLE IF EXISTS `stats_member_livechat`;

CREATE TABLE `stats_member_livechat` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `stat_date` date NOT NULL,
  `stat_week` varchar(8) NOT NULL,
  `stat_month` varchar(8) NOT NULL,
  `stat_year` varchar(4) NOT NULL,
  `total` int(8) NOT NULL,
  `app_01` int(8) NOT NULL,
  `app_02` int(8) NOT NULL,
  `app_03` int(8) NOT NULL,
  `app_04` int(8) NOT NULL,
  `app_05` int(8) NOT NULL,
  `app_06` int(8) NOT NULL,
  `app_07` int(8) NOT NULL,
  `app_08` int(8) NOT NULL,
  `app_09` int(8) NOT NULL,
  `app_10` int(8) NOT NULL,
  `app_11` int(8) NOT NULL,
  `app_12` int(8) NOT NULL,
  `app_13` int(8) NOT NULL,
  `app_14` int(8) NOT NULL,
  `app_15` int(8) NOT NULL,
  `app_16` int(8) NOT NULL,
  `app_17` int(8) NOT NULL,
  `app_18` int(8) NOT NULL,
  `app_19` int(8) NOT NULL,
  `app_20` int(8) NOT NULL,
  `adddate` datetime NOT NULL,
  `siteid` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stat` (`stat_date`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=164 DEFAULT CHARSET=utf8;

/*Table structure for table `stats_member_login` */

DROP TABLE IF EXISTS `stats_member_login`;

CREATE TABLE `stats_member_login` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `stat_date` date NOT NULL,
  `stat_week` varchar(8) NOT NULL,
  `stat_month` varchar(8) NOT NULL,
  `stat_year` varchar(4) NOT NULL,
  `total` int(8) NOT NULL,
  `app_01` int(8) NOT NULL,
  `app_02` int(8) NOT NULL,
  `app_03` int(8) NOT NULL,
  `app_04` int(8) NOT NULL,
  `app_05` int(8) NOT NULL,
  `app_06` int(8) NOT NULL,
  `app_07` int(8) NOT NULL,
  `app_08` int(8) NOT NULL,
  `app_09` int(8) NOT NULL,
  `app_10` int(8) NOT NULL,
  `app_11` int(8) NOT NULL,
  `app_12` int(8) NOT NULL,
  `app_13` int(8) NOT NULL,
  `app_14` int(8) NOT NULL,
  `app_15` int(8) NOT NULL,
  `app_16` int(8) NOT NULL,
  `app_17` int(8) NOT NULL,
  `app_18` int(8) NOT NULL,
  `app_19` int(8) NOT NULL,
  `app_20` int(8) NOT NULL,
  `adddate` datetime NOT NULL,
  `siteid` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stat` (`stat_date`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

/*Table structure for table `stats_member_order` */

DROP TABLE IF EXISTS `stats_member_order`;

CREATE TABLE `stats_member_order` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `stat_date` date NOT NULL,
  `stat_week` varchar(8) NOT NULL,
  `stat_month` varchar(8) NOT NULL,
  `stat_year` varchar(4) NOT NULL,
  `total` int(8) NOT NULL,
  `app_01` int(8) NOT NULL,
  `app_02` int(8) NOT NULL,
  `app_03` int(8) NOT NULL,
  `app_04` int(8) NOT NULL,
  `app_05` int(8) NOT NULL,
  `app_06` int(8) NOT NULL,
  `app_07` int(8) NOT NULL,
  `app_08` int(8) NOT NULL,
  `app_09` int(8) NOT NULL,
  `app_10` int(8) NOT NULL,
  `app_11` int(8) NOT NULL,
  `app_12` int(8) NOT NULL,
  `app_13` int(8) NOT NULL,
  `app_14` int(8) NOT NULL,
  `app_15` int(8) NOT NULL,
  `app_16` int(8) NOT NULL,
  `app_17` int(8) NOT NULL,
  `app_18` int(8) NOT NULL,
  `app_19` int(8) NOT NULL,
  `app_20` int(8) NOT NULL,
  `adddate` datetime NOT NULL,
  `siteid` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stat` (`stat_date`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

/*Table structure for table `stats_sms_app` */

DROP TABLE IF EXISTS `stats_sms_app`;

CREATE TABLE `stats_sms_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_date` date NOT NULL,
  `stat_week` varchar(10) NOT NULL,
  `stat_month` varchar(10) NOT NULL,
  `adddate` datetime NOT NULL,
  `total` int(6) NOT NULL DEFAULT '0',
  `uninstalled` int(6) NOT NULL DEFAULT '0',
  `installed` int(6) NOT NULL DEFAULT '0',
  `unsent` int(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stat_date` (`stat_date`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Table structure for table `test` */

DROP TABLE IF EXISTS `test`;

CREATE TABLE `test` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `integral_total` int(1) NOT NULL DEFAULT '0',
  `integral` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `thai_relation` */

DROP TABLE IF EXISTS `thai_relation`;

CREATE TABLE `thai_relation` (
  `manid` varchar(15) NOT NULL DEFAULT 'aa',
  PRIMARY KEY (`manid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `tmp_ab_member` */

DROP TABLE IF EXISTS `tmp_ab_member`;

CREATE TABLE `tmp_ab_member` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `manid` varchar(15) NOT NULL,
  `usr_type` tinyint(1) NOT NULL DEFAULT '0',
  `step` tinyint(1) NOT NULL DEFAULT '1',
  `photo` tinyint(1) NOT NULL DEFAULT '0',
  `siteid` tinyint(1) NOT NULL,
  `loginnum` int(7) unsigned NOT NULL DEFAULT '0',
  `money` decimal(7,2) NOT NULL DEFAULT '0.00',
  `paid_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `credit_total` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `order_num` int(5) NOT NULL DEFAULT '0',
  `firstorder_time` datetime DEFAULT NULL,
  `submit_date` datetime DEFAULT NULL,
  `free_chat` int(5) unsigned NOT NULL DEFAULT '0',
  `free_chat_1` int(5) unsigned NOT NULL DEFAULT '0',
  `free_chat_4` int(5) unsigned NOT NULL DEFAULT '0',
  `free_chat_5` int(5) unsigned NOT NULL DEFAULT '0',
  `bp` int(5) unsigned NOT NULL DEFAULT '0',
  `bp_1` int(5) unsigned NOT NULL DEFAULT '0',
  `bp_4` int(5) unsigned NOT NULL DEFAULT '0',
  `bp_5` int(5) unsigned NOT NULL DEFAULT '0',
  `match_qa` int(5) unsigned NOT NULL DEFAULT '0',
  `match_qa_1` int(5) unsigned NOT NULL DEFAULT '0',
  `match_qa_4` int(5) unsigned NOT NULL DEFAULT '0',
  `match_qa_5` int(5) unsigned NOT NULL DEFAULT '0',
  `total_xf_credit` decimal(10,2) NOT NULL DEFAULT '0.00',
  `livechat_credit` decimal(10,2) NOT NULL DEFAULT '0.00',
  `emf_credit` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `manid` (`manid`),
  KEY `submit_date` (`submit_date`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Table structure for table `tmp_freechat_crond` */

DROP TABLE IF EXISTS `tmp_freechat_crond`;

CREATE TABLE `tmp_freechat_crond` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `stat_date` date NOT NULL,
  `maxid` int(6) unsigned NOT NULL DEFAULT '0',
  `avgnum` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Table structure for table `tmp_freechat_member` */

DROP TABLE IF EXISTS `tmp_freechat_member`;

CREATE TABLE `tmp_freechat_member` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `manid` varchar(15) NOT NULL,
  `manname` varchar(50) NOT NULL,
  `ticketnum` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `manid` (`manid`)
) ENGINE=MyISAM AUTO_INCREMENT=972 DEFAULT CHARSET=utf8;

/*Table structure for table `tmp_gauid` */

DROP TABLE IF EXISTS `tmp_gauid`;

CREATE TABLE `tmp_gauid` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `manid` varchar(15) NOT NULL,
  `ga_uid` varchar(50) NOT NULL,
  `stats_date` date DEFAULT NULL,
  `paid_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`)
) ENGINE=MyISAM AUTO_INCREMENT=73917 DEFAULT CHARSET=utf8;

/*Table structure for table `tmp_resume_member` */

DROP TABLE IF EXISTS `tmp_resume_member`;

CREATE TABLE `tmp_resume_member` (
  `manid` varchar(15) NOT NULL,
  UNIQUE KEY `manid` (`manid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `tmp_sep_stats` */

DROP TABLE IF EXISTS `tmp_sep_stats`;

CREATE TABLE `tmp_sep_stats` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `manid` varchar(15) NOT NULL,
  `admire_cl` int(5) unsigned NOT NULL DEFAULT '0',
  `admire_ida` int(5) unsigned NOT NULL DEFAULT '0',
  `admire_cd` int(5) unsigned NOT NULL DEFAULT '0',
  `admire_ld` int(5) unsigned NOT NULL DEFAULT '0',
  `bp_cl` int(5) unsigned NOT NULL DEFAULT '0',
  `bp_ida` int(5) unsigned NOT NULL DEFAULT '0',
  `bp_cd` int(5) unsigned NOT NULL DEFAULT '0',
  `bp_ld` int(5) unsigned NOT NULL DEFAULT '0',
  `freechat` int(6) unsigned NOT NULL DEFAULT '0',
  `cs` int(5) unsigned NOT NULL DEFAULT '0',
  `vipcode_rev` int(5) unsigned NOT NULL DEFAULT '0',
  `vipcode_use` int(5) unsigned NOT NULL DEFAULT '0',
  `emf_mw` int(5) unsigned NOT NULL DEFAULT '0',
  `emf_wm` int(5) unsigned NOT NULL DEFAULT '0',
  `virtualgifts` int(5) unsigned NOT NULL DEFAULT '0',
  `lovecall` int(5) unsigned NOT NULL DEFAULT '0',
  `livechat` int(6) unsigned NOT NULL DEFAULT '0',
  `videoshow` int(5) unsigned NOT NULL DEFAULT '0',
  `address` int(5) unsigned NOT NULL DEFAULT '0',
  `flowergifts` int(5) unsigned NOT NULL DEFAULT '0',
  `qpiddate` int(5) unsigned NOT NULL DEFAULT '0',
  `cancel_reactive_log` int(11) NOT NULL,
  `app_install_logs` int(11) NOT NULL,
  `halloween_game` int(11) NOT NULL,
  `device_num` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `manid` (`manid`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

/*Table structure for table `us_client_bg` */

DROP TABLE IF EXISTS `us_client_bg`;

CREATE TABLE `us_client_bg` (
  `manid` varchar(20) NOT NULL DEFAULT '',
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
  `firstname` varchar(30) NOT NULL DEFAULT '',
  `lastname` varchar(30) NOT NULL DEFAULT '',
  `city` varchar(50) NOT NULL DEFAULT '',
  `state` varchar(50) NOT NULL DEFAULT '',
  `zipcode` varchar(20) NOT NULL DEFAULT '',
  `adddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `lastupdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `complete` char(1) NOT NULL DEFAULT 'N',
  UNIQUE KEY `manid` (`manid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `worth_member` */

DROP TABLE IF EXISTS `worth_member`;

CREATE TABLE `worth_member` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `birthday` date NOT NULL,
  `gender` char(1) NOT NULL DEFAULT 'M',
  `submitdate` datetime NOT NULL,
  `siteid` char(1) NOT NULL,
  `current_worth_id` int(11) NOT NULL,
  `current_worth` decimal(6,2) NOT NULL,
  `country` varchar(2) NOT NULL,
  `age_range` char(1) NOT NULL,
  `adsuser` varchar(40) NOT NULL,
  `offer_id` varchar(100) NOT NULL,
  `accept` varchar(1) NOT NULL,
  `ipstatus` tinyint(1) unsigned NOT NULL,
  `adsuser_follow` varchar(40) NOT NULL,
  `adsuser_follow_name` varchar(40) NOT NULL,
  `ads_type` char(1) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `siteid` (`country`,`age_range`,`ads_type`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=394601 DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
