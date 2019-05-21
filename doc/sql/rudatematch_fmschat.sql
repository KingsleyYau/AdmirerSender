/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.8.177_CD_LC
 Source Server Type    : MySQL
 Source Server Version : 50517
 Source Host           : 192.168.8.177
 Source Database       : rudatematch_fmschat

 Target Server Type    : MySQL
 Target Server Version : 50517
 File Encoding         : utf-8

 Date: 04/03/2019 14:15:33 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `activities_woman`
-- ----------------------------
DROP TABLE IF EXISTS `activities_woman`;
CREATE TABLE `activities_woman` (
  `womanid` varchar(30) NOT NULL,
  `agentid` varchar(12) NOT NULL,
  `rank` int(5) NOT NULL,
  `adddate` datetime NOT NULL,
  UNIQUE KEY `womanid` (`womanid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `block_list`
-- ----------------------------
DROP TABLE IF EXISTS `block_list`;
CREATE TABLE `block_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `womanid` varchar(20) NOT NULL,
  `manid` varchar(20) NOT NULL,
  `adddate` datetime NOT NULL,
  `ip` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`,`manid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `camshare_online_logs`
-- ----------------------------
DROP TABLE IF EXISTS `camshare_online_logs`;
CREATE TABLE `camshare_online_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agentid` varchar(20) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `cnname` varchar(60) NOT NULL,
  `online_time` datetime NOT NULL,
  `offline_time` datetime NOT NULL,
  `online_date` date NOT NULL,
  `dur_time` int(5) NOT NULL DEFAULT '0',
  `adddate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `online_date` (`online_date`)
) ENGINE=MyISAM AUTO_INCREMENT=275 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `camshare_online_stats`
-- ----------------------------
DROP TABLE IF EXISTS `camshare_online_stats`;
CREATE TABLE `camshare_online_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agentid` varchar(20) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `cnname` varchar(60) NOT NULL,
  `stat_date` date NOT NULL,
  `stat_week` varchar(10) NOT NULL,
  `stat_month` varchar(10) NOT NULL,
  `dur_time` int(5) NOT NULL DEFAULT '0',
  `adddate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `womanid_stat_date` (`womanid`,`stat_date`),
  KEY `agentid` (`agentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `camshare_videolist`
-- ----------------------------
DROP TABLE IF EXISTS `camshare_videolist`;
CREATE TABLE `camshare_videolist` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `user_type` tinyint(1) NOT NULL DEFAULT '0',
  `video_type` tinyint(1) NOT NULL DEFAULT '0',
  `file_name` varchar(80) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=659 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `charge_creditsback`
-- ----------------------------
DROP TABLE IF EXISTS `charge_creditsback`;
CREATE TABLE `charge_creditsback` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `inviteid` varchar(32) NOT NULL,
  `womanid` varchar(12) NOT NULL,
  `manid` varchar(12) NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `adddate` datetime NOT NULL,
  `needcredits` decimal(5,2) NOT NULL,
  `returncredits` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `inviteid` (`inviteid`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `charge_history`
-- ----------------------------
DROP TABLE IF EXISTS `charge_history`;
CREATE TABLE `charge_history` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `inviteid` varchar(32) NOT NULL,
  `womanid` varchar(12) NOT NULL,
  `manid` varchar(12) NOT NULL,
  `chattype` tinyint(1) NOT NULL,
  `chatid` int(11) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `adddate` datetime NOT NULL,
  `credits` decimal(5,2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `inviteid` (`inviteid`)
) ENGINE=MyISAM AUTO_INCREMENT=14697 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `chat_contact_list`
-- ----------------------------
DROP TABLE IF EXISTS `chat_contact_list`;
CREATE TABLE `chat_contact_list` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `womanid` varchar(12) NOT NULL,
  `woman_fn` varchar(20) NOT NULL,
  `woman_ln` varchar(20) NOT NULL,
  `manid` varchar(12) NOT NULL,
  `man_fn` varchar(30) NOT NULL,
  `man_ln` varchar(30) NOT NULL,
  `m_country` varchar(3) NOT NULL,
  `m_birthday` date NOT NULL,
  `m_marry` int(2) NOT NULL,
  `flag` tinyint(1) NOT NULL,
  `adddate` datetime NOT NULL,
  `woman_deleted` tinyint(1) NOT NULL,
  `man_deleted` tinyint(1) NOT NULL,
  `update_man` datetime NOT NULL,
  `update_woman` datetime NOT NULL,
  `agentid` varchar(8) NOT NULL,
  `cnname` varchar(60) NOT NULL,
  `man_auto_id` int(8) NOT NULL,
  `woman_auto_id` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `womanid` (`womanid`,`manid`),
  KEY `manid` (`manid`)
) ENGINE=MyISAM AUTO_INCREMENT=481 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `chat_history`
-- ----------------------------
DROP TABLE IF EXISTS `chat_history`;
CREATE TABLE `chat_history` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `inviteid` varchar(32) NOT NULL,
  `manid` varchar(12) NOT NULL,
  `womanid` varchar(12) NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `starttime` datetime NOT NULL,
  `endtime` datetime NOT NULL,
  `lastcharge` datetime NOT NULL,
  `adddate` datetime NOT NULL,
  `credits` decimal(5,1) NOT NULL,
  `msgnum` int(5) NOT NULL,
  `videofile` varchar(80) NOT NULL,
  `chattype` tinyint(1) NOT NULL,
  `lastchargetime` int(8) NOT NULL,
  `service_type` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `invite_id` (`inviteid`)
) ENGINE=MyISAM AUTO_INCREMENT=7290 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `chat_invite`
-- ----------------------------
DROP TABLE IF EXISTS `chat_invite`;
CREATE TABLE `chat_invite` (
  `id` bigint(15) NOT NULL AUTO_INCREMENT,
  `inviteid` varchar(32) NOT NULL,
  `manid` varchar(12) NOT NULL,
  `manname` varchar(60) NOT NULL,
  `womanid` varchar(12) NOT NULL,
  `womanname` varchar(40) NOT NULL,
  `toflag` tinyint(1) NOT NULL,
  `textchat_time` int(6) NOT NULL,
  `videochat_time` int(6) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `adddate` datetime NOT NULL,
  `lastupdate` datetime NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `cnname` varchar(255) NOT NULL,
  `startdate` datetime NOT NULL,
  `enddate` datetime NOT NULL,
  `chatwin_man` tinyint(1) NOT NULL,
  `chatwin_woman` tinyint(1) NOT NULL,
  `videostatus` tinyint(1) NOT NULL,
  `textchat_id` bigint(15) NOT NULL,
  `videochat_id` bigint(15) NOT NULL,
  `textchat_time2` int(5) NOT NULL,
  `textchat_time3` int(5) NOT NULL DEFAULT '0',
  `videochat_time2` int(5) NOT NULL,
  `totalcredits` decimal(7,2) NOT NULL,
  `history_id` int(8) NOT NULL,
  `refundcredits` decimal(7,2) NOT NULL,
  `msgnum_mw` int(5) NOT NULL,
  `msgnum_wm` int(5) NOT NULL,
  `need_translate` tinyint(1) NOT NULL DEFAULT '0',
  `translator_id` varchar(12) NOT NULL,
  `translator_name` varchar(30) NOT NULL,
  `lastmsg_mw` datetime NOT NULL,
  `ackmsg_mw` tinyint(1) NOT NULL DEFAULT '0',
  `ackmsg_wm` tinyint(1) NOT NULL DEFAULT '0',
  `returncredits` decimal(8,2) NOT NULL DEFAULT '0.00',
  `fromid` varchar(10) DEFAULT NULL,
  `device_type_m` tinyint(2) NOT NULL DEFAULT '10',
  `device_type_w` tinyint(2) NOT NULL DEFAULT '10',
  `device_id_m` varchar(40) NOT NULL DEFAULT '''''',
  `device_id_w` varchar(40) NOT NULL DEFAULT '''''',
  `emotion_mw` int(5) DEFAULT '0',
  `emotion_wm` int(5) DEFAULT '0',
  `free_ticketid` varchar(20) NOT NULL DEFAULT '',
  `game_time` int(5) NOT NULL DEFAULT '0',
  `game_time2` int(5) NOT NULL DEFAULT '0',
  `voice_mw` int(5) DEFAULT '0',
  `voice_wm` int(5) DEFAULT '0',
  `magicicon_mw` int(5) DEFAULT '0',
  `magicicon_wm` int(5) DEFAULT '0',
  `subject_mw` int(5) DEFAULT '0',
  `service_type` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `inviteid` (`inviteid`),
  KEY `manid` (`manid`,`womanid`),
  KEY `search` (`status`,`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=11544 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `chat_invite_expired`
-- ----------------------------
DROP TABLE IF EXISTS `chat_invite_expired`;
CREATE TABLE `chat_invite_expired` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `inviteid` varchar(32) NOT NULL,
  `manid` varchar(12) NOT NULL,
  `manname` varchar(60) NOT NULL,
  `womanid` varchar(12) NOT NULL,
  `womanname` varchar(40) NOT NULL,
  `toflag` tinyint(1) NOT NULL,
  `textchat_time` int(6) NOT NULL,
  `videochat_time` int(6) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `adddate` datetime NOT NULL,
  `lastupdate` datetime NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `cnname` varchar(255) NOT NULL,
  `startdate` datetime NOT NULL,
  `enddate` datetime NOT NULL,
  `chatwin_man` tinyint(1) NOT NULL,
  `chatwin_woman` tinyint(1) NOT NULL,
  `videostatus` tinyint(1) NOT NULL,
  `textchat_id` bigint(8) NOT NULL,
  `videochat_id` bigint(8) NOT NULL,
  `textchat_time2` int(5) NOT NULL,
  `textchat_time3` int(5) NOT NULL DEFAULT '0',
  `videochat_time2` int(5) NOT NULL,
  `totalcredits` decimal(7,2) NOT NULL,
  `history_id` int(8) NOT NULL,
  `refundcredits` decimal(7,2) NOT NULL,
  `msgnum_mw` int(5) NOT NULL,
  `msgnum_wm` int(5) NOT NULL,
  `need_translate` tinyint(1) NOT NULL DEFAULT '0',
  `translator_id` varchar(12) NOT NULL,
  `translator_name` varchar(30) NOT NULL,
  `lastmsg_mw` datetime NOT NULL,
  `ackmsg_mw` tinyint(1) NOT NULL DEFAULT '0',
  `ackmsg_wm` tinyint(1) NOT NULL DEFAULT '0',
  `returncredits` decimal(8,2) NOT NULL DEFAULT '0.00',
  `fromid` varchar(10) DEFAULT NULL,
  `device_type_m` tinyint(2) NOT NULL DEFAULT '10',
  `device_type_w` tinyint(2) NOT NULL DEFAULT '10',
  `device_id_m` varchar(40) NOT NULL DEFAULT '',
  `device_id_w` varchar(40) NOT NULL DEFAULT '',
  `emotion_mw` int(5) DEFAULT '0',
  `emotion_wm` int(5) DEFAULT '0',
  `free_ticketid` varchar(20) NOT NULL DEFAULT '',
  `game_time` int(5) NOT NULL DEFAULT '0',
  `game_time2` int(5) NOT NULL DEFAULT '0',
  `voice_mw` int(5) DEFAULT '0',
  `voice_wm` int(5) DEFAULT '0',
  `magicicon_mw` int(5) DEFAULT '0',
  `magicicon_wm` int(5) DEFAULT '0',
  `subject_mw` int(5) DEFAULT '0',
  `service_type` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `inviteid` (`inviteid`),
  KEY `manid` (`manid`,`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=11543 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `chat_invite_expired_03`
-- ----------------------------
DROP TABLE IF EXISTS `chat_invite_expired_03`;
CREATE TABLE `chat_invite_expired_03` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `inviteid` varchar(32) NOT NULL,
  `manid` varchar(12) NOT NULL,
  `manname` varchar(60) NOT NULL,
  `womanid` varchar(12) NOT NULL,
  `womanname` varchar(40) NOT NULL,
  `toflag` tinyint(1) NOT NULL,
  `textchat_time` int(6) NOT NULL,
  `videochat_time` int(6) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `adddate` datetime NOT NULL,
  `lastupdate` datetime NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `cnname` varchar(255) NOT NULL,
  `startdate` datetime NOT NULL,
  `enddate` datetime NOT NULL,
  `chatwin_man` tinyint(1) NOT NULL,
  `chatwin_woman` tinyint(1) NOT NULL,
  `videostatus` tinyint(1) NOT NULL,
  `textchat_id` bigint(8) NOT NULL,
  `videochat_id` bigint(8) NOT NULL,
  `textchat_time2` int(5) NOT NULL,
  `textchat_time3` int(5) NOT NULL DEFAULT '0',
  `videochat_time2` int(5) NOT NULL,
  `totalcredits` decimal(7,2) NOT NULL,
  `history_id` int(8) NOT NULL,
  `refundcredits` decimal(7,2) NOT NULL,
  `msgnum_mw` int(5) NOT NULL,
  `msgnum_wm` int(5) NOT NULL,
  `need_translate` tinyint(1) NOT NULL DEFAULT '0',
  `translator_id` varchar(12) NOT NULL,
  `translator_name` varchar(30) NOT NULL,
  `lastmsg_mw` datetime NOT NULL,
  `ackmsg_mw` tinyint(1) NOT NULL DEFAULT '0',
  `ackmsg_wm` tinyint(1) NOT NULL DEFAULT '0',
  `returncredits` decimal(8,2) NOT NULL DEFAULT '0.00',
  `fromid` varchar(10) DEFAULT NULL,
  `device_type_m` tinyint(2) NOT NULL DEFAULT '10',
  `device_type_w` tinyint(2) NOT NULL DEFAULT '10',
  `device_id_m` varchar(40) NOT NULL DEFAULT '',
  `device_id_w` varchar(40) NOT NULL DEFAULT '',
  `emotion_mw` int(5) DEFAULT '0',
  `emotion_wm` int(5) DEFAULT '0',
  `free_ticketid` varchar(20) NOT NULL DEFAULT '',
  `game_time` int(5) NOT NULL DEFAULT '0',
  `game_time2` int(5) NOT NULL DEFAULT '0',
  `voice_mw` int(5) DEFAULT '0',
  `voice_wm` int(5) DEFAULT '0',
  `magicicon_mw` int(5) DEFAULT '0',
  `magicicon_wm` int(5) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `inviteid` (`inviteid`),
  KEY `manid` (`manid`,`womanid`),
  KEY `agentid` (`agentid`,`womanid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`id`),
  KEY `stats_date` (`stats_date`,`agentid`,`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=463 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `chat_invite_freetrial`
-- ----------------------------
DROP TABLE IF EXISTS `chat_invite_freetrial`;
CREATE TABLE `chat_invite_freetrial` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `inviteid` varchar(32) NOT NULL,
  `manid` varchar(12) NOT NULL,
  `manname` varchar(60) NOT NULL,
  `womanid` varchar(12) NOT NULL,
  `womanname` varchar(40) NOT NULL,
  `toflag` tinyint(1) NOT NULL,
  `textchat_time` int(6) NOT NULL,
  `videochat_time` int(6) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `adddate` datetime NOT NULL,
  `lastupdate` datetime NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `cnname` varchar(255) NOT NULL,
  `startdate` datetime NOT NULL,
  `enddate` datetime NOT NULL,
  `chatwin_man` tinyint(1) NOT NULL,
  `chatwin_woman` tinyint(1) NOT NULL,
  `videostatus` tinyint(1) NOT NULL,
  `textchat_id` bigint(8) NOT NULL,
  `videochat_id` bigint(8) NOT NULL,
  `textchat_time2` int(5) NOT NULL,
  `textchat_time3` int(5) NOT NULL DEFAULT '0',
  `videochat_time2` int(5) NOT NULL,
  `totalcredits` decimal(7,2) NOT NULL,
  `history_id` int(8) NOT NULL,
  `refundcredits` decimal(7,2) NOT NULL,
  `msgnum_mw` int(5) NOT NULL,
  `msgnum_wm` int(5) NOT NULL,
  `need_translate` tinyint(1) NOT NULL DEFAULT '0',
  `translator_id` varchar(12) NOT NULL,
  `translator_name` varchar(30) NOT NULL,
  `lastmsg_mw` datetime NOT NULL,
  `ackmsg_mw` tinyint(1) NOT NULL DEFAULT '0',
  `ackmsg_wm` tinyint(1) NOT NULL DEFAULT '0',
  `returncredits` decimal(8,2) NOT NULL DEFAULT '0.00',
  `fromid` varchar(10) DEFAULT NULL,
  `device_type_m` tinyint(2) NOT NULL DEFAULT '10',
  `device_type_w` tinyint(2) NOT NULL DEFAULT '10',
  `device_id_m` varchar(40) NOT NULL DEFAULT '''''',
  `device_id_w` varchar(40) NOT NULL DEFAULT '''''',
  `emotion_mw` int(5) DEFAULT '0',
  `emotion_wm` int(5) DEFAULT '0',
  `free_ticketid` varchar(20) NOT NULL DEFAULT '',
  `game_time` int(5) NOT NULL DEFAULT '0',
  `game_time2` int(5) NOT NULL DEFAULT '0',
  `voice_mw` int(5) DEFAULT '0',
  `voice_wm` int(5) DEFAULT '0',
  `magicicon_mw` int(5) DEFAULT '0',
  `magicicon_wm` int(5) DEFAULT '0',
  `subject_mw` int(5) DEFAULT '0',
  `service_type` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `inviteid` (`inviteid`),
  KEY `manid` (`manid`,`womanid`),
  KEY `search` (`status`,`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=11536 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `chat_invite_miss`
-- ----------------------------
DROP TABLE IF EXISTS `chat_invite_miss`;
CREATE TABLE `chat_invite_miss` (
  `id` bigint(15) NOT NULL AUTO_INCREMENT,
  `inviteid` varchar(32) NOT NULL,
  `manid` varchar(12) NOT NULL,
  `manname` varchar(60) NOT NULL,
  `womanid` varchar(12) NOT NULL,
  `womanname` varchar(40) NOT NULL,
  `toflag` tinyint(1) NOT NULL,
  `textchat_time` int(6) NOT NULL,
  `videochat_time` int(6) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `adddate` datetime NOT NULL,
  `lastupdate` datetime NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `cnname` varchar(255) NOT NULL,
  `startdate` datetime NOT NULL,
  `enddate` datetime NOT NULL,
  `chatwin_man` tinyint(1) NOT NULL,
  `chatwin_woman` tinyint(1) NOT NULL,
  `videostatus` tinyint(1) NOT NULL,
  `textchat_id` bigint(15) NOT NULL,
  `videochat_id` bigint(15) NOT NULL,
  `textchat_time2` int(5) NOT NULL,
  `textchat_time3` int(5) NOT NULL DEFAULT '0',
  `videochat_time2` int(5) NOT NULL,
  `totalcredits` decimal(7,2) NOT NULL DEFAULT '0.00',
  `history_id` int(8) NOT NULL,
  `refundcredits` decimal(7,2) NOT NULL,
  `msgnum_mw` int(5) NOT NULL,
  `msgnum_wm` int(5) NOT NULL,
  `returncredits` decimal(7,2) NOT NULL DEFAULT '0.00',
  `need_translate` tinyint(1) NOT NULL DEFAULT '0',
  `translator_id` varchar(12) NOT NULL,
  `translator_name` varchar(50) NOT NULL,
  `lastmsg_mw` datetime NOT NULL,
  `ackmsg_mw` tinyint(1) NOT NULL DEFAULT '0',
  `ackmsg_wm` tinyint(1) NOT NULL DEFAULT '0',
  `fromid` varchar(10) DEFAULT NULL,
  `device_type_m` tinyint(2) NOT NULL DEFAULT '10',
  `device_type_w` tinyint(2) NOT NULL DEFAULT '10',
  `device_id_m` varchar(40) NOT NULL DEFAULT '',
  `device_id_w` varchar(40) NOT NULL DEFAULT '',
  `emotion_mw` int(5) DEFAULT '0',
  `emotion_wm` int(5) DEFAULT '0',
  `free_ticketid` varchar(20) NOT NULL DEFAULT '',
  `game_time` int(5) NOT NULL DEFAULT '0',
  `game_time2` int(5) NOT NULL DEFAULT '0',
  `voice_mw` int(5) DEFAULT '0',
  `voice_wm` int(5) DEFAULT '0',
  `magicicon_mw` int(5) DEFAULT '0',
  `magicicon_wm` int(5) DEFAULT '0',
  `subject_mw` int(5) DEFAULT '0',
  `service_type` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `inviteid` (`inviteid`),
  KEY `manid` (`manid`,`womanid`),
  KEY `search` (`status`,`womanid`),
  KEY `agentid` (`agentid`,`status`)
) ENGINE=MyISAM AUTO_INCREMENT=11534 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `chat_invite_miss_log`
-- ----------------------------
DROP TABLE IF EXISTS `chat_invite_miss_log`;
CREATE TABLE `chat_invite_miss_log` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `inviteid` varchar(32) NOT NULL,
  `womanid` varchar(12) NOT NULL,
  `agentid` varchar(12) NOT NULL,
  `manid` varchar(12) NOT NULL,
  `sendtime` datetime NOT NULL,
  `backtime` datetime NOT NULL,
  `opentime` datetime NOT NULL,
  `info` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `inviteid` (`inviteid`),
  KEY `agentid` (`agentid`,`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `chat_invite_succeed`
-- ----------------------------
DROP TABLE IF EXISTS `chat_invite_succeed`;
CREATE TABLE `chat_invite_succeed` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `inviteid` varchar(32) NOT NULL,
  `manid` varchar(12) NOT NULL,
  `manname` varchar(60) NOT NULL,
  `womanid` varchar(12) NOT NULL,
  `womanname` varchar(40) NOT NULL,
  `toflag` tinyint(1) NOT NULL,
  `textchat_time` int(6) NOT NULL,
  `videochat_time` int(6) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `adddate` datetime NOT NULL,
  `lastupdate` datetime NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `cnname` varchar(255) NOT NULL,
  `startdate` datetime NOT NULL,
  `enddate` datetime NOT NULL,
  `chatwin_man` tinyint(1) NOT NULL,
  `chatwin_woman` tinyint(1) NOT NULL,
  `videostatus` tinyint(1) NOT NULL,
  `textchat_id` bigint(8) NOT NULL,
  `videochat_id` bigint(8) NOT NULL,
  `textchat_time2` int(5) NOT NULL,
  `textchat_time3` int(5) NOT NULL DEFAULT '0',
  `videochat_time2` int(5) NOT NULL,
  `totalcredits` decimal(7,2) NOT NULL,
  `history_id` int(8) NOT NULL,
  `refundcredits` decimal(7,2) NOT NULL,
  `msgnum_mw` int(5) NOT NULL,
  `msgnum_wm` int(5) NOT NULL,
  `need_translate` tinyint(1) NOT NULL DEFAULT '0',
  `translator_id` varchar(12) NOT NULL,
  `translator_name` varchar(30) NOT NULL,
  `lastmsg_mw` datetime NOT NULL,
  `ackmsg_mw` tinyint(1) NOT NULL DEFAULT '0',
  `ackmsg_wm` tinyint(1) NOT NULL DEFAULT '0',
  `returncredits` decimal(8,2) NOT NULL DEFAULT '0.00',
  `fromid` varchar(10) DEFAULT NULL,
  `device_type_m` tinyint(2) NOT NULL DEFAULT '10',
  `device_type_w` tinyint(2) NOT NULL DEFAULT '10',
  `device_id_m` varchar(40) NOT NULL DEFAULT '',
  `device_id_w` varchar(40) NOT NULL DEFAULT '',
  `emotion_mw` int(5) DEFAULT '0',
  `emotion_wm` int(5) DEFAULT '0',
  `free_ticketid` varchar(20) NOT NULL DEFAULT '',
  `game_time` int(5) NOT NULL DEFAULT '0',
  `game_time2` int(5) NOT NULL DEFAULT '0',
  `voice_mw` int(5) DEFAULT '0',
  `voice_wm` int(5) DEFAULT '0',
  `magicicon_mw` int(5) DEFAULT '0',
  `magicicon_wm` int(5) DEFAULT '0',
  `subject_mw` int(5) DEFAULT '0',
  `service_type` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `inviteid` (`inviteid`),
  KEY `manid` (`manid`,`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=11544 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `chatvoice_setlog`
-- ----------------------------
DROP TABLE IF EXISTS `chatvoice_setlog`;
CREATE TABLE `chatvoice_setlog` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `inviteid` varchar(20) NOT NULL,
  `voiceid` varchar(30) NOT NULL,
  `content` text NOT NULL,
  `staff_id` varchar(15) NOT NULL,
  `staff_name` varchar(30) NOT NULL,
  `addtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `inviteid_voiceid` (`inviteid`,`voiceid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `emoticons`
-- ----------------------------
DROP TABLE IF EXISTS `emoticons`;
CREATE TABLE `emoticons` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `eid` varchar(10) NOT NULL COMMENT '表情ID',
  `title` varchar(50) NOT NULL COMMENT '表情名称',
  `toflag` tinyint(1) unsigned NOT NULL COMMENT '使用方，0男士端，1女士端',
  `status` tinyint(1) unsigned NOT NULL COMMENT '显示状态',
  `typeid` smallint(6) unsigned NOT NULL COMMENT '分类关联id',
  `tagid` smallint(6) unsigned NOT NULL COMMENT '标签关联id',
  `order` smallint(6) unsigned NOT NULL COMMENT '排序号（越大越靠前显示）',
  `price` decimal(6,2) unsigned NOT NULL COMMENT '价格',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '是否新表情',
  `issale` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `playmode` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `adddate` datetime NOT NULL COMMENT '添加日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `eid_toflag` (`eid`,`toflag`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `emoticons_logs`
-- ----------------------------
DROP TABLE IF EXISTS `emoticons_logs`;
CREATE TABLE `emoticons_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `toflag` tinyint(1) NOT NULL DEFAULT '0',
  `version` smallint(4) NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `staff_id` varchar(15) NOT NULL,
  `staff_name` varchar(30) NOT NULL,
  `addtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `toflag` (`toflag`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `emoticons_tags`
-- ----------------------------
DROP TABLE IF EXISTS `emoticons_tags`;
CREATE TABLE `emoticons_tags` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '标签自动编号',
  `title` varchar(20) NOT NULL COMMENT '标签名称',
  `toflag` tinyint(1) unsigned NOT NULL COMMENT '使用方，0男士端，1女士端',
  `status` tinyint(1) unsigned NOT NULL COMMENT '显示状态',
  `order` smallint(6) unsigned NOT NULL COMMENT '排序（越大越靠前显示）',
  `typeid` smallint(6) unsigned NOT NULL COMMENT '分类关联id',
  PRIMARY KEY (`id`),
  KEY `toflag_status` (`toflag`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `emoticons_tips`
-- ----------------------------
DROP TABLE IF EXISTS `emoticons_tips`;
CREATE TABLE `emoticons_tips` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `styleid` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `typeid` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `content` varchar(255) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `startdate` datetime NOT NULL,
  `enddate` datetime NOT NULL,
  `addtime` datetime NOT NULL,
  `updatetime` datetime NOT NULL,
  `staff_id` varchar(15) NOT NULL,
  `staff_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status_startdate_enddate` (`status`,`startdate`,`enddate`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `emoticons_type`
-- ----------------------------
DROP TABLE IF EXISTS `emoticons_type`;
CREATE TABLE `emoticons_type` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `title` varchar(20) NOT NULL COMMENT '分类名称',
  `toflag` tinyint(1) unsigned NOT NULL COMMENT '使用方，0男士端，1女士端',
  `status` tinyint(1) unsigned NOT NULL COMMENT '显示状态',
  `order` smallint(6) unsigned NOT NULL COMMENT '排序（越大越靠前显示）',
  PRIMARY KEY (`id`),
  KEY `toflag` (`toflag`,`status`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `free_trial_lc`
-- ----------------------------
DROP TABLE IF EXISTS `free_trial_lc`;
CREATE TABLE `free_trial_lc` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `lc_totalnum` int(5) NOT NULL,
  `usetrial` tinyint(4) NOT NULL,
  `trial_date` datetime NOT NULL,
  `credits` decimal(8,2) NOT NULL,
  `adddate` datetime NOT NULL,
  `ip` varchar(20) NOT NULL,
  `firstchat` datetime NOT NULL,
  `lastchat` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `manid` (`manid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `freechat_log`
-- ----------------------------
DROP TABLE IF EXISTS `freechat_log`;
CREATE TABLE `freechat_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticketid` varchar(20) NOT NULL,
  `manid` varchar(20) NOT NULL,
  `inviteid` varchar(32) DEFAULT NULL,
  `usedate` datetime NOT NULL,
  `cycle` int(4) NOT NULL,
  `startdate` datetime NOT NULL,
  `enddate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticketId` (`ticketid`,`manid`)
) ENGINE=MyISAM AUTO_INCREMENT=190 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `freechat_ticket`
-- ----------------------------
DROP TABLE IF EXISTS `freechat_ticket`;
CREATE TABLE `freechat_ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticketid` varchar(20) NOT NULL,
  `manid` varchar(20) NOT NULL,
  `type` int(2) NOT NULL,
  `adddate` datetime NOT NULL,
  `startdate` datetime NOT NULL,
  `enddate` datetime NOT NULL,
  `cycle` int(4) NOT NULL,
  `starthour` datetime NOT NULL,
  `endhour` datetime NOT NULL,
  `useflag` int(1) NOT NULL,
  `balance` int(4) NOT NULL,
  `manname` varchar(50) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `creator` varchar(30) NOT NULL,
  `ip` varchar(25) NOT NULL,
  `classify` int(3) NOT NULL,
  `used_date` datetime NOT NULL,
  `noteflag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `womanid` varchar(20) NOT NULL,
  `agent` varchar(10) NOT NULL DEFAULT '',
  `inviteid` varchar(32) NOT NULL DEFAULT '',
  `charge` tinyint(1) NOT NULL DEFAULT '0',
  `order_num` int(5) NOT NULL,
  `submitdate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mw` (`manid`,`womanid`),
  KEY `ticketId` (`ticketid`,`manid`)
) ENGINE=MyISAM AUTO_INCREMENT=432 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `freechat_ticket_refund`
-- ----------------------------
DROP TABLE IF EXISTS `freechat_ticket_refund`;
CREATE TABLE `freechat_ticket_refund` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `inviteid` varchar(32) NOT NULL,
  `free_ticketid` varchar(20) NOT NULL,
  `manid` varchar(12) NOT NULL,
  `manname` varchar(60) NOT NULL,
  `womanid` varchar(12) NOT NULL,
  `womanname` varchar(40) NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `service_type` tinyint(1) NOT NULL DEFAULT '0',
  `toflag` tinyint(1) NOT NULL,
  `need_translate` tinyint(1) NOT NULL DEFAULT '0',
  `translator_id` varchar(12) NOT NULL,
  `translator_name` varchar(30) NOT NULL,
  `ticket_time` int(5) NOT NULL,
  `chat_time` int(5) NOT NULL,
  `return_credit` decimal(5,2) NOT NULL,
  `refundstatus` tinyint(1) NOT NULL DEFAULT '0',
  `totalcredits` decimal(7,2) NOT NULL,
  `msgnum_mw` int(5) NOT NULL DEFAULT '0',
  `msgnum_wm` int(5) NOT NULL DEFAULT '0',
  `adddate` datetime NOT NULL,
  `addtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `refund_refid1` int(11) NOT NULL DEFAULT '0',
  `refund_refid2` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `inviteid` (`inviteid`),
  KEY `agentid` (`agentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `freechat_ticket_refund_detail`
-- ----------------------------
DROP TABLE IF EXISTS `freechat_ticket_refund_detail`;
CREATE TABLE `freechat_ticket_refund_detail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `inviteid` varchar(32) NOT NULL,
  `free_ticketid` varchar(20) NOT NULL,
  `manid` varchar(12) NOT NULL,
  `manname` varchar(60) NOT NULL,
  `womanid` varchar(12) NOT NULL,
  `womanname` varchar(40) NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `service_type` tinyint(1) NOT NULL DEFAULT '0',
  `toflag` tinyint(1) NOT NULL,
  `need_translate` tinyint(1) NOT NULL DEFAULT '0',
  `translator_id` varchar(12) NOT NULL,
  `translator_name` varchar(30) NOT NULL,
  `ticket_time` int(5) NOT NULL,
  `return_credit` decimal(5,2) NOT NULL,
  `adddate` datetime NOT NULL,
  `addtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `inviteid` (`inviteid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `freechat_ticket_refund_result`
-- ----------------------------
DROP TABLE IF EXISTS `freechat_ticket_refund_result`;
CREATE TABLE `freechat_ticket_refund_result` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `stat_date` date NOT NULL,
  `stat_week` varchar(10) NOT NULL,
  `stat_month` varchar(10) NOT NULL,
  `agentid` varchar(20) NOT NULL,
  `service_type` tinyint(1) NOT NULL DEFAULT '0',
  `titcket_total` int(5) unsigned NOT NULL DEFAULT '0',
  `credits_total` decimal(7,2) NOT NULL DEFAULT '0.00',
  `titcket_paid` int(5) unsigned NOT NULL DEFAULT '0',
  `chat_credits` decimal(7,2) NOT NULL DEFAULT '0.00',
  `adddate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stat_date_agentid` (`stat_date`,`agentid`,`service_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `freechat_ticket_refund_stats`
-- ----------------------------
DROP TABLE IF EXISTS `freechat_ticket_refund_stats`;
CREATE TABLE `freechat_ticket_refund_stats` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `stat_month` varchar(10) NOT NULL,
  `agentid` varchar(20) NOT NULL,
  `service_type` tinyint(1) NOT NULL DEFAULT '0',
  `titcket_total` int(5) NOT NULL DEFAULT '0',
  `credits_total` decimal(7,2) NOT NULL DEFAULT '0.00',
  `adddate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stat_month_agentid` (`stat_month`,`agentid`,`service_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `invite_template`
-- ----------------------------
DROP TABLE IF EXISTS `invite_template`;
CREATE TABLE `invite_template` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `typeid` smallint(4) NOT NULL DEFAULT '0',
  `autoflag` tinyint(1) NOT NULL DEFAULT '0',
  `womanid` varchar(20) NOT NULL,
  `agentid` varchar(20) NOT NULL,
  `msg` varchar(800) NOT NULL,
  `adddate` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `staff_id` varchar(15) NOT NULL,
  `staff_name` varchar(30) NOT NULL,
  `review_time` datetime NOT NULL,
  `service_type` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`,`status`)
) ENGINE=MyISAM AUTO_INCREMENT=144960 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `invite_template_old`
-- ----------------------------
DROP TABLE IF EXISTS `invite_template_old`;
CREATE TABLE `invite_template_old` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `womanid` varchar(20) NOT NULL,
  `agentid` varchar(20) NOT NULL,
  `msg` varchar(800) NOT NULL,
  `adddate` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `staff_id` varchar(15) NOT NULL,
  `staff_name` varchar(30) NOT NULL,
  `review_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `womanid` (`womanid`,`status`)
) ENGINE=MyISAM AUTO_INCREMENT=339 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `invite_template_type`
-- ----------------------------
DROP TABLE IF EXISTS `invite_template_type`;
CREATE TABLE `invite_template_type` (
  `typeid` smallint(4) NOT NULL AUTO_INCREMENT,
  `isdefault` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `typename` varchar(50) NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `editstartdate` date NOT NULL,
  `editenddate` date NOT NULL,
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`typeid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `livechat_activity`
-- ----------------------------
DROP TABLE IF EXISTS `livechat_activity`;
CREATE TABLE `livechat_activity` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `promcode` varchar(50) NOT NULL,
  `starttime` datetime NOT NULL,
  `endtime` datetime NOT NULL,
  `device_type` varchar(50) NOT NULL,
  `rule_id` tinyint(2) NOT NULL DEFAULT '1',
  `order` smallint(6) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `rate` decimal(8,2) NOT NULL,
  `mincredits` decimal(8,2) NOT NULL,
  `adddate` datetime NOT NULL,
  `comment` varchar(500) NOT NULL,
  `total_mb` int(8) NOT NULL,
  `total_credits` decimal(10,2) NOT NULL,
  `total_num` int(8) NOT NULL,
  `textchat` tinyint(1) NOT NULL DEFAULT '0',
  `videochat` tinyint(1) NOT NULL DEFAULT '0',
  `camchat` tinyint(1) NOT NULL DEFAULT '0',
  `service_type` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=524 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `livechat_activity_detail`
-- ----------------------------
DROP TABLE IF EXISTS `livechat_activity_detail`;
CREATE TABLE `livechat_activity_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manid` varchar(20) NOT NULL,
  `womanid` varchar(30) NOT NULL,
  `inviteid` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `adddate` datetime NOT NULL,
  `return_credits` decimal(8,2) NOT NULL,
  `last_return_date` datetime NOT NULL,
  `promcode` varchar(20) NOT NULL,
  `mincredits` decimal(8,2) NOT NULL,
  `rate` decimal(8,2) NOT NULL,
  `return_credits_id` int(8) NOT NULL DEFAULT '0',
  `pending_credits` decimal(8,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `manid` (`manid`,`inviteid`)
) ENGINE=MyISAM AUTO_INCREMENT=909 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `livechat_activity_logs`
-- ----------------------------
DROP TABLE IF EXISTS `livechat_activity_logs`;
CREATE TABLE `livechat_activity_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manid` varchar(20) NOT NULL,
  `inviteid` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `adddate` datetime NOT NULL,
  `return_credits` decimal(8,2) NOT NULL,
  `return_date` datetime NOT NULL,
  `promcode` varchar(20) NOT NULL,
  `chargeid` int(8) NOT NULL,
  `refid` varchar(20) NOT NULL,
  `chattype` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`),
  KEY `inviteid` (`inviteid`)
) ENGINE=MyISAM AUTO_INCREMENT=5561 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `livechat_activity_member`
-- ----------------------------
DROP TABLE IF EXISTS `livechat_activity_member`;
CREATE TABLE `livechat_activity_member` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `manid` varchar(15) NOT NULL,
  `activity_id` int(7) NOT NULL DEFAULT '0',
  `rule_id` tinyint(2) NOT NULL DEFAULT '0',
  `startdate` datetime NOT NULL,
  `enddate` datetime NOT NULL,
  `addtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `livechat_block`
-- ----------------------------
DROP TABLE IF EXISTS `livechat_block`;
CREATE TABLE `livechat_block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ownerid` varchar(20) NOT NULL,
  `friendid` varchar(20) NOT NULL,
  `adddate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ownerid` (`ownerid`,`friendid`)
) ENGINE=MyISAM AUTO_INCREMENT=1745 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `livechat_emotion`
-- ----------------------------
DROP TABLE IF EXISTS `livechat_emotion`;
CREATE TABLE `livechat_emotion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` varchar(10) NOT NULL,
  `fromId` varchar(20) NOT NULL,
  `toId` varchar(20) NOT NULL,
  `adddate` datetime NOT NULL,
  `price` decimal(7,2) NOT NULL,
  `inviteid` varchar(20) DEFAULT NULL,
  `toflag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `livechat_firstrelation`
-- ----------------------------
DROP TABLE IF EXISTS `livechat_firstrelation`;
CREATE TABLE `livechat_firstrelation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manid` varchar(20) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `inviteid` varchar(32) NOT NULL,
  `agentid` varchar(12) NOT NULL,
  `adddate` datetime NOT NULL,
  `manname` varchar(60) NOT NULL,
  `womanname` varchar(60) NOT NULL,
  `cnname` varchar(150) NOT NULL DEFAULT '',
  `allowemf` tinyint(1) NOT NULL,
  `replied` tinyint(1) NOT NULL DEFAULT '0',
  `reply_date` datetime NOT NULL,
  `msgid` int(8) NOT NULL,
  `translator` varchar(20) NOT NULL,
  `translator_id` varchar(20) NOT NULL,
  `ykf` tinyint(1) NOT NULL DEFAULT '0',
  `startdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `enddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `duration` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `manid` (`manid`,`womanid`),
  KEY `inviteid` (`inviteid`)
) ENGINE=MyISAM AUTO_INCREMENT=552 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `livechat_friend`
-- ----------------------------
DROP TABLE IF EXISTS `livechat_friend`;
CREATE TABLE `livechat_friend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ownerid` varchar(20) NOT NULL,
  `friendid` varchar(20) NOT NULL,
  `adddate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ownerid` (`ownerid`,`friendid`)
) ENGINE=MyISAM AUTO_INCREMENT=284 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `livechat_robot_stat`
-- ----------------------------
DROP TABLE IF EXISTS `livechat_robot_stat`;
CREATE TABLE `livechat_robot_stat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agentid` varchar(20) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `cnname` varchar(60) NOT NULL,
  `stat_date` date NOT NULL,
  `stat_week` varchar(10) NOT NULL,
  `stat_month` varchar(10) NOT NULL,
  `robot_times` int(5) DEFAULT '0',
  `adddate` datetime NOT NULL,
  `show_times` int(5) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `womanid` (`womanid`,`stat_date`),
  KEY `agentid` (`agentid`,`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=270 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `livechat_stat_agent`
-- ----------------------------
DROP TABLE IF EXISTS `livechat_stat_agent`;
CREATE TABLE `livechat_stat_agent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agentid` varchar(20) NOT NULL,
  `stat_date` date NOT NULL,
  `stat_week` varchar(10) NOT NULL,
  `stat_month` varchar(10) NOT NULL,
  `textchat_time2` int(5) NOT NULL,
  `textchat_time3` int(5) NOT NULL,
  `lc_times_1` int(5) NOT NULL,
  `lc_credits_1` decimal(10,2) NOT NULL,
  `lc_times_2` int(5) NOT NULL,
  `lc_credits_2` decimal(10,2) NOT NULL,
  `adddate` datetime NOT NULL,
  `emotion_mw` int(5) DEFAULT '0',
  `game_times` int(5) DEFAULT '0',
  `voice_mw` int(5) DEFAULT '0',
  `magicicon_mw` int(5) DEFAULT '0',
  `subject_mw` int(5) DEFAULT '0',
  `service_type` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `agentid_2` (`agentid`,`stat_date`,`service_type`)
) ENGINE=MyISAM AUTO_INCREMENT=407 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `livechat_stat_camshare`
-- ----------------------------
DROP TABLE IF EXISTS `livechat_stat_camshare`;
CREATE TABLE `livechat_stat_camshare` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `stat_date` date NOT NULL,
  `stat_week` varchar(7) NOT NULL,
  `stat_month` varchar(7) NOT NULL,
  `stat_type` tinyint(1) NOT NULL,
  `credits` decimal(6,2) NOT NULL,
  `woman_online` int(4) NOT NULL,
  `woman_num` int(4) NOT NULL,
  `man_num` int(4) NOT NULL,
  `agent_num` int(4) NOT NULL,
  `chat_num` int(4) NOT NULL,
  `relation_num` int(4) NOT NULL,
  `adddate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stat_date_stat_type` (`stat_date`,`stat_type`)
) ENGINE=MyISAM AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `livechat_stat_emotion`
-- ----------------------------
DROP TABLE IF EXISTS `livechat_stat_emotion`;
CREATE TABLE `livechat_stat_emotion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` varchar(20) NOT NULL,
  `stat_date` date NOT NULL,
  `stat_week` varchar(10) NOT NULL,
  `stat_month` varchar(10) NOT NULL,
  `times` int(5) NOT NULL,
  `credits` decimal(10,2) NOT NULL,
  `adddate` datetime NOT NULL,
  `service_type` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `eid` (`eid`,`stat_date`,`service_type`)
) ENGINE=MyISAM AUTO_INCREMENT=273 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `livechat_stat_game`
-- ----------------------------
DROP TABLE IF EXISTS `livechat_stat_game`;
CREATE TABLE `livechat_stat_game` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gid` int(4) NOT NULL,
  `stat_date` date NOT NULL,
  `stat_week` varchar(10) NOT NULL,
  `stat_month` varchar(10) NOT NULL,
  `game_times` int(5) NOT NULL,
  `game_time` int(11) NOT NULL,
  `adddate` datetime NOT NULL,
  `service_type` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `gid` (`gid`,`stat_date`,`service_type`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

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
  `manual_cam` int(8) NOT NULL,
  `manual_short` int(4) NOT NULL,
  `auto_total` int(8) NOT NULL,
  `auto_succeed` int(8) NOT NULL,
  `auto_cam` int(8) NOT NULL,
  `auto_short` int(4) NOT NULL,
  `man_toal` int(8) NOT NULL,
  `man_succeed` int(8) NOT NULL,
  `man_cam` int(8) NOT NULL,
  `man_short` int(4) NOT NULL,
  `man_miss` int(4) NOT NULL,
  `manbatch_total` int(8) NOT NULL,
  `manbatch_succeed` int(8) NOT NULL,
  `manbatch_cam` int(8) NOT NULL,
  `manbatch_short` int(4) NOT NULL,
  `manbatch_miss` int(4) DEFAULT NULL,
  `robot_sendtotal` int(8) NOT NULL,
  `robot_reachtotal` int(8) NOT NULL,
  `robot_succeed` int(8) NOT NULL,
  `robot_cam` int(8) NOT NULL,
  `robot_short` int(8) NOT NULL,
  `robot_person_time` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `agent_date` (`stat_date`,`agentid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `livechat_stat_lady`
-- ----------------------------
DROP TABLE IF EXISTS `livechat_stat_lady`;
CREATE TABLE `livechat_stat_lady` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agentid` varchar(20) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `cnname` varchar(60) NOT NULL,
  `stat_date` date NOT NULL,
  `stat_week` varchar(10) NOT NULL,
  `stat_month` varchar(10) NOT NULL,
  `textchat_time2` int(5) NOT NULL,
  `textchat_time3` int(5) NOT NULL,
  `lc_times_1` int(5) NOT NULL,
  `lc_credits_1` decimal(10,2) NOT NULL,
  `lc_times_2` int(5) NOT NULL,
  `lc_credits_2` decimal(10,2) NOT NULL,
  `adddate` datetime NOT NULL,
  `emotion_mw` int(5) DEFAULT '0',
  `game_times` int(5) DEFAULT '0',
  `voice_mw` int(5) DEFAULT '0',
  `magicicon_mw` int(5) DEFAULT '0',
  `subject_mw` int(5) DEFAULT '0',
  `service_type` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `womanid` (`womanid`,`stat_date`,`service_type`),
  KEY `agentid` (`agentid`,`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=915 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `livechat_stat_magicicon`
-- ----------------------------
DROP TABLE IF EXISTS `livechat_stat_magicicon`;
CREATE TABLE `livechat_stat_magicicon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iconid` varchar(20) NOT NULL,
  `stat_date` date NOT NULL,
  `stat_week` varchar(10) NOT NULL,
  `stat_month` varchar(10) NOT NULL,
  `times` int(5) NOT NULL,
  `credits` decimal(10,2) NOT NULL,
  `adddate` datetime NOT NULL,
  `service_type` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `iconid` (`iconid`,`stat_date`,`service_type`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `livechat_stat_online`
-- ----------------------------
DROP TABLE IF EXISTS `livechat_stat_online`;
CREATE TABLE `livechat_stat_online` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `stat_date` date NOT NULL,
  `stat_week` varchar(7) NOT NULL,
  `stat_month` varchar(7) NOT NULL,
  `stat_hour` int(4) NOT NULL,
  `woman` int(4) NOT NULL,
  `woman_cam` int(4) NOT NULL,
  `man` int(4) NOT NULL,
  `man_paid` int(5) NOT NULL,
  `translator` int(4) NOT NULL,
  `chating` int(4) NOT NULL,
  `adddate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `livechat_stat_short_invite`
-- ----------------------------
DROP TABLE IF EXISTS `livechat_stat_short_invite`;
CREATE TABLE `livechat_stat_short_invite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agentid` varchar(20) NOT NULL DEFAULT '',
  `stat_date` date NOT NULL,
  `stat_week` varchar(10) NOT NULL,
  `stat_month` varchar(10) NOT NULL,
  `to_flag` tinyint(1) NOT NULL,
  `womanid` varchar(20) NOT NULL,
  `cnname` varchar(255) NOT NULL,
  `manid` varchar(50) NOT NULL,
  `inviteid` varchar(32) NOT NULL,
  `adddate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inviteid` (`inviteid`),
  KEY `manid` (`manid`),
  KEY `stat_date` (`stat_date`,`to_flag`)
) ENGINE=MyISAM AUTO_INCREMENT=473 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `livechat_stat_subject`
-- ----------------------------
DROP TABLE IF EXISTS `livechat_stat_subject`;
CREATE TABLE `livechat_stat_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subjectid` varchar(20) NOT NULL,
  `stat_date` date NOT NULL,
  `stat_week` varchar(10) NOT NULL,
  `stat_month` varchar(10) NOT NULL,
  `times` int(5) NOT NULL,
  `credits` decimal(10,2) NOT NULL,
  `adddate` datetime NOT NULL,
  `service_type` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `subjectid` (`subjectid`,`stat_date`,`service_type`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `livechat_stat_translator`
-- ----------------------------
DROP TABLE IF EXISTS `livechat_stat_translator`;
CREATE TABLE `livechat_stat_translator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agentid` varchar(20) NOT NULL,
  `staffid` varchar(20) NOT NULL,
  `staffname` varchar(60) NOT NULL,
  `stat_date` date NOT NULL,
  `stat_week` varchar(10) NOT NULL,
  `stat_month` varchar(10) NOT NULL,
  `textchat_time2` int(5) NOT NULL,
  `textchat_time3` int(5) NOT NULL,
  `lc_times_1` int(5) NOT NULL,
  `lc_credits_1` decimal(10,2) NOT NULL,
  `lc_times_2` int(5) NOT NULL,
  `lc_credits_2` decimal(10,2) NOT NULL,
  `adddate` datetime NOT NULL,
  `service_type` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `staffid` (`staffid`,`agentid`,`stat_date`,`service_type`),
  KEY `agentid` (`agentid`,`staffid`)
) ENGINE=MyISAM AUTO_INCREMENT=231 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `livechat_stat_videomonitor`
-- ----------------------------
DROP TABLE IF EXISTS `livechat_stat_videomonitor`;
CREATE TABLE `livechat_stat_videomonitor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_date` date NOT NULL,
  `stat_week` varchar(10) NOT NULL DEFAULT '',
  `stat_month` varchar(10) NOT NULL DEFAULT '',
  `womanid` varchar(20) NOT NULL DEFAULT '',
  `agentid` varchar(20) NOT NULL DEFAULT '',
  `service_type` tinyint(1) NOT NULL DEFAULT '0',
  `video_num` int(4) NOT NULL DEFAULT '0',
  `chat_num` int(4) NOT NULL DEFAULT '0',
  `chat_time` int(20) NOT NULL DEFAULT '0',
  `man_num` int(4) NOT NULL DEFAULT '0',
  `adddate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `service_date` (`stat_date`,`womanid`,`service_type`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `livechat_stat_voice`
-- ----------------------------
DROP TABLE IF EXISTS `livechat_stat_voice`;
CREATE TABLE `livechat_stat_voice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` int(11) NOT NULL,
  `stat_date` date NOT NULL,
  `stat_week` varchar(10) NOT NULL,
  `stat_month` varchar(10) NOT NULL,
  `times` int(5) NOT NULL,
  `credits` decimal(10,2) NOT NULL,
  `adddate` datetime NOT NULL,
  `service_type` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stat_date` (`stat_date`,`service_type`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `livechat_websession`
-- ----------------------------
DROP TABLE IF EXISTS `livechat_websession`;
CREATE TABLE `livechat_websession` (
  `account` varchar(30) NOT NULL,
  `acctype` tinyint(1) NOT NULL DEFAULT '0',
  `sid` varchar(50) NOT NULL,
  `phpsession` varchar(50) NOT NULL,
  `adddate` datetime NOT NULL,
  `lastlogin` datetime NOT NULL,
  UNIQUE KEY `account` (`account`,`acctype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `magicicons`
-- ----------------------------
DROP TABLE IF EXISTS `magicicons`;
CREATE TABLE `magicicons` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `eid` varchar(10) NOT NULL,
  `title` varchar(50) NOT NULL,
  `typeid` smallint(4) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL,
  `order` smallint(6) unsigned NOT NULL,
  `price` decimal(6,2) unsigned NOT NULL,
  `isnew` tinyint(1) unsigned NOT NULL,
  `note` varchar(100) NOT NULL,
  `adddate` datetime NOT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `eid` (`eid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `magicicons_type`
-- ----------------------------
DROP TABLE IF EXISTS `magicicons_type`;
CREATE TABLE `magicicons_type` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `order` smallint(6) NOT NULL DEFAULT '0',
  `note` varchar(100) NOT NULL,
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `manopenchatwin`
-- ----------------------------
DROP TABLE IF EXISTS `manopenchatwin`;
CREATE TABLE `manopenchatwin` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `manid` varchar(15) NOT NULL,
  `womanid` varchar(15) NOT NULL,
  `adddate` datetime NOT NULL,
  `lastupdate` datetime NOT NULL,
  `num` int(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `manid` (`manid`,`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `online_man`
-- ----------------------------
DROP TABLE IF EXISTS `online_man`;
CREATE TABLE `online_man` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `manid` varchar(12) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `country` varchar(20) NOT NULL,
  `birthday` date NOT NULL,
  `marry` varchar(20) NOT NULL,
  `photourl` varchar(60) NOT NULL,
  `description` varchar(150) NOT NULL,
  `adddate` datetime NOT NULL,
  `siteid` tinyint(1) NOT NULL,
  `sid` varchar(50) NOT NULL,
  `phpsession` varchar(50) NOT NULL,
  `lastlogin` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `man_auto_id` int(8) NOT NULL,
  `city` varchar(20) NOT NULL,
  `paid_amount` decimal(8,2) NOT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT '1',
  `fromid` varchar(10) DEFAULT NULL,
  `device_type` tinyint(2) NOT NULL DEFAULT '10',
  `ip` varchar(20) DEFAULT NULL,
  `proxyip` varchar(20) DEFAULT NULL,
  `iplocation` varchar(50) DEFAULT NULL,
  `proxynum` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `manid` (`manid`),
  KEY `foronline` (`status`,`visible`)
) ENGINE=MyISAM AUTO_INCREMENT=12386 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `online_translator`
-- ----------------------------
DROP TABLE IF EXISTS `online_translator`;
CREATE TABLE `online_translator` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `staff_id` varchar(12) NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `cnname` varchar(30) NOT NULL,
  `enname` varchar(30) NOT NULL,
  `gender` char(1) NOT NULL,
  `lastlogin` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `chatstatus` tinyint(1) NOT NULL,
  `sid` varchar(50) NOT NULL,
  `phpsessionid` varchar(50) NOT NULL,
  `binding` int(3) NOT NULL,
  `currentbind` tinyint(2) NOT NULL,
  `womanlist` varchar(200) NOT NULL,
  `adddate` datetime NOT NULL,
  `fromid` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `staff_id` (`staff_id`)
) ENGINE=MyISAM AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `online_woman`
-- ----------------------------
DROP TABLE IF EXISTS `online_woman`;
CREATE TABLE `online_woman` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `womanid` varchar(12) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `cnname` varchar(60) NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `siteid` tinyint(1) NOT NULL,
  `photourl` varchar(100) NOT NULL,
  `birthday` date NOT NULL,
  `description` varchar(150) NOT NULL,
  `livein` varchar(50) NOT NULL,
  `country` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `chatstatus` tinyint(1) NOT NULL,
  `lastlogin` datetime NOT NULL,
  `adddate` datetime NOT NULL,
  `height` int(3) NOT NULL,
  `weight` int(3) NOT NULL,
  `mic` tinyint(1) NOT NULL,
  `cam` tinyint(1) NOT NULL,
  `sid` varchar(50) NOT NULL,
  `phpsession` varchar(50) NOT NULL,
  `chatwin` tinyint(1) NOT NULL DEFAULT '0',
  `videofile` varchar(60) NOT NULL,
  `keyword` varchar(30) NOT NULL,
  `keyword_d` varchar(30) NOT NULL,
  `hide` tinyint(1) NOT NULL DEFAULT '0',
  `woman_auto_id` int(8) NOT NULL,
  `hascam` tinyint(1) NOT NULL,
  `camisopen` tinyint(1) NOT NULL,
  `binding` tinyint(4) NOT NULL,
  `translator_id` varchar(12) NOT NULL,
  `translator_name` varchar(30) NOT NULL,
  `translator_cnname` varchar(60) NOT NULL,
  `need_translate` tinyint(4) NOT NULL,
  `fromid` varchar(10) DEFAULT NULL,
  `device_type` tinyint(2) DEFAULT '10',
  `ip` varchar(20) DEFAULT NULL,
  `proxyip` varchar(20) DEFAULT NULL,
  `iplocation` varchar(50) DEFAULT NULL,
  `proxynum` varchar(20) DEFAULT NULL,
  `ordervalue` int(4) NOT NULL DEFAULT '0',
  `zodiac` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `cam2isopen` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `womanid` (`womanid`),
  KEY `status` (`status`,`hide`,`binding`)
) ENGINE=MyISAM AUTO_INCREMENT=3910 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `private_chat_msg`
-- ----------------------------
DROP TABLE IF EXISTS `private_chat_msg`;
CREATE TABLE `private_chat_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` varchar(15) NOT NULL,
  `from_name` varchar(50) NOT NULL,
  `agentid` varchar(12) NOT NULL,
  `to_id` varchar(15) NOT NULL,
  `to_name` varchar(50) NOT NULL,
  `flag` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `msg` varchar(600) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `adddate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `from_id` (`from_id`,`to_id`)
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `scene`
-- ----------------------------
DROP TABLE IF EXISTS `scene`;
CREATE TABLE `scene` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sid` varchar(10) NOT NULL DEFAULT '',
  `title` varchar(32) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `type_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `tag_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `price` decimal(6,2) unsigned NOT NULL DEFAULT '0.00',
  `sort` smallint(6) unsigned NOT NULL DEFAULT '0',
  `is_advanced` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_new` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_sale` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `add_date` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sid` (`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `scene_tags`
-- ----------------------------
DROP TABLE IF EXISTS `scene_tags`;
CREATE TABLE `scene_tags` (
  `id` smallint(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(16) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort` smallint(6) unsigned NOT NULL DEFAULT '0',
  `type_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `scene_tips`
-- ----------------------------
DROP TABLE IF EXISTS `scene_tips`;
CREATE TABLE `scene_tips` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `style_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `type_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `add_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `staff_id` varchar(16) NOT NULL DEFAULT '',
  `staff_name` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `status_startdate_enddate` (`status`,`start_date`,`end_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `scene_type`
-- ----------------------------
DROP TABLE IF EXISTS `scene_type`;
CREATE TABLE `scene_type` (
  `id` smallint(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(16) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `subject_history`
-- ----------------------------
DROP TABLE IF EXISTS `subject_history`;
CREATE TABLE `subject_history` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `inviteid` varchar(32) NOT NULL,
  `manid` varchar(12) NOT NULL,
  `womanid` varchar(12) NOT NULL,
  `flag` tinyint(1) NOT NULL,
  `subjectid` varchar(50) NOT NULL,
  `starttime` datetime NOT NULL,
  `endtime` datetime NOT NULL,
  `updatetime` datetime NOT NULL,
  `agentid` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `inviteid` (`inviteid`),
  KEY `flag` (`flag`),
  KEY `manid` (`flag`,`manid`),
  KEY `womanid` (`flag`,`womanid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `text_chat_msg`
-- ----------------------------
DROP TABLE IF EXISTS `text_chat_msg`;
CREATE TABLE `text_chat_msg` (
  `id` bigint(15) NOT NULL AUTO_INCREMENT,
  `inviteid` varchar(32) NOT NULL,
  `manid` varchar(12) NOT NULL,
  `womanid` varchar(12) NOT NULL,
  `toflag` tinyint(1) NOT NULL,
  `msg` varchar(350) NOT NULL,
  `adddate` datetime NOT NULL,
  `ip` varchar(20) NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `chatid` int(8) NOT NULL,
  `man_name` varchar(30) NOT NULL,
  `woman_name` varchar(30) NOT NULL,
  `msgtype` tinyint(1) NOT NULL,
  `cnname` varchar(255) NOT NULL,
  `sent` tinyint(1) NOT NULL,
  `sent2` tinyint(1) NOT NULL DEFAULT '0',
  `msg_src` varchar(450) NOT NULL,
  `msg_tr` varchar(600) NOT NULL,
  `need_translate` tinyint(1) NOT NULL,
  `translator_id` varchar(12) NOT NULL,
  `translator_name` varchar(30) NOT NULL,
  `translate_time` datetime NOT NULL,
  `translate_status` tinyint(1) NOT NULL,
  `send_msg_original` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `inviteid` (`inviteid`)
) ENGINE=MyISAM AUTO_INCREMENT=3147512961 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `text_chat_msg_03`
-- ----------------------------
DROP TABLE IF EXISTS `text_chat_msg_03`;
CREATE TABLE `text_chat_msg_03` (
  `id` bigint(15) NOT NULL AUTO_INCREMENT,
  `inviteid` varchar(32) NOT NULL,
  `manid` varchar(12) NOT NULL,
  `womanid` varchar(12) NOT NULL,
  `toflag` tinyint(1) NOT NULL,
  `msg` varchar(350) NOT NULL,
  `adddate` datetime NOT NULL,
  `ip` varchar(20) NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `chatid` int(8) NOT NULL,
  `man_name` varchar(30) NOT NULL,
  `woman_name` varchar(30) NOT NULL,
  `msgtype` tinyint(1) NOT NULL,
  `cnname` varchar(255) NOT NULL,
  `sent` tinyint(1) NOT NULL,
  `sent2` tinyint(1) NOT NULL DEFAULT '0',
  `msg_src` varchar(450) NOT NULL,
  `msg_tr` varchar(600) NOT NULL,
  `need_translate` tinyint(1) NOT NULL,
  `translator_id` varchar(12) NOT NULL,
  `translator_name` varchar(30) NOT NULL,
  `translate_time` datetime NOT NULL,
  `translate_status` tinyint(1) NOT NULL,
  `send_msg_original` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `inviteid` (`inviteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `text_chat_msg_succeed`
-- ----------------------------
DROP TABLE IF EXISTS `text_chat_msg_succeed`;
CREATE TABLE `text_chat_msg_succeed` (
  `id` bigint(15) NOT NULL AUTO_INCREMENT,
  `inviteid` varchar(32) NOT NULL,
  `manid` varchar(12) NOT NULL,
  `womanid` varchar(12) NOT NULL,
  `toflag` tinyint(1) NOT NULL,
  `msg` varchar(350) NOT NULL,
  `adddate` datetime NOT NULL,
  `ip` varchar(20) NOT NULL,
  `agentid` varchar(10) NOT NULL,
  `chatid` int(8) NOT NULL,
  `man_name` varchar(30) NOT NULL,
  `woman_name` varchar(30) NOT NULL,
  `msgtype` tinyint(1) NOT NULL,
  `cnname` varchar(255) NOT NULL,
  `sent` tinyint(1) NOT NULL,
  `sent2` tinyint(1) NOT NULL DEFAULT '0',
  `msg_src` varchar(450) NOT NULL,
  `msg_tr` varchar(600) NOT NULL,
  `need_translate` tinyint(1) NOT NULL,
  `translator_id` varchar(12) NOT NULL,
  `translator_name` varchar(30) NOT NULL,
  `translate_time` datetime NOT NULL,
  `translate_status` tinyint(1) NOT NULL,
  `send_msg_original` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `inviteid` (`inviteid`)
) ENGINE=MyISAM AUTO_INCREMENT=3147512961 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `video_history`
-- ----------------------------
DROP TABLE IF EXISTS `video_history`;
CREATE TABLE `video_history` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `womanid` varchar(20) NOT NULL,
  `agentid` varchar(12) NOT NULL,
  `videofile` varchar(60) NOT NULL,
  `starttime` bigint(15) NOT NULL,
  `endtime` bigint(15) NOT NULL,
  `chathistoryid` int(8) NOT NULL DEFAULT '0',
  `chatstarttime` bigint(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `videofile` (`videofile`)
) ENGINE=MyISAM AUTO_INCREMENT=994 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `voice_history`
-- ----------------------------
DROP TABLE IF EXISTS `voice_history`;
CREATE TABLE `voice_history` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `inviteid` varchar(32) NOT NULL,
  `manid` varchar(12) NOT NULL,
  `womanid` varchar(12) NOT NULL,
  `toflag` tinyint(1) NOT NULL,
  `msg` varchar(50) NOT NULL,
  `adddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `agentid` varchar(10) NOT NULL,
  `man_name` varchar(30) NOT NULL,
  `woman_name` varchar(30) NOT NULL,
  `cnname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `inviteid` (`inviteid`),
  KEY `toflag` (`toflag`)
) ENGINE=MyISAM AUTO_INCREMENT=487 DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
