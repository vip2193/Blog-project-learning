/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : blog_db

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2018-08-08 16:19:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blog_type
-- ----------------------------
DROP TABLE IF EXISTS `blog_type`;
CREATE TABLE `blog_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类型ID',
  `type_name` varchar(32) NOT NULL COMMENT '类型名称',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_blog
-- ----------------------------
DROP TABLE IF EXISTS `t_blog`;
CREATE TABLE `t_blog` (
  `blog_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '博客ID',
  `blog_title` varchar(100) NOT NULL COMMENT '博客标题',
  `blog_content` longtext NOT NULL COMMENT '博客内容',
  `userid` int(11) DEFAULT NULL COMMENT '创建人ID',
  `type_id` int(11) DEFAULT NULL COMMENT '类型ID',
  `blog_status` int(11) NOT NULL DEFAULT '0' COMMENT '博客状态 1为发布 0为草稿',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `cover_image` varchar(255) DEFAULT NULL COMMENT '封面图片',
  PRIMARY KEY (`blog_id`),
  KEY `FK_type_id` (`type_id`),
  KEY `FK_user_id` (`userid`),
  CONSTRAINT `FK_type_id` FOREIGN KEY (`type_id`) REFERENCES `blog_type` (`type_id`),
  CONSTRAINT `FK_user_id` FOREIGN KEY (`userid`) REFERENCES `t_user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `comment_content` varchar(500) NOT NULL COMMENT '评论内容',
  `blog_id` int(11) NOT NULL COMMENT '博客ID',
  `createtime` datetime NOT NULL COMMENT '评论时间',
  `userid` int(11) NOT NULL COMMENT '评论人ID',
  `replyid` int(11) NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `FK_comment_blog_id` (`blog_id`),
  KEY `FK_comment_user_id` (`userid`),
  CONSTRAINT `FK_comment_blog_id` FOREIGN KEY (`blog_id`) REFERENCES `t_blog` (`blog_id`),
  CONSTRAINT `FK_comment_user_id` FOREIGN KEY (`userid`) REFERENCES `t_user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标签ID',
  `tag_name` varchar(32) NOT NULL COMMENT '标签名称',
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_tag_blog
-- ----------------------------
DROP TABLE IF EXISTS `t_tag_blog`;
CREATE TABLE `t_tag_blog` (
  `tag_id` int(11) DEFAULT NULL COMMENT '标签ID',
  `blog_id` int(11) DEFAULT NULL COMMENT '博客ID',
  KEY `FK_tag_id` (`tag_id`),
  KEY `FK_blog_id` (`blog_id`),
  CONSTRAINT `FK_blog_id` FOREIGN KEY (`blog_id`) REFERENCES `t_blog` (`blog_id`),
  CONSTRAINT `FK_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `t_tag` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `userId` int(8) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(32) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '用户密码',
  `user_sex` varchar(6) NOT NULL DEFAULT '0' COMMENT '用户性别',
  `email` varchar(64) DEFAULT NULL COMMENT '用户邮箱',
  `phone` varchar(11) NOT NULL COMMENT '手机号码',
  `firstname` varchar(6) DEFAULT NULL COMMENT '姓',
  `lastname` varchar(12) DEFAULT NULL COMMENT '名',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址',
  `is_superuser` int(11) NOT NULL DEFAULT '0' COMMENT '是否是管理员 1代表 是 0代表不是',
  `last_login` datetime DEFAULT NULL COMMENT '上一次登录时间',
  `user_register_time` datetime DEFAULT NULL COMMENT '用户注册时间',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
