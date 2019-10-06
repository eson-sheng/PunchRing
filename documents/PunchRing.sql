-- 建立数据库
CREATE DATABASE `PunchRing` DEFAULT charset=utf8;
USE `PunchRing`;

-- 微信用户表建立
DROP TABLE IF EXISTS `wx_user`;
CREATE TABLE IF NOT EXISTS `wx_user`(
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `wx_openid` VARCHAR(64) NOT NULL COMMENT '微信用户唯一标识 OpenID',
  `wx_session_key` VARCHAR(32) NOT NULL COMMENT '微信会话密钥 session_key',
  `wx_info` TEXT NOT NULL COMMENT '微信用户信息 json',
  `reg_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updata_time` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `status` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '状态(单选):0=未激活,1=激活',
  PRIMARY KEY(`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `wx_openid` (`wx_openid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户管理';