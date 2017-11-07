/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : omt

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-10-05 23:02:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL COMMENT '存储地区名',
  `first_letter` char(1) DEFAULT NULL COMMENT '用于存储地区首字母',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of area
-- ----------------------------

-- ----------------------------
-- Table structure for cinema
-- ----------------------------
DROP TABLE IF EXISTS `cinema`;
CREATE TABLE `cinema` (
  `id` int(11) NOT NULL,
  `site` tinyint(4) DEFAULT NULL COMMENT '地区名字',
  `cinema_name` varchar(10) DEFAULT NULL COMMENT '电影院名字',
  `county_id` int(11) DEFAULT NULL COMMENT '县级外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cinema
-- ----------------------------

-- ----------------------------
-- Table structure for cinema_ticket
-- ----------------------------
DROP TABLE IF EXISTS `cinema_ticket`;
CREATE TABLE `cinema_ticket` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '存储订票人',
  `seat_id` int(11) DEFAULT NULL COMMENT '座位表的外键',
  `cinema_id` int(11) DEFAULT NULL COMMENT '电影院外键',
  `price` decimal(8,2) DEFAULT NULL COMMENT '电影票价格',
  `time_slot_id` int(11) DEFAULT NULL COMMENT '场次时间',
  `buy_ticket_ime` int(11) DEFAULT NULL COMMENT '购票时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cinema_ticket
-- ----------------------------

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `star` tinyint(2) DEFAULT NULL COMMENT '用户人外键',
  `userid` int(11) DEFAULT NULL,
  `content` text COMMENT '用户评论内容',
  `addtime` datetime DEFAULT NULL COMMENT '用户评论时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for dim_date
-- ----------------------------
DROP TABLE IF EXISTS `dim_date`;
CREATE TABLE `dim_date` (
  `date_id` int(11) NOT NULL COMMENT '20110512',
  `date_name` varchar(16) DEFAULT NULL COMMENT '2011-05-12',
  `date_of_month` int(11) DEFAULT NULL COMMENT '12',
  `year_id` int(11) DEFAULT NULL COMMENT '2011',
  `year_name` varchar(16) DEFAULT NULL COMMENT '2011年',
  `quarter_id` int(11) DEFAULT NULL COMMENT '2',
  `quarter_name` varchar(16) DEFAULT NULL COMMENT '2季度',
  `month_id` int(11) DEFAULT NULL COMMENT '5',
  `month_name` varchar(16) DEFAULT NULL COMMENT '5月',
  `month_of_year_name` varchar(16) DEFAULT NULL COMMENT '2011年5月',
  `month_of_year_id` int(11) DEFAULT NULL COMMENT '201105',
  `week_id` int(11) DEFAULT NULL,
  `week_name` varchar(16) DEFAULT NULL,
  `week_of_year_id` int(11) DEFAULT NULL,
  `week_of_year_name` varchar(32) DEFAULT NULL,
  `is_holiday` tinyint(1) DEFAULT '0' COMMENT '是否假日',
  `holiday_name` varchar(20) DEFAULT NULL COMMENT '节假日名称',
  PRIMARY KEY (`date_id`),
  KEY `ix_dim_date_date_name` (`date_name`),
  KEY `ix_dim_date_month_id` (`month_id`),
  KEY `ix_dim_date_year_id` (`year_id`),
  KEY `ix_dim_date_quanter_id` (`quarter_id`),
  KEY `ix_dim_date_week_of_year_id` (`week_of_year_id`,`week_of_year_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dim_date
-- ----------------------------

-- ----------------------------
-- Table structure for film_types
-- ----------------------------
DROP TABLE IF EXISTS `film_types`;
CREATE TABLE `film_types` (
  `id` int(11) NOT NULL,
  `film_types_name` varchar(10) DEFAULT NULL COMMENT '电影类型名',
  `movie_id` int(11) DEFAULT NULL COMMENT '电影外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of film_types
-- ----------------------------

-- ----------------------------
-- Table structure for movie
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie` (
  `id` int(11) NOT NULL,
  `movie_name` varchar(20) DEFAULT NULL COMMENT '电影名',
  `introduce` text COMMENT '电影内容介绍',
  `movie_image_url` varchar(255) DEFAULT NULL COMMENT '存储图片路径',
  `grade` binary(9) DEFAULT NULL COMMENT '电影评分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movie
-- ----------------------------

-- ----------------------------
-- Table structure for movie_film_types
-- ----------------------------
DROP TABLE IF EXISTS `movie_film_types`;
CREATE TABLE `movie_film_types` (
  `id` int(11) NOT NULL,
  `film_types_id` int(11) DEFAULT NULL COMMENT '电影类型外键',
  `movie_id` int(11) DEFAULT NULL COMMENT '电影外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movie_film_types
-- ----------------------------

-- ----------------------------
-- Table structure for movie_news
-- ----------------------------
DROP TABLE IF EXISTS `movie_news`;
CREATE TABLE `movie_news` (
  `id` int(11) NOT NULL,
  `movie_id` int(11) DEFAULT NULL COMMENT '电影外键',
  `movie_image_url` varchar(255) DEFAULT NULL COMMENT '电影图片存放url路径',
  `xg_content` text COMMENT '相关资讯内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movie_news
-- ----------------------------

-- ----------------------------
-- Table structure for register
-- ----------------------------
DROP TABLE IF EXISTS `register`;
CREATE TABLE `register` (
  `id` int(11) NOT NULL,
  `ip` int(11) DEFAULT NULL COMMENT '存储用户ip地址',
  `addtime` int(11) DEFAULT NULL COMMENT '存储用户登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of register
-- ----------------------------

-- ----------------------------
-- Table structure for time_solt
-- ----------------------------
DROP TABLE IF EXISTS `time_solt`;
CREATE TABLE `time_solt` (
  `id` int(11) NOT NULL,
  `cinema_id` int(11) DEFAULT NULL COMMENT '电影外键院',
  `play_time` datetime DEFAULT NULL COMMENT '播放时间',
  `seat_id` int(11) DEFAULT NULL COMMENT '座位外键',
  `date_id` int(11) DEFAULT NULL COMMENT '日期表外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of time_solt
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) NOT NULL,
  `password` char(32) NOT NULL,
  `ip` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  `revamp_time` int(11) DEFAULT '0',
  `error_count` int(11) DEFAULT NULL,
  `salt` char(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------

-- ----------------------------
-- Table structure for user_ext
-- ----------------------------
DROP TABLE IF EXISTS `user_ext`;
CREATE TABLE `user_ext` (
  `id` int(11) NOT NULL,
  `head_portrait` binary(255) DEFAULT NULL COMMENT '存储上传头像',
  `nickname` varchar(20) DEFAULT NULL COMMENT '存储用户注册昵称',
  `gender` tinyint(1) DEFAULT NULL COMMENT '存储用户性别',
  `birthday` int(8) DEFAULT NULL COMMENT '存储用户生日',
  `interest` varchar(255) DEFAULT NULL COMMENT '存储用户兴趣',
  `signature` text COMMENT '存储用户个性签名',
  `userid` int(11) DEFAULT NULL COMMENT '存储user表id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_ext
-- ----------------------------

-- ----------------------------
-- Table structure for video_hall
-- ----------------------------
DROP TABLE IF EXISTS `video_hall`;
CREATE TABLE `video_hall` (
  `id` int(11) NOT NULL,
  `fyt_name` varchar(10) DEFAULT NULL COMMENT '放映厅名字',
  `cinema_id` int(11) DEFAULT NULL COMMENT '影院外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video_hall
-- ----------------------------

-- ----------------------------
-- Procedure structure for dim_date
-- ----------------------------
DROP PROCEDURE IF EXISTS `dim_date`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dim_date`(IN bdate DATE, IN edate DATE)
BEGIN
DECLARE var DATE DEFAULT bdate;
DECLARE evar DATE DEFAULT DATE_ADD(edate,INTERVAL 1 DAY);
DECLARE bweek DATE;
DECLARE eweek DATE;
WHILE var<evar DO
SET bweek = DATE_ADD(DATE_SUB(var,INTERVAL 1 WEEK),INTERVAL 1 DAY);
SET eweek = DATE_SUB(DATE_ADD(var,INTERVAL 1 WEEK),INTERVAL 1 DAY);
INSERT INTO dim_date
(
`date_id`,
`date_name`,
`date_of_month`,
`year_id`,
`year_name`,
`quarter_id`,
`quarter_name`,
`month_id`,
`month_name`,
`month_of_year_name`,
`month_of_year_id`,
`week_id`,
`week_name`,
`week_of_year_id`,
`week_of_year_name`,
`is_weekend`,
`is_holiday`
)
VALUES
(
DATE_FORMAT(var,'%Y%m%d'),
DATE_FORMAT(var,'%Y-%m-%d'),
DAYOFMONTH(var),
YEAR(var),
CONCAT(YEAR(var),'年'),
QUARTER(var),
CONCAT(QUARTER(var),'季度'),
DATE_FORMAT(var,'%Y%m'),
CONCAT(YEAR(var),'年',MONTH(var),'月'),
CONCAT(MONTH(var),'月'),
MONTH(var),
WEEKDAY(var),
CASE WEEKDAY(var) WHEN 0 THEN '星期一' WHEN 1 THEN '星期二' WHEN 2 THEN '星期三' WHEN 3 THEN '星期四' WHEN 4 THEN '星期五' WHEN 5 THEN '星期六' WHEN 6 THEN '星期日' END,
WEEKOFYEAR(var),
CONCAT('第',WEEKOFYEAR(var),'周(',MONTH(bweek),'月',DAY(bweek),'日~',MONTH(eweek),'月',DAY(eweek),'日'),
CASE WHEN WEEKDAY(var)>4 THEN 1 ELSE 0 END,
CASE WHEN WEEKDAY(var)>4 THEN 1 ELSE 0 END
);
SET var=DATE_ADD(var,INTERVAL 1 DAY);
END WHILE;
END
;;
DELIMITER ;
