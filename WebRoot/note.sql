/*
Navicat MySQL Data Transfer

Source Server         : Suniceman
Source Server Version : 50627
Source Host           : suniceman.cn:3306
Source Database       : note

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2018-04-30 22:03:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(255) DEFAULT NULL,
  `desc` varchar(1000) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('21', 'MongoDB', 'mongodb笔记', '1', '2018-04-30 21:25:44');
INSERT INTO `category` VALUES ('22', 'Docker', 'Docker学习笔记', '1', '2018-04-30 21:46:45');
INSERT INTO `category` VALUES ('20', 'C++', '为什么入门首选C语言', '1', '2018-04-30 21:21:21');

-- ----------------------------
-- Table structure for mind
-- ----------------------------
DROP TABLE IF EXISTS `mind`;
CREATE TABLE `mind` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mind
-- ----------------------------

-- ----------------------------
-- Table structure for note
-- ----------------------------
DROP TABLE IF EXISTS `note`;
CREATE TABLE `note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `userId` int(11) DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of note
-- ----------------------------
INSERT INTO `note` VALUES ('21', '为什么入门首选C语言', '<span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Microsoft Yahei&quot;, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(238, 238, 238);\">对于大部分程序员，C语言是学习编程的第一门语言，很少有不了解C的程序员。</span><br style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Microsoft Yahei&quot;, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(238, 238, 238);\"><br style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Microsoft Yahei&quot;, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(238, 238, 238);\"><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Microsoft Yahei&quot;, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(238, 238, 238);\">C语言除了能让你了解编程的相关概念，带你走进编程的大门，还能让你明白程序的运行原理，比如，计算机的各个部件是如何交互的，程序在内存中是一种怎样的状态，操作系统和用户程序之间有着怎样的“爱恨情仇”，这些底层知识决定了你的发展高度，也决定了你的职业生涯。</span><br style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Microsoft Yahei&quot;, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(238, 238, 238);\"><br style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Microsoft Yahei&quot;, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(238, 238, 238);\"><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Microsoft Yahei&quot;, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(238, 238, 238);\">如果你希望成为出类拔萃的人才，而不仅仅是码农，这么这些知识就是不可逾越的。也只有学习C语言，才能更好地了解它们。有了足够的基础，以后学习其他语言，会触类旁通，很快上手，7 天了解一门新语言不是神话。</span><br style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Microsoft Yahei&quot;, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(238, 238, 238);\"><br style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Microsoft Yahei&quot;, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(238, 238, 238);\"><span style=\"font-family: 微软雅黑, &quot;Microsoft Yahei&quot;, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(238, 238, 238); color: rgb(178, 34, 34);\">C语言概念少，词汇少，包含了基本的编程元素，后来的很多语言（C++、Java等）都参考了C语言，说C语言是现代编程语言的开山鼻祖毫不夸张，它改变了编程世界。</span><br style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Microsoft Yahei&quot;, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(238, 238, 238);\"><br style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Microsoft Yahei&quot;, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(238, 238, 238);\"><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑, &quot;Microsoft Yahei&quot;, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(238, 238, 238);\">正是由于C语言的简单，对初学者来说，学习成本小，时间短，结合本教程，能够快速掌握编程技术。</span>', '1', '2018-04-30 21:22:03', '20');
INSERT INTO `note` VALUES ('22', 'mongodb删除重复数据', '<div style=\"margin: 0px; padding: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(238, 238, 238);\"><div style=\"margin: 0px; padding: 0px;\"><div style=\"margin: 0px; padding: 0px; line-height: 1.6;\">删除语句解析：</div><div style=\"margin: 0px; padding: 0px;\"><div style=\"margin: 0px; padding: 0px;\">db.userInfo.aggregate([</div><div style=\"margin: 0px; padding: 0px;\">&nbsp; &nbsp; {</div><div style=\"margin: 0px; padding: 0px;\">&nbsp; &nbsp; &nbsp; &nbsp; $group: {<span style=\"margin: 0px; padding: 0px; line-height: 1.6;\">&nbsp;_id: {</span><span style=\"margin: 0px; padding: 0px; line-height: 1.6;\">userName: \'$userName\',</span><span style=\"margin: 0px; padding: 0px; line-height: 1.6;\">age: \'$age\'</span><span style=\"margin: 0px; padding: 0px; line-height: 1.6;\">},</span><span style=\"margin: 0px; padding: 0px; line-height: 1.6;\">count: {</span><span style=\"margin: 0px; padding: 0px; line-height: 1.6;\">$sum: 1</span><span style=\"margin: 0px; padding: 0px; line-height: 1.6;\">},</span><span style=\"margin: 0px; padding: 0px; line-height: 1.6;\">dups: {</span><span style=\"margin: 0px; padding: 0px; line-height: 1.6;\">$addToSet: \'$_id\'</span><span style=\"margin: 0px; padding: 0px; line-height: 1.6;\">}</span><span style=\"margin: 0px; padding: 0px; line-height: 1.6;\">}</span></div><div style=\"margin: 0px; padding: 0px;\">&nbsp; &nbsp; },</div><div style=\"margin: 0px; padding: 0px;\">&nbsp; &nbsp; {</div><div style=\"margin: 0px; padding: 0px;\">&nbsp; &nbsp; &nbsp; &nbsp; $match: {<span style=\"margin: 0px; padding: 0px; line-height: 1.6;\">count: {</span><span style=\"margin: 0px; padding: 0px; line-height: 1.6;\">$gt: 1</span><span style=\"margin: 0px; padding: 0px; line-height: 1.6;\">}</span><span style=\"margin: 0px; padding: 0px; line-height: 1.6;\">}</span></div><div style=\"margin: 0px; padding: 0px;\">&nbsp; &nbsp; }</div><div style=\"margin: 0px; padding: 0px;\">]).forEach(function(doc){</div><div style=\"margin: 0px; padding: 0px;\">&nbsp; &nbsp; doc.dups.shift();</div><div style=\"margin: 0px; padding: 0px;\">&nbsp; &nbsp; db.userInfo.remove({<span style=\"margin: 0px; padding: 0px; line-height: 1.6;\">_id: {</span><span style=\"margin: 0px; padding: 0px; line-height: 1.6;\">$in: doc.dups</span><span style=\"margin: 0px; padding: 0px; line-height: 1.6;\">}</span><span style=\"margin: 0px; padding: 0px; line-height: 1.6;\">});</span></div><div style=\"margin: 0px; padding: 0px;\">})</div></div></div><div style=\"margin: 0px; padding: 0px;\">1.根据userName和age分组并统计数量，$group只会返回参与分组的字段，使用$addToSet在返回结果数组中增加_id字段</div><div style=\"margin: 0px; padding: 0px;\">2.使用$match匹配数量大于1的数据</div><div style=\"margin: 0px; padding: 0px;\">3.<span style=\"margin: 0px; padding: 0px; line-height: 1.6;\">doc.dups.shift();表示从数组第一个值开始删除；作用是踢除重复数据其中一个_id，让后面的删除语句不会删除所有数据</span></div><div style=\"margin: 0px; padding: 0px;\">4.使用forEach循环根据_id删除数据</div></div><div style=\"margin: 0px; padding: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(238, 238, 238);\">&nbsp;</div><div style=\"margin: 0px; padding: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(238, 238, 238);\">$addToSet 操作符只有在值没有存在于数组中时才会向数组中添加一个值。如果值已经存在于数组中，$addToSet返回，不会修改数组。</div><div style=\"margin: 0px; padding: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(238, 238, 238);\">&nbsp;</div><div style=\"margin: 0px; padding: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(238, 238, 238);\">注意：forEach和$addToSet的驼峰写法不能全部写成小写，因为<span style=\"margin: 0px; padding: 0px; color: rgb(255, 0, 0);\">mongodb严格区分大小写</span>、<span style=\"margin: 0px; padding: 0px; color: rgb(255, 0, 0);\">mongodb严格区分大小写</span>、<span style=\"margin: 0px; padding: 0px; color: rgb(255, 0, 0);\">mongodb严格区分大小写</span>，重要的事情说三遍！</div>', '1', '2018-04-30 21:26:10', '21');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'silence', '21232f297a57a5a743894a0e4a801fc3', '13145211216@163.com', '2018-04-22 01:33:12');
