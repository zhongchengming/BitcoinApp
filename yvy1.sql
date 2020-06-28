-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2020-06-22 15:15:18
-- 服务器版本： 5.6.47-log
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yvy1`
--

-- --------------------------------------------------------

--
-- 表的结构 `t_activity`
--

CREATE TABLE IF NOT EXISTS `t_activity` (
  `t_id` int(11) NOT NULL,
  `t_activity_name` varchar(100) DEFAULT NULL,
  `t_activity_number` int(11) DEFAULT NULL,
  `t_join_term` int(11) DEFAULT NULL,
  `t_is_enable` int(11) DEFAULT NULL COMMENT '0.启用\r\n1.禁用',
  `t_begin_time` datetime DEFAULT NULL,
  `t_end_time` datetime DEFAULT NULL,
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `t_activity_detail`
--

CREATE TABLE IF NOT EXISTS `t_activity_detail` (
  `t_id` int(11) NOT NULL,
  `t_activity_id` int(11) DEFAULT NULL,
  `t_prize_name` varchar(100) DEFAULT NULL,
  `t_prize_size` varchar(20) DEFAULT NULL,
  `t_prize_number` int(11) DEFAULT NULL,
  `t_surplus_number` int(11) DEFAULT NULL,
  `t_is_join` int(11) DEFAULT NULL COMMENT '0.参与\r\n1.不参与'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `t_admin`
--

CREATE TABLE IF NOT EXISTS `t_admin` (
  `t_id` int(11) NOT NULL,
  `t_user_name` varchar(255) DEFAULT NULL,
  `t_pass_word` varchar(255) DEFAULT NULL,
  `t_role_id` int(11) DEFAULT NULL,
  `t_is_disable` int(11) DEFAULT NULL COMMENT '0.启用\r\n1.禁用',
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_admin`
--

INSERT INTO `t_admin` (`t_id`, `t_user_name`, `t_pass_word`, `t_role_id`, `t_is_disable`, `t_create_time`) VALUES
(8, 'xxb', '8DDCFF3A80F4189CA1C9D4D902C3C909', 1, 0, '2018-09-10 11:01:47'),
(11, 'test', '8DDCFF3A80F4189CA1C9D4D902C3C909', 1, 0, '2019-03-09 20:51:51'),
(13, '123456', '8DDCFF3A80F4189CA1C9D4D902C3C909', 1, 0, '2019-08-23 14:55:46'),
(15, 'admin', '4A11E0CA0E10319A11239AF7F674A2F2', 1, 0, '2020-01-02 10:40:15');

-- --------------------------------------------------------

--
-- 表的结构 `t_ad_table`
--

CREATE TABLE IF NOT EXISTS `t_ad_table` (
  `t_id` int(11) NOT NULL COMMENT '主键Id',
  `t_ad_table_name` varchar(255) DEFAULT NULL,
  `t_ad_table_content` varchar(255) DEFAULT NULL COMMENT '广告内容',
  `t_ad_table_type` int(6) DEFAULT NULL COMMENT '1.开机图 2:主页table 3:主页公告 4:直播房间跑马灯 5:直播间文字广告6:直播间图片广告',
  `t_ad_table_url` varchar(255) DEFAULT NULL COMMENT '广告图',
  `t_ad_table_target` varchar(255) DEFAULT NULL COMMENT '落地页{(主页table: 主页:0.新人1.推荐2.活跃.3.女神 4.H5广告)}',
  `t_ad_table_sort` int(11) DEFAULT NULL COMMENT '排序 越小排在最前面',
  `t_is_use` int(11) DEFAULT NULL COMMENT '0:禁用 1:启用',
  `t_create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COMMENT='广告\r\n';

--
-- 转存表中的数据 `t_ad_table`
--

INSERT INTO `t_ad_table` (`t_id`, `t_ad_table_name`, `t_ad_table_content`, `t_ad_table_type`, `t_ad_table_url`, `t_ad_table_target`, `t_ad_table_sort`, `t_is_use`, `t_create_time`) VALUES
(20, '测试广告', '12', 1, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200430/202004300733056255.jpg', 'http://www.baidu.com', 99, 0, '2020-05-03 16:01:35'),
(21, '新人', '1', 2, '', '0', 5, 1, '2020-05-04 14:32:15'),
(22, '推荐', '1111', 2, '', '1', 2, 1, '2020-05-04 13:50:07'),
(23, '成熟', '3', 2, '', '3', 4, 0, '2020-06-18 17:35:11'),
(24, '粉丝', '4', 2, '', '4', 6, 1, '2019-11-19 16:18:05'),
(25, '关注', '5', 2, '', '5', 7, 1, '2020-05-03 16:00:08'),
(26, '视频', '6', 2, '', '6', 8, 0, '2019-11-20 14:18:42'),
(27, '传奇有我', '传奇有我', 2, '', 'http://wan.yeyou37.net/on/yx-cq/chuanqi35/b2/ccid8560/?renqun_youhua=729739&bd_vid=7428080731750595368', 9, 0, '2019-11-20 10:09:17'),
(28, '附近', '7', 2, '', '7', 1, 1, '2020-05-04 13:51:15'),
(29, '选聊', '8', 2, '', '8', 10, 1, '2019-11-30 10:59:18'),
(30, '性感', '1', 2, '', '2', 3, 0, '2020-06-18 17:35:02'),
(31, '大海', '大海', 4, 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20200105/20200105043154369.png', '23', 99, 1, '2020-01-05 16:32:22');

-- --------------------------------------------------------

--
-- 表的结构 `t_album`
--

CREATE TABLE IF NOT EXISTS `t_album` (
  `t_id` int(11) NOT NULL,
  `t_user_id` int(11) DEFAULT NULL,
  `t_title` varchar(100) DEFAULT NULL,
  `t_fileId` varchar(100) DEFAULT NULL,
  `t_video_img` varchar(255) DEFAULT NULL,
  `t_addres_url` varchar(150) DEFAULT NULL,
  `t_file_type` int(11) DEFAULT NULL COMMENT '0.图片\r\n1.视频',
  `t_is_private` int(11) DEFAULT NULL COMMENT '0.否\r\n1.是',
  `t_see_count` int(11) DEFAULT NULL,
  `t_money` decimal(7,2) DEFAULT NULL,
  `t_is_del` int(11) DEFAULT NULL COMMENT '0.否\r\n1.是',
  `t_auditing_type` int(11) DEFAULT NULL COMMENT '0.未审核\r\n1.已审核\r\n2.审核失败',
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_album`
--

INSERT INTO `t_album` (`t_id`, `t_user_id`, `t_title`, `t_fileId`, `t_video_img`, `t_addres_url`, `t_file_type`, `t_is_private`, `t_see_count`, `t_money`, `t_is_del`, `t_auditing_type`, `t_create_time`) VALUES
(1, 2, '111', NULL, NULL, '[object Object]', 0, 0, 0, '0.00', 0, 1, NULL),
(2, 2, '11', NULL, NULL, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/album/1587659280289.png', 0, 1, NULL, '20.00', 0, 1, '2020-04-24 00:28:06'),
(3, 2, '11', NULL, NULL, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/album/1587659694823.png', 0, 1, NULL, '10.00', 0, 1, '2020-04-24 00:34:56'),
(4, 3, '123', NULL, NULL, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/album/1587659814081.jpg', 0, 0, NULL, '0.00', 0, 1, '2020-04-24 00:36:54'),
(5, 3, '123', NULL, NULL, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/album/1587660538904.jpg', 0, 0, NULL, '0.00', 0, 0, '2020-04-24 00:48:58'),
(6, 2, '11', '5285890801781081950', 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/album/1587660914990.png', 'http://1257950478.vod2.myqcloud.com/dc9be992vodcq1257950478/243a166a5285890801781081950/waDbtGFdhp4A.mp4', 1, 1, 12, '10.00', 0, 1, '2020-04-24 00:55:17'),
(7, 4, '可爱的小猫咪', '5285890801791279112', 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/album/1587696650833.png', 'http://1257950478.vod2.myqcloud.com/dc9be992vodcq1257950478/1518648a5285890801791279112/7YcLYsu7UF0A.mp4', 1, 1, 7, '20.00', 0, 1, '2020-04-24 10:50:52'),
(8, 9, '', NULL, NULL, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/album/1588242915692.jpg', 0, 0, NULL, '0.00', 0, 1, '2020-04-30 18:35:21'),
(9, 6, '', NULL, NULL, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/album/1588243642538.jpg', 0, 0, NULL, '0.00', 0, 1, '2020-04-30 18:47:27'),
(10, 9, '嗯嗯', NULL, NULL, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/album/1588243615563.jpg', 0, 0, NULL, '0.00', 0, 1, '2020-04-30 18:53:03'),
(11, 9, '美吗', '5285890802128386985', 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/album/1588245362046.png', 'http://1257950478.vod2.myqcloud.com/dc9be992vodcq1257950478/05a8e5b65285890802128386985/anYEq4UacWUA.mp4', 1, 1, 6, '10.00', 0, 1, '2020-04-30 19:16:11'),
(12, 1, '', NULL, NULL, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/album/1588314837394.jpg', 0, 0, NULL, '0.00', 0, 1, '2020-05-01 14:34:03'),
(13, 9, '', NULL, NULL, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/album/1588318470362.jpg', 0, 0, NULL, '0.00', 0, 1, '2020-05-01 15:34:37'),
(14, 9, '', '5285890802204365526', 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/album/1588320277362.png', 'http://1257950478.vod2.myqcloud.com/dc9be992vodcq1257950478/6d93eac55285890802204365526/ZlqFdh03CAsA.mp4', 1, 0, 36, '0.00', 0, 1, '2020-05-01 16:04:44'),
(15, 1, '', NULL, NULL, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/album/1588342317342.jpg', 0, 0, NULL, '0.00', 0, 1, '2020-05-01 22:12:03'),
(16, 14, '1111', '5285890802246417639', 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/album/1588414970310.png', 'http://1257950478.vod2.myqcloud.com/dc9be992vodcq1257950478/ba8b830e5285890802246417639/XsqRRQksLKsA.mp4', 1, 1, 5, '40.00', 0, 1, '2020-05-02 18:23:00'),
(17, 1, '去去去', '5285890802360381387', 'http://1257950478.vod2.myqcloud.com/dc9be992vodcq1257950478/37d45dcb5285890802360381387/5285890802360381388.png', 'http://1257950478.vod2.myqcloud.com/dc9be992vodcq1257950478/37d45dcb5285890802360381387/NANP9tI1s48A.mp4', 1, 0, 0, '0.00', 0, 0, '2020-05-03 21:34:02'),
(18, 9, '111', NULL, NULL, 'http://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/15885129507106.png', 0, 0, NULL, '0.00', 0, 0, '2020-05-03 21:35:58'),
(19, 9, '', NULL, NULL, 'http://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/15885589947381.png', 0, 0, NULL, '0.00', 0, 0, '2020-05-04 10:23:22'),
(20, 16, '', NULL, NULL, 'http://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/15885706945661.png', 0, 0, NULL, '0.00', 0, 1, '2020-05-04 13:38:23'),
(22, 16, '', '5285890802486456018', 'http://1257950478.vod2.myqcloud.com/dc9be992vodcq1257950478/54d3746e5285890802486456018/5285890802486456019.png', 'http://1257950478.vod2.myqcloud.com/dc9be992vodcq1257950478/54d3746e5285890802486456018/jQwb4qze3O8A.mp4', 1, 0, 18, '0.00', 0, 1, '2020-05-04 13:40:19'),
(23, 16, '122', NULL, NULL, '[object Object]', 0, 0, 0, '0.00', 0, 1, NULL),
(24, 9, '', NULL, NULL, 'http://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/15886645712839.png', 0, 0, NULL, '0.00', 0, 0, '2020-05-05 15:43:00'),
(25, 20, '', NULL, NULL, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200508/202005080232542369.jpg', 0, 0, 0, '0.00', 1, 1, NULL),
(27, 20, '', NULL, NULL, '[object Object]', 0, 0, 0, '0.00', 0, 1, NULL),
(28, 20, '', NULL, NULL, '[object Object]', 0, 0, 0, '0.00', 0, 1, NULL),
(29, 24, '11111', '5285890802810143183', 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/album/1589002935512.png', 'http://1257950478.vod2.myqcloud.com/dc9be992vodcq1257950478/dc07c7615285890802810143183/uYKw5NMdQHsA.mp4', 1, 0, 0, '0.00', 0, 1, '2020-05-09 13:42:17'),
(30, 29, '', NULL, NULL, '[object Object]', 0, 0, 0, '0.00', 0, 1, NULL),
(31, 27, '', NULL, NULL, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/album/1589025141430.jpg', 0, 0, NULL, '0.00', 0, 1, '2020-05-09 19:52:25'),
(32, 29, '', NULL, NULL, '[object Object]', 0, 0, 0, '0.00', 0, 1, NULL),
(33, 29, '', '5285890802823009471', 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/album/1589025313270.png', 'http://1257950478.vod2.myqcloud.com/dc9be992vodcq1257950478/ac9e1ec65285890802823009471/ayIaUBx932IA.mp4', 1, 0, 36, '0.00', 0, 1, '2020-05-09 19:55:14'),
(34, 29, '', NULL, NULL, '[object Object]', 0, 0, 0, '0.00', 0, 1, NULL),
(35, 31, '', NULL, NULL, 'http://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/15890258819966.png', 0, 0, NULL, '0.00', 0, 1, '2020-05-09 20:04:41'),
(36, 31, '', '5285890802823481463', 'http://1257950478.vod2.myqcloud.com/dc9be992vodcq1257950478/b67f222b5285890802823481463/5285890802823481465.png', 'http://1257950478.vod2.myqcloud.com/dc9be992vodcq1257950478/b67f222b5285890802823481463/yLCb3FEqgLsA.mp4', 1, 0, 42, '0.00', 0, 1, '2020-05-09 20:04:52'),
(37, 31, '', NULL, NULL, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200510/202005101111466479.jpg', 0, 0, 0, '0.00', 0, 1, NULL),
(38, 33, '', NULL, NULL, '[object Object]', 0, 0, 0, '0.00', 0, 1, NULL),
(39, 33, '哈', NULL, NULL, '[object Object]', 0, 0, 0, '0.00', 0, 1, NULL),
(40, 36, '', NULL, NULL, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200511/202005110100477077.jpg', 0, 0, 0, '0.00', 0, 1, NULL),
(41, 38, '', NULL, NULL, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200511/202005110101181508.jpg', 0, 0, 0, '0.00', 0, 1, NULL),
(42, 43, '', NULL, NULL, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200511/202005110242398726.jpg', 0, 0, 0, '0.00', 0, 1, NULL),
(43, 45, '', NULL, NULL, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200511/202005110253131745.jpg', 0, 0, 0, '0.00', 0, 1, NULL),
(44, 40, '', NULL, NULL, 'http://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/1589181406547.png', 0, 0, NULL, '0.00', 0, 1, '2020-05-11 15:16:48'),
(45, 50, '', NULL, NULL, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200511/202005111034272381.jpg', 0, 0, 0, '0.00', 0, 1, NULL),
(46, 89, '', '5285890804323278421', 'http://1257950478.vod2.myqcloud.com/dc9be992vodcq1257950478/736d7bc65285890804323278421/5285890804323278422.png', 'http://1257950478.vod2.myqcloud.com/dc9be992vodcq1257950478/736d7bc65285890804323278421/bPO3xNS0DqUA.mp4', 1, 0, 5, '0.00', 0, 1, '2020-06-19 22:06:38'),
(47, 87, '', NULL, NULL, 'http://yvy1-1257950478.cos.AP_Chengdu.myqcloud.com/15925844841937.png', 0, 0, NULL, '0.00', 0, 0, '2020-06-20 00:34:51'),
(48, 87, '', NULL, NULL, 'http://yvy1-1257950478.cos.AP_Chengdu.myqcloud.com/15925845487194.png', 0, 0, NULL, '0.00', 0, 1, '2020-06-20 00:35:48'),
(49, 87, '', NULL, NULL, 'http://yvy1-1257950478.cos.AP_Chengdu.myqcloud.com/15925848211237.png', 0, 0, NULL, '0.00', 0, 1, '2020-06-20 00:40:21'),
(50, 89, '', NULL, NULL, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/album/1592585019534.png', 0, 0, NULL, '0.00', 0, 1, '2020-06-20 00:43:36'),
(51, 89, '', NULL, NULL, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/album/1592585288000.png', 0, 0, NULL, '0.00', 0, 1, '2020-06-20 00:48:05'),
(52, 89, '', NULL, NULL, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/album/1592585424255.png', 0, 0, NULL, '0.00', 0, 1, '2020-06-20 00:50:21'),
(53, 95, '', NULL, NULL, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/album/1592706915657.jpg', 0, 0, NULL, '0.00', 0, 0, '2020-06-21 10:35:17'),
(54, 96, '', NULL, NULL, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/album/1592715270286.png', 0, 0, NULL, '0.00', 0, 0, '2020-06-21 12:54:30'),
(55, 97, '', NULL, NULL, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/album/1592717140858.png', 0, 0, NULL, '0.00', 0, 0, '2020-06-21 13:25:40'),
(56, 96, '', '5285890804396300246', 'http://1251436363.vod2.myqcloud.com/02f3c6c4vodcq1251436363/d1fb16075285890804396300246/5285890804396300247.png', 'http://1251436363.vod2.myqcloud.com/02f3c6c4vodcq1251436363/d1fb16075285890804396300246/RbMdLyZC6UkA.mp4', 1, 0, 0, '0.00', 0, 0, '2020-06-21 23:46:56'),
(57, 95, '哈哈', '5285890804399416225', 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/album/1592755185730.png', 'http://1251436363.vod2.myqcloud.com/02f3c6c4vodcq1251436363/bb54576f5285890804399416225/ipAAyOPxB5oA.mp4', 1, 0, 0, '0.00', 0, 0, '2020-06-21 23:59:47');

-- --------------------------------------------------------

--
-- 表的结构 `t_alipay_setup`
--

CREATE TABLE IF NOT EXISTS `t_alipay_setup` (
  `t_id` int(11) NOT NULL,
  `t_alipay_appid` varchar(255) DEFAULT NULL,
  `t_alipay_public_key` varchar(3000) DEFAULT NULL,
  `t_alipay_private_key` varchar(3000) DEFAULT NULL,
  `t_pay_id` int(11) DEFAULT NULL,
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_alipay_setup`
--

INSERT INTO `t_alipay_setup` (`t_id`, `t_alipay_appid`, `t_alipay_public_key`, `t_alipay_private_key`, `t_pay_id`, `t_create_time`) VALUES
(1, '2017071907812021', 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAls2hNVOgaoIsAZyBHqsYDngy0wBiMyCeZ/FMw4RSzLBOPsyJJmlvOleoRbZOo1ItmpajAok/qxx8OYpdmsXmsK4XRy3kxlhlQSZIhw4PdxU9rmZx+RAMv+3sMBbrNBt/QBRjdUK440NpEjynvb4SZ+0VQEM8UyNRxw8wsHRyXxnvSxYXFFG1sukbzehU3RRTdaMASr7hX9w8xQpbAv+ZEQDYz29NblHUgsjkGNkEggzosPtLlhdjxO5tIqszdF2oA/5vfX1QbTHgeWA0juCaA4WF/FRvUpY6zYFCimfvt/5Gi7DuPTkmjPRDaOIlK2W9Piejlc9YIv6SwSVtRq8XBwIDAQAB', 'MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC+2fOLgH/mxIeE8wXubMePeWABXxbkDfqcOzzLy37vT/DeHfxD134sEY3F3iY+dYjBH/lzfWgwhx/CaH1PBzSCGC4WBFmL3u0Ydx6v8rb/gvAWS2vK4N9zYE7M7l6zErbIm+AmRWgHcTNTOV2LBiL2ebSyoTIIW6XmPVGu6GyNnwUrSV3XvUDbfYKxsuzZtDu1hOYtl7sdgmR56NDs23IR+vdFX17I3OUrkvzLH0nPTQ2vVIt2Oo1TiGOYVen3EUw7NDx+JIXxLVPWDWNWPA4X5TPFe7mP4nhmbFlWPRgB942IbVSaLeN8DjnJGV7T/wBnJLoerOQp5GGN/4WJ9KGTAgMBAAECggEBAKTUJbQQ2eXbTFO1dCT0C/JM2G62ylVSAWRXAO3dpZZXy2Z6LToGbfDvhCsk7pC4/9ATpmRpJcfrm7FSfw724RGOgpb/ULstYEXl8znwfL32PxZyMvl392R1A/mX0XAFNJnTjeZfwTXUPYieHb0JIr8OY9J2x3hSdth/kwFluQMhmRy1sv+WSBOhL6oUvel9kD3SxFkyWw63uvocOaEgxFjHNdV2fXI+E0m5iNC5y2wiw2jCww+ySGYZcsNb1Dn32E8DBrmf+mTcqBvU5tlSjpeKpchS0HZPoYe9gwvfPiSbvGuhvcqbhPGxiCl0EzHy2DMmRErwhPd/O/EjJZkg6BkCgYEA9H36t9ccGOitTBRVZaaJFmujMfjT2dt9S7i4b6ILmVhGm001kI0gyuSDmz1r+oJ0rdemCqmJ8MFNFtwKDSK0Dd1ja0qKsuQ3l9WfAziQcvPDd0iT7Z/5FZNt39U3E7rXQU7xG5CecYQaNi/HTwTVB1YbE4cCudWiPADHkAZ+soUCgYEAx9WgBov3AarLUFADWKY16CV9jq80omYBRY8g9UsJR9UMIdaTKqxf/LLkHNhbY3/tBf9bDC8R+IrcKnrkh7I2KiQIxoruHg3tdScn9J1ojyHmol0kneu0eA2OY63oR1W42aGIl0ryQj35cTKWK0NX3IlEfKxiiWsTUJEwdO5bWzcCgYAhmQZRKSBVU/Qslka990qzaAs/HMCQGZd4RmQiAxSw9+6L/Oo1eQ9eklR7is9B15eNJCtPH8ky6n1bfNVsxK4VkazN26p/ttjk5pg5axZ+lXzw8WpSpz8ldeMNdVFiRrS55s0/SnpbgxnPBHXRKArWPUDvSAhZ3T+0Gy9RXXMfuQKBgBBsRAyFsDUY3kCpcrz0W/XKLvls+Lxn+a7HxoOiOQ8IOUkGo22cYP8ZjJm6Rjh1KPuXMtpbe/SbJODw3JsyUDVCZN48SLl7l4pLP4Ng9FjfBl9NnFbGKjy7kHosrqw+JUTte5ZDeIltInTlHWZM0Im1VkWQvUBh5mJ2rC7P7/4dAoGAdRyU10uUBLB9CDnRuZQGDtsnIKNjQs/Llxt3lKQe/nGOFJPALy/RhG+jU3UCFuSuoSvPkE75YU5nj0BxtQJnRiEFA9UZZnmVqNt2P53M93LhtGid4EE3Wrst/HJWAnzoogcSe4WJ/8Idq8B4WQ4BH1ygRBmk79PhGxuzhy1WeCg=', 7, '2020-06-19 23:22:32');

-- --------------------------------------------------------

--
-- 表的结构 `t_anchor`
--

CREATE TABLE IF NOT EXISTS `t_anchor` (
  `t_id` int(11) NOT NULL,
  `t_user_id` int(11) DEFAULT NULL,
  `t_state` int(11) DEFAULT NULL COMMENT '0.空闲1.忙碌2.离线'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `t_anchor_devote`
--

CREATE TABLE IF NOT EXISTS `t_anchor_devote` (
  `t_id` int(11) NOT NULL,
  `t_anchor_id` int(11) DEFAULT NULL,
  `t_devote_value` decimal(11,2) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_anchor_devote`
--

INSERT INTO `t_anchor_devote` (`t_id`, `t_anchor_id`, `t_devote_value`) VALUES
(1, 16, '0.00');

-- --------------------------------------------------------

--
-- 表的结构 `t_anchor_guild`
--

CREATE TABLE IF NOT EXISTS `t_anchor_guild` (
  `t_id` int(11) NOT NULL,
  `t_guild_id` int(11) DEFAULT NULL,
  `t_anchor_id` int(11) DEFAULT NULL,
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_anchor_guild`
--

INSERT INTO `t_anchor_guild` (`t_id`, `t_guild_id`, `t_anchor_id`, `t_create_time`) VALUES
(1, 1, 16, '2020-05-04 15:00:19');

-- --------------------------------------------------------

--
-- 表的结构 `t_anchor_setup`
--

CREATE TABLE IF NOT EXISTS `t_anchor_setup` (
  `t_id` int(11) NOT NULL,
  `t_user_id` int(11) DEFAULT NULL,
  `t_video_gold` decimal(7,2) DEFAULT NULL,
  `t_text_gold` decimal(7,2) DEFAULT NULL,
  `t_voice_gold` decimal(7,2) DEFAULT '0.00' COMMENT '语音聊天收费',
  `t_phone_gold` decimal(7,2) DEFAULT NULL,
  `t_weixin_gold` decimal(7,2) DEFAULT NULL,
  `t_qq_gold` decimal(7,2) DEFAULT '0.00' COMMENT 'QQ价格',
  `t_private_photo_gold` decimal(7,2) DEFAULT NULL,
  `t_private_video_gold` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_anchor_setup`
--

INSERT INTO `t_anchor_setup` (`t_id`, `t_user_id`, `t_video_gold`, `t_text_gold`, `t_voice_gold`, `t_phone_gold`, `t_weixin_gold`, `t_qq_gold`, `t_private_photo_gold`, `t_private_video_gold`) VALUES
(1, 2, '20.00', '2.00', '10.00', '0.00', '0.00', '0.00', NULL, NULL),
(2, 3, '20.00', '2.00', '10.00', '0.00', '0.00', '0.00', NULL, NULL),
(3, 4, '20.00', '2.00', '10.00', '0.00', '0.00', '0.00', NULL, NULL),
(4, 9, '40.00', '10.00', '30.00', '0.00', '0.00', '0.00', NULL, NULL),
(5, 14, '20.00', '2.00', '10.00', '0.00', '0.00', '0.00', NULL, NULL),
(6, 16, '40.00', '2.00', '50.00', '500.00', '100.00', '300.00', NULL, NULL),
(7, 20, '40.00', '2.00', '50.00', '500.00', '300.00', '0.00', NULL, NULL),
(8, 29, '40.00', '2.00', '30.00', '500.00', '300.00', '300.00', NULL, NULL),
(9, 31, '50.00', '2.00', '50.00', '500.00', '300.00', '300.00', NULL, NULL),
(10, 33, '40.00', '2.00', '50.00', '500.00', '300.00', '0.00', NULL, NULL),
(11, 34, '40.00', '2.00', '50.00', '500.00', '300.00', '0.00', NULL, NULL),
(12, 36, '40.00', '2.00', '50.00', '500.00', '300.00', '0.00', NULL, NULL),
(13, 38, '40.00', '2.00', '50.00', '500.00', '300.00', '0.00', NULL, NULL),
(14, 39, '40.00', '8.00', '30.00', '500.00', '500.00', '500.00', NULL, NULL),
(15, 43, '40.00', '2.00', '50.00', '500.00', '300.00', '0.00', NULL, NULL),
(16, 45, '40.00', '2.00', '50.00', '500.00', '300.00', '0.00', NULL, NULL),
(17, 50, '40.00', '2.00', '50.00', '500.00', '300.00', '0.00', NULL, NULL),
(18, 52, '20.00', '1.00', '10.00', '500.00', '300.00', '300.00', NULL, NULL),
(19, 53, '40.00', '2.00', '50.00', '500.00', '300.00', '300.00', NULL, NULL),
(20, 56, '40.00', '2.00', '50.00', '500.00', '300.00', '300.00', NULL, NULL),
(21, 61, '40.00', '2.00', '50.00', '500.00', '300.00', '300.00', NULL, NULL),
(22, 62, '50.00', '2.00', '20.00', '500.00', '300.00', '300.00', NULL, NULL),
(23, 76, '40.00', '8.00', '50.00', '500.00', '500.00', '500.00', NULL, NULL),
(24, 88, '40.00', '2.00', '50.00', '500.00', '300.00', '0.00', NULL, NULL),
(25, 89, '40.00', '2.00', '50.00', '500.00', '300.00', '300.00', NULL, NULL),
(26, 91, '40.00', '2.00', '50.00', '500.00', '300.00', '300.00', NULL, NULL),
(27, 97, '40.00', '2.00', '50.00', '500.00', '300.00', '300.00', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `t_authority`
--

CREATE TABLE IF NOT EXISTS `t_authority` (
  `t_id` int(11) NOT NULL,
  `t_role_id` int(11) DEFAULT NULL,
  `t_menu_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3213 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_authority`
--

INSERT INTO `t_authority` (`t_id`, `t_role_id`, `t_menu_id`) VALUES
(1164, 7, 3),
(1165, 7, 5),
(1166, 7, 6),
(1167, 7, 7),
(1168, 7, 8),
(1169, 7, 14),
(1170, 7, 16),
(1171, 7, 17),
(1172, 7, 43),
(1173, 7, 48),
(1174, 7, 57),
(1175, 7, 58),
(1176, 7, 4),
(1177, 7, 9),
(1178, 7, 10),
(1179, 7, 11),
(1180, 7, 12),
(2031, 8, 1),
(2032, 8, 2),
(2033, 8, 30),
(2034, 8, 31),
(2035, 8, 39),
(2036, 8, 41),
(2037, 8, 53),
(2038, 8, 54),
(2039, 8, 64),
(2040, 8, 69),
(2041, 8, 3),
(2042, 8, 5),
(2043, 8, 6),
(2044, 8, 7),
(2045, 8, 8),
(2046, 8, 14),
(2047, 8, 16),
(2048, 8, 17),
(2049, 8, 43),
(2050, 8, 48),
(2051, 8, 57),
(2052, 8, 58),
(2053, 8, 61),
(2054, 8, 63),
(2055, 8, 4),
(2056, 8, 9),
(2057, 8, 10),
(2058, 8, 11),
(2059, 8, 12),
(2060, 8, 68),
(2061, 8, 13),
(2062, 8, 15),
(2063, 8, 18),
(2064, 8, 19),
(2065, 8, 20),
(2066, 8, 21),
(2067, 8, 32),
(2068, 8, 26),
(2069, 8, 36),
(2070, 8, 42),
(2071, 8, 35),
(2072, 8, 37),
(2073, 8, 38),
(2074, 8, 45),
(2075, 8, 46),
(2076, 8, 47),
(2077, 8, 55),
(2078, 8, 56),
(2079, 8, 59),
(2080, 8, 60),
(2081, 8, 49),
(2082, 8, 50),
(2083, 8, 51),
(2084, 8, 65),
(2085, 8, 66),
(2086, 8, 67),
(2403, 3, 49),
(2404, 3, 50),
(2405, 3, 51),
(2406, 3, 66),
(2407, 3, 67),
(2479, 9, 1),
(2480, 9, 2),
(2481, 9, 30),
(2482, 9, 31),
(2483, 9, 39),
(2484, 9, 53),
(2485, 9, 54),
(2486, 9, 64),
(2487, 9, 65),
(2488, 9, 3),
(2489, 9, 5),
(2490, 9, 6),
(2491, 9, 7),
(2492, 9, 8),
(2493, 9, 14),
(2494, 9, 16),
(2495, 9, 17),
(2496, 9, 48),
(2497, 9, 57),
(2498, 9, 58),
(2499, 9, 61),
(2500, 9, 63),
(2501, 9, 72),
(2502, 9, 4),
(2503, 9, 9),
(2504, 9, 10),
(2505, 9, 11),
(2506, 9, 12),
(2507, 9, 68),
(2508, 9, 13),
(2509, 9, 15),
(2510, 9, 18),
(2511, 9, 19),
(2512, 9, 20),
(2513, 9, 21),
(2514, 9, 32),
(2515, 9, 26),
(2516, 9, 36),
(2517, 9, 42),
(2518, 9, 35),
(2519, 9, 37),
(2520, 9, 38),
(2521, 9, 45),
(2522, 9, 46),
(2523, 9, 47),
(2524, 9, 55),
(2525, 9, 56),
(2526, 9, 59),
(2527, 9, 60),
(2528, 9, 49),
(2529, 9, 50),
(2530, 9, 51),
(2531, 9, 66),
(2532, 9, 67),
(2533, 9, 75),
(2534, 9, 43),
(2535, 9, 76),
(2607, 2, 1),
(2608, 2, 2),
(2609, 2, 27),
(2610, 2, 28),
(2611, 2, 29),
(2612, 2, 30),
(2613, 2, 31),
(2614, 2, 39),
(2615, 2, 41),
(2616, 2, 53),
(2617, 2, 54),
(2618, 2, 64),
(2619, 2, 65),
(2620, 2, 3),
(2621, 2, 5),
(2622, 2, 6),
(2623, 2, 7),
(2624, 2, 8),
(2625, 2, 14),
(2626, 2, 16),
(2627, 2, 17),
(2628, 2, 48),
(2629, 2, 57),
(2630, 2, 58),
(2631, 2, 61),
(2632, 2, 63),
(2633, 2, 72),
(2634, 2, 4),
(2635, 2, 9),
(2636, 2, 10),
(2637, 2, 11),
(2638, 2, 12),
(2639, 2, 68),
(2640, 2, 13),
(2641, 2, 15),
(2642, 2, 18),
(2643, 2, 19),
(2644, 2, 20),
(2645, 2, 21),
(2646, 2, 22),
(2647, 2, 23),
(2648, 2, 24),
(2649, 2, 25),
(2650, 2, 32),
(2651, 2, 26),
(2652, 2, 33),
(2653, 2, 34),
(2654, 2, 36),
(2655, 2, 42),
(2656, 2, 35),
(2657, 2, 37),
(2658, 2, 38),
(2659, 2, 45),
(2660, 2, 46),
(2661, 2, 47),
(2662, 2, 55),
(2663, 2, 56),
(2664, 2, 59),
(2665, 2, 60),
(2666, 2, 49),
(2667, 2, 50),
(2668, 2, 51),
(2669, 2, 66),
(2670, 2, 67),
(2671, 2, 73),
(2672, 2, 70),
(2673, 2, 71),
(2674, 2, 74),
(2675, 2, 75),
(2676, 2, 43),
(2677, 2, 76),
(2680, 9, 77),
(2681, 9, 78),
(2916, 1, 1),
(2917, 1, 2),
(2918, 1, 27),
(2919, 1, 28),
(2920, 1, 29),
(2921, 1, 30),
(2922, 1, 31),
(2923, 1, 39),
(2924, 1, 41),
(2925, 1, 53),
(2926, 1, 54),
(2927, 1, 64),
(2928, 1, 65),
(2929, 1, 66),
(2930, 1, 3),
(2931, 1, 5),
(2932, 1, 6),
(2933, 1, 7),
(2934, 1, 8),
(2935, 1, 14),
(2936, 1, 16),
(2937, 1, 17),
(2938, 1, 48),
(2939, 1, 57),
(2940, 1, 58),
(2941, 1, 61),
(2942, 1, 63),
(2943, 1, 72),
(2944, 1, 4),
(2945, 1, 9),
(2946, 1, 10),
(2947, 1, 11),
(2948, 1, 12),
(2949, 1, 68),
(2950, 1, 13),
(2951, 1, 15),
(2952, 1, 77),
(2953, 1, 78),
(2954, 1, 18),
(2955, 1, 19),
(2956, 1, 20),
(2957, 1, 21),
(2958, 1, 22),
(2959, 1, 23),
(2960, 1, 24),
(2961, 1, 25),
(2962, 1, 32),
(2963, 1, 26),
(2964, 1, 33),
(2965, 1, 34),
(2966, 1, 36),
(2967, 1, 42),
(2968, 1, 35),
(2969, 1, 37),
(2970, 1, 38),
(2971, 1, 79),
(2972, 1, 80),
(2973, 1, 81),
(2974, 1, 82),
(2975, 1, 83),
(2976, 1, 85),
(2977, 1, 45),
(2978, 1, 46),
(2979, 1, 47),
(2980, 1, 55),
(2981, 1, 56),
(2982, 1, 59),
(2983, 1, 60),
(2984, 1, 49),
(2985, 1, 50),
(2986, 1, 51),
(2987, 1, 67),
(2988, 1, 73),
(2989, 1, 70),
(2990, 1, 71),
(2991, 1, 74),
(2992, 1, 75),
(2993, 1, 43),
(2994, 1, 76),
(2995, 12, 32),
(2996, 12, 26),
(2997, 12, 33),
(2998, 12, 34),
(2999, 12, 36),
(3000, 12, 42),
(3001, 12, 38),
(3002, 12, 79),
(3003, 12, 80),
(3004, 12, 81),
(3005, 12, 82),
(3006, 12, 83),
(3007, 12, 85),
(3142, 13, 2),
(3143, 13, 30),
(3144, 13, 31),
(3145, 13, 39),
(3146, 13, 41),
(3147, 13, 54),
(3148, 13, 64),
(3149, 13, 65),
(3150, 13, 66),
(3151, 13, 3),
(3152, 13, 6),
(3153, 13, 7),
(3154, 13, 8),
(3155, 13, 14),
(3156, 13, 16),
(3157, 13, 17),
(3158, 13, 48),
(3159, 13, 57),
(3160, 13, 58),
(3161, 13, 61),
(3162, 13, 63),
(3163, 13, 72),
(3164, 13, 4),
(3165, 13, 9),
(3166, 13, 10),
(3167, 13, 11),
(3168, 13, 12),
(3169, 13, 68),
(3170, 13, 13),
(3171, 13, 15),
(3172, 13, 77),
(3173, 13, 78),
(3174, 13, 18),
(3175, 13, 19),
(3176, 13, 20),
(3177, 13, 21),
(3178, 13, 32),
(3179, 13, 26),
(3180, 13, 33),
(3181, 13, 34),
(3182, 13, 36),
(3183, 13, 42),
(3184, 13, 35),
(3185, 13, 37),
(3186, 13, 38),
(3187, 13, 79),
(3188, 13, 80),
(3189, 13, 81),
(3190, 13, 82),
(3191, 13, 83),
(3192, 13, 85),
(3193, 13, 45),
(3194, 13, 46),
(3195, 13, 47),
(3196, 13, 55),
(3197, 13, 56),
(3198, 13, 59),
(3199, 13, 60),
(3200, 13, 49),
(3201, 13, 50),
(3202, 13, 51),
(3203, 13, 67),
(3204, 13, 75),
(3205, 13, 43),
(3206, 13, 76),
(3207, 1, 87),
(3208, 14, 1),
(3209, 14, 9),
(3210, 14, 10),
(3211, 14, 11),
(3212, 14, 12);

-- --------------------------------------------------------

--
-- 表的结构 `t_award_record`
--

CREATE TABLE IF NOT EXISTS `t_award_record` (
  `t_id` int(11) NOT NULL,
  `t_user_id` int(11) DEFAULT NULL,
  `t_activity_id` int(11) DEFAULT NULL,
  `t_prizedetai_id` int(11) DEFAULT NULL,
  `t_award_gold` int(11) DEFAULT NULL,
  `t_award_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `t_balance`
--

CREATE TABLE IF NOT EXISTS `t_balance` (
  `t_id` int(11) NOT NULL,
  `t_user_id` int(11) DEFAULT NULL,
  `t_recharge_money` decimal(10,2) DEFAULT '0.00',
  `t_profit_money` decimal(10,2) DEFAULT '0.00',
  `t_share_money` decimal(10,2) DEFAULT '0.00'
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_balance`
--

INSERT INTO `t_balance` (`t_id`, `t_user_id`, `t_recharge_money`, `t_profit_money`, `t_share_money`) VALUES
(1, 1, '0.00', '54462.00', '23237.20'),
(2, 2, '0.00', '38.00', '0.00'),
(3, 3, '0.00', '12.00', '0.00'),
(4, 4, '0.00', '0.00', '0.00'),
(5, 5, '0.00', '0.00', '0.00'),
(6, 6, '34.00', '0.00', '0.00'),
(7, 7, '22.00', '1.40', '0.00'),
(8, 8, '0.00', '0.00', '0.00'),
(9, 9, '0.00', '81126.40', '10.00'),
(10, 10, '0.00', '0.00', '0.00'),
(11, 11, '32.00', '0.00', '0.00'),
(12, 12, '38.00', '0.00', '0.00'),
(13, 13, '38.00', '0.00', '0.00'),
(14, 14, '0.00', '12.00', '0.00'),
(15, 15, '38.00', '0.00', '0.00'),
(16, 16, '0.00', '58.80', '0.00'),
(17, 17, '38.00', '0.00', '0.00'),
(18, 18, '38.00', '0.00', '0.00'),
(19, 19, '38.00', '0.00', '0.00'),
(20, 20, '0.00', '0.00', '0.00'),
(21, 21, '38.00', '0.00', '0.00'),
(22, 22, '0.00', '0.00', '0.00'),
(23, 23, '38.00', '0.00', '0.00'),
(24, 24, '0.00', '0.00', '0.00'),
(25, 25, '0.00', '0.00', '0.00'),
(26, 26, '38.00', '0.00', '0.00'),
(27, 27, '0.00', '0.00', '24.30'),
(28, 28, '58.00', '0.00', '193.00'),
(29, 29, '0.00', '0.00', '0.00'),
(30, 30, '16.00', '0.00', '10.00'),
(31, 31, '0.00', '0.00', '0.60'),
(32, 32, '34.00', '0.00', '0.00'),
(33, 33, '0.00', '0.00', '0.00'),
(34, 34, '0.00', '350.00', '0.00'),
(35, 35, '0.00', '0.00', '22.00'),
(36, 36, '0.00', '0.00', '0.60'),
(37, 37, '16.00', '0.00', '99.80'),
(38, 38, '0.00', '0.00', '0.00'),
(39, 39, '0.00', '74.00', '48.00'),
(40, 40, '0.00', '0.00', '0.00'),
(41, 41, '0.00', '0.00', '0.00'),
(42, 42, '0.00', '0.00', '10.00'),
(43, 43, '0.00', '0.00', '0.00'),
(44, 44, '32.00', '0.00', '0.00'),
(45, 45, '0.00', '0.00', '0.00'),
(46, 46, '34.00', '0.00', '0.00'),
(47, 47, '38.00', '0.00', '0.00'),
(48, 48, '38.00', '0.00', '0.00'),
(49, 49, '32.00', '0.00', '0.00'),
(50, 50, '0.00', '0.00', '0.00'),
(51, 51, '34.00', '0.00', '0.00'),
(52, 52, '0.00', '210.00', '0.00'),
(53, 53, '0.00', '88.00', '0.00'),
(54, 54, '36.00', '0.00', '0.00'),
(55, 55, '0.00', '0.00', '0.00'),
(56, 56, '0.00', '28.00', '0.00'),
(57, 57, '0.00', '0.00', '0.00'),
(58, 58, '36.00', '0.00', '0.00'),
(59, 59, '38.00', '0.00', '0.00'),
(60, 60, '36.00', '0.00', '0.00'),
(61, 61, '0.00', '0.00', '0.00'),
(62, 62, '0.00', '0.00', '0.00'),
(63, 63, '0.00', '0.00', '0.00'),
(64, 64, '0.00', '0.00', '0.00'),
(65, 65, '30.00', '0.00', '0.00'),
(66, 66, '0.00', '6.00', '0.00'),
(67, 67, '30.00', '0.00', '0.00'),
(68, 68, '0.00', '0.00', '0.00'),
(69, 69, '0.00', '0.00', '0.00'),
(70, 70, '38.00', '0.00', '0.00'),
(71, 71, '38.00', '0.00', '0.00'),
(72, 72, '30.00', '0.00', '0.00'),
(73, 73, '36.00', '0.00', '0.00'),
(74, 74, '38.00', '0.00', '0.00'),
(75, 75, '38.00', '0.00', '0.00'),
(76, 76, '0.00', '56.00', '0.00'),
(77, 77, '0.00', '0.00', '0.00'),
(78, 78, '0.00', '0.00', '0.00'),
(79, 79, '0.00', '0.00', '0.00'),
(80, 80, '10.00', '0.00', '0.00'),
(81, 81, '10.00', '0.00', '0.00'),
(82, 82, '10.00', '0.00', '0.00'),
(83, 83, '10.00', '0.00', '0.00'),
(84, 84, '10.00', '0.00', '0.00'),
(85, 85, '10.00', '0.00', '0.00'),
(86, 86, '10.00', '0.00', '0.00'),
(87, 87, '174.00', '19882.00', '0.00'),
(88, 88, '0.00', '0.00', '0.00'),
(89, 89, '232.00', '434.00', '0.00'),
(90, 90, '4.00', '0.00', '0.00'),
(91, 91, '0.00', '0.00', '0.00'),
(92, 92, '10.00', '0.00', '0.00'),
(93, 93, '10.00', '0.00', '0.00'),
(94, 94, '68.00', '0.00', '0.00'),
(95, 95, '10.00', '0.00', '0.00'),
(96, 96, '68.00', '100000.00', '0.00'),
(97, 97, '0.00', '100.00', '0.00');

-- --------------------------------------------------------

--
-- 表的结构 `t_banned_setup`
--

CREATE TABLE IF NOT EXISTS `t_banned_setup` (
  `t_id` int(11) NOT NULL,
  `t_count` int(11) DEFAULT NULL,
  `t_hours` decimal(5,2) DEFAULT NULL,
  `t_createtime` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_banned_setup`
--

INSERT INTO `t_banned_setup` (`t_id`, `t_count`, `t_hours`, `t_createtime`) VALUES
(1, 1, '1.00', '2018-08-09 09:44:04'),
(2, 3, '12.00', '2018-08-09 09:48:13'),
(3, 4, '24.00', '2018-08-09 09:49:00'),
(7, 6, '-1.00', '2019-03-08 10:05:17'),
(8, 2, '1.00', '2020-01-16 10:49:13');

-- --------------------------------------------------------

--
-- 表的结构 `t_banner`
--

CREATE TABLE IF NOT EXISTS `t_banner` (
  `t_id` int(11) NOT NULL,
  `t_img_url` varchar(255) DEFAULT NULL,
  `t_link_url` varchar(100) DEFAULT NULL,
  `t_is_enable` int(11) DEFAULT NULL COMMENT '0.启用1.禁用',
  `t_create_time` datetime DEFAULT NULL,
  `t_type` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_banner`
--

INSERT INTO `t_banner` (`t_id`, `t_img_url`, `t_link_url`, `t_is_enable`, `t_create_time`, `t_type`) VALUES
(5, 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20191120/201911200408524684.png', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/zbfm.html', 0, '2019-11-20 16:08:55', 0),
(7, 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20191120/201911200409149898.png', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/zbfm.html', 0, '2019-11-20 16:09:17', 1),
(8, 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20191120/201911200416532891.png', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/wmgy.html', 0, '2019-11-20 16:16:56', 1),
(9, 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20191120/201911200417065959.png', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/wmgy.html', 0, '2019-11-20 16:17:10', 0),
(13, 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20191120/201911200419566960.png', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/wxqz.html', 0, '2019-11-20 16:19:58', 0),
(14, 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20191120/201911200420113951.png', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/wxqz.html', 0, '2019-11-20 16:20:19', 1);

-- --------------------------------------------------------

--
-- 表的结构 `t_big_room_man`
--

CREATE TABLE IF NOT EXISTS `t_big_room_man` (
  `t_id` int(11) NOT NULL,
  `t_user_id` int(11) DEFAULT NULL,
  `t_sort` int(11) DEFAULT NULL,
  `t_is_debut` int(11) DEFAULT '0' COMMENT '0.未开播1.直播中',
  `t_room_id` int(11) DEFAULT NULL,
  `t_chat_room_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `t_big_room_viewer`
--

CREATE TABLE IF NOT EXISTS `t_big_room_viewer` (
  `t_id` int(11) NOT NULL,
  `t_big_room_id` int(11) DEFAULT NULL,
  `t_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `t_black_user`
--

CREATE TABLE IF NOT EXISTS `t_black_user` (
  `t_id` int(11) NOT NULL,
  `t_user_id` int(11) DEFAULT NULL COMMENT 'userid',
  `t_cover_user_id` int(11) DEFAULT NULL COMMENT '被拉入黑名单用户ID',
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='黑名单表';

-- --------------------------------------------------------

--
-- 表的结构 `t_browse`
--

CREATE TABLE IF NOT EXISTS `t_browse` (
  `t_browse_id` int(11) NOT NULL,
  `t_browse_user` int(11) DEFAULT NULL,
  `t_cover_browse` int(11) DEFAULT NULL,
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2131 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_browse`
--

INSERT INTO `t_browse` (`t_browse_id`, `t_browse_user`, `t_cover_browse`, `t_create_time`) VALUES
(3, 1, 2, '2020-04-24 18:48:30'),
(8, 1, 2, '2020-04-25 10:39:42'),
(16, 1, 2, '2020-04-27 23:10:56'),
(20, 1, 2, '2020-04-28 23:07:22'),
(24, 1, 2, '2020-04-29 21:09:27'),
(45, 1, 2, '2020-04-30 19:56:14'),
(51, 1, 2, '2020-05-01 23:04:09'),
(76, 1, 2, '2020-05-02 18:28:02'),
(99, 1, 2, '2020-05-03 21:36:40'),
(118, 1, 2, '2020-05-04 13:12:14'),
(200, 1, 2, '2020-05-08 20:20:20'),
(251, 1, 2, '2020-05-09 10:01:16'),
(4, 1, 3, '2020-04-24 10:44:07'),
(44, 1, 3, '2020-04-30 19:41:24'),
(60, 1, 3, '2020-05-01 21:21:10'),
(125, 1, 3, '2020-05-04 14:32:30'),
(43, 1, 4, '2020-04-30 19:37:28'),
(100, 1, 4, '2020-05-03 21:36:36'),
(184, 1, 4, '2020-05-06 20:40:51'),
(199, 1, 4, '2020-05-08 18:33:18'),
(252, 1, 4, '2020-05-09 13:34:42'),
(42, 1, 9, '2020-04-30 19:44:06'),
(52, 1, 9, '2020-05-01 21:04:29'),
(101, 1, 9, '2020-05-03 21:37:09'),
(202, 1, 9, '2020-05-08 20:32:18'),
(75, 1, 14, '2020-05-02 18:29:35'),
(149, 1, 14, '2020-05-05 14:47:51'),
(185, 1, 14, '2020-05-06 20:41:00'),
(201, 1, 14, '2020-05-08 14:42:53'),
(126, 1, 16, '2020-05-04 14:32:54'),
(5, 2, 1, '2020-04-24 20:38:00'),
(9, 2, 1, '2020-04-25 16:50:00'),
(13, 2, 1, '2020-04-26 20:17:00'),
(14, 2, 1, '2020-04-27 23:26:00'),
(18, 2, 1, '2020-04-28 23:59:00'),
(21, 2, 1, '2020-04-29 23:59:00'),
(25, 2, 1, '2020-04-30 23:43:00'),
(50, 2, 1, '2020-05-01 23:26:30'),
(64, 2, 1, '2020-05-02 23:57:30'),
(89, 2, 1, '2020-05-03 23:55:00'),
(105, 2, 1, '2020-05-04 23:58:00'),
(133, 2, 1, '2020-05-05 23:58:30'),
(162, 2, 1, '2020-05-06 20:16:42'),
(220, 2, 1, '2020-05-08 23:56:59'),
(244, 2, 1, '2020-05-09 19:15:29'),
(1, 2, 2, '2020-04-24 12:04:53'),
(11, 2, 2, '2020-04-26 18:38:12'),
(19, 2, 2, '2020-04-28 22:50:40'),
(98, 2, 2, '2020-05-03 18:39:53'),
(123, 2, 2, '2020-05-04 13:58:06'),
(2, 2, 3, '2020-04-24 00:41:45'),
(29, 2, 6, '2020-04-30 19:22:30'),
(127, 2, 6, '2020-05-04 22:48:00'),
(139, 2, 6, '2020-05-05 16:51:00'),
(173, 2, 6, '2020-05-06 17:02:30'),
(269, 2, 6, '2020-05-09 13:45:29'),
(33, 2, 7, '2020-04-30 19:29:00'),
(110, 2, 7, '2020-05-04 20:05:30'),
(156, 2, 7, '2020-05-05 19:38:30'),
(166, 2, 7, '2020-05-06 01:14:30'),
(211, 2, 7, '2020-05-08 21:37:29'),
(56, 2, 11, '2020-05-01 23:57:30'),
(61, 2, 11, '2020-05-02 23:59:00'),
(86, 2, 11, '2020-05-03 23:41:00'),
(143, 2, 11, '2020-05-05 19:03:30'),
(180, 2, 11, '2020-05-06 20:17:12'),
(225, 2, 11, '2020-05-08 23:55:29'),
(241, 2, 11, '2020-05-09 23:00:29'),
(172, 2, 12, '2020-05-06 17:46:00'),
(92, 2, 15, '2020-05-03 16:43:00'),
(122, 2, 16, '2020-05-04 13:47:19'),
(256, 2, 17, '2020-05-09 12:42:59'),
(229, 2, 19, '2020-05-08 20:25:59'),
(232, 2, 21, '2020-05-08 21:35:29'),
(261, 2, 23, '2020-05-09 13:33:29'),
(270, 2, 26, '2020-05-09 19:27:59'),
(277, 2, 28, '2020-05-09 23:54:59'),
(295, 2, 28, '2020-05-10 10:23:59'),
(281, 2, 30, '2020-05-09 20:09:59'),
(307, 2, 32, '2020-05-10 01:41:59'),
(7, 3, 1, '2020-04-24 20:36:30'),
(10, 3, 1, '2020-04-25 16:50:00'),
(12, 3, 1, '2020-04-26 20:18:30'),
(15, 3, 1, '2020-04-27 23:26:30'),
(17, 3, 1, '2020-04-28 23:59:30'),
(22, 3, 1, '2020-04-29 23:59:30'),
(26, 3, 1, '2020-04-30 20:25:00'),
(47, 3, 1, '2020-05-01 23:30:00'),
(65, 3, 1, '2020-05-02 23:59:30'),
(88, 3, 1, '2020-05-03 23:57:30'),
(104, 3, 1, '2020-05-04 23:58:00'),
(136, 3, 1, '2020-05-05 23:25:00'),
(160, 3, 1, '2020-05-06 20:17:42'),
(224, 3, 1, '2020-05-08 23:59:59'),
(248, 3, 1, '2020-05-09 19:15:29'),
(36, 3, 2, '2020-04-30 16:37:52'),
(80, 3, 2, '2020-05-02 23:33:37'),
(210, 3, 2, '2020-05-08 18:25:38'),
(6, 3, 3, '2020-04-24 00:46:50'),
(38, 3, 4, '2020-04-30 17:16:54'),
(49, 3, 4, '2020-05-01 04:51:38'),
(81, 3, 4, '2020-05-02 23:33:39'),
(28, 3, 6, '2020-04-30 19:23:00'),
(128, 3, 6, '2020-05-04 22:49:00'),
(140, 3, 6, '2020-05-05 16:53:00'),
(174, 3, 6, '2020-05-06 17:05:00'),
(234, 3, 6, '2020-05-08 20:29:59'),
(265, 3, 6, '2020-05-09 13:37:29'),
(34, 3, 7, '2020-04-30 19:28:30'),
(111, 3, 7, '2020-05-04 20:02:30'),
(163, 3, 7, '2020-05-06 01:16:30'),
(221, 3, 7, '2020-05-08 21:39:59'),
(57, 3, 11, '2020-05-01 23:58:30'),
(63, 3, 11, '2020-05-02 23:58:00'),
(84, 3, 11, '2020-05-03 23:41:30'),
(144, 3, 11, '2020-05-05 19:02:30'),
(178, 3, 11, '2020-05-06 20:17:42'),
(212, 3, 11, '2020-05-08 23:56:59'),
(242, 3, 11, '2020-05-09 23:00:29'),
(171, 3, 12, '2020-05-06 17:45:00'),
(237, 3, 12, '2020-05-08 20:58:59'),
(94, 3, 15, '2020-05-03 16:42:00'),
(106, 3, 15, '2020-05-04 11:27:30'),
(254, 3, 17, '2020-05-09 12:44:59'),
(228, 3, 21, '2020-05-08 21:37:29'),
(263, 3, 23, '2020-05-09 13:33:59'),
(274, 3, 26, '2020-05-09 19:28:29'),
(291, 3, 28, '2020-05-09 23:59:29'),
(296, 3, 28, '2020-05-10 11:28:59'),
(278, 3, 30, '2020-05-09 20:13:29'),
(303, 3, 32, '2020-05-10 01:41:29'),
(27, 4, 1, '2020-04-30 20:25:30'),
(48, 4, 1, '2020-05-01 23:27:30'),
(66, 4, 1, '2020-05-02 23:59:00'),
(87, 4, 1, '2020-05-03 23:58:00'),
(102, 4, 1, '2020-05-04 23:59:00'),
(134, 4, 1, '2020-05-05 23:22:00'),
(161, 4, 1, '2020-05-06 20:09:42'),
(219, 4, 1, '2020-05-08 23:56:59'),
(247, 4, 1, '2020-05-09 19:14:59'),
(30, 4, 6, '2020-04-30 19:23:30'),
(131, 4, 6, '2020-05-04 17:39:30'),
(141, 4, 6, '2020-05-05 16:49:30'),
(177, 4, 6, '2020-05-06 17:01:30'),
(268, 4, 6, '2020-05-09 13:45:59'),
(32, 4, 7, '2020-04-30 19:29:00'),
(109, 4, 7, '2020-05-04 20:02:00'),
(154, 4, 7, '2020-05-05 19:38:00'),
(165, 4, 7, '2020-05-06 01:01:00'),
(215, 4, 7, '2020-05-08 21:31:59'),
(58, 4, 11, '2020-05-01 23:58:30'),
(62, 4, 11, '2020-05-02 23:58:30'),
(83, 4, 11, '2020-05-03 23:39:00'),
(146, 4, 11, '2020-05-05 19:03:00'),
(179, 4, 11, '2020-05-06 20:16:42'),
(216, 4, 11, '2020-05-08 23:58:59'),
(249, 4, 11, '2020-05-09 22:59:29'),
(168, 4, 12, '2020-05-06 17:47:00'),
(67, 4, 13, '2020-05-02 11:42:30'),
(93, 4, 15, '2020-05-03 16:44:00'),
(255, 4, 17, '2020-05-09 12:38:29'),
(236, 4, 21, '2020-05-08 21:34:29'),
(259, 4, 23, '2020-05-09 12:59:59'),
(272, 4, 26, '2020-05-09 19:28:29'),
(275, 4, 28, '2020-05-09 23:55:59'),
(300, 4, 28, '2020-05-10 10:27:29'),
(280, 4, 30, '2020-05-09 20:15:29'),
(310, 4, 32, '2020-05-10 01:40:29'),
(23, 5, 2, '2020-04-29 18:50:51'),
(46, 5, 2, '2020-05-01 09:50:17'),
(78, 5, 2, '2020-05-02 18:34:37'),
(148, 5, 4, '2020-05-05 14:40:18'),
(40, 6, 2, '2020-04-30 19:14:21'),
(151, 6, 2, '2020-05-05 16:44:42'),
(39, 6, 3, '2020-04-30 18:44:02'),
(150, 6, 4, '2020-05-05 16:44:04'),
(41, 6, 9, '2020-04-30 19:20:31'),
(152, 6, 9, '2020-05-05 16:49:59'),
(31, 7, 2, '2020-04-30 19:10:27'),
(117, 7, 2, '2020-05-04 13:13:17'),
(113, 7, 3, '2020-05-04 12:55:47'),
(116, 7, 4, '2020-05-04 13:05:34'),
(114, 7, 9, '2020-05-04 13:03:31'),
(112, 7, 14, '2020-05-04 12:55:14'),
(153, 7, 14, '2020-05-05 19:36:25'),
(119, 7, 16, '2020-05-04 18:56:59'),
(35, 8, 2, '2020-04-30 16:30:49'),
(71, 8, 2, '2020-05-02 18:08:17'),
(72, 8, 4, '2020-05-02 18:09:35'),
(37, 9, 2, '2020-04-30 19:19:21'),
(55, 9, 2, '2020-05-01 16:06:13'),
(197, 9, 2, '2020-05-08 14:35:33'),
(97, 9, 4, '2020-05-03 17:07:18'),
(203, 9, 4, '2020-05-08 14:47:05'),
(198, 9, 6, '2020-05-08 20:29:39'),
(115, 9, 7, '2020-05-04 14:01:19'),
(96, 9, 9, '2020-05-03 17:07:05'),
(124, 9, 16, '2020-05-04 14:01:05'),
(231, 9, 19, '2020-05-08 20:26:05'),
(54, 10, 1, '2020-05-01 14:43:24'),
(53, 10, 9, '2020-05-01 14:43:14'),
(187, 11, 2, '2020-05-06 23:56:12'),
(204, 11, 2, '2020-05-08 18:10:48'),
(79, 11, 3, '2020-05-02 23:08:42'),
(91, 11, 3, '2020-05-03 03:31:09'),
(90, 11, 4, '2020-05-03 03:30:54'),
(186, 11, 4, '2020-05-06 23:56:07'),
(209, 11, 4, '2020-05-08 18:13:49'),
(208, 11, 14, '2020-05-08 17:40:27'),
(59, 12, 2, '2020-05-01 17:14:09'),
(157, 12, 2, '2020-05-05 20:39:41'),
(238, 12, 2, '2020-05-08 20:59:13'),
(183, 12, 14, '2020-05-06 14:11:27'),
(239, 12, 16, '2020-05-08 20:59:23'),
(68, 13, 2, '2020-05-02 11:41:56'),
(69, 13, 4, '2020-05-02 11:41:48'),
(70, 13, 9, '2020-05-02 11:42:05'),
(77, 14, 1, '2020-05-02 23:59:30'),
(82, 14, 1, '2020-05-03 23:59:00'),
(103, 14, 1, '2020-05-04 23:59:30'),
(132, 14, 1, '2020-05-05 23:24:30'),
(158, 14, 1, '2020-05-06 20:17:12'),
(217, 14, 1, '2020-05-08 23:59:59'),
(245, 14, 1, '2020-05-09 19:16:29'),
(130, 14, 6, '2020-05-04 22:48:30'),
(138, 14, 6, '2020-05-05 16:50:00'),
(176, 14, 6, '2020-05-06 17:02:30'),
(264, 14, 6, '2020-05-09 13:41:29'),
(108, 14, 7, '2020-05-04 20:05:00'),
(155, 14, 7, '2020-05-05 19:37:00'),
(164, 14, 7, '2020-05-06 01:16:30'),
(214, 14, 7, '2020-05-08 21:39:59'),
(73, 14, 11, '2020-05-02 23:59:30'),
(85, 14, 11, '2020-05-03 23:42:00'),
(145, 14, 11, '2020-05-05 19:02:00'),
(182, 14, 11, '2020-05-06 20:16:42'),
(213, 14, 11, '2020-05-08 23:59:59'),
(250, 14, 11, '2020-05-09 22:59:59'),
(170, 14, 12, '2020-05-06 17:42:00'),
(74, 14, 14, '2020-05-02 18:28:58'),
(95, 14, 15, '2020-05-03 16:45:00'),
(107, 14, 15, '2020-05-04 11:27:30'),
(257, 14, 17, '2020-05-09 12:41:29'),
(230, 14, 19, '2020-05-08 20:25:59'),
(233, 14, 21, '2020-05-08 21:35:59'),
(258, 14, 23, '2020-05-09 13:33:59'),
(273, 14, 26, '2020-05-09 19:25:29'),
(289, 14, 28, '2020-05-09 23:58:59'),
(298, 14, 28, '2020-05-10 10:29:59'),
(282, 14, 30, '2020-05-09 20:14:29'),
(305, 14, 32, '2020-05-10 01:41:59'),
(120, 16, 1, '2020-05-04 23:59:00'),
(135, 16, 1, '2020-05-05 23:58:30'),
(159, 16, 1, '2020-05-06 20:17:12'),
(222, 16, 1, '2020-05-08 23:59:29'),
(246, 16, 1, '2020-05-09 19:15:59'),
(129, 16, 6, '2020-05-04 22:48:30'),
(137, 16, 6, '2020-05-05 16:48:30'),
(175, 16, 6, '2020-05-06 17:02:00'),
(235, 16, 6, '2020-05-08 20:27:59'),
(266, 16, 6, '2020-05-09 13:45:59'),
(121, 16, 7, '2020-05-04 20:06:00'),
(147, 16, 7, '2020-05-05 19:36:30'),
(167, 16, 7, '2020-05-06 01:15:30'),
(223, 16, 7, '2020-05-08 21:35:29'),
(142, 16, 11, '2020-05-05 19:03:30'),
(181, 16, 11, '2020-05-06 20:13:42'),
(218, 16, 11, '2020-05-08 23:59:29'),
(243, 16, 11, '2020-05-09 22:58:59'),
(169, 16, 12, '2020-05-06 17:45:00'),
(240, 16, 12, '2020-05-08 20:59:29'),
(253, 16, 17, '2020-05-09 12:44:29'),
(226, 16, 19, '2020-05-08 20:24:59'),
(227, 16, 21, '2020-05-08 21:36:59'),
(260, 16, 23, '2020-05-09 13:31:59'),
(271, 16, 26, '2020-05-09 19:26:59'),
(276, 16, 28, '2020-05-09 23:59:59'),
(299, 16, 28, '2020-05-10 11:27:29'),
(279, 16, 30, '2020-05-09 20:14:29'),
(306, 16, 32, '2020-05-10 01:37:59'),
(190, 17, 2, '2020-05-07 12:16:19'),
(188, 17, 4, '2020-05-07 12:15:50'),
(189, 17, 14, '2020-05-07 12:16:07'),
(192, 18, 2, '2020-05-07 18:16:09'),
(191, 18, 4, '2020-05-07 18:11:28'),
(193, 18, 14, '2020-05-07 18:16:16'),
(196, 19, 2, '2020-05-07 22:28:32'),
(194, 19, 4, '2020-05-07 22:28:17'),
(195, 19, 14, '2020-05-07 22:28:24'),
(205, 21, 2, '2020-05-08 16:53:09'),
(207, 21, 4, '2020-05-08 16:53:42'),
(206, 21, 14, '2020-05-08 16:53:29'),
(262, 23, 4, '2020-05-09 13:27:36'),
(267, 24, 2, '2020-05-09 13:33:45'),
(313, 27, 2, '2020-05-10 10:16:37'),
(315, 27, 4, '2020-05-10 10:24:54'),
(283, 27, 29, '2020-05-09 20:04:23'),
(312, 27, 29, '2020-05-10 13:26:33'),
(345, 27, 29, '2020-05-11 00:54:59'),
(314, 27, 31, '2020-05-10 10:16:31'),
(343, 27, 31, '2020-05-11 00:54:56'),
(323, 27, 33, '2020-05-10 12:16:09'),
(351, 27, 33, '2020-05-11 01:10:03'),
(556, 27, 33, '2020-05-12 16:04:45'),
(328, 27, 34, '2020-05-10 11:38:31'),
(346, 27, 34, '2020-05-11 00:55:05'),
(350, 27, 36, '2020-05-11 01:10:09'),
(418, 27, 39, '2020-05-11 15:19:50'),
(419, 27, 43, '2020-05-11 15:20:01'),
(415, 27, 45, '2020-05-11 19:28:56'),
(504, 27, 50, '2020-05-12 11:00:54'),
(509, 27, 52, '2020-05-12 10:28:34'),
(512, 27, 53, '2020-05-12 15:59:18'),
(510, 27, 56, '2020-05-12 11:06:59'),
(592, 27, 56, '2020-05-13 00:49:28'),
(581, 27, 61, '2020-05-13 00:27:49'),
(1037, 27, 62, '2020-05-18 22:48:51'),
(898, 27, 76, '2020-05-15 22:38:02'),
(292, 28, 29, '2020-05-09 20:22:12'),
(311, 28, 29, '2020-05-10 08:54:04'),
(1800, 28, 29, '2020-06-17 19:57:51'),
(293, 28, 31, '2020-05-09 20:23:44'),
(329, 28, 31, '2020-05-10 20:40:24'),
(358, 28, 31, '2020-05-11 14:07:27'),
(1149, 28, 31, '2020-05-22 15:46:04'),
(1525, 28, 31, '2020-06-09 18:53:30'),
(1607, 28, 31, '2020-06-13 16:33:13'),
(1846, 28, 31, '2020-06-18 18:02:14'),
(325, 28, 33, '2020-05-10 15:14:07'),
(353, 28, 33, '2020-05-11 11:07:53'),
(1412, 28, 33, '2020-05-29 23:06:39'),
(1605, 28, 33, '2020-06-13 17:03:05'),
(1705, 28, 33, '2020-06-15 18:24:03'),
(1798, 28, 33, '2020-06-17 19:57:46'),
(354, 28, 34, '2020-05-11 01:13:42'),
(1635, 28, 34, '2020-06-13 17:04:38'),
(352, 28, 36, '2020-05-11 11:07:49'),
(1650, 28, 36, '2020-06-13 17:55:49'),
(1651, 28, 38, '2020-06-13 17:56:06'),
(381, 28, 39, '2020-05-11 14:07:14'),
(1847, 28, 39, '2020-06-18 18:02:22'),
(1529, 28, 52, '2020-06-09 18:53:50'),
(1796, 28, 52, '2020-06-17 19:57:49'),
(1845, 28, 52, '2020-06-18 18:02:09'),
(1166, 28, 53, '2020-05-22 17:44:41'),
(1683, 28, 53, '2020-06-15 12:30:54'),
(1797, 28, 53, '2020-06-17 19:57:44'),
(1189, 28, 61, '2020-05-23 16:50:08'),
(1528, 28, 61, '2020-06-09 18:53:44'),
(1799, 28, 61, '2020-06-17 19:57:48'),
(1844, 28, 61, '2020-06-18 18:01:58'),
(1850, 28, 76, '2020-06-18 18:02:29'),
(316, 29, 4, '2020-05-10 10:17:03'),
(287, 29, 11, '2020-05-09 22:59:59'),
(290, 29, 28, '2020-05-09 23:56:29'),
(297, 29, 28, '2020-05-10 23:58:59'),
(336, 29, 28, '2020-05-11 13:58:29'),
(935, 29, 28, '2020-05-16 23:59:29'),
(952, 29, 28, '2020-05-17 23:59:59'),
(1008, 29, 28, '2020-05-18 23:44:59'),
(1074, 29, 28, '2020-05-19 15:21:29'),
(1109, 29, 28, '2020-05-20 15:49:14'),
(1141, 29, 28, '2020-05-22 23:48:14'),
(1178, 29, 28, '2020-05-23 23:54:14'),
(1191, 29, 28, '2020-05-24 23:48:44'),
(1217, 29, 28, '2020-05-25 23:45:14'),
(1292, 29, 28, '2020-05-26 23:48:44'),
(1326, 29, 28, '2020-05-27 23:47:14'),
(1351, 29, 28, '2020-05-28 03:07:14'),
(1424, 29, 28, '2020-05-29 23:58:14'),
(1430, 29, 28, '2020-05-30 23:50:14'),
(1465, 29, 28, '2020-05-31 00:57:44'),
(1535, 29, 28, '2020-06-09 23:18:14'),
(1543, 29, 28, '2020-06-10 00:11:44'),
(1602, 29, 28, '2020-06-13 22:56:14'),
(1667, 29, 28, '2020-06-14 23:40:44'),
(1673, 29, 28, '2020-06-15 23:26:44'),
(1743, 29, 28, '2020-06-16 03:00:44'),
(1862, 29, 28, '2020-06-18 20:32:38'),
(1901, 29, 28, '2020-06-19 22:31:24'),
(1982, 29, 28, '2020-06-20 04:51:24'),
(332, 29, 29, '2020-05-10 12:31:36'),
(288, 29, 30, '2020-05-09 20:16:29'),
(394, 29, 30, '2020-05-11 23:57:29'),
(465, 29, 30, '2020-05-12 23:52:59'),
(568, 29, 30, '2020-05-13 23:57:59'),
(726, 29, 30, '2020-05-14 20:18:59'),
(817, 29, 30, '2020-05-15 23:44:29'),
(921, 29, 30, '2020-05-16 01:41:59'),
(322, 29, 31, '2020-05-10 10:40:28'),
(308, 29, 32, '2020-05-10 01:39:59'),
(607, 29, 32, '2020-05-13 02:12:29'),
(1545, 29, 32, '2020-06-10 01:11:44'),
(1630, 29, 32, '2020-06-13 17:56:14'),
(326, 29, 34, '2020-05-10 12:30:45'),
(344, 29, 35, '2020-05-11 22:53:29'),
(488, 29, 35, '2020-05-12 14:35:29'),
(575, 29, 35, '2020-05-13 22:41:59'),
(750, 29, 35, '2020-05-14 23:33:59'),
(776, 29, 35, '2020-05-15 23:59:29'),
(900, 29, 35, '2020-05-16 11:51:59'),
(970, 29, 35, '2020-05-17 23:59:59'),
(990, 29, 35, '2020-05-18 09:26:59'),
(1276, 29, 35, '2020-05-25 19:40:14'),
(1375, 29, 35, '2020-05-28 14:39:44'),
(1484, 29, 35, '2020-06-02 19:29:44'),
(1752, 29, 35, '2020-06-17 16:28:25'),
(363, 29, 37, '2020-05-11 13:28:59'),
(651, 29, 37, '2020-05-13 12:20:59'),
(409, 29, 44, '2020-05-11 14:47:29'),
(430, 29, 46, '2020-05-11 18:36:29'),
(616, 29, 46, '2020-05-13 06:07:29'),
(1239, 29, 46, '2020-05-25 09:21:44'),
(438, 29, 49, '2020-05-11 16:12:59'),
(453, 29, 51, '2020-05-11 23:20:59'),
(495, 29, 54, '2020-05-12 03:47:29'),
(521, 29, 58, '2020-05-12 13:08:59'),
(626, 29, 58, '2020-05-13 09:38:29'),
(546, 29, 60, '2020-05-12 20:40:59'),
(687, 29, 66, '2020-05-13 20:39:29'),
(717, 29, 67, '2020-05-13 20:21:29'),
(766, 29, 71, '2020-05-14 23:44:59'),
(783, 29, 71, '2020-05-15 04:42:29'),
(1132, 29, 71, '2020-05-20 20:26:14'),
(1300, 29, 71, '2020-05-26 11:03:14'),
(806, 29, 72, '2020-05-15 00:55:59'),
(844, 29, 74, '2020-05-15 11:04:29'),
(865, 29, 75, '2020-05-15 11:24:29'),
(1043, 29, 80, '2020-05-18 23:33:59'),
(1057, 29, 80, '2020-05-19 23:58:59'),
(1090, 29, 80, '2020-05-20 04:31:29'),
(1385, 29, 80, '2020-05-28 23:41:14'),
(1394, 29, 80, '2020-05-29 03:34:14'),
(1509, 29, 80, '2020-06-07 02:17:44'),
(1096, 29, 81, '2020-05-20 02:41:29'),
(1153, 29, 82, '2020-05-22 23:38:14'),
(1172, 29, 83, '2020-05-22 20:49:44'),
(1270, 29, 85, '2020-05-25 17:24:44'),
(1312, 29, 85, '2020-05-26 19:59:44'),
(1357, 29, 85, '2020-05-28 16:45:44'),
(1575, 29, 86, '2020-06-10 02:40:14'),
(1584, 29, 87, '2020-06-13 18:59:44'),
(1701, 29, 87, '2020-06-15 18:52:44'),
(1738, 29, 87, '2020-06-16 15:26:44'),
(1781, 29, 87, '2020-06-17 23:39:25'),
(1821, 29, 87, '2020-06-18 19:36:55'),
(1890, 29, 87, '2020-06-19 23:53:24'),
(1980, 29, 87, '2020-06-20 01:28:24'),
(1763, 29, 92, '2020-06-17 19:01:55'),
(1879, 29, 92, '2020-06-18 20:25:08'),
(1925, 29, 92, '2020-06-19 23:53:24'),
(1958, 29, 92, '2020-06-20 09:51:54'),
(1941, 29, 94, '2020-06-19 23:12:24'),
(2005, 29, 94, '2020-06-20 05:57:24'),
(2029, 29, 95, '2020-06-20 23:58:24'),
(2071, 29, 95, '2020-06-21 23:55:08'),
(2092, 29, 95, '2020-06-22 01:01:08'),
(2057, 29, 96, '2020-06-21 22:34:38'),
(2110, 29, 96, '2020-06-22 12:47:11'),
(386, 30, 29, '2020-05-11 13:22:36'),
(552, 30, 29, '2020-05-12 15:12:49'),
(285, 30, 31, '2020-05-09 20:09:28'),
(391, 30, 31, '2020-05-11 13:44:32'),
(395, 30, 33, '2020-05-11 14:01:33'),
(553, 30, 34, '2020-05-12 15:13:00'),
(398, 30, 36, '2020-05-11 18:11:43'),
(554, 30, 36, '2020-05-12 15:13:04'),
(383, 30, 39, '2020-05-11 13:55:00'),
(753, 30, 50, '2020-05-14 15:07:07'),
(555, 30, 53, '2020-05-12 16:26:37'),
(321, 31, 2, '2020-05-10 10:17:39'),
(317, 31, 4, '2020-05-10 10:17:21'),
(284, 31, 11, '2020-05-09 22:54:29'),
(320, 31, 14, '2020-05-10 10:17:35'),
(294, 31, 28, '2020-05-09 23:59:29'),
(301, 31, 28, '2020-05-10 23:59:59'),
(333, 31, 28, '2020-05-11 13:47:59'),
(940, 31, 28, '2020-05-16 23:53:59'),
(949, 31, 28, '2020-05-17 23:55:59'),
(996, 31, 28, '2020-05-18 23:56:59'),
(1069, 31, 28, '2020-05-19 15:11:59'),
(1114, 31, 28, '2020-05-20 15:46:14'),
(1138, 31, 28, '2020-05-22 23:54:44'),
(1184, 31, 28, '2020-05-23 23:52:44'),
(1202, 31, 28, '2020-05-24 23:36:14'),
(1226, 31, 28, '2020-05-25 23:45:14'),
(1295, 31, 28, '2020-05-26 23:47:14'),
(1325, 31, 28, '2020-05-27 23:56:14'),
(1353, 31, 28, '2020-05-28 03:06:44'),
(1423, 31, 28, '2020-05-29 23:54:14'),
(1435, 31, 28, '2020-05-30 23:56:44'),
(1461, 31, 28, '2020-05-31 00:57:44'),
(1534, 31, 28, '2020-06-09 23:25:14'),
(1617, 31, 28, '2020-06-13 22:12:14'),
(1666, 31, 28, '2020-06-14 23:35:44'),
(1679, 31, 28, '2020-06-15 23:25:14'),
(1747, 31, 28, '2020-06-16 02:58:14'),
(1856, 31, 28, '2020-06-18 20:25:08'),
(1912, 31, 28, '2020-06-19 23:28:54'),
(2017, 31, 28, '2020-06-20 04:50:54'),
(318, 31, 29, '2020-05-10 10:17:25'),
(286, 31, 30, '2020-05-09 20:10:59'),
(388, 31, 30, '2020-05-11 23:53:29'),
(464, 31, 30, '2020-05-12 23:47:29'),
(562, 31, 30, '2020-05-13 23:48:29'),
(731, 31, 30, '2020-05-14 20:36:59'),
(830, 31, 30, '2020-05-15 23:47:29'),
(917, 31, 30, '2020-05-16 01:52:29'),
(319, 31, 31, '2020-05-10 10:17:30'),
(309, 31, 32, '2020-05-10 01:38:59'),
(601, 31, 32, '2020-05-13 02:19:29'),
(947, 31, 32, '2020-05-16 21:26:29'),
(1555, 31, 32, '2020-06-10 01:18:44'),
(1628, 31, 32, '2020-06-13 17:34:44'),
(330, 31, 33, '2020-05-10 12:18:35'),
(331, 31, 34, '2020-05-10 12:22:19'),
(339, 31, 35, '2020-05-11 22:48:29'),
(470, 31, 35, '2020-05-12 14:32:29'),
(582, 31, 35, '2020-05-13 22:20:29'),
(740, 31, 35, '2020-05-14 23:58:59'),
(784, 31, 35, '2020-05-15 23:57:29'),
(920, 31, 35, '2020-05-16 12:02:29'),
(980, 31, 35, '2020-05-17 23:56:59'),
(993, 31, 35, '2020-05-18 21:11:29'),
(1250, 31, 35, '2020-05-25 19:38:44'),
(1485, 31, 35, '2020-06-02 20:28:14'),
(367, 31, 37, '2020-05-11 13:30:29'),
(647, 31, 37, '2020-05-13 12:18:59'),
(380, 31, 39, '2020-05-11 13:50:41'),
(428, 31, 46, '2020-05-11 22:46:29'),
(617, 31, 46, '2020-05-13 17:39:59'),
(1242, 31, 46, '2020-05-25 09:22:14'),
(513, 31, 50, '2020-05-12 11:23:11'),
(451, 31, 51, '2020-05-11 23:28:59'),
(666, 31, 56, '2020-05-13 16:10:29'),
(516, 31, 58, '2020-05-12 13:10:59'),
(623, 31, 58, '2020-05-13 10:42:59'),
(548, 31, 60, '2020-05-12 20:41:59'),
(665, 31, 62, '2020-05-13 16:10:03'),
(656, 31, 65, '2020-05-13 14:15:29'),
(681, 31, 66, '2020-05-13 19:59:29'),
(694, 31, 67, '2020-05-13 20:20:59'),
(758, 31, 71, '2020-05-14 23:46:59'),
(798, 31, 71, '2020-05-15 04:38:59'),
(1123, 31, 71, '2020-05-20 20:24:14'),
(1297, 31, 71, '2020-05-26 11:10:44'),
(1450, 31, 71, '2020-05-30 08:54:14'),
(805, 31, 72, '2020-05-15 10:52:59'),
(848, 31, 74, '2020-05-15 11:06:29'),
(1498, 31, 74, '2020-06-04 23:01:44'),
(870, 31, 75, '2020-05-15 11:33:59'),
(1046, 31, 80, '2020-05-18 23:56:29'),
(1050, 31, 80, '2020-05-19 23:57:59'),
(1091, 31, 80, '2020-05-20 04:25:29'),
(1378, 31, 80, '2020-05-28 23:54:44'),
(1402, 31, 80, '2020-05-29 03:19:14'),
(1518, 31, 80, '2020-06-07 02:25:44'),
(1098, 31, 81, '2020-05-20 02:41:59'),
(1150, 31, 82, '2020-05-22 23:39:14'),
(1264, 31, 85, '2020-05-25 17:15:14'),
(1315, 31, 85, '2020-05-26 20:14:14'),
(1365, 31, 85, '2020-05-28 16:43:14'),
(1564, 31, 86, '2020-06-10 02:32:14'),
(1595, 31, 87, '2020-06-13 18:49:14'),
(1691, 31, 87, '2020-06-15 18:46:14'),
(1732, 31, 87, '2020-06-16 15:15:44'),
(1790, 31, 87, '2020-06-17 23:30:25'),
(1832, 31, 87, '2020-06-18 19:50:25'),
(1892, 31, 87, '2020-06-19 20:58:24'),
(2021, 31, 87, '2020-06-20 01:07:54'),
(1643, 31, 90, '2020-06-13 17:12:14'),
(1755, 31, 92, '2020-06-17 19:03:55'),
(1874, 31, 92, '2020-06-18 20:34:08'),
(1919, 31, 92, '2020-06-19 23:44:24'),
(2018, 31, 92, '2020-06-20 09:30:54'),
(1815, 31, 93, '2020-06-18 01:14:55'),
(1947, 31, 94, '2020-06-19 23:36:54'),
(1983, 31, 94, '2020-06-20 01:26:54'),
(2037, 31, 95, '2020-06-20 23:43:54'),
(2078, 31, 95, '2020-06-21 23:58:08'),
(2112, 31, 95, '2020-06-22 00:42:08'),
(2069, 31, 96, '2020-06-21 23:47:08'),
(2087, 31, 96, '2020-06-22 12:38:41'),
(304, 32, 14, '2020-05-10 01:28:20'),
(302, 32, 29, '2020-05-10 01:27:09'),
(1523, 32, 29, '2020-06-07 22:50:54'),
(593, 32, 31, '2020-05-13 01:02:01'),
(357, 32, 33, '2020-05-11 05:28:33'),
(831, 32, 33, '2020-05-15 02:14:48'),
(1247, 32, 33, '2020-05-25 15:19:26'),
(1476, 32, 33, '2020-06-02 10:43:08'),
(1503, 32, 33, '2020-06-07 00:14:43'),
(1647, 32, 33, '2020-06-13 17:20:20'),
(356, 32, 36, '2020-05-11 05:28:44'),
(1649, 32, 43, '2020-06-13 17:20:47'),
(594, 32, 53, '2020-05-13 01:01:46'),
(1648, 32, 76, '2020-06-13 17:20:32'),
(324, 33, 28, '2020-05-10 23:59:29'),
(335, 33, 28, '2020-05-11 14:06:59'),
(941, 33, 28, '2020-05-16 23:55:59'),
(951, 33, 28, '2020-05-17 23:56:29'),
(991, 33, 28, '2020-05-18 23:51:29'),
(1055, 33, 28, '2020-05-19 15:16:29'),
(1110, 33, 28, '2020-05-20 15:41:14'),
(1133, 33, 28, '2020-05-22 23:59:44'),
(1179, 33, 28, '2020-05-23 23:59:14'),
(1199, 33, 28, '2020-05-24 23:36:44'),
(1222, 33, 28, '2020-05-25 23:57:14'),
(1288, 33, 28, '2020-05-26 23:59:44'),
(1334, 33, 28, '2020-05-27 23:57:44'),
(1348, 33, 28, '2020-05-28 03:18:44'),
(1421, 33, 28, '2020-05-29 23:54:44'),
(1428, 33, 28, '2020-05-30 23:59:14'),
(1468, 33, 28, '2020-05-31 00:56:14'),
(1536, 33, 28, '2020-06-09 23:13:44'),
(1612, 33, 28, '2020-06-13 21:56:44'),
(1656, 33, 28, '2020-06-14 23:46:44'),
(1670, 33, 28, '2020-06-15 23:28:14'),
(1715, 33, 28, '2020-06-16 03:00:14'),
(1861, 33, 28, '2020-06-18 20:10:11'),
(1899, 33, 28, '2020-06-19 23:44:24'),
(2013, 33, 28, '2020-06-20 04:55:54'),
(382, 33, 30, '2020-05-11 23:56:29'),
(462, 33, 30, '2020-05-12 23:59:29'),
(567, 33, 30, '2020-05-13 23:45:29'),
(727, 33, 30, '2020-05-14 20:36:29'),
(824, 33, 30, '2020-05-15 23:35:59'),
(907, 33, 30, '2020-05-16 10:33:59'),
(603, 33, 32, '2020-05-13 02:02:59'),
(835, 33, 32, '2020-05-15 02:18:29'),
(1559, 33, 32, '2020-06-10 01:24:14'),
(1620, 33, 32, '2020-06-13 17:44:14'),
(342, 33, 35, '2020-05-11 22:44:59'),
(481, 33, 35, '2020-05-12 15:21:29'),
(573, 33, 35, '2020-05-13 22:35:29'),
(738, 33, 35, '2020-05-14 23:58:29'),
(796, 33, 35, '2020-05-15 23:58:59'),
(902, 33, 35, '2020-05-16 12:01:59'),
(972, 33, 35, '2020-05-17 23:45:59'),
(1005, 33, 35, '2020-05-18 21:05:59'),
(1120, 33, 35, '2020-05-20 15:47:44'),
(1258, 33, 35, '2020-05-25 19:34:14'),
(1488, 33, 35, '2020-06-02 20:36:44'),
(361, 33, 37, '2020-05-11 13:26:59'),
(652, 33, 37, '2020-05-13 12:19:29'),
(425, 33, 46, '2020-05-11 16:17:59'),
(1229, 33, 46, '2020-05-25 09:19:14'),
(440, 33, 49, '2020-05-11 16:12:59'),
(454, 33, 51, '2020-05-11 23:22:29'),
(492, 33, 54, '2020-05-12 03:48:29'),
(631, 33, 58, '2020-05-13 10:43:29'),
(527, 33, 59, '2020-05-12 13:22:29'),
(536, 33, 60, '2020-05-12 20:53:59'),
(710, 33, 66, '2020-05-13 20:33:59'),
(689, 33, 67, '2020-05-13 19:57:59'),
(1409, 33, 67, '2020-05-29 02:25:44'),
(765, 33, 71, '2020-05-14 23:57:29'),
(785, 33, 71, '2020-05-15 04:38:59'),
(1307, 33, 71, '2020-05-26 11:08:44'),
(1446, 33, 71, '2020-05-30 08:57:44'),
(878, 33, 72, '2020-05-15 13:37:29'),
(856, 33, 74, '2020-05-15 11:01:29'),
(867, 33, 75, '2020-05-15 11:30:59'),
(1045, 33, 80, '2020-05-18 23:51:59'),
(1065, 33, 80, '2020-05-19 23:48:59'),
(1088, 33, 80, '2020-05-20 04:28:29'),
(1388, 33, 80, '2020-05-28 23:57:14'),
(1401, 33, 80, '2020-05-29 03:49:44'),
(1507, 33, 80, '2020-06-07 02:03:44'),
(1157, 33, 82, '2020-05-22 23:38:14'),
(1211, 33, 84, '2020-05-24 15:27:44'),
(1269, 33, 85, '2020-05-25 17:20:14'),
(1320, 33, 85, '2020-05-26 20:02:44'),
(1358, 33, 85, '2020-05-28 16:44:44'),
(1562, 33, 86, '2020-06-10 02:38:44'),
(1588, 33, 87, '2020-06-13 18:46:14'),
(1690, 33, 87, '2020-06-15 18:39:44'),
(1734, 33, 87, '2020-06-16 15:26:14'),
(1783, 33, 87, '2020-06-17 23:41:25'),
(1824, 33, 87, '2020-06-18 20:34:38'),
(1884, 33, 87, '2020-06-19 23:28:24'),
(1960, 33, 87, '2020-06-20 01:24:24'),
(1757, 33, 92, '2020-06-17 19:09:25'),
(1877, 33, 92, '2020-06-18 20:24:38'),
(1924, 33, 92, '2020-06-19 23:59:24'),
(2012, 33, 92, '2020-06-20 09:56:54'),
(1811, 33, 93, '2020-06-18 01:10:25'),
(1951, 33, 94, '2020-06-19 23:37:24'),
(1984, 33, 94, '2020-06-20 21:36:24'),
(2046, 33, 95, '2020-06-21 19:48:38'),
(2096, 33, 95, '2020-06-22 01:03:08'),
(2051, 33, 96, '2020-06-21 22:29:08'),
(2118, 33, 96, '2020-06-22 12:27:11'),
(327, 34, 28, '2020-05-10 23:59:59'),
(334, 34, 28, '2020-05-11 14:05:29'),
(945, 34, 28, '2020-05-16 23:57:59'),
(962, 34, 28, '2020-05-17 23:43:59'),
(999, 34, 28, '2020-05-18 23:41:59'),
(1051, 34, 28, '2020-05-19 15:09:29'),
(1116, 34, 28, '2020-05-20 15:49:44'),
(1143, 34, 28, '2020-05-22 23:55:14'),
(1190, 34, 28, '2020-05-23 23:56:44'),
(1194, 34, 28, '2020-05-24 23:41:44'),
(1220, 34, 28, '2020-05-25 23:52:14'),
(1289, 34, 28, '2020-05-26 23:55:44'),
(1337, 34, 28, '2020-05-27 23:53:14'),
(1344, 34, 28, '2020-05-28 03:04:44'),
(1420, 34, 28, '2020-05-29 23:57:14'),
(1434, 34, 28, '2020-05-30 23:54:44'),
(1462, 34, 28, '2020-05-31 01:00:44'),
(1541, 34, 28, '2020-06-09 23:58:44'),
(1624, 34, 28, '2020-06-13 22:31:44'),
(1659, 34, 28, '2020-06-14 23:50:44'),
(1669, 34, 28, '2020-06-15 23:37:44'),
(1746, 34, 28, '2020-06-16 02:48:44'),
(1864, 34, 28, '2020-06-18 20:26:38'),
(1914, 34, 28, '2020-06-19 23:27:54'),
(2009, 34, 28, '2020-06-20 04:39:24'),
(384, 34, 30, '2020-05-11 23:51:59'),
(463, 34, 30, '2020-05-12 23:51:59'),
(571, 34, 30, '2020-05-13 23:59:29'),
(723, 34, 30, '2020-05-14 20:35:59'),
(825, 34, 30, '2020-05-15 23:49:29'),
(901, 34, 30, '2020-05-16 01:41:29'),
(598, 34, 32, '2020-05-13 02:18:29'),
(1548, 34, 32, '2020-06-10 01:27:14'),
(1622, 34, 32, '2020-06-13 17:56:44'),
(347, 34, 35, '2020-05-11 22:47:59'),
(480, 34, 35, '2020-05-12 14:33:59'),
(587, 34, 35, '2020-05-13 22:25:29'),
(746, 34, 35, '2020-05-14 23:58:29'),
(782, 34, 35, '2020-05-15 23:59:59'),
(906, 34, 35, '2020-05-16 12:03:29'),
(978, 34, 35, '2020-05-17 23:59:29'),
(1010, 34, 35, '2020-05-18 21:07:29'),
(1253, 34, 35, '2020-05-25 19:28:44'),
(1373, 34, 35, '2020-05-28 14:36:44'),
(1487, 34, 35, '2020-06-02 20:28:44'),
(365, 34, 37, '2020-05-11 13:30:29'),
(644, 34, 37, '2020-05-13 12:10:29'),
(423, 34, 46, '2020-05-11 22:45:29'),
(610, 34, 46, '2020-05-13 17:40:59'),
(1238, 34, 46, '2020-05-25 09:21:44'),
(457, 34, 51, '2020-05-11 23:29:29'),
(621, 34, 58, '2020-05-13 10:39:29'),
(547, 34, 60, '2020-05-12 20:44:29'),
(669, 34, 66, '2020-05-13 20:26:59'),
(715, 34, 67, '2020-05-13 19:55:59'),
(764, 34, 71, '2020-05-14 23:40:59'),
(789, 34, 71, '2020-05-15 04:36:59'),
(1124, 34, 71, '2020-05-20 20:23:14'),
(1303, 34, 71, '2020-05-26 11:05:14'),
(1444, 34, 71, '2020-05-30 08:50:14'),
(807, 34, 72, '2020-05-15 00:55:59'),
(851, 34, 74, '2020-05-15 11:35:29'),
(1499, 34, 74, '2020-06-04 23:02:14'),
(874, 34, 75, '2020-05-15 11:25:59'),
(1039, 34, 80, '2020-05-18 23:50:29'),
(1068, 34, 80, '2020-05-19 22:23:29'),
(1079, 34, 80, '2020-05-20 04:25:59'),
(1387, 34, 80, '2020-05-28 23:54:14'),
(1395, 34, 80, '2020-05-29 03:41:44'),
(1508, 34, 80, '2020-06-07 02:15:14'),
(1160, 34, 82, '2020-05-22 23:35:44'),
(1259, 34, 85, '2020-05-25 17:21:44'),
(1319, 34, 85, '2020-05-26 20:10:44'),
(1359, 34, 85, '2020-05-28 16:28:44'),
(1573, 34, 86, '2020-06-10 02:35:14'),
(1596, 34, 87, '2020-06-13 18:39:14'),
(1694, 34, 87, '2020-06-15 19:54:14'),
(1737, 34, 87, '2020-06-16 13:36:44'),
(1784, 34, 87, '2020-06-17 23:37:55'),
(1828, 34, 87, '2020-06-18 20:26:38'),
(1891, 34, 87, '2020-06-19 23:44:24'),
(1966, 34, 87, '2020-06-20 01:27:24'),
(1638, 34, 90, '2020-06-13 17:10:44'),
(1767, 34, 92, '2020-06-17 19:04:55'),
(1867, 34, 92, '2020-06-18 20:11:11'),
(1931, 34, 92, '2020-06-19 23:55:24'),
(1988, 34, 92, '2020-06-20 09:36:54'),
(1813, 34, 93, '2020-06-18 01:17:25'),
(1946, 34, 94, '2020-06-19 23:35:54'),
(1995, 34, 94, '2020-06-20 01:33:54'),
(2030, 34, 95, '2020-06-20 23:38:54'),
(2074, 34, 95, '2020-06-21 23:50:38'),
(2101, 34, 95, '2020-06-22 01:02:08'),
(2053, 34, 96, '2020-06-21 22:29:38'),
(2106, 34, 96, '2020-06-22 12:40:41'),
(341, 35, 14, '2020-05-11 00:54:14'),
(417, 35, 29, '2020-05-11 15:02:37'),
(1021, 35, 29, '2020-05-18 21:06:21'),
(338, 35, 31, '2020-05-11 13:19:50'),
(702, 35, 31, '2020-05-13 19:55:52'),
(737, 35, 31, '2020-05-14 14:00:57'),
(337, 35, 33, '2020-05-11 00:53:53'),
(861, 35, 33, '2020-05-15 11:15:33'),
(340, 35, 34, '2020-05-11 00:52:49'),
(1022, 35, 34, '2020-05-18 21:06:37'),
(348, 35, 36, '2020-05-11 01:11:13'),
(378, 35, 39, '2020-05-11 22:17:25'),
(699, 35, 39, '2020-05-13 16:48:46'),
(411, 35, 43, '2020-05-11 14:48:16'),
(413, 35, 45, '2020-05-11 15:03:12'),
(863, 35, 45, '2020-05-15 11:16:15'),
(443, 35, 50, '2020-05-11 22:37:13'),
(709, 35, 50, '2020-05-13 18:58:41'),
(862, 35, 50, '2020-05-15 11:16:02'),
(477, 35, 52, '2020-05-12 02:17:56'),
(505, 35, 53, '2020-05-12 15:20:19'),
(572, 35, 53, '2020-05-13 21:52:32'),
(749, 35, 53, '2020-05-14 14:10:22'),
(924, 35, 53, '2020-05-16 00:12:36'),
(1020, 35, 53, '2020-05-18 21:06:15'),
(1248, 35, 53, '2020-05-25 15:49:39'),
(550, 35, 56, '2020-05-12 14:23:21'),
(576, 35, 56, '2020-05-13 17:33:21'),
(583, 35, 61, '2020-05-13 20:52:11'),
(1477, 35, 61, '2020-06-02 14:45:41'),
(662, 35, 62, '2020-05-13 21:52:26'),
(754, 35, 62, '2020-05-14 21:25:44'),
(894, 35, 62, '2020-05-15 20:30:56'),
(1019, 35, 62, '2020-05-18 09:41:46'),
(1369, 35, 62, '2020-05-28 14:33:41'),
(896, 35, 76, '2020-05-15 21:38:04'),
(355, 36, 28, '2020-05-11 14:05:59'),
(943, 36, 28, '2020-05-16 23:57:29'),
(956, 36, 28, '2020-05-17 23:38:29'),
(1012, 36, 28, '2020-05-18 23:59:29'),
(1063, 36, 28, '2020-05-19 15:01:59'),
(1113, 36, 28, '2020-05-20 15:42:44'),
(1140, 36, 28, '2020-05-22 23:44:44'),
(1176, 36, 28, '2020-05-23 23:50:14'),
(1204, 36, 28, '2020-05-24 23:44:44'),
(1223, 36, 28, '2020-05-25 23:53:14'),
(1285, 36, 28, '2020-05-26 23:53:44'),
(1332, 36, 28, '2020-05-27 23:59:44'),
(1349, 36, 28, '2020-05-28 03:16:14'),
(1425, 36, 28, '2020-05-29 23:59:44'),
(1437, 36, 28, '2020-05-30 23:51:44'),
(1467, 36, 28, '2020-05-31 00:59:44'),
(1530, 36, 28, '2020-06-09 23:25:14'),
(1610, 36, 28, '2020-06-13 22:53:44'),
(1668, 36, 28, '2020-06-14 23:53:44'),
(1681, 36, 28, '2020-06-15 23:27:14'),
(1718, 36, 28, '2020-06-16 03:01:44'),
(1776, 36, 28, '2020-06-17 19:58:55'),
(1858, 36, 28, '2020-06-18 20:30:08'),
(1910, 36, 28, '2020-06-19 23:44:24'),
(2008, 36, 28, '2020-06-20 04:53:24'),
(387, 36, 30, '2020-05-11 23:59:29'),
(461, 36, 30, '2020-05-12 23:53:59'),
(561, 36, 30, '2020-05-13 23:50:59'),
(728, 36, 30, '2020-05-14 20:29:29'),
(828, 36, 30, '2020-05-15 23:59:29'),
(904, 36, 30, '2020-05-16 01:54:29'),
(595, 36, 32, '2020-05-13 02:11:29'),
(1227, 36, 32, '2020-05-25 02:58:44'),
(1556, 36, 32, '2020-06-10 01:22:44'),
(1645, 36, 32, '2020-06-13 17:57:14'),
(349, 36, 35, '2020-05-11 22:51:29'),
(482, 36, 35, '2020-05-12 15:22:29'),
(577, 36, 35, '2020-05-13 22:41:29'),
(748, 36, 35, '2020-05-14 23:55:59'),
(792, 36, 35, '2020-05-15 23:52:59'),
(909, 36, 35, '2020-05-16 12:03:29'),
(969, 36, 35, '2020-05-17 23:50:29'),
(1004, 36, 35, '2020-05-18 21:09:59'),
(1256, 36, 35, '2020-05-25 19:38:44'),
(1479, 36, 35, '2020-06-02 20:28:14'),
(1579, 36, 35, '2020-06-13 12:47:14'),
(362, 36, 37, '2020-05-11 13:28:59'),
(432, 36, 46, '2020-05-11 15:47:29'),
(434, 36, 49, '2020-05-11 16:12:29'),
(446, 36, 51, '2020-05-11 23:09:29'),
(502, 36, 54, '2020-05-12 03:49:29'),
(524, 36, 58, '2020-05-12 13:11:59'),
(632, 36, 58, '2020-05-13 10:37:29'),
(529, 36, 59, '2020-05-12 13:22:59'),
(544, 36, 60, '2020-05-12 20:54:59'),
(661, 36, 65, '2020-05-13 14:16:29'),
(678, 36, 66, '2020-05-13 20:14:59'),
(690, 36, 67, '2020-05-13 20:21:29'),
(1408, 36, 67, '2020-05-29 02:25:44'),
(761, 36, 71, '2020-05-14 23:32:59'),
(778, 36, 71, '2020-05-15 04:38:29'),
(1304, 36, 71, '2020-05-26 11:07:14'),
(1447, 36, 71, '2020-05-30 08:58:44'),
(840, 36, 73, '2020-05-15 10:40:59'),
(857, 36, 74, '2020-05-15 11:02:59'),
(871, 36, 75, '2020-05-15 11:33:29'),
(1025, 36, 80, '2020-05-18 23:58:29'),
(1059, 36, 80, '2020-05-19 23:51:59'),
(1078, 36, 80, '2020-05-20 04:15:59'),
(1390, 36, 80, '2020-05-28 23:45:14'),
(1406, 36, 80, '2020-05-29 03:50:14'),
(1512, 36, 80, '2020-06-07 02:24:14'),
(1156, 36, 82, '2020-05-22 23:37:14'),
(1577, 36, 83, '2020-06-10 20:10:44'),
(1213, 36, 84, '2020-05-24 15:28:14'),
(1246, 36, 84, '2020-05-25 14:36:14'),
(1274, 36, 85, '2020-05-25 17:24:14'),
(1322, 36, 85, '2020-05-26 20:16:14'),
(1360, 36, 85, '2020-05-28 16:36:14'),
(1565, 36, 86, '2020-06-10 02:32:14'),
(1591, 36, 87, '2020-06-13 19:10:14'),
(1698, 36, 87, '2020-06-15 18:59:44'),
(1733, 36, 87, '2020-06-16 15:29:44'),
(1779, 36, 87, '2020-06-17 23:34:25'),
(1835, 36, 87, '2020-06-18 20:35:08'),
(1895, 36, 87, '2020-06-19 23:58:24'),
(1967, 36, 87, '2020-06-20 01:14:24'),
(1768, 36, 92, '2020-06-17 18:59:55'),
(1871, 36, 92, '2020-06-18 20:26:08'),
(1927, 36, 92, '2020-06-19 23:56:24'),
(1961, 36, 92, '2020-06-20 10:11:54'),
(1817, 36, 93, '2020-06-18 01:17:55'),
(1944, 36, 94, '2020-06-19 23:30:24'),
(2006, 36, 94, '2020-06-20 01:36:54'),
(2036, 36, 95, '2020-06-20 23:54:24'),
(2042, 36, 95, '2020-06-21 23:58:08'),
(2091, 36, 95, '2020-06-22 01:01:38'),
(2066, 36, 96, '2020-06-21 22:40:38'),
(2105, 36, 96, '2020-06-22 12:35:41'),
(364, 37, 14, '2020-05-11 12:57:31'),
(359, 37, 31, '2020-05-11 12:57:57'),
(366, 37, 33, '2020-05-11 12:58:21'),
(371, 37, 34, '2020-05-11 13:04:37'),
(360, 37, 36, '2020-05-11 12:58:09'),
(372, 37, 39, '2020-05-11 13:18:12'),
(377, 38, 28, '2020-05-11 14:06:59'),
(942, 38, 28, '2020-05-16 23:58:59'),
(950, 38, 28, '2020-05-17 23:58:29'),
(1009, 38, 28, '2020-05-18 23:53:59'),
(1073, 38, 28, '2020-05-19 15:19:59'),
(1106, 38, 28, '2020-05-20 15:43:44'),
(1139, 38, 28, '2020-05-22 23:56:14'),
(1175, 38, 28, '2020-05-23 23:55:14'),
(1203, 38, 28, '2020-05-24 23:49:14'),
(1224, 38, 28, '2020-05-25 23:55:14'),
(1281, 38, 28, '2020-05-26 23:58:44'),
(1335, 38, 28, '2020-05-27 23:46:14'),
(1342, 38, 28, '2020-05-28 03:14:44'),
(1422, 38, 28, '2020-05-29 23:58:14'),
(1439, 38, 28, '2020-05-30 23:58:44'),
(1458, 38, 28, '2020-05-31 00:51:14'),
(1537, 38, 28, '2020-06-09 23:59:44'),
(1603, 38, 28, '2020-06-13 22:46:14'),
(1661, 38, 28, '2020-06-14 23:45:14'),
(1676, 38, 28, '2020-06-15 22:56:44'),
(1717, 38, 28, '2020-06-16 02:54:14'),
(1778, 38, 28, '2020-06-17 19:13:25'),
(1851, 38, 28, '2020-06-18 19:57:41'),
(1909, 38, 28, '2020-06-19 23:29:54'),
(1990, 38, 28, '2020-06-20 04:55:24'),
(385, 38, 30, '2020-05-11 23:41:59'),
(459, 38, 30, '2020-05-12 23:59:29'),
(566, 38, 30, '2020-05-13 23:37:59'),
(725, 38, 30, '2020-05-14 20:13:59'),
(821, 38, 30, '2020-05-15 23:41:29'),
(926, 38, 30, '2020-05-16 01:55:29'),
(605, 38, 32, '2020-05-13 02:11:59'),
(836, 38, 32, '2020-05-15 02:17:59'),
(1549, 38, 32, '2020-06-10 01:23:44'),
(1632, 38, 32, '2020-06-13 17:42:14'),
(376, 38, 35, '2020-05-11 22:50:59'),
(483, 38, 35, '2020-05-12 14:33:29'),
(579, 38, 35, '2020-05-13 22:39:59'),
(742, 38, 35, '2020-05-14 23:43:59'),
(787, 38, 35, '2020-05-15 23:54:29'),
(903, 38, 35, '2020-05-16 11:59:29'),
(973, 38, 35, '2020-05-17 23:56:59'),
(1001, 38, 35, '2020-05-18 17:36:29'),
(1255, 38, 35, '2020-05-25 19:35:14'),
(1489, 38, 35, '2020-06-02 20:34:14'),
(375, 38, 37, '2020-05-11 13:24:59'),
(649, 38, 37, '2020-05-13 12:14:59'),
(412, 38, 44, '2020-05-11 14:48:29'),
(429, 38, 46, '2020-05-11 15:59:59'),
(613, 38, 46, '2020-05-13 17:43:29'),
(1234, 38, 46, '2020-05-25 09:20:14'),
(439, 38, 49, '2020-05-11 16:13:29'),
(456, 38, 51, '2020-05-11 23:23:29'),
(630, 38, 58, '2020-05-13 10:41:59'),
(535, 38, 60, '2020-05-12 20:09:29'),
(684, 38, 66, '2020-05-13 20:39:29'),
(770, 38, 71, '2020-05-14 23:54:59'),
(775, 38, 71, '2020-05-15 04:45:59'),
(1306, 38, 71, '2020-05-26 11:08:14'),
(1451, 38, 71, '2020-05-30 08:54:14'),
(808, 38, 72, '2020-05-15 01:00:29'),
(841, 38, 73, '2020-05-15 10:41:59'),
(849, 38, 74, '2020-05-15 10:56:59'),
(875, 38, 75, '2020-05-15 11:27:59'),
(1040, 38, 80, '2020-05-18 23:51:29'),
(1067, 38, 80, '2020-05-19 23:47:59'),
(1080, 38, 80, '2020-05-20 04:30:29'),
(1380, 38, 80, '2020-05-28 23:48:14'),
(1397, 38, 80, '2020-05-29 03:43:44'),
(1515, 38, 80, '2020-06-07 02:24:44'),
(1161, 38, 82, '2020-05-22 23:39:44'),
(1207, 38, 84, '2020-05-24 15:26:14'),
(1272, 38, 85, '2020-05-25 17:22:14'),
(1321, 38, 85, '2020-05-26 20:06:14'),
(1363, 38, 85, '2020-05-28 16:25:44'),
(1571, 38, 86, '2020-06-10 02:23:14'),
(1581, 38, 87, '2020-06-13 18:50:14'),
(1693, 38, 87, '2020-06-15 19:01:44'),
(1724, 38, 87, '2020-06-16 15:29:14'),
(1791, 38, 87, '2020-06-17 23:31:55'),
(1831, 38, 87, '2020-06-18 20:30:08'),
(1897, 38, 87, '2020-06-19 23:50:54'),
(1975, 38, 87, '2020-06-20 01:12:54'),
(1756, 38, 92, '2020-06-17 19:55:55'),
(1870, 38, 92, '2020-06-18 20:30:38'),
(1932, 38, 92, '2020-06-19 23:55:24'),
(1962, 38, 92, '2020-06-20 09:57:24'),
(1812, 38, 93, '2020-06-18 01:10:25'),
(1952, 38, 94, '2020-06-19 23:37:24'),
(2016, 38, 94, '2020-06-20 22:15:24'),
(2034, 38, 95, '2020-06-20 23:49:54'),
(2075, 38, 95, '2020-06-21 23:51:38'),
(2089, 38, 95, '2020-06-22 00:42:38'),
(2060, 38, 96, '2020-06-21 22:38:38'),
(2094, 38, 96, '2020-06-22 12:47:41'),
(374, 39, 28, '2020-05-11 14:04:59'),
(938, 39, 28, '2020-05-16 23:57:59'),
(954, 39, 28, '2020-05-17 23:53:59'),
(1003, 39, 28, '2020-05-18 23:58:29'),
(1056, 39, 28, '2020-05-19 15:19:59'),
(1108, 39, 28, '2020-05-20 15:43:14'),
(1142, 39, 28, '2020-05-22 23:55:44'),
(1181, 39, 28, '2020-05-23 23:42:44'),
(1192, 39, 28, '2020-05-24 23:50:44'),
(1216, 39, 28, '2020-05-25 23:54:44'),
(1282, 39, 28, '2020-05-26 23:53:14'),
(1330, 39, 28, '2020-05-27 23:55:14'),
(1350, 39, 28, '2020-05-28 03:05:44'),
(1417, 39, 28, '2020-05-29 23:56:14'),
(1442, 39, 28, '2020-05-30 23:53:44'),
(1459, 39, 28, '2020-05-31 00:42:14'),
(1540, 39, 28, '2020-06-09 23:23:44'),
(1613, 39, 28, '2020-06-13 22:59:44'),
(1658, 39, 28, '2020-06-14 23:52:14'),
(1674, 39, 28, '2020-06-15 23:52:44'),
(1713, 39, 28, '2020-06-16 03:00:14'),
(1777, 39, 28, '2020-06-17 19:13:25'),
(1863, 39, 28, '2020-06-18 20:14:11'),
(1904, 39, 28, '2020-06-19 23:14:54'),
(1979, 39, 28, '2020-06-20 04:52:24'),
(370, 39, 29, '2020-05-11 13:30:11'),
(389, 39, 30, '2020-05-11 23:59:59'),
(458, 39, 30, '2020-05-12 23:57:59'),
(560, 39, 30, '2020-05-13 23:55:59'),
(730, 39, 30, '2020-05-14 20:22:59'),
(829, 39, 30, '2020-05-15 23:48:59'),
(919, 39, 30, '2020-05-16 01:55:59'),
(368, 39, 31, '2020-05-11 13:30:08'),
(476, 39, 31, '2020-05-12 02:08:44'),
(597, 39, 32, '2020-05-13 02:07:29'),
(1544, 39, 32, '2020-06-10 01:23:14'),
(1631, 39, 32, '2020-06-13 17:26:14'),
(369, 39, 33, '2020-05-11 13:30:05'),
(471, 39, 33, '2020-05-12 01:58:54'),
(930, 39, 33, '2020-05-16 10:02:03'),
(1502, 39, 33, '2020-06-06 00:52:23'),
(392, 39, 34, '2020-05-11 13:37:57'),
(489, 39, 34, '2020-05-12 02:50:55'),
(379, 39, 35, '2020-05-11 22:40:29'),
(478, 39, 35, '2020-05-12 17:14:29'),
(574, 39, 35, '2020-05-13 22:28:29'),
(739, 39, 35, '2020-05-14 23:49:29'),
(794, 39, 35, '2020-05-15 23:53:29'),
(916, 39, 35, '2020-05-16 12:02:29'),
(976, 39, 35, '2020-05-17 23:44:59'),
(1011, 39, 35, '2020-05-18 21:07:29'),
(1252, 39, 35, '2020-05-25 19:35:44'),
(1374, 39, 35, '2020-05-28 14:38:14'),
(1486, 39, 35, '2020-06-02 20:26:14'),
(390, 39, 36, '2020-05-11 13:37:41'),
(472, 39, 36, '2020-05-12 02:00:14'),
(373, 39, 37, '2020-05-11 13:27:59'),
(393, 39, 38, '2020-05-11 16:39:00'),
(475, 39, 39, '2020-05-12 02:08:27'),
(399, 39, 41, '2020-05-11 23:42:41'),
(441, 39, 43, '2020-05-11 17:51:17'),
(406, 39, 44, '2020-05-11 14:46:29'),
(474, 39, 45, '2020-05-12 02:32:12'),
(427, 39, 46, '2020-05-11 18:36:29'),
(704, 39, 46, '2020-05-13 17:41:29'),
(433, 39, 48, '2020-05-11 15:56:29'),
(484, 39, 50, '2020-05-12 02:32:07'),
(450, 39, 51, '2020-05-11 23:27:59'),
(473, 39, 52, '2020-05-12 11:59:12'),
(641, 39, 52, '2020-05-13 11:57:29'),
(490, 39, 53, '2020-05-12 20:30:15'),
(640, 39, 53, '2020-05-13 11:57:17'),
(514, 39, 56, '2020-05-12 11:59:22'),
(522, 39, 58, '2020-05-12 13:11:29'),
(625, 39, 58, '2020-05-13 09:36:59'),
(545, 39, 60, '2020-05-12 20:39:29'),
(642, 39, 61, '2020-05-13 11:57:37'),
(703, 39, 66, '2020-05-13 20:29:29'),
(675, 39, 67, '2020-05-13 19:57:29'),
(757, 39, 70, '2020-05-14 17:30:29'),
(767, 39, 71, '2020-05-14 23:59:29'),
(788, 39, 71, '2020-05-15 04:42:59'),
(1298, 39, 71, '2020-05-26 11:06:44'),
(1454, 39, 71, '2020-05-30 08:56:14'),
(858, 39, 74, '2020-05-15 11:05:59'),
(868, 39, 75, '2020-05-15 11:19:59'),
(1035, 39, 80, '2020-05-18 23:57:29'),
(1066, 39, 80, '2020-05-19 23:52:59'),
(1089, 39, 80, '2020-05-20 04:28:59'),
(1384, 39, 80, '2020-05-28 23:57:14'),
(1398, 39, 80, '2020-05-29 03:50:44'),
(1516, 39, 80, '2020-06-07 02:17:14'),
(1103, 39, 81, '2020-05-20 02:42:59'),
(1146, 39, 82, '2020-05-22 23:38:44'),
(1173, 39, 83, '2020-05-22 20:50:44'),
(1208, 39, 84, '2020-05-24 15:26:14'),
(1263, 39, 85, '2020-05-25 17:24:14'),
(1318, 39, 85, '2020-05-26 20:08:14'),
(1367, 39, 85, '2020-05-28 16:45:14'),
(1566, 39, 86, '2020-06-10 02:36:44'),
(1589, 39, 87, '2020-06-13 19:05:44'),
(1696, 39, 87, '2020-06-15 19:01:44'),
(1741, 39, 87, '2020-06-16 15:17:44'),
(1786, 39, 87, '2020-06-17 23:30:25'),
(1826, 39, 87, '2020-06-18 20:29:38'),
(1896, 39, 87, '2020-06-19 23:55:54'),
(1956, 39, 87, '2020-06-20 01:25:24'),
(1640, 39, 90, '2020-06-13 17:10:44'),
(1765, 39, 92, '2020-06-17 19:05:55'),
(1869, 39, 92, '2020-06-18 20:35:08'),
(1917, 39, 92, '2020-06-19 23:56:24'),
(1974, 39, 92, '2020-06-20 09:47:54'),
(1807, 39, 93, '2020-06-18 01:14:55'),
(1949, 39, 94, '2020-06-19 23:25:54'),
(2010, 39, 94, '2020-06-20 21:36:54'),
(2041, 39, 95, '2020-06-20 23:58:24'),
(2044, 39, 95, '2020-06-21 23:57:38'),
(2121, 39, 95, '2020-06-22 01:04:08'),
(2054, 39, 96, '2020-06-21 22:35:38'),
(2090, 39, 96, '2020-06-22 12:50:41'),
(1471, 42, 29, '2020-05-31 20:56:17'),
(396, 42, 31, '2020-05-11 14:31:45'),
(468, 42, 33, '2020-05-12 02:24:28'),
(735, 42, 33, '2020-05-14 00:43:02'),
(964, 42, 34, '2020-05-17 00:59:25'),
(1495, 42, 34, '2020-06-03 22:36:50'),
(397, 42, 36, '2020-05-11 14:32:01'),
(966, 42, 36, '2020-05-17 00:59:33'),
(965, 42, 38, '2020-05-17 00:59:30'),
(967, 42, 43, '2020-05-17 00:59:36'),
(736, 42, 45, '2020-05-14 00:43:57'),
(968, 42, 45, '2020-05-17 00:59:41'),
(1494, 42, 45, '2020-06-03 22:36:43'),
(963, 42, 50, '2020-05-17 00:59:17'),
(1493, 42, 50, '2020-06-03 22:36:32'),
(932, 43, 28, '2020-05-16 23:57:29'),
(960, 43, 28, '2020-05-17 23:55:29'),
(995, 43, 28, '2020-05-18 23:52:59'),
(1072, 43, 28, '2020-05-19 15:11:29'),
(1111, 43, 28, '2020-05-20 15:50:44'),
(1137, 43, 28, '2020-05-22 23:57:44'),
(1188, 43, 28, '2020-05-23 23:50:14'),
(1198, 43, 28, '2020-05-24 23:45:44'),
(1243, 43, 28, '2020-05-25 23:54:44'),
(1286, 43, 28, '2020-05-26 23:53:44'),
(1324, 43, 28, '2020-05-27 23:50:44'),
(1346, 43, 28, '2020-05-28 03:14:14'),
(1413, 43, 28, '2020-05-29 23:46:14'),
(1438, 43, 28, '2020-05-30 23:54:44'),
(1457, 43, 28, '2020-05-31 01:02:44'),
(1526, 43, 28, '2020-06-09 23:22:14'),
(1606, 43, 28, '2020-06-13 22:41:44'),
(1663, 43, 28, '2020-06-14 23:34:14'),
(1685, 43, 28, '2020-06-15 23:10:44'),
(1719, 43, 28, '2020-06-16 03:01:44'),
(1770, 43, 28, '2020-06-17 19:11:25'),
(1859, 43, 28, '2020-06-18 20:34:38'),
(1907, 43, 28, '2020-06-19 23:35:24'),
(1964, 43, 28, '2020-06-20 04:56:24'),
(410, 43, 30, '2020-05-11 23:57:29'),
(467, 43, 30, '2020-05-12 23:48:29'),
(565, 43, 30, '2020-05-13 23:50:29'),
(721, 43, 30, '2020-05-14 20:26:29'),
(823, 43, 30, '2020-05-15 23:59:29'),
(913, 43, 30, '2020-05-16 01:55:59'),
(602, 43, 32, '2020-05-13 02:17:59'),
(834, 43, 32, '2020-05-15 02:18:59'),
(1521, 43, 32, '2020-06-07 22:50:44'),
(1547, 43, 32, '2020-06-10 01:27:14'),
(1625, 43, 32, '2020-06-13 17:44:14'),
(404, 43, 35, '2020-05-11 22:48:29'),
(485, 43, 35, '2020-05-12 09:58:29'),
(578, 43, 35, '2020-05-13 22:39:59'),
(743, 43, 35, '2020-05-14 23:53:29'),
(773, 43, 35, '2020-05-15 23:53:59'),
(905, 43, 35, '2020-05-16 11:53:59'),
(982, 43, 35, '2020-05-17 23:59:59'),
(1007, 43, 35, '2020-05-18 21:06:59'),
(1254, 43, 35, '2020-05-25 19:12:44'),
(1371, 43, 35, '2020-05-28 14:38:14'),
(1480, 43, 35, '2020-06-02 20:34:44'),
(1580, 43, 35, '2020-06-13 12:47:14'),
(1751, 43, 35, '2020-06-17 16:28:25'),
(648, 43, 37, '2020-05-13 12:12:59'),
(405, 43, 44, '2020-05-11 14:46:59'),
(426, 43, 46, '2020-05-11 16:13:59'),
(705, 43, 46, '2020-05-13 17:42:59'),
(1077, 43, 46, '2020-05-19 22:26:59'),
(437, 43, 49, '2020-05-11 16:10:59'),
(447, 43, 51, '2020-05-11 23:21:59'),
(499, 43, 54, '2020-05-12 03:48:59'),
(523, 43, 58, '2020-05-12 13:10:59'),
(624, 43, 58, '2020-05-13 10:43:29'),
(533, 43, 60, '2020-05-12 20:41:29'),
(657, 43, 65, '2020-05-13 14:14:59'),
(673, 43, 66, '2020-05-13 20:34:59'),
(816, 43, 66, '2020-05-15 01:54:29'),
(1122, 43, 66, '2020-05-20 17:38:14'),
(683, 43, 67, '2020-05-13 16:18:29'),
(769, 43, 71, '2020-05-14 23:49:59'),
(786, 43, 71, '2020-05-15 04:47:59'),
(1125, 43, 71, '2020-05-20 20:24:14'),
(1301, 43, 71, '2020-05-26 11:03:14'),
(1445, 43, 71, '2020-05-30 08:49:44'),
(801, 43, 72, '2020-05-15 01:03:29'),
(847, 43, 74, '2020-05-15 11:06:59'),
(1497, 43, 74, '2020-06-04 23:01:44'),
(873, 43, 75, '2020-05-15 11:27:29'),
(1041, 43, 80, '2020-05-18 23:58:59'),
(1053, 43, 80, '2020-05-19 22:57:59'),
(1082, 43, 80, '2020-05-20 04:28:59'),
(1386, 43, 80, '2020-05-28 23:56:14'),
(1405, 43, 80, '2020-05-29 03:18:44'),
(1517, 43, 80, '2020-06-07 02:26:14'),
(1095, 43, 81, '2020-05-20 02:42:29'),
(1152, 43, 82, '2020-05-22 23:36:44'),
(1267, 43, 85, '2020-05-25 17:08:14'),
(1313, 43, 85, '2020-05-26 19:50:14'),
(1356, 43, 85, '2020-05-28 16:15:14'),
(1563, 43, 86, '2020-06-10 02:32:44'),
(1585, 43, 87, '2020-06-13 18:48:44'),
(1699, 43, 87, '2020-06-15 18:55:44'),
(1735, 43, 87, '2020-06-16 13:27:44'),
(1782, 43, 87, '2020-06-17 23:40:25'),
(1827, 43, 87, '2020-06-18 20:33:38'),
(1887, 43, 87, '2020-06-19 23:51:54'),
(1987, 43, 87, '2020-06-20 01:23:54'),
(1761, 43, 92, '2020-06-17 19:10:25'),
(1872, 43, 92, '2020-06-18 20:31:08'),
(1915, 43, 92, '2020-06-19 23:57:54'),
(1977, 43, 92, '2020-06-20 09:31:24'),
(1810, 43, 93, '2020-06-18 01:08:55'),
(1942, 43, 94, '2020-06-19 23:24:24'),
(2007, 43, 94, '2020-06-20 21:37:24'),
(2032, 43, 95, '2020-06-20 23:51:24'),
(2068, 43, 95, '2020-06-21 20:04:08'),
(2119, 43, 95, '2020-06-22 00:58:08'),
(2058, 43, 96, '2020-06-21 22:41:38'),
(2093, 43, 96, '2020-06-22 12:37:11'),
(408, 44, 14, '2020-05-11 14:47:47'),
(407, 44, 31, '2020-05-11 14:46:56'),
(402, 44, 33, '2020-05-11 14:47:57'),
(403, 44, 36, '2020-05-11 14:48:39'),
(400, 44, 39, '2020-05-11 14:46:02'),
(401, 44, 43, '2020-05-11 14:46:07'),
(934, 45, 28, '2020-05-16 23:52:59'),
(957, 45, 28, '2020-05-17 23:55:59'),
(1000, 45, 28, '2020-05-18 23:43:29'),
(1052, 45, 28, '2020-05-19 15:21:29'),
(1115, 45, 28, '2020-05-20 15:50:14'),
(1134, 45, 28, '2020-05-22 23:59:44'),
(1182, 45, 28, '2020-05-23 23:45:44'),
(1196, 45, 28, '2020-05-24 23:42:14'),
(1214, 45, 28, '2020-05-25 23:58:44'),
(1293, 45, 28, '2020-05-26 23:57:14'),
(1336, 45, 28, '2020-05-27 23:52:14'),
(1345, 45, 28, '2020-05-28 03:15:14'),
(1415, 45, 28, '2020-05-29 23:51:44'),
(1429, 45, 28, '2020-05-30 23:56:44'),
(1469, 45, 28, '2020-05-31 00:59:44'),
(1538, 45, 28, '2020-06-09 23:23:44'),
(1614, 45, 28, '2020-06-13 23:01:44'),
(1657, 45, 28, '2020-06-14 23:49:44'),
(1678, 45, 28, '2020-06-15 23:58:14'),
(1711, 45, 28, '2020-06-16 02:49:44'),
(1773, 45, 28, '2020-06-17 19:57:55'),
(1848, 45, 28, '2020-06-18 20:27:38'),
(1911, 45, 28, '2020-06-19 23:28:54'),
(1991, 45, 28, '2020-06-20 04:56:54'),
(416, 45, 30, '2020-05-11 23:58:29'),
(460, 45, 30, '2020-05-12 23:41:59'),
(559, 45, 30, '2020-05-13 23:51:29'),
(733, 45, 30, '2020-05-14 20:34:59'),
(822, 45, 30, '2020-05-15 23:41:59'),
(911, 45, 30, '2020-05-16 01:55:29'),
(604, 45, 32, '2020-05-13 02:18:59'),
(837, 45, 32, '2020-05-15 02:20:29'),
(1522, 45, 32, '2020-06-07 22:51:14'),
(1554, 45, 32, '2020-06-10 01:20:44'),
(1633, 45, 32, '2020-06-13 17:51:44'),
(414, 45, 35, '2020-05-11 22:50:59'),
(469, 45, 35, '2020-05-12 15:20:29'),
(589, 45, 35, '2020-05-13 22:36:29'),
(744, 45, 35, '2020-05-14 23:52:29'),
(772, 45, 35, '2020-05-15 23:47:29'),
(922, 45, 35, '2020-05-16 11:57:29'),
(983, 45, 35, '2020-05-17 23:58:29'),
(1016, 45, 35, '2020-05-18 17:39:59'),
(1278, 45, 35, '2020-05-25 19:37:14'),
(1491, 45, 35, '2020-06-02 20:29:14'),
(646, 45, 37, '2020-05-13 12:19:29'),
(424, 45, 46, '2020-05-11 16:17:59'),
(436, 45, 49, '2020-05-11 16:10:59'),
(455, 45, 51, '2020-05-11 23:24:59'),
(500, 45, 54, '2020-05-12 03:48:29'),
(629, 45, 58, '2020-05-13 09:40:59'),
(530, 45, 59, '2020-05-12 13:22:59'),
(543, 45, 60, '2020-05-12 20:44:59'),
(701, 45, 66, '2020-05-13 20:17:59'),
(815, 45, 66, '2020-05-15 01:54:29'),
(762, 45, 71, '2020-05-14 23:59:59'),
(777, 45, 71, '2020-05-15 04:47:29'),
(1126, 45, 71, '2020-05-20 20:26:14'),
(810, 45, 72, '2020-05-15 13:37:29'),
(877, 45, 74, '2020-05-15 11:36:29'),
(876, 45, 75, '2020-05-15 11:33:29'),
(1036, 45, 80, '2020-05-18 23:59:59'),
(1060, 45, 80, '2020-05-19 23:54:29'),
(1081, 45, 80, '2020-05-20 04:27:59'),
(1379, 45, 80, '2020-05-28 23:50:44'),
(1399, 45, 80, '2020-05-29 03:51:14'),
(1510, 45, 80, '2020-06-07 02:25:14'),
(1165, 45, 82, '2020-05-22 23:28:44'),
(1209, 45, 84, '2020-05-24 15:26:44'),
(1261, 45, 85, '2020-05-25 17:23:44'),
(1311, 45, 85, '2020-05-26 20:08:14'),
(1364, 45, 85, '2020-05-28 16:43:44'),
(1572, 45, 86, '2020-06-10 02:24:14'),
(1593, 45, 87, '2020-06-13 18:43:44'),
(1703, 45, 87, '2020-06-15 18:55:44'),
(1739, 45, 87, '2020-06-16 15:27:44'),
(1787, 45, 87, '2020-06-17 23:37:25'),
(1830, 45, 87, '2020-06-18 20:31:08'),
(1888, 45, 87, '2020-06-19 23:43:24'),
(1997, 45, 87, '2020-06-20 01:04:24'),
(1759, 45, 92, '2020-06-17 19:08:55'),
(1868, 45, 92, '2020-06-18 20:05:11'),
(1923, 45, 92, '2020-06-19 23:56:54'),
(2002, 45, 92, '2020-06-20 09:56:24'),
(1818, 45, 93, '2020-06-18 01:19:25'),
(1945, 45, 94, '2020-06-19 23:33:24'),
(1993, 45, 94, '2020-06-20 21:36:24'),
(2035, 45, 95, '2020-06-20 23:40:24'),
(2043, 45, 95, '2020-06-21 20:11:08'),
(2115, 45, 95, '2020-06-22 01:05:38'),
(2056, 45, 96, '2020-06-21 23:59:08'),
(2103, 45, 96, '2020-06-22 12:19:41'),
(611, 46, 14, '2020-05-13 06:06:44'),
(1232, 46, 14, '2020-05-25 09:17:55'),
(422, 46, 29, '2020-05-11 22:45:47'),
(618, 46, 31, '2020-05-13 06:08:11'),
(1240, 46, 31, '2020-05-25 09:22:07'),
(431, 46, 33, '2020-05-11 15:46:28'),
(612, 46, 33, '2020-05-13 06:06:55'),
(1237, 46, 33, '2020-05-25 09:21:34'),
(420, 46, 36, '2020-05-11 22:45:26'),
(615, 46, 36, '2020-05-13 06:07:20'),
(882, 46, 36, '2020-05-15 14:18:42'),
(1231, 46, 36, '2020-05-25 09:17:44'),
(421, 46, 38, '2020-05-11 15:47:21'),
(1236, 46, 45, '2020-05-25 09:21:18'),
(614, 46, 53, '2020-05-13 06:07:06'),
(609, 46, 56, '2020-05-13 06:05:16'),
(435, 49, 36, '2020-05-11 16:10:57'),
(944, 50, 28, '2020-05-16 23:54:29'),
(958, 50, 28, '2020-05-17 23:57:29'),
(1017, 50, 28, '2020-05-18 23:59:59'),
(1048, 50, 28, '2020-05-19 15:08:59');
INSERT INTO `t_browse` (`t_browse_id`, `t_browse_user`, `t_cover_browse`, `t_create_time`) VALUES
(1112, 50, 28, '2020-05-20 15:50:44'),
(1162, 50, 28, '2020-05-22 23:54:44'),
(1180, 50, 28, '2020-05-23 23:57:14'),
(1205, 50, 28, '2020-05-24 23:44:44'),
(1215, 50, 28, '2020-05-25 23:50:14'),
(1287, 50, 28, '2020-05-26 23:59:14'),
(1329, 50, 28, '2020-05-27 23:56:44'),
(1341, 50, 28, '2020-05-28 03:12:44'),
(1416, 50, 28, '2020-05-29 23:37:44'),
(1432, 50, 28, '2020-05-30 23:42:14'),
(1466, 50, 28, '2020-05-31 00:53:14'),
(1533, 50, 28, '2020-06-09 23:17:44'),
(1542, 50, 28, '2020-06-10 00:11:44'),
(1604, 50, 28, '2020-06-13 23:00:14'),
(1665, 50, 28, '2020-06-14 23:55:14'),
(1675, 50, 28, '2020-06-15 23:36:14'),
(1712, 50, 28, '2020-06-16 02:56:44'),
(1852, 50, 28, '2020-06-18 20:34:38'),
(1905, 50, 28, '2020-06-19 23:44:54'),
(1998, 50, 28, '2020-06-20 04:57:54'),
(442, 50, 30, '2020-05-11 23:53:29'),
(466, 50, 30, '2020-05-12 23:53:29'),
(564, 50, 30, '2020-05-13 23:49:29'),
(724, 50, 30, '2020-05-14 20:23:29'),
(827, 50, 30, '2020-05-15 23:45:59'),
(914, 50, 30, '2020-05-16 01:54:59'),
(608, 50, 32, '2020-05-13 02:11:29'),
(832, 50, 32, '2020-05-15 02:18:59'),
(1557, 50, 32, '2020-06-10 01:17:44'),
(1626, 50, 32, '2020-06-13 17:56:14'),
(444, 50, 35, '2020-05-11 22:49:29'),
(487, 50, 35, '2020-05-12 15:20:59'),
(580, 50, 35, '2020-05-13 22:32:59'),
(751, 50, 35, '2020-05-14 23:51:59'),
(791, 50, 35, '2020-05-15 23:57:59'),
(929, 50, 35, '2020-05-16 11:59:59'),
(981, 50, 35, '2020-05-17 23:54:59'),
(1006, 50, 35, '2020-05-18 21:09:59'),
(1279, 50, 35, '2020-05-25 19:27:44'),
(1370, 50, 35, '2020-05-28 14:39:14'),
(1490, 50, 35, '2020-06-02 20:24:14'),
(650, 50, 37, '2020-05-13 12:20:29'),
(445, 50, 46, '2020-05-11 22:45:29'),
(452, 50, 51, '2020-05-11 23:22:29'),
(501, 50, 54, '2020-05-12 03:48:59'),
(518, 50, 58, '2020-05-12 13:10:29'),
(633, 50, 58, '2020-05-13 10:41:29'),
(537, 50, 60, '2020-05-12 20:44:59'),
(655, 50, 65, '2020-05-13 14:13:29'),
(696, 50, 66, '2020-05-13 20:34:59'),
(682, 50, 67, '2020-05-13 16:18:59'),
(755, 50, 70, '2020-05-14 17:29:59'),
(760, 50, 71, '2020-05-14 23:55:59'),
(781, 50, 71, '2020-05-15 04:40:59'),
(1130, 50, 71, '2020-05-20 20:24:44'),
(1296, 50, 71, '2020-05-26 11:10:44'),
(1443, 50, 71, '2020-05-30 08:56:14'),
(812, 50, 72, '2020-05-15 01:03:59'),
(860, 50, 74, '2020-05-15 11:08:29'),
(1024, 50, 80, '2020-05-18 23:58:59'),
(1061, 50, 80, '2020-05-19 23:58:59'),
(1086, 50, 80, '2020-05-20 04:22:59'),
(1383, 50, 80, '2020-05-28 23:31:44'),
(1403, 50, 80, '2020-05-29 03:42:44'),
(1514, 50, 80, '2020-06-07 02:21:44'),
(1154, 50, 82, '2020-05-22 23:31:14'),
(1271, 50, 85, '2020-05-25 17:24:44'),
(1310, 50, 85, '2020-05-26 20:12:44'),
(1354, 50, 85, '2020-05-28 16:45:14'),
(1570, 50, 86, '2020-06-10 02:37:14'),
(1594, 50, 87, '2020-06-13 18:41:44'),
(1697, 50, 87, '2020-06-15 19:00:44'),
(1731, 50, 87, '2020-06-16 13:28:44'),
(1780, 50, 87, '2020-06-17 23:35:55'),
(1825, 50, 87, '2020-06-18 20:34:08'),
(1882, 50, 87, '2020-06-19 23:59:24'),
(1976, 50, 87, '2020-06-20 01:23:54'),
(1758, 50, 92, '2020-06-17 19:55:55'),
(1866, 50, 92, '2020-06-18 20:09:41'),
(1918, 50, 92, '2020-06-19 23:45:54'),
(2015, 50, 92, '2020-06-20 09:55:24'),
(1816, 50, 93, '2020-06-18 01:19:55'),
(1937, 50, 94, '2020-06-19 23:36:24'),
(1994, 50, 94, '2020-06-20 08:28:54'),
(2039, 50, 95, '2020-06-20 23:45:24'),
(2073, 50, 95, '2020-06-21 19:35:38'),
(2122, 50, 95, '2020-06-22 01:04:08'),
(2065, 50, 96, '2020-06-21 22:35:38'),
(2120, 50, 96, '2020-06-22 12:48:11'),
(449, 51, 33, '2020-05-11 23:09:58'),
(448, 51, 38, '2020-05-11 23:24:27'),
(931, 52, 28, '2020-05-16 23:58:29'),
(955, 52, 28, '2020-05-17 23:59:59'),
(992, 52, 28, '2020-05-18 23:48:59'),
(1049, 52, 28, '2020-05-19 15:16:29'),
(1118, 52, 28, '2020-05-20 15:51:14'),
(1135, 52, 28, '2020-05-22 23:59:14'),
(1183, 52, 28, '2020-05-23 23:59:44'),
(1197, 52, 28, '2020-05-24 23:47:44'),
(1219, 52, 28, '2020-05-25 23:53:14'),
(1283, 52, 28, '2020-05-26 23:54:44'),
(1331, 52, 28, '2020-05-27 23:59:44'),
(1340, 52, 28, '2020-05-28 03:16:14'),
(1419, 52, 28, '2020-05-29 23:55:14'),
(1436, 52, 28, '2020-05-30 23:52:14'),
(1460, 52, 28, '2020-05-31 00:58:14'),
(1527, 52, 28, '2020-06-09 23:58:14'),
(1553, 52, 28, '2020-06-10 00:55:14'),
(1609, 52, 28, '2020-06-13 22:46:14'),
(1654, 52, 28, '2020-06-14 23:46:14'),
(1682, 52, 28, '2020-06-15 23:26:44'),
(1721, 52, 28, '2020-06-16 02:57:44'),
(1854, 52, 28, '2020-06-18 20:27:38'),
(1898, 52, 28, '2020-06-19 23:44:54'),
(1963, 52, 28, '2020-06-20 04:56:24'),
(486, 52, 30, '2020-05-12 23:56:29'),
(563, 52, 30, '2020-05-13 23:42:29'),
(732, 52, 30, '2020-05-14 20:36:29'),
(818, 52, 30, '2020-05-15 23:49:29'),
(925, 52, 30, '2020-05-16 01:47:29'),
(596, 52, 32, '2020-05-13 02:10:29'),
(1558, 52, 32, '2020-06-10 01:27:44'),
(1634, 52, 32, '2020-06-13 17:48:14'),
(479, 52, 35, '2020-05-12 15:20:29'),
(585, 52, 35, '2020-05-13 22:36:59'),
(747, 52, 35, '2020-05-14 23:59:29'),
(790, 52, 35, '2020-05-15 23:56:59'),
(923, 52, 35, '2020-05-16 11:56:59'),
(974, 52, 35, '2020-05-17 23:44:29'),
(1015, 52, 35, '2020-05-18 17:31:29'),
(1277, 52, 35, '2020-05-25 19:37:44'),
(1492, 52, 35, '2020-06-02 20:34:14'),
(643, 52, 37, '2020-05-13 12:17:59'),
(619, 52, 46, '2020-05-13 06:08:29'),
(1230, 52, 46, '2020-05-25 09:18:44'),
(508, 52, 51, '2020-05-12 10:10:29'),
(498, 52, 54, '2020-05-12 03:47:59'),
(525, 52, 58, '2020-05-12 13:11:59'),
(627, 52, 58, '2020-05-13 10:38:59'),
(541, 52, 60, '2020-05-12 20:41:29'),
(658, 52, 65, '2020-05-13 14:16:59'),
(670, 52, 66, '2020-05-13 20:27:29'),
(771, 52, 71, '2020-05-14 23:54:29'),
(774, 52, 71, '2020-05-15 04:39:59'),
(1128, 52, 71, '2020-05-20 20:25:44'),
(1299, 52, 71, '2020-05-26 11:07:44'),
(1452, 52, 71, '2020-05-30 08:54:44'),
(843, 52, 72, '2020-05-15 10:52:29'),
(859, 52, 74, '2020-05-15 11:05:59'),
(864, 52, 75, '2020-05-15 11:30:29'),
(1042, 52, 80, '2020-05-18 23:43:29'),
(1047, 52, 80, '2020-05-19 23:55:59'),
(1083, 52, 80, '2020-05-20 04:17:59'),
(1391, 52, 80, '2020-05-28 23:49:44'),
(1407, 52, 80, '2020-05-29 03:48:14'),
(1519, 52, 80, '2020-06-07 02:26:14'),
(1147, 52, 82, '2020-05-22 23:29:44'),
(1167, 52, 83, '2020-05-22 20:48:14'),
(1265, 52, 85, '2020-05-25 17:04:44'),
(1316, 52, 85, '2020-05-26 20:15:14'),
(1355, 52, 85, '2020-05-28 16:41:14'),
(1561, 52, 86, '2020-06-10 02:40:44'),
(1590, 52, 87, '2020-06-13 18:42:44'),
(1707, 52, 87, '2020-06-15 18:44:14'),
(1725, 52, 87, '2020-06-16 15:25:44'),
(1775, 52, 87, '2020-06-17 23:34:55'),
(1829, 52, 87, '2020-06-18 20:35:08'),
(1893, 52, 87, '2020-06-19 23:57:24'),
(1996, 52, 87, '2020-06-20 01:23:24'),
(1762, 52, 92, '2020-06-17 18:50:55'),
(1878, 52, 92, '2020-06-18 20:31:38'),
(1916, 52, 92, '2020-06-19 23:57:24'),
(2003, 52, 92, '2020-06-20 09:40:24'),
(1809, 52, 93, '2020-06-18 01:13:55'),
(1939, 52, 94, '2020-06-19 23:36:54'),
(1986, 52, 94, '2020-06-20 05:56:24'),
(2033, 52, 95, '2020-06-20 23:41:54'),
(2076, 52, 95, '2020-06-21 23:49:38'),
(2088, 52, 95, '2020-06-22 01:04:38'),
(2055, 52, 96, '2020-06-21 23:58:38'),
(2099, 52, 96, '2020-06-22 12:45:11'),
(939, 53, 28, '2020-05-16 23:53:29'),
(953, 53, 28, '2020-05-17 23:48:59'),
(1014, 53, 28, '2020-05-18 23:59:29'),
(1070, 53, 28, '2020-05-19 15:18:29'),
(1107, 53, 28, '2020-05-20 15:51:14'),
(1145, 53, 28, '2020-05-22 23:44:14'),
(1186, 53, 28, '2020-05-23 23:59:14'),
(1195, 53, 28, '2020-05-24 23:50:44'),
(1225, 53, 28, '2020-05-25 23:52:44'),
(1294, 53, 28, '2020-05-26 23:55:14'),
(1338, 53, 28, '2020-05-27 23:59:14'),
(1347, 53, 28, '2020-05-28 03:07:14'),
(1418, 53, 28, '2020-05-29 23:48:14'),
(1431, 53, 28, '2020-05-30 23:34:14'),
(1464, 53, 28, '2020-05-31 00:48:44'),
(1532, 53, 28, '2020-06-09 23:09:44'),
(1611, 53, 28, '2020-06-13 22:58:14'),
(1653, 53, 28, '2020-06-14 23:54:44'),
(1672, 53, 28, '2020-06-15 23:18:44'),
(1716, 53, 28, '2020-06-16 02:57:14'),
(1772, 53, 28, '2020-06-17 19:58:25'),
(1855, 53, 28, '2020-06-18 20:28:08'),
(1906, 53, 28, '2020-06-19 23:13:54'),
(1971, 53, 28, '2020-06-20 04:57:24'),
(507, 53, 30, '2020-05-12 23:58:59'),
(569, 53, 30, '2020-05-13 23:55:59'),
(734, 53, 30, '2020-05-14 20:34:59'),
(826, 53, 30, '2020-05-15 23:22:29'),
(912, 53, 30, '2020-05-16 01:53:59'),
(606, 53, 32, '2020-05-13 02:11:59'),
(833, 53, 32, '2020-05-15 02:19:29'),
(946, 53, 32, '2020-05-16 21:26:29'),
(1550, 53, 32, '2020-06-10 01:23:44'),
(1627, 53, 32, '2020-06-13 17:57:44'),
(506, 53, 35, '2020-05-12 15:21:59'),
(588, 53, 35, '2020-05-13 22:31:59'),
(745, 53, 35, '2020-05-14 23:54:59'),
(795, 53, 35, '2020-05-15 23:46:29'),
(915, 53, 35, '2020-05-16 12:04:59'),
(979, 53, 35, '2020-05-17 23:59:29'),
(1002, 53, 35, '2020-05-18 17:41:29'),
(1257, 53, 35, '2020-05-25 19:37:44'),
(1376, 53, 35, '2020-05-28 14:39:44'),
(1481, 53, 35, '2020-06-02 20:28:44'),
(645, 53, 37, '2020-05-13 12:18:29'),
(586, 53, 50, '2020-05-13 00:36:12'),
(1280, 53, 50, '2020-05-25 18:11:22'),
(557, 53, 53, '2020-05-12 16:11:44'),
(519, 53, 58, '2020-05-12 13:06:29'),
(628, 53, 58, '2020-05-13 10:35:59'),
(549, 53, 60, '2020-05-12 20:44:29'),
(718, 53, 61, '2020-05-13 20:23:30'),
(674, 53, 66, '2020-05-13 20:38:29'),
(716, 53, 67, '2020-05-13 19:57:29'),
(768, 53, 71, '2020-05-14 23:56:29'),
(799, 53, 71, '2020-05-15 04:47:59'),
(1131, 53, 71, '2020-05-20 20:24:44'),
(1302, 53, 71, '2020-05-26 11:04:44'),
(1453, 53, 71, '2020-05-30 08:54:44'),
(809, 53, 72, '2020-05-15 13:38:29'),
(839, 53, 73, '2020-05-15 10:40:59'),
(850, 53, 74, '2020-05-15 11:07:29'),
(1501, 53, 74, '2020-06-04 23:03:44'),
(872, 53, 75, '2020-05-15 11:30:59'),
(1034, 53, 80, '2020-05-18 23:57:59'),
(1064, 53, 80, '2020-05-19 23:59:59'),
(1092, 53, 80, '2020-05-20 04:32:29'),
(1389, 53, 80, '2020-05-28 23:41:44'),
(1400, 53, 80, '2020-05-29 03:42:44'),
(1511, 53, 80, '2020-06-07 02:24:14'),
(1163, 53, 82, '2020-05-22 23:38:44'),
(1576, 53, 83, '2020-06-10 20:10:44'),
(1260, 53, 85, '2020-05-25 17:23:44'),
(1323, 53, 85, '2020-05-26 20:16:44'),
(1361, 53, 85, '2020-05-28 16:44:14'),
(1568, 53, 86, '2020-06-10 02:39:14'),
(1586, 53, 87, '2020-06-13 18:47:44'),
(1704, 53, 87, '2020-06-15 19:00:44'),
(1723, 53, 87, '2020-06-16 15:25:14'),
(1774, 53, 87, '2020-06-17 23:17:25'),
(1834, 53, 87, '2020-06-18 20:29:08'),
(1889, 53, 87, '2020-06-19 23:58:54'),
(1957, 53, 87, '2020-06-20 01:22:54'),
(1754, 53, 92, '2020-06-17 18:59:25'),
(1873, 53, 92, '2020-06-18 20:35:08'),
(1930, 53, 92, '2020-06-19 23:48:54'),
(1999, 53, 92, '2020-06-20 10:11:54'),
(1806, 53, 93, '2020-06-18 01:20:25'),
(1953, 53, 94, '2020-06-19 23:26:24'),
(2011, 53, 94, '2020-06-20 01:23:54'),
(2067, 53, 95, '2020-06-21 23:57:38'),
(2109, 53, 95, '2020-06-22 00:58:08'),
(2050, 53, 96, '2020-06-21 22:36:08'),
(2097, 53, 96, '2020-06-22 12:51:11'),
(494, 54, 14, '2020-05-12 03:47:21'),
(491, 54, 31, '2020-05-12 03:45:54'),
(493, 54, 33, '2020-05-12 03:46:59'),
(503, 54, 36, '2020-05-12 03:51:13'),
(497, 54, 45, '2020-05-12 03:47:57'),
(496, 54, 50, '2020-05-12 03:47:43'),
(511, 56, 30, '2020-05-12 23:58:29'),
(570, 56, 30, '2020-05-13 17:27:59'),
(600, 56, 32, '2020-05-13 02:17:29'),
(551, 56, 35, '2020-05-12 14:28:29'),
(591, 56, 35, '2020-05-13 17:09:29'),
(654, 56, 37, '2020-05-13 12:17:59'),
(517, 56, 58, '2020-05-12 13:11:29'),
(622, 56, 58, '2020-05-13 10:40:29'),
(531, 56, 59, '2020-05-12 13:23:29'),
(540, 56, 60, '2020-05-12 20:43:29'),
(660, 56, 65, '2020-05-13 14:16:29'),
(693, 56, 66, '2020-05-13 16:52:59'),
(691, 56, 67, '2020-05-13 16:41:59'),
(515, 57, 52, '2020-05-12 12:28:52'),
(520, 58, 14, '2020-05-12 13:06:42'),
(636, 58, 38, '2020-05-13 09:04:38'),
(639, 58, 43, '2020-05-13 10:38:50'),
(620, 58, 45, '2020-05-13 09:03:27'),
(635, 58, 50, '2020-05-13 09:03:19'),
(637, 58, 53, '2020-05-13 09:06:48'),
(638, 58, 61, '2020-05-13 10:38:19'),
(526, 59, 53, '2020-05-12 13:22:12'),
(528, 59, 56, '2020-05-12 13:22:33'),
(539, 60, 14, '2020-05-12 14:01:18'),
(534, 60, 33, '2020-05-12 14:01:30'),
(538, 60, 36, '2020-05-12 14:01:04'),
(542, 60, 45, '2020-05-12 14:03:00'),
(532, 60, 53, '2020-05-12 13:59:17'),
(936, 61, 28, '2020-05-16 23:54:29'),
(959, 61, 28, '2020-05-17 23:51:29'),
(1018, 61, 28, '2020-05-18 23:55:29'),
(1054, 61, 28, '2020-05-19 15:18:59'),
(1104, 61, 28, '2020-05-20 15:47:14'),
(1136, 61, 28, '2020-05-22 23:57:44'),
(1185, 61, 28, '2020-05-23 23:58:44'),
(1200, 61, 28, '2020-05-24 23:48:44'),
(1218, 61, 28, '2020-05-25 23:52:44'),
(1284, 61, 28, '2020-05-26 23:59:14'),
(1328, 61, 28, '2020-05-27 23:51:14'),
(1339, 61, 28, '2020-05-28 03:18:44'),
(1427, 61, 28, '2020-05-29 23:56:44'),
(1433, 61, 28, '2020-05-30 23:51:44'),
(1463, 61, 28, '2020-05-31 00:53:44'),
(1473, 61, 28, '2020-06-01 08:32:24'),
(1524, 61, 28, '2020-06-09 22:55:14'),
(1615, 61, 28, '2020-06-13 22:58:14'),
(1664, 61, 28, '2020-06-14 23:52:14'),
(1677, 61, 28, '2020-06-15 23:42:44'),
(1748, 61, 28, '2020-06-16 02:53:44'),
(1794, 61, 28, '2020-06-17 19:56:55'),
(1857, 61, 28, '2020-06-18 20:10:11'),
(1902, 61, 28, '2020-06-19 23:21:24'),
(2004, 61, 28, '2020-06-20 04:58:54'),
(584, 61, 30, '2020-05-13 23:44:29'),
(729, 61, 30, '2020-05-14 20:36:59'),
(819, 61, 30, '2020-05-15 23:43:29'),
(899, 61, 30, '2020-05-16 01:38:29'),
(1474, 61, 30, '2020-06-01 08:32:50'),
(599, 61, 32, '2020-05-13 02:14:29'),
(1228, 61, 32, '2020-05-25 02:58:44'),
(1560, 61, 32, '2020-06-10 01:20:44'),
(1618, 61, 32, '2020-06-13 17:54:14'),
(1472, 61, 33, '2020-06-01 08:31:25'),
(590, 61, 35, '2020-05-13 22:43:29'),
(752, 61, 35, '2020-05-14 23:59:59'),
(797, 61, 35, '2020-05-15 23:58:59'),
(918, 61, 35, '2020-05-16 11:55:59'),
(975, 61, 35, '2020-05-17 23:46:29'),
(1013, 61, 35, '2020-05-18 17:34:59'),
(1251, 61, 35, '2020-05-25 19:36:14'),
(1475, 61, 35, '2020-06-01 08:33:02'),
(1482, 61, 35, '2020-06-02 20:36:14'),
(653, 61, 37, '2020-05-13 12:20:29'),
(1241, 61, 46, '2020-05-25 09:22:14'),
(634, 61, 58, '2020-05-13 10:36:59'),
(680, 61, 66, '2020-05-13 20:13:29'),
(695, 61, 67, '2020-05-13 16:44:29'),
(759, 61, 71, '2020-05-14 23:54:29'),
(793, 61, 71, '2020-05-15 04:36:59'),
(1127, 61, 71, '2020-05-20 20:23:44'),
(1449, 61, 71, '2020-05-30 08:53:44'),
(802, 61, 72, '2020-05-15 11:19:59'),
(838, 61, 73, '2020-05-15 10:40:29'),
(854, 61, 74, '2020-05-15 10:56:29'),
(866, 61, 75, '2020-05-15 11:33:59'),
(1033, 61, 80, '2020-05-18 23:47:59'),
(1058, 61, 80, '2020-05-19 23:51:29'),
(1087, 61, 80, '2020-05-20 04:25:59'),
(1392, 61, 80, '2020-05-28 23:43:14'),
(1404, 61, 80, '2020-05-29 03:38:14'),
(1520, 61, 80, '2020-06-07 02:23:44'),
(1155, 61, 82, '2020-05-22 23:39:44'),
(1266, 61, 85, '2020-05-25 17:23:14'),
(1314, 61, 85, '2020-05-26 19:52:14'),
(1366, 61, 85, '2020-05-28 16:39:44'),
(1574, 61, 86, '2020-06-10 02:31:14'),
(1592, 61, 87, '2020-06-13 20:17:14'),
(1708, 61, 87, '2020-06-15 18:58:44'),
(1736, 61, 87, '2020-06-16 15:14:44'),
(1789, 61, 87, '2020-06-17 23:41:25'),
(1822, 61, 87, '2020-06-18 20:33:08'),
(1885, 61, 87, '2020-06-19 23:48:54'),
(1969, 61, 87, '2020-06-20 01:23:24'),
(1753, 61, 92, '2020-06-17 19:00:25'),
(1865, 61, 92, '2020-06-18 20:30:08'),
(1920, 61, 92, '2020-06-19 23:57:24'),
(1965, 61, 92, '2020-06-20 09:41:54'),
(1814, 61, 93, '2020-06-18 01:15:55'),
(1950, 61, 94, '2020-06-19 23:30:24'),
(2014, 61, 94, '2020-06-20 08:28:54'),
(2040, 61, 95, '2020-06-20 23:51:24'),
(2045, 61, 95, '2020-06-21 23:55:38'),
(2107, 61, 95, '2020-06-22 01:03:38'),
(2061, 61, 96, '2020-06-21 22:37:38'),
(2108, 61, 96, '2020-06-22 12:49:11'),
(937, 62, 28, '2020-05-16 23:54:59'),
(961, 62, 28, '2020-05-17 23:50:29'),
(989, 62, 28, '2020-05-18 23:55:29'),
(1076, 62, 28, '2020-05-19 15:13:59'),
(1117, 62, 28, '2020-05-20 15:44:14'),
(1158, 62, 28, '2020-05-22 23:58:14'),
(1177, 62, 28, '2020-05-23 23:51:44'),
(1193, 62, 28, '2020-05-24 23:34:14'),
(1221, 62, 28, '2020-05-25 23:58:14'),
(1291, 62, 28, '2020-05-26 23:49:44'),
(1327, 62, 28, '2020-05-27 23:43:44'),
(1343, 62, 28, '2020-05-28 03:18:14'),
(1414, 62, 28, '2020-05-29 23:59:14'),
(1441, 62, 28, '2020-05-30 23:53:44'),
(1456, 62, 28, '2020-05-31 01:01:14'),
(1531, 62, 28, '2020-06-09 23:24:44'),
(1552, 62, 28, '2020-06-10 00:55:14'),
(1629, 62, 28, '2020-06-13 21:09:14'),
(1660, 62, 28, '2020-06-14 23:49:14'),
(1684, 62, 28, '2020-06-15 23:16:44'),
(1720, 62, 28, '2020-06-16 02:46:44'),
(1771, 62, 28, '2020-06-17 19:11:55'),
(1853, 62, 28, '2020-06-18 19:45:25'),
(1908, 62, 28, '2020-06-19 23:00:24'),
(1972, 62, 28, '2020-06-20 04:46:54'),
(988, 62, 29, '2020-05-17 23:32:59'),
(663, 62, 30, '2020-05-13 23:54:59'),
(722, 62, 30, '2020-05-14 20:31:59'),
(820, 62, 30, '2020-05-15 23:38:59'),
(910, 62, 30, '2020-05-16 01:50:59'),
(1551, 62, 32, '2020-06-10 01:23:14'),
(1619, 62, 32, '2020-06-13 17:47:44'),
(984, 62, 33, '2020-05-17 23:32:21'),
(664, 62, 35, '2020-05-13 22:32:59'),
(741, 62, 35, '2020-05-14 23:59:59'),
(779, 62, 35, '2020-05-15 23:55:59'),
(928, 62, 35, '2020-05-16 11:57:29'),
(977, 62, 35, '2020-05-17 23:35:29'),
(997, 62, 35, '2020-05-18 21:10:59'),
(1121, 62, 35, '2020-05-20 15:47:44'),
(1249, 62, 35, '2020-05-25 19:39:14'),
(1478, 62, 35, '2020-06-02 20:31:14'),
(1233, 62, 46, '2020-05-25 09:18:14'),
(985, 62, 53, '2020-05-17 23:32:34'),
(986, 62, 61, '2020-05-17 23:32:45'),
(987, 62, 62, '2020-05-17 23:32:48'),
(688, 62, 66, '2020-05-13 20:34:29'),
(686, 62, 67, '2020-05-13 16:36:29'),
(763, 62, 71, '2020-05-14 23:58:59'),
(780, 62, 71, '2020-05-15 04:46:59'),
(1129, 62, 71, '2020-05-20 20:25:14'),
(1305, 62, 71, '2020-05-26 11:08:14'),
(1455, 62, 71, '2020-05-30 08:57:44'),
(811, 62, 72, '2020-05-15 01:00:59'),
(845, 62, 74, '2020-05-15 10:56:59'),
(869, 62, 75, '2020-05-15 11:20:59'),
(1038, 62, 80, '2020-05-18 23:52:59'),
(1062, 62, 80, '2020-05-19 23:56:29'),
(1084, 62, 80, '2020-05-20 04:32:29'),
(1381, 62, 80, '2020-05-28 23:52:14'),
(1393, 62, 80, '2020-05-29 03:48:44'),
(1513, 62, 80, '2020-06-07 02:21:14'),
(1159, 62, 82, '2020-05-22 23:28:44'),
(1212, 62, 84, '2020-05-24 15:28:14'),
(1268, 62, 85, '2020-05-25 17:15:44'),
(1309, 62, 85, '2020-05-26 19:46:44'),
(1362, 62, 85, '2020-05-28 16:38:14'),
(1569, 62, 86, '2020-06-10 02:40:14'),
(1582, 62, 87, '2020-06-13 18:41:14'),
(1700, 62, 87, '2020-06-15 18:57:44'),
(1722, 62, 87, '2020-06-16 13:32:14'),
(1788, 62, 87, '2020-06-17 23:40:55'),
(1823, 62, 87, '2020-06-18 20:29:38'),
(1883, 62, 87, '2020-06-19 23:58:54'),
(1985, 62, 87, '2020-06-20 00:58:24'),
(1639, 62, 90, '2020-06-13 17:12:14'),
(1760, 62, 92, '2020-06-17 19:56:25'),
(1837, 62, 92, '2020-06-18 20:02:11'),
(1934, 62, 92, '2020-06-19 23:48:24'),
(1959, 62, 92, '2020-06-20 09:51:24'),
(1943, 62, 94, '2020-06-19 23:19:54'),
(2000, 62, 94, '2020-06-20 08:28:24'),
(2031, 62, 95, '2020-06-20 23:54:24'),
(2059, 62, 95, '2020-06-21 23:58:38'),
(2113, 62, 95, '2020-06-22 01:01:38'),
(2062, 62, 96, '2020-06-21 22:41:08'),
(2100, 62, 96, '2020-06-22 12:49:41'),
(558, 63, 31, '2020-05-12 21:19:25'),
(659, 65, 14, '2020-05-13 14:16:02'),
(671, 66, 31, '2020-05-13 19:54:16'),
(672, 66, 33, '2020-05-13 19:58:54'),
(814, 66, 33, '2020-05-15 01:54:19'),
(708, 66, 34, '2020-05-13 18:51:26'),
(707, 66, 36, '2020-05-13 18:51:20'),
(706, 66, 38, '2020-05-13 18:51:15'),
(676, 66, 39, '2020-05-13 16:17:34'),
(697, 66, 45, '2020-05-13 19:55:37'),
(700, 66, 50, '2020-05-13 19:55:25'),
(668, 66, 53, '2020-05-13 20:26:31'),
(813, 66, 53, '2020-05-15 01:33:31'),
(698, 66, 56, '2020-05-13 16:48:40'),
(667, 66, 62, '2020-05-13 16:51:21'),
(1410, 67, 31, '2020-05-29 02:26:09'),
(692, 67, 33, '2020-05-13 19:56:41'),
(1411, 67, 33, '2020-05-29 02:26:23'),
(677, 67, 45, '2020-05-13 16:17:55'),
(685, 67, 53, '2020-05-13 20:20:50'),
(679, 67, 62, '2020-05-13 16:20:56'),
(713, 69, 29, '2020-05-13 19:36:22'),
(711, 69, 31, '2020-05-13 21:10:53'),
(719, 69, 43, '2020-05-13 21:10:30'),
(714, 69, 45, '2020-05-13 19:36:30'),
(720, 69, 50, '2020-05-13 21:10:42'),
(712, 69, 53, '2020-05-13 19:36:17'),
(756, 70, 33, '2020-05-14 17:30:13'),
(803, 72, 31, '2020-05-15 00:54:01'),
(842, 72, 33, '2020-05-15 11:20:04'),
(804, 72, 36, '2020-05-15 13:38:21'),
(880, 72, 38, '2020-05-15 13:38:00'),
(879, 72, 45, '2020-05-15 13:37:33'),
(881, 72, 50, '2020-05-15 13:38:24'),
(800, 72, 53, '2020-05-15 13:36:25'),
(852, 74, 14, '2020-05-15 10:56:02'),
(855, 74, 33, '2020-05-15 10:56:51'),
(1496, 74, 33, '2020-06-04 23:02:36'),
(853, 74, 52, '2020-05-15 10:58:35'),
(846, 74, 53, '2020-05-15 10:58:05'),
(1500, 74, 53, '2020-06-04 23:03:34'),
(933, 76, 28, '2020-05-16 23:47:59'),
(948, 76, 28, '2020-05-17 23:58:59'),
(998, 76, 28, '2020-05-18 23:47:29'),
(1075, 76, 28, '2020-05-19 14:48:59'),
(1105, 76, 28, '2020-05-20 15:45:44'),
(1144, 76, 28, '2020-05-22 23:44:14'),
(1187, 76, 28, '2020-05-23 23:54:44'),
(1201, 76, 28, '2020-05-24 23:47:14'),
(1244, 76, 28, '2020-05-25 23:56:14'),
(1290, 76, 28, '2020-05-26 23:54:44'),
(1333, 76, 28, '2020-05-27 23:58:14'),
(1352, 76, 28, '2020-05-28 03:14:14'),
(1426, 76, 28, '2020-05-29 23:49:44'),
(1440, 76, 28, '2020-05-30 23:56:14'),
(1470, 76, 28, '2020-05-31 00:42:44'),
(1539, 76, 28, '2020-06-09 23:14:14'),
(1601, 76, 28, '2020-06-13 22:44:14'),
(1662, 76, 28, '2020-06-14 23:55:14'),
(1680, 76, 28, '2020-06-15 23:36:14'),
(1714, 76, 28, '2020-06-16 02:55:14'),
(1795, 76, 28, '2020-06-17 19:56:55'),
(1849, 76, 28, '2020-06-18 20:32:38'),
(1900, 76, 28, '2020-06-19 23:13:24'),
(1992, 76, 28, '2020-06-20 04:47:24'),
(895, 76, 30, '2020-05-15 23:39:29'),
(908, 76, 30, '2020-05-16 01:37:59'),
(1546, 76, 32, '2020-06-10 01:27:44'),
(1621, 76, 32, '2020-06-13 17:57:14'),
(884, 76, 33, '2020-05-15 21:51:54'),
(887, 76, 34, '2020-05-15 19:23:06'),
(897, 76, 35, '2020-05-15 23:58:29'),
(927, 76, 35, '2020-05-16 11:59:29'),
(971, 76, 35, '2020-05-17 23:54:29'),
(994, 76, 35, '2020-05-18 17:44:29'),
(1119, 76, 35, '2020-05-20 15:47:14'),
(1275, 76, 35, '2020-05-25 19:38:14'),
(1372, 76, 35, '2020-05-28 14:36:14'),
(1483, 76, 35, '2020-06-02 20:11:14'),
(885, 76, 36, '2020-05-15 21:01:13'),
(886, 76, 38, '2020-05-15 19:23:01'),
(893, 76, 39, '2020-05-15 20:03:20'),
(888, 76, 43, '2020-05-15 19:23:10'),
(890, 76, 45, '2020-05-15 21:01:18'),
(1235, 76, 46, '2020-05-25 09:19:14'),
(889, 76, 50, '2020-05-15 19:23:15'),
(892, 76, 52, '2020-05-15 20:03:09'),
(891, 76, 53, '2020-05-15 19:57:13'),
(883, 76, 62, '2020-05-15 20:42:08'),
(1448, 76, 71, '2020-05-30 08:53:44'),
(1044, 76, 80, '2020-05-18 23:41:59'),
(1071, 76, 80, '2020-05-19 23:57:59'),
(1085, 76, 80, '2020-05-20 04:21:59'),
(1382, 76, 80, '2020-05-28 23:55:14'),
(1396, 76, 80, '2020-05-29 03:27:14'),
(1504, 76, 80, '2020-06-07 02:23:14'),
(1164, 76, 82, '2020-05-22 23:35:44'),
(1168, 76, 83, '2020-05-22 20:48:44'),
(1273, 76, 85, '2020-05-25 17:21:44'),
(1317, 76, 85, '2020-05-26 20:06:44'),
(1368, 76, 85, '2020-05-28 16:42:44'),
(1567, 76, 86, '2020-06-10 02:24:44'),
(1583, 76, 87, '2020-06-13 19:10:44'),
(1692, 76, 87, '2020-06-15 18:50:44'),
(1740, 76, 87, '2020-06-16 15:25:14'),
(1785, 76, 87, '2020-06-17 23:18:55'),
(1820, 76, 87, '2020-06-18 20:33:38'),
(1894, 76, 87, '2020-06-19 23:51:24'),
(1973, 76, 87, '2020-06-20 01:16:24'),
(1764, 76, 92, '2020-06-17 19:57:25'),
(1875, 76, 92, '2020-06-18 20:31:08'),
(1922, 76, 92, '2020-06-19 23:53:24'),
(1978, 76, 92, '2020-06-20 09:40:54'),
(1808, 76, 93, '2020-06-18 01:08:25'),
(1948, 76, 94, '2020-06-19 23:20:24'),
(1989, 76, 94, '2020-06-20 21:35:24'),
(2047, 76, 95, '2020-06-21 19:28:08'),
(2095, 76, 95, '2020-06-22 00:57:38'),
(2052, 76, 96, '2020-06-21 22:38:38'),
(2104, 76, 96, '2020-06-22 12:51:11'),
(1030, 80, 29, '2020-05-18 22:43:51'),
(1029, 80, 31, '2020-05-18 22:43:50'),
(1032, 80, 33, '2020-05-18 22:43:54'),
(1377, 80, 33, '2020-05-28 16:08:25'),
(1506, 80, 33, '2020-06-07 00:28:46'),
(1578, 80, 33, '2020-06-11 02:27:27'),
(1031, 80, 39, '2020-05-18 23:00:19'),
(1028, 80, 52, '2020-05-18 22:43:48'),
(1026, 80, 53, '2020-05-18 22:43:47'),
(1027, 80, 61, '2020-05-18 23:15:31'),
(1023, 80, 62, '2020-05-18 23:15:22'),
(1505, 80, 62, '2020-06-07 00:28:23'),
(1101, 81, 14, '2020-05-20 02:42:50'),
(1094, 81, 29, '2020-05-20 02:41:03'),
(1093, 81, 33, '2020-05-20 02:43:07'),
(1102, 81, 36, '2020-05-20 02:42:57'),
(1100, 81, 38, '2020-05-20 02:42:26'),
(1099, 81, 43, '2020-05-20 02:42:09'),
(1097, 81, 45, '2020-05-20 02:41:50'),
(1151, 82, 29, '2020-05-22 15:46:32'),
(1148, 82, 76, '2020-05-22 15:45:51'),
(1169, 83, 14, '2020-05-22 20:48:51'),
(1170, 83, 36, '2020-05-22 20:49:02'),
(1174, 83, 45, '2020-05-22 20:51:01'),
(1171, 83, 53, '2020-05-22 20:49:34'),
(1206, 84, 33, '2020-05-24 15:26:35'),
(1210, 84, 39, '2020-05-24 15:27:28'),
(1245, 84, 53, '2020-05-25 14:35:48'),
(1308, 85, 33, '2020-05-26 19:39:44'),
(1262, 85, 43, '2020-05-25 16:04:26'),
(1881, 87, 28, '2020-06-18 20:38:12'),
(1803, 87, 29, '2020-06-17 20:18:47'),
(1749, 87, 31, '2020-06-16 15:12:07'),
(1587, 87, 33, '2020-06-13 18:34:51'),
(1745, 87, 33, '2020-06-16 12:43:42'),
(1802, 87, 33, '2020-06-17 20:18:15'),
(1819, 87, 33, '2020-06-18 17:53:32'),
(1933, 87, 33, '2020-06-19 23:25:50'),
(2019, 87, 33, '2020-06-20 00:34:20'),
(1689, 87, 34, '2020-06-15 17:54:51'),
(1728, 87, 34, '2020-06-16 00:49:16'),
(1838, 87, 34, '2020-06-18 17:51:11'),
(1903, 87, 34, '2020-06-19 15:15:24'),
(2025, 87, 38, '2020-06-20 01:25:49'),
(1928, 87, 39, '2020-06-19 20:00:06'),
(2026, 87, 43, '2020-06-20 01:25:57'),
(1727, 87, 45, '2020-06-16 00:48:14'),
(2024, 87, 45, '2020-06-20 01:25:47'),
(2023, 87, 50, '2020-06-20 01:25:53'),
(1750, 87, 52, '2020-06-16 15:28:35'),
(1841, 87, 52, '2020-06-18 17:51:27'),
(1599, 87, 53, '2020-06-13 18:14:09'),
(1702, 87, 53, '2020-06-15 18:07:41'),
(1801, 87, 53, '2020-06-17 20:12:39'),
(1840, 87, 53, '2020-06-18 17:51:06'),
(1926, 87, 53, '2020-06-19 19:59:57'),
(2027, 87, 53, '2020-06-20 01:27:50'),
(1597, 87, 61, '2020-06-13 15:43:55'),
(1836, 87, 61, '2020-06-18 17:51:19'),
(1598, 87, 62, '2020-06-13 15:34:41'),
(1688, 87, 62, '2020-06-15 18:06:44'),
(1726, 87, 62, '2020-06-16 00:47:53'),
(1843, 87, 62, '2020-06-18 18:01:06'),
(1929, 87, 62, '2020-06-19 20:00:11'),
(1842, 87, 76, '2020-06-18 18:01:01'),
(2020, 87, 76, '2020-06-20 00:34:27'),
(1600, 87, 89, '2020-06-13 16:30:08'),
(1730, 87, 89, '2020-06-16 00:49:52'),
(1839, 87, 89, '2020-06-18 18:01:57'),
(2022, 87, 89, '2020-06-20 01:25:12'),
(1729, 87, 91, '2020-06-16 00:49:46'),
(1608, 89, 28, '2020-06-13 22:31:44'),
(1655, 89, 28, '2020-06-14 23:49:44'),
(1671, 89, 28, '2020-06-15 23:47:14'),
(1742, 89, 28, '2020-06-16 02:42:44'),
(1860, 89, 28, '2020-06-18 20:10:41'),
(1913, 89, 28, '2020-06-19 22:45:54'),
(1970, 89, 28, '2020-06-20 04:54:24'),
(1935, 89, 31, '2020-06-19 22:07:48'),
(1623, 89, 32, '2020-06-13 17:48:44'),
(1709, 89, 33, '2020-06-15 18:44:37'),
(1936, 89, 34, '2020-06-19 22:10:29'),
(1954, 89, 39, '2020-06-19 23:02:08'),
(2028, 89, 52, '2020-06-20 01:29:06'),
(1646, 89, 53, '2020-06-13 17:19:55'),
(1710, 89, 62, '2020-06-15 19:03:49'),
(1616, 89, 87, '2020-06-13 19:05:44'),
(1695, 89, 87, '2020-06-15 18:57:44'),
(1744, 89, 87, '2020-06-16 15:16:44'),
(1769, 89, 87, '2020-06-17 23:28:25'),
(1833, 89, 87, '2020-06-18 19:55:41'),
(1886, 89, 87, '2020-06-19 23:56:24'),
(1968, 89, 87, '2020-06-20 01:22:54'),
(1766, 89, 92, '2020-06-17 19:09:25'),
(1876, 89, 92, '2020-06-18 20:33:08'),
(1921, 89, 92, '2020-06-19 23:51:54'),
(1981, 89, 92, '2020-06-20 09:56:54'),
(1940, 89, 94, '2020-06-19 23:35:24'),
(2001, 89, 94, '2020-06-20 01:37:54'),
(2038, 89, 95, '2020-06-20 23:50:54'),
(2072, 89, 95, '2020-06-21 20:04:38'),
(2111, 89, 95, '2020-06-22 00:52:08'),
(2070, 89, 96, '2020-06-21 23:59:38'),
(2114, 89, 96, '2020-06-22 12:49:41'),
(1644, 90, 33, '2020-06-13 17:12:27'),
(1636, 90, 34, '2020-06-13 17:12:13'),
(1637, 90, 36, '2020-06-13 17:08:25'),
(1642, 90, 45, '2020-06-13 17:11:48'),
(1641, 90, 89, '2020-06-13 17:11:35'),
(1706, 91, 38, '2020-06-15 18:24:06'),
(1652, 91, 61, '2020-06-14 14:55:54'),
(1686, 91, 61, '2020-06-15 15:01:02'),
(1687, 91, 62, '2020-06-15 16:48:32'),
(1880, 92, 36, '2020-06-18 19:43:10'),
(1793, 92, 45, '2020-06-17 19:56:37'),
(1792, 92, 89, '2020-06-17 19:56:28'),
(1804, 93, 53, '2020-06-18 01:04:22'),
(1805, 93, 61, '2020-06-18 01:04:36'),
(1938, 94, 34, '2020-06-19 22:11:52'),
(1955, 94, 36, '2020-06-19 23:20:00'),
(2085, 95, 33, '2020-06-22 00:00:08'),
(2084, 95, 34, '2020-06-21 23:59:55'),
(2116, 95, 34, '2020-06-22 00:33:34'),
(2086, 95, 52, '2020-06-22 00:00:06'),
(2129, 96, 29, '2020-06-22 10:46:07'),
(2064, 96, 33, '2020-06-21 23:47:20'),
(2128, 96, 33, '2020-06-22 10:46:02'),
(2063, 96, 34, '2020-06-21 23:47:08'),
(2126, 96, 34, '2020-06-22 00:26:58'),
(2049, 96, 52, '2020-06-21 00:12:33'),
(2077, 96, 61, '2020-06-21 23:58:18'),
(2080, 96, 62, '2020-06-21 12:57:34'),
(2083, 96, 76, '2020-06-21 23:47:36'),
(2048, 96, 89, '2020-06-21 00:12:18'),
(2079, 96, 96, '2020-06-21 11:48:53'),
(2082, 96, 97, '2020-06-21 13:21:49'),
(2102, 96, 97, '2020-06-22 10:48:10'),
(2117, 97, 29, '2020-06-22 00:16:11'),
(2130, 97, 31, '2020-06-22 11:20:13'),
(2081, 97, 33, '2020-06-21 13:03:11'),
(2123, 97, 33, '2020-06-22 01:38:13'),
(2124, 97, 34, '2020-06-22 14:18:26'),
(2127, 97, 39, '2020-06-22 11:12:07'),
(2098, 97, 61, '2020-06-22 10:53:55'),
(2125, 97, 76, '2020-06-22 00:26:16');

-- --------------------------------------------------------

--
-- 表的结构 `t_call_log`
--

CREATE TABLE IF NOT EXISTS `t_call_log` (
  `t_id` int(11) NOT NULL,
  `t_callout_user` int(11) DEFAULT NULL,
  `t_answer_user` int(11) DEFAULT NULL,
  `t_create_time` datetime DEFAULT NULL,
  `t_call_time` int(11) DEFAULT NULL,
  `t_room_id` int(11) DEFAULT NULL,
  `t_state` int(11) DEFAULT '0' COMMENT '状态'
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_call_log`
--

INSERT INTO `t_call_log` (`t_id`, `t_callout_user`, `t_answer_user`, `t_create_time`, `t_call_time`, `t_room_id`, `t_state`) VALUES
(1, 1, 2, '2020-04-24 00:42:20', 0, 2, 1),
(2, 1, 3, '2020-04-24 00:42:57', 0, 3, 1),
(3, 1, 3, '2020-04-24 00:43:06', 0, 3, 1),
(4, 4, 1, '2020-04-24 10:53:28', 0, 4, 1),
(5, 1, 2, '2020-04-24 10:56:34', 1, 2, 1),
(6, 1, 2, '2020-04-24 10:56:50', 1, 2, 1),
(7, 1, 2, '2020-04-24 12:00:41', 0, 2, 1),
(8, 1, 2, '2020-04-24 12:02:24', 0, 2, 1),
(9, 1, 2, '2020-04-24 12:06:02', 1, 2, 1),
(10, 1, 2, '2020-04-24 12:35:14', 1, 2, 1),
(11, 1, 2, '2020-04-28 12:02:40', 0, 2, 1),
(12, 1, 2, '2020-04-28 12:03:33', 2, 2, 1),
(13, 1, 2, '2020-04-28 12:05:58', 2, 2, 1),
(14, 1, 2, '2020-04-28 18:14:16', 0, 2, 1),
(15, 1, 2, '2020-04-28 22:55:27', 0, 2, 1),
(16, 1, 2, '2020-04-28 23:07:25', 0, 2, 1),
(17, 1, 2, '2020-04-28 23:10:32', 1, 2, 1),
(18, 1, 2, '2020-04-28 23:11:53', 0, 2, 1),
(19, 1, 2, '2020-04-28 23:15:57', 1, 2, 1),
(20, 3, 1, '2020-04-30 17:13:51', 0, 3, 1),
(21, 1, 9, '2020-04-30 19:24:09', 1, 9, 1),
(22, 1, 9, '2020-04-30 19:47:57', 0, 9, 1),
(23, 1, 9, '2020-04-30 19:48:56', 0, 9, 1),
(24, 1, 9, '2020-04-30 20:14:30', 0, 9, 1),
(25, 1, 9, '2020-05-01 14:27:56', 1, 9, 1),
(26, 1, 9, '2020-05-01 14:28:21', NULL, 9, 0),
(27, 1, 9, '2020-05-01 14:31:52', 1, 9, 1),
(28, 1, 3, '2020-05-01 14:42:31', 0, 3, 1),
(29, 1, 9, '2020-05-01 14:47:00', 0, 9, 1),
(30, 1, 9, '2020-05-01 16:07:03', 0, 9, 1),
(31, 1, 9, '2020-05-01 21:03:45', 1, 9, 1),
(32, 9, 1, '2020-05-01 21:04:59', 5, 9, 1),
(33, 1, 9, '2020-05-01 21:15:46', 0, 9, 1),
(34, 1, 9, '2020-05-01 21:16:00', 0, 9, 1),
(35, 1, 9, '2020-05-01 21:16:12', 0, 9, 1),
(36, 1, 9, '2020-05-01 21:16:38', 0, 9, 1),
(37, 9, 1, '2020-05-01 21:16:54', 0, 9, 1),
(38, 1, 9, '2020-05-01 21:17:00', 0, 9, 1),
(39, 1, 9, '2020-05-01 21:17:10', 0, 9, 1),
(40, 1, 9, '2020-05-01 21:17:16', 1, 9, 1),
(41, 1, 9, '2020-05-01 21:17:34', 3, 9, 1),
(42, 1, 3, '2020-05-01 21:20:16', NULL, 3, 0),
(43, 1, 9, '2020-05-01 21:23:23', 1, 9, 1),
(44, 1, 9, '2020-05-01 21:23:41', NULL, 9, 0),
(45, 1, 9, '2020-05-01 21:24:03', 1, 9, 1),
(46, 1, 9, '2020-05-01 22:19:00', 0, 9, 1),
(47, 1, 2, '2020-05-01 23:04:17', 0, 2, 1),
(48, 1, 14, '2020-05-02 18:29:39', 1, 14, 1),
(49, 1, 9, '2020-05-03 21:37:14', NULL, 9, 0),
(50, 9, 1, '2020-05-03 21:38:13', 2, 9, 1),
(51, 9, 1, '2020-05-03 21:42:38', 0, 9, 1),
(52, 9, 7, '2020-05-04 13:03:57', 0, 9, 1),
(53, 2, 7, '2020-05-04 13:10:56', 0, 2, 1),
(54, 1, 2, '2020-05-04 13:12:19', 1, 2, 1),
(55, 7, 2, '2020-05-04 13:13:19', NULL, 2, 0),
(56, 7, 16, '2020-05-04 13:45:10', NULL, 16, 0),
(57, 9, 7, '2020-05-04 14:01:38', 0, 9, 1),
(58, 9, 7, '2020-05-04 14:02:26', 0, 9, 1),
(59, 9, 7, '2020-05-04 14:02:36', 0, 9, 1),
(60, 9, 1, '2020-05-04 14:02:52', 1, 9, 1),
(61, 9, 1, '2020-05-04 14:05:04', 1, 9, 1),
(62, 1, 16, '2020-05-04 14:12:32', 0, 16, 1),
(63, 1, 16, '2020-05-04 14:15:32', 0, 16, 1),
(64, 16, 1, '2020-05-04 14:15:43', 0, 16, 1),
(65, 9, 1, '2020-05-04 14:15:56', 0, 9, 1),
(66, 9, 1, '2020-05-04 14:16:11', 0, 9, 1),
(67, 1, 9, '2020-05-04 14:16:28', 0, 9, 1),
(68, 16, 1, '2020-05-04 14:16:40', 0, 16, 1),
(69, 9, 1, '2020-05-04 14:22:18', 0, 9, 1),
(70, 1, 16, '2020-05-04 14:22:36', 1, 16, 1),
(71, 11, 14, '2020-05-08 20:19:44', 0, 14, 1),
(72, 1, 2, '2020-05-08 20:20:23', 0, 2, 1),
(73, 1, 9, '2020-05-08 20:24:09', 1, 9, 1),
(74, 9, 19, '2020-05-08 20:26:07', 0, 9, 1),
(75, 9, 19, '2020-05-08 20:26:19', 0, 9, 1),
(76, 1, 9, '2020-05-08 20:27:02', 0, 9, 1),
(77, 9, 1, '2020-05-08 20:27:15', 0, 9, 1),
(78, 1, 9, '2020-05-08 20:28:04', 1, 9, 1),
(79, 9, 1, '2020-05-08 20:28:17', 1, 9, 1),
(80, 9, 6, '2020-05-08 20:29:41', 0, 9, 1),
(81, 9, 6, '2020-05-08 20:29:49', 0, 9, 1),
(82, 9, 6, '2020-05-08 20:29:56', 0, 9, 1),
(83, 9, 6, '2020-05-08 20:30:50', 0, 9, 1),
(84, 1, 9, '2020-05-08 20:31:00', 0, 9, 1),
(85, 1, 9, '2020-05-08 20:31:19', 0, 9, 1),
(86, 1, 9, '2020-05-08 20:32:04', 0, 9, 1),
(87, 1, 9, '2020-05-08 20:32:26', NULL, 9, 0),
(88, 9, 1, '2020-05-08 20:35:08', 0, 9, 1),
(89, 9, 1, '2020-05-08 20:35:36', 0, 9, 1),
(90, 1, 9, '2020-05-08 20:36:06', 1, 9, 1),
(91, 9, 1, '2020-05-08 20:36:16', 2, 9, 1),
(92, 1, 9, '2020-05-08 20:38:00', 1, 9, 1),
(93, 1, 9, '2020-05-08 20:38:20', 0, 9, 1),
(94, 1, 9, '2020-05-08 20:38:32', 0, 9, 1),
(95, 9, 1, '2020-05-08 20:38:40', 0, 9, 1),
(96, 9, 1, '2020-05-08 20:39:03', 0, 9, 1),
(97, 9, 1, '2020-05-08 20:39:59', 0, 9, 1),
(98, 9, 1, '2020-05-08 20:40:30', 0, 9, 1),
(99, 9, 1, '2020-05-08 20:41:30', 1, 9, 1),
(100, 9, 1, '2020-05-08 20:42:58', 1, 9, 1),
(101, 1, 9, '2020-05-08 20:43:10', 0, 9, 1),
(102, 1, 9, '2020-05-08 20:43:21', 0, 9, 1),
(103, 1, 9, '2020-05-08 20:44:08', NULL, 9, 0),
(104, 12, 14, '2020-05-08 20:59:05', NULL, 14, 0),
(105, 1, 9, '2020-05-08 21:20:33', 1, 9, 1),
(106, 1, 9, '2020-05-08 21:26:09', 0, 9, 1),
(107, 1, 9, '2020-05-08 21:26:50', 0, 9, 1),
(108, 1, 9, '2020-05-08 21:27:03', 0, 9, 1),
(109, 9, 1, '2020-05-08 21:27:15', 0, 9, 1),
(110, 1, 9, '2020-05-08 21:27:22', 0, 9, 1),
(111, 1, 9, '2020-05-08 22:10:44', 0, 9, 1),
(112, 1, 4, '2020-05-09 11:03:36', 0, 4, 1),
(113, 1, 9, '2020-05-09 13:49:40', 0, 9, 1),
(114, 1, 9, '2020-05-09 13:49:50', 0, 9, 1),
(115, 9, 1, '2020-05-09 13:50:02', 1, 9, 1),
(116, 1, 9, '2020-05-09 13:52:09', 1, 9, 1),
(117, 28, 29, '2020-05-09 20:19:10', 3, 29, 1),
(118, 28, 29, '2020-05-09 20:22:15', 1, 29, 1),
(119, 28, 31, '2020-05-09 20:23:47', NULL, 31, 0),
(120, 31, 28, '2020-05-09 20:25:10', 1, 31, 1),
(121, 31, 28, '2020-05-09 20:25:24', 1, 31, 1),
(122, 32, 29, '2020-05-10 01:26:46', 0, 29, 1),
(123, 28, 29, '2020-05-10 07:02:23', 0, 29, 1),
(124, 28, 29, '2020-05-10 08:54:09', 0, 29, 1),
(125, 28, 29, '2020-05-10 08:54:46', 0, 29, 1),
(126, 29, 28, '2020-05-10 10:41:24', 0, 29, 1),
(127, 28, 31, '2020-05-10 11:45:51', 0, 31, 1),
(128, 28, 31, '2020-05-10 11:46:52', 0, 31, 1),
(129, 28, 31, '2020-05-10 15:14:34', 0, 31, 1),
(130, 31, 28, '2020-05-10 15:15:18', 1, 31, 1),
(131, 28, 31, '2020-05-10 20:40:27', 0, 31, 1),
(132, 37, 39, '2020-05-11 13:10:43', 0, 39, 1),
(133, 37, 39, '2020-05-11 13:11:34', 0, 39, 1),
(134, 37, 39, '2020-05-11 13:12:26', NULL, 39, 0),
(135, 35, 31, '2020-05-11 13:19:52', 1, 31, 1),
(136, 28, 31, '2020-05-11 13:29:07', 0, 31, 1),
(137, 30, 31, '2020-05-11 13:30:24', 0, 31, 1),
(138, 28, 31, '2020-05-11 13:32:00', 1, 31, 1),
(139, 39, 35, '2020-05-11 13:47:33', 1, 39, 1),
(140, 35, 39, '2020-05-11 13:47:55', 1, 39, 1),
(141, 30, 39, '2020-05-11 13:48:12', 0, 39, 1),
(142, 30, 39, '2020-05-11 13:48:16', 0, 39, 1),
(143, 30, 39, '2020-05-11 13:54:53', 0, 39, 1),
(144, 30, 39, '2020-05-11 13:55:03', 0, 39, 1),
(145, 35, 39, '2020-05-11 13:55:34', 1, 39, 1),
(146, 35, 39, '2020-05-11 13:56:11', 1, 39, 1),
(147, 35, 39, '2020-05-11 13:56:36', NULL, 39, 0),
(148, 35, 39, '2020-05-11 13:57:48', 0, 39, 1),
(149, 35, 39, '2020-05-11 13:58:15', 1, 39, 1),
(150, 35, 39, '2020-05-11 14:02:09', 0, 39, 1),
(151, 35, 39, '2020-05-11 14:04:18', 0, 39, 1),
(152, 28, 31, '2020-05-11 14:04:18', 0, 31, 1),
(153, 35, 39, '2020-05-11 14:04:56', NULL, 39, 0),
(154, 28, 31, '2020-05-11 14:05:10', 0, 31, 1),
(155, 28, 31, '2020-05-11 14:05:33', 0, 31, 1),
(156, 28, 39, '2020-05-11 14:07:17', 1, 39, 1),
(157, 28, 31, '2020-05-11 14:07:29', 0, 31, 1),
(158, 29, 35, '2020-05-11 15:00:28', 0, 29, 1),
(159, 35, 29, '2020-05-11 15:02:40', 0, 29, 1),
(160, 56, 30, '2020-05-12 11:09:09', 1, 56, 1),
(161, 30, 53, '2020-05-12 15:52:55', 0, 53, 1),
(162, 30, 53, '2020-05-12 15:58:13', 3, 53, 1),
(163, 30, 53, '2020-05-12 16:05:14', 2, 53, 1),
(164, 67, 62, '2020-05-13 16:18:37', 0, 62, 1),
(165, 35, 53, '2020-05-13 16:48:26', 0, 53, 1),
(166, 35, 56, '2020-05-13 17:32:38', 0, 56, 1),
(167, 66, 31, '2020-05-13 19:54:18', 0, 31, 1),
(168, 66, 53, '2020-05-13 19:55:53', 0, 53, 1),
(169, 66, 53, '2020-05-13 20:10:34', 8, 53, 1),
(170, 35, 62, '2020-05-15 20:30:58', 0, 62, 1),
(171, 35, 76, '2020-05-15 20:54:15', 0, 76, 1),
(172, 35, 76, '2020-05-15 20:54:44', 2, 76, 1),
(173, 76, 35, '2020-05-15 21:49:39', 0, 76, 1),
(174, 76, 30, '2020-05-15 21:49:55', NULL, 76, 0),
(175, 28, 52, '2020-06-09 18:53:52', 0, 52, 1),
(176, 87, 89, '2020-06-13 16:30:11', 1, 89, 1),
(177, 87, 89, '2020-06-13 16:31:21', 0, 89, 1),
(178, 87, 89, '2020-06-13 16:32:01', 1, 89, 1),
(179, 87, 31, '2020-06-15 17:56:44', 0, 31, 1);

-- --------------------------------------------------------

--
-- 表的结构 `t_certification`
--

CREATE TABLE IF NOT EXISTS `t_certification` (
  `t_id` int(11) NOT NULL,
  `t_user_id` int(11) DEFAULT NULL,
  `t_user_photo` varchar(100) DEFAULT NULL,
  `t_user_video` varchar(100) DEFAULT NULL,
  `t_nam` varchar(24) DEFAULT NULL,
  `t_id_card` varchar(18) DEFAULT NULL,
  `t_certification_type` int(11) DEFAULT NULL COMMENT '0.未审核\r\n1.审核成功\r\n2.审核失败',
  `t_describe` varchar(100) DEFAULT NULL,
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_certification`
--

INSERT INTO `t_certification` (`t_id`, `t_user_id`, `t_user_photo`, `t_user_video`, `t_nam`, `t_id_card`, `t_certification_type`, `t_describe`, `t_create_time`) VALUES
(1, 2, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/verify/1587657704424.jpg', '', '', '', 1, NULL, '2020-04-24 00:01:50'),
(2, 3, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/verify/1587659824816.jpg', '', '', '', 1, NULL, '2020-04-24 00:37:08'),
(3, 4, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/verify/1587696519892.jpg', '', '', '', 1, NULL, '2020-04-24 10:49:28'),
(4, 9, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/verify/1588243139249.jpg', '', '', '', 1, NULL, '2020-04-30 18:39:34'),
(5, 9, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/verify/1588243139249.jpg', '', '', '', 1, NULL, '2020-04-30 18:39:34'),
(6, 9, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/verify/1588243139249.jpg', '', '', '', 1, NULL, '2020-04-30 18:39:34'),
(7, 14, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/verify/1588414522771.jpg', '', '', '', 1, NULL, '2020-05-02 18:15:33'),
(8, 16, 'http://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/15885703923623.png', '', '', '', 1, NULL, '2020-05-04 13:33:20'),
(9, 29, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/verify/1589024691216.jpg', '', '', '', 1, NULL, '2020-05-09 19:44:58'),
(10, 29, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/verify/1589024691216.jpg', '', '', '', 1, NULL, '2020-05-09 19:44:58'),
(11, 31, 'http://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/15890259219558.png', '', '', '', 1, NULL, '2020-05-09 20:05:22'),
(12, 39, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/verify/1589173462814.jpg', '', '', '', 1, NULL, '2020-05-11 13:04:30'),
(13, 52, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/verify/1589220227144.jpg', '', '', '', 1, NULL, '2020-05-12 02:03:53'),
(14, 53, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/verify/1589222224833.jpg', '', '', '', 1, NULL, '2020-05-12 02:37:09'),
(15, 56, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/verify/1589251745097.jpg', '', '', '', 1, NULL, '2020-05-12 10:49:11'),
(16, 61, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/verify/1589280705067.jpg', '', '', '', 1, NULL, '2020-05-12 18:51:50'),
(17, 62, 'http://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/15893520486706.png', '', '', '', 1, NULL, '2020-05-13 14:40:51'),
(18, 76, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/verify/1589541427076.jpg', '', '', '', 1, NULL, '2020-05-15 19:17:16'),
(19, 89, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/verify/1592036516077.jpg', '', '', '', 1, NULL, '2020-06-13 16:22:17'),
(20, 91, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/verify/1592117520842.jpg', '', '', '', 1, NULL, '2020-06-14 14:52:26'),
(21, 97, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/verify/1592715852804.jpg', '', '', '', 1, NULL, '2020-06-21 13:04:16');

-- --------------------------------------------------------

--
-- 表的结构 `t_channel_pac`
--

CREATE TABLE IF NOT EXISTS `t_channel_pac` (
  `t_id` int(11) NOT NULL,
  `t_pac_name` varchar(255) DEFAULT NULL COMMENT '基础包名',
  `t_pac_version` varchar(255) DEFAULT NULL COMMENT '基础包版本',
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `t_channel_pac_dow_log`
--

CREATE TABLE IF NOT EXISTS `t_channel_pac_dow_log` (
  `t_id` int(11) NOT NULL,
  `t_user_id` int(11) DEFAULT NULL COMMENT '用户Id',
  `t_channel_pac_name` varchar(255) DEFAULT NULL COMMENT '渠道包CODE',
  `t_dow_url` varchar(255) DEFAULT NULL COMMENT '渠道包下载地址',
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `t_check_user_info`
--

CREATE TABLE IF NOT EXISTS `t_check_user_info` (
  `t_id` int(11) NOT NULL,
  `t_user_id` int(11) DEFAULT NULL,
  `t_nickName` varchar(255) DEFAULT NULL,
  `t_creat_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `t_comment`
--

CREATE TABLE IF NOT EXISTS `t_comment` (
  `t_id` int(11) NOT NULL,
  `t_com_user_id` int(11) DEFAULT NULL,
  `t_cover_user_id` int(11) DEFAULT NULL,
  `t_com_type` int(11) DEFAULT NULL COMMENT '0.评论\r\n1.回复评论',
  `t_comment` varchar(500) DEFAULT NULL,
  `t_create_time` datetime DEFAULT NULL,
  `t_is_del` int(11) DEFAULT NULL COMMENT '0.未删除\r\n1.已删除',
  `t_dynamic_id` int(11) DEFAULT NULL,
  `t_is_examine` int(11) DEFAULT NULL,
  `t_is_read` int(11) DEFAULT NULL COMMENT '0.未读1.已读'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `t_comment_count`
--

CREATE TABLE IF NOT EXISTS `t_comment_count` (
  `t_id` int(11) NOT NULL,
  `t_user_id` int(11) DEFAULT NULL,
  `t_mesg_count` int(11) DEFAULT NULL,
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `t_coordinate`
--

CREATE TABLE IF NOT EXISTS `t_coordinate` (
  `t_id` int(11) NOT NULL,
  `t_user_id` int(11) DEFAULT NULL,
  `t_lng` double DEFAULT NULL,
  `t_lat` double DEFAULT NULL,
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_coordinate`
--

INSERT INTO `t_coordinate` (`t_id`, `t_user_id`, `t_lng`, `t_lat`, `t_create_time`) VALUES
(1, 1, 109.29423, 30.358064, '2020-05-09 17:13:33'),
(2, 2, 109.299819, 30.363099, '2020-05-09 19:30:50'),
(3, 4, 109.500574, 30.297856, '2020-04-24 10:47:58'),
(4, 6, 109.46383, 30.318348, '2020-05-09 13:30:18'),
(5, 8, 109.470331, 30.323475, '2020-05-02 17:56:15'),
(6, 9, 109.299856, 30.363141, '2020-05-09 19:28:55'),
(7, 3, 109.469321, 30.322679, '2020-04-30 16:53:29'),
(8, 5, 103.664427, 25.058635, '2020-05-05 14:35:29'),
(9, 14, 109.470024, 30.322519, '2020-05-03 15:01:29'),
(10, 15, 109.469765, 30.322688, '2020-05-03 16:26:19'),
(11, 7, 109.500229, 30.302273, '2020-05-08 14:32:21'),
(12, 16, 109.500221, 30.302107, '2020-05-08 14:27:56'),
(13, 12, 116.300835, 27.937599, '2020-05-08 14:41:06'),
(14, 17, 114.266533, 30.416933, '2020-05-07 12:16:38'),
(15, 18, 109.500359, 30.29825, '2020-05-07 18:17:22'),
(16, 19, 109.478256, 30.25201, '2020-05-07 22:28:37'),
(17, 21, 109.478127, 30.252083, '2020-05-08 14:41:11'),
(18, 11, 116.41025143091747, 39.91639643210142, '2020-05-08 18:03:14'),
(19, 22, 109.705406, 30.576004, '2020-05-09 12:43:14'),
(20, 23, 109.463889, 30.318472, '2020-05-09 13:27:34'),
(21, 26, 109.299893, 30.363048, '2020-05-09 19:17:48'),
(22, 27, 109.46933, 30.322691, '2020-05-27 10:16:38'),
(23, 29, 104.06572, 30.647783, '2020-05-17 17:47:20'),
(24, 30, 109.500456, 30.297848, '2020-05-16 10:33:46'),
(25, 28, 109.500484, 30.297402, '2020-06-20 00:07:51'),
(26, 31, 109.469704, 30.322931, '2020-05-10 12:16:54'),
(27, 35, 109.500275, 30.302103, '2020-05-15 10:44:39'),
(28, 39, 109.963562, 30.650667, '2020-05-16 10:02:44'),
(29, 37, 109.705399, 30.576008, '2020-05-11 13:09:44'),
(30, 49, 109.47612, 30.635903, '2020-05-11 16:10:18'),
(31, 46, 109.477838, 30.286435, '2020-05-25 09:22:01'),
(32, 51, 109.538702, 30.296893, '2020-05-12 10:10:08'),
(33, 54, 116.64415, 31.778151, '2020-05-12 03:46:53'),
(34, 52, 114.466579, 23.099204, '2020-05-16 17:18:41'),
(35, 53, 119.94405, 31.673788, '2020-05-25 18:11:03'),
(36, 56, 107.771703, 27.898911, '2020-05-13 08:49:50'),
(37, 57, 116.364326, 27.953451, '2020-05-29 23:09:30'),
(38, 62, 105.156204, 30.355551, '2020-05-12 19:53:54'),
(39, 63, 120.651187, 30.903327, '2020-05-12 21:18:46'),
(40, 61, 115.808851, 28.682986, '2020-06-01 08:30:31'),
(41, 58, 121.213036, 31.246041, '2020-05-13 09:28:08'),
(42, 65, 113.858939, 23.099089, '2020-05-13 14:13:11'),
(43, 67, 109.497649, 30.297764, '2020-05-29 02:26:07'),
(44, 66, 109.463464, 30.289311, '2020-06-03 18:45:28'),
(45, 69, 112.878448, 23.114222, '2020-05-13 19:36:47'),
(46, 42, 109.478325, 30.251974, '2020-05-17 00:59:47'),
(47, 72, 120.689401, 27.812905, '2020-05-15 13:36:11'),
(48, 75, 109.740944, 30.637638, '2020-05-15 11:32:11'),
(49, 76, 112.790962, 34.707249, '2020-05-16 11:55:15'),
(50, 82, 116.293961, 39.831997, '2020-05-22 15:46:30'),
(51, 84, 113.388089, 23.023144, '2020-05-25 14:35:41'),
(52, 71, 113.471199, 22.273056, '2020-05-30 08:48:39'),
(53, 80, 115.999464, 29.729295, '2020-06-11 02:27:19'),
(54, 83, 113.25526, 23.205115, '2020-06-10 20:10:08'),
(55, 87, 114.419198, 23.128473, '2020-06-20 00:09:03'),
(56, 89, 114.419235, 23.128571, '2020-06-20 01:29:17'),
(57, 32, 104.133072, 30.668577, '2020-06-13 16:48:18'),
(58, 86, 106.598877, 29.600453, '2020-06-14 04:47:56'),
(59, 91, 114.419223, 23.12849, '2020-06-15 18:23:03'),
(60, 93, 112.988022, 28.082151, '2020-06-18 01:10:29'),
(61, 92, 109.505262, 30.276569, '2020-06-18 20:37:31'),
(62, 95, 109.500587, 30.297626, '2020-06-22 00:33:33'),
(63, 96, 117.015844, 28.223893, '2020-06-22 10:46:00'),
(64, 97, 117.015892, 28.223829, '2020-06-22 11:12:22');

-- --------------------------------------------------------

--
-- 表的结构 `t_cover_examine`
--

CREATE TABLE IF NOT EXISTS `t_cover_examine` (
  `t_id` int(11) NOT NULL,
  `t_img_url` varchar(150) DEFAULT NULL,
  `t_user_id` int(11) DEFAULT NULL,
  `t_first` int(11) DEFAULT NULL COMMENT '是否设置为第一涨\r\n0.是\r\n1.否',
  `t_is_examine` int(11) DEFAULT NULL COMMENT '0.未审核1.已审核',
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_cover_examine`
--

INSERT INTO `t_cover_examine` (`t_id`, `t_img_url`, `t_user_id`, `t_first`, `t_is_examine`, `t_create_time`) VALUES
(1, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/cover/1587657280920.png', 1, 0, 1, '2020-04-23 23:54:43'),
(6, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/cover/1587659834749.png', 3, 0, 1, '2020-04-24 00:37:16'),
(9, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/cover/1588243797062.png', 6, 0, 1, '2020-04-30 18:50:04'),
(11, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200430/202004300705195393.jpg', 9, 1, 1, '2020-04-30 19:05:20'),
(12, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200430/202004300705287022.jpg', 9, 1, 1, '2020-04-30 19:05:29'),
(13, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/cover/1588245798374.png', 3, 1, 1, '2020-04-30 19:23:27'),
(14, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/cover/1588324090362.png', 11, 0, 1, '2020-05-01 17:08:18'),
(15, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200502/202005020607489400.jpg', 2, 0, 1, '2020-05-02 18:07:48'),
(16, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200502/202005020609088697.jpg', 4, 0, 1, '2020-05-02 18:09:09'),
(17, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/cover/1588414551273.png', 14, 0, 1, '2020-05-02 18:15:59'),
(18, 'http://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/15884455681730.png', 3, 1, 1, '2020-05-03 02:52:55'),
(19, 'http://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/15885704905757.png', 16, 0, 1, '2020-05-04 13:34:59'),
(20, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/cover/1589002949153.png', 24, 0, 1, '2020-05-09 13:42:34'),
(22, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200509/202005090751433500.jpg', 29, 1, 1, '2020-05-09 19:51:44'),
(23, 'http://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/15890259437908.png', 31, 1, 1, '2020-05-09 20:05:43'),
(25, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200510/202005101112275727.jpg', 31, 0, 1, '2020-05-10 11:12:27'),
(26, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200510/202005101118157916.jpg', 33, 0, 1, '2020-05-10 11:18:15'),
(27, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200510/202005101131052301.jpg', 34, 0, 1, '2020-05-10 11:31:06'),
(28, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200510/202005101135279401.jpg', 30, 1, 1, '2020-05-10 11:35:28'),
(29, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200510/202005101136084656.jpg', 29, 0, 1, '2020-05-10 11:36:08'),
(30, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200511/202005110101002898.jpg', 36, 0, 1, '2020-05-11 01:01:00'),
(31, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200511/20200511010051820.jpg', 38, 0, 1, '2020-05-11 13:00:51'),
(32, 'http://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/15891736749015.png', 39, 0, 1, '2020-05-11 13:07:57'),
(33, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200511/20200511024208913.jpg', 43, 0, 1, '2020-05-11 14:42:08'),
(34, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200511/202005110252556655.jpg', 45, 0, 1, '2020-05-11 14:52:56'),
(35, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200511/202005111034107290.jpg', 50, 0, 1, '2020-05-11 22:34:10'),
(36, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/cover/1589220238867.png', 52, 0, 1, '2020-05-12 02:04:02'),
(38, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/cover/1589222264274.png', 53, 0, 1, '2020-05-12 02:37:46'),
(39, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/cover/1589251764629.png', 56, 0, 1, '2020-05-12 10:49:28'),
(40, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/cover/1589280716089.png', 61, 0, 1, '2020-05-12 18:51:59'),
(41, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/cover/1589280727925.png', 61, 1, 1, '2020-05-12 18:52:10'),
(42, 'http://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/15893520647451.png', 62, 0, 1, '2020-05-13 14:41:07'),
(43, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/cover/1589546251769.png', 76, 0, 1, '2020-05-15 20:37:39'),
(44, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/cover/1592036537211.png', 89, 0, 1, '2020-06-13 16:22:36');

-- --------------------------------------------------------

--
-- 表的结构 `t_cps`
--

CREATE TABLE IF NOT EXISTS `t_cps` (
  `t_id` int(11) NOT NULL,
  `t_cps_id` int(11) DEFAULT NULL,
  `t_real_name` varchar(20) DEFAULT NULL,
  `t_vip_commission` double(3,2) DEFAULT NULL,
  `t_gold_commission` double(3,2) DEFAULT NULL,
  `t_settlement_type` int(11) DEFAULT NULL COMMENT '0.支付宝1.微信2.银行卡',
  `t_bank_number` varchar(50) DEFAULT NULL,
  `t_bank_of_deposit` varchar(255) DEFAULT NULL,
  `t_account_name` varchar(100) DEFAULT NULL,
  `t_remarks` varchar(500) DEFAULT NULL,
  `t_create_time` datetime DEFAULT NULL,
  `t_channel_name` varchar(255) DEFAULT NULL,
  `t_settlement_method` int(1) DEFAULT '0' COMMENT '0:CPS计算  1:CPA计算',
  `t_settlement_percent` int(3) DEFAULT '100' COMMENT '结算转化率',
  `t_channel_price` decimal(10,2) DEFAULT '0.00' COMMENT 'CPA单价'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `t_cps_bulletin`
--

CREATE TABLE IF NOT EXISTS `t_cps_bulletin` (
  `t_id` int(11) NOT NULL,
  `t_title` varchar(20) DEFAULT NULL,
  `t_img` varchar(500) DEFAULT NULL,
  `t_content` varchar(5000) DEFAULT NULL,
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `t_cps_day_income`
--

CREATE TABLE IF NOT EXISTS `t_cps_day_income` (
  `t_id` int(11) NOT NULL,
  `t_uid` int(11) DEFAULT NULL,
  `t_channel_name` varchar(255) DEFAULT NULL,
  `t_parent_id` int(11) DEFAULT NULL,
  `t_install_amount` int(11) DEFAULT NULL,
  `t_vip_income` decimal(10,2) DEFAULT NULL,
  `t_gold_income` decimal(10,2) DEFAULT NULL,
  `t_vip_income_two` decimal(10,2) DEFAULT NULL,
  `t_gold_income_two` decimal(10,2) DEFAULT NULL,
  `t_day` date DEFAULT NULL,
  `t_settle_accounts` int(11) DEFAULT NULL,
  `t_cps_id` int(11) DEFAULT NULL,
  `t_user_android` int(11) DEFAULT '0' COMMENT '安卓用户',
  `t_user_iphone` int(11) DEFAULT '0' COMMENT '苹果用户',
  `t_settlement_percent` int(3) DEFAULT '0' COMMENT '结算转化率,默认t_cps表中t_settlement_percent字段,可在发布前修改',
  `t_is_release` int(1) DEFAULT '0' COMMENT '是否发布:0 未发布  1 已发布'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `t_cps_devote`
--

CREATE TABLE IF NOT EXISTS `t_cps_devote` (
  `t_id` int(11) NOT NULL,
  `t_user_id` int(11) DEFAULT NULL,
  `t_recharge_money` decimal(7,2) DEFAULT NULL COMMENT '贡献金额(二级代理是在一级代理金额上计算的百分比,不是用户直接贡献的百分比)',
  `t_store_type` int(11) DEFAULT NULL COMMENT '充值类型(1:金币充值 2:vip充值)',
  `t_cps_id` int(11) DEFAULT NULL,
  `t_devote_value` decimal(7,2) DEFAULT NULL,
  `t_create_time` datetime DEFAULT NULL,
  `t_ratio` int(11) DEFAULT NULL,
  `t_channel_level` int(11) DEFAULT NULL,
  `t_source_id` int(11) DEFAULT NULL,
  `t_channel_name` varchar(255) DEFAULT NULL,
  `t_cps_status` int(1) DEFAULT '0' COMMENT '当前订单状态:0:无效订单,CPS满N减1  1:有效订单',
  `t_cps_parent_id` int(1) DEFAULT '0' COMMENT '一级渠道Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `t_cps_dow`
--

CREATE TABLE IF NOT EXISTS `t_cps_dow` (
  `t_id` int(11) NOT NULL,
  `t_name` varchar(20) DEFAULT NULL,
  `t_jump_url` varchar(200) DEFAULT NULL,
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `t_cps_material`
--

CREATE TABLE IF NOT EXISTS `t_cps_material` (
  `t_id` int(11) NOT NULL,
  `t_img` varchar(500) DEFAULT NULL,
  `t_size` varchar(100) DEFAULT NULL,
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `t_cps_settlement`
--

CREATE TABLE IF NOT EXISTS `t_cps_settlement` (
  `t_id` int(11) NOT NULL,
  `t_cps_id` int(11) DEFAULT NULL,
  `t_settlement_amount` decimal(9,2) DEFAULT NULL,
  `t_order_no` varchar(100) DEFAULT NULL,
  `t_settlement_type` int(11) DEFAULT NULL COMMENT '0.结算成功\r\n1.结算失败',
  `t_createt_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `t_cps_user`
--

CREATE TABLE IF NOT EXISTS `t_cps_user` (
  `t_id` int(11) NOT NULL,
  `t_login_phone` varchar(20) DEFAULT NULL,
  `t_password` varchar(50) DEFAULT NULL,
  `t_uid` int(11) DEFAULT NULL,
  `t_parent_id` int(11) DEFAULT '0',
  `t_start_using` int(11) DEFAULT '0',
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `t_device`
--

CREATE TABLE IF NOT EXISTS `t_device` (
  `t_id` int(11) NOT NULL,
  `t_phone_type` varchar(200) DEFAULT NULL,
  `t_system_version` varchar(200) DEFAULT NULL,
  `t_ip_address` varchar(255) DEFAULT NULL,
  `t_referee_id` int(11) DEFAULT NULL,
  `t_is_use` int(11) DEFAULT NULL COMMENT '0.未使用\r\n1.已使用',
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_device`
--

INSERT INTO `t_device` (`t_id`, `t_phone_type`, `t_system_version`, `t_ip_address`, `t_referee_id`, `t_is_use`, `t_create_time`) VALUES
(1, 'iPhone', 'iPhone OS 10_2', '116.21.94.239', 3, 0, '2020-05-07 01:17:14'),
(2, '', '', '171.115.79.194', 7, 0, '2020-05-07 01:37:19'),
(3, 'iPhone', 'iPhone OS 13_3_1', '183.93.4.126', 6, 0, '2020-05-07 11:36:18'),
(4, 'Android', 'Android 9', '171.82.154.158', 1, 0, '2020-05-07 11:37:29'),
(5, 'Android', 'Android 9', '61.151.178.176', 9, 0, '2020-05-07 11:39:52'),
(6, '', '', '171.115.79.194', 7, 0, '2020-05-07 11:44:26'),
(7, '', '', '171.115.79.194', 6, 0, '2020-05-07 11:45:01'),
(8, 'iPhone', 'iPhone OS 13_3_1', '183.93.4.126', 6, 0, '2020-05-07 11:45:41'),
(9, 'iPhone', 'iPhone OS 13_3_1', '61.129.8.250', 6, 0, '2020-05-07 11:46:21'),
(10, '', '', '171.115.79.194', 6, 0, '2020-05-07 11:46:40'),
(11, 'iPhone', 'iPhone OS 13_3_1', '183.93.4.126', 6, 0, '2020-05-07 11:48:01'),
(12, 'iPhone', 'iPhone OS 13_3_1', '183.93.4.126', 9, 0, '2020-05-07 11:49:10'),
(13, '', '', '171.115.79.194', 6, 0, '2020-05-07 11:49:35'),
(14, 'iPhone', 'iPhone OS 13_3_1', '183.93.4.126', 9, 0, '2020-05-07 11:49:37'),
(15, 'iPhone', 'iPhone OS 13_3_1', '171.115.79.194', 6, 0, '2020-05-07 11:50:05'),
(16, 'iPhone', 'iPhone OS 9_2', '183.93.4.126', 9, 0, '2020-05-07 11:52:37'),
(17, 'iPhone', 'iPhone OS 9_2', '183.93.4.126', 9, 0, '2020-05-07 11:53:09'),
(18, '', '', '171.115.79.194', 6, 0, '2020-05-07 11:54:16'),
(19, '', '', '171.115.79.194', 6, 0, '2020-05-07 11:55:00'),
(20, 'iPhone', 'iPhone OS 13_4_1', '183.95.251.111', 6, 0, '2020-05-07 12:06:48'),
(21, 'Android', 'Android 9', '223.104.64.219', 1, 0, '2020-05-08 12:53:27'),
(22, 'Android', 'Android 9', '171.115.190.188', 1, 0, '2020-05-08 15:11:31'),
(23, 'Android', 'Android 9', '111.178.233.37', 1, 0, '2020-05-08 20:29:54'),
(24, 'Android', 'Android 9', '61.151.207.252', 9, 0, '2020-05-09 12:53:18'),
(25, 'Android', 'Android 9', '223.104.20.161', 1, 0, '2020-05-09 13:25:55'),
(26, 'iPhone', 'iPhone OS 13_3_1', '61.151.178.176', 6, 0, '2020-05-09 13:32:27'),
(27, 'Android', 'Android 8.1.0', '223.167.152.20', 6, 0, '2020-05-09 13:37:41'),
(28, 'iPhone', 'iPhone OS 13_3_1', '183.93.16.143', 6, 0, '2020-05-09 13:57:27'),
(29, 'Android', 'Android 9', '171.115.190.188', 9, 0, '2020-05-09 19:15:48'),
(30, 'Android', 'Android 9', '171.115.190.188', 27, 0, '2020-05-09 19:39:56'),
(31, 'Android', 'Android 7.1.1', '183.93.17.4', 27, 1, '2020-05-09 19:40:08'),
(32, 'Android', 'Android 9', '171.115.190.188', 28, 0, '2020-05-09 19:44:01'),
(33, 'iPhone', 'iPhone OS 13_3_1', '171.115.147.91', 28, 0, '2020-05-10 09:10:53'),
(34, 'Android', 'Android 6.0.1', '171.115.187.53', 37, 0, '2020-05-11 12:56:38'),
(35, 'iPhone', 'iPhone OS 13_3_1', '171.115.79.194', 35, 0, '2020-05-11 14:11:36'),
(36, 'Android', 'Android 8.0.0', '49.7.4.175', 39, 0, '2020-05-11 14:18:35'),
(37, 'Android', 'Android 9', '171.82.191.46', 35, 0, '2020-05-11 14:39:00'),
(38, 'Android', 'Android 9', '121.10.121.83', 39, 0, '2020-05-11 14:56:16'),
(39, 'Android', 'Android 7.1.1', '61.129.8.250', 35, 0, '2020-05-11 15:26:22'),
(40, 'Android', 'Android 10', '116.52.185.211', 35, 1, '2020-05-11 15:40:42'),
(41, 'iPhone', 'iPhone OS 13_3_1', '14.106.161.21', 35, 0, '2020-05-11 15:49:56'),
(42, 'Android', 'Android 5.1.1', '119.84.153.195', 35, 0, '2020-05-11 16:04:36'),
(43, 'Android', 'Android 9', '111.8.45.85', 35, 0, '2020-05-11 23:06:18'),
(44, 'Android', 'Android 9', '222.185.131.66', 39, 1, '2020-05-12 01:58:20'),
(45, 'Android', 'Android 7.1.2', '58.250.137.193', 39, 0, '2020-05-12 01:58:51'),
(46, 'iPhone', 'iPhone OS 13_3', '139.207.108.239', 39, 0, '2020-05-12 02:03:36'),
(47, 'Android', 'Android 10', '218.68.91.112', 39, 0, '2020-05-12 02:30:26'),
(48, 'Android', 'Android 10', '222.70.126.234', 42, 0, '2020-05-12 02:37:08'),
(49, 'Android', 'Android 9', '119.84.153.247', 39, 0, '2020-05-12 03:22:48'),
(50, 'iPhone', 'iPhone OS 13_3_1', '36.161.10.13', 42, 0, '2020-05-12 03:36:38'),
(51, 'iPhone', 'iPhone OS 13_3_1', '115.195.123.140', 42, 0, '2020-05-12 07:15:53'),
(52, 'iPhone', 'iPhone OS 13_4_1', '49.7.4.238', 42, 0, '2020-05-12 07:30:44'),
(53, 'Android', 'Android 9', '183.3.227.100', 39, 0, '2020-05-12 08:21:07'),
(54, 'Android', 'Android 7.1.1', '111.41.189.227', 39, 0, '2020-05-12 09:04:36'),
(55, 'Android', 'Android 9', '183.3.227.100', 39, 0, '2020-05-12 09:16:54'),
(56, 'iPhone', 'iPhone OS 13_4_1', '121.207.113.81', 42, 0, '2020-05-12 10:01:06'),
(57, 'iPhone', 'iPhone OS 13_4_1', '183.18.44.87', 30, 0, '2020-05-12 10:50:57'),
(58, 'Android', 'Android 10', '183.226.88.22', 35, 0, '2020-05-12 13:20:28'),
(59, 'Android', 'Android 9', '117.136.53.5', 35, 0, '2020-05-12 13:54:51'),
(60, 'Android', 'Android 8.1.0', '223.152.141.236', 39, 0, '2020-05-12 17:01:17'),
(61, 'iPhone', 'iPhone OS 12_0_1', '101.107.195.95', 39, 0, '2020-05-12 17:34:12'),
(62, 'Android', 'Android 8.1.0', '117.166.66.224', 39, 0, '2020-05-12 18:47:26'),
(63, 'Android', 'Android 5.1', '180.108.109.43', 39, 0, '2020-05-12 20:37:07'),
(64, 'Android', 'Android 9', '157.255.73.51', 39, 0, '2020-05-12 23:39:18'),
(65, 'iPhone', 'iPhone OS 13_3', '61.151.178.168', 42, 0, '2020-05-13 11:45:23'),
(66, 'iPhone', 'iPhone OS 13_3', '61.151.178.168', 42, 0, '2020-05-13 11:45:23'),
(67, 'iPhone', 'iPhone OS 13_3', '61.151.178.168', 42, 0, '2020-05-13 11:45:23'),
(68, 'Android', 'Android 6.0', '223.104.65.194', 35, 0, '2020-05-13 14:08:56'),
(69, 'Android', 'Android 10', '171.115.77.102', 35, 1, '2020-05-13 16:14:19'),
(70, 'Android', 'Android 9', '171.11.27.220', 39, 1, '2020-05-13 16:14:52'),
(71, 'Android', 'Android 9', '61.129.7.217', 35, 0, '2020-05-13 16:14:57'),
(72, 'Android', 'Android 9', '183.92.248.50', 35, 0, '2020-05-13 22:00:18'),
(73, 'iPhone', 'iPhone OS 13_3_1', '115.231.154.84', 35, 0, '2020-05-13 22:02:27'),
(74, 'iPhone', 'iPhone OS 13_3', '171.115.124.43', 35, 0, '2020-05-14 09:46:24'),
(75, 'iPhone', 'iPhone OS 9_3_5', '223.104.170.171', 42, 0, '2020-05-14 11:27:17'),
(76, 'Android', 'Android 10', '171.83.99.145', 42, 0, '2020-05-14 11:29:34'),
(77, 'Android', 'Android 9', '183.3.255.28', 30, 0, '2020-05-14 17:24:43'),
(78, 'Android', 'Android 9', '106.33.17.212', 35, 0, '2020-05-14 17:27:20'),
(79, 'Android', 'Android 9', '58.246.221.161', 35, 0, '2020-05-15 10:28:42'),
(80, 'Android', 'Android 9', '101.226.225.86', 35, 0, '2020-05-15 10:35:42'),
(81, 'Android', 'Android 9', '223.167.152.13', 35, 0, '2020-05-15 10:42:12'),
(82, 'Android', 'Android 9', '61.129.10.43', 35, 0, '2020-05-15 10:44:05'),
(83, 'Android', 'Android 9', '61.129.10.43', 35, 0, '2020-05-15 10:48:50'),
(84, 'iPhone', 'iPhone OS 12_1_2', '43.227.138.84', 74, 0, '2020-05-15 11:06:55'),
(85, 'Android', 'Android 9', '125.39.132.70', 39, 0, '2020-05-15 19:12:00'),
(86, 'Android', 'Android 9', '119.172.3.128', 39, 0, '2020-05-16 17:21:40'),
(87, 'Android', 'Android 10', '221.233.102.176', 39, 1, '2020-05-17 01:28:42'),
(88, 'Android', 'Android 9', '117.183.109.192', 39, 0, '2020-05-18 00:47:41'),
(89, 'Android', 'Android 9', '180.125.37.32', 39, 0, '2020-05-18 12:32:15'),
(90, 'iPhone', 'iPhone OS 13_3_1', '219.137.118.163', 27, 0, '2020-05-20 02:37:35'),
(91, 'Android', 'Android 10', '116.23.161.187', 35, 1, '2020-05-24 15:24:24'),
(92, 'iPhone', 'iPhone OS 13_3_1', '171.43.188.97', 35, 0, '2020-05-24 15:25:21'),
(93, 'iPhone', 'iPhone OS 13_4_1', '27.30.144.26', 35, 0, '2020-05-24 15:27:26'),
(94, '', '', '27.30.144.26', 35, 0, '2020-05-24 15:28:01'),
(95, '', '', '27.30.144.26', 35, 0, '2020-05-24 15:28:11'),
(96, '', '', '27.30.144.26', 35, 0, '2020-05-24 15:28:16'),
(97, 'iPhone', 'iPhone OS 13_4_1', '27.30.144.26', 35, 0, '2020-05-24 15:28:27'),
(98, 'iPhone', 'iPhone OS 13_4_1', '27.30.144.26', 35, 0, '2020-05-24 15:29:10'),
(99, '', '', '27.30.144.26', 39, 0, '2020-05-24 15:30:19'),
(100, '', '', '27.30.144.26', 39, 0, '2020-05-24 15:32:20'),
(101, 'iPhone', 'iPhone OS 13_5', '27.30.144.26', 35, 0, '2020-05-24 15:34:10'),
(102, 'iPhone', 'iPhone OS 8_4_1', '183.93.4.14', 27, 0, '2020-05-24 15:39:54'),
(103, 'iPhone', 'iPhone OS 13_3_1', '171.43.188.97', 35, 0, '2020-05-24 15:40:12'),
(104, 'iPhone', 'iPhone OS 12_4', '183.93.4.14', 27, 0, '2020-05-24 15:41:17'),
(105, 'iPhone', 'iPhone OS 13_4_1', '27.30.144.26', 35, 0, '2020-05-24 15:41:33'),
(106, '', '', '27.30.144.26', 35, 0, '2020-05-24 15:43:07'),
(107, '', '', '27.30.144.26', 35, 0, '2020-05-24 15:43:32'),
(108, 'iPhone', 'iPhone OS 8_4_1', '183.93.4.14', 27, 0, '2020-05-24 15:43:34'),
(109, '', '', '27.30.144.26', 35, 0, '2020-05-24 15:43:37'),
(110, '', '', '27.30.144.26', 35, 0, '2020-05-24 15:43:40'),
(111, 'iPhone', 'iPhone OS 9_2', '183.93.4.14', 27, 0, '2020-05-24 15:44:11'),
(112, 'iPhone', 'iPhone OS 13_4_1', '27.30.144.26', 35, 0, '2020-05-24 15:44:54'),
(113, '', '', '27.30.144.26', 35, 0, '2020-05-25 14:46:12'),
(114, 'iPhone', 'iPhone OS 13_4_1', '27.30.144.26', 35, 0, '2020-05-25 14:46:40'),
(115, '', '', '27.30.144.26', 35, 0, '2020-05-25 14:47:28'),
(116, '', '', '27.30.144.26', 35, 0, '2020-05-25 14:47:38'),
(117, 'iPhone', 'iPhone OS 13_3_1', '221.232.103.148', 35, 1, '2020-05-25 15:01:44'),
(118, 'Android', 'Android 9', '61.151.207.252', 35, 0, '2020-05-25 15:18:51'),
(119, 'iPhone', 'iPhone OS 12_4', '183.95.249.188', 27, 0, '2020-05-25 15:56:46'),
(120, 'Android', 'Android 10', '171.115.146.59', 28, 1, '2020-06-13 17:06:26');

-- --------------------------------------------------------

--
-- 表的结构 `t_device_login_log`
--

CREATE TABLE IF NOT EXISTS `t_device_login_log` (
  `t_id` int(11) NOT NULL,
  `t_device_number` varchar(255) DEFAULT NULL,
  `t_user_id` int(11) DEFAULT NULL,
  `t_user_ip` varchar(255) DEFAULT NULL,
  `t_login_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_device_login_log`
--

INSERT INTO `t_device_login_log` (`t_id`, `t_device_number`, `t_user_id`, `t_user_ip`, `t_login_time`) VALUES
(1, 'bdf07cd7058b3ca6193274d8443d5f20', NULL, '106.61.144.26', '2020-04-29 18:34:03'),
(2, '3156906c6ad66c5021b9015f140eaaa1', NULL, '113.57.182.32', '2020-04-30 12:23:00'),
(3, '7df1856ef9eb9bbb0dc15bfa47ea8b37', NULL, '183.93.4.126', '2020-04-30 16:07:46'),
(4, 'D1BB025F-80DC-4F69-8F9E-50096ABC41C8', NULL, '113.57.244.149', '2020-05-01 14:37:31'),
(5, 'BF2839F4-B975-47D9-9084-3DC714260841', NULL, '117.136.125.134', '2020-05-01 17:08:57'),
(6, '1BCD957A-E250-4E67-97CE-22A1DEBD2976', NULL, '171.115.79.194', '2020-05-04 13:32:43'),
(7, '1DFA2BD2-915C-4755-9D11-9A4DEF37FA5A', NULL, '171.115.147.91', '2020-05-07 18:11:12'),
(8, '220044D8-731D-42EF-8215-BDC256B74D53', NULL, '119.36.201.135', '2020-05-08 14:40:38'),
(9, '68174c4d7cc64459641ed1132cf7f88c', NULL, '223.104.20.161', '2020-05-09 13:32:40'),
(10, 'AA238E90-85FC-46A0-8289-8F318BD58C73', NULL, '101.206.170.47', '2020-05-10 01:26:15'),
(11, 'FB4E0342-FDA9-49AD-9EBF-189168AC1F56', NULL, '171.115.187.53', '2020-05-11 12:54:06'),
(12, '3036ab9bc9eefc24f98a1f8d54fa09f5', NULL, '116.52.185.211', '2020-05-11 15:42:14'),
(13, '8D6B1443-C775-42B7-B0CB-CFD92451E6E7', NULL, '14.106.161.21', '2020-05-11 15:54:40'),
(14, 'b8bada6d2e7c0d9d2ed8d58377001cd9', NULL, '124.162.14.24', '2020-05-11 16:10:06'),
(15, '547a3582e195c8f827b850786964990b', NULL, '111.8.45.85', '2020-05-11 23:09:08'),
(16, 'D9AC5ECD-9923-4FCF-9A86-CF05A033CBED', NULL, '36.161.10.13', '2020-05-12 03:45:41'),
(17, '525E08A9-4B71-4D80-B59C-0F48BC394594', NULL, '117.136.126.151', '2020-05-12 12:10:02'),
(18, '6C4153D6-7FF8-42ED-8E37-9A926239BDB1', NULL, '14.25.38.48', '2020-05-13 19:35:31'),
(19, '9d3a93cf6f9ad12a0a34793abef84338', NULL, '112.17.247.133', '2020-05-15 00:53:06'),
(20, '37B45203-2530-465E-8480-00E790C8FC81', NULL, '115.231.154.83', '2020-05-15 11:17:39'),
(21, '54b561679659ec56266b5d6c23736317', NULL, '139.201.250.93', '2020-05-15 21:45:05'),
(22, 'EE8D57B6-6278-40D0-A851-96E1F8A29B18', NULL, '219.137.118.163', '2020-05-20 02:40:24'),
(23, '523287585b08ec94da19d3eede709da2', NULL, '113.46.159.248', '2020-05-22 15:44:55'),
(24, '8a1e02396f3f9c0c970cf9eb55307477', NULL, '113.111.187.50', '2020-05-22 20:47:12'),
(25, '2238991a01504ccb431dfc2353178180', NULL, '116.23.161.187', '2020-05-24 15:25:30'),
(26, '5DF81866-71AD-4577-B730-CCF9F81F14BF', NULL, '221.232.103.148', '2020-05-25 15:49:58'),
(27, '3456E876-55D0-448C-9B6B-6EDD95AEE662', NULL, '110.52.216.240', '2020-06-18 01:02:09');

-- --------------------------------------------------------

--
-- 表的结构 `t_disable`
--

CREATE TABLE IF NOT EXISTS `t_disable` (
  `t_id` int(11) NOT NULL,
  `t_user_id` int(11) DEFAULT NULL,
  `t_context` varchar(255) DEFAULT NULL,
  `t_disable_time` int(11) DEFAULT NULL,
  `t_start_time` datetime DEFAULT NULL,
  `t_end_time` datetime DEFAULT NULL,
  `t_state` int(11) DEFAULT NULL COMMENT '0.生效中\r\n1.已失效',
  `t_operate_user` varchar(255) DEFAULT NULL COMMENT '操作人',
  `t_create_time` datetime DEFAULT NULL COMMENT '操作时间'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_disable`
--

INSERT INTO `t_disable` (`t_id`, `t_user_id`, `t_context`, `t_disable_time`, `t_start_time`, `t_end_time`, `t_state`, `t_operate_user`, `t_create_time`) VALUES
(1, 56, '恶意拉人', 360, '2020-05-12 14:39:07', '2020-05-12 20:39:07', 1, 'admin', '2020-05-12 14:39:07');

-- --------------------------------------------------------

--
-- 表的结构 `t_discount`
--

CREATE TABLE IF NOT EXISTS `t_discount` (
  `t_id` int(11) NOT NULL,
  `t_num` int(11) DEFAULT NULL,
  `t_money` float DEFAULT NULL,
  `t_is_enable` int(11) DEFAULT NULL COMMENT '0.启用\r\n1.禁用',
  `t_crate_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `t_discuss_record`
--

CREATE TABLE IF NOT EXISTS `t_discuss_record` (
  `t_id` int(11) NOT NULL,
  `t_label_id` int(11) DEFAULT NULL,
  `t_evaluation_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_discuss_record`
--

INSERT INTO `t_discuss_record` (`t_id`, `t_label_id`, `t_evaluation_id`) VALUES
(1, 2, 1),
(2, 9, 1),
(3, 5, 2),
(4, 11, 2),
(5, 7, 3),
(6, 11, 3),
(7, 7, 4),
(8, 11, 4),
(9, 3, 5),
(10, 16, 5),
(11, 2, 6),
(12, 13, 6),
(13, 10, 7),
(14, 16, 7),
(15, 13, 8),
(16, 16, 8),
(17, 10, 9),
(18, 13, 9),
(19, 1, 10),
(20, 10, 10),
(21, 12, 10),
(22, 15, 10),
(23, 1, 10),
(24, 10, 10),
(25, 12, 10),
(26, 15, 10),
(27, 8, 12),
(28, 9, 12),
(29, 13, 12),
(30, 3, 13),
(31, 1, 13),
(32, 16, 14),
(33, 4, 14),
(34, 6, 15),
(35, 13, 15),
(36, 6, 16),
(37, 15, 16),
(38, 9, 17),
(39, 12, 17),
(40, 4, 18),
(41, 7, 18),
(42, 12, 19),
(43, 13, 19);

-- --------------------------------------------------------

--
-- 表的结构 `t_domainnamepool`
--

CREATE TABLE IF NOT EXISTS `t_domainnamepool` (
  `t_id` int(11) NOT NULL,
  `t_domain_name` varchar(100) DEFAULT NULL,
  `t_effect_type` int(11) DEFAULT NULL COMMENT '0.微信域名,1:qq域名2:抖音3.通用域名',
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_domainnamepool`
--

INSERT INTO `t_domainnamepool` (`t_id`, `t_domain_name`, `t_effect_type`, `t_create_time`) VALUES
(12, 'http://zhibo.qjsm58.cn/server_app/', 0, '2020-06-16 11:06:50'),
(13, 'http://zhibo.qjsm58.cn/server_app/', 1, '2020-06-16 11:07:13'),
(14, 'http://zhibo.qjsm58.cn/server_app/', 2, '2020-06-16 11:07:21'),
(15, 'http://zhibo.qjsm58.cn/server_app/', 3, '2020-06-16 11:07:29');

-- --------------------------------------------------------

--
-- 表的结构 `t_dynamic`
--

CREATE TABLE IF NOT EXISTS `t_dynamic` (
  `t_id` int(11) NOT NULL,
  `t_user_id` int(11) DEFAULT NULL,
  `t_title` varchar(100) DEFAULT NULL,
  `t_content` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `t_see_count` int(11) DEFAULT NULL,
  `t_is_del` int(11) DEFAULT NULL COMMENT '0.否\r\n1.是',
  `t_auditing_type` int(11) DEFAULT NULL COMMENT '0.未审核\r\n1.已审核\r\n2.审核失败',
  `t_is_visible` int(11) DEFAULT NULL COMMENT '0.公开 1.关注',
  `t_address` varchar(255) DEFAULT NULL,
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_dynamic`
--

INSERT INTO `t_dynamic` (`t_id`, `t_user_id`, `t_title`, `t_content`, `t_see_count`, `t_is_del`, `t_auditing_type`, `t_is_visible`, `t_address`, `t_create_time`) VALUES
(1, 9, '123', '嚞', 0, 0, 1, 0, '哪里', '2020-04-30 19:11:47'),
(2, 2, '无聊', '美美哒', 0, 0, 1, 0, '你心里', '2020-04-30 19:13:23'),
(3, 9, '', '嘻嘻', 0, 0, 0, 0, '', '2020-05-01 16:08:47'),
(4, 9, '', '嗯嗯', 0, 0, 0, 0, '', '2020-05-01 16:11:46'),
(5, 3, '', '123', 0, 0, 0, 0, '', '2020-05-03 02:55:04'),
(6, 9, '', '喜欢吗？', 0, 0, 0, 0, '', '2020-05-03 16:56:35'),
(7, 9, '', '美吗', 0, 0, 0, 0, '', '2020-05-03 16:57:50'),
(8, 9, '', '美美哒', 0, 0, 0, 0, '', '2020-05-03 17:00:29'),
(9, 3, '', '12346', 0, 0, 0, 0, '', '2020-05-03 17:36:33'),
(10, 3, '', '212132', 0, 0, 0, 0, '', '2020-05-03 17:45:25'),
(11, 2, '', '11144', 0, 0, 0, 0, '恩施土家族苗族自治州 · 辛辛木网吧', '2020-05-03 17:46:17'),
(12, 9, '美美哒', '哈哈', 0, 1, 1, 0, '', '2020-05-03 19:02:34'),
(13, 16, '', '咯哦哦', 0, 0, 0, 0, '', '2020-05-04 14:08:17'),
(14, 16, '123', '456', 0, 1, 1, 0, '', '2020-05-04 14:09:48'),
(15, 29, '', '么么哒😘', 0, 0, 0, 0, '', '2020-05-09 20:16:17');

-- --------------------------------------------------------

--
-- 表的结构 `t_dynamic_file`
--

CREATE TABLE IF NOT EXISTS `t_dynamic_file` (
  `t_id` int(11) NOT NULL,
  `t_dynamic_id` int(11) DEFAULT NULL,
  `t_file_type` int(11) DEFAULT NULL COMMENT '0.图片\r\n1.视频',
  `t_cover_img_url` varchar(255) DEFAULT NULL COMMENT '封面地址',
  `t_file_url` varchar(255) DEFAULT NULL,
  `t_gold` decimal(11,2) DEFAULT NULL,
  `t_file_id` varchar(200) DEFAULT NULL,
  `t_video_time` varchar(20) DEFAULT NULL,
  `t_see_count` int(11) DEFAULT NULL COMMENT '查看数',
  `t_is_private` int(11) DEFAULT NULL COMMENT '0.否\r\n1.是',
  `t_is_del` int(11) DEFAULT NULL COMMENT '0.未删除\r\n1.已删除',
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_dynamic_file`
--

INSERT INTO `t_dynamic_file` (`t_id`, `t_dynamic_id`, `t_file_type`, `t_cover_img_url`, `t_file_url`, `t_gold`, `t_file_id`, `t_video_time`, `t_see_count`, `t_is_private`, `t_is_del`, `t_create_time`) VALUES
(1, 1, 0, NULL, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200430/202004300711444903.jpg', '0.00', NULL, '0', 0, 0, 0, '2020-04-30 19:11:47'),
(2, 2, 0, NULL, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200430/202004300713215319.jpg', '0.00', NULL, '0', 0, 0, 0, '2020-04-30 19:13:23'),
(3, 3, 1, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/active/1588320509351.png', 'http://1257950478.vod2.myqcloud.com/dc9be992vodcq1257950478/700dc92b5285890802204486393/CeLutOHJkvEA.mp4', '0.00', '5285890802204486393', '00:11', 0, 0, 0, '2020-05-01 16:08:47'),
(4, 4, 0, NULL, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/active/0/www/img/top.png', '0.00', NULL, '0', 0, 0, 0, '2020-05-01 16:11:46'),
(5, 5, 0, NULL, 'http://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/15884456974791.png', '0.00', NULL, '0', 0, 0, 0, '2020-05-03 02:55:04'),
(6, 6, 0, NULL, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/active/1588496174871.jpg', '0.00', NULL, '0', 0, 0, 0, '2020-05-03 16:56:35'),
(7, 7, 0, NULL, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/active/1588496259810.jpg', '0.00', NULL, '0', 0, 0, 0, '2020-05-03 16:57:50'),
(8, 8, 0, NULL, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/active/1588496410901.jpg', '0.00', NULL, '0', 0, 0, 0, '2020-05-03 17:00:29'),
(9, 9, 0, NULL, 'http://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/15884985859085.png', '0.00', NULL, '0', 0, 0, 0, '2020-05-03 17:36:33'),
(10, 10, 0, NULL, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/active/1588499116812.jpg', '0.00', NULL, '0', 0, 0, 0, '2020-05-03 17:45:25'),
(11, 11, 1, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/active/1588499160446.png', 'http://1257950478.vod2.myqcloud.com/dc9be992vodcq1257950478/e79469a15285890802352442801/evxGkEbgwCYA.mp4', '0.00', '5285890802352442801', '00:05', 0, 0, 0, '2020-05-03 17:46:17'),
(12, 12, 0, NULL, '{"filePath":"https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200503/202005030702054341.mp4"}', '0.00', NULL, '0', 0, 0, 0, '2020-05-03 19:02:34'),
(13, 13, 1, 'http://1257950478.vod2.myqcloud.com/dc9be992vodcq1257950478/9d1150285285890802487246230/5285890802487246231.png', 'http://1257950478.vod2.myqcloud.com/dc9be992vodcq1257950478/9d1150285285890802487246230/jO3ZymqXSA0A.mp4', '0.00', '5285890802487246230', '00:10', 0, 0, 0, '2020-05-04 14:08:17'),
(14, 14, 0, NULL, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200504/202005040209348534.jpg', '0.00', NULL, '0', 0, 0, 0, '2020-05-04 14:09:48'),
(15, 14, 0, NULL, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200504/202005040209442240.jpg', '0.00', NULL, '0', 0, 0, 0, '2020-05-04 14:09:48'),
(16, 15, 1, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/active/1589026566557.png', 'http://1257950478.vod2.myqcloud.com/dc9be992vodcq1257950478/c23caa935285890802823994435/jufXccBdMxcA.mp4', '0.00', '5285890802823994435', '00:11', 0, 0, 0, '2020-05-09 20:16:17');

-- --------------------------------------------------------

--
-- 表的结构 `t_enroll`
--

CREATE TABLE IF NOT EXISTS `t_enroll` (
  `t_id` int(11) NOT NULL,
  `t_sex` int(11) DEFAULT NULL,
  `t_gold` int(11) DEFAULT NULL,
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_enroll`
--

INSERT INTO `t_enroll` (`t_id`, `t_sex`, `t_gold`, `t_create_time`) VALUES
(3, 1, 10, '2020-05-15 20:26:14');

-- --------------------------------------------------------

--
-- 表的结构 `t_extract`
--

CREATE TABLE IF NOT EXISTS `t_extract` (
  `t_id` int(11) NOT NULL,
  `t_project_type` int(11) DEFAULT NULL COMMENT '0.平台抽成比例\r\n1.一级主播推广比例\r\n2.二级主播推广比例\r\n3.一级用户推广比例\r\n4.二级用户推广比例\r\n5.视频聊天\r\n6.文字聊天\r\n7.查看手机号\r\n8.查看微信号\r\n9.查看私密照片\r\n10.查看私密视频',
  `t_extract_ratio` varchar(100) DEFAULT NULL,
  `t_create_time` datetime DEFAULT NULL,
  `explain` varchar(255) DEFAULT NULL COMMENT '解释说明'
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_extract`
--

INSERT INTO `t_extract` (`t_id`, `t_project_type`, `t_extract_ratio`, `t_create_time`, `explain`) VALUES
(1, 0, '30', '2018-06-13 15:27:01', NULL),
(2, 1, '5', '2018-06-13 15:27:50', NULL),
(3, 2, '3', '2018-06-13 15:28:04', NULL),
(4, 3, '15', '2018-06-13 15:28:15', NULL),
(5, 4, '5', '2018-06-13 15:28:34', NULL),
(6, 5, '20,30,40,50,60,70,80,90,100', '2018-10-30 09:17:26', '视频收费'),
(7, 6, '2,4,6,8', '2018-10-30 09:17:29', NULL),
(8, 7, '300,400,500', '2018-10-30 09:17:32', NULL),
(9, 8, '300,400,500', '2018-10-30 09:38:36', NULL),
(10, 9, '10,20,30,40,50', '2018-10-30 09:38:39', NULL),
(11, 10, '10,20,30,40,50,60', '2018-10-30 09:38:42', NULL),
(12, 11, 'adzwow', '2018-11-02 10:35:02', NULL),
(13, 12, '20,30,40,50,60,70,80', '2019-09-18 09:18:57', '语音收费设置'),
(14, 13, '300,400,500', '2019-09-21 15:59:02', 'QQ收费设置');

-- --------------------------------------------------------

--
-- 表的结构 `t_feedback`
--

CREATE TABLE IF NOT EXISTS `t_feedback` (
  `t_id` int(11) NOT NULL,
  `t_phone` varchar(20) DEFAULT NULL,
  `t_content` varchar(255) DEFAULT NULL,
  `t_img_url` varchar(500) DEFAULT NULL,
  `t_user_id` int(11) DEFAULT NULL,
  `t_create_time` datetime DEFAULT NULL,
  `t_handle_res` varchar(500) DEFAULT NULL,
  `t_is_handle` int(11) DEFAULT NULL COMMENT '0.未处理 1.已处理',
  `t_handle_time` datetime DEFAULT NULL,
  `t_handle_img` varchar(500) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_feedback`
--

INSERT INTO `t_feedback` (`t_id`, `t_phone`, `t_content`, `t_img_url`, `t_user_id`, `t_create_time`, `t_handle_res`, `t_is_handle`, `t_handle_time`, `t_handle_img`) VALUES
(1, '13255899999', '嗯嗯', '', 1, '2020-04-30 19:29:04', '			12					     ', 1, '2020-04-30 19:29:18', '');

-- --------------------------------------------------------

--
-- 表的结构 `t_financial_statements`
--

CREATE TABLE IF NOT EXISTS `t_financial_statements` (
  `t_id` int(11) NOT NULL,
  `t_statistical_date` date DEFAULT NULL COMMENT '统计日期',
  `t_registered_user` int(11) DEFAULT '0' COMMENT '注册人数',
  `t_recharges_count` int(11) DEFAULT '0' COMMENT '充值次数',
  `t_one_recharges` int(11) DEFAULT '0' COMMENT '首充人数',
  `t_recharges_user` int(11) DEFAULT '0' COMMENT '充值人数',
  `t_total_amount` decimal(10,2) DEFAULT '0.00' COMMENT '总充值金额',
  `t_video_minute` int(11) DEFAULT '0' COMMENT '视频聊天分钟数',
  `t_video_gold` decimal(10,2) DEFAULT '0.00' COMMENT '视频消费金币数',
  `t_gift_quantity` int(11) DEFAULT '0' COMMENT '赠送礼物个数',
  `t_gift_consume` decimal(10,2) DEFAULT '0.00' COMMENT '礼物消费金币数',
  `t_pay_video` int(11) DEFAULT '0' COMMENT '查看付费视频次数',
  `t_pay_video_gold` decimal(10,2) DEFAULT '0.00' COMMENT '付费视频金币数',
  `t_extract_amount` decimal(10,2) DEFAULT '0.00' COMMENT '主播提现金额',
  `t_day_profit` decimal(10,2) DEFAULT '0.00' COMMENT '日利润'
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `t_financial_statements`
--

INSERT INTO `t_financial_statements` (`t_id`, `t_statistical_date`, `t_registered_user`, `t_recharges_count`, `t_one_recharges`, `t_recharges_user`, `t_total_amount`, `t_video_minute`, `t_video_gold`, `t_gift_quantity`, `t_gift_consume`, `t_pay_video`, `t_pay_video_gold`, `t_extract_amount`, `t_day_profit`) VALUES
(1, '2020-04-23', 1, 0, 0, 0, '0.00', 0, '0.00', 0, '0.00', 0, '0.00', '0.00', '0.00'),
(2, '2020-04-24', 3, 0, 0, 0, '0.00', 4, '70.00', 0, '0.00', 0, '0.00', '0.00', '0.00'),
(3, '2020-04-28', 0, 1, 1, 1, '6.00', 6, '120.00', 0, '0.00', 0, '0.00', '0.00', '6.00'),
(4, '2020-04-29', 1, 0, 0, 0, '0.00', 0, '0.00', 0, '0.00', 0, '0.00', '0.00', '0.00'),
(5, '2020-04-30', 4, 0, 0, 0, '0.00', 1, '20.00', 3, '14.00', 0, '0.00', '0.00', '0.00'),
(6, '2020-05-01', 3, 0, 0, 0, '0.00', 17, '290.00', 6, '69.00', 0, '0.00', '0.00', '0.00'),
(7, '2020-05-02', 2, 0, 0, 0, '0.00', 1, '20.00', 0, '0.00', 0, '0.00', '0.00', '0.00'),
(8, '2020-05-03', 1, 0, 0, 0, '0.00', 3, '120.00', 4, '54.00', 0, '0.00', '210.00', '-210.00'),
(9, '2020-05-04', 1, 3, 2, 2, '6.00', 6, '200.00', 9, '139342.00', 0, '0.00', '800.00', '-794.00'),
(10, '2020-05-07', 3, 0, 0, 0, '0.00', 0, '0.00', 0, '0.00', 1, '10.00', '0.00', '0.00'),
(11, '2020-05-08', 1, 0, 0, 0, '0.00', 13, '500.00', 8, '10888.00', 0, '0.00', '0.00', '0.00'),
(12, '2020-05-09', 10, 1, 1, 1, '10.00', 9, '250.00', 16, '43512.00', 0, '0.00', '100.00', '-90.00'),
(13, '2020-05-10', 1, 0, 0, 0, '0.00', 1, '30.00', 1, '40.00', 0, '0.00', '0.00', '0.00'),
(14, '2020-05-11', 12, 0, 0, 0, '0.00', 11, '420.00', 4, '3728.00', 0, '0.00', '0.00', '0.00'),
(15, '2020-05-12', 12, 1, 1, 1, '50.00', 6, '240.00', 5, '280.00', 0, '0.00', '0.00', '50.00'),
(16, '2020-05-13', 6, 0, 0, 0, '0.00', 8, '320.00', 1, '40.00', 0, '0.00', '50.00', '-50.00'),
(17, '2020-05-14', 2, 0, 0, 0, '0.00', 0, '0.00', 0, '0.00', 0, '0.00', '0.00', '0.00'),
(18, '2020-05-15', 6, 0, 0, 0, '0.00', 2, '80.00', 0, '0.00', 0, '0.00', '0.00', '0.00'),
(19, '2020-05-17', 1, 0, 0, 0, '0.00', 0, '0.00', 0, '0.00', 0, '0.00', '0.00', '0.00'),
(20, '2020-05-18', 2, 0, 0, 0, '0.00', 0, '0.00', 0, '0.00', 0, '0.00', '0.00', '0.00'),
(21, '2020-05-20', 1, 0, 0, 0, '0.00', 0, '0.00', 0, '0.00', 0, '0.00', '0.00', '0.00'),
(22, '2020-05-22', 2, 0, 0, 0, '0.00', 0, '0.00', 0, '0.00', 0, '0.00', '0.00', '0.00'),
(23, '2020-05-24', 1, 0, 0, 0, '0.00', 0, '0.00', 0, '0.00', 0, '0.00', '0.00', '0.00'),
(24, '2020-05-25', 1, 0, 0, 0, '0.00', 0, '0.00', 0, '0.00', 0, '0.00', '0.00', '0.00'),
(25, '2020-06-10', 1, 0, 0, 0, '0.00', 0, '0.00', 0, '0.00', 0, '0.00', '0.00', '0.00'),
(26, '2020-06-13', 3, 0, 0, 0, '0.00', 2, '80.00', 1, '40.00', 0, '0.00', '0.00', '0.00'),
(27, '2020-06-14', 1, 0, 0, 0, '0.00', 0, '0.00', 0, '0.00', 0, '0.00', '0.00', '0.00'),
(28, '2020-06-17', 1, 0, 0, 0, '0.00', 0, '0.00', 0, '0.00', 0, '0.00', '0.00', '0.00'),
(29, '2020-06-18', 1, 0, 0, 0, '0.00', 0, '0.00', 0, '0.00', 0, '0.00', '0.00', '0.00'),
(30, '2020-06-19', 1, 5, 3, 3, '0.05', 0, '0.00', 0, '0.00', 0, '0.00', '0.00', '0.05'),
(31, '2020-06-20', 1, 4, 0, 3, '0.04', 0, '0.00', 0, '0.00', 0, '0.00', '0.00', '0.04'),
(32, '2020-06-21', 2, 1, 1, 1, '0.01', 0, '0.00', 0, '0.00', 0, '0.00', '0.00', '0.01');

-- --------------------------------------------------------

--
-- 表的结构 `t_follow`
--

CREATE TABLE IF NOT EXISTS `t_follow` (
  `t_id` int(11) NOT NULL,
  `t_follow_id` int(11) DEFAULT NULL,
  `t_cover_follow` int(11) DEFAULT NULL,
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_follow`
--

INSERT INTO `t_follow` (`t_id`, `t_follow_id`, `t_cover_follow`, `t_create_time`) VALUES
(4, 2, 1, '2020-05-04 13:47:39'),
(1, 6, 2, '2020-04-30 19:14:18'),
(2, 6, 9, '2020-04-30 19:14:24'),
(3, 7, 9, '2020-05-04 13:02:14');

-- --------------------------------------------------------

--
-- 表的结构 `t_free_anthor`
--

CREATE TABLE IF NOT EXISTS `t_free_anthor` (
  `t_id` int(11) NOT NULL,
  `t_user_id` int(11) DEFAULT NULL,
  `t_is_free` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `t_gift`
--

CREATE TABLE IF NOT EXISTS `t_gift` (
  `t_gift_id` int(11) NOT NULL,
  `t_gift_name` varchar(100) DEFAULT NULL,
  `t_gift_gif_url` varchar(100) DEFAULT NULL,
  `t_gift_still_url` varchar(150) DEFAULT NULL,
  `t_gift_gold` decimal(15,2) DEFAULT NULL,
  `t_is_enable` int(11) DEFAULT NULL COMMENT '0.启用\r\n1.停用',
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_gift`
--

INSERT INTO `t_gift` (`t_gift_id`, `t_gift_name`, `t_gift_gif_url`, `t_gift_still_url`, `t_gift_gold`, `t_is_enable`, `t_create_time`) VALUES
(2, '别墅', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20190823/201908230229197186.svga', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20190823/201908230228368952.png', '4000.00', 0, '2020-04-30 16:52:37'),
(3, '鼓掌', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20190826/201908260417344495.svga', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20190826/201908260417211739.png', '40.00', 0, '2019-09-08 21:05:03'),
(4, '烟花', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20190826/201908260419078159.svga', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20190826/201908260418249436.png', '120.00', 0, '2020-05-04 13:59:46'),
(5, '一箭穿心', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20190826/201908260452007380.svga', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20190826/201908260451473476.png', '300.00', 0, '2019-09-08 21:05:38'),
(6, '真爱之吻', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20190826/201908260453046207.svga', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20190826/201908260452575801.png', '260.00', 0, '2020-05-04 14:04:39'),
(7, '钻戒', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20190826/20190826045558525.svga', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20190826/20190826045519276.png', '999.00', 0, '2019-09-08 21:07:11'),
(8, '水母', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20190826/201908260457504420.svga', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20190826/201908260457131909.png', '180.00', 0, '2020-05-04 14:00:29'),
(9, '吐钞机', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20190826/201908260500045421.svga', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20190826/201908260459289881.png', '180.00', 0, '2020-05-04 14:00:08'),
(10, '战斗机', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20190826/201908260510088772.svga', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20190826/201908260509376435.png', '200.00', 0, '2020-05-04 14:03:31'),
(11, '游艇', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20190826/201908260529443351.svga', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20190826/201908260529257827.png', '666.00', 0, '2020-05-04 14:04:18'),
(12, '碰杯', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20190826/20190826053442513.svga', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20190826/201908260534105399.png', '800.00', 0, '2019-09-08 21:06:01'),
(13, '生日蛋糕', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20190828/201908281015015021.svga', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20190828/20190828101412780.png', '2888.00', 0, '2019-09-08 21:18:51'),
(14, '布加迪', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20190828/201908281017315169.svga', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20190828/201908281016472848.png', '3888.00', 0, '2019-09-08 21:09:03'),
(15, '环游世界', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20190828/201908281020134261.svga', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20190828/201908281019534633.png', '5200.00', 0, '2019-09-08 21:20:09'),
(16, '大炮', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20190828/201908281048512205.svga', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20190828/201908281048394852.jpg', '131400.00', 0, '2019-09-08 21:14:36'),
(17, '温馨别墅', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20190828/201908281051572441.svga', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20190828/201908281051432331.png', '8888.00', 0, '2019-09-08 21:21:34'),
(18, '全套轿车', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20190828/201908281055105889.svga', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20190828/201908281054358118.jpg', '12000.00', 0, '2019-09-08 22:26:23'),
(19, '大飞机', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20190828/201908281056444248.svga', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20190828/201908281056275522.png', '9999.00', 0, '2019-09-08 21:23:11'),
(20, '火箭发射', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20190828/201908281057484914.svga', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20190828/201908281057413746.jpg', '52000.00', 0, '2019-09-08 22:26:51'),
(21, '汽车飞机', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20191019/201910190247218177.svga', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/backstage/20191019/201910190246469573.png', '520.00', 0, '2019-10-19 14:48:21');

-- --------------------------------------------------------

--
-- 表的结构 `t_gift_record`
--

CREATE TABLE IF NOT EXISTS `t_gift_record` (
  `t_id` int(11) NOT NULL,
  `t_gift_type` int(11) DEFAULT NULL COMMENT '0.图片礼物\r\n1.红包礼物',
  `t_gift_id` int(11) DEFAULT NULL,
  `t_gift_num` int(11) DEFAULT NULL,
  `t_gift_gold` int(11) DEFAULT NULL,
  `t_record_user` int(11) DEFAULT NULL,
  `t_cover_user` int(11) DEFAULT NULL,
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `t_give_gold_notice`
--

CREATE TABLE IF NOT EXISTS `t_give_gold_notice` (
  `t_id` int(11) NOT NULL,
  `t_user_id` int(11) DEFAULT NULL,
  `t_gold` decimal(5,2) DEFAULT NULL,
  `t_is_read` int(11) DEFAULT NULL,
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_give_gold_notice`
--

INSERT INTO `t_give_gold_notice` (`t_id`, `t_user_id`, `t_gold`, `t_is_read`, `t_create_time`) VALUES
(1, 1, '38.00', 0, '2020-04-23 23:53:39'),
(2, 6, '38.00', 0, '2020-04-30 12:23:04'),
(3, 7, '38.00', 0, '2020-04-30 14:29:08'),
(4, 11, '38.00', 0, '2020-05-01 17:07:58'),
(5, 12, '38.00', 0, '2020-05-01 17:09:00'),
(6, 13, '38.00', 0, '2020-05-02 11:36:00'),
(7, 15, '38.00', 0, '2020-05-03 16:26:15'),
(8, 17, '38.00', 0, '2020-05-07 12:15:43'),
(9, 18, '38.00', 0, '2020-05-07 18:11:14'),
(10, 19, '38.00', 0, '2020-05-07 22:27:37'),
(11, 21, '38.00', 0, '2020-05-08 14:40:44'),
(12, 23, '38.00', 0, '2020-05-09 12:55:12'),
(13, 26, '38.00', 0, '2020-05-09 19:17:48'),
(14, 28, '38.00', 0, '2020-05-09 19:42:19'),
(15, 30, '38.00', 0, '2020-05-09 19:45:53'),
(16, 32, '38.00', 0, '2020-05-10 01:26:18'),
(17, 35, '38.00', 0, '2020-05-11 00:51:47'),
(18, 37, '38.00', 0, '2020-05-11 12:54:11'),
(19, 44, '38.00', 0, '2020-05-11 14:45:54'),
(20, 46, '38.00', 0, '2020-05-11 15:32:34'),
(21, 47, '38.00', 0, '2020-05-11 15:42:19'),
(22, 48, '38.00', 0, '2020-05-11 15:54:44'),
(23, 49, '38.00', 0, '2020-05-11 16:10:17'),
(24, 51, '38.00', 0, '2020-05-11 23:09:15'),
(25, 54, '38.00', 0, '2020-05-12 03:45:44'),
(26, 58, '38.00', 0, '2020-05-12 13:05:24'),
(27, 59, '38.00', 0, '2020-05-12 13:21:59'),
(28, 60, '38.00', 0, '2020-05-12 13:59:07'),
(29, 65, '38.00', 0, '2020-05-13 14:13:09'),
(30, 66, '38.00', 0, '2020-05-13 16:16:38'),
(31, 67, '38.00', 0, '2020-05-13 16:17:11'),
(32, 70, '38.00', 0, '2020-05-14 17:29:50'),
(33, 71, '38.00', 0, '2020-05-14 17:33:28'),
(34, 72, '38.00', 0, '2020-05-15 00:53:12'),
(35, 73, '38.00', 0, '2020-05-15 10:39:41'),
(36, 74, '38.00', 0, '2020-05-15 10:54:15'),
(37, 75, '38.00', 0, '2020-05-15 11:17:42'),
(38, 80, '10.00', 0, '2020-05-18 22:42:49'),
(39, 81, '10.00', 0, '2020-05-20 02:40:27'),
(40, 82, '10.00', 0, '2020-05-22 15:45:01'),
(41, 83, '10.00', 0, '2020-05-22 20:47:15'),
(42, 84, '10.00', 0, '2020-05-24 15:25:36'),
(43, 85, '10.00', 0, '2020-05-25 15:50:01'),
(44, 86, '10.00', 0, '2020-06-10 02:13:35'),
(45, 87, '10.00', 0, '2020-06-13 15:05:43'),
(46, 90, '10.00', 0, '2020-06-13 17:07:55'),
(47, 92, '10.00', 0, '2020-06-17 18:11:07'),
(48, 93, '10.00', 0, '2020-06-18 01:02:12'),
(49, 94, '10.00', 0, '2020-06-19 22:11:19'),
(50, 95, '10.00', 0, '2020-06-20 23:38:15'),
(51, 96, '10.00', 0, '2020-06-21 00:12:01');

-- --------------------------------------------------------

--
-- 表的结构 `t_guild`
--

CREATE TABLE IF NOT EXISTS `t_guild` (
  `t_id` int(11) NOT NULL,
  `t_user_id` int(11) DEFAULT NULL,
  `t_guild_name` varchar(50) DEFAULT NULL,
  `t_admin_name` varchar(20) DEFAULT NULL,
  `t_idcard` varchar(20) DEFAULT NULL,
  `t_hand_img` varchar(100) DEFAULT NULL,
  `t_admin_phone` varchar(20) DEFAULT NULL,
  `t_anchor_number` int(11) DEFAULT NULL,
  `t_extract` int(11) DEFAULT NULL,
  `t_examine` int(11) DEFAULT NULL COMMENT '0.未审核\r\n1.已审核',
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_guild`
--

INSERT INTO `t_guild` (`t_id`, `t_user_id`, `t_guild_name`, `t_admin_name`, `t_idcard`, `t_hand_img`, `t_admin_phone`, `t_anchor_number`, `t_extract`, `t_examine`, `t_create_time`) VALUES
(1, 9, '因为', '嗯嗯', '456698168564851324', 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/verify/1588244121521.jpg', '13255555555', 100, 10, 2, '2020-04-30 18:55:32');

-- --------------------------------------------------------

--
-- 表的结构 `t_guild_invite`
--

CREATE TABLE IF NOT EXISTS `t_guild_invite` (
  `t_id` int(11) NOT NULL,
  `t_guild_id` int(11) DEFAULT NULL,
  `t_anchor_id` int(11) DEFAULT NULL,
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `t_help_center`
--

CREATE TABLE IF NOT EXISTS `t_help_center` (
  `t_id` int(11) NOT NULL,
  `t_title` varchar(255) DEFAULT NULL,
  `t_content` varchar(5000) DEFAULT NULL,
  `t_sort` int(11) DEFAULT NULL,
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `t_help_center`
--

INSERT INTO `t_help_center` (`t_id`, `t_title`, `t_content`, `t_sort`, `t_create_time`) VALUES
(1, '用户攻略', '1.首页 可选自己喜欢的女生与她进行视频语音通话 私信等\n2.速配  系统自动匹配 有5秒可查看主播视频和动态 喜欢可接通不喜欢可换下一个\n3.发现 可查看主播的视频和动态 （可还有主播私密小视频）\n4.我的 右上角可查看排行榜\n5.收徒赚钱 可邀请朋友下载注册 赚金币 分成高  具体可查看 收徒赚钱里的 奖励规则', 99, '2019-11-12 16:42:41');

-- --------------------------------------------------------

--
-- 表的结构 `t_home_table`
--

CREATE TABLE IF NOT EXISTS `t_home_table` (
  `t_id` int(11) NOT NULL,
  `t_cover_img` varchar(255) DEFAULT NULL,
  `t_handImg` varchar(255) DEFAULT NULL,
  `t_nickName` varchar(255) DEFAULT NULL,
  `t_age` int(11) DEFAULT NULL,
  `t_city` varchar(255) DEFAULT NULL,
  `t_vocation` varchar(255) DEFAULT NULL,
  `t_autograph` varchar(255) DEFAULT NULL,
  `t_video_gold` decimal(11,2) DEFAULT NULL,
  `t_score` int(11) DEFAULT '5' COMMENT '评分',
  `t_online` int(11) DEFAULT NULL COMMENT '0.在线 1.离线',
  `t_sort` int(11) DEFAULT '99' COMMENT '排序',
  `t_is_public` int(11) DEFAULT '0' COMMENT '是否存在免费视频 0.不存在 1.存在',
  `t_anchor_type` int(11) DEFAULT '0' COMMENT '主播板块(0.新人1.推荐2.活跃.3.女神)',
  `t_anchor_select` int(1) DEFAULT '0' COMMENT '选聊: 0 不是 1 是',
  `t_sex` int(1) DEFAULT '0' COMMENT '0:女 1：男'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `t_home_table`
--

INSERT INTO `t_home_table` (`t_id`, `t_cover_img`, `t_handImg`, `t_nickName`, `t_age`, `t_city`, `t_vocation`, `t_autograph`, `t_video_gold`, `t_score`, `t_online`, `t_sort`, `t_is_public`, `t_anchor_type`, `t_anchor_select`, `t_sex`) VALUES
(29, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200510/202005101136084656.jpg', 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200509/202005090757581417.jpg', '小姐姐🌸🌸', 18, '18', '模特', '嘻嘻', '40.00', 5, 2, 99, 0, 1, 1, 0),
(31, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200510/202005101112275727.jpg', 'http://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/15890259454101.png', '我是一颗糖😊', 18, '18', '网红', NULL, '50.00', 5, 2, 99, 0, 1, 1, 0),
(33, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200510/202005101118157916.jpg', 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200510/202005101123423632.jpg', '叶  子', 21, '哈尔滨', '空姐', '爱  请深受', '40.00', 5, 1, 99, 0, 1, 0, 0),
(34, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200510/202005101131052301.jpg', 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200510/202005101130395870.jpg', '小兔子吃萝卜', 21, '哈尔滨', '其他', '不告诉你', '40.00', 5, 0, 99, 0, 1, 0, 0),
(36, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200511/202005110101002898.jpg', 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200511/202005110100304869.jpg', '小奶猫', 27, '广东', '健身教练', '欢迎哥哥的骚扰哦', '40.00', 5, 0, 99, 0, 0, 0, 0),
(38, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200511/20200511010051820.jpg', 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200511/202005110100265652.jpg', '小娘子', 22, '杭州', '学生', '想做你的心上人', '40.00', 5, 0, 99, 0, 0, 0, 0),
(39, 'http://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/15891736749015.png', 'http://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/15891737034478.png', '十三', 18, '18', '网红', '月亮不睡我不睡', '40.00', 5, 2, 99, 0, 1, 0, 0),
(43, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200511/20200511024208913.jpg', 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200511/202005110241543766.jpg', '波多野结衣', 26, '上海', '其他', '寻找另一半', '40.00', 5, 0, 99, 0, 0, 0, 0),
(45, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200511/202005110252556655.jpg', 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200511/202005110252283744.jpg', '草莓妞妞', 20, '江西', '模特', '你能好好爱我吗', '40.00', 5, 2, 99, 0, 0, 0, 0),
(50, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200511/202005111034107290.jpg', 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200511/202005111037071148.jpg', '在校学渣', 19, '武汉', '网红', '做个快乐小学渣', '40.00', 5, 2, 99, 0, 0, 0, 0),
(52, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/cover/1589220238867.png', 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/head/1589220243245.png', '琪琪', 18, '18', '模特', '遇见你最好', '20.00', 5, 2, 20, 0, 1, 0, 0),
(53, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/cover/1589222264274.png', 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/head/1589222270171.png', '聊友:10053', 18, '北京', '模特', '单身聊天', '40.00', 5, 2, 10, 0, 1, 0, 0),
(61, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/cover/1589280716089.png', 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/head/1589280720860.png', '聊友:10061', 18, '北京', '模特', NULL, '40.00', 5, 2, 15, 0, 1, 0, 0),
(62, 'http://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/15893520647451.png', 'http://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/15893520962983.png', '乐乐', 18, '北京东城', '网红', NULL, '50.00', 5, 2, 99, 0, 1, 0, 0),
(76, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/cover/1589546251769.png', 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/head/1589541451162.png', '聊友:10076', 22, '北京市东城区', '其他', '喜欢你，没道理', '40.00', 5, 2, 99, 0, 1, 0, 0),
(89, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/cover/1592036537211.png', NULL, '聊友:10089', 18, '北京', '模特', 'jjkkk', '40.00', 5, 2, 99, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `t_im_fitler`
--

CREATE TABLE IF NOT EXISTS `t_im_fitler` (
  `t_id` int(11) NOT NULL COMMENT '主键',
  `t_filter_word` varchar(100) DEFAULT NULL COMMENT '过滤词',
  `t_create_time` datetime DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `t_im_fitler`
--

INSERT INTO `t_im_fitler` (`t_id`, `t_filter_word`, `t_create_time`) VALUES
(9, '微信', '2019-10-21 11:31:32'),
(10, '习大大', '2019-10-23 10:34:49'),
(11, 'QQ', '2019-12-14 12:50:40'),
(13, '习近平', '2019-12-14 13:01:56'),
(15, '政治', '2020-01-12 15:15:05'),
(16, '裸聊', '2020-05-04 15:04:26');

-- --------------------------------------------------------

--
-- 表的结构 `t_im_log`
--

CREATE TABLE IF NOT EXISTS `t_im_log` (
  `t_id` int(11) NOT NULL,
  `t_idcard` int(11) DEFAULT NULL,
  `t_user_name` varchar(11) CHARACTER SET utf8 DEFAULT NULL,
  `t_cover_idcard` int(11) DEFAULT NULL,
  `t_cover_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `t_content` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1033 DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `t_im_log`
--

INSERT INTO `t_im_log` (`t_id`, `t_idcard`, `t_user_name`, `t_cover_idcard`, `t_cover_name`, `t_content`, `t_create_time`) VALUES
(913, 10033, '叶  子', 10080, '聊友:10080', '小哥哥 有时间吗 视频聊天', '2020-06-07 00:29:15'),
(914, 10033, '叶  子', 10080, '聊友:10080', '小哥哥 有时间吗 视频聊天', '2020-06-07 00:29:15'),
(915, 10053, '聊友:10053', 10080, '聊友:10080', '小哥哥我想和你聊天 嘻嘻', '2020-06-07 00:30:14'),
(916, 10053, '聊友:10053', 10080, '聊友:10080', '小哥哥我想和你聊天 嘻嘻', '2020-06-07 00:30:14'),
(917, 10033, '叶  子', 10035, '聊友:10035', '小哥哥 有时间吗 视频聊天', '2020-06-07 10:50:45'),
(918, 10033, '叶  子', 10035, '聊友:10035', '小哥哥 有时间吗 视频聊天', '2020-06-07 10:50:45'),
(919, 10036, '小奶猫', 10035, '聊友:10035', '小哥哥  在吗？我很好得一得就能得到', '2020-06-07 10:50:46'),
(920, 10036, '小奶猫', 10035, '聊友:10035', '小哥哥  在吗？我很好得一得就能得到', '2020-06-07 10:50:46'),
(921, 10053, '聊友:10053', 10035, '聊友:10035', '小哥哥我想和你聊天 嘻嘻', '2020-06-07 10:51:44'),
(922, 10053, '聊友:10053', 10035, '聊友:10035', '小哥哥我想和你聊天 嘻嘻', '2020-06-07 10:51:44'),
(923, 10033, '叶  子', 10028, '聊友:10028', '小哥哥 有时间吗 视频聊天', '2020-06-09 18:54:15'),
(924, 10033, '叶  子', 10028, '聊友:10028', '小哥哥 有时间吗 视频聊天', '2020-06-09 18:54:15'),
(925, 10036, '小奶猫', 10028, '聊友:10028', '小哥哥  在吗？我很好得一得就能得到', '2020-06-09 18:54:15'),
(926, 10036, '小奶猫', 10028, '聊友:10028', '小哥哥  在吗？我很好得一得就能得到', '2020-06-09 18:54:16'),
(927, 10053, '聊友:10053', 10028, '聊友:10028', '小哥哥我想和你聊天 嘻嘻', '2020-06-09 18:55:14'),
(928, 10053, '聊友:10053', 10028, '聊友:10028', '小哥哥我想和你聊天 嘻嘻', '2020-06-09 18:55:15'),
(929, 10036, '小奶猫', 10028, '聊友:10028', '小哥哥  在吗？我很好得一得就能得到', '2020-06-10 00:01:30'),
(930, 10036, '小奶猫', 10028, '聊友:10028', '小哥哥  在吗？我很好得一得就能得到', '2020-06-10 00:01:30'),
(931, 10033, '叶  子', 10028, '聊友:10028', '小哥哥 有时间吗 视频聊天', '2020-06-10 00:01:30'),
(932, 10033, '叶  子', 10028, '聊友:10028', '小哥哥 有时间吗 视频聊天', '2020-06-10 00:01:30'),
(933, 10053, '聊友:10053', 10028, '聊友:10028', '小哥哥我想和你聊天 嘻嘻', '2020-06-10 00:02:29'),
(934, 10053, '聊友:10053', 10028, '聊友:10028', '小哥哥我想和你聊天 嘻嘻', '2020-06-10 00:02:30'),
(935, 10033, '叶  子', 10032, '聊友:10032', '小哥哥 有时间吗 视频聊天', '2020-06-10 00:51:29'),
(936, 10033, '叶  子', 10032, '聊友:10032', '小哥哥 有时间吗 视频聊天', '2020-06-10 00:51:29'),
(937, 10036, '小奶猫', 10032, '聊友:10032', '小哥哥  在吗？我很好得一得就能得到', '2020-06-10 00:51:30'),
(938, 10036, '小奶猫', 10032, '聊友:10032', '小哥哥  在吗？我很好得一得就能得到', '2020-06-10 00:51:30'),
(939, 10053, '聊友:10053', 10032, '聊友:10032', '小哥哥我想和你聊天 嘻嘻', '2020-06-10 00:52:29'),
(940, 10053, '聊友:10053', 10032, '聊友:10032', '小哥哥我想和你聊天 嘻嘻', '2020-06-10 00:52:29'),
(941, 10036, '小奶猫', 10086, '聊友:10086', '小哥哥  在吗？我很好得一得就能得到', '2020-06-10 02:14:44'),
(942, 10036, '小奶猫', 10086, '聊友:10086', '小哥哥  在吗？我很好得一得就能得到', '2020-06-10 02:14:44'),
(943, 10033, '叶  子', 10086, '聊友:10086', '小哥哥 有时间吗 视频聊天', '2020-06-10 02:14:45'),
(944, 10033, '叶  子', 10086, '聊友:10086', '小哥哥 有时间吗 视频聊天', '2020-06-10 02:14:45'),
(945, 10053, '聊友:10053', 10086, '聊友:10086', '小哥哥我想和你聊天 嘻嘻', '2020-06-10 02:15:44'),
(946, 10053, '聊友:10053', 10086, '聊友:10086', '小哥哥我想和你聊天 嘻嘻', '2020-06-10 02:15:44'),
(947, 10036, '小奶猫', 10083, '聊友:10083', '小哥哥  在吗？我很好得一得就能得到', '2020-06-10 20:10:00'),
(948, 10036, '小奶猫', 10083, '聊友:10083', '小哥哥  在吗？我很好得一得就能得到', '2020-06-10 20:10:00'),
(949, 10033, '叶  子', 10083, '聊友:10083', '小哥哥 有时间吗 视频聊天', '2020-06-10 20:10:01'),
(950, 10033, '叶  子', 10083, '聊友:10083', '小哥哥 有时间吗 视频聊天', '2020-06-10 20:10:01'),
(951, 10053, '聊友:10053', 10083, '聊友:10083', '小哥哥我想和你聊天 嘻嘻', '2020-06-10 20:10:59'),
(952, 10053, '聊友:10053', 10083, '聊友:10083', '小哥哥我想和你聊天 嘻嘻', '2020-06-10 20:11:00'),
(953, 10036, '小奶猫', 10080, '聊友:10080', '小哥哥  在吗？我很好得一得就能得到', '2020-06-11 02:28:29'),
(954, 10036, '小奶猫', 10080, '聊友:10080', '小哥哥  在吗？我很好得一得就能得到', '2020-06-11 02:28:29'),
(955, 10033, '叶  子', 10080, '聊友:10080', '小哥哥 有时间吗 视频聊天', '2020-06-11 02:28:30'),
(956, 10033, '叶  子', 10080, '聊友:10080', '小哥哥 有时间吗 视频聊天', '2020-06-11 02:28:30'),
(957, 10053, '聊友:10053', 10080, '聊友:10080', '小哥哥我想和你聊天 嘻嘻', '2020-06-11 02:29:29'),
(958, 10053, '聊友:10053', 10080, '聊友:10080', '小哥哥我想和你聊天 嘻嘻', '2020-06-11 02:29:29'),
(959, 10036, '小奶猫', 10035, '聊友:10035', '小哥哥  在吗？我很好得一得就能得到', '2020-06-13 12:48:14'),
(960, 10036, '小奶猫', 10035, '聊友:10035', '小哥哥  在吗？我很好得一得就能得到', '2020-06-13 12:48:15'),
(961, 10033, '叶  子', 10035, '聊友:10035', '小哥哥 有时间吗 视频聊天', '2020-06-13 12:48:16'),
(962, 10033, '叶  子', 10035, '聊友:10035', '小哥哥 有时间吗 视频聊天', '2020-06-13 12:48:16'),
(963, 10053, '聊友:10053', 10035, '聊友:10035', '小哥哥我想和你聊天 嘻嘻', '2020-06-13 12:49:14'),
(964, 10053, '聊友:10053', 10035, '聊友:10035', '小哥哥我想和你聊天 嘻嘻', '2020-06-13 12:49:15'),
(965, 10033, '叶  子', 10087, '聊友:10087', '小哥哥 有时间吗 视频聊天', '2020-06-13 15:06:44'),
(966, 10033, '叶  子', 10087, '聊友:10087', '小哥哥 有时间吗 视频聊天', '2020-06-13 15:06:45'),
(967, 10036, '小奶猫', 10087, '聊友:10087', '小哥哥  在吗？我很好得一得就能得到', '2020-06-13 15:06:46'),
(968, 10036, '小奶猫', 10087, '聊友:10087', '小哥哥  在吗？我很好得一得就能得到', '2020-06-13 15:06:46'),
(969, 10053, '聊友:10053', 10087, '聊友:10087', '小哥哥我想和你聊天 嘻嘻', '2020-06-13 15:07:44'),
(970, 10053, '聊友:10053', 10087, '聊友:10087', '小哥哥我想和你聊天 嘻嘻', '2020-06-13 15:07:44'),
(971, 10036, '小奶猫', 10028, '聊友:10028', '小哥哥  在吗？我很好得一得就能得到', '2020-06-13 16:30:30'),
(972, 10036, '小奶猫', 10028, '聊友:10028', '小哥哥  在吗？我很好得一得就能得到', '2020-06-13 16:30:30'),
(973, 10033, '叶  子', 10028, '聊友:10028', '小哥哥 有时间吗 视频聊天', '2020-06-13 16:30:30'),
(974, 10033, '叶  子', 10028, '聊友:10028', '小哥哥 有时间吗 视频聊天', '2020-06-13 16:30:31'),
(975, 10089, '聊友:10089', 10087, '聊友:10087', 'vjj', '2020-06-13 16:31:00'),
(976, 10089, '聊友:10089', 10087, '聊友:10087', 'vjj', '2020-06-13 16:31:01'),
(977, 10053, '聊友:10053', 10028, '聊友:10028', '小哥哥我想和你聊天 嘻嘻', '2020-06-13 16:31:30'),
(978, 10053, '聊友:10053', 10028, '聊友:10028', '小哥哥我想和你聊天 嘻嘻', '2020-06-13 16:31:30'),
(979, 10033, '叶  子', 10032, '聊友:10032', '小哥哥 有时间吗 视频聊天', '2020-06-13 16:48:15'),
(980, 10033, '叶  子', 10032, '聊友:10032', '小哥哥 有时间吗 视频聊天', '2020-06-13 16:48:15'),
(981, 10036, '小奶猫', 10032, '聊友:10032', '小哥哥  在吗？我很好得一得就能得到', '2020-06-13 16:48:15'),
(982, 10036, '小奶猫', 10032, '聊友:10032', '小哥哥  在吗？我很好得一得就能得到', '2020-06-13 16:48:16'),
(983, 10053, '聊友:10053', 10032, '聊友:10032', '小哥哥我想和你聊天 嘻嘻', '2020-06-13 16:49:14'),
(984, 10053, '聊友:10053', 10032, '聊友:10032', '小哥哥我想和你聊天 嘻嘻', '2020-06-13 16:49:15'),
(985, 10033, '叶  子', 10090, '聊友:10090', '小哥哥 有时间吗 视频聊天', '2020-06-13 17:09:00'),
(986, 10033, '叶  子', 10090, '聊友:10090', '小哥哥 有时间吗 视频聊天', '2020-06-13 17:09:00'),
(987, 10036, '小奶猫', 10090, '聊友:10090', '小哥哥  在吗？我很好得一得就能得到', '2020-06-13 17:09:00'),
(988, 10036, '小奶猫', 10090, '聊友:10090', '小哥哥  在吗？我很好得一得就能得到', '2020-06-13 17:09:00'),
(989, 10090, '聊友:10090', 10036, '小奶猫', '好', '2020-06-13 17:09:08'),
(990, 10090, '聊友:10090', 10036, '小奶猫', '好', '2020-06-13 17:09:08'),
(991, 10090, '聊友:10090', 10033, '叶  子', '好', '2020-06-13 17:09:29'),
(992, 10090, '聊友:10090', 10033, '叶  子', '好', '2020-06-13 17:09:29'),
(993, 10053, '聊友:10053', 10090, '聊友:10090', '小哥哥我想和你聊天 嘻嘻', '2020-06-13 17:09:59'),
(994, 10053, '聊友:10053', 10090, '聊友:10090', '小哥哥我想和你聊天 嘻嘻', '2020-06-13 17:10:00'),
(995, 10033, '叶  子', 10086, '聊友:10086', '小哥哥 有时间吗 视频聊天', '2020-06-14 04:48:59'),
(996, 10033, '叶  子', 10086, '聊友:10086', '小哥哥 有时间吗 视频聊天', '2020-06-14 04:48:59'),
(997, 10036, '小奶猫', 10086, '聊友:10086', '小哥哥  在吗？我很好得一得就能得到', '2020-06-14 04:48:59'),
(998, 10036, '小奶猫', 10086, '聊友:10086', '小哥哥  在吗？我很好得一得就能得到', '2020-06-14 04:49:00'),
(999, 10053, '聊友:10053', 10086, '聊友:10086', '小哥哥我想和你聊天 嘻嘻', '2020-06-14 04:49:59'),
(1000, 10053, '聊友:10053', 10086, '聊友:10086', '小哥哥我想和你聊天 嘻嘻', '2020-06-14 04:49:59'),
(1001, 10033, '叶  子', 10028, '聊友:10028', '小哥哥 有时间吗 视频聊天', '2020-06-14 20:53:14'),
(1002, 10033, '叶  子', 10028, '聊友:10028', '小哥哥 有时间吗 视频聊天', '2020-06-14 20:53:15'),
(1003, 10036, '小奶猫', 10028, '聊友:10028', '小哥哥  在吗？我很好得一得就能得到', '2020-06-14 20:53:15'),
(1004, 10036, '小奶猫', 10028, '聊友:10028', '小哥哥  在吗？我很好得一得就能得到', '2020-06-14 20:53:15'),
(1005, 10053, '聊友:10053', 10028, '聊友:10028', '小哥哥我想和你聊天 嘻嘻', '2020-06-14 20:54:14'),
(1006, 10053, '聊友:10053', 10028, '聊友:10028', '小哥哥我想和你聊天 嘻嘻', '2020-06-14 20:54:14'),
(1007, 10036, '小奶猫', 10028, '聊友:10028', '小哥哥  在吗？我很好得一得就能得到', '2020-06-15 00:01:29'),
(1008, 10036, '小奶猫', 10028, '聊友:10028', '小哥哥  在吗？我很好得一得就能得到', '2020-06-15 00:01:30'),
(1009, 10033, '叶  子', 10028, '聊友:10028', '小哥哥 有时间吗 视频聊天', '2020-06-15 00:01:30'),
(1010, 10033, '叶  子', 10028, '聊友:10028', '小哥哥 有时间吗 视频聊天', '2020-06-15 00:01:31'),
(1011, 10053, '聊友:10053', 10028, '聊友:10028', '小哥哥我想和你聊天 嘻嘻', '2020-06-15 00:02:29'),
(1012, 10053, '聊友:10053', 10028, '聊友:10028', '小哥哥我想和你聊天 嘻嘻', '2020-06-15 00:02:29'),
(1013, 10036, '小奶猫', 10087, '聊友:10087', '小哥哥  在吗？我很好得一得就能得到', '2020-06-15 17:57:15'),
(1014, 10036, '小奶猫', 10087, '聊友:10087', '小哥哥  在吗？我很好得一得就能得到', '2020-06-15 17:57:15'),
(1015, 10033, '叶  子', 10087, '聊友:10087', '小哥哥 有时间吗 视频聊天', '2020-06-15 17:57:15'),
(1016, 10033, '叶  子', 10087, '聊友:10087', '小哥哥 有时间吗 视频聊天', '2020-06-15 17:57:15'),
(1017, 10053, '聊友:10053', 10087, '聊友:10087', '小哥哥我想和你聊天 嘻嘻', '2020-06-15 17:58:14'),
(1018, 10053, '聊友:10053', 10087, '聊友:10087', '小哥哥我想和你聊天 嘻嘻', '2020-06-15 17:58:14'),
(1019, 10033, '叶  子', 10028, '聊友:10028', '小哥哥 有时间吗 视频聊天', '2020-06-16 00:02:29'),
(1020, 10033, '叶  子', 10028, '聊友:10028', '小哥哥 有时间吗 视频聊天', '2020-06-16 00:02:29'),
(1021, 10036, '小奶猫', 10028, '聊友:10028', '小哥哥  在吗？我很好得一得就能得到', '2020-06-16 00:02:30'),
(1022, 10036, '小奶猫', 10028, '聊友:10028', '小哥哥  在吗？我很好得一得就能得到', '2020-06-16 00:02:30'),
(1023, 10053, '聊友:10053', 10028, '聊友:10028', '小哥哥我想和你聊天 嘻嘻', '2020-06-16 00:03:29'),
(1024, 10053, '聊友:10053', 10028, '聊友:10028', '小哥哥我想和你聊天 嘻嘻', '2020-06-16 00:03:29'),
(1025, 10033, '叶  子', 10087, '聊友:10087', '小哥哥 有时间吗 视频聊天', '2020-06-16 00:46:29'),
(1026, 10033, '叶  子', 10087, '聊友:10087', '小哥哥 有时间吗 视频聊天', '2020-06-16 00:46:29'),
(1027, 10036, '小奶猫', 10087, '聊友:10087', '小哥哥  在吗？我很好得一得就能得到', '2020-06-16 00:46:29'),
(1028, 10036, '小奶猫', 10087, '聊友:10087', '小哥哥  在吗？我很好得一得就能得到', '2020-06-16 00:46:30'),
(1029, 10053, '聊友:10053', 10087, '聊友:10087', '小哥哥我想和你聊天 嘻嘻', '2020-06-16 00:47:29'),
(1030, 10053, '聊友:10053', 10087, '聊友:10087', '小哥哥我想和你聊天 嘻嘻', '2020-06-16 00:47:29'),
(1031, 10087, '聊友:10087', 10036, '小奶猫', '是吗', '2020-06-16 00:51:39'),
(1032, 10087, '聊友:10087', 10036, '小奶猫', '是吗', '2020-06-16 00:51:39');

-- --------------------------------------------------------

--
-- 表的结构 `t_label`
--

CREATE TABLE IF NOT EXISTS `t_label` (
  `t_id` int(11) NOT NULL,
  `t_label_name` varchar(100) DEFAULT NULL,
  `t_is_enable` int(11) DEFAULT NULL COMMENT '0.启用\r\n1.停用',
  `t_sex` int(11) DEFAULT NULL COMMENT '0.女\r\n1.男'
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_label`
--

INSERT INTO `t_label` (`t_id`, `t_label_name`, `t_is_enable`, `t_sex`) VALUES
(1, '很漂亮', 0, 0),
(2, '性感', 0, 0),
(3, '温柔', 0, 0),
(4, '大长腿', 0, 0),
(5, '完美身材', 0, 0),
(6, '声音甜美', 0, 0),
(7, '萌萌哒', 0, 0),
(8, '清纯萝莉', 0, 0),
(9, '御姐', 0, 0),
(10, '性感火辣', 0, 0),
(11, '波涛汹涌', 0, 0),
(12, '会聊天', 0, 0),
(13, '妩媚动人', 0, 0),
(14, '温柔体贴', 0, 0),
(15, '颜值高', 0, 0),
(16, '舞姿美', 0, 0),
(17, '梦中情人', 0, 0),
(18, '很漂亮', 0, 1),
(19, '性感', 0, 1),
(20, '温柔', 0, 1),
(21, '大长腿', 0, 1),
(22, '完美身材', 0, 1),
(23, '声音甜美', 0, 1),
(24, '萌萌哒', 0, 1),
(25, '清纯萝莉', 0, 1),
(26, '御姐', 0, 1),
(27, '性感火辣', 0, 1),
(28, '波涛汹涌', 0, 1),
(29, '会聊天', 0, 1),
(30, '妩媚动人', 0, 1),
(31, '温柔体贴', 0, 1),
(32, '颜值高', 0, 1),
(33, '舞姿美', 0, 1),
(34, '梦中情人', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `t_login_setup`
--

CREATE TABLE IF NOT EXISTS `t_login_setup` (
  `t_id` int(11) NOT NULL,
  `t_app_id` varchar(100) DEFAULT NULL,
  `t_app_secret` varchar(255) DEFAULT NULL,
  `t_type` int(11) DEFAULT NULL COMMENT '0.QQ互联\r\n1.微信互联',
  `t_state` int(11) DEFAULT NULL COMMENT '0.启用\r\n1.禁用',
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_login_setup`
--

INSERT INTO `t_login_setup` (`t_id`, `t_app_id`, `t_app_secret`, `t_type`, `t_state`, `t_create_time`) VALUES
(2, 'wx73bae73d058a5a80', 'aafc28161b3365bfeb10e058a30fde18', 1, 1, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `t_log_time`
--

CREATE TABLE IF NOT EXISTS `t_log_time` (
  `t_id` int(11) NOT NULL,
  `t_user_id` int(11) DEFAULT NULL,
  `t_login_time` datetime DEFAULT NULL,
  `t_logout_time` datetime DEFAULT NULL,
  `t_duration` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1679 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_log_time`
--

INSERT INTO `t_log_time` (`t_id`, `t_user_id`, `t_login_time`, `t_logout_time`, `t_duration`) VALUES
(1, 2, '2020-04-24 00:31:52', NULL, NULL),
(2, 3, '2020-04-24 00:42:33', NULL, NULL),
(3, 3, '2020-04-24 00:42:50', NULL, NULL),
(4, 3, '2020-04-24 00:43:40', NULL, NULL),
(5, 3, '2020-04-24 00:44:53', NULL, NULL),
(6, 3, '2020-04-24 00:45:08', NULL, NULL),
(7, 3, '2020-04-24 00:46:13', NULL, NULL),
(8, 3, '2020-04-24 00:46:41', NULL, NULL),
(9, 2, '2020-04-24 00:54:56', NULL, NULL),
(10, 3, '2020-04-24 00:56:26', NULL, NULL),
(11, 3, '2020-04-24 03:01:52', NULL, NULL),
(12, 2, '2020-04-24 06:46:52', NULL, NULL),
(13, 2, '2020-04-24 07:03:48', NULL, NULL),
(14, 2, '2020-04-24 07:06:24', NULL, NULL),
(15, 2, '2020-04-24 07:07:39', NULL, NULL),
(16, 2, '2020-04-24 07:14:48', NULL, NULL),
(17, 2, '2020-04-24 07:15:48', NULL, NULL),
(18, 2, '2020-04-24 07:16:49', NULL, NULL),
(19, 2, '2020-04-24 07:40:00', NULL, NULL),
(20, 2, '2020-04-24 10:56:19', NULL, NULL),
(21, 2, '2020-04-24 12:03:56', NULL, NULL),
(22, 2, '2020-04-24 12:26:40', NULL, NULL),
(23, 2, '2020-04-24 12:32:47', NULL, NULL),
(24, 2, '2020-04-24 12:34:03', NULL, NULL),
(25, 2, '2020-04-24 13:49:21', NULL, NULL),
(26, 2, '2020-04-24 13:53:13', NULL, NULL),
(27, 2, '2020-04-24 13:54:43', NULL, NULL),
(28, 2, '2020-04-24 14:07:43', NULL, NULL),
(29, 3, '2020-04-24 14:27:18', NULL, NULL),
(30, 3, '2020-04-24 14:28:11', NULL, NULL),
(31, 3, '2020-04-24 14:29:09', NULL, NULL),
(32, 3, '2020-04-24 14:30:02', NULL, NULL),
(33, 3, '2020-04-24 14:30:59', NULL, NULL),
(34, 3, '2020-04-24 14:31:52', NULL, NULL),
(35, 2, '2020-04-24 14:32:46', NULL, NULL),
(36, 3, '2020-04-24 14:32:50', NULL, NULL),
(37, 3, '2020-04-24 14:33:42', NULL, NULL),
(38, 3, '2020-04-24 14:34:41', NULL, NULL),
(39, 3, '2020-04-24 14:35:33', NULL, NULL),
(40, 3, '2020-04-24 14:36:31', NULL, NULL),
(41, 3, '2020-04-24 14:37:23', NULL, NULL),
(42, 3, '2020-04-24 14:38:37', NULL, NULL),
(43, 3, '2020-04-24 14:39:29', NULL, NULL),
(44, 3, '2020-04-24 14:40:27', NULL, NULL),
(45, 3, '2020-04-24 14:41:19', NULL, NULL),
(46, 3, '2020-04-24 14:42:18', NULL, NULL),
(47, 3, '2020-04-24 14:43:10', NULL, NULL),
(48, 3, '2020-04-24 14:44:08', NULL, NULL),
(49, 3, '2020-04-24 14:45:00', NULL, NULL),
(50, 3, '2020-04-24 14:45:59', NULL, NULL),
(51, 3, '2020-04-24 14:46:51', NULL, NULL),
(52, 3, '2020-04-24 14:47:50', NULL, NULL),
(53, 3, '2020-04-24 14:48:41', NULL, NULL),
(54, 3, '2020-04-24 14:49:40', NULL, NULL),
(55, 3, '2020-04-24 14:50:32', NULL, NULL),
(56, 3, '2020-04-24 14:51:46', NULL, NULL),
(57, 3, '2020-04-24 14:52:53', NULL, NULL),
(58, 3, '2020-04-24 14:53:51', NULL, NULL),
(59, 3, '2020-04-24 14:54:43', NULL, NULL),
(60, 2, '2020-04-24 14:54:56', NULL, NULL),
(61, 3, '2020-04-24 14:55:41', NULL, NULL),
(62, 3, '2020-04-24 14:56:34', NULL, NULL),
(63, 3, '2020-04-24 14:57:32', NULL, NULL),
(64, 3, '2020-04-24 14:58:24', NULL, NULL),
(65, 3, '2020-04-24 14:59:22', NULL, NULL),
(66, 3, '2020-04-24 15:00:15', NULL, NULL),
(67, 3, '2020-04-24 15:01:13', NULL, NULL),
(68, 3, '2020-04-24 15:02:05', NULL, NULL),
(69, 3, '2020-04-24 15:03:03', NULL, NULL),
(70, 3, '2020-04-24 15:03:55', NULL, NULL),
(71, 3, '2020-04-24 15:04:54', NULL, NULL),
(72, 3, '2020-04-24 15:05:46', NULL, NULL),
(73, 3, '2020-04-24 15:06:44', NULL, NULL),
(74, 3, '2020-04-24 15:07:36', NULL, NULL),
(75, 3, '2020-04-24 15:08:35', NULL, NULL),
(76, 3, '2020-04-24 15:09:42', NULL, NULL),
(77, 3, '2020-04-24 15:10:40', NULL, NULL),
(78, 3, '2020-04-24 15:11:32', NULL, NULL),
(79, 3, '2020-04-24 15:12:31', NULL, NULL),
(80, 3, '2020-04-24 15:13:23', NULL, NULL),
(81, 3, '2020-04-24 15:14:21', NULL, NULL),
(82, 3, '2020-04-24 15:15:13', NULL, NULL),
(83, 3, '2020-04-24 15:16:12', NULL, NULL),
(84, 3, '2020-04-24 15:17:03', NULL, NULL),
(85, 3, '2020-04-24 15:18:02', NULL, NULL),
(86, 3, '2020-04-24 15:18:54', NULL, NULL),
(87, 3, '2020-04-24 15:19:52', NULL, NULL),
(88, 3, '2020-04-24 15:20:44', NULL, NULL),
(89, 2, '2020-04-24 15:21:41', NULL, NULL),
(90, 3, '2020-04-24 15:21:43', NULL, NULL),
(91, 3, '2020-04-24 15:22:35', NULL, NULL),
(92, 3, '2020-04-24 15:23:33', NULL, NULL),
(93, 3, '2020-04-24 15:24:25', NULL, NULL),
(94, 3, '2020-04-24 15:25:24', NULL, NULL),
(95, 3, '2020-04-24 15:26:16', NULL, NULL),
(96, 3, '2020-04-24 15:27:29', NULL, NULL),
(97, 3, '2020-04-24 15:28:21', NULL, NULL),
(98, 3, '2020-04-24 15:29:20', NULL, NULL),
(99, 3, '2020-04-24 15:30:12', NULL, NULL),
(100, 3, '2020-04-24 15:31:10', NULL, NULL),
(101, 3, '2020-04-24 15:32:18', NULL, NULL),
(102, 3, '2020-04-24 15:33:16', NULL, NULL),
(103, 3, '2020-04-24 15:34:08', NULL, NULL),
(104, 3, '2020-04-24 15:35:06', NULL, NULL),
(105, 3, '2020-04-24 15:35:59', NULL, NULL),
(106, 3, '2020-04-24 15:36:57', NULL, NULL),
(107, 3, '2020-04-24 15:37:49', NULL, NULL),
(108, 3, '2020-04-24 15:38:47', NULL, NULL),
(109, 3, '2020-04-24 15:39:40', NULL, NULL),
(110, 2, '2020-04-24 15:40:13', NULL, NULL),
(111, 2, '2020-04-24 15:40:20', NULL, NULL),
(112, 3, '2020-04-24 15:40:37', NULL, NULL),
(113, 3, '2020-04-24 15:41:30', NULL, NULL),
(114, 3, '2020-04-24 15:42:28', NULL, NULL),
(115, 3, '2020-04-24 15:43:20', NULL, NULL),
(116, 3, '2020-04-24 15:44:18', NULL, NULL),
(117, 3, '2020-04-24 15:45:11', NULL, NULL),
(118, 3, '2020-04-24 15:46:25', NULL, NULL),
(119, 3, '2020-04-24 15:47:16', NULL, NULL),
(120, 3, '2020-04-24 15:48:15', NULL, NULL),
(121, 3, '2020-04-24 15:49:07', NULL, NULL),
(122, 3, '2020-04-24 15:50:06', NULL, NULL),
(123, 3, '2020-04-24 15:50:57', NULL, NULL),
(124, 3, '2020-04-24 15:51:56', NULL, NULL),
(125, 3, '2020-04-24 15:52:48', NULL, NULL),
(126, 2, '2020-04-24 15:53:31', NULL, NULL),
(127, 3, '2020-04-24 15:53:46', NULL, NULL),
(128, 3, '2020-04-24 15:54:38', NULL, NULL),
(129, 3, '2020-04-24 15:55:37', NULL, NULL),
(130, 3, '2020-04-24 15:56:28', NULL, NULL),
(131, 3, '2020-04-24 15:57:27', NULL, NULL),
(132, 3, '2020-04-24 15:58:19', NULL, NULL),
(133, 3, '2020-04-24 15:59:18', NULL, NULL),
(134, 3, '2020-04-24 16:00:09', NULL, NULL),
(135, 3, '2020-04-24 16:01:08', NULL, NULL),
(136, 3, '2020-04-24 16:02:00', NULL, NULL),
(137, 3, '2020-04-24 16:02:59', NULL, NULL),
(138, 3, '2020-04-24 16:04:05', NULL, NULL),
(139, 3, '2020-04-24 16:05:04', NULL, NULL),
(140, 3, '2020-04-24 16:05:56', NULL, NULL),
(141, 3, '2020-04-24 16:06:55', NULL, NULL),
(142, 3, '2020-04-24 16:07:46', NULL, NULL),
(143, 3, '2020-04-24 16:08:45', NULL, NULL),
(144, 3, '2020-04-24 16:09:36', NULL, NULL),
(145, 3, '2020-04-24 16:09:36', NULL, NULL),
(146, 3, '2020-04-24 16:10:36', NULL, NULL),
(147, 3, '2020-04-24 16:11:27', NULL, NULL),
(148, 2, '2020-04-24 16:31:06', NULL, NULL),
(149, 2, '2020-04-24 16:33:07', NULL, NULL),
(150, 2, '2020-04-24 18:23:08', NULL, NULL),
(151, 2, '2020-04-24 18:34:08', NULL, NULL),
(152, 2, '2020-04-24 18:35:54', NULL, NULL),
(153, 2, '2020-04-24 19:24:37', NULL, NULL),
(154, 2, '2020-04-24 19:25:13', NULL, NULL),
(155, 2, '2020-04-24 20:00:50', NULL, NULL),
(156, 2, '2020-04-24 20:07:34', NULL, NULL),
(157, 2, '2020-04-24 20:09:07', NULL, NULL),
(158, 2, '2020-04-24 20:25:29', NULL, NULL),
(159, 2, '2020-04-24 20:42:21', NULL, NULL),
(160, 2, '2020-04-24 21:29:05', NULL, NULL),
(161, 2, '2020-04-24 21:30:52', NULL, NULL),
(162, 2, '2020-04-24 21:41:51', NULL, NULL),
(163, 2, '2020-04-24 21:43:21', NULL, NULL),
(164, 2, '2020-04-24 21:46:47', NULL, NULL),
(165, 2, '2020-04-24 21:47:54', NULL, NULL),
(166, 2, '2020-04-24 22:08:55', NULL, NULL),
(167, 2, '2020-04-24 22:11:38', NULL, NULL),
(168, 2, '2020-04-24 22:16:40', NULL, NULL),
(169, 2, '2020-04-24 22:20:54', NULL, NULL),
(170, 2, '2020-04-24 22:44:23', NULL, NULL),
(171, 2, '2020-04-24 22:45:31', NULL, NULL),
(172, 2, '2020-04-24 22:47:01', NULL, NULL),
(173, 2, '2020-04-24 22:57:05', NULL, NULL),
(174, 2, '2020-04-24 23:01:53', NULL, NULL),
(175, 2, '2020-04-24 23:08:15', NULL, NULL),
(176, 2, '2020-04-24 23:57:38', NULL, NULL),
(177, 2, '2020-04-25 00:01:02', NULL, NULL),
(178, 2, '2020-04-25 00:02:33', NULL, NULL),
(179, 2, '2020-04-25 00:05:19', NULL, NULL),
(180, 2, '2020-04-25 00:07:19', NULL, NULL),
(181, 2, '2020-04-25 00:10:21', NULL, NULL),
(182, 2, '2020-04-25 00:12:07', NULL, NULL),
(183, 2, '2020-04-25 00:15:39', NULL, NULL),
(184, 2, '2020-04-25 00:19:26', NULL, NULL),
(185, 2, '2020-04-25 00:21:12', NULL, NULL),
(186, 2, '2020-04-25 00:22:12', NULL, NULL),
(187, 2, '2020-04-25 00:25:29', NULL, NULL),
(188, 3, '2020-04-25 18:21:24', NULL, NULL),
(189, 2, '2020-04-26 18:37:50', NULL, NULL),
(190, 2, '2020-04-26 18:48:59', NULL, NULL),
(191, 2, '2020-04-26 19:01:29', NULL, NULL),
(192, 2, '2020-04-26 19:05:52', NULL, NULL),
(193, 2, '2020-04-26 19:12:02', NULL, NULL),
(194, 2, '2020-04-26 19:17:53', NULL, NULL),
(195, 2, '2020-04-26 19:19:19', NULL, NULL),
(196, 2, '2020-04-26 19:34:38', NULL, NULL),
(197, 2, '2020-04-26 19:37:40', NULL, NULL),
(198, 2, '2020-04-26 19:38:41', NULL, NULL),
(199, 2, '2020-04-26 19:40:23', NULL, NULL),
(200, 2, '2020-04-26 19:48:04', NULL, NULL),
(201, 2, '2020-04-26 19:49:05', NULL, NULL),
(202, 2, '2020-04-26 19:50:08', NULL, NULL),
(203, 2, '2020-04-26 19:51:14', NULL, NULL),
(204, 2, '2020-04-26 19:51:52', NULL, NULL),
(205, 2, '2020-04-26 20:01:55', NULL, NULL),
(206, 2, '2020-04-26 20:05:09', NULL, NULL),
(207, 2, '2020-04-26 20:05:11', NULL, NULL),
(208, 2, '2020-04-26 20:05:17', NULL, NULL),
(209, 2, '2020-04-26 20:07:56', NULL, NULL),
(210, 2, '2020-04-26 20:09:13', NULL, NULL),
(211, 2, '2020-04-26 20:10:13', NULL, NULL),
(212, 2, '2020-04-26 20:23:32', NULL, NULL),
(213, 2, '2020-04-26 20:50:03', NULL, NULL),
(214, 2, '2020-04-26 21:26:14', NULL, NULL),
(215, 2, '2020-04-26 21:35:06', NULL, NULL),
(216, 2, '2020-04-26 22:07:29', NULL, NULL),
(217, 2, '2020-04-26 22:11:46', NULL, NULL),
(218, 2, '2020-04-26 22:32:03', NULL, NULL),
(219, 2, '2020-04-26 22:36:12', NULL, NULL),
(220, 2, '2020-04-26 22:40:03', NULL, NULL),
(221, 2, '2020-04-26 22:49:57', NULL, NULL),
(222, 2, '2020-04-26 22:51:27', NULL, NULL),
(223, 2, '2020-04-27 02:50:16', NULL, NULL),
(224, 2, '2020-04-27 14:13:04', NULL, NULL),
(225, 2, '2020-04-27 14:21:40', NULL, NULL),
(226, 2, '2020-04-27 14:33:29', NULL, NULL),
(227, 2, '2020-04-27 15:23:22', NULL, NULL),
(228, 2, '2020-04-27 15:25:11', NULL, NULL),
(229, 2, '2020-04-27 15:25:12', NULL, NULL),
(230, 2, '2020-04-27 15:34:05', NULL, NULL),
(231, 2, '2020-04-27 15:35:20', NULL, NULL),
(232, 2, '2020-04-27 15:42:24', NULL, NULL),
(233, 2, '2020-04-27 16:37:30', NULL, NULL),
(234, 2, '2020-04-27 17:13:26', NULL, NULL),
(235, 2, '2020-04-27 17:30:02', NULL, NULL),
(236, 2, '2020-04-27 18:21:37', NULL, NULL),
(237, 2, '2020-04-27 19:08:43', NULL, NULL),
(238, 2, '2020-04-27 19:09:49', NULL, NULL),
(239, 2, '2020-04-27 19:31:28', NULL, NULL),
(240, 2, '2020-04-27 19:35:15', NULL, NULL),
(241, 2, '2020-04-27 19:36:15', NULL, NULL),
(242, 2, '2020-04-27 19:47:40', NULL, NULL),
(243, 2, '2020-04-27 19:59:15', NULL, NULL),
(244, 2, '2020-04-27 20:01:31', NULL, NULL),
(245, 2, '2020-04-27 20:11:23', NULL, NULL),
(246, 2, '2020-04-27 20:23:43', NULL, NULL),
(247, 2, '2020-04-27 22:44:50', NULL, NULL),
(248, 2, '2020-04-27 22:47:22', NULL, NULL),
(249, 2, '2020-04-27 22:48:37', NULL, NULL),
(250, 2, '2020-04-28 12:00:53', NULL, NULL),
(251, 2, '2020-04-28 17:42:49', NULL, NULL),
(252, 2, '2020-04-28 18:06:52', NULL, NULL),
(253, 2, '2020-04-28 18:21:12', NULL, NULL),
(254, 2, '2020-04-28 19:31:29', NULL, NULL),
(255, 2, '2020-04-28 19:33:05', NULL, NULL),
(256, 2, '2020-04-28 19:50:06', NULL, NULL),
(257, 2, '2020-04-28 22:44:46', NULL, NULL),
(258, 2, '2020-04-28 22:49:10', NULL, NULL),
(259, 2, '2020-04-28 23:06:29', NULL, NULL),
(260, 2, '2020-04-28 23:06:57', NULL, NULL),
(261, 2, '2020-04-28 23:12:40', NULL, NULL),
(262, 2, '2020-04-29 11:28:50', NULL, NULL),
(263, 2, '2020-04-29 14:13:51', NULL, NULL),
(264, 2, '2020-04-29 15:44:38', NULL, NULL),
(265, 2, '2020-04-29 17:51:25', NULL, NULL),
(266, 2, '2020-04-29 18:27:53', NULL, NULL),
(267, 2, '2020-04-29 22:49:28', NULL, NULL),
(268, 3, '2020-04-30 16:35:13', NULL, NULL),
(269, 3, '2020-04-30 16:35:34', NULL, NULL),
(270, 3, '2020-04-30 16:35:57', NULL, NULL),
(271, 3, '2020-04-30 16:36:14', NULL, NULL),
(272, 3, '2020-04-30 16:53:29', NULL, NULL),
(273, 3, '2020-04-30 16:56:36', NULL, NULL),
(274, 3, '2020-04-30 16:56:54', NULL, NULL),
(275, 3, '2020-04-30 16:57:35', NULL, NULL),
(276, 3, '2020-04-30 16:58:30', NULL, NULL),
(277, 3, '2020-04-30 17:03:55', NULL, NULL),
(278, 3, '2020-04-30 17:07:20', NULL, NULL),
(279, 9, '2020-04-30 18:50:31', NULL, NULL),
(280, 9, '2020-04-30 18:51:02', NULL, NULL),
(281, 9, '2020-04-30 18:53:04', NULL, NULL),
(282, 9, '2020-04-30 18:56:17', NULL, NULL),
(283, 9, '2020-04-30 19:11:58', NULL, NULL),
(284, 3, '2020-04-30 19:23:15', NULL, NULL),
(285, 9, '2020-04-30 19:27:00', NULL, NULL),
(286, 9, '2020-04-30 19:32:52', NULL, NULL),
(287, 9, '2020-04-30 19:33:20', NULL, NULL),
(288, 9, '2020-04-30 19:36:09', NULL, NULL),
(289, 9, '2020-04-30 19:41:59', NULL, NULL),
(290, 9, '2020-04-30 19:45:19', NULL, NULL),
(291, 9, '2020-04-30 19:48:07', NULL, NULL),
(292, 9, '2020-04-30 19:50:33', NULL, NULL),
(293, 9, '2020-04-30 19:52:12', NULL, NULL),
(294, 3, '2020-04-30 19:54:02', NULL, NULL),
(295, 3, '2020-04-30 19:54:27', NULL, NULL),
(296, 3, '2020-04-30 20:10:09', NULL, NULL),
(297, 9, '2020-04-30 20:15:20', NULL, NULL),
(298, 9, '2020-04-30 20:45:30', NULL, NULL),
(299, 9, '2020-04-30 21:35:29', NULL, NULL),
(300, 9, '2020-05-01 00:00:33', NULL, NULL),
(301, 3, '2020-05-01 04:38:19', NULL, NULL),
(302, 3, '2020-05-01 04:38:28', NULL, NULL),
(303, 3, '2020-05-01 04:38:46', NULL, NULL),
(304, 3, '2020-05-01 04:38:49', NULL, NULL),
(305, 3, '2020-05-01 04:38:58', NULL, NULL),
(306, 3, '2020-05-01 04:39:01', NULL, NULL),
(307, 3, '2020-05-01 04:51:07', NULL, NULL),
(308, 3, '2020-05-01 04:51:53', NULL, NULL),
(309, 3, '2020-05-01 04:52:33', NULL, NULL),
(310, 9, '2020-05-01 09:11:53', NULL, NULL),
(311, 9, '2020-05-01 09:27:10', NULL, NULL),
(312, 9, '2020-05-01 10:10:00', NULL, NULL),
(313, 9, '2020-05-01 10:25:17', NULL, NULL),
(314, 9, '2020-05-01 10:25:28', NULL, NULL),
(315, 9, '2020-05-01 11:35:56', NULL, NULL),
(316, 9, '2020-05-01 11:36:13', NULL, NULL),
(317, 9, '2020-05-01 11:56:17', NULL, NULL),
(318, 3, '2020-05-01 13:32:47', NULL, NULL),
(319, 3, '2020-05-01 13:32:50', NULL, NULL),
(320, 3, '2020-05-01 13:33:11', NULL, NULL),
(321, 3, '2020-05-01 13:33:15', NULL, NULL),
(322, 3, '2020-05-01 13:45:38', NULL, NULL),
(323, 3, '2020-05-01 13:45:41', NULL, NULL),
(324, 3, '2020-05-01 13:52:18', NULL, NULL),
(325, 3, '2020-05-01 13:52:23', NULL, NULL),
(326, 3, '2020-05-01 13:52:26', NULL, NULL),
(327, 9, '2020-05-01 14:25:40', NULL, NULL),
(328, 9, '2020-05-01 14:26:20', NULL, NULL),
(329, 9, '2020-05-01 14:27:59', NULL, NULL),
(330, 9, '2020-05-01 14:28:27', NULL, NULL),
(331, 9, '2020-05-01 14:29:09', NULL, NULL),
(332, 9, '2020-05-01 14:29:15', NULL, NULL),
(333, 9, '2020-05-01 14:29:18', NULL, NULL),
(334, 9, '2020-05-01 14:29:24', NULL, NULL),
(335, 9, '2020-05-01 14:29:29', NULL, NULL),
(336, 9, '2020-05-01 14:29:39', NULL, NULL),
(337, 9, '2020-05-01 14:29:44', NULL, NULL),
(338, 9, '2020-05-01 14:31:17', NULL, NULL),
(339, 9, '2020-05-01 14:31:21', NULL, NULL),
(340, 9, '2020-05-01 14:33:25', NULL, NULL),
(341, 3, '2020-05-01 14:43:06', NULL, NULL),
(342, 9, '2020-05-01 14:44:55', NULL, NULL),
(343, 9, '2020-05-01 14:47:19', NULL, NULL),
(344, 9, '2020-05-01 14:47:34', NULL, NULL),
(345, 3, '2020-05-01 14:48:38', NULL, NULL),
(346, 9, '2020-05-01 15:26:37', NULL, NULL),
(347, 9, '2020-05-01 15:26:46', NULL, NULL),
(348, 9, '2020-05-01 15:26:49', NULL, NULL),
(349, 9, '2020-05-01 15:27:56', NULL, NULL),
(350, 9, '2020-05-01 15:32:09', NULL, NULL),
(351, 9, '2020-05-01 15:32:21', NULL, NULL),
(352, 9, '2020-05-01 15:32:26', NULL, NULL),
(353, 9, '2020-05-01 15:34:01', NULL, NULL),
(354, 9, '2020-05-01 15:34:07', NULL, NULL),
(355, 9, '2020-05-01 15:35:07', NULL, NULL),
(356, 9, '2020-05-01 15:35:43', NULL, NULL),
(357, 9, '2020-05-01 15:36:57', NULL, NULL),
(358, 9, '2020-05-01 15:37:25', NULL, NULL),
(359, 9, '2020-05-01 15:37:34', NULL, NULL),
(360, 9, '2020-05-01 15:40:11', NULL, NULL),
(361, 9, '2020-05-01 15:40:42', NULL, NULL),
(362, 9, '2020-05-01 15:41:48', NULL, NULL),
(363, 9, '2020-05-01 15:42:02', NULL, NULL),
(364, 9, '2020-05-01 15:46:41', NULL, NULL),
(365, 9, '2020-05-01 15:46:44', NULL, NULL),
(366, 9, '2020-05-01 15:47:10', NULL, NULL),
(367, 9, '2020-05-01 15:52:15', NULL, NULL),
(368, 9, '2020-05-01 16:04:20', NULL, NULL),
(369, 9, '2020-05-01 16:05:01', NULL, NULL),
(370, 9, '2020-05-01 16:05:55', NULL, NULL),
(371, 9, '2020-05-01 16:06:47', NULL, NULL),
(372, 9, '2020-05-01 16:07:07', NULL, NULL),
(373, 9, '2020-05-01 16:08:00', NULL, NULL),
(374, 9, '2020-05-01 16:08:05', NULL, NULL),
(375, 9, '2020-05-01 16:09:05', NULL, NULL),
(376, 9, '2020-05-01 16:12:53', NULL, NULL),
(377, 9, '2020-05-01 16:13:24', NULL, NULL),
(378, 9, '2020-05-01 16:17:31', NULL, NULL),
(379, 9, '2020-05-01 16:37:58', NULL, NULL),
(380, 3, '2020-05-01 17:02:21', NULL, NULL),
(381, 3, '2020-05-01 17:07:05', NULL, NULL),
(382, 3, '2020-05-01 17:07:44', NULL, NULL),
(383, 3, '2020-05-01 17:08:33', NULL, NULL),
(384, 3, '2020-05-01 17:08:39', NULL, NULL),
(385, 3, '2020-05-01 17:16:07', NULL, NULL),
(386, 9, '2020-05-01 17:16:13', NULL, NULL),
(387, 9, '2020-05-01 17:17:23', NULL, NULL),
(388, 9, '2020-05-01 17:18:23', NULL, NULL),
(389, 9, '2020-05-01 17:18:28', NULL, NULL),
(390, 9, '2020-05-01 17:18:44', NULL, NULL),
(391, 3, '2020-05-01 17:20:39', NULL, NULL),
(392, 3, '2020-05-01 17:27:15', NULL, NULL),
(393, 9, '2020-05-01 17:28:42', NULL, NULL),
(394, 9, '2020-05-01 17:28:45', NULL, NULL),
(395, 9, '2020-05-01 17:32:44', NULL, NULL),
(396, 9, '2020-05-01 17:32:47', NULL, NULL),
(397, 9, '2020-05-01 17:33:26', NULL, NULL),
(398, 9, '2020-05-01 17:33:49', NULL, NULL),
(399, 3, '2020-05-01 17:41:04', NULL, NULL),
(400, 9, '2020-05-01 17:48:04', NULL, NULL),
(401, 9, '2020-05-01 17:48:07', NULL, NULL),
(402, 3, '2020-05-01 18:08:20', NULL, NULL),
(403, 3, '2020-05-01 18:08:20', NULL, NULL),
(404, 3, '2020-05-01 18:08:39', NULL, NULL),
(405, 3, '2020-05-01 18:09:46', NULL, NULL),
(406, 3, '2020-05-01 18:09:59', NULL, NULL),
(407, 3, '2020-05-01 18:10:07', NULL, NULL),
(408, 3, '2020-05-01 18:10:10', NULL, NULL),
(409, 9, '2020-05-01 18:27:04', NULL, NULL),
(410, 9, '2020-05-01 20:09:02', NULL, NULL),
(411, 9, '2020-05-01 20:09:07', NULL, NULL),
(412, 3, '2020-05-01 20:14:38', NULL, NULL),
(413, 3, '2020-05-01 20:14:41', NULL, NULL),
(414, 3, '2020-05-01 20:14:47', NULL, NULL),
(415, 3, '2020-05-01 20:15:02', NULL, NULL),
(416, 3, '2020-05-01 20:15:07', NULL, NULL),
(417, 3, '2020-05-01 20:15:12', NULL, NULL),
(418, 3, '2020-05-01 20:15:42', NULL, NULL),
(419, 3, '2020-05-01 20:15:43', NULL, NULL),
(420, 3, '2020-05-01 20:17:00', NULL, NULL),
(421, 3, '2020-05-01 20:17:05', NULL, NULL),
(422, 9, '2020-05-01 20:17:13', NULL, NULL),
(423, 9, '2020-05-01 20:17:16', NULL, NULL),
(424, 9, '2020-05-01 20:17:22', NULL, NULL),
(425, 9, '2020-05-01 20:18:16', NULL, NULL),
(426, 9, '2020-05-01 20:18:20', NULL, NULL),
(427, 9, '2020-05-01 20:18:25', NULL, NULL),
(428, 9, '2020-05-01 20:21:42', NULL, NULL),
(429, 9, '2020-05-01 20:23:05', NULL, NULL),
(430, 9, '2020-05-01 20:23:48', NULL, NULL),
(431, 9, '2020-05-01 20:24:02', NULL, NULL),
(432, 9, '2020-05-01 20:25:03', NULL, NULL),
(433, 9, '2020-05-01 20:25:10', NULL, NULL),
(434, 9, '2020-05-01 20:25:40', NULL, NULL),
(435, 3, '2020-05-01 20:25:41', NULL, NULL),
(436, 3, '2020-05-01 20:25:59', NULL, NULL),
(437, 9, '2020-05-01 20:26:13', NULL, NULL),
(438, 9, '2020-05-01 20:26:16', NULL, NULL),
(439, 9, '2020-05-01 20:27:01', NULL, NULL),
(440, 9, '2020-05-01 20:27:36', NULL, NULL),
(441, 9, '2020-05-01 20:28:08', NULL, NULL),
(442, 9, '2020-05-01 20:28:57', NULL, NULL),
(443, 9, '2020-05-01 20:30:48', NULL, NULL),
(444, 9, '2020-05-01 20:37:57', NULL, NULL),
(445, 9, '2020-05-01 20:46:28', NULL, NULL),
(446, 9, '2020-05-01 20:50:44', NULL, NULL),
(447, 3, '2020-05-01 20:51:00', NULL, NULL),
(448, 9, '2020-05-01 20:51:29', NULL, NULL),
(449, 9, '2020-05-01 20:51:33', NULL, NULL),
(450, 3, '2020-05-01 20:51:53', NULL, NULL),
(451, 3, '2020-05-01 20:54:40', NULL, NULL),
(452, 3, '2020-05-01 20:54:40', NULL, NULL),
(453, 3, '2020-05-01 20:55:30', NULL, NULL),
(454, 3, '2020-05-01 20:55:31', NULL, NULL),
(455, 3, '2020-05-01 20:55:49', NULL, NULL),
(456, 9, '2020-05-01 21:03:12', NULL, NULL),
(457, 9, '2020-05-01 21:03:47', NULL, NULL),
(458, 9, '2020-05-01 21:04:50', NULL, NULL),
(459, 9, '2020-05-01 21:05:26', NULL, NULL),
(460, 9, '2020-05-01 21:06:22', NULL, NULL),
(461, 9, '2020-05-01 21:07:01', NULL, NULL),
(462, 9, '2020-05-01 21:08:12', NULL, NULL),
(463, 9, '2020-05-01 21:08:56', NULL, NULL),
(464, 3, '2020-05-01 21:09:05', NULL, NULL),
(465, 9, '2020-05-01 21:09:59', NULL, NULL),
(466, 9, '2020-05-01 21:10:34', NULL, NULL),
(467, 9, '2020-05-01 21:11:34', NULL, NULL),
(468, 9, '2020-05-01 21:12:10', NULL, NULL),
(469, 9, '2020-05-01 21:13:10', NULL, NULL),
(470, 9, '2020-05-01 21:13:46', NULL, NULL),
(471, 9, '2020-05-01 21:14:46', NULL, NULL),
(472, 9, '2020-05-01 21:15:19', NULL, NULL),
(473, 9, '2020-05-01 21:15:22', NULL, NULL),
(474, 9, '2020-05-01 21:16:49', NULL, NULL),
(475, 3, '2020-05-01 21:20:30', NULL, NULL),
(476, 3, '2020-05-01 21:20:38', NULL, NULL),
(477, 3, '2020-05-01 21:20:43', NULL, NULL),
(478, 9, '2020-05-01 21:23:17', NULL, NULL),
(479, 9, '2020-05-01 21:23:51', NULL, NULL),
(480, 9, '2020-05-01 21:32:16', NULL, NULL),
(481, 9, '2020-05-01 21:42:38', NULL, NULL),
(482, 3, '2020-05-01 21:53:31', NULL, NULL),
(483, 9, '2020-05-01 22:14:27', NULL, NULL),
(484, 9, '2020-05-01 22:14:50', NULL, NULL),
(485, 9, '2020-05-01 22:22:46', NULL, NULL),
(486, 9, '2020-05-01 22:56:54', NULL, NULL),
(487, 9, '2020-05-02 11:45:38', NULL, NULL),
(488, 9, '2020-05-02 14:50:26', NULL, NULL),
(489, 9, '2020-05-02 14:50:27', NULL, NULL),
(490, 9, '2020-05-02 17:57:00', NULL, NULL),
(491, 14, '2020-05-02 18:20:53', NULL, NULL),
(492, 14, '2020-05-02 18:26:30', NULL, NULL),
(493, 14, '2020-05-02 18:29:29', NULL, NULL),
(494, 14, '2020-05-02 18:47:36', NULL, NULL),
(495, 14, '2020-05-02 22:58:35', NULL, NULL),
(496, 3, '2020-05-02 23:08:19', NULL, NULL),
(497, 3, '2020-05-03 02:47:49', NULL, NULL),
(498, 3, '2020-05-03 02:47:59', NULL, NULL),
(499, 3, '2020-05-03 02:49:04', NULL, NULL),
(500, 3, '2020-05-03 02:49:50', NULL, NULL),
(501, 3, '2020-05-03 02:52:34', NULL, NULL),
(502, 3, '2020-05-03 02:54:43', NULL, NULL),
(503, 3, '2020-05-03 02:54:57', NULL, NULL),
(504, 3, '2020-05-03 02:55:10', NULL, NULL),
(505, 3, '2020-05-03 03:27:51', NULL, NULL),
(506, 3, '2020-05-03 03:29:36', NULL, NULL),
(507, 3, '2020-05-03 03:44:43', NULL, NULL),
(508, 14, '2020-05-03 14:01:22', NULL, NULL),
(509, 14, '2020-05-03 15:01:29', NULL, NULL),
(510, 9, '2020-05-03 15:07:05', NULL, NULL),
(511, 9, '2020-05-03 15:09:09', NULL, NULL),
(512, 9, '2020-05-03 15:09:15', NULL, NULL),
(513, 9, '2020-05-03 15:30:11', NULL, NULL),
(514, 9, '2020-05-03 15:36:32', NULL, NULL),
(515, 9, '2020-05-03 15:45:18', NULL, NULL),
(516, 3, '2020-05-03 15:51:17', NULL, NULL),
(517, 3, '2020-05-03 15:51:18', NULL, NULL),
(518, 9, '2020-05-03 16:00:24', NULL, NULL),
(519, 9, '2020-05-03 16:01:43', NULL, NULL),
(520, 9, '2020-05-03 16:15:28', NULL, NULL),
(521, 9, '2020-05-03 16:53:53', NULL, NULL),
(522, 9, '2020-05-03 16:54:00', NULL, NULL),
(523, 9, '2020-05-03 16:54:13', NULL, NULL),
(524, 9, '2020-05-03 16:54:22', NULL, NULL),
(525, 9, '2020-05-03 16:54:28', NULL, NULL),
(526, 9, '2020-05-03 16:55:30', NULL, NULL),
(527, 9, '2020-05-03 16:57:05', NULL, NULL),
(528, 9, '2020-05-03 17:23:28', NULL, NULL),
(529, 3, '2020-05-03 17:36:15', NULL, NULL),
(530, 3, '2020-05-03 17:37:22', NULL, NULL),
(531, 3, '2020-05-03 17:37:23', NULL, NULL),
(532, 2, '2020-05-03 17:44:52', NULL, NULL),
(533, 3, '2020-05-03 17:45:06', NULL, NULL),
(534, 2, '2020-05-03 17:45:50', NULL, NULL),
(535, 3, '2020-05-03 17:45:56', NULL, NULL),
(536, 3, '2020-05-03 17:46:57', NULL, NULL),
(537, 3, '2020-05-03 17:47:32', NULL, NULL),
(538, 3, '2020-05-03 17:48:32', NULL, NULL),
(539, 3, '2020-05-03 17:49:07', NULL, NULL),
(540, 3, '2020-05-03 17:50:07', NULL, NULL),
(541, 3, '2020-05-03 17:50:44', NULL, NULL),
(542, 3, '2020-05-03 17:51:58', NULL, NULL),
(543, 3, '2020-05-03 17:52:35', NULL, NULL),
(544, 3, '2020-05-03 17:53:33', NULL, NULL),
(545, 3, '2020-05-03 17:54:10', NULL, NULL),
(546, 3, '2020-05-03 17:55:09', NULL, NULL),
(547, 3, '2020-05-03 17:55:46', NULL, NULL),
(548, 3, '2020-05-03 17:56:59', NULL, NULL),
(549, 3, '2020-05-03 17:57:37', NULL, NULL),
(550, 3, '2020-05-03 17:58:34', NULL, NULL),
(551, 3, '2020-05-03 17:59:13', NULL, NULL),
(552, 3, '2020-05-03 18:00:25', NULL, NULL),
(553, 3, '2020-05-03 18:01:04', NULL, NULL),
(554, 3, '2020-05-03 18:02:00', NULL, NULL),
(555, 3, '2020-05-03 18:02:39', NULL, NULL),
(556, 3, '2020-05-03 18:03:51', NULL, NULL),
(557, 3, '2020-05-03 18:04:30', NULL, NULL),
(558, 3, '2020-05-03 18:05:26', NULL, NULL),
(559, 3, '2020-05-03 18:06:06', NULL, NULL),
(560, 3, '2020-05-03 18:07:02', NULL, NULL),
(561, 3, '2020-05-03 18:07:42', NULL, NULL),
(562, 3, '2020-05-03 18:08:53', NULL, NULL),
(563, 3, '2020-05-03 18:09:32', NULL, NULL),
(564, 3, '2020-05-03 18:10:28', NULL, NULL),
(565, 3, '2020-05-03 18:11:08', NULL, NULL),
(566, 2, '2020-05-03 18:11:51', NULL, NULL),
(567, 3, '2020-05-03 18:12:04', NULL, NULL),
(568, 3, '2020-05-03 18:12:44', NULL, NULL),
(569, 3, '2020-05-03 18:13:39', NULL, NULL),
(570, 3, '2020-05-03 18:14:20', NULL, NULL),
(571, 3, '2020-05-03 18:15:15', NULL, NULL),
(572, 3, '2020-05-03 18:15:55', NULL, NULL),
(573, 3, '2020-05-03 18:17:06', NULL, NULL),
(574, 3, '2020-05-03 18:17:46', NULL, NULL),
(575, 3, '2020-05-03 18:18:42', NULL, NULL),
(576, 3, '2020-05-03 18:19:22', NULL, NULL),
(577, 3, '2020-05-03 18:20:58', NULL, NULL),
(578, 3, '2020-05-03 18:21:43', NULL, NULL),
(579, 2, '2020-05-03 18:22:37', NULL, NULL),
(580, 9, '2020-05-03 18:57:59', NULL, NULL),
(581, 9, '2020-05-03 18:58:00', NULL, NULL),
(582, 9, '2020-05-03 18:58:53', NULL, NULL),
(583, 9, '2020-05-03 19:00:51', NULL, NULL),
(584, 9, '2020-05-03 19:08:30', NULL, NULL),
(585, 2, '2020-05-03 20:14:21', NULL, NULL),
(586, 2, '2020-05-03 21:28:23', NULL, NULL),
(587, 9, '2020-05-03 21:34:50', NULL, NULL),
(588, 9, '2020-05-03 21:35:40', NULL, NULL),
(589, 9, '2020-05-03 21:37:21', NULL, NULL),
(590, 3, '2020-05-03 21:37:59', NULL, NULL),
(591, 9, '2020-05-03 21:38:06', NULL, NULL),
(592, 9, '2020-05-03 21:38:06', NULL, NULL),
(593, 3, '2020-05-03 21:40:11', NULL, NULL),
(594, 2, '2020-05-03 21:41:55', NULL, NULL),
(595, 2, '2020-05-03 21:41:56', NULL, NULL),
(596, 9, '2020-05-03 21:42:32', NULL, NULL),
(597, 2, '2020-05-03 21:44:12', NULL, NULL),
(598, 2, '2020-05-03 21:46:02', NULL, NULL),
(599, 2, '2020-05-03 21:47:11', NULL, NULL),
(600, 2, '2020-05-03 21:50:11', NULL, NULL),
(601, 2, '2020-05-03 21:56:47', NULL, NULL),
(602, 2, '2020-05-03 22:20:36', NULL, NULL),
(603, 9, '2020-05-03 22:21:01', NULL, NULL),
(604, 9, '2020-05-04 10:06:58', NULL, NULL),
(605, 9, '2020-05-04 10:08:41', NULL, NULL),
(606, 9, '2020-05-04 10:21:49', NULL, NULL),
(607, 9, '2020-05-04 10:21:49', NULL, NULL),
(608, 9, '2020-05-04 10:22:26', NULL, NULL),
(609, 9, '2020-05-04 10:22:33', NULL, NULL),
(610, 9, '2020-05-04 10:27:20', NULL, NULL),
(611, 9, '2020-05-04 10:28:34', NULL, NULL),
(612, 9, '2020-05-04 10:29:11', NULL, NULL),
(613, 9, '2020-05-04 10:29:31', NULL, NULL),
(614, 9, '2020-05-04 10:30:13', NULL, NULL),
(615, 9, '2020-05-04 10:31:22', NULL, NULL),
(616, 9, '2020-05-04 10:32:04', NULL, NULL),
(617, 9, '2020-05-04 10:33:13', NULL, NULL),
(618, 9, '2020-05-04 10:33:32', NULL, NULL),
(619, 9, '2020-05-04 10:33:55', NULL, NULL),
(620, 9, '2020-05-04 10:35:08', NULL, NULL),
(621, 9, '2020-05-04 10:35:46', NULL, NULL),
(622, 9, '2020-05-04 10:36:43', NULL, NULL),
(623, 9, '2020-05-04 10:37:22', NULL, NULL),
(624, 9, '2020-05-04 10:38:19', NULL, NULL),
(625, 9, '2020-05-04 10:38:57', NULL, NULL),
(626, 9, '2020-05-04 10:39:55', NULL, NULL),
(627, 9, '2020-05-04 10:40:33', NULL, NULL),
(628, 9, '2020-05-04 10:41:31', NULL, NULL),
(629, 9, '2020-05-04 10:42:08', NULL, NULL),
(630, 9, '2020-05-04 10:43:06', NULL, NULL),
(631, 9, '2020-05-04 10:43:45', NULL, NULL),
(632, 9, '2020-05-04 10:44:41', NULL, NULL),
(633, 9, '2020-05-04 10:45:21', NULL, NULL),
(634, 9, '2020-05-04 10:46:32', NULL, NULL),
(635, 9, '2020-05-04 10:46:40', NULL, NULL),
(636, 9, '2020-05-04 10:47:12', NULL, NULL),
(637, 9, '2020-05-04 10:48:18', NULL, NULL),
(638, 9, '2020-05-04 10:48:49', NULL, NULL),
(639, 9, '2020-05-04 10:49:03', NULL, NULL),
(640, 9, '2020-05-04 10:50:01', NULL, NULL),
(641, 9, '2020-05-04 10:50:39', NULL, NULL),
(642, 9, '2020-05-04 10:51:37', NULL, NULL),
(643, 9, '2020-05-04 10:52:19', NULL, NULL),
(644, 9, '2020-05-04 10:53:38', NULL, NULL),
(645, 9, '2020-05-04 10:54:26', NULL, NULL),
(646, 9, '2020-05-04 10:55:20', NULL, NULL),
(647, 9, '2020-05-04 10:55:29', NULL, NULL),
(648, 9, '2020-05-04 10:56:36', NULL, NULL),
(649, 9, '2020-05-04 10:57:04', NULL, NULL),
(650, 9, '2020-05-04 11:49:17', NULL, NULL),
(651, 9, '2020-05-04 12:45:56', NULL, NULL),
(652, 9, '2020-05-04 12:46:33', NULL, NULL),
(653, 9, '2020-05-04 12:47:31', NULL, NULL),
(654, 9, '2020-05-04 12:48:09', NULL, NULL),
(655, 9, '2020-05-04 12:49:07', NULL, NULL),
(656, 9, '2020-05-04 12:49:45', NULL, NULL),
(657, 9, '2020-05-04 12:50:58', NULL, NULL),
(658, 9, '2020-05-04 12:51:36', NULL, NULL),
(659, 9, '2020-05-04 12:56:34', NULL, NULL),
(660, 9, '2020-05-04 12:57:13', NULL, NULL),
(661, 9, '2020-05-04 12:58:25', NULL, NULL),
(662, 9, '2020-05-04 12:59:07', NULL, NULL),
(663, 9, '2020-05-04 13:00:06', NULL, NULL),
(664, 9, '2020-05-04 13:00:45', NULL, NULL),
(665, 9, '2020-05-04 13:01:38', NULL, NULL),
(666, 9, '2020-05-04 13:02:20', NULL, NULL),
(667, 9, '2020-05-04 13:03:14', NULL, NULL),
(668, 9, '2020-05-04 13:03:56', NULL, NULL),
(669, 9, '2020-05-04 13:05:05', NULL, NULL),
(670, 2, '2020-05-04 13:05:27', NULL, NULL),
(671, 9, '2020-05-04 13:05:43', NULL, NULL),
(672, 2, '2020-05-04 13:34:58', NULL, NULL),
(673, 16, '2020-05-04 13:36:16', NULL, NULL),
(674, 16, '2020-05-04 13:37:19', NULL, NULL),
(675, 16, '2020-05-04 13:38:17', NULL, NULL),
(676, 16, '2020-05-04 13:40:06', NULL, NULL),
(677, 16, '2020-05-04 13:45:31', NULL, NULL),
(678, 16, '2020-05-04 13:51:27', NULL, NULL),
(679, 16, '2020-05-04 13:51:30', NULL, NULL),
(680, 16, '2020-05-04 13:51:38', NULL, NULL),
(681, 16, '2020-05-04 13:55:43', NULL, NULL),
(682, 16, '2020-05-04 13:56:16', NULL, NULL),
(683, 9, '2020-05-04 13:56:33', NULL, NULL),
(684, 16, '2020-05-04 13:56:33', NULL, NULL),
(685, 16, '2020-05-04 14:01:02', NULL, NULL),
(686, 9, '2020-05-04 14:01:02', NULL, NULL),
(687, 9, '2020-05-04 14:01:41', NULL, NULL),
(688, 9, '2020-05-04 14:02:50', NULL, NULL),
(689, 9, '2020-05-04 14:03:32', NULL, NULL),
(690, 9, '2020-05-04 14:03:33', NULL, NULL),
(691, 9, '2020-05-04 14:04:22', NULL, NULL),
(692, 9, '2020-05-04 14:05:11', NULL, NULL),
(693, 16, '2020-05-04 14:05:40', NULL, NULL),
(694, 9, '2020-05-04 14:06:11', NULL, NULL),
(695, 9, '2020-05-04 14:06:48', NULL, NULL),
(696, 9, '2020-05-04 14:06:49', NULL, NULL),
(697, 9, '2020-05-04 14:07:47', NULL, NULL),
(698, 16, '2020-05-04 14:07:59', NULL, NULL),
(699, 9, '2020-05-04 14:08:25', NULL, NULL),
(700, 9, '2020-05-04 14:09:23', NULL, NULL),
(701, 9, '2020-05-04 14:10:00', NULL, NULL),
(702, 16, '2020-05-04 14:10:49', NULL, NULL),
(703, 9, '2020-05-04 14:10:59', NULL, NULL),
(704, 9, '2020-05-04 14:11:36', NULL, NULL),
(705, 9, '2020-05-04 14:12:34', NULL, NULL),
(706, 16, '2020-05-04 14:12:55', NULL, NULL),
(707, 9, '2020-05-04 14:13:19', NULL, NULL),
(708, 9, '2020-05-04 14:14:14', NULL, NULL),
(709, 9, '2020-05-04 14:14:54', NULL, NULL),
(710, 9, '2020-05-04 14:15:52', NULL, NULL),
(711, 16, '2020-05-04 14:16:02', NULL, NULL),
(712, 9, '2020-05-04 14:16:30', NULL, NULL),
(713, 9, '2020-05-04 14:17:29', NULL, NULL),
(714, 9, '2020-05-04 14:18:07', NULL, NULL),
(715, 9, '2020-05-04 14:19:24', NULL, NULL),
(716, 9, '2020-05-04 14:20:13', NULL, NULL),
(717, 9, '2020-05-04 14:21:15', NULL, NULL),
(718, 16, '2020-05-04 14:21:43', NULL, NULL),
(719, 9, '2020-05-04 14:22:04', NULL, NULL),
(720, 9, '2020-05-04 14:23:07', NULL, NULL),
(721, 9, '2020-05-04 14:23:46', NULL, NULL),
(722, 9, '2020-05-04 14:24:50', NULL, NULL),
(723, 9, '2020-05-04 14:25:38', NULL, NULL),
(724, 9, '2020-05-04 14:26:43', NULL, NULL),
(725, 16, '2020-05-04 14:26:55', NULL, NULL),
(726, 9, '2020-05-04 14:27:29', NULL, NULL),
(727, 9, '2020-05-04 14:27:40', NULL, NULL),
(728, 9, '2020-05-04 14:28:19', NULL, NULL),
(729, 9, '2020-05-04 14:29:32', NULL, NULL),
(730, 9, '2020-05-04 14:30:10', NULL, NULL),
(731, 16, '2020-05-04 14:33:13', NULL, NULL),
(732, 16, '2020-05-04 14:33:13', NULL, NULL),
(733, 9, '2020-05-04 14:35:37', NULL, NULL),
(734, 16, '2020-05-04 14:36:00', NULL, NULL),
(735, 9, '2020-05-04 14:36:22', NULL, NULL),
(736, 9, '2020-05-04 14:37:28', NULL, NULL),
(737, 9, '2020-05-04 14:38:13', NULL, NULL),
(738, 9, '2020-05-04 14:39:19', NULL, NULL),
(739, 9, '2020-05-04 14:40:06', NULL, NULL),
(740, 16, '2020-05-04 14:40:17', NULL, NULL),
(741, 16, '2020-05-04 14:40:40', NULL, NULL),
(742, 16, '2020-05-04 14:40:40', NULL, NULL),
(743, 9, '2020-05-04 14:41:25', NULL, NULL),
(744, 9, '2020-05-04 14:42:13', NULL, NULL),
(745, 9, '2020-05-04 14:43:32', NULL, NULL),
(746, 16, '2020-05-04 14:43:42', NULL, NULL),
(747, 9, '2020-05-04 14:44:21', NULL, NULL),
(748, 9, '2020-05-04 14:45:22', NULL, NULL),
(749, 16, '2020-05-04 14:45:36', NULL, NULL),
(750, 9, '2020-05-04 14:46:12', NULL, NULL),
(751, 9, '2020-05-04 14:47:15', NULL, NULL),
(752, 9, '2020-05-04 14:48:03', NULL, NULL),
(753, 9, '2020-05-04 14:49:06', NULL, NULL),
(754, 16, '2020-05-04 14:49:14', NULL, NULL),
(755, 9, '2020-05-04 14:49:54', NULL, NULL),
(756, 16, '2020-05-04 14:50:21', NULL, NULL),
(757, 9, '2020-05-04 14:50:58', NULL, NULL),
(758, 9, '2020-05-04 14:51:45', NULL, NULL),
(759, 9, '2020-05-04 14:52:49', NULL, NULL),
(760, 9, '2020-05-04 14:53:36', NULL, NULL),
(761, 9, '2020-05-04 14:54:41', NULL, NULL),
(762, 9, '2020-05-04 14:55:27', NULL, NULL),
(763, 16, '2020-05-04 14:55:42', NULL, NULL),
(764, 16, '2020-05-04 14:55:47', NULL, NULL),
(765, 9, '2020-05-04 14:56:31', NULL, NULL),
(766, 9, '2020-05-04 14:57:18', NULL, NULL),
(767, 9, '2020-05-04 14:58:22', NULL, NULL),
(768, 9, '2020-05-04 14:59:09', NULL, NULL),
(769, 16, '2020-05-04 15:00:14', NULL, NULL),
(770, 9, '2020-05-04 15:00:14', NULL, NULL),
(771, 9, '2020-05-04 15:01:00', NULL, NULL),
(772, 9, '2020-05-04 15:01:57', NULL, NULL),
(773, 9, '2020-05-04 15:02:36', NULL, NULL),
(774, 9, '2020-05-04 15:03:35', NULL, NULL),
(775, 9, '2020-05-04 15:04:12', NULL, NULL),
(776, 9, '2020-05-04 15:05:11', NULL, NULL),
(777, 9, '2020-05-04 15:05:48', NULL, NULL),
(778, 9, '2020-05-04 15:06:47', NULL, NULL),
(779, 9, '2020-05-04 15:07:24', NULL, NULL),
(780, 9, '2020-05-04 15:08:38', NULL, NULL),
(781, 9, '2020-05-04 15:09:15', NULL, NULL),
(782, 9, '2020-05-04 15:10:29', NULL, NULL),
(783, 9, '2020-05-04 15:11:06', NULL, NULL),
(784, 9, '2020-05-05 15:34:01', NULL, NULL),
(785, 9, '2020-05-05 15:43:23', NULL, NULL),
(786, 9, '2020-05-05 16:25:26', NULL, NULL),
(787, 9, '2020-05-05 17:59:01', NULL, NULL),
(788, 9, '2020-05-05 17:59:14', NULL, NULL),
(789, 9, '2020-05-05 18:03:35', NULL, NULL),
(790, 9, '2020-05-05 18:28:43', NULL, NULL),
(791, 9, '2020-05-05 18:42:53', NULL, NULL),
(792, 9, '2020-05-05 22:09:04', NULL, NULL),
(793, 9, '2020-05-05 22:11:28', NULL, NULL),
(794, 9, '2020-05-05 22:49:46', NULL, NULL),
(795, 9, '2020-05-05 22:49:53', NULL, NULL),
(796, 9, '2020-05-05 22:49:53', NULL, NULL),
(797, 9, '2020-05-06 13:04:51', NULL, NULL),
(798, 3, '2020-05-06 13:45:14', NULL, NULL),
(799, 3, '2020-05-06 14:05:56', NULL, NULL),
(800, 9, '2020-05-06 15:23:53', NULL, NULL),
(801, 9, '2020-05-06 15:55:00', NULL, NULL),
(802, 9, '2020-05-06 15:56:45', NULL, NULL),
(803, 9, '2020-05-06 15:56:51', NULL, NULL),
(804, 9, '2020-05-06 16:00:30', NULL, NULL),
(805, 9, '2020-05-06 16:02:25', NULL, NULL),
(806, 9, '2020-05-06 16:02:30', NULL, NULL),
(807, 9, '2020-05-06 16:05:34', NULL, NULL),
(808, 9, '2020-05-06 16:07:50', NULL, NULL),
(809, 9, '2020-05-06 16:07:59', NULL, NULL),
(810, 9, '2020-05-06 16:10:19', NULL, NULL),
(811, 9, '2020-05-06 16:20:21', NULL, NULL),
(812, 3, '2020-05-06 16:31:32', NULL, NULL),
(813, 9, '2020-05-06 16:56:37', NULL, NULL),
(814, 9, '2020-05-06 16:59:06', NULL, NULL),
(815, 3, '2020-05-06 18:59:45', NULL, NULL),
(816, 3, '2020-05-06 19:11:15', NULL, NULL),
(817, 3, '2020-05-06 19:26:35', NULL, NULL),
(818, 3, '2020-05-06 19:33:28', NULL, NULL),
(819, 9, '2020-05-06 19:35:19', NULL, NULL),
(820, 3, '2020-05-06 19:35:23', NULL, NULL),
(821, 3, '2020-05-06 19:45:07', NULL, NULL),
(822, 3, '2020-05-06 19:51:10', NULL, NULL),
(823, 3, '2020-05-06 19:51:18', NULL, NULL),
(824, 9, '2020-05-06 20:13:47', NULL, NULL),
(825, 3, '2020-05-06 20:15:38', NULL, NULL),
(826, 9, '2020-05-08 19:21:15', NULL, NULL),
(827, 3, '2020-05-08 19:21:17', NULL, NULL),
(828, 9, '2020-05-08 19:55:19', NULL, NULL),
(829, 9, '2020-05-08 19:55:58', NULL, NULL),
(830, 9, '2020-05-08 19:57:40', NULL, NULL),
(831, 9, '2020-05-08 19:58:19', NULL, NULL),
(832, 9, '2020-05-08 19:59:31', NULL, NULL),
(833, 9, '2020-05-08 20:00:10', NULL, NULL),
(834, 9, '2020-05-08 20:01:18', NULL, NULL),
(835, 9, '2020-05-08 20:02:01', NULL, NULL),
(836, 9, '2020-05-08 20:03:16', NULL, NULL),
(837, 3, '2020-05-08 20:03:18', NULL, NULL),
(838, 9, '2020-05-08 20:10:37', NULL, NULL),
(839, 9, '2020-05-08 20:11:26', NULL, NULL),
(840, 9, '2020-05-08 20:12:35', NULL, NULL),
(841, 9, '2020-05-08 20:13:17', NULL, NULL),
(842, 9, '2020-05-08 20:14:17', NULL, NULL),
(843, 9, '2020-05-08 20:14:52', NULL, NULL),
(844, 9, '2020-05-08 20:17:32', NULL, NULL),
(845, 3, '2020-05-08 20:17:34', NULL, NULL),
(846, 9, '2020-05-08 20:24:08', NULL, NULL),
(847, 9, '2020-05-08 20:24:56', NULL, NULL),
(848, 9, '2020-05-08 20:25:50', NULL, NULL),
(849, 9, '2020-05-08 20:26:32', NULL, NULL),
(850, 9, '2020-05-08 20:27:06', NULL, NULL),
(851, 9, '2020-05-08 20:27:53', NULL, NULL),
(852, 9, '2020-05-08 20:27:55', NULL, NULL),
(853, 9, '2020-05-08 20:27:55', NULL, NULL),
(854, 9, '2020-05-08 20:28:10', NULL, NULL),
(855, 9, '2020-05-08 20:28:10', NULL, NULL),
(856, 9, '2020-05-08 20:28:43', NULL, NULL),
(857, 3, '2020-05-08 20:29:17', NULL, NULL),
(858, 9, '2020-05-08 20:29:25', NULL, NULL),
(859, 9, '2020-05-08 20:30:06', NULL, NULL),
(860, 9, '2020-05-08 20:30:07', NULL, NULL),
(861, 3, '2020-05-08 20:30:13', NULL, NULL),
(862, 9, '2020-05-08 20:30:15', NULL, NULL),
(863, 9, '2020-05-08 20:30:58', NULL, NULL),
(864, 9, '2020-05-08 20:31:43', NULL, NULL),
(865, 9, '2020-05-08 20:32:30', NULL, NULL),
(866, 9, '2020-05-08 20:33:19', NULL, NULL),
(867, 3, '2020-05-08 20:33:50', NULL, NULL),
(868, 9, '2020-05-08 20:33:51', NULL, NULL),
(869, 9, '2020-05-08 20:34:06', NULL, NULL),
(870, 9, '2020-05-08 20:34:41', NULL, NULL),
(871, 9, '2020-05-08 20:35:20', NULL, NULL),
(872, 9, '2020-05-08 20:36:01', NULL, NULL),
(873, 9, '2020-05-08 20:36:43', NULL, NULL),
(874, 9, '2020-05-08 20:36:51', NULL, NULL),
(875, 9, '2020-05-08 20:37:33', NULL, NULL),
(876, 3, '2020-05-08 20:37:55', NULL, NULL),
(877, 9, '2020-05-08 20:38:11', NULL, NULL),
(878, 9, '2020-05-08 20:38:51', NULL, NULL),
(879, 9, '2020-05-08 20:38:58', NULL, NULL),
(880, 9, '2020-05-08 20:39:41', NULL, NULL),
(881, 9, '2020-05-08 20:39:52', NULL, NULL),
(882, 9, '2020-05-08 20:40:13', NULL, NULL),
(883, 9, '2020-05-08 20:40:13', NULL, NULL),
(884, 9, '2020-05-08 20:40:31', NULL, NULL),
(885, 9, '2020-05-08 20:41:17', NULL, NULL),
(886, 3, '2020-05-08 20:41:19', NULL, NULL),
(887, 9, '2020-05-08 20:41:54', NULL, NULL),
(888, 9, '2020-05-08 20:42:05', NULL, NULL),
(889, 9, '2020-05-08 20:42:11', NULL, NULL),
(890, 9, '2020-05-08 20:42:38', NULL, NULL),
(891, 9, '2020-05-08 20:42:45', NULL, NULL),
(892, 9, '2020-05-08 20:43:28', NULL, NULL),
(893, 9, '2020-05-08 20:44:01', NULL, NULL),
(894, 9, '2020-05-08 20:44:11', NULL, NULL),
(895, 9, '2020-05-08 20:44:13', NULL, NULL),
(896, 9, '2020-05-08 20:45:01', NULL, NULL),
(897, 9, '2020-05-08 20:45:41', NULL, NULL),
(898, 9, '2020-05-08 20:46:21', NULL, NULL),
(899, 9, '2020-05-08 20:47:01', NULL, NULL),
(900, 9, '2020-05-08 20:47:42', NULL, NULL),
(901, 9, '2020-05-08 20:48:22', NULL, NULL),
(902, 9, '2020-05-08 20:49:02', NULL, NULL),
(903, 9, '2020-05-08 20:49:43', NULL, NULL),
(904, 9, '2020-05-08 20:50:23', NULL, NULL),
(905, 9, '2020-05-08 20:51:04', NULL, NULL),
(906, 9, '2020-05-08 20:51:43', NULL, NULL),
(907, 9, '2020-05-08 20:52:26', NULL, NULL),
(908, 9, '2020-05-08 20:53:04', NULL, NULL),
(909, 9, '2020-05-08 20:53:46', NULL, NULL),
(910, 9, '2020-05-08 20:54:25', NULL, NULL),
(911, 9, '2020-05-08 20:55:07', NULL, NULL),
(912, 9, '2020-05-08 20:55:45', NULL, NULL),
(913, 9, '2020-05-08 20:56:27', NULL, NULL),
(914, 9, '2020-05-08 20:57:06', NULL, NULL),
(915, 9, '2020-05-08 20:57:48', NULL, NULL),
(916, 9, '2020-05-08 20:58:26', NULL, NULL),
(917, 9, '2020-05-08 20:59:08', NULL, NULL),
(918, 9, '2020-05-08 20:59:46', NULL, NULL),
(919, 9, '2020-05-08 21:00:29', NULL, NULL),
(920, 9, '2020-05-08 21:01:07', NULL, NULL),
(921, 9, '2020-05-08 21:01:50', NULL, NULL),
(922, 9, '2020-05-08 21:02:27', NULL, NULL),
(923, 9, '2020-05-08 21:03:10', NULL, NULL),
(924, 9, '2020-05-08 21:03:48', NULL, NULL),
(925, 9, '2020-05-08 21:04:30', NULL, NULL),
(926, 9, '2020-05-08 21:05:08', NULL, NULL),
(927, 9, '2020-05-08 21:05:51', NULL, NULL),
(928, 9, '2020-05-08 21:06:29', NULL, NULL),
(929, 9, '2020-05-08 21:07:12', NULL, NULL),
(930, 9, '2020-05-08 21:07:51', NULL, NULL),
(931, 9, '2020-05-08 21:08:32', NULL, NULL),
(932, 9, '2020-05-08 21:09:11', NULL, NULL),
(933, 9, '2020-05-08 21:09:53', NULL, NULL),
(934, 9, '2020-05-08 21:10:32', NULL, NULL),
(935, 9, '2020-05-08 21:11:14', NULL, NULL),
(936, 9, '2020-05-08 21:11:52', NULL, NULL),
(937, 9, '2020-05-08 21:12:34', NULL, NULL),
(938, 9, '2020-05-08 21:13:12', NULL, NULL),
(939, 9, '2020-05-08 21:13:39', NULL, NULL),
(940, 9, '2020-05-08 21:13:55', NULL, NULL),
(941, 9, '2020-05-08 21:14:44', NULL, NULL),
(942, 9, '2020-05-08 21:15:32', NULL, NULL),
(943, 9, '2020-05-08 21:16:20', NULL, NULL),
(944, 9, '2020-05-08 21:17:08', NULL, NULL),
(945, 9, '2020-05-08 21:17:56', NULL, NULL),
(946, 9, '2020-05-08 21:18:43', NULL, NULL),
(947, 9, '2020-05-08 21:19:14', NULL, NULL),
(948, 9, '2020-05-08 21:19:31', NULL, NULL),
(949, 9, '2020-05-08 21:19:49', NULL, NULL),
(950, 9, '2020-05-08 21:19:53', NULL, NULL),
(951, 9, '2020-05-08 21:19:59', NULL, NULL),
(952, 9, '2020-05-08 21:20:36', NULL, NULL),
(953, 9, '2020-05-08 21:20:58', NULL, NULL),
(954, 9, '2020-05-08 21:21:43', NULL, NULL),
(955, 9, '2020-05-08 21:21:44', NULL, NULL),
(956, 9, '2020-05-08 21:22:19', NULL, NULL),
(957, 9, '2020-05-08 21:23:04', NULL, NULL),
(958, 9, '2020-05-08 21:23:59', NULL, NULL),
(959, 9, '2020-05-08 21:24:02', NULL, NULL),
(960, 9, '2020-05-08 21:24:40', NULL, NULL),
(961, 9, '2020-05-08 21:25:11', NULL, NULL),
(962, 9, '2020-05-08 21:26:00', NULL, NULL),
(963, 9, '2020-05-08 21:26:15', NULL, NULL),
(964, 9, '2020-05-08 21:26:20', NULL, NULL),
(965, 9, '2020-05-08 21:27:10', NULL, NULL),
(966, 9, '2020-05-08 21:27:14', NULL, NULL),
(967, 9, '2020-05-08 21:34:05', NULL, NULL),
(968, 9, '2020-05-08 21:36:07', NULL, NULL),
(969, 9, '2020-05-08 21:36:16', NULL, NULL),
(970, 9, '2020-05-08 21:37:17', NULL, NULL),
(971, 9, '2020-05-08 21:39:00', NULL, NULL),
(972, 9, '2020-05-08 21:41:13', NULL, NULL),
(973, 9, '2020-05-08 21:46:28', NULL, NULL),
(974, 9, '2020-05-08 21:46:47', NULL, NULL),
(975, 9, '2020-05-08 21:48:09', NULL, NULL),
(976, 9, '2020-05-08 21:50:31', NULL, NULL),
(977, 9, '2020-05-08 21:51:53', NULL, NULL),
(978, 9, '2020-05-08 21:56:27', NULL, NULL),
(979, 9, '2020-05-08 22:05:07', NULL, NULL),
(980, 9, '2020-05-09 11:18:22', NULL, NULL),
(981, 9, '2020-05-09 11:28:15', NULL, NULL),
(982, 9, '2020-05-09 11:32:28', NULL, NULL),
(983, 9, '2020-05-09 11:52:29', NULL, NULL),
(984, 9, '2020-05-09 12:38:01', NULL, NULL),
(985, 9, '2020-05-09 12:48:50', NULL, NULL),
(986, 9, '2020-05-09 13:29:54', NULL, NULL),
(987, 9, '2020-05-09 13:49:58', NULL, NULL),
(988, 9, '2020-05-09 13:53:08', NULL, NULL),
(989, 9, '2020-05-09 13:57:21', NULL, NULL),
(990, 9, '2020-05-09 13:58:11', NULL, NULL),
(991, 9, '2020-05-09 17:29:49', NULL, NULL),
(992, 9, '2020-05-09 19:14:46', NULL, NULL),
(993, 9, '2020-05-09 19:22:49', NULL, NULL),
(994, 9, '2020-05-09 19:23:58', NULL, NULL),
(995, 9, '2020-05-09 19:26:40', NULL, NULL),
(996, 9, '2020-05-09 19:26:50', NULL, NULL),
(997, 9, '2020-05-09 19:28:55', NULL, NULL),
(998, 9, '2020-05-09 19:30:41', NULL, NULL),
(999, 2, '2020-05-09 19:30:50', NULL, NULL),
(1000, 9, '2020-05-09 19:30:50', NULL, NULL),
(1001, 9, '2020-05-09 19:32:46', NULL, NULL),
(1002, 9, '2020-05-09 19:33:22', NULL, NULL),
(1003, 29, '2020-05-09 20:08:54', NULL, NULL),
(1004, 31, '2020-05-09 20:13:21', NULL, NULL),
(1005, 31, '2020-05-09 20:22:53', NULL, NULL),
(1006, 31, '2020-05-09 20:23:12', NULL, NULL),
(1007, 31, '2020-05-09 20:23:54', NULL, NULL),
(1008, 31, '2020-05-09 20:24:18', NULL, NULL),
(1009, 31, '2020-05-09 20:25:19', NULL, NULL),
(1010, 31, '2020-05-09 20:26:13', NULL, NULL),
(1011, 29, '2020-05-09 20:33:25', NULL, NULL),
(1012, 31, '2020-05-09 20:33:35', NULL, NULL),
(1013, 31, '2020-05-09 20:33:44', NULL, NULL),
(1014, 31, '2020-05-10 10:17:17', NULL, NULL),
(1015, 31, '2020-05-10 10:17:18', NULL, NULL),
(1016, 29, '2020-05-10 10:18:09', NULL, NULL),
(1017, 31, '2020-05-10 10:19:30', NULL, NULL),
(1018, 29, '2020-05-10 10:20:43', NULL, NULL),
(1019, 29, '2020-05-10 10:21:02', NULL, NULL),
(1020, 29, '2020-05-10 10:25:31', NULL, NULL),
(1021, 29, '2020-05-10 10:26:11', NULL, NULL),
(1022, 29, '2020-05-10 10:27:45', NULL, NULL),
(1023, 29, '2020-05-10 10:29:49', NULL, NULL),
(1024, 29, '2020-05-10 10:30:49', NULL, NULL),
(1025, 29, '2020-05-10 10:31:03', NULL, NULL),
(1026, 29, '2020-05-10 10:33:14', NULL, NULL),
(1027, 29, '2020-05-10 10:34:49', NULL, NULL),
(1028, 29, '2020-05-10 10:35:51', NULL, NULL),
(1029, 29, '2020-05-10 10:40:10', NULL, NULL),
(1030, 29, '2020-05-10 10:43:24', NULL, NULL),
(1031, 29, '2020-05-10 10:43:57', NULL, NULL),
(1032, 29, '2020-05-10 10:44:58', NULL, NULL),
(1033, 29, '2020-05-10 10:59:23', NULL, NULL),
(1034, 29, '2020-05-10 11:03:40', NULL, NULL),
(1035, 29, '2020-05-10 11:05:27', NULL, NULL),
(1036, 29, '2020-05-10 11:09:07', NULL, NULL),
(1037, 29, '2020-05-10 11:13:06', NULL, NULL),
(1038, 29, '2020-05-10 11:17:10', NULL, NULL),
(1039, 29, '2020-05-10 11:26:09', NULL, NULL),
(1040, 29, '2020-05-10 11:42:22', NULL, NULL),
(1041, 29, '2020-05-10 11:43:23', NULL, NULL),
(1042, 29, '2020-05-10 11:45:34', NULL, NULL),
(1043, 29, '2020-05-10 11:46:07', NULL, NULL),
(1044, 31, '2020-05-10 11:46:17', NULL, NULL),
(1045, 31, '2020-05-10 11:47:40', NULL, NULL),
(1046, 29, '2020-05-10 11:50:13', NULL, NULL),
(1047, 29, '2020-05-10 11:54:42', NULL, NULL),
(1048, 29, '2020-05-10 11:57:03', NULL, NULL),
(1049, 29, '2020-05-10 11:57:44', NULL, NULL),
(1050, 29, '2020-05-10 11:58:24', NULL, NULL),
(1051, 29, '2020-05-10 12:05:42', NULL, NULL),
(1052, 29, '2020-05-10 12:06:16', NULL, NULL),
(1053, 31, '2020-05-10 12:16:28', NULL, NULL),
(1054, 31, '2020-05-10 12:16:55', NULL, NULL),
(1055, 29, '2020-05-10 12:19:10', NULL, NULL),
(1056, 29, '2020-05-10 12:20:40', NULL, NULL),
(1057, 31, '2020-05-10 12:21:36', NULL, NULL),
(1058, 29, '2020-05-10 12:21:43', NULL, NULL),
(1059, 29, '2020-05-10 12:22:59', NULL, NULL),
(1060, 29, '2020-05-10 12:24:09', NULL, NULL),
(1061, 31, '2020-05-10 12:25:44', NULL, NULL),
(1062, 29, '2020-05-10 12:25:51', NULL, NULL),
(1063, 31, '2020-05-10 12:25:59', NULL, NULL),
(1064, 29, '2020-05-10 12:32:21', NULL, NULL),
(1065, 31, '2020-05-10 12:34:19', NULL, NULL),
(1066, 29, '2020-05-10 12:35:02', NULL, NULL),
(1067, 29, '2020-05-10 12:35:39', NULL, NULL),
(1068, 29, '2020-05-10 12:50:18', NULL, NULL),
(1069, 29, '2020-05-10 12:50:50', NULL, NULL),
(1070, 29, '2020-05-10 12:51:23', NULL, NULL),
(1071, 29, '2020-05-10 12:52:25', NULL, NULL),
(1072, 31, '2020-05-10 13:26:48', NULL, NULL),
(1073, 31, '2020-05-10 14:48:50', NULL, NULL),
(1074, 31, '2020-05-10 15:15:10', NULL, NULL),
(1075, 31, '2020-05-10 15:16:58', NULL, NULL),
(1076, 31, '2020-05-10 20:40:51', NULL, NULL),
(1077, 31, '2020-05-10 20:49:50', NULL, NULL),
(1078, 31, '2020-05-11 12:32:47', NULL, NULL),
(1079, 31, '2020-05-11 12:32:47', NULL, NULL),
(1080, 31, '2020-05-11 12:39:35', NULL, NULL),
(1081, 39, '2020-05-11 13:12:09', NULL, NULL),
(1082, 39, '2020-05-11 13:12:21', NULL, NULL),
(1083, 39, '2020-05-11 13:12:33', NULL, NULL),
(1084, 31, '2020-05-11 13:19:25', NULL, NULL),
(1085, 39, '2020-05-11 13:20:26', NULL, NULL),
(1086, 39, '2020-05-11 13:22:51', NULL, NULL),
(1087, 39, '2020-05-11 13:24:10', NULL, NULL),
(1088, 31, '2020-05-11 13:26:47', NULL, NULL),
(1089, 39, '2020-05-11 13:28:09', NULL, NULL),
(1090, 31, '2020-05-11 13:30:29', NULL, NULL),
(1091, 31, '2020-05-11 13:30:30', NULL, NULL),
(1092, 31, '2020-05-11 13:31:43', NULL, NULL),
(1093, 39, '2020-05-11 13:32:57', NULL, NULL),
(1094, 39, '2020-05-11 13:32:59', NULL, NULL),
(1095, 31, '2020-05-11 13:34:14', NULL, NULL),
(1096, 31, '2020-05-11 13:34:37', NULL, NULL),
(1097, 39, '2020-05-11 13:35:05', NULL, NULL),
(1098, 31, '2020-05-11 13:36:33', NULL, NULL),
(1099, 39, '2020-05-11 13:37:30', NULL, NULL),
(1100, 39, '2020-05-11 13:44:16', NULL, NULL),
(1101, 31, '2020-05-11 13:46:34', NULL, NULL),
(1102, 39, '2020-05-11 13:47:04', NULL, NULL),
(1103, 39, '2020-05-11 13:47:06', NULL, NULL),
(1104, 39, '2020-05-11 13:47:56', NULL, NULL),
(1105, 31, '2020-05-11 13:48:19', NULL, NULL),
(1106, 39, '2020-05-11 13:48:20', NULL, NULL),
(1107, 39, '2020-05-11 13:48:49', NULL, NULL),
(1108, 39, '2020-05-11 13:49:04', NULL, NULL),
(1109, 39, '2020-05-11 13:49:16', NULL, NULL),
(1110, 39, '2020-05-11 13:49:21', NULL, NULL),
(1111, 31, '2020-05-11 13:50:35', NULL, NULL),
(1112, 39, '2020-05-11 13:51:26', NULL, NULL),
(1113, 31, '2020-05-11 13:52:29', NULL, NULL),
(1114, 31, '2020-05-11 13:53:01', NULL, NULL),
(1115, 31, '2020-05-11 13:55:00', NULL, NULL),
(1116, 39, '2020-05-11 13:55:11', NULL, NULL),
(1117, 39, '2020-05-11 13:55:18', NULL, NULL),
(1118, 39, '2020-05-11 13:55:36', NULL, NULL),
(1119, 39, '2020-05-11 13:57:02', NULL, NULL),
(1120, 39, '2020-05-11 13:57:58', NULL, NULL),
(1121, 31, '2020-05-11 13:58:45', NULL, NULL),
(1122, 29, '2020-05-11 13:58:58', NULL, NULL),
(1123, 31, '2020-05-11 14:01:50', NULL, NULL),
(1124, 39, '2020-05-11 14:04:46', NULL, NULL),
(1125, 31, '2020-05-11 14:04:49', NULL, NULL),
(1126, 39, '2020-05-11 14:04:57', NULL, NULL),
(1127, 39, '2020-05-11 14:06:57', NULL, NULL),
(1128, 39, '2020-05-11 14:07:18', NULL, NULL),
(1129, 39, '2020-05-11 14:07:42', NULL, NULL),
(1130, 31, '2020-05-11 14:08:18', NULL, NULL),
(1131, 31, '2020-05-11 14:12:09', NULL, NULL),
(1132, 39, '2020-05-11 14:13:27', NULL, NULL),
(1133, 39, '2020-05-11 14:13:36', NULL, NULL),
(1134, 39, '2020-05-11 14:14:32', NULL, NULL),
(1135, 39, '2020-05-11 14:14:49', NULL, NULL),
(1136, 39, '2020-05-11 14:16:05', NULL, NULL),
(1137, 31, '2020-05-11 14:16:52', NULL, NULL),
(1138, 39, '2020-05-11 14:44:08', NULL, NULL),
(1139, 29, '2020-05-11 14:57:41', NULL, NULL),
(1140, 31, '2020-05-11 14:57:52', NULL, NULL),
(1141, 29, '2020-05-11 14:59:47', NULL, NULL),
(1142, 29, '2020-05-11 15:02:52', NULL, NULL),
(1143, 31, '2020-05-11 15:13:56', NULL, NULL),
(1144, 29, '2020-05-11 15:18:02', NULL, NULL),
(1145, 29, '2020-05-11 15:19:00', NULL, NULL),
(1146, 39, '2020-05-11 15:40:08', NULL, NULL),
(1147, 31, '2020-05-11 16:36:53', NULL, NULL),
(1148, 31, '2020-05-11 16:36:56', NULL, NULL),
(1149, 39, '2020-05-11 16:38:50', NULL, NULL),
(1150, 31, '2020-05-11 16:51:36', NULL, NULL),
(1151, 29, '2020-05-11 17:19:31', NULL, NULL),
(1152, 29, '2020-05-11 17:43:03', NULL, NULL),
(1153, 39, '2020-05-11 17:51:08', NULL, NULL),
(1154, 39, '2020-05-11 17:51:08', NULL, NULL);
INSERT INTO `t_log_time` (`t_id`, `t_user_id`, `t_login_time`, `t_logout_time`, `t_duration`) VALUES
(1155, 31, '2020-05-11 18:33:40', NULL, NULL),
(1156, 31, '2020-05-11 19:45:58', NULL, NULL),
(1157, 29, '2020-05-11 20:29:45', NULL, NULL),
(1158, 39, '2020-05-11 23:42:05', NULL, NULL),
(1159, 39, '2020-05-11 23:42:05', NULL, NULL),
(1160, 39, '2020-05-12 01:30:57', NULL, NULL),
(1161, 39, '2020-05-12 01:30:57', NULL, NULL),
(1162, 39, '2020-05-12 01:49:07', NULL, NULL),
(1163, 39, '2020-05-12 01:49:16', NULL, NULL),
(1164, 39, '2020-05-12 01:51:18', NULL, NULL),
(1165, 39, '2020-05-12 01:58:47', NULL, NULL),
(1166, 39, '2020-05-12 01:58:47', NULL, NULL),
(1167, 39, '2020-05-12 02:06:26', NULL, NULL),
(1168, 39, '2020-05-12 02:08:07', NULL, NULL),
(1169, 39, '2020-05-12 02:11:24', NULL, NULL),
(1170, 39, '2020-05-12 02:14:08', NULL, NULL),
(1171, 39, '2020-05-12 02:18:46', NULL, NULL),
(1172, 39, '2020-05-12 02:19:11', NULL, NULL),
(1173, 39, '2020-05-12 02:26:08', NULL, NULL),
(1174, 39, '2020-05-12 02:27:08', NULL, NULL),
(1175, 39, '2020-05-12 02:29:21', NULL, NULL),
(1176, 39, '2020-05-12 02:31:46', NULL, NULL),
(1177, 39, '2020-05-12 02:45:43', NULL, NULL),
(1178, 39, '2020-05-12 02:50:50', NULL, NULL),
(1179, 39, '2020-05-12 02:52:46', NULL, NULL),
(1180, 39, '2020-05-12 02:53:33', NULL, NULL),
(1181, 52, '2020-05-12 10:23:18', NULL, NULL),
(1182, 53, '2020-05-12 10:32:53', NULL, NULL),
(1183, 56, '2020-05-12 10:57:21', NULL, NULL),
(1184, 56, '2020-05-12 10:59:09', NULL, NULL),
(1185, 56, '2020-05-12 11:03:32', NULL, NULL),
(1186, 53, '2020-05-12 11:05:36', NULL, NULL),
(1187, 56, '2020-05-12 11:06:36', NULL, NULL),
(1188, 53, '2020-05-12 11:06:37', NULL, NULL),
(1189, 53, '2020-05-12 11:07:38', NULL, NULL),
(1190, 53, '2020-05-12 11:08:38', NULL, NULL),
(1191, 56, '2020-05-12 11:09:21', NULL, NULL),
(1192, 56, '2020-05-12 11:12:38', NULL, NULL),
(1193, 56, '2020-05-12 11:13:40', NULL, NULL),
(1194, 56, '2020-05-12 11:14:41', NULL, NULL),
(1195, 56, '2020-05-12 11:20:26', NULL, NULL),
(1196, 31, '2020-05-12 11:22:55', NULL, NULL),
(1197, 31, '2020-05-12 11:22:55', NULL, NULL),
(1198, 56, '2020-05-12 11:27:14', NULL, NULL),
(1199, 39, '2020-05-12 11:27:53', NULL, NULL),
(1200, 56, '2020-05-12 11:29:15', NULL, NULL),
(1201, 56, '2020-05-12 11:30:17', NULL, NULL),
(1202, 56, '2020-05-12 11:31:17', NULL, NULL),
(1203, 56, '2020-05-12 11:32:18', NULL, NULL),
(1204, 56, '2020-05-12 11:33:23', NULL, NULL),
(1205, 56, '2020-05-12 11:34:41', NULL, NULL),
(1206, 56, '2020-05-12 11:35:42', NULL, NULL),
(1207, 56, '2020-05-12 11:46:26', NULL, NULL),
(1208, 56, '2020-05-12 11:48:43', NULL, NULL),
(1209, 56, '2020-05-12 11:50:15', NULL, NULL),
(1210, 56, '2020-05-12 11:51:17', NULL, NULL),
(1211, 56, '2020-05-12 11:56:25', NULL, NULL),
(1212, 56, '2020-05-12 11:57:43', NULL, NULL),
(1213, 39, '2020-05-12 11:58:22', NULL, NULL),
(1214, 39, '2020-05-12 11:59:03', NULL, NULL),
(1215, 39, '2020-05-12 12:00:16', NULL, NULL),
(1216, 56, '2020-05-12 12:00:51', NULL, NULL),
(1217, 56, '2020-05-12 12:07:19', NULL, NULL),
(1218, 53, '2020-05-12 12:15:37', NULL, NULL),
(1219, 53, '2020-05-12 12:16:42', NULL, NULL),
(1220, 56, '2020-05-12 12:17:09', NULL, NULL),
(1221, 53, '2020-05-12 12:17:43', NULL, NULL),
(1222, 53, '2020-05-12 12:23:29', NULL, NULL),
(1223, 56, '2020-05-12 12:31:03', NULL, NULL),
(1224, 56, '2020-05-12 12:32:03', NULL, NULL),
(1225, 56, '2020-05-12 12:37:02', NULL, NULL),
(1226, 52, '2020-05-12 12:43:41', NULL, NULL),
(1227, 52, '2020-05-12 12:44:31', NULL, NULL),
(1228, 52, '2020-05-12 12:44:49', NULL, NULL),
(1229, 39, '2020-05-12 12:48:30', NULL, NULL),
(1230, 56, '2020-05-12 13:05:59', NULL, NULL),
(1231, 56, '2020-05-12 13:07:47', NULL, NULL),
(1232, 56, '2020-05-12 13:09:02', NULL, NULL),
(1233, 56, '2020-05-12 13:28:50', NULL, NULL),
(1234, 56, '2020-05-12 13:41:36', NULL, NULL),
(1235, 53, '2020-05-12 13:46:48', NULL, NULL),
(1236, 56, '2020-05-12 13:47:44', NULL, NULL),
(1237, 56, '2020-05-12 13:48:45', NULL, NULL),
(1238, 53, '2020-05-12 13:49:49', NULL, NULL),
(1239, 56, '2020-05-12 13:50:35', NULL, NULL),
(1240, 53, '2020-05-12 13:50:49', NULL, NULL),
(1241, 56, '2020-05-12 13:52:24', NULL, NULL),
(1242, 56, '2020-05-12 13:59:26', NULL, NULL),
(1243, 56, '2020-05-12 14:00:27', NULL, NULL),
(1244, 56, '2020-05-12 14:06:42', NULL, NULL),
(1245, 53, '2020-05-12 14:07:17', NULL, NULL),
(1246, 56, '2020-05-12 14:07:43', NULL, NULL),
(1247, 56, '2020-05-12 14:08:44', NULL, NULL),
(1248, 56, '2020-05-12 14:10:00', NULL, NULL),
(1249, 56, '2020-05-12 14:13:24', NULL, NULL),
(1250, 56, '2020-05-12 14:14:40', NULL, NULL),
(1251, 56, '2020-05-12 14:16:14', NULL, NULL),
(1252, 53, '2020-05-12 14:17:09', NULL, NULL),
(1253, 56, '2020-05-12 14:18:02', NULL, NULL),
(1254, 53, '2020-05-12 14:18:09', NULL, NULL),
(1255, 56, '2020-05-12 14:19:19', NULL, NULL),
(1256, 56, '2020-05-12 14:35:16', NULL, NULL),
(1257, 56, '2020-05-12 14:36:32', NULL, NULL),
(1258, 53, '2020-05-12 14:39:14', NULL, NULL),
(1259, 53, '2020-05-12 14:40:14', NULL, NULL),
(1260, 53, '2020-05-12 14:56:43', NULL, NULL),
(1261, 56, '2020-05-12 15:02:25', NULL, NULL),
(1262, 56, '2020-05-12 15:03:59', NULL, NULL),
(1263, 56, '2020-05-12 15:05:16', NULL, NULL),
(1264, 56, '2020-05-12 15:06:17', NULL, NULL),
(1265, 56, '2020-05-12 15:07:19', NULL, NULL),
(1266, 53, '2020-05-12 15:07:51', NULL, NULL),
(1267, 53, '2020-05-12 15:12:30', NULL, NULL),
(1268, 53, '2020-05-12 15:13:46', NULL, NULL),
(1269, 56, '2020-05-12 15:16:07', NULL, NULL),
(1270, 56, '2020-05-12 15:23:47', NULL, NULL),
(1271, 56, '2020-05-12 15:25:50', NULL, NULL),
(1272, 56, '2020-05-12 15:32:52', NULL, NULL),
(1273, 56, '2020-05-12 15:33:52', NULL, NULL),
(1274, 56, '2020-05-12 15:34:53', NULL, NULL),
(1275, 56, '2020-05-12 15:36:02', NULL, NULL),
(1276, 56, '2020-05-12 15:44:05', NULL, NULL),
(1277, 31, '2020-05-12 15:49:41', NULL, NULL),
(1278, 31, '2020-05-12 15:49:42', NULL, NULL),
(1279, 53, '2020-05-12 15:53:36', NULL, NULL),
(1280, 31, '2020-05-12 15:54:44', NULL, NULL),
(1281, 31, '2020-05-12 16:05:56', NULL, NULL),
(1282, 56, '2020-05-12 16:07:37', NULL, NULL),
(1283, 56, '2020-05-12 16:08:55', NULL, NULL),
(1284, 56, '2020-05-12 16:12:14', NULL, NULL),
(1285, 56, '2020-05-12 16:14:01', NULL, NULL),
(1286, 56, '2020-05-12 16:16:33', NULL, NULL),
(1287, 56, '2020-05-12 16:23:25', NULL, NULL),
(1288, 56, '2020-05-12 17:11:40', NULL, NULL),
(1289, 56, '2020-05-12 17:16:44', NULL, NULL),
(1290, 56, '2020-05-12 17:26:18', NULL, NULL),
(1291, 56, '2020-05-12 17:27:19', NULL, NULL),
(1292, 56, '2020-05-12 17:29:16', NULL, NULL),
(1293, 31, '2020-05-12 17:51:12', NULL, NULL),
(1294, 31, '2020-05-12 17:51:25', NULL, NULL),
(1295, 31, '2020-05-12 17:51:35', NULL, NULL),
(1296, 56, '2020-05-12 17:58:10', NULL, NULL),
(1297, 56, '2020-05-12 18:09:17', NULL, NULL),
(1298, 56, '2020-05-12 18:11:35', NULL, NULL),
(1299, 56, '2020-05-12 18:12:36', NULL, NULL),
(1300, 39, '2020-05-12 20:29:24', NULL, NULL),
(1301, 39, '2020-05-12 20:29:24', NULL, NULL),
(1302, 39, '2020-05-12 22:56:58', NULL, NULL),
(1303, 31, '2020-05-13 00:10:36', NULL, NULL),
(1304, 31, '2020-05-13 00:10:51', NULL, NULL),
(1305, 53, '2020-05-13 00:35:19', NULL, NULL),
(1306, 56, '2020-05-13 08:49:50', NULL, NULL),
(1307, 56, '2020-05-13 09:08:44', NULL, NULL),
(1308, 56, '2020-05-13 09:13:41', NULL, NULL),
(1309, 56, '2020-05-13 09:40:13', NULL, NULL),
(1310, 56, '2020-05-13 09:45:27', NULL, NULL),
(1311, 56, '2020-05-13 10:05:06', NULL, NULL),
(1312, 56, '2020-05-13 10:14:53', NULL, NULL),
(1313, 56, '2020-05-13 10:16:51', NULL, NULL),
(1314, 56, '2020-05-13 10:17:51', NULL, NULL),
(1315, 56, '2020-05-13 10:25:58', NULL, NULL),
(1316, 56, '2020-05-13 10:52:47', NULL, NULL),
(1317, 56, '2020-05-13 10:54:49', NULL, NULL),
(1318, 56, '2020-05-13 10:55:50', NULL, NULL),
(1319, 39, '2020-05-13 11:56:25', NULL, NULL),
(1320, 31, '2020-05-13 12:11:02', NULL, NULL),
(1321, 56, '2020-05-13 13:21:34', NULL, NULL),
(1322, 56, '2020-05-13 13:30:05', NULL, NULL),
(1323, 56, '2020-05-13 14:53:05', NULL, NULL),
(1324, 56, '2020-05-13 14:57:24', NULL, NULL),
(1325, 56, '2020-05-13 15:02:40', NULL, NULL),
(1326, 56, '2020-05-13 15:04:43', NULL, NULL),
(1327, 56, '2020-05-13 15:05:50', NULL, NULL),
(1328, 62, '2020-05-13 15:13:24', NULL, NULL),
(1329, 56, '2020-05-13 15:13:29', NULL, NULL),
(1330, 56, '2020-05-13 15:14:30', NULL, NULL),
(1331, 56, '2020-05-13 15:19:45', NULL, NULL),
(1332, 56, '2020-05-13 15:22:53', NULL, NULL),
(1333, 31, '2020-05-13 16:09:55', NULL, NULL),
(1334, 31, '2020-05-13 16:09:55', NULL, NULL),
(1335, 31, '2020-05-13 16:10:53', NULL, NULL),
(1336, 62, '2020-05-13 16:18:45', NULL, NULL),
(1337, 62, '2020-05-13 16:19:02', NULL, NULL),
(1338, 62, '2020-05-13 16:20:00', NULL, NULL),
(1339, 56, '2020-05-13 16:20:08', NULL, NULL),
(1340, 62, '2020-05-13 16:20:27', NULL, NULL),
(1341, 62, '2020-05-13 16:21:07', NULL, NULL),
(1342, 62, '2020-05-13 16:21:22', NULL, NULL),
(1343, 62, '2020-05-13 16:21:33', NULL, NULL),
(1344, 56, '2020-05-13 16:21:58', NULL, NULL),
(1345, 62, '2020-05-13 17:21:19', NULL, NULL),
(1346, 62, '2020-05-13 17:21:58', NULL, NULL),
(1347, 62, '2020-05-13 17:24:28', NULL, NULL),
(1348, 62, '2020-05-13 17:43:50', NULL, NULL),
(1349, 62, '2020-05-13 17:43:52', NULL, NULL),
(1350, 62, '2020-05-13 17:44:14', NULL, NULL),
(1351, 56, '2020-05-13 19:53:01', NULL, NULL),
(1352, 31, '2020-05-13 19:54:37', NULL, NULL),
(1353, 31, '2020-05-13 19:55:11', NULL, NULL),
(1354, 53, '2020-05-13 20:08:46', NULL, NULL),
(1355, 53, '2020-05-13 20:22:48', NULL, NULL),
(1356, 52, '2020-05-13 20:29:33', NULL, NULL),
(1357, 56, '2020-05-13 20:47:57', NULL, NULL),
(1358, 56, '2020-05-13 20:48:58', NULL, NULL),
(1359, 56, '2020-05-13 20:49:58', NULL, NULL),
(1360, 56, '2020-05-13 20:51:01', NULL, NULL),
(1361, 56, '2020-05-13 20:53:00', NULL, NULL),
(1362, 56, '2020-05-13 20:54:01', NULL, NULL),
(1363, 56, '2020-05-13 20:56:07', NULL, NULL),
(1364, 56, '2020-05-13 20:59:56', NULL, NULL),
(1365, 53, '2020-05-13 21:21:31', NULL, NULL),
(1366, 56, '2020-05-13 21:24:18', NULL, NULL),
(1367, 62, '2020-05-13 21:34:54', NULL, NULL),
(1368, 62, '2020-05-13 21:34:54', NULL, NULL),
(1369, 62, '2020-05-13 21:35:05', NULL, NULL),
(1370, 56, '2020-05-14 00:07:43', NULL, NULL),
(1371, 56, '2020-05-14 00:26:26', NULL, NULL),
(1372, 56, '2020-05-14 00:32:25', NULL, NULL),
(1373, 56, '2020-05-14 00:39:13', NULL, NULL),
(1374, 56, '2020-05-14 00:58:08', NULL, NULL),
(1375, 56, '2020-05-14 01:00:26', NULL, NULL),
(1376, 62, '2020-05-14 01:11:50', NULL, NULL),
(1377, 62, '2020-05-14 01:11:50', NULL, NULL),
(1378, 62, '2020-05-14 12:41:37', NULL, NULL),
(1379, 62, '2020-05-14 14:49:03', NULL, NULL),
(1380, 62, '2020-05-14 14:56:01', NULL, NULL),
(1381, 61, '2020-05-14 20:18:25', NULL, NULL),
(1382, 62, '2020-05-14 20:52:18', NULL, NULL),
(1383, 62, '2020-05-14 20:52:18', NULL, NULL),
(1384, 53, '2020-05-15 00:06:16', NULL, NULL),
(1385, 31, '2020-05-15 11:42:59', NULL, NULL),
(1386, 39, '2020-05-15 12:14:19', NULL, NULL),
(1387, 39, '2020-05-15 12:14:20', NULL, NULL),
(1388, 39, '2020-05-15 12:20:37', NULL, NULL),
(1389, 39, '2020-05-15 12:20:51', NULL, NULL),
(1390, 39, '2020-05-15 12:21:00', NULL, NULL),
(1391, 31, '2020-05-15 12:46:10', NULL, NULL),
(1392, 31, '2020-05-15 12:48:07', NULL, NULL),
(1393, 31, '2020-05-15 12:48:16', NULL, NULL),
(1394, 39, '2020-05-15 12:52:27', NULL, NULL),
(1395, 39, '2020-05-15 12:52:27', NULL, NULL),
(1396, 31, '2020-05-15 12:58:12', NULL, NULL),
(1397, 31, '2020-05-15 13:22:04', NULL, NULL),
(1398, 31, '2020-05-15 13:24:42', NULL, NULL),
(1399, 31, '2020-05-15 13:58:52', NULL, NULL),
(1400, 31, '2020-05-15 13:59:00', NULL, NULL),
(1401, 31, '2020-05-15 14:53:29', NULL, NULL),
(1402, 31, '2020-05-15 14:53:40', NULL, NULL),
(1403, 31, '2020-05-15 16:21:03', NULL, NULL),
(1404, 31, '2020-05-15 16:21:14', NULL, NULL),
(1405, 62, '2020-05-15 18:20:26', NULL, NULL),
(1406, 62, '2020-05-15 18:20:27', NULL, NULL),
(1407, 62, '2020-05-15 18:31:53', NULL, NULL),
(1408, 76, '2020-05-15 21:30:11', NULL, NULL),
(1409, 76, '2020-05-15 21:35:55', NULL, NULL),
(1410, 76, '2020-05-15 21:46:16', NULL, NULL),
(1411, 76, '2020-05-15 21:49:06', NULL, NULL),
(1412, 76, '2020-05-15 21:50:55', NULL, NULL),
(1413, 76, '2020-05-15 22:11:05', NULL, NULL),
(1414, 76, '2020-05-15 23:40:06', NULL, NULL),
(1415, 39, '2020-05-16 10:01:57', NULL, NULL),
(1416, 39, '2020-05-16 10:01:57', NULL, NULL),
(1417, 76, '2020-05-16 11:55:14', NULL, NULL),
(1418, 31, '2020-05-16 15:34:25', NULL, NULL),
(1419, 52, '2020-05-16 16:56:17', NULL, NULL),
(1420, 52, '2020-05-16 17:14:11', NULL, NULL),
(1421, 52, '2020-05-16 17:18:41', NULL, NULL),
(1422, 56, '2020-05-17 07:51:27', NULL, NULL),
(1423, 56, '2020-05-17 08:43:13', NULL, NULL),
(1424, 56, '2020-05-17 10:00:31', NULL, NULL),
(1425, 56, '2020-05-17 10:07:48', NULL, NULL),
(1426, 56, '2020-05-17 10:52:51', NULL, NULL),
(1427, 56, '2020-05-17 11:03:34', NULL, NULL),
(1428, 56, '2020-05-17 11:06:22', NULL, NULL),
(1429, 56, '2020-05-17 11:16:20', NULL, NULL),
(1430, 56, '2020-05-17 11:44:03', NULL, NULL),
(1431, 56, '2020-05-17 11:46:59', NULL, NULL),
(1432, 56, '2020-05-17 11:49:26', NULL, NULL),
(1433, 39, '2020-05-17 14:05:18', NULL, NULL),
(1434, 39, '2020-05-17 14:05:21', NULL, NULL),
(1435, 56, '2020-05-17 14:33:03', NULL, NULL),
(1436, 56, '2020-05-17 14:38:23', NULL, NULL),
(1437, 56, '2020-05-17 16:26:36', NULL, NULL),
(1438, 56, '2020-05-17 17:00:04', NULL, NULL),
(1439, 56, '2020-05-17 17:27:14', NULL, NULL),
(1440, 56, '2020-05-17 17:43:57', NULL, NULL),
(1441, 56, '2020-05-17 17:46:52', NULL, NULL),
(1442, 29, '2020-05-17 17:46:57', NULL, NULL),
(1443, 29, '2020-05-17 17:46:59', NULL, NULL),
(1444, 29, '2020-05-17 17:47:20', NULL, NULL),
(1445, 56, '2020-05-17 17:53:57', NULL, NULL),
(1446, 56, '2020-05-17 17:56:38', NULL, NULL),
(1447, 56, '2020-05-17 18:11:09', NULL, NULL),
(1448, 56, '2020-05-17 18:24:37', NULL, NULL),
(1449, 56, '2020-05-17 18:39:10', NULL, NULL),
(1450, 56, '2020-05-17 18:40:28', NULL, NULL),
(1451, 56, '2020-05-17 18:50:19', NULL, NULL),
(1452, 62, '2020-05-17 23:30:54', NULL, NULL),
(1453, 62, '2020-05-17 23:30:55', NULL, NULL),
(1454, 62, '2020-05-17 23:31:05', NULL, NULL),
(1455, 56, '2020-05-17 23:32:57', NULL, NULL),
(1456, 56, '2020-05-17 23:59:21', NULL, NULL),
(1457, 31, '2020-05-18 13:46:50', NULL, NULL),
(1458, 31, '2020-05-18 14:52:07', NULL, NULL),
(1459, 62, '2020-05-18 20:11:08', NULL, NULL),
(1460, 62, '2020-05-18 20:11:08', NULL, NULL),
(1461, 62, '2020-05-18 22:40:10', NULL, NULL),
(1462, 62, '2020-05-18 22:40:10', NULL, NULL),
(1463, 62, '2020-05-19 00:18:50', NULL, NULL),
(1464, 62, '2020-05-19 09:44:23', NULL, NULL),
(1465, 62, '2020-05-19 09:44:25', NULL, NULL),
(1466, 39, '2020-05-19 16:19:21', NULL, NULL),
(1467, 31, '2020-05-20 15:50:20', NULL, NULL),
(1468, 31, '2020-05-20 15:50:20', NULL, NULL),
(1469, 31, '2020-05-20 15:50:51', NULL, NULL),
(1470, 31, '2020-05-20 15:53:50', NULL, NULL),
(1471, 31, '2020-05-20 15:59:00', NULL, NULL),
(1472, 31, '2020-05-20 20:35:59', NULL, NULL),
(1473, 31, '2020-05-20 20:35:59', NULL, NULL),
(1474, 62, '2020-05-20 22:36:11', NULL, NULL),
(1475, 62, '2020-05-20 22:36:12', NULL, NULL),
(1476, 62, '2020-05-20 22:37:17', NULL, NULL),
(1477, 62, '2020-05-20 22:37:38', NULL, NULL),
(1478, 62, '2020-05-20 22:37:38', NULL, NULL),
(1479, 53, '2020-05-21 16:30:36', NULL, NULL),
(1480, 62, '2020-05-21 20:50:28', NULL, NULL),
(1481, 62, '2020-05-21 20:50:28', NULL, NULL),
(1482, 31, '2020-05-22 14:18:36', NULL, NULL),
(1483, 31, '2020-05-22 14:44:20', NULL, NULL),
(1484, 31, '2020-05-22 15:41:15', NULL, NULL),
(1485, 31, '2020-05-22 15:46:10', NULL, NULL),
(1486, 56, '2020-05-22 22:12:27', NULL, NULL),
(1487, 56, '2020-05-22 22:22:03', NULL, NULL),
(1488, 53, '2020-05-25 18:11:03', NULL, NULL),
(1489, 62, '2020-05-28 14:04:29', NULL, NULL),
(1490, 62, '2020-05-28 14:04:29', NULL, NULL),
(1491, 56, '2020-05-29 21:37:02', NULL, NULL),
(1492, 31, '2020-05-30 12:16:25', NULL, NULL),
(1493, 31, '2020-05-30 23:36:51', NULL, NULL),
(1494, 61, '2020-06-01 08:30:31', NULL, NULL),
(1495, 29, '2020-06-01 12:47:40', NULL, NULL),
(1496, 31, '2020-06-02 22:16:30', NULL, NULL),
(1497, 31, '2020-06-02 22:16:30', NULL, NULL),
(1498, 39, '2020-06-06 00:52:18', NULL, NULL),
(1499, 39, '2020-06-06 00:52:19', NULL, NULL),
(1500, 62, '2020-06-07 00:23:47', NULL, NULL),
(1501, 62, '2020-06-07 00:23:48', NULL, NULL),
(1502, 62, '2020-06-07 01:48:33', NULL, NULL),
(1503, 29, '2020-06-07 20:26:02', NULL, NULL),
(1504, 29, '2020-06-07 20:26:02', NULL, NULL),
(1505, 29, '2020-06-07 20:26:04', NULL, NULL),
(1506, 29, '2020-06-07 23:49:22', NULL, NULL),
(1507, 29, '2020-06-08 10:56:04', NULL, NULL),
(1508, 29, '2020-06-08 11:23:44', NULL, NULL),
(1509, 29, '2020-06-08 11:52:50', NULL, NULL),
(1510, 29, '2020-06-08 18:58:07', NULL, NULL),
(1511, 29, '2020-06-08 19:06:34', NULL, NULL),
(1512, 29, '2020-06-08 19:54:18', NULL, NULL),
(1513, 29, '2020-06-09 01:06:30', NULL, NULL),
(1514, 29, '2020-06-09 01:24:45', NULL, NULL),
(1515, 29, '2020-06-09 01:45:50', NULL, NULL),
(1516, 29, '2020-06-09 01:45:58', NULL, NULL),
(1517, 29, '2020-06-10 23:59:09', NULL, NULL),
(1518, 89, '2020-06-13 16:31:30', NULL, NULL),
(1519, 91, '2020-06-15 15:00:34', NULL, NULL),
(1520, 91, '2020-06-15 17:26:22', NULL, NULL),
(1521, 91, '2020-06-15 18:23:01', NULL, NULL),
(1522, 89, '2020-06-15 18:31:47', NULL, NULL),
(1523, 89, '2020-06-16 11:23:02', NULL, NULL),
(1524, 89, '2020-06-17 16:16:34', NULL, NULL),
(1525, 89, '2020-06-17 16:29:41', NULL, NULL),
(1526, 89, '2020-06-17 16:34:42', NULL, NULL),
(1527, 89, '2020-06-17 16:40:44', NULL, NULL),
(1528, 89, '2020-06-17 16:49:46', NULL, NULL),
(1529, 89, '2020-06-17 16:54:48', NULL, NULL),
(1530, 89, '2020-06-17 16:59:48', NULL, NULL),
(1531, 89, '2020-06-17 17:04:49', NULL, NULL),
(1532, 89, '2020-06-17 17:09:53', NULL, NULL),
(1533, 89, '2020-06-17 17:14:53', NULL, NULL),
(1534, 89, '2020-06-17 17:19:55', NULL, NULL),
(1535, 89, '2020-06-17 17:24:55', NULL, NULL),
(1536, 89, '2020-06-17 17:31:47', NULL, NULL),
(1537, 89, '2020-06-17 17:36:48', NULL, NULL),
(1538, 89, '2020-06-17 17:41:50', NULL, NULL),
(1539, 89, '2020-06-17 17:46:52', NULL, NULL),
(1540, 89, '2020-06-17 17:51:53', NULL, NULL),
(1541, 89, '2020-06-17 17:56:55', NULL, NULL),
(1542, 89, '2020-06-17 18:01:56', NULL, NULL),
(1543, 89, '2020-06-17 18:06:57', NULL, NULL),
(1544, 89, '2020-06-17 18:11:59', NULL, NULL),
(1545, 89, '2020-06-17 18:17:01', NULL, NULL),
(1546, 89, '2020-06-17 18:22:01', NULL, NULL),
(1547, 89, '2020-06-17 18:27:03', NULL, NULL),
(1548, 89, '2020-06-17 18:32:03', NULL, NULL),
(1549, 89, '2020-06-17 18:37:06', NULL, NULL),
(1550, 89, '2020-06-17 18:42:06', NULL, NULL),
(1551, 89, '2020-06-17 18:47:07', NULL, NULL),
(1552, 89, '2020-06-17 18:52:08', NULL, NULL),
(1553, 89, '2020-06-17 18:55:15', NULL, NULL),
(1554, 39, '2020-06-18 09:03:55', NULL, NULL),
(1555, 39, '2020-06-18 09:03:56', NULL, NULL),
(1556, 89, '2020-06-18 17:49:11', NULL, NULL),
(1557, 89, '2020-06-19 19:59:35', NULL, NULL),
(1558, 89, '2020-06-19 22:03:33', NULL, NULL),
(1559, 89, '2020-06-19 22:03:33', NULL, NULL),
(1560, 89, '2020-06-19 22:06:20', NULL, NULL),
(1561, 89, '2020-06-19 22:09:37', NULL, NULL),
(1562, 89, '2020-06-19 22:12:47', NULL, NULL),
(1563, 89, '2020-06-19 22:12:49', NULL, NULL),
(1564, 89, '2020-06-19 22:53:09', NULL, NULL),
(1565, 89, '2020-06-19 22:53:09', NULL, NULL),
(1566, 89, '2020-06-19 22:53:48', NULL, NULL),
(1567, 89, '2020-06-19 22:59:10', NULL, NULL),
(1568, 89, '2020-06-19 23:01:05', NULL, NULL),
(1569, 89, '2020-06-19 23:01:06', NULL, NULL),
(1570, 89, '2020-06-19 23:01:42', NULL, NULL),
(1571, 89, '2020-06-19 23:01:55', NULL, NULL),
(1572, 89, '2020-06-19 23:05:13', NULL, NULL),
(1573, 89, '2020-06-19 23:22:39', NULL, NULL),
(1574, 89, '2020-06-19 23:23:03', NULL, NULL),
(1575, 89, '2020-06-19 23:23:26', NULL, NULL),
(1576, 89, '2020-06-19 23:24:45', NULL, NULL),
(1577, 89, '2020-06-19 23:28:47', NULL, NULL),
(1578, 89, '2020-06-19 23:29:25', NULL, NULL),
(1579, 89, '2020-06-19 23:50:40', NULL, NULL),
(1580, 89, '2020-06-19 23:50:41', NULL, NULL),
(1581, 89, '2020-06-19 23:57:52', NULL, NULL),
(1582, 89, '2020-06-19 23:57:53', NULL, NULL),
(1583, 89, '2020-06-20 00:09:19', NULL, NULL),
(1584, 89, '2020-06-20 00:09:21', NULL, NULL),
(1585, 89, '2020-06-20 00:10:50', NULL, NULL),
(1586, 89, '2020-06-20 00:11:29', NULL, NULL),
(1587, 89, '2020-06-20 00:12:26', NULL, NULL),
(1588, 89, '2020-06-20 00:13:06', NULL, NULL),
(1589, 89, '2020-06-20 00:14:02', NULL, NULL),
(1590, 89, '2020-06-20 00:14:43', NULL, NULL),
(1591, 89, '2020-06-20 00:15:37', NULL, NULL),
(1592, 89, '2020-06-20 00:16:18', NULL, NULL),
(1593, 89, '2020-06-20 00:17:13', NULL, NULL),
(1594, 89, '2020-06-20 00:17:54', NULL, NULL),
(1595, 89, '2020-06-20 00:18:49', NULL, NULL),
(1596, 89, '2020-06-20 00:19:31', NULL, NULL),
(1597, 89, '2020-06-20 00:20:25', NULL, NULL),
(1598, 89, '2020-06-20 00:21:07', NULL, NULL),
(1599, 89, '2020-06-20 00:22:01', NULL, NULL),
(1600, 89, '2020-06-20 00:22:44', NULL, NULL),
(1601, 89, '2020-06-20 00:23:36', NULL, NULL),
(1602, 89, '2020-06-20 00:24:21', NULL, NULL),
(1603, 89, '2020-06-20 00:25:12', NULL, NULL),
(1604, 89, '2020-06-20 00:25:58', NULL, NULL),
(1605, 89, '2020-06-20 00:27:03', NULL, NULL),
(1606, 89, '2020-06-20 00:27:49', NULL, NULL),
(1607, 89, '2020-06-20 00:28:54', NULL, NULL),
(1608, 89, '2020-06-20 00:29:40', NULL, NULL),
(1609, 89, '2020-06-20 00:30:46', NULL, NULL),
(1610, 89, '2020-06-20 00:31:33', NULL, NULL),
(1611, 89, '2020-06-20 00:32:37', NULL, NULL),
(1612, 89, '2020-06-20 00:33:26', NULL, NULL),
(1613, 89, '2020-06-20 00:33:58', NULL, NULL),
(1614, 89, '2020-06-20 00:34:27', NULL, NULL),
(1615, 89, '2020-06-20 00:47:27', NULL, NULL),
(1616, 89, '2020-06-20 00:49:22', NULL, NULL),
(1617, 89, '2020-06-20 00:50:04', NULL, NULL),
(1618, 89, '2020-06-20 00:56:51', NULL, NULL),
(1619, 89, '2020-06-20 01:28:52', NULL, NULL),
(1620, 89, '2020-06-20 01:29:47', NULL, NULL),
(1621, 89, '2020-06-20 01:30:16', NULL, NULL),
(1622, 89, '2020-06-20 10:19:35', NULL, NULL),
(1623, 89, '2020-06-20 13:41:56', NULL, NULL),
(1624, 89, '2020-06-20 13:41:58', NULL, NULL),
(1625, 89, '2020-06-20 17:54:11', NULL, NULL),
(1626, 89, '2020-06-20 20:03:59', NULL, NULL),
(1627, 89, '2020-06-20 20:43:28', NULL, NULL),
(1628, 89, '2020-06-20 20:43:28', NULL, NULL),
(1629, 89, '2020-06-20 20:44:19', NULL, NULL),
(1630, 89, '2020-06-20 21:05:45', NULL, NULL),
(1631, 89, '2020-06-20 21:17:58', NULL, NULL),
(1632, 89, '2020-06-20 21:21:05', NULL, NULL),
(1633, 89, '2020-06-20 21:24:37', NULL, NULL),
(1634, 89, '2020-06-20 21:34:04', NULL, NULL),
(1635, 89, '2020-06-20 21:35:10', NULL, NULL),
(1636, 39, '2020-06-20 23:30:55', NULL, NULL),
(1637, 39, '2020-06-20 23:30:55', NULL, NULL),
(1638, 97, '2020-06-21 13:21:20', NULL, NULL),
(1639, 97, '2020-06-21 13:24:33', NULL, NULL),
(1640, 97, '2020-06-21 13:30:44', NULL, NULL),
(1641, 97, '2020-06-21 13:36:44', NULL, NULL),
(1642, 97, '2020-06-21 13:41:45', NULL, NULL),
(1643, 97, '2020-06-21 13:44:29', NULL, NULL),
(1644, 97, '2020-06-21 13:45:13', NULL, NULL),
(1645, 97, '2020-06-22 00:03:59', NULL, NULL),
(1646, 97, '2020-06-22 00:12:59', NULL, NULL),
(1647, 97, '2020-06-22 00:25:42', NULL, NULL),
(1648, 97, '2020-06-22 01:35:45', NULL, NULL),
(1649, 97, '2020-06-22 10:45:09', NULL, NULL),
(1650, 97, '2020-06-22 10:53:50', NULL, NULL),
(1651, 97, '2020-06-22 11:09:23', NULL, NULL),
(1652, 97, '2020-06-22 11:11:59', NULL, NULL),
(1653, 97, '2020-06-22 11:12:00', NULL, NULL),
(1654, 97, '2020-06-22 11:19:02', NULL, NULL),
(1655, 97, '2020-06-22 11:19:17', NULL, NULL),
(1656, 97, '2020-06-22 11:19:32', NULL, NULL),
(1657, 97, '2020-06-22 11:20:09', NULL, NULL),
(1658, 97, '2020-06-22 11:34:02', NULL, NULL),
(1659, 97, '2020-06-22 11:46:14', NULL, NULL),
(1660, 97, '2020-06-22 11:59:32', NULL, NULL),
(1661, 97, '2020-06-22 11:59:45', NULL, NULL),
(1662, 97, '2020-06-22 11:59:45', NULL, NULL),
(1663, 97, '2020-06-22 12:00:59', NULL, NULL),
(1664, 97, '2020-06-22 12:01:01', NULL, NULL),
(1665, 97, '2020-06-22 12:03:40', NULL, NULL),
(1666, 97, '2020-06-22 12:10:22', NULL, NULL),
(1667, 97, '2020-06-22 12:10:22', NULL, NULL),
(1668, 97, '2020-06-22 12:12:37', NULL, NULL),
(1669, 97, '2020-06-22 12:17:30', NULL, NULL),
(1670, 97, '2020-06-22 12:17:35', NULL, NULL),
(1671, 97, '2020-06-22 12:53:09', NULL, NULL),
(1672, 97, '2020-06-22 12:53:51', NULL, NULL),
(1673, 97, '2020-06-22 12:54:03', NULL, NULL),
(1674, 97, '2020-06-22 12:54:05', NULL, NULL),
(1675, 97, '2020-06-22 12:54:14', NULL, NULL),
(1676, 97, '2020-06-22 12:55:03', NULL, NULL),
(1677, 97, '2020-06-22 14:18:22', NULL, NULL),
(1678, 97, '2020-06-22 14:18:22', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `t_menu`
--

CREATE TABLE IF NOT EXISTS `t_menu` (
  `t_id` int(11) NOT NULL,
  `t_menu_name` varchar(100) DEFAULT NULL,
  `t_menu_url` varchar(255) DEFAULT NULL,
  `t_create_time` datetime DEFAULT NULL,
  `t_father_id` int(11) DEFAULT NULL,
  `t_icon` varchar(255) DEFAULT NULL,
  `t_sort` int(11) DEFAULT '99' COMMENT '排序',
  `t_icon_after` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_menu`
--

INSERT INTO `t_menu` (`t_id`, `t_menu_name`, `t_menu_url`, `t_create_time`, `t_father_id`, `t_icon`, `t_sort`, `t_icon_after`) VALUES
(1, '仪表盘', '/menu/jumpHome.htm', '2018-08-04 16:32:10', 0, '<i class="iconfont icon-shouye"></i>', 1, NULL),
(2, '系统管理', '#', '2018-08-04 10:02:00', 0, '<i class="iconfont icon-ziyuan"></i>', 2, '<i class="more iconfont icon-more"></i>'),
(3, ' 用户管理', '#', '2018-08-03 17:18:25', 0, '<i class="iconfont icon-user"></i>', 3, '<i class="more iconfont icon-more"></i>'),
(4, '财务管理', '#', '2018-08-04 09:44:47', 0, '<i class="iconfont icon-meiyuan4"></i>', 4, '<i class="more iconfont icon-more"></i>'),
(6, '用户列表', '/menu/userList.htm', '2018-08-04 09:48:57', 3, '', 41, NULL),
(7, '封号用户', '/menu/jumpFreezeList.htm', '2018-08-04 09:50:22', 3, '', 99, NULL),
(8, '禁用用户', '/menu/disableUserList.htm', '2018-08-04 09:54:25', 3, '', 99, NULL),
(9, '财务报表', '/menu/jumpFinancialDetails.htm', '2018-08-04 09:54:55', 4, '', 99, NULL),
(10, '充值记录', '/menu/jumpRechargeList.htm', '2018-08-04 09:55:16', 4, '', 99, NULL),
(11, '消费记录', '/menu/jumpConsumeList.htm', '2018-08-04 09:57:00', 4, '', 99, NULL),
(12, '提现记录', '/menu/jumpPutForwardList.htm', '2018-08-04 09:57:26', 4, '', 99, NULL),
(13, '礼物管理', '/menu/jumpGiftList.htm', '2018-08-04 09:58:29', 0, '<i class="iconfont icon-liwu"></i>', 99, NULL),
(14, '封面审核', '/menu/jumpCoverList.htm', '2018-08-04 09:58:41', 3, '<i class="glyphicon glyphicon-picture nav-icon"></i>', 99, NULL),
(15, '广告管理', '#', '2018-08-04 09:58:53', 0, '<i class="iconfont icon-guanggaoguanli"></i>', 99, NULL),
(16, '相册审核', '/menu/jumpPrivatePhotoList.htm', '2018-08-04 09:59:11', 3, '<i class="glyphicon glyphicon-fire nav-icon"></i>', 99, NULL),
(17, '实名认证', '/menu/jumpidCardList.htm', '2018-08-04 09:59:28', 3, '<i class="fa fa-bar-chart nav-icon"></i>', 99, NULL),
(18, '意见反馈', '/menu/jumpFeedbackList.htm', '2018-08-04 09:59:41', 0, '<i class="glyphicon glyphicon-paperclip nav-icon"></i>', 99, NULL),
(19, '举报列表', '/menu/jumpReportList.htm', '2018-08-04 09:59:54', 0, '<i class="fa fa-exclamation-triangle"></i>', 99, NULL),
(20, 'VIP套餐', '/menu/jumpVipSetMealList.htm', '2018-08-04 10:00:09', 0, '<i class="glyphicon glyphicon-piggy-bank nav-icon"></i>', 99, NULL),
(21, '充值与提现设置', '/menu/jumpCashValueSetMealList.htm', '2018-08-04 10:00:27', 0, '<i class="glyphicon glyphicon-btc nav-icon"></i>', 99, NULL),
(22, '三方设置', '#', '2018-08-04 10:00:51', 0, '<i class="glyphicon glyphicon-wrench nav-icon" aria-hidden="true"></i>', 99, '<i class="more iconfont icon-more"></i>'),
(23, '短信配置', '/admin/jumpSmsList.htm', '2018-08-04 10:01:09', 22, '', 99, NULL),
(24, '登陆配置', '/admin/loginSetUp.htm', '2018-08-04 10:01:23', 22, '', 99, NULL),
(25, '对象存储配置', '/admin/jumpOssList.htm', '2018-08-04 10:01:45', 22, '', 99, NULL),
(26, '推广设置', '/menu/jumpSpreadSetUp.htm', '2018-08-04 10:02:24', 32, '', 99, NULL),
(27, '角色列表', '/menu/jumpRoleList.htm', '2018-08-04 10:02:44', 2, '', 99, NULL),
(28, '账号列表', '/menu/jumpAdminList.htm', '2018-08-04 10:03:08', 2, '', 99, NULL),
(29, '菜单列表', '/menu/jumpMenuList.htm', '2018-08-04 10:03:23', 2, '', 99, NULL),
(30, '封号设置', '/menu/jumpBannedList.htm', '2018-08-08 17:33:14', 2, '', 99, NULL),
(31, 'APP版本控制', '/menu/jumpVersion.htm', '2018-08-24 16:03:34', 2, '', 99, NULL),
(32, '活动推广', '#', '2018-09-04 13:55:17', 0, '<i class="glyphicon glyphicon-folder-close nav-icon"></i>', 99, '<i class="more iconfont icon-more"></i>'),
(33, '活动项目', '/menu/jumpActivityList.htm', '2018-09-04 13:55:59', 32, '', 99, NULL),
(34, '中奖明细', '/menu/jumpRewardDetail.htm', '2018-09-04 13:56:22', 32, '', 99, NULL),
(35, '公会管理', '/menu/jumpGuildList.htm', '2018-09-12 13:55:25', 0, '<i class="glyphicon glyphicon-th nav-icon"></i>', 99, NULL),
(36, '注册红包', '/menu/jumpRegisterRedBag.htm', '2018-09-12 16:33:39', 32, '', 99, NULL),
(37, '系统推送', '/menu/jumpPushMsgList.htm', '2018-09-13 09:17:29', 0, '<i class="glyphicon glyphicon-repeat nav-icon" aria-hidden="true"></i>', 99, NULL),
(38, 'CPS联盟管理', '#', '2018-09-14 15:17:25', 0, '<i class="glyphicon glyphicon-globe nav-icon" aria-hidden="true"></i>', 99, ''),
(39, '排行榜设置', '/menu/jumpRankingList.htm', '2018-09-27 14:15:14', 2, '', 99, NULL),
(41, 'APP风格切换', '/menu/jumpStyleSetUp.htm', '2018-10-10 14:31:10', 2, '', 99, NULL),
(42, '推广奖励', '/menu/jumpSpreadAward.htm', '2018-10-19 09:03:52', 32, '', 99, NULL),
(43, 'IM消息', '/menu/jumpImLogList.htm', '2018-10-20 09:37:59', 75, '', 99, NULL),
(45, '排行榜', '#', '2018-11-02 10:51:47', 0, '<i class="glyphicon glyphicon-flag nav-icon" aria-hidden="true"></i>', 99, '<i class="more iconfont icon-more"></i>'),
(46, '推广用户排行榜', '/menu/jumpSpreadUserList.htm', '2018-11-02 10:58:34', 45, '', 99, NULL),
(47, '在线时长排行榜', '/menu/jumpOnLineTime.htm', '2018-11-02 10:59:09', 45, '', 99, NULL),
(48, '用户分布', '/menu/jumpMap.htm', '2018-11-16 09:54:24', 3, '', 99, NULL),
(50, '个人中心', '/menu/jumpAddSpread.htm', '2018-11-26 16:46:53', 49, '', 99, NULL),
(51, '代理列表', '/menu/jumpSpread.htm', '2018-11-26 16:47:07', 49, '', 99, NULL),
(53, '系统设置', '/menu/jumpSystemSetUp.htm', '2018-12-07 13:41:10', 2, '', 99, NULL),
(54, '模拟消息', '/menu/jumpSimulationList.htm', '2018-12-07 15:58:10', 2, '', 99, NULL),
(55, '消费排行榜', '/menu/jumpConsumeNoticeList.htm', '2018-12-13 10:57:53', 45, '', 99, NULL),
(56, '提现排行榜', '/menu/jumpExtractMoney.htm', '2018-12-13 10:58:12', 45, '', 99, NULL),
(57, '动态列表', '/menu/jumpDynamicList.htm', '2018-12-18 09:29:56', 3, '', 99, NULL),
(58, '评论列表', '/menu/jumpCommentList.htm', '2019-01-03 10:56:56', 3, '', 99, NULL),
(59, '充值排行榜', '/menu/jumpBankRankingList.htm', '2019-01-04 13:48:38', 45, '', 99, NULL),
(60, '余额排行榜', '/menu/jumpBalanList.htm', '2019-01-04 13:49:06', 45, '', 99, NULL),
(61, '速配时长', '/menu/jumpSpeedDatingList.htm', '2019-02-15 10:32:20', 3, '', 99, NULL),
(63, '速配管理', '/menu/jumpSpredManageList.htm', '2019-03-01 09:29:30', 3, '', 99, NULL),
(64, '帮助中心', '/menu/jumpHelpCenter.htm', '2019-03-01 15:58:32', 2, '', 99, NULL),
(65, '域名池', '/menu/jumpDomainList.htm', '2019-03-02 09:45:47', 2, '', 99, NULL),
(66, '宣传海报', '/menu/jumpSpreadImgList.htm', '2019-03-02 09:48:00', 2, '', 99, NULL),
(67, '我的收益', '/menu/jumpMyProfit.htm', '2019-03-02 15:19:09', 49, '', 99, NULL),
(68, '后台充值', '/menu/jumpGiveList.htm', '2019-03-05 14:12:10', 4, '', 99, NULL),
(70, '支付宝设置', '/menu/jumpAlipaySetUp.htm', '2019-03-25 19:11:53', 73, '', 152, NULL),
(71, '微信支付设置', '/menu/jumpWeiXinPaySetUp.htm', '2019-03-25 19:12:07', 73, '', 153, NULL),
(72, '大房间管理', '/menu/jumpBigRoomMan.htm', '2019-05-08 23:16:08', 3, '', 99, NULL),
(73, '支付配置管理', '#', '2019-07-16 10:14:45', 0, '<i class="glyphicon glyphicon-wrench nav-icon" aria-hidden="true"></i>', 15, '<i class="more iconfont icon-more"></i>'),
(74, '支付配置列表', '/menu/jumpPayDeployList.htm', '2019-07-16 10:15:21', 73, '', 151, NULL),
(75, 'IM管理', '#', '2019-09-17 10:39:08', 0, '<i class="glyphicon glyphicon-envelope nav-icon" aria-hidden="true"></i>', 5, '<i class="more iconfont icon-more"></i>'),
(76, 'IM过滤', '/menu/jumpImFilter.htm', '2019-09-17 10:40:18', 75, '', 51, NULL),
(77, 'Banner广告管理', '/menu/jumpBanner.htm', '2018-08-04 09:58:53', 15, '', 99, NULL),
(78, '动态广告管理', '/menu/jumpAdBanner.htm', '2018-08-04 09:58:53', 15, '', 99, NULL),
(79, '公告管理', '/menu/jumpChannelBulletinList.htm', '2019-10-16 11:28:06', 38, '', 991, ''),
(80, '落地页管理', '/menu/jumpFlooringPage.htm', '2019-10-16 11:28:23', 38, '', 992, ''),
(81, '一级渠道列表', '/menu/jumpChannelList.htm', '2019-10-16 11:28:35', 38, '', 993, ''),
(82, '二级代理汇总', '/menu/jumpChannelTwoList.htm', '2019-10-16 11:28:43', 38, '', 995, ''),
(83, '一级渠道数据', '/menu/jumpChannelDataList.htm', '2019-10-16 11:38:15', 38, '', 994, ''),
(85, '渠道素材', '/menu/jumpChannelMaterial.htm', '2019-10-21 09:45:15', 38, '', 996, ''),
(87, 'APP基础包', '/menu/jumpChannelPacList.htm', '2018-08-04 10:03:23', 2, '', 99, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `t_message`
--

CREATE TABLE IF NOT EXISTS `t_message` (
  `t_id` int(11) NOT NULL,
  `t_user_id` int(11) DEFAULT NULL,
  `t_message_content` varchar(255) DEFAULT NULL,
  `t_create_time` datetime DEFAULT NULL,
  `t_is_see` int(11) DEFAULT NULL COMMENT '0.未查看\r\n1.以查看'
) ENGINE=InnoDB AUTO_INCREMENT=296 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_message`
--

INSERT INTO `t_message` (`t_id`, `t_user_id`, `t_message_content`, `t_create_time`, `t_is_see`) VALUES
(1, 2, '', '2020-04-24 00:13:28', 1),
(2, 2, '聊友:10001邀请您进行视频聊天!', '2020-04-24 00:42:20', 1),
(3, 3, '聊友:10001邀请您进行语音聊天!', '2020-04-24 00:42:57', 1),
(4, 3, '聊友:10001邀请您进行语音聊天!', '2020-04-24 00:43:06', 1),
(5, 2, '视频已上传,正在审核中.', '2020-04-24 00:55:17', 1),
(6, 4, '视频已上传,正在审核中.', '2020-04-24 10:50:52', 0),
(7, 1, '聊友:10004邀请您进行视频聊天!', '2020-04-24 10:53:28', 1),
(8, 1, '恭喜您VIP开通成功!VIP到期时间为:2061-12-24 10:54:46', '2020-04-24 10:54:46', 1),
(9, 2, '聊友:10001邀请您进行语音聊天!', '2020-04-24 10:56:34', 1),
(10, 2, '聊友:10001邀请您进行视频聊天!', '2020-04-24 10:56:50', 1),
(11, 2, '聊友:10001邀请您进行视频聊天!', '2020-04-24 12:00:41', 1),
(12, 2, '聊友:10001邀请您进行视频聊天!', '2020-04-24 12:02:24', 1),
(13, 2, '聊友:10001邀请您进行视频聊天!', '2020-04-24 12:06:02', 1),
(14, 2, '聊友:10001邀请您进行视频聊天!', '2020-04-24 12:35:14', 1),
(15, 2, '聊友:10001邀请您进行视频聊天!', '2020-04-28 12:02:40', 1),
(16, 2, '聊友:10001邀请您进行视频聊天!', '2020-04-28 12:03:33', 1),
(17, 2, '聊友:10001邀请您进行视频聊天!', '2020-04-28 12:05:58', 1),
(18, 2, '聊友:10001邀请您进行视频聊天!', '2020-04-28 18:14:16', 1),
(19, 1, '恭喜!本次成功充值58个金币', '2020-04-28 19:45:59', 1),
(20, 2, '聊友:10001邀请您进行视频聊天!', '2020-04-28 22:55:27', 1),
(21, 2, '聊友:10001邀请您进行视频聊天!', '2020-04-28 23:07:25', 1),
(22, 2, '聊友:10001邀请您进行视频聊天!', '2020-04-28 23:10:32', 1),
(23, 2, '聊友:10001邀请您进行视频聊天!', '2020-04-28 23:11:53', 1),
(24, 2, '聊友:10001邀请您进行视频聊天!', '2020-04-28 23:15:57', 1),
(25, 1, '聊友:10003邀请您进行语音聊天!', '2020-04-30 17:13:51', 1),
(26, 9, '您申请的公会已审核.', '2020-04-30 18:55:51', 1),
(27, 9, '', '2020-04-30 19:15:13', 1),
(28, 9, '视频已上传,正在审核中.', '2020-04-30 19:16:11', 1),
(29, 9, '聊友:10001邀请您进行视频聊天!', '2020-04-30 19:24:09', 1),
(30, 1, '反馈已处理: 			12					     ', '2020-04-30 19:29:18', 1),
(31, 9, '聊友:10001邀请您进行语音聊天!', '2020-04-30 19:47:57', 1),
(32, 9, '聊友:10001邀请您进行语音聊天!', '2020-04-30 19:48:56', 1),
(33, 9, '聊友:10001邀请您进行语音聊天!', '2020-04-30 20:14:30', 1),
(34, 9, '聊友:10001邀请您进行语音聊天!', '2020-05-01 14:27:56', 1),
(35, 9, '聊友:10001邀请您进行语音聊天!', '2020-05-01 14:28:21', 1),
(36, 9, '聊友:10001邀请您进行视频聊天!', '2020-05-01 14:31:52', 1),
(37, 3, '聊友:10001邀请您进行视频聊天!', '2020-05-01 14:42:31', 1),
(38, 9, '聊友:10001邀请您进行语音聊天!', '2020-05-01 14:47:00', 1),
(39, 9, '视频已上传,正在审核中.', '2020-05-01 16:04:44', 1),
(40, 9, '聊友:10001邀请您进行视频聊天!', '2020-05-01 16:07:03', 1),
(41, 9, '您发布了新的动态!', '2020-05-01 16:08:47', 1),
(42, 9, '您发布了新的动态!', '2020-05-01 16:11:46', 1),
(43, 9, '聊友:10001邀请您进行视频聊天!', '2020-05-01 21:03:45', 1),
(44, 1, '聊友:10009邀请您进行视频聊天!', '2020-05-01 21:04:59', 1),
(45, 9, '聊友:10001邀请您进行语音聊天!', '2020-05-01 21:15:46', 1),
(46, 9, '聊友:10001邀请您进行语音聊天!', '2020-05-01 21:16:00', 1),
(47, 9, '聊友:10001邀请您进行视频聊天!', '2020-05-01 21:16:12', 1),
(48, 9, '聊友:10001邀请您进行视频聊天!', '2020-05-01 21:16:38', 1),
(49, 1, '聊友:10009邀请您进行视频聊天!', '2020-05-01 21:16:54', 1),
(50, 9, '聊友:10001邀请您进行视频聊天!', '2020-05-01 21:17:00', 1),
(51, 9, '聊友:10001邀请您进行视频聊天!', '2020-05-01 21:17:10', 1),
(52, 9, '聊友:10001邀请您进行语音聊天!', '2020-05-01 21:17:16', 1),
(53, 9, '聊友:10001邀请您进行视频聊天!', '2020-05-01 21:17:34', 1),
(54, 3, '聊友:10001邀请您进行视频聊天!', '2020-05-01 21:20:16', 1),
(55, 9, '聊友:10001邀请您进行语音聊天!', '2020-05-01 21:23:23', 1),
(56, 9, '聊友:10001邀请您进行语音聊天!', '2020-05-01 21:23:41', 1),
(57, 9, '聊友:10001邀请您进行视频聊天!', '2020-05-01 21:24:03', 1),
(58, 9, '聊友:10001邀请您进行语音聊天!', '2020-05-01 22:19:00', 1),
(59, 2, '聊友:10001邀请您进行视频聊天!', '2020-05-01 23:04:17', 1),
(60, 1, '', '2020-05-02 12:24:32', 1),
(61, 2, '', '2020-05-02 12:24:32', 1),
(62, 3, '', '2020-05-02 12:24:32', 1),
(63, 4, '', '2020-05-02 12:24:32', 0),
(64, 5, '', '2020-05-02 12:24:32', 1),
(65, 6, '', '2020-05-02 12:24:32', 1),
(66, 7, '', '2020-05-02 12:24:32', 1),
(67, 8, '', '2020-05-02 12:24:32', 0),
(68, 9, '', '2020-05-02 12:24:32', 1),
(69, 10, '', '2020-05-02 12:24:32', 0),
(70, 11, '', '2020-05-02 12:24:32', 1),
(71, 12, '', '2020-05-02 12:24:32', 1),
(72, 13, '', '2020-05-02 12:24:32', 0),
(73, 14, '视频已上传,正在审核中.', '2020-05-02 18:23:00', 1),
(74, 14, '聊友:10001邀请您进行视频聊天!', '2020-05-02 18:29:39', 1),
(75, 3, '您发布了新的动态!', '2020-05-03 02:55:04', 1),
(76, 1, '1111111111111111111', '2020-05-03 15:10:09', 1),
(77, 2, '1111111111111111111', '2020-05-03 15:10:09', 1),
(78, 3, '1111111111111111111', '2020-05-03 15:10:09', 1),
(79, 4, '1111111111111111111', '2020-05-03 15:10:09', 0),
(80, 5, '1111111111111111111', '2020-05-03 15:10:09', 1),
(81, 6, '1111111111111111111', '2020-05-03 15:10:09', 1),
(82, 7, '1111111111111111111', '2020-05-03 15:10:09', 1),
(83, 9, '1111111111111111111', '2020-05-03 15:10:09', 1),
(84, 10, '1111111111111111111', '2020-05-03 15:10:09', 0),
(85, 11, '1111111111111111111', '2020-05-03 15:10:09', 1),
(86, 12, '1111111111111111111', '2020-05-03 15:10:09', 1),
(87, 13, '1111111111111111111', '2020-05-03 15:10:09', 0),
(88, 14, '1111111111111111111', '2020-05-03 15:10:09', 0),
(89, 9, '您发布了新的动态!', '2020-05-03 16:56:35', 1),
(90, 9, '您发布了新的动态!', '2020-05-03 16:57:50', 1),
(91, 9, '您发布了新的动态!', '2020-05-03 17:00:29', 1),
(92, 9, '', '2020-05-03 17:25:38', 1),
(93, 3, '您发布了新的动态!', '2020-05-03 17:36:33', 1),
(94, 3, '您发布了新的动态!', '2020-05-03 17:45:25', 1),
(95, 2, '您发布了新的动态!', '2020-05-03 17:46:17', 1),
(96, 1, '视频已上传,正在审核中.', '2020-05-03 21:34:02', 1),
(97, 9, '聊友:10001邀请您进行视频聊天!', '2020-05-03 21:37:14', 1),
(98, 1, '聊友:10009邀请您进行视频聊天!', '2020-05-03 21:38:13', 1),
(99, 1, '聊友:10009邀请您进行视频聊天!', '2020-05-03 21:42:38', 1),
(100, 2, '', '2020-05-03 21:57:45', 1),
(101, 9, '', '2020-05-04 10:27:46', 1),
(102, 9, '恭喜!本次成功充值58个金币', '2020-05-04 10:29:23', 1),
(103, 9, '恭喜!本次成功充值58个金币', '2020-05-04 10:50:59', 1),
(104, 7, '恭喜!本次成功充值58个金币', '2020-05-04 12:52:49', 1),
(105, 7, '聊友:10009邀请您进行视频聊天!', '2020-05-04 13:03:57', 1),
(106, 7, '聊友:10002邀请您进行视频聊天!', '2020-05-04 13:10:56', 1),
(107, 2, '聊友:10001邀请您进行视频聊天!', '2020-05-04 13:12:19', 0),
(108, 2, '聊友:10007邀请您进行视频聊天!', '2020-05-04 13:13:19', 0),
(109, 16, '视频已上传,正在审核中.', '2020-05-04 13:40:19', 1),
(110, 16, '聊友:10007邀请您进行视频聊天!', '2020-05-04 13:45:10', 1),
(111, 7, '聊友:10009邀请您进行视频聊天!', '2020-05-04 14:01:38', 1),
(112, 7, '聊友:10009邀请您进行视频聊天!', '2020-05-04 14:02:26', 1),
(113, 7, '聊友:10009邀请您进行视频聊天!', '2020-05-04 14:02:36', 1),
(114, 1, '聊友:10009邀请您进行视频聊天!', '2020-05-04 14:02:52', 1),
(115, 1, '聊友:10009邀请您进行视频聊天!', '2020-05-04 14:05:04', 1),
(116, 16, '您发布了新的动态!', '2020-05-04 14:08:17', 1),
(117, 16, '聊友:10001邀请您进行视频聊天!', '2020-05-04 14:12:32', 1),
(118, 16, '聊友:10001邀请您进行视频聊天!', '2020-05-04 14:15:32', 1),
(119, 1, '聊友:10016邀请您进行视频聊天!', '2020-05-04 14:15:43', 1),
(120, 1, '聊友:10009邀请您进行视频聊天!', '2020-05-04 14:15:56', 1),
(121, 1, '聊友:10009邀请您进行视频聊天!', '2020-05-04 14:16:11', 1),
(122, 9, '聊友:10001邀请您进行视频聊天!', '2020-05-04 14:16:28', 1),
(123, 1, '聊友:10016邀请您进行视频聊天!', '2020-05-04 14:16:40', 1),
(124, 1, '聊友:10009邀请您进行视频聊天!', '2020-05-04 14:22:18', 1),
(125, 16, '聊友:10001邀请您进行视频聊天!', '2020-05-04 14:22:36', 1),
(126, 16, '小哥哥', '2020-05-04 14:33:16', 1),
(127, 1, '4444', '2020-05-04 15:01:56', 1),
(128, 2, '4444', '2020-05-04 15:01:56', 0),
(129, 3, '4444', '2020-05-04 15:01:56', 1),
(130, 4, '4444', '2020-05-04 15:01:56', 0),
(131, 5, '4444', '2020-05-04 15:01:56', 0),
(132, 6, '4444', '2020-05-04 15:01:57', 1),
(133, 7, '4444', '2020-05-04 15:01:57', 1),
(134, 9, '4444', '2020-05-04 15:01:57', 1),
(135, 10, '4444', '2020-05-04 15:01:57', 0),
(136, 11, '4444', '2020-05-04 15:01:57', 1),
(137, 12, '4444', '2020-05-04 15:01:57', 1),
(138, 13, '4444', '2020-05-04 15:01:57', 0),
(139, 14, '4444', '2020-05-04 15:01:57', 0),
(140, 15, '4444', '2020-05-04 15:01:57', 0),
(141, 16, '4444', '2020-05-04 15:01:57', 1),
(142, 1, '555', '2020-05-04 15:02:31', 1),
(143, 5, '555', '2020-05-04 15:02:31', 0),
(144, 6, '555', '2020-05-04 15:02:31', 1),
(145, 7, '555', '2020-05-04 15:02:31', 1),
(146, 10, '555', '2020-05-04 15:02:31', 0),
(147, 11, '555', '2020-05-04 15:02:32', 1),
(148, 12, '555', '2020-05-04 15:02:32', 1),
(149, 13, '555', '2020-05-04 15:02:32', 0),
(150, 15, '555', '2020-05-04 15:02:32', 0),
(151, 2, '555', '2020-05-04 15:02:54', 0),
(152, 3, '555', '2020-05-04 15:02:54', 1),
(153, 4, '555', '2020-05-04 15:02:54', 0),
(154, 9, '555', '2020-05-04 15:02:54', 1),
(155, 14, '555', '2020-05-04 15:02:54', 0),
(156, 16, '555', '2020-05-04 15:02:54', 1),
(157, 21, '哥哥\n', '2020-05-08 16:21:23', 1),
(158, 14, '聊友:10011邀请您进行语音聊天!', '2020-05-08 20:19:44', 0),
(159, 2, '聊友:10001邀请您进行语音聊天!', '2020-05-08 20:20:23', 0),
(160, 9, '聊友:10001邀请您进行视频聊天!', '2020-05-08 20:24:09', 1),
(161, 19, '聊友:10009邀请您进行视频聊天!', '2020-05-08 20:26:07', 0),
(162, 19, '聊友:10009邀请您进行视频聊天!', '2020-05-08 20:26:19', 0),
(163, 9, '聊友:10001邀请您进行视频聊天!', '2020-05-08 20:27:02', 1),
(164, 1, '聊友:10009邀请您进行视频聊天!', '2020-05-08 20:27:15', 1),
(165, 9, '聊友:10001邀请您进行视频聊天!', '2020-05-08 20:28:04', 1),
(166, 1, '聊友:10009邀请您进行视频聊天!', '2020-05-08 20:28:17', 1),
(167, 6, '聊友:10009邀请您进行视频聊天!', '2020-05-08 20:29:41', 0),
(168, 6, '聊友:10009邀请您进行视频聊天!', '2020-05-08 20:29:49', 0),
(169, 6, '聊友:10009邀请您进行视频聊天!', '2020-05-08 20:29:56', 0),
(170, 6, '聊友:10009邀请您进行视频聊天!', '2020-05-08 20:30:50', 0),
(171, 9, '聊友:10001邀请您进行视频聊天!', '2020-05-08 20:31:00', 1),
(172, 9, '聊友:10001邀请您进行视频聊天!', '2020-05-08 20:31:19', 1),
(173, 9, '聊友:10001邀请您进行视频聊天!', '2020-05-08 20:32:04', 1),
(174, 9, '聊友:10001邀请您进行视频聊天!', '2020-05-08 20:32:26', 1),
(175, 1, '聊友:10009邀请您进行视频聊天!', '2020-05-08 20:35:08', 1),
(176, 1, '聊友:10009邀请您进行视频聊天!', '2020-05-08 20:35:36', 1),
(177, 9, '聊友:10001邀请您进行视频聊天!', '2020-05-08 20:36:06', 1),
(178, 1, '聊友:10009邀请您进行视频聊天!', '2020-05-08 20:36:16', 1),
(179, 9, '聊友:10001邀请您进行视频聊天!', '2020-05-08 20:38:00', 1),
(180, 9, '聊友:10001邀请您进行视频聊天!', '2020-05-08 20:38:20', 1),
(181, 9, '聊友:10001邀请您进行视频聊天!', '2020-05-08 20:38:32', 1),
(182, 1, '聊友:10009邀请您进行视频聊天!', '2020-05-08 20:38:40', 1),
(183, 1, '聊友:10009邀请您进行视频聊天!', '2020-05-08 20:39:03', 1),
(184, 1, '聊友:10009邀请您进行视频聊天!', '2020-05-08 20:39:59', 1),
(185, 1, '聊友:10009邀请您进行语音聊天!', '2020-05-08 20:40:30', 1),
(186, 1, '聊友:10009邀请您进行视频聊天!', '2020-05-08 20:41:30', 1),
(187, 1, '聊友:10009邀请您进行语音聊天!', '2020-05-08 20:42:58', 1),
(188, 9, '聊友:10001邀请您进行视频聊天!', '2020-05-08 20:43:10', 1),
(189, 9, '聊友:10001邀请您进行视频聊天!', '2020-05-08 20:43:21', 1),
(190, 9, '聊友:10001邀请您进行语音聊天!', '2020-05-08 20:44:08', 1),
(191, 14, '聊友:10012邀请您进行视频聊天!', '2020-05-08 20:59:05', 0),
(192, 9, '聊友:10001邀请您进行视频聊天!', '2020-05-08 21:20:33', 1),
(193, 9, '聊友:10001邀请您进行视频聊天!', '2020-05-08 21:26:09', 1),
(194, 9, '聊友:10001邀请您进行视频聊天!', '2020-05-08 21:26:50', 1),
(195, 9, '聊友:10001邀请您进行视频聊天!', '2020-05-08 21:27:03', 1),
(196, 1, '聊友:10009邀请您进行视频聊天!', '2020-05-08 21:27:15', 1),
(197, 9, '聊友:10001邀请您进行视频聊天!', '2020-05-08 21:27:22', 1),
(198, 9, '聊友:10001邀请您进行视频聊天!', '2020-05-08 22:10:44', 1),
(199, 4, '聊友:10001邀请您进行语音聊天!', '2020-05-09 11:03:36', 0),
(200, 24, '视频已上传,正在审核中.', '2020-05-09 13:42:17', 1),
(201, 9, '聊友:10001邀请您进行视频聊天!', '2020-05-09 13:49:40', 0),
(202, 9, '聊友:10001邀请您进行视频聊天!', '2020-05-09 13:49:50', 0),
(203, 1, '聊友:10009邀请您进行视频聊天!', '2020-05-09 13:50:02', 1),
(204, 9, '聊友:10001邀请您进行视频聊天!', '2020-05-09 13:52:09', 0),
(205, 29, '视频已上传,正在审核中.', '2020-05-09 19:55:14', 1),
(206, 31, '视频已上传,正在审核中.', '2020-05-09 20:04:52', 1),
(207, 29, '您发布了新的动态!', '2020-05-09 20:16:17', 1),
(208, 28, '恭喜!本次成功充值300个金币', '2020-05-09 20:17:45', 1),
(209, 29, '聊友:10028邀请您进行视频聊天!', '2020-05-09 20:19:10', 1),
(210, 29, '聊友:10028邀请您进行视频聊天!', '2020-05-09 20:22:15', 1),
(211, 31, '聊友:10028邀请您进行视频聊天!', '2020-05-09 20:23:47', 1),
(212, 28, '聊友:10031邀请您进行视频聊天!', '2020-05-09 20:25:10', 1),
(213, 28, '聊友:10031邀请您进行视频聊天!', '2020-05-09 20:25:24', 1),
(214, 29, '聊友:10032邀请您进行视频聊天!', '2020-05-10 01:26:46', 1),
(215, 29, '聊友:10028邀请您进行语音聊天!', '2020-05-10 07:02:23', 1),
(216, 29, '聊友:10028邀请您进行视频聊天!', '2020-05-10 08:54:09', 1),
(217, 29, '聊友:10028邀请您进行视频聊天!', '2020-05-10 08:54:46', 1),
(218, 28, '聊友:10029邀请您进行视频聊天!', '2020-05-10 10:41:24', 1),
(219, 31, '111', '2020-05-10 10:46:42', 1),
(220, 31, '聊友:10028邀请您进行视频聊天!', '2020-05-10 11:45:51', 1),
(221, 31, '聊友:10028邀请您进行视频聊天!', '2020-05-10 11:46:52', 1),
(222, 31, '聊友:10028邀请您进行视频聊天!', '2020-05-10 15:14:34', 1),
(223, 28, '聊友:10031邀请您进行视频聊天!', '2020-05-10 15:15:18', 1),
(224, 31, '聊友:10028邀请您进行视频聊天!', '2020-05-10 20:40:27', 1),
(225, 28, '邀请您进行视频聊天!', '2020-05-11 01:13:59', 1),
(226, 39, '聊友:10037邀请您进行视频聊天!', '2020-05-11 13:10:43', 1),
(227, 39, '聊友:10037邀请您进行视频聊天!', '2020-05-11 13:11:34', 1),
(228, 39, '聊友:10037邀请您进行视频聊天!', '2020-05-11 13:12:26', 1),
(229, 31, '聊友:10035邀请您进行视频聊天!', '2020-05-11 13:19:52', 1),
(230, 31, '聊友:10028邀请您进行语音聊天!', '2020-05-11 13:29:07', 1),
(231, 31, '聊友:10030邀请您进行视频聊天!', '2020-05-11 13:30:24', 1),
(232, 31, '聊友:10028邀请您进行视频聊天!', '2020-05-11 13:32:00', 1),
(233, 35, '十三邀请您进行视频聊天!', '2020-05-11 13:47:33', 1),
(234, 39, '聊友:10035邀请您进行视频聊天!', '2020-05-11 13:47:55', 1),
(235, 39, '聊友:10030邀请您进行语音聊天!', '2020-05-11 13:48:12', 1),
(236, 39, '聊友:10030邀请您进行语音聊天!', '2020-05-11 13:48:16', 1),
(237, 39, '聊友:10030邀请您进行语音聊天!', '2020-05-11 13:54:53', 1),
(238, 39, '聊友:10030邀请您进行视频聊天!', '2020-05-11 13:55:03', 1),
(239, 39, '聊友:10035邀请您进行视频聊天!', '2020-05-11 13:55:34', 1),
(240, 39, '聊友:10035邀请您进行视频聊天!', '2020-05-11 13:56:11', 1),
(241, 39, '聊友:10035邀请您进行视频聊天!', '2020-05-11 13:56:36', 1),
(242, 39, '聊友:10035邀请您进行视频聊天!', '2020-05-11 13:57:48', 1),
(243, 39, '聊友:10035邀请您进行视频聊天!', '2020-05-11 13:58:15', 1),
(244, 39, '聊友:10035邀请您进行视频聊天!', '2020-05-11 14:02:09', 1),
(245, 39, '聊友:10035邀请您进行视频聊天!', '2020-05-11 14:04:18', 1),
(246, 31, '聊友:10028邀请您进行视频聊天!', '2020-05-11 14:04:18', 1),
(247, 39, '聊友:10035邀请您进行视频聊天!', '2020-05-11 14:04:56', 1),
(248, 31, '聊友:10028邀请您进行视频聊天!', '2020-05-11 14:05:10', 1),
(249, 31, '聊友:10028邀请您进行视频聊天!', '2020-05-11 14:05:33', 1),
(250, 39, '聊友:10028邀请您进行视频聊天!', '2020-05-11 14:07:17', 1),
(251, 31, '聊友:10028邀请您进行视频聊天!', '2020-05-11 14:07:29', 1),
(252, 29, '聊友:10035邀请您进行视频聊天!', '2020-05-11 15:02:40', 1),
(253, 30, '聊友:10056邀请您进行视频聊天!', '2020-05-12 11:09:09', 1),
(254, 56, '恶意拉人', '2020-05-12 14:39:07', 1),
(255, 30, '恭喜!本次成功充值500个金币', '2020-05-12 15:52:29', 1),
(256, 53, '聊友:10030邀请您进行视频聊天!', '2020-05-12 15:52:55', 1),
(257, 53, '聊友:10030邀请您进行视频聊天!', '2020-05-12 15:58:13', 1),
(258, 53, '聊友:10030邀请您进行视频聊天!', '2020-05-12 16:05:14', 1),
(259, 62, '拉客源永久享受百分之5的长期收益，每次直播提成提高百分之80。没有客源的依旧百分之70提成详情可咨询  xiaosaobi700', '2020-05-13 15:02:47', 1),
(260, 62, '聊友:10067邀请您进行视频聊天!', '2020-05-13 16:18:37', 1),
(261, 53, '聊友:10035邀请您进行视频聊天!', '2020-05-13 16:48:26', 1),
(262, 56, '聊友:10035邀请您进行语音聊天!', '2020-05-13 17:32:38', 0),
(263, 31, '聊友:10066邀请您进行视频聊天!', '2020-05-13 19:54:18', 1),
(264, 53, '聊友:10066邀请您进行视频聊天!', '2020-05-13 19:55:53', 1),
(265, 53, '聊友:10066邀请您进行视频聊天!', '2020-05-13 20:10:34', 1),
(266, 53, '', '2020-05-13 20:29:21', 1),
(267, 69, '请及时完成主播认证\n', '2020-05-14 22:56:36', 0),
(268, 76, '上传封面才能认证完成', '2020-05-15 20:19:29', 1),
(269, 62, '聊友:10035邀请您进行视频聊天!', '2020-05-15 20:30:58', 1),
(270, 76, '聊友:10035邀请您进行视频聊天!', '2020-05-15 20:54:15', 1),
(271, 76, '聊友:10035邀请您进行视频聊天!', '2020-05-15 20:54:44', 1),
(272, 76, '完成认证后请及时添加客服微信xiaosaobi700', '2020-05-15 21:05:37', 1),
(273, 35, '聊友:10076邀请您进行视频聊天!', '2020-05-15 21:49:39', 1),
(274, 30, '聊友:10076邀请您进行视频聊天!', '2020-05-15 21:49:55', 1),
(275, 52, '聊友:10028邀请您进行视频聊天!', '2020-06-09 18:53:52', 0),
(276, 89, '聊友:10087邀请您进行视频聊天!', '2020-06-13 16:30:11', 1),
(277, 89, '聊友:10087邀请您进行视频聊天!', '2020-06-13 16:31:21', 1),
(278, 89, '聊友:10087邀请您进行视频聊天!', '2020-06-13 16:32:01', 1),
(279, 91, '快快快', '2020-06-14 16:18:01', 1),
(280, 31, '聊友:10087邀请您进行视频聊天!', '2020-06-15 17:56:44', 0),
(281, 89, '视频已上传,正在审核中.', '2020-06-19 22:06:38', 1),
(282, 89, '恭喜!本次成功充值58个金币', '2020-06-19 23:23:21', 1),
(283, 87, '恭喜!本次成功充值58个金币', '2020-06-19 23:26:35', 1),
(284, 94, '恭喜!本次成功充值58个金币', '2020-06-19 23:26:42', 1),
(285, 87, '恭喜!本次成功充值58个金币', '2020-06-19 23:28:02', 1),
(286, 89, '恭喜!本次成功充值58个金币', '2020-06-19 23:29:17', 1),
(287, 28, '恭喜!本次成功充值58个金币', '2020-06-20 00:08:05', 0),
(288, 87, '恭喜!本次成功充值58个金币', '2020-06-20 01:26:50', 1),
(289, 89, '恭喜!本次成功充值58个金币', '2020-06-20 01:29:42', 1),
(290, 89, '恭喜!本次成功充值58个金币', '2020-06-20 01:30:12', 1),
(291, 96, '恭喜您VIP开通成功!VIP到期时间为:2103-10-21 00:13:34', '2020-06-21 00:13:34', 1),
(292, 96, '恭喜!本次成功充值58个金币', '2020-06-21 00:14:58', 1),
(293, 96, '视频已上传,正在审核中.', '2020-06-21 23:46:56', 1),
(294, 95, '视频已上传,正在审核中.', '2020-06-21 23:59:47', 1),
(295, 97, 'nih', '2020-06-22 00:16:06', 1);

-- --------------------------------------------------------

--
-- 表的结构 `t_object_storage`
--

CREATE TABLE IF NOT EXISTS `t_object_storage` (
  `t_id` int(11) NOT NULL,
  `t_app_id` varchar(100) DEFAULT NULL,
  `t_secret_id` varchar(100) DEFAULT NULL,
  `t_secret_key` varchar(255) DEFAULT NULL,
  `t_bucket` varchar(100) DEFAULT NULL,
  `t_region` varchar(100) DEFAULT NULL,
  `t_img_url` varchar(255) DEFAULT NULL,
  `t_state` int(11) DEFAULT NULL COMMENT '0.正常1.禁用',
  `t_type` int(11) DEFAULT NULL COMMENT '0.腾讯云1.阿里云2.网易云'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_object_storage`
--

INSERT INTO `t_object_storage` (`t_id`, `t_app_id`, `t_secret_id`, `t_secret_key`, `t_bucket`, `t_region`, `t_img_url`, `t_state`, `t_type`) VALUES
(1, '1251436363', 'AKIDEDBbmBtVR6Vd1A9t64lLgbHgpiMvYUt2', '4rOghRvpmUcT6TZOxHL8hX8SWK98rKNB', 'qism-1251436363', 'ap-guangzhou', 'https://qism-1251436363.cos.ap-guangzhou.myqcloud.com', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `t_order`
--

CREATE TABLE IF NOT EXISTS `t_order` (
  `t_id` int(11) NOT NULL,
  `t_consume` int(11) DEFAULT NULL,
  `t_cover_consume` int(11) DEFAULT NULL,
  `t_consume_type` int(11) DEFAULT NULL COMMENT '0.充值\r\n1.聊天\r\n2.视频\r\n3.私密照片\r\n4.私密视频\r\n5.查看手机\r\n6.查看微信\r\n7.红包\r\n8.VIP\r\n9.礼物\r\n10.提现\r\n11.推荐分成 \r\n12.提现失败返回\r\n13.注册赠送\r\n14.公会收入',
  `t_consume_score` int(11) DEFAULT NULL COMMENT '消费来源ID(视频聊天和文字聊天为0)',
  `t_amount` decimal(10,2) DEFAULT NULL,
  `t_room_id` int(11) DEFAULT NULL,
  `t_create_time` datetime DEFAULT NULL,
  `t_log_time` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_order`
--

INSERT INTO `t_order` (`t_id`, `t_consume`, `t_cover_consume`, `t_consume_type`, `t_consume_score`, `t_amount`, `t_room_id`, `t_create_time`, `t_log_time`) VALUES
(1, 1, 3, 1, 0, '2.00', NULL, '2020-04-24 00:44:03', NULL),
(2, 1, 2, 18, 0, '10.00', 2, '2020-04-24 10:56:47', 1),
(3, 1, 2, 2, 0, '20.00', 2, '2020-04-24 10:57:19', 1),
(4, 1, 2, 2, 0, '20.00', 2, '2020-04-24 12:07:06', 1),
(5, 1, 2, 2, 0, '20.00', 2, '2020-04-24 12:36:21', 1),
(6, 1, 2, 2, 0, '40.00', 2, '2020-04-28 12:04:41', 2),
(7, 1, 2, 2, 0, '40.00', 2, '2020-04-28 12:07:51', 2),
(8, 1, 2, 2, 0, '20.00', 2, '2020-04-28 23:11:30', 1),
(9, 1, 2, 2, 0, '20.00', 2, '2020-04-28 23:16:38', 1),
(10, 6, 9, 1, 0, '2.00', NULL, '2020-04-30 19:13:39', NULL),
(11, 6, 9, 1, 0, '2.00', NULL, '2020-04-30 19:22:34', NULL),
(12, 1, 9, 2, 0, '20.00', 9, '2020-04-30 19:24:41', 1),
(13, 1, 9, 9, 10, '2.00', NULL, '2020-04-30 19:56:46', NULL),
(14, 1, 9, 9, 4, '6.00', NULL, '2020-04-30 19:56:58', NULL),
(15, 1, 9, 9, 11, '6.00', NULL, '2020-04-30 19:57:04', NULL),
(16, 1, 9, 18, 0, '10.00', 9, '2020-05-01 14:28:17', 1),
(17, 1, 9, 18, 0, '10.00', 9, '2020-05-01 14:28:32', 1),
(18, 1, 9, 2, 0, '20.00', 9, '2020-05-01 14:32:24', 1),
(19, 1, 9, 2, 0, '20.00', 9, '2020-05-01 21:04:20', 1),
(20, 9, 1, 9, 10, '2.00', NULL, '2020-05-01 21:08:43', NULL),
(21, 1, 9, 9, 8, '10.00', NULL, '2020-05-01 21:08:49', NULL),
(22, 1, 9, 9, 3, '40.00', NULL, '2020-05-01 21:08:53', NULL),
(23, 1, 9, 9, 6, '13.00', NULL, '2020-05-01 21:08:57', NULL),
(24, 1, 9, 2, 0, '100.00', 9, '2020-05-01 21:09:13', 5),
(25, 1, 9, 18, 0, '10.00', 9, '2020-05-01 21:17:29', 1),
(26, 9, 1, 9, 10, '2.00', NULL, '2020-05-01 21:18:31', NULL),
(27, 1, 9, 9, 10, '2.00', NULL, '2020-05-01 21:18:50', NULL),
(28, 1, 9, 2, 0, '60.00', 9, '2020-05-01 21:19:59', 3),
(29, 1, 3, 2, 0, '20.00', 3, '2020-05-01 21:20:41', 1),
(30, 1, 9, 18, 0, '10.00', 9, '2020-05-01 21:23:34', 1),
(31, 1, 9, 18, 0, '10.00', 9, '2020-05-01 21:23:57', 1),
(32, 1, 9, 2, 0, '20.00', 9, '2020-05-01 21:24:33', 1),
(33, 1, 14, 2, 0, '20.00', 14, '2020-05-02 18:30:45', 1),
(34, 11, 3, 1, 0, '2.00', NULL, '2020-05-02 23:08:51', NULL),
(35, 11, 3, 1, 0, '2.00', NULL, '2020-05-02 23:08:56', NULL),
(36, 0, 289, 11, 1, '10.00', NULL, '2020-05-03 16:26:15', NULL),
(37, 9, 1, 9, 10, '2.00', NULL, '2020-05-03 21:37:36', NULL),
(38, 9, 1, 9, 11, '6.00', NULL, '2020-05-03 21:37:44', NULL),
(39, 1, 9, 9, 11, '6.00', NULL, '2020-05-03 21:38:03', NULL),
(40, 1, 9, 2, 0, '40.00', 9, '2020-05-03 21:38:04', 1),
(41, 9, 1, 9, 3, '40.00', NULL, '2020-05-03 21:39:02', NULL),
(42, 1, 9, 2, 0, '80.00', 9, '2020-05-03 21:40:08', 2),
(43, 9, 1, 17, 1, '30.00', NULL, '2020-05-04 10:29:23', NULL),
(44, 1, 2, 2, 0, '20.00', 2, '2020-05-04 13:13:14', 1),
(45, 7, 2, 2, 0, '20.00', 2, '2020-05-04 13:13:34', 1),
(46, 7, 16, 2, 0, '40.00', 16, '2020-05-04 13:45:48', 1),
(47, 7, 16, 9, 10, '2.00', NULL, '2020-05-04 13:56:11', NULL),
(48, 7, 16, 9, 10, '2.00', NULL, '2020-05-04 13:56:22', NULL),
(49, 9, 7, 9, 10, '2.00', NULL, '2020-05-04 14:01:29', NULL),
(50, 9, 1, 9, 10, '2.00', NULL, '2020-05-04 14:03:06', NULL),
(51, 9, 1, 9, 11, '6.00', NULL, '2020-05-04 14:03:21', NULL),
(52, 1, 9, 9, 3, '40.00', NULL, '2020-05-04 14:03:48', NULL),
(53, 1, 9, 2, 0, '40.00', 9, '2020-05-04 14:03:51', 1),
(54, 9, 1, 9, 16, '131400.00', NULL, '2020-05-04 14:05:12', NULL),
(55, 9, 1, 9, 14, '3888.00', NULL, '2020-05-04 14:05:26', NULL),
(56, 9, 1, 9, 2, '4000.00', NULL, '2020-05-04 14:05:47', NULL),
(57, 1, 9, 2, 0, '40.00', 9, '2020-05-04 14:05:57', 1),
(58, 1, 16, 2, 0, '40.00', 16, '2020-05-04 14:23:00', 1),
(59, 7, 9, 4, 11, '10.00', NULL, '2020-05-07 11:58:50', NULL),
(60, 0, 289, 11, 1, '10.00', NULL, '2020-05-07 12:15:43', NULL),
(61, 0, 289, 11, 1, '10.00', NULL, '2020-05-07 22:27:37', NULL),
(62, 0, 289, 11, 1, '10.00', NULL, '2020-05-08 14:40:44', NULL),
(63, 11, 14, 1, 0, '2.00', NULL, '2020-05-08 18:09:21', NULL),
(64, 1, 9, 2, 0, '40.00', 9, '2020-05-08 20:24:45', 1),
(65, 1, 9, 2, 0, '40.00', 9, '2020-05-08 20:28:08', 1),
(66, 1, 9, 9, 3, '40.00', NULL, '2020-05-08 20:28:45', NULL),
(67, 9, 1, 9, 21, '520.00', NULL, '2020-05-08 20:28:59', NULL),
(68, 1, 9, 9, 8, '180.00', NULL, '2020-05-08 20:29:08', NULL),
(69, 1, 9, 2, 0, '40.00', 9, '2020-05-08 20:29:16', 1),
(70, 1, 9, 9, 5, '300.00', NULL, '2020-05-08 20:33:26', NULL),
(71, 1, 9, 9, 21, '520.00', NULL, '2020-05-08 20:33:31', NULL),
(72, 1, 9, 9, 17, '8888.00', NULL, '2020-05-08 20:33:38', NULL),
(73, 1, 9, 9, 9, '180.00', NULL, '2020-05-08 20:33:47', NULL),
(74, 1, 9, 2, 0, '80.00', 9, '2020-05-08 20:34:15', 2),
(75, 1, 9, 2, 0, '40.00', 9, '2020-05-08 20:36:10', 1),
(76, 1, 9, 2, 0, '80.00', 9, '2020-05-08 20:37:51', 2),
(77, 1, 9, 2, 0, '40.00', 9, '2020-05-08 20:38:15', 1),
(78, 1, 9, 9, 6, '260.00', NULL, '2020-05-08 20:41:40', NULL),
(79, 1, 9, 2, 0, '40.00', 9, '2020-05-08 20:42:26', 1),
(80, 1, 9, 18, 0, '30.00', 9, '2020-05-08 20:43:01', 1),
(81, 1, 9, 18, 0, '30.00', 9, '2020-05-08 20:44:20', 1),
(82, 1, 9, 2, 0, '40.00', 9, '2020-05-08 21:20:52', 1),
(83, 0, 289, 11, 1, '10.00', NULL, '2020-05-09 12:55:12', NULL),
(84, 1, 9, 9, 21, '520.00', NULL, '2020-05-09 13:50:14', NULL),
(85, 1, 9, 9, 17, '8888.00', NULL, '2020-05-09 13:50:24', NULL),
(86, 1, 9, 2, 0, '40.00', 9, '2020-05-09 13:50:36', 1),
(87, 1, 9, 9, 17, '8888.00', NULL, '2020-05-09 13:52:17', NULL),
(88, 1, 9, 9, 13, '2888.00', NULL, '2020-05-09 13:52:34', NULL),
(89, 1, 9, 9, 18, '12000.00', NULL, '2020-05-09 13:52:45', NULL),
(90, 1, 9, 2, 0, '40.00', 9, '2020-05-09 13:52:55', 1),
(91, 0, 9, 11, 1, '10.00', NULL, '2020-05-09 19:17:48', NULL),
(92, 0, 27, 11, 1, '10.00', NULL, '2020-05-09 19:42:19', NULL),
(93, 0, 28, 11, 1, '10.00', NULL, '2020-05-09 19:45:53', NULL),
(94, 28, 27, 17, 1, '30.00', NULL, '2020-05-09 20:17:45', NULL),
(95, 28, 29, 9, 3, '40.00', NULL, '2020-05-09 20:19:24', NULL),
(96, 28, 29, 9, 4, '120.00', NULL, '2020-05-09 20:19:28', NULL),
(97, 29, 28, 9, 3, '40.00', NULL, '2020-05-09 20:21:47', NULL),
(98, 28, 29, 2, 0, '60.00', 29, '2020-05-09 20:22:01', 3),
(99, 28, 29, 9, 3, '40.00', NULL, '2020-05-09 20:22:22', NULL),
(100, 28, 29, 9, 4, '120.00', NULL, '2020-05-09 20:22:25', NULL),
(101, 28, 29, 9, 3, '40.00', NULL, '2020-05-09 20:22:29', NULL),
(102, 28, 29, 9, 5, '300.00', NULL, '2020-05-09 20:22:32', NULL),
(103, 28, 29, 9, 6, '260.00', NULL, '2020-05-09 20:22:41', NULL),
(104, 28, 29, 2, 0, '20.00', 29, '2020-05-09 20:23:08', 1),
(105, 28, 31, 9, 9, '180.00', NULL, '2020-05-09 20:24:06', NULL),
(106, 28, 31, 2, 0, '30.00', 31, '2020-05-09 20:24:34', 1),
(107, 28, 31, 2, 0, '30.00', 31, '2020-05-09 20:25:16', 1),
(108, 28, 31, 9, 5, '300.00', NULL, '2020-05-09 20:25:55', NULL),
(109, 28, 31, 9, 17, '8888.00', NULL, '2020-05-09 20:26:02', NULL),
(110, 28, 31, 2, 0, '30.00', 31, '2020-05-09 20:26:10', 1),
(111, 0, 289, 11, 1, '10.00', NULL, '2020-05-10 01:26:18', NULL),
(112, 32, 29, 1, 0, '2.00', NULL, '2020-05-10 01:27:16', NULL),
(113, 32, 14, 1, 0, '2.00', NULL, '2020-05-10 01:28:13', NULL),
(114, 28, 33, 1, 0, '2.00', NULL, '2020-05-10 11:31:13', NULL),
(115, 28, 33, 1, 0, '2.00', NULL, '2020-05-10 11:55:44', NULL),
(116, 28, 31, 5, 0, '500.00', NULL, '2020-05-10 15:14:02', NULL),
(117, 28, 33, 5, 0, '500.00', NULL, '2020-05-10 15:14:09', NULL),
(118, 28, 33, 9, 3, '40.00', NULL, '2020-05-10 15:14:22', NULL),
(119, 28, 31, 2, 0, '30.00', 31, '2020-05-10 15:15:48', 1),
(120, 28, 36, 9, 21, '520.00', NULL, '2020-05-11 01:12:43', NULL),
(121, 28, 36, 9, 4, '120.00', NULL, '2020-05-11 01:12:49', NULL),
(122, 28, 36, 9, 13, '2888.00', NULL, '2020-05-11 01:12:53', NULL),
(123, 28, 36, 9, 10, '200.00', NULL, '2020-05-11 01:12:57', NULL),
(124, 0, 289, 11, 1, '10.00', NULL, '2020-05-11 12:54:11', NULL),
(125, 37, 39, 1, 0, '2.00', NULL, '2020-05-11 13:10:10', NULL),
(126, 37, 39, 2, 0, '20.00', 39, '2020-05-11 13:13:22', 1),
(127, 35, 31, 2, 0, '30.00', 31, '2020-05-11 13:20:29', 1),
(129, 28, 39, 1, 0, '2.00', NULL, '2020-05-11 13:22:52', NULL),
(130, 28, 39, 5, 0, '500.00', NULL, '2020-05-11 13:23:30', NULL),
(131, 31, 39, 19, 0, '300.00', NULL, '2020-05-11 13:30:48', NULL),
(132, 31, 39, 6, 0, '500.00', NULL, '2020-05-11 13:30:53', NULL),
(133, 28, 31, 2, 0, '30.00', 31, '2020-05-11 13:32:15', 1),
(134, 35, 39, 1, 0, '8.00', NULL, '2020-05-11 13:47:27', NULL),
(135, 35, 39, 2, 0, '40.00', 39, '2020-05-11 13:47:49', 1),
(136, 35, 39, 2, 0, '40.00', 39, '2020-05-11 13:48:11', 1),
(137, 30, 39, 1, 0, '8.00', NULL, '2020-05-11 13:54:39', NULL),
(138, 35, 39, 2, 0, '40.00', 39, '2020-05-11 13:56:07', 1),
(139, 35, 39, 2, 0, '40.00', 39, '2020-05-11 13:56:30', 1),
(140, 35, 39, 2, 0, '40.00', 39, '2020-05-11 13:57:10', 1),
(141, 35, 39, 2, 0, '40.00', 39, '2020-05-11 13:59:00', 1),
(142, 30, 33, 5, 0, '500.00', NULL, '2020-05-11 14:01:35', NULL),
(143, 35, 39, 2, 0, '80.00', 39, '2020-05-11 14:06:16', 2),
(144, 28, 39, 2, 0, '40.00', 39, '2020-05-11 14:07:19', 1),
(145, 0, 35, 11, 1, '10.00', NULL, '2020-05-11 14:45:54', NULL),
(146, 44, 14, 1, 0, '2.00', NULL, '2020-05-11 14:47:19', NULL),
(147, 44, 36, 1, 0, '2.00', NULL, '2020-05-11 14:47:28', NULL),
(148, 44, 33, 1, 0, '2.00', NULL, '2020-05-11 14:47:34', NULL),
(149, 0, 35, 11, 1, '10.00', NULL, '2020-05-11 15:32:34', NULL),
(150, 0, 35, 11, 1, '10.00', NULL, '2020-05-11 15:42:19', NULL),
(151, 46, 36, 1, 0, '2.00', NULL, '2020-05-11 15:46:01', NULL),
(152, 0, 35, 11, 1, '10.00', NULL, '2020-05-11 15:54:44', NULL),
(154, 49, 14, 1, 0, '2.00', NULL, '2020-05-11 16:11:40', NULL),
(155, 49, 14, 1, 0, '2.00', NULL, '2020-05-11 16:11:48', NULL),
(156, 49, 36, 1, 0, '2.00', NULL, '2020-05-11 16:12:23', NULL),
(157, 0, 35, 11, 1, '10.00', NULL, '2020-05-11 23:09:15', NULL),
(158, 51, 36, 1, 0, '2.00', NULL, '2020-05-11 23:20:12', NULL),
(159, 51, 14, 1, 0, '2.00', NULL, '2020-05-11 23:20:50', NULL),
(160, 0, 42, 11, 1, '10.00', NULL, '2020-05-12 03:45:44', NULL),
(161, 54, 14, 1, 0, '2.00', NULL, '2020-05-12 03:48:08', NULL),
(162, 30, 56, 2, 0, '40.00', 56, '2020-05-12 11:09:17', 1),
(163, 30, 56, 1, 0, '2.00', NULL, '2020-05-12 11:09:46', NULL),
(164, 0, 35, 11, 1, '10.00', NULL, '2020-05-12 13:21:59', NULL),
(165, 0, 35, 11, 1, '10.00', NULL, '2020-05-12 13:59:07', NULL),
(166, 60, 33, 1, 0, '2.00', NULL, '2020-05-12 14:00:29', NULL),
(168, 30, 28, 17, 1, '30.00', NULL, '2020-05-12 15:52:29', NULL),
(169, 30, 53, 1, 0, '2.00', NULL, '2020-05-12 15:54:13', NULL),
(170, 30, 53, 2, 0, '120.00', 53, '2020-05-12 16:00:31', 3),
(171, 30, 53, 9, 3, '40.00', NULL, '2020-05-12 16:05:21', NULL),
(172, 30, 53, 9, 3, '40.00', NULL, '2020-05-12 16:05:25', NULL),
(173, 30, 53, 9, 4, '120.00', NULL, '2020-05-12 16:05:30', NULL),
(174, 30, 53, 9, 3, '40.00', NULL, '2020-05-12 16:05:43', NULL),
(175, 30, 53, 9, 3, '40.00', NULL, '2020-05-12 16:05:49', NULL),
(176, 30, 53, 2, 0, '80.00', 53, '2020-05-12 16:07:19', 2),
(178, 30, 53, 1, 0, '2.00', NULL, '2020-05-12 20:16:48', NULL),
(180, 35, 53, 1, 0, '2.00', NULL, '2020-05-13 00:22:32', NULL),
(181, 35, 53, 9, 3, '40.00', NULL, '2020-05-13 01:21:45', NULL),
(182, 35, 53, 1, 0, '2.00', NULL, '2020-05-13 01:22:00', NULL),
(183, 35, 53, 1, 0, '2.00', NULL, '2020-05-13 01:22:00', NULL),
(184, 35, 53, 1, 0, '2.00', NULL, '2020-05-13 01:22:07', NULL),
(185, 58, 36, 1, 0, '2.00', NULL, '2020-05-13 10:37:43', NULL),
(187, 0, 35, 11, 1, '10.00', NULL, '2020-05-13 14:13:09', NULL),
(188, 65, 33, 1, 0, '2.00', NULL, '2020-05-13 14:14:39', NULL),
(189, 65, 36, 1, 0, '2.00', NULL, '2020-05-13 14:14:49', NULL),
(190, 65, 14, 1, 0, '2.00', NULL, '2020-05-13 14:14:54', NULL),
(191, 65, 53, 1, 0, '2.00', NULL, '2020-05-13 14:15:22', NULL),
(192, 0, 35, 11, 1, '10.00', NULL, '2020-05-13 16:16:38', NULL),
(193, 0, 35, 11, 1, '10.00', NULL, '2020-05-13 16:17:11', NULL),
(194, 67, 62, 1, 0, '2.00', NULL, '2020-05-13 16:19:10', NULL),
(195, 67, 53, 1, 0, '2.00', NULL, '2020-05-13 16:19:37', NULL),
(196, 67, 62, 1, 0, '2.00', NULL, '2020-05-13 16:19:43', NULL),
(197, 67, 62, 1, 0, '2.00', NULL, '2020-05-13 16:20:08', NULL),
(198, 66, 31, 1, 0, '2.00', NULL, '2020-05-13 16:42:03', NULL),
(199, 66, 53, 2, 0, '320.00', 53, '2020-05-13 20:18:47', 8),
(200, 66, 53, 1, 0, '2.00', NULL, '2020-05-13 20:26:49', NULL),
(201, 66, 53, 1, 0, '2.00', NULL, '2020-05-13 20:29:18', NULL),
(202, 66, 53, 1, 0, '2.00', NULL, '2020-05-13 20:34:36', NULL),
(203, 66, 53, 1, 0, '2.00', NULL, '2020-05-13 20:34:53', NULL),
(204, 66, 53, 1, 0, '2.00', NULL, '2020-05-13 20:39:23', NULL),
(205, 0, 35, 11, 1, '10.00', NULL, '2020-05-14 17:29:50', NULL),
(206, 0, 30, 11, 1, '10.00', NULL, '2020-05-14 17:33:28', NULL),
(207, 35, 62, 1, 0, '2.00', NULL, '2020-05-14 19:38:46', NULL),
(208, 35, 62, 1, 0, '2.00', NULL, '2020-05-14 21:47:56', NULL),
(209, 0, 289, 11, 1, '10.00', NULL, '2020-05-15 00:53:12', NULL),
(210, 72, 14, 1, 0, '2.00', NULL, '2020-05-15 00:58:14', NULL),
(211, 72, 14, 1, 0, '2.00', NULL, '2020-05-15 00:58:25', NULL),
(212, 72, 36, 1, 0, '2.00', NULL, '2020-05-15 00:58:36', NULL),
(213, 72, 33, 1, 0, '2.00', NULL, '2020-05-15 00:58:50', NULL),
(214, 0, 35, 11, 1, '10.00', NULL, '2020-05-15 10:39:41', NULL),
(215, 73, 36, 1, 0, '2.00', NULL, '2020-05-15 10:42:06', NULL),
(219, 35, 76, 2, 0, '80.00', 76, '2020-05-15 20:56:55', 2),
(220, 35, 76, 1, 0, '2.00', NULL, '2020-05-15 20:57:01', NULL),
(221, 35, 76, 1, 0, '2.00', NULL, '2020-05-15 20:58:31', NULL),
(222, 35, 76, 1, 0, '2.00', NULL, '2020-05-15 20:59:08', NULL),
(223, 35, 76, 1, 0, '2.00', NULL, '2020-05-15 20:59:30', NULL),
(224, 35, 76, 1, 0, '2.00', NULL, '2020-05-15 20:59:42', NULL),
(225, 35, 76, 1, 0, '2.00', NULL, '2020-05-15 20:59:55', NULL),
(226, 35, 76, 1, 0, '2.00', NULL, '2020-05-15 21:00:16', NULL),
(227, 35, 76, 1, 0, '2.00', NULL, '2020-05-15 21:00:38', NULL),
(228, 35, 76, 1, 0, '2.00', NULL, '2020-05-15 21:01:27', NULL),
(229, 35, 76, 1, 0, '2.00', NULL, '2020-05-15 21:03:24', NULL),
(230, 35, 76, 1, 0, '2.00', NULL, '2020-05-15 21:04:03', NULL),
(231, 35, 76, 1, 0, '2.00', NULL, '2020-05-15 21:04:25', NULL),
(232, 35, 76, 1, 0, '2.00', NULL, '2020-05-15 21:04:40', NULL),
(233, 35, 76, 1, 0, '8.00', NULL, '2020-05-15 21:50:01', NULL),
(234, 0, 27, 11, 1, '10.00', NULL, '2020-05-20 02:40:27', NULL),
(235, 0, 289, 11, 1, '10.00', NULL, '2020-05-22 20:47:15', NULL),
(236, 0, 35, 11, 1, '10.00', NULL, '2020-05-24 15:25:36', NULL),
(237, 46, 36, 1, 0, '2.00', NULL, '2020-05-25 09:18:22', NULL),
(238, 0, 35, 11, 1, '10.00', NULL, '2020-05-25 15:50:01', NULL),
(239, 87, 89, 9, 3, '40.00', NULL, '2020-06-13 16:30:49', NULL),
(240, 87, 89, 2, 0, '40.00', 89, '2020-06-13 16:31:13', 1),
(241, 87, 89, 2, 0, '40.00', 89, '2020-06-13 16:32:12', 1),
(242, 0, 28, 11, 1, '10.00', NULL, '2020-06-13 17:07:55', NULL),
(243, 90, 36, 1, 0, '2.00', NULL, '2020-06-13 17:09:07', NULL),
(244, 90, 14, 1, 0, '2.00', NULL, '2020-06-13 17:09:24', NULL),
(245, 90, 33, 1, 0, '2.00', NULL, '2020-06-13 17:09:29', NULL),
(246, 87, 14, 1, 0, '2.00', NULL, '2020-06-16 00:51:12', NULL),
(247, 87, 36, 1, 0, '2.00', NULL, '2020-06-16 00:51:39', NULL),
(248, 87, 52, 6, 0, '300.00', NULL, '2020-06-16 15:28:49', NULL),
(249, 87, 33, 1, 0, '2.00', NULL, '2020-06-18 02:14:27', NULL),
(250, 87, 89, 1, 0, '2.00', NULL, '2020-06-18 17:50:25', NULL),
(251, 87, 89, 5, 0, '500.00', NULL, '2020-06-18 17:54:44', NULL),
(252, 87, 34, 5, 0, '500.00', NULL, '2020-06-19 15:15:37', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `t_pay_dispose`
--

CREATE TABLE IF NOT EXISTS `t_pay_dispose` (
  `t_id` int(11) NOT NULL,
  `t_pay_name` varchar(100) DEFAULT NULL COMMENT '渠道名称',
  `t_pay_icon` varchar(255) DEFAULT NULL COMMENT '渠道图片',
  `t_is_default` int(11) DEFAULT NULL COMMENT '是否默认{-1:非默认 1.默认}',
  `t_is_scrap` int(11) DEFAULT NULL COMMENT '是否下架{-1:已下架 1:使用中}',
  `t_pay_type` int(11) DEFAULT NULL COMMENT '支付类型{-2:微信，-1:支付宝}'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `t_pay_dispose`
--

INSERT INTO `t_pay_dispose` (`t_id`, `t_pay_name`, `t_pay_icon`, `t_is_default`, `t_is_scrap`, `t_pay_type`) VALUES
(7, '支付宝', 'http://yvy.tulezb.com/alipay.png', 1, 1, -1),
(8, '微信支付', 'https://img-1256929999.cos.ap-chengdu.myqcloud.com/pay_icon/weixin.png', -1, -1, -2);

-- --------------------------------------------------------

--
-- 表的结构 `t_platform_income`
--

CREATE TABLE IF NOT EXISTS `t_platform_income` (
  `t_id` int(11) NOT NULL,
  `t_gold` decimal(18,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `t_praise`
--

CREATE TABLE IF NOT EXISTS `t_praise` (
  `t_id` int(11) NOT NULL,
  `t_praise_user` int(11) DEFAULT NULL,
  `t_cover_praise_user` int(11) DEFAULT NULL,
  `t_dynamic_id` int(11) DEFAULT NULL,
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_praise`
--

INSERT INTO `t_praise` (`t_id`, `t_praise_user`, `t_cover_praise_user`, `t_dynamic_id`, `t_create_time`) VALUES
(1, 9, NULL, 2, '2020-05-01 14:45:01'),
(2, 1, NULL, 2, '2020-05-01 14:45:08'),
(3, 9, NULL, 1, '2020-05-01 14:45:43'),
(4, 2, NULL, 2, '2020-05-03 17:45:13'),
(5, 97, NULL, 2, '2020-06-22 00:16:42');

-- --------------------------------------------------------

--
-- 表的结构 `t_private_collection`
--

CREATE TABLE IF NOT EXISTS `t_private_collection` (
  `t_id` int(11) NOT NULL,
  `t_user_id` int(11) DEFAULT NULL,
  `t_album_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `t_profit_detail`
--

CREATE TABLE IF NOT EXISTS `t_profit_detail` (
  `t_profit_id` int(11) NOT NULL,
  `t_profit_type` int(11) DEFAULT NULL COMMENT '1.聊天\r\n2.视频\r\n3.私密照片\r\n4.私密视频\r\n5.查看手机\r\n6.查看微信\r\n7.红包\r\n8.VIP\r\n9.礼物\r\n',
  `t_profit_gold` decimal(10,2) DEFAULT NULL,
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_profit_detail`
--

INSERT INTO `t_profit_detail` (`t_profit_id`, `t_profit_type`, `t_profit_gold`, `t_create_time`) VALUES
(1, 18, '0.70', '2020-04-24 10:56:47'),
(2, 2, '1.40', '2020-04-24 10:57:19'),
(3, 2, '1.40', '2020-04-24 12:07:06'),
(4, 2, '1.40', '2020-04-24 12:36:21'),
(5, 2, '2.80', '2020-04-28 12:04:41'),
(6, 2, '2.80', '2020-04-28 12:07:51'),
(7, 2, '1.40', '2020-04-28 23:11:30'),
(8, 2, '1.40', '2020-04-28 23:16:38'),
(9, 2, '0.40', '2020-04-30 19:24:41'),
(10, 9, '0.04', '2020-04-30 19:56:46'),
(11, 9, '0.12', '2020-04-30 19:56:58'),
(12, 9, '0.12', '2020-04-30 19:57:04'),
(13, 18, '0.20', '2020-05-01 14:28:17'),
(14, 18, '0.20', '2020-05-01 14:28:32'),
(15, 2, '0.40', '2020-05-01 14:32:24'),
(16, 2, '0.40', '2020-05-01 21:04:20'),
(17, 9, '-0.26', '2020-05-01 21:08:43'),
(18, 9, '0.20', '2020-05-01 21:08:49'),
(19, 9, '0.80', '2020-05-01 21:08:53'),
(20, 9, '0.26', '2020-05-01 21:08:57'),
(21, 2, '2.00', '2020-05-01 21:09:13'),
(22, 18, '0.20', '2020-05-01 21:17:29'),
(23, 9, '-0.26', '2020-05-01 21:18:31'),
(24, 9, '0.04', '2020-05-01 21:18:50'),
(25, 2, '1.20', '2020-05-01 21:19:59'),
(26, 2, '1.40', '2020-05-01 21:20:41'),
(27, 18, '0.20', '2020-05-01 21:23:34'),
(28, 18, '0.20', '2020-05-01 21:23:57'),
(29, 2, '0.40', '2020-05-01 21:24:33'),
(30, 2, '1.40', '2020-05-02 18:30:45'),
(31, 9, '-0.06', '2020-05-03 21:37:36'),
(32, 9, '-0.18', '2020-05-03 21:37:44'),
(33, 9, '0.42', '2020-05-03 21:38:03'),
(34, 2, '2.80', '2020-05-03 21:38:04'),
(35, 9, '-1.20', '2020-05-03 21:39:02'),
(36, 2, '5.60', '2020-05-03 21:40:08'),
(37, 2, '2.40', '2020-05-04 13:13:14'),
(38, 2, '2.40', '2020-05-04 13:13:35'),
(39, 2, '0.80', '2020-05-04 13:45:48'),
(40, 9, '0.04', '2020-05-04 13:56:11'),
(41, 9, '0.04', '2020-05-04 13:56:22'),
(42, 9, '-0.26', '2020-05-04 14:01:30'),
(43, 9, '-0.26', '2020-05-04 14:03:06'),
(44, 9, '-0.78', '2020-05-04 14:03:21'),
(45, 9, '-1.20', '2020-05-04 14:03:48'),
(46, 2, '-1.20', '2020-05-04 14:03:51'),
(47, 9, '-17082.00', '2020-05-04 14:05:12'),
(48, 9, '-505.44', '2020-05-04 14:05:26'),
(49, 9, '-520.00', '2020-05-04 14:05:47'),
(50, 2, '-1.20', '2020-05-04 14:05:58'),
(51, 2, '0.80', '2020-05-04 14:23:00'),
(52, 4, '-0.30', '2020-05-07 11:58:50'),
(53, 2, '-1.20', '2020-05-08 20:24:45'),
(54, 2, '-1.20', '2020-05-08 20:28:08'),
(55, 9, '-1.20', '2020-05-08 20:28:45'),
(56, 9, '-67.60', '2020-05-08 20:28:59'),
(57, 9, '-5.40', '2020-05-08 20:29:08'),
(58, 2, '-1.20', '2020-05-08 20:29:16'),
(59, 9, '-9.00', '2020-05-08 20:33:26'),
(60, 9, '-15.60', '2020-05-08 20:33:32'),
(61, 9, '-266.64', '2020-05-08 20:33:38'),
(62, 9, '-5.40', '2020-05-08 20:33:47'),
(63, 2, '-2.40', '2020-05-08 20:34:15'),
(64, 2, '-1.20', '2020-05-08 20:36:10'),
(65, 2, '-2.40', '2020-05-08 20:37:51'),
(66, 2, '-1.20', '2020-05-08 20:38:15'),
(67, 9, '-7.80', '2020-05-08 20:41:40'),
(68, 2, '-1.20', '2020-05-08 20:42:26'),
(69, 18, '-0.90', '2020-05-08 20:43:01'),
(70, 18, '-0.90', '2020-05-08 20:44:20'),
(71, 2, '-1.20', '2020-05-08 21:20:52'),
(72, 9, '-15.60', '2020-05-09 13:50:14'),
(73, 9, '-266.64', '2020-05-09 13:50:24'),
(74, 2, '-1.20', '2020-05-09 13:50:36'),
(75, 9, '-266.64', '2020-05-09 13:52:17'),
(76, 9, '-86.64', '2020-05-09 13:52:34'),
(77, 9, '-360.00', '2020-05-09 13:52:45'),
(78, 2, '-1.20', '2020-05-09 13:52:55'),
(79, 9, '-7.20', '2020-05-09 20:19:24'),
(80, 9, '-21.60', '2020-05-09 20:19:28'),
(81, 9, '-7.20', '2020-05-09 20:21:48'),
(82, 2, '-10.80', '2020-05-09 20:22:01'),
(83, 9, '-7.20', '2020-05-09 20:22:22'),
(84, 9, '-21.60', '2020-05-09 20:22:25'),
(85, 9, '-7.20', '2020-05-09 20:22:29'),
(86, 9, '-54.00', '2020-05-09 20:22:32'),
(87, 9, '-46.80', '2020-05-09 20:22:41'),
(88, 2, '-3.60', '2020-05-09 20:23:08'),
(89, 9, '-32.40', '2020-05-09 20:24:06'),
(90, 2, '-5.40', '2020-05-09 20:24:34'),
(91, 2, '-5.40', '2020-05-09 20:25:16'),
(92, 9, '-54.00', '2020-05-09 20:25:55'),
(93, 9, '-1599.84', '2020-05-09 20:26:02'),
(94, 2, '-5.40', '2020-05-09 20:26:10'),
(95, 5, '-90.00', '2020-05-10 15:14:02'),
(96, 5, '-65.00', '2020-05-10 15:14:09'),
(97, 9, '-5.20', '2020-05-10 15:14:22'),
(98, 2, '-5.40', '2020-05-10 15:15:48'),
(99, 9, '-67.60', '2020-05-11 01:12:43'),
(100, 9, '-15.60', '2020-05-11 01:12:49'),
(101, 9, '-375.44', '2020-05-11 01:12:53'),
(102, 9, '-26.00', '2020-05-11 01:12:57'),
(103, 2, '-0.90', '2020-05-11 13:20:29'),
(104, 5, '-105.00', '2020-05-11 13:23:30'),
(105, 19, '-63.00', '2020-05-11 13:30:48'),
(106, 6, '-105.00', '2020-05-11 13:30:53'),
(107, 2, '-5.40', '2020-05-11 13:32:15'),
(108, 2, '-2.40', '2020-05-11 13:47:49'),
(109, 2, '-2.40', '2020-05-11 13:48:11'),
(110, 2, '-2.40', '2020-05-11 13:56:07'),
(111, 2, '-2.40', '2020-05-11 13:56:30'),
(112, 2, '-2.40', '2020-05-11 13:57:10'),
(113, 2, '-2.40', '2020-05-11 13:59:00'),
(114, 5, '-90.00', '2020-05-11 14:01:35'),
(115, 2, '-4.80', '2020-05-11 14:06:16'),
(116, 2, '-8.40', '2020-05-11 14:07:19'),
(117, 2, '-10.40', '2020-05-12 11:09:17'),
(118, 2, '-31.20', '2020-05-12 16:00:31'),
(119, 9, '-10.40', '2020-05-12 16:05:21'),
(120, 9, '-10.40', '2020-05-12 16:05:25'),
(121, 9, '-31.20', '2020-05-12 16:05:30'),
(122, 9, '-10.40', '2020-05-12 16:05:43'),
(123, 9, '-10.40', '2020-05-12 16:05:49'),
(124, 2, '-20.80', '2020-05-12 16:07:19'),
(125, 9, '-2.40', '2020-05-13 01:21:45'),
(126, 2, '-67.20', '2020-05-13 20:18:47'),
(127, 2, '-4.80', '2020-05-15 20:56:55'),
(128, 9, '0.80', '2020-06-13 16:30:49'),
(129, 2, '0.80', '2020-06-13 16:31:13'),
(130, 2, '0.80', '2020-06-13 16:32:12'),
(131, 6, '-18.00', '2020-06-16 15:28:49'),
(132, 5, '10.00', '2020-06-18 17:54:44'),
(133, 5, '10.00', '2020-06-19 15:15:37');

-- --------------------------------------------------------

--
-- 表的结构 `t_put_forward`
--

CREATE TABLE IF NOT EXISTS `t_put_forward` (
  `t_id` int(11) NOT NULL,
  `t_user_id` int(11) DEFAULT NULL,
  `t_order_no` varchar(100) DEFAULT NULL,
  `t_money` decimal(10,2) DEFAULT NULL,
  `t_setmeal_id` int(11) DEFAULT NULL,
  `t_describe` varchar(100) DEFAULT NULL,
  `t_create_time` datetime DEFAULT NULL,
  `t_order_state` int(11) DEFAULT NULL COMMENT '0.待审核\r\n1.已审核待打款\r\n2.已打款\r\n3.打款失败',
  `t_handle_time` datetime DEFAULT NULL,
  `t_income_gold` decimal(10,2) DEFAULT NULL,
  `t_share_gold` decimal(10,2) DEFAULT NULL,
  `t_data_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_put_forward`
--

INSERT INTO `t_put_forward` (`t_id`, `t_user_id`, `t_order_no`, `t_money`, `t_setmeal_id`, `t_describe`, `t_create_time`, `t_order_state`, `t_handle_time`, `t_income_gold`, `t_share_gold`, `t_data_id`) VALUES
(1, 9, 'tx91588497886501', '200.00', 63, '', '2020-05-03 17:24:46', 2, '2020-05-03 17:25:38', '2000.00', '0.00', 1),
(2, 2, 'tx21588514233818', '10.00', 61, '', '2020-05-03 21:57:13', 2, '2020-05-03 21:57:45', '100.00', '0.00', 4),
(3, 9, 'tx91588558981627', '800.00', 21, '', '2020-05-04 10:23:01', 2, '2020-05-04 10:27:46', '8400.00', '0.00', 3),
(4, 9, 'tx91589023654890', '100.00', 5, NULL, '2020-05-09 19:27:34', 0, NULL, '1000.00', '0.00', 3),
(5, 53, 'tx531589372908139', '50.00', 61, '', '2020-05-13 20:28:28', 2, '2020-05-13 20:29:21', '500.00', '0.00', 5);

-- --------------------------------------------------------

--
-- 表的结构 `t_put_forward_data`
--

CREATE TABLE IF NOT EXISTS `t_put_forward_data` (
  `t_id` int(11) NOT NULL,
  `t_user_id` int(11) DEFAULT NULL,
  `t_real_name` varchar(20) DEFAULT NULL,
  `t_nick_name` varchar(100) DEFAULT NULL,
  `t_head_img` varchar(255) DEFAULT NULL,
  `t_account_number` varchar(100) DEFAULT NULL,
  `t_QR_code` varchar(255) DEFAULT NULL,
  `t_create_time` datetime DEFAULT NULL,
  `t_type` int(11) DEFAULT NULL COMMENT '0.支付宝\r\n1.微信'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `t_ranking_control`
--

CREATE TABLE IF NOT EXISTS `t_ranking_control` (
  `t_id` int(11) NOT NULL,
  `t_charm_number` int(11) DEFAULT NULL,
  `t_consumption_number` int(11) DEFAULT NULL,
  `t_courtesy_number` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_ranking_control`
--

INSERT INTO `t_ranking_control` (`t_id`, `t_charm_number`, `t_consumption_number`, `t_courtesy_number`) VALUES
(1, 10, 10, 10);

-- --------------------------------------------------------

--
-- 表的结构 `t_reception_rate`
--

CREATE TABLE IF NOT EXISTS `t_reception_rate` (
  `t_id` int(11) NOT NULL,
  `t_user_id` int(11) DEFAULT NULL,
  `t_count` int(11) DEFAULT NULL,
  `t_reception_count` int(11) DEFAULT NULL,
  `t_refuse_count` int(11) DEFAULT NULL,
  `t_reception` float DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_reception_rate`
--

INSERT INTO `t_reception_rate` (`t_id`, `t_user_id`, `t_count`, `t_reception_count`, `t_refuse_count`, `t_reception`) VALUES
(1, 2, 10, 10, 0, 100),
(2, 9, 28, 28, 0, 100),
(3, 3, 1, 1, 0, 100),
(4, 14, 1, 1, 0, 100),
(5, 16, 2, 2, 0, 100),
(6, 29, 2, 2, 0, 100),
(7, 31, 6, 6, 0, 100),
(8, 39, 8, 8, 0, 100),
(9, 56, 1, 1, 0, 100),
(10, 53, 3, 3, 0, 100),
(11, 76, 1, 1, 0, 100),
(12, 89, 2, 2, 0, 100);

-- --------------------------------------------------------

--
-- 表的结构 `t_recharge`
--

CREATE TABLE IF NOT EXISTS `t_recharge` (
  `t_id` int(11) NOT NULL,
  `t_user_id` int(11) DEFAULT NULL,
  `t_recharge_money` decimal(10,2) DEFAULT NULL,
  `t_order_no` varchar(100) DEFAULT NULL,
  `t_tripartite_order` varchar(100) DEFAULT NULL,
  `t_recharge_type` int(11) DEFAULT NULL COMMENT '0.VIP\r\n1.金币',
  `t_payment_type` int(11) DEFAULT NULL COMMENT '0.支付宝\r\n1.微信',
  `t_setmeal_id` int(11) DEFAULT NULL COMMENT '充值VIP不存在',
  `t_order_state` int(11) DEFAULT NULL COMMENT '0.创建订单\r\n1.订单已支付\r\n2.放弃支付',
  `t_create_time` datetime DEFAULT NULL,
  `t_pay_id` int(11) DEFAULT NULL,
  `t_fulfil_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_recharge`
--

INSERT INTO `t_recharge` (`t_id`, `t_user_id`, `t_recharge_money`, `t_order_no`, `t_tripartite_order`, `t_recharge_type`, `t_payment_type`, `t_setmeal_id`, `t_order_state`, `t_create_time`, `t_pay_id`, `t_fulfil_time`) VALUES
(102, 96, '0.01', 'zf_96_1592669678732', '2020062122001421841422371937', 1, -1, 40, 1, '2020-06-21 00:14:38', 7, '2020-06-21 00:14:58');

-- --------------------------------------------------------

--
-- 表的结构 `t_redpacket_log`
--

CREATE TABLE IF NOT EXISTS `t_redpacket_log` (
  `t_redpacket_id` int(11) NOT NULL,
  `t_hair_userId` int(11) DEFAULT NULL,
  `t_receive_userId` int(11) DEFAULT NULL,
  `t_redpacket_content` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `t_redpacket_gold` decimal(10,2) DEFAULT NULL,
  `t_redpacket_draw` int(11) DEFAULT NULL COMMENT '0.未领取\r\n1.已领取',
  `t_redpacket_type` int(11) DEFAULT NULL COMMENT '0.赠送红包\r\n1.贡献红包 \r\n2.主播认证红包\r\n3.后台添加红包',
  `t_create_time` datetime DEFAULT NULL,
  `t_order_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_redpacket_log`
--

INSERT INTO `t_redpacket_log` (`t_redpacket_id`, `t_hair_userId`, `t_receive_userId`, `t_redpacket_content`, `t_redpacket_gold`, `t_redpacket_draw`, `t_redpacket_type`, `t_create_time`, `t_order_id`) VALUES
(1, 15, 1, '官方赠送[500]个金币!', '500.00', 1, 3, '2020-04-24 10:54:03', NULL),
(2, 9, 1, '来自于聊友:10009师徒奖励红包:', '1.00', 1, 1, '2020-04-30 19:24:41', 12),
(3, 9, 1, '来自于聊友:10009师徒奖励红包:', '1.00', 1, 1, '2020-05-01 14:32:24', 18),
(4, 9, 1, '来自于聊友:10009师徒奖励红包:', '1.00', 1, 1, '2020-05-01 21:04:20', 19),
(5, 9, 1, '来自于聊友:10009师徒奖励红包:', '2.00', 1, 1, '2020-05-01 21:08:53', 22),
(6, 9, 1, '来自于聊友:10009师徒奖励红包:', '5.00', 1, 1, '2020-05-01 21:09:13', 24),
(7, 9, 1, '来自于聊友:10009师徒奖励红包:', '3.00', 1, 1, '2020-05-01 21:19:59', 28),
(8, 9, 1, '来自于聊友:10009师徒奖励红包:', '1.00', 1, 1, '2020-05-01 21:24:33', 32),
(9, 15, 9, '官方赠送[200000]个金币!', '200000.00', 1, 3, '2020-05-03 15:19:26', NULL),
(10, 15, 9, '官方赠送[1000]个金币!', '1000.00', 1, 3, '2020-05-03 15:19:48', NULL),
(11, 15, 1, '官方赠送[1000]个金币!', '1000.00', 1, 3, '2020-05-03 15:20:04', NULL),
(12, 15, 289, '来自于聊友:10015师徒奖励红包:', '10.00', 0, 1, '2020-05-03 16:26:15', 36),
(13, 9, 1, '来自于聊友:10009师徒奖励红包:', '2.00', 1, 1, '2020-05-03 21:38:04', 40),
(14, 9, 1, '来自于聊友:10009师徒奖励红包:', '6.00', 1, 1, '2020-05-03 21:39:02', 41),
(15, 9, 1, '来自于聊友:10009师徒奖励红包:', '4.00', 1, 1, '2020-05-03 21:40:08', 42),
(16, 9, 1, '来自于聊友:10009师徒奖励红包:', '2.00', 1, 1, '2020-05-04 14:03:48', 52),
(17, 9, 1, '来自于聊友:10009师徒奖励红包:', '2.00', 1, 1, '2020-05-04 14:03:51', 53),
(18, 9, 1, '来自于聊友:10009师徒奖励红包:', '19710.00', 1, 1, '2020-05-04 14:05:12', 54),
(19, 9, 1, '来自于聊友:10009师徒奖励红包:', '583.20', 1, 1, '2020-05-04 14:05:26', 55),
(20, 9, 1, '来自于聊友:10009师徒奖励红包:', '600.00', 1, 1, '2020-05-04 14:05:47', 56),
(21, 9, 1, '来自于聊友:10009师徒奖励红包:', '2.00', 1, 1, '2020-05-04 14:05:58', 57),
(22, 17, 289, '来自于聊友:10017师徒奖励红包:', '10.00', 0, 1, '2020-05-07 12:15:43', 60),
(23, 19, 289, '来自于聊友:10019师徒奖励红包:', '10.00', 0, 1, '2020-05-07 22:27:37', 61),
(24, 21, 289, '来自于聊友:10021师徒奖励红包:', '10.00', 0, 1, '2020-05-08 14:40:44', 62),
(25, 9, 1, '来自于聊友:10009师徒奖励红包:', '2.00', 1, 1, '2020-05-08 20:24:45', 64),
(26, 9, 1, '来自于聊友:10009师徒奖励红包:', '2.00', 1, 1, '2020-05-08 20:28:08', 65),
(27, 9, 1, '来自于聊友:10009师徒奖励红包:', '2.00', 1, 1, '2020-05-08 20:28:45', 66),
(28, 9, 1, '来自于聊友:10009师徒奖励红包:', '78.00', 1, 1, '2020-05-08 20:28:59', 67),
(29, 9, 1, '来自于聊友:10009师徒奖励红包:', '9.00', 1, 1, '2020-05-08 20:29:08', 68),
(30, 9, 1, '来自于聊友:10009师徒奖励红包:', '2.00', 1, 1, '2020-05-08 20:29:16', 69),
(31, 9, 1, '来自于聊友:10009师徒奖励红包:', '15.00', 1, 1, '2020-05-08 20:33:26', 70),
(32, 9, 1, '来自于聊友:10009师徒奖励红包:', '26.00', 1, 1, '2020-05-08 20:33:32', 71),
(33, 9, 1, '来自于聊友:10009师徒奖励红包:', '444.40', 1, 1, '2020-05-08 20:33:38', 72),
(34, 9, 1, '来自于聊友:10009师徒奖励红包:', '9.00', 1, 1, '2020-05-08 20:33:47', 73),
(35, 9, 1, '来自于聊友:10009师徒奖励红包:', '4.00', 1, 1, '2020-05-08 20:34:15', 74),
(36, 9, 1, '来自于聊友:10009师徒奖励红包:', '2.00', 1, 1, '2020-05-08 20:36:10', 75),
(37, 9, 1, '来自于聊友:10009师徒奖励红包:', '4.00', 1, 1, '2020-05-08 20:37:51', 76),
(38, 9, 1, '来自于聊友:10009师徒奖励红包:', '2.00', 1, 1, '2020-05-08 20:38:15', 77),
(39, 9, 1, '来自于聊友:10009师徒奖励红包:', '13.00', 1, 1, '2020-05-08 20:41:40', 78),
(40, 9, 1, '来自于聊友:10009师徒奖励红包:', '2.00', 1, 1, '2020-05-08 20:42:26', 79),
(41, 9, 1, '来自于聊友:10009师徒奖励红包:', '1.50', 1, 1, '2020-05-08 20:43:01', 80),
(42, 9, 1, '来自于聊友:10009师徒奖励红包:', '1.50', 1, 1, '2020-05-08 20:44:20', 81),
(43, 9, 1, '来自于聊友:10009师徒奖励红包:', '2.00', 1, 1, '2020-05-08 21:20:52', 82),
(44, 23, 289, '来自于聊友:10023师徒奖励红包:', '10.00', 0, 1, '2020-05-09 12:55:12', 83),
(45, 9, 1, '来自于聊友:10009师徒奖励红包:', '26.00', 1, 1, '2020-05-09 13:50:14', 84),
(46, 9, 1, '来自于聊友:10009师徒奖励红包:', '444.40', 1, 1, '2020-05-09 13:50:24', 85),
(47, 9, 1, '来自于聊友:10009师徒奖励红包:', '2.00', 1, 1, '2020-05-09 13:50:36', 86),
(48, 9, 1, '来自于聊友:10009师徒奖励红包:', '444.40', 1, 1, '2020-05-09 13:52:17', 87),
(49, 9, 1, '来自于聊友:10009师徒奖励红包:', '144.40', 1, 1, '2020-05-09 13:52:34', 88),
(50, 9, 1, '来自于聊友:10009师徒奖励红包:', '600.00', 1, 1, '2020-05-09 13:52:45', 89),
(51, 9, 1, '来自于聊友:10009师徒奖励红包:', '2.00', 1, 1, '2020-05-09 13:52:55', 90),
(52, 26, 9, '来自于聊友:10026师徒奖励红包:', '10.00', 1, 1, '2020-05-09 19:17:48', 91),
(53, 28, 27, '来自于聊友:10028师徒奖励红包:', '10.00', 1, 1, '2020-05-09 19:42:19', 92),
(54, 30, 28, '来自于聊友:10030师徒奖励红包:', '10.00', 1, 1, '2020-05-09 19:45:53', 93),
(55, 28, 27, '来自于聊友:10028师徒奖励红包:', '6.00', 1, 1, '2020-05-09 20:19:24', 95),
(56, 29, 27, '来自于聊友:10029师徒奖励红包:', '2.00', 1, 1, '2020-05-09 20:19:24', 95),
(57, 28, 27, '来自于聊友:10028师徒奖励红包:', '18.00', 1, 1, '2020-05-09 20:19:28', 96),
(58, 29, 27, '来自于聊友:10029师徒奖励红包:', '6.00', 1, 1, '2020-05-09 20:19:28', 96),
(59, 15, 28, '官方赠送[100]个金币!', '100.00', 1, 3, '2020-05-09 20:21:02', NULL),
(60, 29, 27, '来自于聊友:10029师徒奖励红包:', '6.00', 1, 1, '2020-05-09 20:21:47', 97),
(61, 28, 27, '来自于聊友:10028师徒奖励红包:', '2.00', 1, 1, '2020-05-09 20:21:47', 97),
(62, 15, 28, '官方赠送[1000]个金币!', '1000.00', 1, 3, '2020-05-09 20:21:56', NULL),
(63, 28, 27, '来自于聊友:10028师徒奖励红包:', '9.00', 1, 1, '2020-05-09 20:22:01', 98),
(64, 29, 27, '来自于聊友:10029师徒奖励红包:', '3.00', 1, 1, '2020-05-09 20:22:01', 98),
(65, 28, 27, '来自于聊友:10028师徒奖励红包:', '6.00', 1, 1, '2020-05-09 20:22:22', 99),
(66, 29, 27, '来自于聊友:10029师徒奖励红包:', '2.00', 1, 1, '2020-05-09 20:22:22', 99),
(67, 28, 27, '来自于聊友:10028师徒奖励红包:', '18.00', 1, 1, '2020-05-09 20:22:25', 100),
(68, 29, 27, '来自于聊友:10029师徒奖励红包:', '6.00', 1, 1, '2020-05-09 20:22:25', 100),
(69, 28, 27, '来自于聊友:10028师徒奖励红包:', '6.00', 1, 1, '2020-05-09 20:22:29', 101),
(70, 29, 27, '来自于聊友:10029师徒奖励红包:', '2.00', 1, 1, '2020-05-09 20:22:29', 101),
(71, 28, 27, '来自于聊友:10028师徒奖励红包:', '45.00', 1, 1, '2020-05-09 20:22:32', 102),
(72, 29, 27, '来自于聊友:10029师徒奖励红包:', '15.00', 1, 1, '2020-05-09 20:22:32', 102),
(73, 28, 27, '来自于聊友:10028师徒奖励红包:', '39.00', 1, 1, '2020-05-09 20:22:41', 103),
(74, 29, 27, '来自于聊友:10029师徒奖励红包:', '13.00', 1, 1, '2020-05-09 20:22:41', 103),
(75, 28, 27, '来自于聊友:10028师徒奖励红包:', '3.00', 1, 1, '2020-05-09 20:23:08', 104),
(76, 29, 27, '来自于聊友:10029师徒奖励红包:', '1.00', 1, 1, '2020-05-09 20:23:08', 104),
(77, 15, 28, '官方赠送[10000]个金币!', '10000.00', 1, 3, '2020-05-09 20:23:24', NULL),
(78, 15, 28, '官方赠送[10000]个金币!', '10000.00', 1, 3, '2020-05-09 20:23:35', NULL),
(79, 28, 27, '来自于聊友:10028师徒奖励红包:', '27.00', 1, 1, '2020-05-09 20:24:06', 105),
(80, 31, 27, '来自于聊友:10031师徒奖励红包:', '9.00', 1, 1, '2020-05-09 20:24:06', 105),
(81, 28, 27, '来自于聊友:10028师徒奖励红包:', '4.50', 1, 1, '2020-05-09 20:24:34', 106),
(82, 31, 27, '来自于聊友:10031师徒奖励红包:', '1.50', 1, 1, '2020-05-09 20:24:34', 106),
(83, 28, 27, '来自于聊友:10028师徒奖励红包:', '4.50', 1, 1, '2020-05-09 20:25:16', 107),
(84, 31, 27, '来自于聊友:10031师徒奖励红包:', '1.50', 1, 1, '2020-05-09 20:25:16', 107),
(85, 28, 27, '来自于聊友:10028师徒奖励红包:', '45.00', 1, 1, '2020-05-09 20:25:55', 108),
(86, 31, 27, '来自于聊友:10031师徒奖励红包:', '15.00', 1, 1, '2020-05-09 20:25:55', 108),
(87, 28, 27, '来自于聊友:10028师徒奖励红包:', '1333.20', 1, 1, '2020-05-09 20:26:02', 109),
(88, 31, 27, '来自于聊友:10031师徒奖励红包:', '444.40', 1, 1, '2020-05-09 20:26:02', 109),
(89, 28, 27, '来自于聊友:10028师徒奖励红包:', '4.50', 1, 1, '2020-05-09 20:26:10', 110),
(90, 31, 27, '来自于聊友:10031师徒奖励红包:', '1.50', 1, 1, '2020-05-09 20:26:10', 110),
(91, 32, 289, '来自于聊友:10032师徒奖励红包:', '10.00', 0, 1, '2020-05-10 01:26:18', 111),
(92, 28, 27, '来自于聊友:10028师徒奖励红包:', '75.00', 1, 1, '2020-05-10 15:14:02', 116),
(93, 31, 27, '来自于聊友:10031师徒奖励红包:', '25.00', 1, 1, '2020-05-10 15:14:02', 116),
(94, 28, 27, '来自于聊友:10028师徒奖励红包:', '75.00', 1, 1, '2020-05-10 15:14:09', 117),
(95, 28, 27, '来自于聊友:10028师徒奖励红包:', '6.00', 1, 1, '2020-05-10 15:14:22', 118),
(96, 28, 27, '来自于聊友:10028师徒奖励红包:', '4.50', 1, 1, '2020-05-10 15:15:48', 119),
(97, 31, 27, '来自于聊友:10031师徒奖励红包:', '1.50', 1, 1, '2020-05-10 15:15:48', 119),
(98, 28, 27, '来自于聊友:10028师徒奖励红包:', '78.00', 1, 1, '2020-05-11 01:12:43', 120),
(99, 28, 27, '来自于聊友:10028师徒奖励红包:', '18.00', 1, 1, '2020-05-11 01:12:49', 121),
(100, 28, 27, '来自于聊友:10028师徒奖励红包:', '433.20', 1, 1, '2020-05-11 01:12:53', 122),
(101, 28, 27, '来自于聊友:10028师徒奖励红包:', '30.00', 1, 1, '2020-05-11 01:12:57', 123),
(102, 37, 289, '来自于聊友:10037师徒奖励红包:', '10.00', 0, 1, '2020-05-11 12:54:11', 124),
(103, 31, 27, '来自于聊友:10031师徒奖励红包:', '1.50', 1, 1, '2020-05-11 13:20:29', 127),
(104, 28, 27, '来自于聊友:10028师徒奖励红包:', '75.00', 1, 1, '2020-05-11 13:23:30', 130),
(105, 39, 37, '来自于十三师徒奖励红包:', '25.00', 1, 1, '2020-05-11 13:23:30', 130),
(106, 31, 27, '来自于聊友:10031师徒奖励红包:', '45.00', 1, 1, '2020-05-11 13:30:48', 131),
(107, 39, 37, '来自于十三师徒奖励红包:', '15.00', 1, 1, '2020-05-11 13:30:48', 131),
(108, 31, 27, '来自于聊友:10031师徒奖励红包:', '75.00', 1, 1, '2020-05-11 13:30:53', 132),
(109, 39, 37, '来自于十三师徒奖励红包:', '25.00', 1, 1, '2020-05-11 13:30:53', 132),
(110, 28, 27, '来自于聊友:10028师徒奖励红包:', '4.50', 1, 1, '2020-05-11 13:32:15', 133),
(111, 31, 27, '来自于聊友:10031师徒奖励红包:', '1.50', 1, 1, '2020-05-11 13:32:15', 133),
(112, 15, 35, '官方赠送[1000]个金币!', '1000.00', 1, 3, '2020-05-11 13:35:25', NULL),
(113, 15, 35, '官方赠送[1000]个金币!', '1000.00', 1, 3, '2020-05-11 13:36:20', NULL),
(114, 15, 35, '官方赠送[100]个金币!', '100.00', 1, 3, '2020-05-11 13:36:50', NULL),
(115, 15, 35, '官方赠送[200]个金币!', '200.00', 1, 3, '2020-05-11 13:37:41', NULL),
(116, 15, 35, '官方赠送[1000]个金币!', '1000.00', 1, 3, '2020-05-11 13:41:43', NULL),
(117, 15, 35, '官方赠送[1000]个金币!', '1000.00', 1, 3, '2020-05-11 13:43:31', NULL),
(118, 39, 37, '来自于十三师徒奖励红包:', '2.00', 1, 1, '2020-05-11 13:47:49', 135),
(119, 15, 30, '官方赠送[2000]个金币!', '2000.00', 1, 3, '2020-05-11 13:48:10', NULL),
(120, 39, 37, '来自于十三师徒奖励红包:', '2.00', 1, 1, '2020-05-11 13:48:11', 136),
(121, 39, 37, '来自于十三师徒奖励红包:', '2.00', 1, 1, '2020-05-11 13:56:07', 138),
(122, 39, 37, '来自于十三师徒奖励红包:', '2.00', 1, 1, '2020-05-11 13:56:30', 139),
(123, 39, 37, '来自于十三师徒奖励红包:', '2.00', 1, 1, '2020-05-11 13:57:10', 140),
(124, 39, 37, '来自于十三师徒奖励红包:', '2.00', 1, 1, '2020-05-11 13:59:00', 141),
(125, 30, 27, '来自于聊友:10030师徒奖励红包:', '25.00', 1, 1, '2020-05-11 14:01:35', 142),
(126, 30, 28, '来自于聊友:10030师徒奖励红包:', '75.00', 1, 1, '2020-05-11 14:01:35', 142),
(127, 39, 37, '来自于十三师徒奖励红包:', '4.00', 1, 1, '2020-05-11 14:06:16', 143),
(128, 28, 27, '来自于聊友:10028师徒奖励红包:', '6.00', 1, 1, '2020-05-11 14:07:19', 144),
(129, 39, 37, '来自于十三师徒奖励红包:', '2.00', 1, 1, '2020-05-11 14:07:19', 144),
(130, 44, 35, '来自于聊友:10044师徒奖励红包:', '10.00', 1, 1, '2020-05-11 14:45:54', 145),
(131, 46, 35, '来自于聊友:10046师徒奖励红包:', '10.00', 1, 1, '2020-05-11 15:32:34', 149),
(132, 47, 35, '来自于聊友:10047师徒奖励红包:', '10.00', 1, 1, '2020-05-11 15:42:19', 150),
(133, 48, 35, '来自于聊友:10048师徒奖励红包:', '10.00', 1, 1, '2020-05-11 15:54:44', 152),
(134, 51, 35, '来自于聊友:10051师徒奖励红包:', '10.00', 1, 1, '2020-05-11 23:09:15', 157),
(135, 54, 42, '来自于聊友:10054师徒奖励红包:', '10.00', 1, 1, '2020-05-12 03:45:44', 160),
(136, 30, 27, '来自于聊友:10030师徒奖励红包:', '2.00', 1, 1, '2020-05-12 11:09:17', 162),
(137, 30, 28, '来自于聊友:10030师徒奖励红包:', '6.00', 1, 1, '2020-05-12 11:09:17', 162),
(138, 56, 37, '来自于聊友:10056师徒奖励红包:', '1.20', 1, 1, '2020-05-12 11:09:17', 162),
(139, 56, 39, '来自于聊友:10056师徒奖励红包:', '2.00', 1, 1, '2020-05-12 11:09:17', 162),
(140, 59, 35, '来自于聊友:10059师徒奖励红包:', '10.00', 1, 1, '2020-05-12 13:21:59', 164),
(141, 60, 35, '来自于聊友:10060师徒奖励红包:', '10.00', 1, 1, '2020-05-12 13:59:07', 165),
(142, 30, 27, '来自于聊友:10030师徒奖励红包:', '6.00', 1, 1, '2020-05-12 16:00:31', 170),
(143, 30, 28, '来自于聊友:10030师徒奖励红包:', '18.00', 1, 1, '2020-05-12 16:00:31', 170),
(144, 53, 37, '来自于聊友:10053师徒奖励红包:', '3.60', 1, 1, '2020-05-12 16:00:31', 170),
(145, 53, 39, '来自于聊友:10053师徒奖励红包:', '6.00', 1, 1, '2020-05-12 16:00:31', 170),
(146, 30, 27, '来自于聊友:10030师徒奖励红包:', '2.00', 1, 1, '2020-05-12 16:05:21', 171),
(147, 30, 28, '来自于聊友:10030师徒奖励红包:', '6.00', 1, 1, '2020-05-12 16:05:21', 171),
(148, 53, 37, '来自于聊友:10053师徒奖励红包:', '1.20', 1, 1, '2020-05-12 16:05:21', 171),
(149, 53, 39, '来自于聊友:10053师徒奖励红包:', '2.00', 1, 1, '2020-05-12 16:05:21', 171),
(150, 30, 27, '来自于聊友:10030师徒奖励红包:', '2.00', 1, 1, '2020-05-12 16:05:25', 172),
(151, 30, 28, '来自于聊友:10030师徒奖励红包:', '6.00', 1, 1, '2020-05-12 16:05:25', 172),
(152, 53, 37, '来自于聊友:10053师徒奖励红包:', '1.20', 1, 1, '2020-05-12 16:05:25', 172),
(153, 53, 39, '来自于聊友:10053师徒奖励红包:', '2.00', 1, 1, '2020-05-12 16:05:25', 172),
(154, 30, 27, '来自于聊友:10030师徒奖励红包:', '6.00', 1, 1, '2020-05-12 16:05:30', 173),
(155, 30, 28, '来自于聊友:10030师徒奖励红包:', '18.00', 1, 1, '2020-05-12 16:05:30', 173),
(156, 53, 37, '来自于聊友:10053师徒奖励红包:', '3.60', 1, 1, '2020-05-12 16:05:30', 173),
(157, 53, 39, '来自于聊友:10053师徒奖励红包:', '6.00', 1, 1, '2020-05-12 16:05:30', 173),
(158, 30, 27, '来自于聊友:10030师徒奖励红包:', '2.00', 1, 1, '2020-05-12 16:05:43', 174),
(159, 30, 28, '来自于聊友:10030师徒奖励红包:', '6.00', 1, 1, '2020-05-12 16:05:43', 174),
(160, 53, 37, '来自于聊友:10053师徒奖励红包:', '1.20', 1, 1, '2020-05-12 16:05:43', 174),
(161, 53, 39, '来自于聊友:10053师徒奖励红包:', '2.00', 1, 1, '2020-05-12 16:05:43', 174),
(162, 30, 27, '来自于聊友:10030师徒奖励红包:', '2.00', 1, 1, '2020-05-12 16:05:49', 175),
(163, 30, 28, '来自于聊友:10030师徒奖励红包:', '6.00', 1, 1, '2020-05-12 16:05:49', 175),
(164, 53, 37, '来自于聊友:10053师徒奖励红包:', '1.20', 1, 1, '2020-05-12 16:05:49', 175),
(165, 53, 39, '来自于聊友:10053师徒奖励红包:', '2.00', 1, 1, '2020-05-12 16:05:49', 175),
(166, 30, 27, '来自于聊友:10030师徒奖励红包:', '4.00', 1, 1, '2020-05-12 16:07:19', 176),
(167, 30, 28, '来自于聊友:10030师徒奖励红包:', '12.00', 1, 1, '2020-05-12 16:07:19', 176),
(168, 53, 37, '来自于聊友:10053师徒奖励红包:', '2.40', 1, 1, '2020-05-12 16:07:19', 176),
(169, 53, 39, '来自于聊友:10053师徒奖励红包:', '4.00', 1, 1, '2020-05-12 16:07:19', 176),
(170, 53, 37, '来自于聊友:10053师徒奖励红包:', '1.20', 1, 1, '2020-05-13 01:21:45', 181),
(171, 53, 39, '来自于聊友:10053师徒奖励红包:', '2.00', 1, 1, '2020-05-13 01:21:45', 181),
(172, 65, 35, '来自于聊友:10065师徒奖励红包:', '10.00', 1, 1, '2020-05-13 14:13:09', 187),
(173, 66, 35, '来自于聊友:10066师徒奖励红包:', '10.00', 1, 1, '2020-05-13 16:16:38', 192),
(174, 67, 35, '来自于聊友:10067师徒奖励红包:', '10.00', 1, 1, '2020-05-13 16:17:11', 193),
(175, 15, 66, '官方赠送[30]个金币!', '30.00', 1, 3, '2020-05-13 19:52:49', NULL),
(176, 15, 66, '官方赠送[270]个金币!', '270.00', 1, 3, '2020-05-13 19:53:51', NULL),
(177, 66, 35, '来自于聊友:10066师徒奖励红包:', '48.00', 1, 1, '2020-05-13 20:18:47', 199),
(178, 53, 37, '来自于聊友:10053师徒奖励红包:', '9.60', 0, 1, '2020-05-13 20:18:47', 199),
(179, 53, 39, '来自于聊友:10053师徒奖励红包:', '16.00', 1, 1, '2020-05-13 20:18:47', 199),
(180, 70, 35, '来自于聊友:10070师徒奖励红包:', '10.00', 1, 1, '2020-05-14 17:29:50', 205),
(181, 71, 30, '来自于聊友:10071师徒奖励红包:', '10.00', 1, 1, '2020-05-14 17:33:28', 206),
(182, 72, 289, '来自于聊友:10072师徒奖励红包:', '10.00', 0, 1, '2020-05-15 00:53:12', 209),
(183, 73, 35, '来自于聊友:10073师徒奖励红包:', '10.00', 1, 1, '2020-05-15 10:39:41', 214),
(184, 76, 37, '来自于聊友:10076师徒奖励红包:', '2.40', 0, 1, '2020-05-15 20:56:55', 219),
(185, 76, 39, '来自于聊友:10076师徒奖励红包:', '4.00', 1, 1, '2020-05-15 20:56:55', 219),
(186, 81, 27, '来自于聊友:10081师徒奖励红包:', '10.00', 0, 1, '2020-05-20 02:40:27', 234),
(187, 83, 289, '来自于聊友:10083师徒奖励红包:', '10.00', 0, 1, '2020-05-22 20:47:15', 235),
(188, 84, 35, '来自于聊友:10084师徒奖励红包:', '10.00', 1, 1, '2020-05-24 15:25:36', 236),
(189, 85, 35, '来自于聊友:10085师徒奖励红包:', '10.00', 1, 1, '2020-05-25 15:50:01', 238),
(190, 15, 87, '官方赠送[10000]个金币!', '10000.00', 1, 3, '2020-06-13 16:25:33', NULL),
(191, 15, 87, '官方赠送[10000]个金币!', '10000.00', 1, 3, '2020-06-13 16:26:49', NULL),
(192, 15, 87, '官方赠送[100]个金币!', '100.00', 1, 3, '2020-06-13 16:27:04', NULL),
(193, 15, 87, '官方赠送[200]个金币!', '200.00', 1, 3, '2020-06-13 16:27:50', NULL),
(194, 15, 87, '官方赠送[1000]个金币!', '1000.00', 1, 3, '2020-06-13 16:28:49', NULL),
(195, 90, 28, '来自于聊友:10090师徒奖励红包:', '10.00', 1, 1, '2020-06-13 17:07:55', 242),
(196, 52, 37, '来自于琪琪师徒奖励红包:', '9.00', 0, 1, '2020-06-16 15:28:49', 248),
(197, 52, 39, '来自于琪琪师徒奖励红包:', '15.00', 0, 1, '2020-06-16 15:28:49', 248),
(198, 15, 96, '官方赠送[100000]个金币!', '100000.00', 1, 3, '2020-06-21 00:15:40', NULL),
(199, 15, 97, '官方赠送[100]个金币!', '100.00', 1, 3, '2020-06-22 00:15:11', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `t_report`
--

CREATE TABLE IF NOT EXISTS `t_report` (
  `t_id` int(11) NOT NULL,
  `t_user_id` int(11) DEFAULT NULL,
  `t_cover_user_id` int(11) DEFAULT NULL,
  `t_comment` varchar(255) DEFAULT NULL,
  `t_img` varchar(500) DEFAULT NULL,
  `t_create_time` datetime DEFAULT NULL,
  `t_is_handle` int(11) DEFAULT NULL COMMENT '0.未处理\r\n1.已处理\r\n',
  `t_handle_comment` varchar(255) DEFAULT NULL,
  `t_handle_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `t_role`
--

CREATE TABLE IF NOT EXISTS `t_role` (
  `t_id` int(11) NOT NULL,
  `t_role_name` varchar(50) DEFAULT NULL,
  `t_enable` int(11) DEFAULT NULL COMMENT '0.启用1.禁用',
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_role`
--

INSERT INTO `t_role` (`t_id`, `t_role_name`, `t_enable`, `t_create_time`) VALUES
(1, '管理员', 0, '2018-08-03 14:26:45'),
(14, '合伙人', 0, '2020-06-18 18:06:18');

-- --------------------------------------------------------

--
-- 表的结构 `t_room_time`
--

CREATE TABLE IF NOT EXISTS `t_room_time` (
  `t_id` int(11) NOT NULL,
  `t_room_id` int(11) DEFAULT NULL,
  `t_call_user_id` int(11) DEFAULT NULL COMMENT '用户编号',
  `t_answer_user_id` int(11) DEFAULT NULL COMMENT '主播编号',
  `t_chatType` int(1) DEFAULT '1' COMMENT '1:视频 2:语音(默认视频)',
  `t_an_vi_gold` decimal(11,2) DEFAULT NULL,
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `t_send_sentence`
--

CREATE TABLE IF NOT EXISTS `t_send_sentence` (
  `t_id` int(11) NOT NULL,
  `t_user_id` int(11) DEFAULT NULL COMMENT '用户Id',
  `t_sentence_content` varchar(255) DEFAULT NULL COMMENT '发送内容',
  `t_sentence_type` int(2) DEFAULT '0' COMMENT '0:文字 1:图片 2:语音 3:视频 4:视频弹窗 5:语音弹窗 ',
  `t_sentence_time` int(5) DEFAULT '60' COMMENT '距离上一次的发送时间间隔,默认60s',
  `t_create_time` datetime DEFAULT NULL,
  `t_sort` int(5) DEFAULT '99' COMMENT '消息顺序',
  `t_sentence_id` int(11) DEFAULT NULL COMMENT 't_sentence 主键ID',
  `t_sentence_param` varchar(255) DEFAULT '' COMMENT '附加参数'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='语句----术语';

--
-- 转存表中的数据 `t_send_sentence`
--

INSERT INTO `t_send_sentence` (`t_id`, `t_user_id`, `t_sentence_content`, `t_sentence_type`, `t_sentence_time`, `t_create_time`, `t_sort`, `t_sentence_id`, `t_sentence_param`) VALUES
(1, 14, '小哥哥有空吗 来视频啊', 0, 60, '2020-05-03 17:20:20', 99, 1, '0'),
(2, 33, '小哥哥 有时间吗 视频聊天', 0, 60, '2020-05-10 11:24:26', 99, 3, '0'),
(3, 36, '小哥哥  在吗？我很好得一得就能得到', 0, 60, '2020-05-11 01:15:09', 99, 4, '0'),
(4, 53, '小哥哥我想和你聊天 嘻嘻', 0, 120, '2020-05-12 16:17:39', 99, 5, '0'),
(5, 50, '哥哥：你好！', 0, 60, '2020-06-18 17:47:45', 99, 6, '0');

-- --------------------------------------------------------

--
-- 表的结构 `t_sentence`
--

CREATE TABLE IF NOT EXISTS `t_sentence` (
  `t_id` int(11) NOT NULL,
  `t_create_time` datetime DEFAULT NULL,
  `t_send_type` int(1) DEFAULT '0' COMMENT '0:主播特定语术 1:通用语术(主播未设置语术,则用此语术)'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='语术-主表';

--
-- 转存表中的数据 `t_sentence`
--

INSERT INTO `t_sentence` (`t_id`, `t_create_time`, `t_send_type`) VALUES
(1, '2020-05-03 17:20:20', 0),
(2, '2020-05-04 14:33:54', 0),
(3, '2020-05-10 11:24:26', 0),
(4, '2020-05-11 01:15:09', 0),
(5, '2020-05-12 16:17:39', 0),
(6, '2020-06-18 17:47:45', 0);

-- --------------------------------------------------------

--
-- 表的结构 `t_set_meal`
--

CREATE TABLE IF NOT EXISTS `t_set_meal` (
  `t_id` int(11) NOT NULL,
  `t_project_type` int(11) DEFAULT NULL COMMENT '1.充值\r\n2.提现',
  `t_gold` int(11) DEFAULT NULL,
  `t_money` decimal(7,2) DEFAULT NULL,
  `t_end_type` int(11) DEFAULT NULL COMMENT '0.Android 1.phone',
  `t_is_enable` int(11) DEFAULT NULL COMMENT '0.启用\r\n1.停用',
  `t_create_time` datetime DEFAULT NULL,
  `t_describe` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_set_meal`
--

INSERT INTO `t_set_meal` (`t_id`, `t_project_type`, `t_gold`, `t_money`, `t_end_type`, `t_is_enable`, `t_create_time`, `t_describe`) VALUES
(1, 1, 300, '30.00', -1, 0, '2018-06-11 14:01:55', ''),
(5, 2, 1000, '100.00', -1, 0, '2018-06-11 14:04:14', ''),
(6, 2, 5000, '500.00', -1, 0, '2018-06-11 14:04:35', ''),
(21, 2, 8400, '800.00', -1, 0, '2018-09-04 14:40:22', ''),
(31, 1, 500, '50.00', -1, 0, '2019-02-20 17:01:22', ''),
(32, 1, 10000, '999.00', -1, 0, '2019-02-20 17:01:31', '赠送300币'),
(33, 1, 20000, '1999.00', -1, 0, '2019-02-22 09:43:33', '赠送600金币'),
(39, 2, 2000, '200.00', -1, 0, '2019-03-12 22:06:38', ''),
(40, 1, 58, '0.01', -1, 0, '2019-03-13 09:40:37', ''),
(46, 1, 1000, '99.00', -1, 0, '2019-09-01 14:35:22', '赠送20金币'),
(48, 1, 3000, '299.00', -1, 0, '2019-09-08 21:48:12', '赠送100币'),
(53, 1, 30000, '2999.00', -1, 0, '2019-09-08 21:50:44', '赠送1000币'),
(55, 2, 10500, '1000.00', -1, 0, '2019-09-08 21:55:54', ''),
(57, 2, 15750, '1500.00', -1, 0, '2019-09-08 21:56:25', ''),
(58, 2, 21000, '2000.00', -1, 0, '2019-09-08 21:56:51', ''),
(59, 2, 31500, '3000.00', -1, 0, '2019-09-08 21:57:40', ''),
(60, 2, 5000, '500.00', -2, 0, '2020-01-05 16:45:28', ''),
(61, 2, 500, '50.00', -1, 0, '2020-02-17 18:56:11', ''),
(62, 1, 6000, '599.00', -1, 0, '2020-02-18 15:31:18', '赠送200金币'),
(63, 2, 2000, '200.00', -2, 0, '2020-05-03 15:19:07', '');

-- --------------------------------------------------------

--
-- 表的结构 `t_share_notes`
--

CREATE TABLE IF NOT EXISTS `t_share_notes` (
  `t_id` int(11) NOT NULL,
  `t_user_id` int(11) DEFAULT NULL,
  `t_target` int(11) DEFAULT NULL COMMENT '0.QQ群\r\n1.微信群',
  `t_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `t_simulation`
--

CREATE TABLE IF NOT EXISTS `t_simulation` (
  `t_id` int(11) NOT NULL,
  `t_centent` varchar(255) DEFAULT NULL,
  `t_sex` int(11) DEFAULT NULL,
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_simulation`
--

INSERT INTO `t_simulation` (`t_id`, `t_centent`, `t_sex`, `t_create_time`) VALUES
(1, '你好，在干什么呢？', 1, '2018-12-13 09:55:23'),
(8, '这会有空吗', 1, '2019-11-15 09:38:48'),
(9, '方便视频吗', 1, '2019-11-15 09:38:57'),
(11, '你好，我觉得朋友之间应该互相信任', 1, '2020-01-08 17:34:25'),
(12, '小哥哥 在干嘛呢 来撩一下嘛', 1, '2020-05-03 16:44:05'),
(13, '你可以陪陪我吗？', 1, '2020-05-03 16:44:25'),
(14, '你长的这么好看 就不能和我聊一下天吗', 1, '2020-05-03 16:44:54'),
(15, '如果一个人无聊 我愿意陪你哦', 1, '2020-05-03 16:45:42'),
(16, '很听话的哦', 1, '2020-05-03 16:47:06'),
(17, '你好、可以一起聊会天吗？', 1, '2020-06-18 17:39:26'),
(18, '今天穿的有点性格，来嘛！', 1, '2020-06-18 17:44:03'),
(19, '我虽然不是奥利奥，但是可以泡一泡！', 1, '2020-06-18 17:45:10'),
(20, '哥哥我拍你玩吧，快给我打视频呀!', 1, '2020-06-18 17:45:45'),
(21, '哥哥第一次玩吗~要不我教你玩好不好', 1, '2020-06-18 17:46:27');

-- --------------------------------------------------------

--
-- 表的结构 `t_sms_steup`
--

CREATE TABLE IF NOT EXISTS `t_sms_steup` (
  `t_id` int(11) NOT NULL,
  `appid` varchar(100) DEFAULT NULL,
  `appkey` varchar(255) DEFAULT NULL,
  `templateId` varchar(200) DEFAULT NULL,
  `smsSign` varchar(50) DEFAULT NULL,
  `t_is_enable` int(11) DEFAULT NULL COMMENT '0.启用1.停用',
  `t_platform_type` int(11) DEFAULT NULL COMMENT '0.腾讯云1.阿里云3.网易云',
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_sms_steup`
--

INSERT INTO `t_sms_steup` (`t_id`, `appid`, `appkey`, `templateId`, `smsSign`, `t_is_enable`, `t_platform_type`, `t_create_time`) VALUES
(1, 'LTAI4FybWJMAX3MC5V2hVPfR', 'cjDiqk5EHpmERioNyfaMjLZYDNuzYC', 'SMS_188990256', '随聊', 0, 1, '2020-04-29 18:38:06');

-- --------------------------------------------------------

--
-- 表的结构 `t_speeddating`
--

CREATE TABLE IF NOT EXISTS `t_speeddating` (
  `t_id` int(11) NOT NULL,
  `t_user_id` int(11) DEFAULT NULL,
  `t_begin_time` datetime DEFAULT NULL,
  `t_end_time` datetime DEFAULT NULL,
  `t_duration` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_speeddating`
--

INSERT INTO `t_speeddating` (`t_id`, `t_user_id`, `t_begin_time`, `t_end_time`, `t_duration`) VALUES
(1, 2, '2020-04-28 22:54:05', '2020-04-28 22:54:20', 15);

-- --------------------------------------------------------

--
-- 表的结构 `t_speed_manage`
--

CREATE TABLE IF NOT EXISTS `t_speed_manage` (
  `t_id` int(11) NOT NULL,
  `t_user_id` int(11) DEFAULT NULL,
  `t_begin_time` varchar(10) DEFAULT NULL,
  `t_end_time` varchar(10) DEFAULT NULL,
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `t_speed_manage`
--

INSERT INTO `t_speed_manage` (`t_id`, `t_user_id`, `t_begin_time`, `t_end_time`, `t_create_time`) VALUES
(1, 16, '13:00', '17:00', '2020-05-04 14:22:14');

-- --------------------------------------------------------

--
-- 表的结构 `t_spread`
--

CREATE TABLE IF NOT EXISTS `t_spread` (
  `t_id` int(11) NOT NULL,
  `t_user_id` int(11) DEFAULT NULL,
  `t_is_nominate` int(11) DEFAULT NULL,
  `t_sort` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `t_spread_award`
--

CREATE TABLE IF NOT EXISTS `t_spread_award` (
  `t_id` int(11) NOT NULL,
  `t_gold` int(11) DEFAULT NULL,
  `t_sex` int(11) DEFAULT NULL COMMENT '0.女\r\n1.男',
  `t_rank` int(11) DEFAULT NULL COMMENT '1.一级推广\r\n2.二级推广'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_spread_award`
--

INSERT INTO `t_spread_award` (`t_id`, `t_gold`, `t_sex`, `t_rank`) VALUES
(1, 10, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `t_spread_channel`
--

CREATE TABLE IF NOT EXISTS `t_spread_channel` (
  `t_id` int(11) NOT NULL,
  `t_user_id` int(11) DEFAULT NULL,
  `t_real_name` varchar(20) DEFAULT NULL,
  `t_settlement_type` int(11) DEFAULT NULL COMMENT '0.支付宝\r\n1.中国工商银行\r\n2.中国农业银行\r\n3.中国银行\r\n4.中国建设银行',
  `t_bank` varchar(50) DEFAULT NULL,
  `t_weixin` varchar(100) DEFAULT NULL,
  `t_qq` varchar(20) DEFAULT NULL,
  `t_phone` varchar(11) DEFAULT NULL,
  `t_gold_proportions` int(11) DEFAULT NULL,
  `t_vip_proportions` int(11) DEFAULT NULL,
  `t_spread_id` int(11) DEFAULT NULL,
  `t_spread_type` int(11) DEFAULT NULL COMMENT '0.正常 1.已下架',
  `t_create_time` datetime DEFAULT NULL,
  `t_short_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `t_spreed_img`
--

CREATE TABLE IF NOT EXISTS `t_spreed_img` (
  `t_id` int(11) NOT NULL,
  `t_img_path` varchar(255) DEFAULT NULL,
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_spreed_img`
--

INSERT INTO `t_spreed_img` (`t_id`, `t_img_path`, `t_create_time`) VALUES
(20, '20200510/202005100909589494.png', '2020-05-10 09:09:59');

-- --------------------------------------------------------

--
-- 表的结构 `t_style_setup`
--

CREATE TABLE IF NOT EXISTS `t_style_setup` (
  `t_id` int(11) NOT NULL,
  `t_style_name` varchar(100) DEFAULT NULL,
  `t_mark` varchar(100) DEFAULT NULL,
  `t_state` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_style_setup`
--

INSERT INTO `t_style_setup` (`t_id`, `t_style_name`, `t_mark`, `t_state`) VALUES
(1, '大图', 'one', 1),
(2, '十字', 'two', 0);

-- --------------------------------------------------------

--
-- 表的结构 `t_system_setup`
--

CREATE TABLE IF NOT EXISTS `t_system_setup` (
  `t_id` int(11) NOT NULL,
  `t_channel` varchar(255) DEFAULT NULL,
  `t_union` varchar(255) DEFAULT NULL,
  `t_take_out_count` int(11) DEFAULT NULL,
  `t_scope` int(11) DEFAULT NULL COMMENT '范围(公里)',
  `t_android_download` varchar(255) DEFAULT NULL,
  `t_ios_download` varchar(255) DEFAULT NULL,
  `t_award_rules` varchar(500) DEFAULT NULL,
  `t_system_lang_girl` varchar(500) DEFAULT NULL,
  `t_system_lang_male` varchar(500) DEFAULT NULL,
  `t_default_text` decimal(11,2) DEFAULT NULL,
  `t_default_video` decimal(11,2) DEFAULT NULL,
  `t_default_phone` decimal(11,2) DEFAULT NULL,
  `t_default_weixin` decimal(11,2) DEFAULT NULL,
  `t_service_qq` varchar(255) DEFAULT NULL,
  `t_nickname_filter` varchar(255) DEFAULT NULL,
  `t_video_hint` varchar(255) DEFAULT NULL,
  `t_first_prize` int(11) DEFAULT NULL COMMENT '首冲奖励',
  `t_spreed_hint` varchar(255) DEFAULT NULL,
  `t_default_pay` int(11) DEFAULT NULL COMMENT '是否循轮默认支付类型(1:是 0.否)',
  `t_fail_gold` int(11) DEFAULT NULL COMMENT '失效金币数',
  `t_dial_video` int(1) DEFAULT '0' COMMENT 'VIP拨打视频 0:关闭 1:打开',
  `t_answer_video` int(1) DEFAULT '0' COMMENT 'VIP接听视频 0:关闭 1:打开',
  `t_default_voice` decimal(11,2) DEFAULT '0.00' COMMENT '默认语音聊天收费',
  `t_default_qq` decimal(11,2) DEFAULT '0.00' COMMENT 'QQ查看默认收费',
  `t_false_send_video_switch` int(1) DEFAULT '1' COMMENT '虚拟主播弹视频 0：关闭  1：打开',
  `t_all_false_send_video_switch` int(1) DEFAULT '1' COMMENT '虚拟主播弹视频总开关 0：关闭  1：打开',
  `t_false_send_text_switch` int(1) DEFAULT '1' COMMENT '虚拟主播推送消息 0：关闭  1：打开',
  `t_real_send_text_switch` int(1) DEFAULT '1' COMMENT '真实主播推送消息 0：关闭  1：打开',
  `t_false_send_text_switch_count` int(2) DEFAULT '5' COMMENT '虚拟消息发送 主播数量'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_system_setup`
--

INSERT INTO `t_system_setup` (`t_id`, `t_channel`, `t_union`, `t_take_out_count`, `t_scope`, `t_android_download`, `t_ios_download`, `t_award_rules`, `t_system_lang_girl`, `t_system_lang_male`, `t_default_text`, `t_default_video`, `t_default_phone`, `t_default_weixin`, `t_service_qq`, `t_nickname_filter`, `t_video_hint`, `t_first_prize`, `t_spreed_hint`, `t_default_pay`, `t_fail_gold`, `t_dial_video`, `t_answer_video`, `t_default_voice`, `t_default_qq`, `t_false_send_video_switch`, `t_all_false_send_video_switch`, `t_false_send_text_switch`, `t_real_send_text_switch`, `t_false_send_text_switch_count`) VALUES
(1, 'mmm500005', 'http://www.baidu.com', NULL, 5, 'http://d.7short.com/5lhg', 'https://ios.llc/N6DJ2', '1、注册奖励\n   每邀请一个真实男用户注册获得10个金币，\n2、永久收益\n         你邀请的男用户充值,第一级获得消费的15%,第二级获得消费的5%;\n        邀请的女主播获得其收益的5%,第二级获得收益的3%。', '您好，欢迎女神', '你好。欢迎男神', '2.00', '40.00', '500.00', '300.00', '2057611563', '招主播,加QQ加微信,伟兴、威信、人少、', '平台倡导绿色直播，严禁在直播中发布色情、暴力、政治、欺诈等敏感信息', 10, '平台倡导绿色直播，严禁在直播中发布色情、暴力、政治、欺诈等敏感信息，违者将严肃处理，网警24小时在线巡查！', 0, 5, 0, 0, '50.00', '300.00', 0, 0, 1, 0, 5);

-- --------------------------------------------------------

--
-- 表的结构 `t_user`
--

CREATE TABLE IF NOT EXISTS `t_user` (
  `t_id` int(11) NOT NULL,
  `t_idcard` int(11) DEFAULT NULL,
  `t_nickName` varchar(100) CHARACTER SET utf8mb4 DEFAULT '',
  `t_sex` int(11) DEFAULT NULL COMMENT '0.女\r\n1.男',
  `t_age` int(11) DEFAULT '18',
  `t_handImg` varchar(200) DEFAULT NULL,
  `t_cover_img` varchar(255) DEFAULT NULL COMMENT '封面图片',
  `t_phone` varchar(11) DEFAULT '',
  `t_height` int(11) DEFAULT NULL,
  `t_weight` float DEFAULT NULL,
  `t_constellation` varchar(50) DEFAULT NULL,
  `t_city` varchar(50) DEFAULT NULL,
  `t_synopsis` varchar(200) DEFAULT NULL,
  `t_autograph` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `t_vocation` varchar(40) DEFAULT NULL,
  `t_create_time` datetime DEFAULT NULL,
  `t_referee` int(11) DEFAULT NULL,
  `t_role` int(11) DEFAULT NULL COMMENT '0.普通用户\r\n1.主播2.cps代理',
  `t_disable` int(11) DEFAULT NULL COMMENT '0.正常\r\n1.封号\r\n2.禁用',
  `t_login_time` datetime DEFAULT NULL,
  `t_open_id` varchar(200) DEFAULT NULL,
  `t_qq_open_id` varchar(200) DEFAULT NULL,
  `t_pass_wrod` varchar(200) DEFAULT NULL,
  `t_is_vip` int(11) DEFAULT '1' COMMENT '0.是\r\n1.否',
  `t_browse_sum` int(11) DEFAULT NULL,
  `t_onLine` int(11) DEFAULT NULL COMMENT '0.在线\r\n1.离线',
  `t_weixin` varchar(255) DEFAULT NULL,
  `t_qq` varchar(64) DEFAULT NULL COMMENT 'QQ',
  `t_alipay_id` varchar(100) DEFAULT NULL,
  `t_online_setup` int(11) DEFAULT NULL,
  `t_is_not_disturb` int(11) DEFAULT '1' COMMENT '视频接听: 0.关闭1.打开',
  `t_voice_switch` int(11) DEFAULT '1' COMMENT '语音聊天开关 0:关闭 1:打开',
  `t_text_switch` int(11) DEFAULT '1' COMMENT '文字聊天开关 0:关闭 1:打开',
  `t_token` varchar(64) DEFAULT NULL COMMENT '用户认证token'
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_user`
--

INSERT INTO `t_user` (`t_id`, `t_idcard`, `t_nickName`, `t_sex`, `t_age`, `t_handImg`, `t_cover_img`, `t_phone`, `t_height`, `t_weight`, `t_constellation`, `t_city`, `t_synopsis`, `t_autograph`, `t_vocation`, `t_create_time`, `t_referee`, `t_role`, `t_disable`, `t_login_time`, `t_open_id`, `t_qq_open_id`, `t_pass_wrod`, `t_is_vip`, `t_browse_sum`, `t_onLine`, `t_weixin`, `t_qq`, `t_alipay_id`, `t_online_setup`, `t_is_not_disturb`, `t_voice_switch`, `t_text_switch`, `t_token`) VALUES
(96, 10096, '聊友:10096', 1, 18, NULL, NULL, '15971586257', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-21 00:11:38', 0, 0, 0, '2020-06-22 10:44:18', NULL, NULL, 'A1BA7034837575EE8F2C7BF204C9770A', 0, 959, 2, NULL, NULL, NULL, NULL, 1, 1, 1, 'ff30541f3b8f444da5264c7a8f362507'),
(97, 10097, '聊友:10097', 0, 18, 'https://qism-1251436363.cos.ap-guangzhou.myqcloud.com/backstage/20200622/202006221212298101.jpg', NULL, '13477801499', 160, 40, '白羊座', '北京', NULL, NULL, '模特', '2020-06-21 13:02:44', 0, 1, 0, '2020-06-22 14:18:22', NULL, NULL, 'A1BA7034837575EE8F2C7BF204C9770A', 1, 5, 2, NULL, NULL, NULL, NULL, 1, 1, 1, 'fa311e10149140aba1d9aea7ee4de81a');

-- --------------------------------------------------------

--
-- 表的结构 `t_user_evaluation`
--

CREATE TABLE IF NOT EXISTS `t_user_evaluation` (
  `t_id` int(11) NOT NULL,
  `t_user_id` int(11) DEFAULT NULL,
  `t_user_hand` varchar(255) DEFAULT NULL,
  `t_user_nick` varchar(100) DEFAULT NULL,
  `t_anchor_id` int(11) DEFAULT NULL,
  `t_comment` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `t_score` int(11) DEFAULT NULL COMMENT '评价分数',
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_user_evaluation`
--

INSERT INTO `t_user_evaluation` (`t_id`, `t_user_id`, `t_user_hand`, `t_user_nick`, `t_anchor_id`, `t_comment`, `t_score`, `t_create_time`) VALUES
(1, 1, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/head/1587657286027.png', '聊友:10001', 2, '', 5, '2020-04-24 10:57:21'),
(2, 1, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/head/1587657286027.png', '聊友:10001', 2, '', 5, '2020-04-24 12:36:31'),
(3, 1, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/head/1587657286027.png', '聊友:10001', 9, '', 5, '2020-04-30 19:24:46'),
(4, 1, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/head/1587657286027.png', '聊友:10001', 9, '', 5, '2020-05-01 14:32:26'),
(5, 1, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/head/1587657286027.png', '聊友:10001', 9, '', 5, '2020-05-01 21:04:22'),
(6, 1, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/head/1587657286027.png', '聊友:10001', 9, '', 5, '2020-05-01 21:20:04'),
(7, 1, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/head/1587657286027.png', '聊友:10001', 3, '', 5, '2020-05-01 21:20:44'),
(8, 1, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/head/1587657286027.png', '聊友:10001', 9, '', 5, '2020-05-01 21:24:40'),
(9, 1, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/head/1587657286027.png', '聊友:10001', 2, '', 5, '2020-05-04 13:13:17'),
(10, 33, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200510/202005101123423632.jpg', '叶  子', 36, NULL, 98, '2020-05-11 01:09:38'),
(11, 33, 'https://yvy1-1257950478.cos.ap-chengdu.myqcloud.com/backstage/20200510/202005101123423632.jpg', '叶  子', 36, NULL, 98, '2020-05-11 01:09:38'),
(12, 30, NULL, '聊友:10030', 36, NULL, 98, '2020-05-11 01:11:02'),
(13, 37, '', '聊友:10037', 39, '', 5, '2020-05-11 13:13:39'),
(14, 35, '', '聊友:10035', 31, '', 5, '2020-05-11 13:20:33'),
(15, 35, '', '聊友:10035', 39, '', 5, '2020-05-11 13:47:52'),
(16, 35, '', '聊友:10035', 39, '', 5, '2020-05-11 13:48:12'),
(17, 35, '', '聊友:10035', 39, '', 5, '2020-05-11 13:56:08'),
(18, 35, '', '聊友:10035', 39, '', 5, '2020-05-11 13:56:32'),
(19, 35, '', '聊友:10035', 39, '', 5, '2020-05-11 13:57:12');

-- --------------------------------------------------------

--
-- 表的结构 `t_user_label`
--

CREATE TABLE IF NOT EXISTS `t_user_label` (
  `t_user_lable_id` int(11) NOT NULL,
  `t_user_id` int(11) DEFAULT NULL,
  `t_lable_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_user_label`
--

INSERT INTO `t_user_label` (`t_user_lable_id`, `t_user_id`, `t_lable_id`) VALUES
(1, 1, 21),
(8, 2, 14),
(9, 2, 15),
(12, 3, 1),
(13, 3, 14),
(10, 4, 12),
(11, 4, 15),
(16, 6, 31),
(17, 6, 32),
(14, 9, 10),
(15, 9, 16),
(18, 11, 23),
(19, 11, 28),
(20, 14, 6),
(21, 14, 7),
(22, 20, 16),
(23, 20, 17),
(24, 24, 7),
(25, 24, 14),
(26, 29, 11),
(27, 29, 15),
(30, 33, 2),
(31, 33, 14),
(28, 34, 7),
(29, 34, 17),
(32, 36, 11),
(33, 36, 15),
(34, 50, 7),
(35, 50, 8),
(36, 52, 3),
(37, 52, 17),
(38, 53, 7),
(39, 53, 16),
(40, 56, 3),
(41, 56, 6),
(42, 61, 12),
(43, 61, 14),
(44, 69, 10),
(45, 69, 11),
(46, 76, 14),
(47, 76, 16),
(48, 87, 20),
(49, 87, 33),
(50, 89, 4),
(51, 89, 8),
(52, 97, 3),
(53, 97, 7);

-- --------------------------------------------------------

--
-- 表的结构 `t_user_laud`
--

CREATE TABLE IF NOT EXISTS `t_user_laud` (
  `t_id` int(11) NOT NULL,
  `t_laud_user_id` int(11) DEFAULT NULL,
  `t_cover_user_id` int(11) DEFAULT NULL,
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_user_laud`
--

INSERT INTO `t_user_laud` (`t_id`, `t_laud_user_id`, `t_cover_user_id`, `t_create_time`) VALUES
(1, 18, 16, '2020-05-07 18:15:39'),
(2, 58, 29, '2020-05-13 09:02:51'),
(4, 89, 31, '2020-06-19 22:07:40');

-- --------------------------------------------------------

--
-- 表的结构 `t_user_sentence`
--

CREATE TABLE IF NOT EXISTS `t_user_sentence` (
  `t_id` int(11) NOT NULL,
  `t_sentence_id` int(11) DEFAULT NULL COMMENT 't_sentence 主键ID',
  `t_anchor_id` int(11) DEFAULT NULL COMMENT '主播Id',
  `t_send_user_list` text COMMENT '当天发送过的用户,第二天清零',
  `t_anchor_type` int(11) DEFAULT '0' COMMENT '0:虚拟主播 1:真实主播'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='主播-语术';

--
-- 转存表中的数据 `t_user_sentence`
--

INSERT INTO `t_user_sentence` (`t_id`, `t_sentence_id`, `t_anchor_id`, `t_send_user_list`, `t_anchor_type`) VALUES
(1, 1, 14, '', 1),
(2, 2, 16, '', 1),
(3, 3, 33, '', 0),
(4, 4, 36, '', 0),
(5, 5, 53, '', 1),
(6, 6, 50, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `t_vague_check`
--

CREATE TABLE IF NOT EXISTS `t_vague_check` (
  `t_id` int(11) NOT NULL,
  `t_img_url` varchar(200) DEFAULT NULL,
  `t_data_type` int(11) DEFAULT NULL COMMENT '0.头像图片\r\n1.封面图片\r\n2.相册图片',
  `t_user_id` int(11) DEFAULT NULL,
  `t_gold` int(11) DEFAULT NULL COMMENT '0.否\r\n1.是',
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `t_version`
--

CREATE TABLE IF NOT EXISTS `t_version` (
  `t_id` int(11) NOT NULL,
  `t_download_url` varchar(255) DEFAULT NULL,
  `t_is_new` int(11) DEFAULT NULL,
  `t_version` varchar(100) DEFAULT NULL,
  `t_version_depict` varchar(500) DEFAULT NULL,
  `t_version_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_version`
--

INSERT INTO `t_version` (`t_id`, `t_download_url`, `t_is_new`, `t_version`, `t_version_depict`, `t_version_type`) VALUES
(2, 'https://ios.llc/E6D71', 0, '2.5.3', '更新登录界面', 'ios');

-- --------------------------------------------------------

--
-- 表的结构 `t_video_record`
--

CREATE TABLE IF NOT EXISTS `t_video_record` (
  `t_id` int(11) NOT NULL,
  `t_dial_user_id` int(11) DEFAULT NULL,
  `t_answer_user_id` int(11) DEFAULT NULL,
  `t_type` int(11) DEFAULT NULL COMMENT '0.收入\r\n1.支出',
  `t_time_length` int(11) DEFAULT NULL,
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `t_vip`
--

CREATE TABLE IF NOT EXISTS `t_vip` (
  `t_id` int(11) NOT NULL,
  `t_user_id` int(11) DEFAULT NULL,
  `t_openUp_time` datetime DEFAULT NULL,
  `t_end_time` datetime DEFAULT NULL,
  `t_auto_renew` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_vip`
--

INSERT INTO `t_vip` (`t_id`, `t_user_id`, `t_openUp_time`, `t_end_time`, `t_auto_renew`) VALUES
(1, 1, '2020-04-24 10:54:46', '2061-12-24 10:54:46', NULL),
(2, 96, '2020-06-21 00:13:34', '2103-10-21 00:13:34', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `t_vip_setmeal`
--

CREATE TABLE IF NOT EXISTS `t_vip_setmeal` (
  `t_id` int(11) NOT NULL,
  `t_setmeal_name` varchar(20) DEFAULT NULL,
  `t_cost_price` decimal(10,2) DEFAULT NULL,
  `t_money` decimal(10,2) DEFAULT NULL,
  `t_gold` int(11) DEFAULT NULL,
  `t_duration` int(11) DEFAULT NULL,
  `t_is_enable` int(11) DEFAULT NULL COMMENT '0.启用\r\n1.停用',
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_vip_setmeal`
--

INSERT INTO `t_vip_setmeal` (`t_id`, `t_setmeal_name`, `t_cost_price`, `t_money`, `t_gold`, `t_duration`, `t_is_enable`, `t_create_time`) VALUES
(4, 'VIP一个月', '158.00', '88.00', 0, 1, 0, '2019-09-08 21:34:01'),
(5, 'VIP三个月', '458.00', '198.00', 0, 3, 0, '2020-05-03 17:10:36');

-- --------------------------------------------------------

--
-- 表的结构 `t_virtual`
--

CREATE TABLE IF NOT EXISTS `t_virtual` (
  `t_id` int(11) NOT NULL,
  `t_user_id` int(11) DEFAULT NULL,
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_virtual`
--

INSERT INTO `t_virtual` (`t_id`, `t_user_id`, `t_create_time`) VALUES
(1, 20, '2020-05-08 14:30:01'),
(2, 33, '2020-05-10 11:17:00'),
(3, 34, '2020-05-10 11:29:03'),
(4, 36, '2020-05-11 00:58:59'),
(5, 38, '2020-05-11 12:58:05'),
(6, 43, '2020-05-11 14:41:17'),
(7, 45, '2020-05-11 14:51:44'),
(8, 50, '2020-05-11 22:32:58'),
(9, 88, '2020-06-13 15:49:35');

-- --------------------------------------------------------

--
-- 表的结构 `t_wallet_detail`
--

CREATE TABLE IF NOT EXISTS `t_wallet_detail` (
  `t_id` int(11) NOT NULL,
  `t_user_id` int(11) DEFAULT NULL,
  `t_change_type` int(11) DEFAULT NULL COMMENT '0.收入\r\n1.支出',
  `t_change_category` int(11) DEFAULT NULL COMMENT '0.充值\r\n1.聊天\r\n2.视频\r\n3.私密照片\r\n4.私密视频\r\n5.查看手机\r\n6.查看微信\r\n7.红包\r\n8.VIP\r\n9.礼物\r\n10.提现\r\n11.推荐分成\r\n12.提现失败原路退回\r\n13.注册赠送\r\n14.公会收入\r\n',
  `t_change_front` decimal(11,2) DEFAULT NULL COMMENT '注意：\r\n如果为收益时，此结果为分项单独金额(如:充值，收益，分享)\r\n如果为支出时，此项结果为总金额\r\n',
  `t_value` decimal(11,2) DEFAULT NULL,
  `t_change_after` decimal(11,2) DEFAULT NULL COMMENT '注意：\r\n如果为收益时，此结果为分项金额(充值，收益，分享)\r\n如果为支出时，此项结果为总金额',
  `t_change_time` datetime DEFAULT NULL,
  `t_sorece_id` int(11) DEFAULT NULL COMMENT '消费为t_order主键\r\n充值为t_recharge 主键\r\n提现为t_put_forward 主键'
) ENGINE=InnoDB AUTO_INCREMENT=607 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_wallet_detail`
--

INSERT INTO `t_wallet_detail` (`t_id`, `t_user_id`, `t_change_type`, `t_change_category`, `t_change_front`, `t_value`, `t_change_after`, `t_change_time`, `t_sorece_id`) VALUES
(1, 1, 0, 13, '0.00', '38.00', '38.00', '2020-04-23 23:53:39', 2),
(2, 1, 1, 1, '38.00', '2.00', '36.00', '2020-04-24 00:44:03', 1),
(3, 1, 0, 8, '0.00', '0.00', '0.00', '2020-04-24 10:54:46', 0),
(4, 1, 1, 18, '36.00', '10.00', '26.00', '2020-04-24 10:56:47', 2),
(5, 2, 0, 18, '0.00', '6.00', '6.00', '2020-04-24 10:56:47', 2),
(6, 1, 1, 2, '26.00', '20.00', '6.00', '2020-04-24 10:57:19', 3),
(7, 2, 0, 2, '6.00', '12.00', '18.00', '2020-04-24 10:57:19', 3),
(8, 1, 0, 7, '0.00', '500.00', '500.00', '2020-04-24 11:59:25', 1),
(9, 1, 1, 2, '506.00', '20.00', '486.00', '2020-04-24 12:07:06', 4),
(10, 2, 0, 2, '18.00', '12.00', '30.00', '2020-04-24 12:07:06', 4),
(11, 1, 1, 2, '486.00', '20.00', '466.00', '2020-04-24 12:36:21', 5),
(12, 2, 0, 2, '30.00', '12.00', '42.00', '2020-04-24 12:36:21', 5),
(13, 1, 1, 2, '466.00', '40.00', '426.00', '2020-04-28 12:04:41', 6),
(14, 2, 0, 2, '42.00', '24.00', '66.00', '2020-04-28 12:04:41', 6),
(15, 1, 1, 2, '426.00', '40.00', '386.00', '2020-04-28 12:07:51', 7),
(16, 2, 0, 2, '66.00', '24.00', '90.00', '2020-04-28 12:07:51', 7),
(17, 1, 0, 0, '0.00', '58.00', '58.00', '2020-04-28 19:45:59', 1),
(18, 1, 1, 2, '444.00', '20.00', '424.00', '2020-04-28 23:11:30', 8),
(19, 2, 0, 2, '90.00', '12.00', '102.00', '2020-04-28 23:11:30', 8),
(20, 1, 1, 2, '424.00', '20.00', '404.00', '2020-04-28 23:16:38', 9),
(21, 2, 0, 2, '102.00', '12.00', '114.00', '2020-04-28 23:16:38', 9),
(22, 6, 0, 13, '0.00', '38.00', '38.00', '2020-04-30 12:23:04', 2),
(23, 7, 0, 13, '0.00', '38.00', '38.00', '2020-04-30 14:29:08', 2),
(24, 6, 1, 1, '38.00', '2.00', '36.00', '2020-04-30 19:13:39', 10),
(25, 6, 1, 1, '36.00', '2.00', '34.00', '2020-04-30 19:22:34', 11),
(26, 1, 1, 2, '404.00', '20.00', '384.00', '2020-04-30 19:24:41', 12),
(27, 9, 0, 2, '0.00', '12.00', '12.00', '2020-04-30 19:24:41', 12),
(28, 1, 0, 11, '0.00', '1.00', '1.00', '2020-04-30 19:29:30', 2),
(29, 1, 1, 9, '385.00', '2.00', '383.00', '2020-04-30 19:56:46', 13),
(30, 9, 0, 9, '12.00', '1.20', '13.20', '2020-04-30 19:56:46', 13),
(31, 1, 1, 9, '383.00', '6.00', '377.00', '2020-04-30 19:56:58', 14),
(32, 9, 0, 9, '13.20', '3.60', '16.80', '2020-04-30 19:56:58', 14),
(33, 1, 1, 9, '377.00', '6.00', '371.00', '2020-04-30 19:57:04', 15),
(34, 9, 0, 9, '16.80', '3.60', '20.40', '2020-04-30 19:57:04', 15),
(35, 1, 1, 18, '371.00', '10.00', '361.00', '2020-05-01 14:28:17', 16),
(36, 9, 0, 18, '20.40', '6.00', '26.40', '2020-05-01 14:28:17', 16),
(37, 1, 1, 18, '361.00', '10.00', '351.00', '2020-05-01 14:28:32', 17),
(38, 9, 0, 18, '26.40', '6.00', '32.40', '2020-05-01 14:28:32', 17),
(39, 1, 1, 2, '351.00', '20.00', '331.00', '2020-05-01 14:32:24', 18),
(40, 9, 0, 2, '32.40', '12.00', '44.40', '2020-05-01 14:32:24', 18),
(41, 11, 0, 13, '0.00', '38.00', '38.00', '2020-05-01 17:07:58', 2),
(42, 12, 0, 13, '0.00', '38.00', '38.00', '2020-05-01 17:09:00', 2),
(43, 1, 1, 2, '331.00', '20.00', '311.00', '2020-05-01 21:04:20', 19),
(44, 9, 0, 2, '44.40', '12.00', '56.40', '2020-05-01 21:04:20', 19),
(45, 9, 1, 9, '56.40', '2.00', '54.40', '2020-05-01 21:08:43', 20),
(46, 1, 0, 9, '310.00', '1.20', '311.20', '2020-05-01 21:08:43', 20),
(47, 1, 1, 9, '312.20', '10.00', '302.20', '2020-05-01 21:08:49', 21),
(48, 9, 0, 9, '54.40', '6.00', '60.40', '2020-05-01 21:08:49', 21),
(49, 1, 1, 9, '302.20', '40.00', '262.20', '2020-05-01 21:08:53', 22),
(50, 9, 0, 9, '60.40', '24.00', '84.40', '2020-05-01 21:08:53', 22),
(51, 1, 1, 9, '262.20', '13.00', '249.20', '2020-05-01 21:08:57', 23),
(52, 9, 0, 9, '84.40', '7.80', '92.20', '2020-05-01 21:08:57', 23),
(53, 1, 1, 2, '249.20', '100.00', '149.20', '2020-05-01 21:09:13', 24),
(54, 9, 0, 2, '92.20', '60.00', '152.20', '2020-05-01 21:09:13', 24),
(55, 1, 0, 11, '1.00', '1.00', '2.00', '2020-05-01 21:13:38', 3),
(56, 1, 0, 11, '2.00', '1.00', '3.00', '2020-05-01 21:13:38', 4),
(57, 1, 0, 11, '3.00', '2.00', '5.00', '2020-05-01 21:13:38', 5),
(58, 1, 0, 11, '5.00', '5.00', '10.00', '2020-05-01 21:13:38', 6),
(59, 1, 1, 18, '158.20', '10.00', '148.20', '2020-05-01 21:17:29', 25),
(60, 9, 0, 18, '152.20', '6.00', '158.20', '2020-05-01 21:17:29', 25),
(61, 9, 1, 9, '158.20', '2.00', '156.20', '2020-05-01 21:18:31', 26),
(62, 1, 0, 9, '138.20', '1.20', '139.40', '2020-05-01 21:18:31', 26),
(63, 1, 1, 9, '149.40', '2.00', '147.40', '2020-05-01 21:18:50', 27),
(64, 9, 0, 9, '156.20', '1.20', '157.40', '2020-05-01 21:18:50', 27),
(65, 1, 1, 2, '147.40', '60.00', '87.40', '2020-05-01 21:19:59', 28),
(66, 9, 0, 2, '157.40', '36.00', '193.40', '2020-05-01 21:19:59', 28),
(67, 1, 1, 2, '87.40', '20.00', '67.40', '2020-05-01 21:20:41', 29),
(68, 3, 0, 2, '0.00', '12.00', '12.00', '2020-05-01 21:20:41', 29),
(69, 1, 1, 18, '67.40', '10.00', '57.40', '2020-05-01 21:23:34', 30),
(70, 9, 0, 18, '193.40', '6.00', '199.40', '2020-05-01 21:23:34', 30),
(71, 1, 1, 18, '57.40', '10.00', '47.40', '2020-05-01 21:23:57', 31),
(72, 9, 0, 18, '199.40', '6.00', '205.40', '2020-05-01 21:23:57', 31),
(73, 1, 1, 2, '47.40', '20.00', '27.40', '2020-05-01 21:24:33', 32),
(74, 9, 0, 2, '205.40', '12.00', '217.40', '2020-05-01 21:24:33', 32),
(75, 1, 0, 11, '10.00', '3.00', '13.00', '2020-05-01 21:24:47', 7),
(76, 1, 0, 11, '13.00', '1.00', '14.00', '2020-05-01 21:24:47', 8),
(77, 13, 0, 13, '0.00', '38.00', '38.00', '2020-05-02 11:36:00', 2),
(78, 1, 1, 2, '31.40', '20.00', '11.40', '2020-05-02 18:30:45', 33),
(79, 14, 0, 2, '0.00', '12.00', '12.00', '2020-05-02 18:30:45', 33),
(80, 11, 1, 1, '38.00', '2.00', '36.00', '2020-05-02 23:08:51', 34),
(81, 11, 1, 1, '36.00', '2.00', '34.00', '2020-05-02 23:08:56', 35),
(82, 1, 0, 7, '0.00', '1000.00', '1000.00', '2020-05-03 15:20:35', 11),
(83, 15, 0, 13, '0.00', '38.00', '38.00', '2020-05-03 16:26:15', 2),
(84, 9, 0, 7, '217.40', '200000.00', '200217.40', '2020-05-03 17:23:43', 9),
(85, 9, 0, 7, '200217.40', '1000.00', '201217.40', '2020-05-03 17:23:43', 10),
(86, 9, 1, 10, '201217.40', '2000.00', '199217.40', '2020-05-03 17:24:46', 1),
(87, 9, 1, 9, '199217.40', '2.00', '199215.40', '2020-05-03 21:37:36', 37),
(88, 1, 0, 9, '1000.00', '1.20', '1001.20', '2020-05-03 21:37:36', 37),
(89, 9, 1, 9, '199215.40', '6.00', '199209.40', '2020-05-03 21:37:44', 38),
(90, 1, 0, 9, '1001.20', '3.60', '1004.80', '2020-05-03 21:37:44', 38),
(91, 1, 1, 9, '1016.20', '6.00', '1010.20', '2020-05-03 21:38:03', 39),
(92, 9, 0, 9, '199209.40', '3.60', '199213.00', '2020-05-03 21:38:03', 39),
(93, 1, 1, 2, '1010.20', '40.00', '970.20', '2020-05-03 21:38:04', 40),
(94, 9, 0, 2, '199213.00', '24.00', '199237.00', '2020-05-03 21:38:04', 40),
(95, 9, 1, 9, '199237.00', '40.00', '199197.00', '2020-05-03 21:39:02', 41),
(96, 1, 0, 9, '958.80', '24.00', '982.80', '2020-05-03 21:39:02', 41),
(97, 1, 1, 2, '994.20', '80.00', '914.20', '2020-05-03 21:40:08', 42),
(98, 9, 0, 2, '199197.00', '48.00', '199245.00', '2020-05-03 21:40:08', 42),
(99, 2, 1, 10, '114.00', '100.00', '14.00', '2020-05-03 21:57:13', 2),
(100, 9, 1, 10, '199245.00', '8400.00', '190845.00', '2020-05-04 10:23:01', 3),
(101, 9, 0, 0, '0.00', '58.00', '58.00', '2020-05-04 10:29:23', 18),
(102, 1, 0, 17, '11.40', '30.00', '41.40', '2020-05-04 10:29:23', 43),
(103, 1, 0, 11, '41.40', '2.00', '43.40', '2020-05-04 10:39:20', 13),
(104, 1, 0, 11, '43.40', '6.00', '49.40', '2020-05-04 10:39:20', 14),
(105, 1, 0, 11, '49.40', '4.00', '53.40', '2020-05-04 10:39:20', 15),
(106, 9, 0, 0, '58.00', '58.00', '116.00', '2020-05-04 10:50:59', 19),
(107, 7, 0, 0, '38.00', '58.00', '96.00', '2020-05-04 12:52:49', 22),
(108, 1, 1, 2, '956.20', '20.00', '936.20', '2020-05-04 13:13:14', 44),
(109, 2, 0, 2, '14.00', '12.00', '26.00', '2020-05-04 13:13:14', 44),
(110, 7, 1, 2, '96.00', '20.00', '76.00', '2020-05-04 13:13:34', 45),
(111, 2, 0, 2, '26.00', '12.00', '38.00', '2020-05-04 13:13:35', 45),
(112, 7, 1, 2, '76.00', '40.00', '36.00', '2020-05-04 13:45:48', 46),
(113, 16, 0, 2, '0.00', '28.00', '28.00', '2020-05-04 13:45:48', 46),
(114, 7, 1, 9, '36.00', '2.00', '34.00', '2020-05-04 13:56:11', 47),
(115, 16, 0, 9, '28.00', '1.40', '29.40', '2020-05-04 13:56:11', 47),
(116, 7, 1, 9, '34.00', '2.00', '32.00', '2020-05-04 13:56:22', 48),
(117, 16, 0, 9, '29.40', '1.40', '30.80', '2020-05-04 13:56:22', 48),
(118, 9, 1, 9, '190961.00', '2.00', '190959.00', '2020-05-04 14:01:29', 49),
(119, 7, 0, 9, '0.00', '1.40', '1.40', '2020-05-04 14:01:30', 49),
(120, 9, 1, 9, '190959.00', '2.00', '190957.00', '2020-05-04 14:03:06', 50),
(121, 1, 0, 9, '882.80', '1.40', '884.20', '2020-05-04 14:03:06', 50),
(122, 9, 1, 9, '190957.00', '6.00', '190951.00', '2020-05-04 14:03:21', 51),
(123, 1, 0, 9, '884.20', '4.20', '888.40', '2020-05-04 14:03:21', 51),
(124, 1, 1, 9, '941.80', '40.00', '901.80', '2020-05-04 14:03:48', 52),
(125, 9, 0, 9, '190845.00', '28.00', '190873.00', '2020-05-04 14:03:48', 52),
(126, 1, 1, 2, '901.80', '40.00', '861.80', '2020-05-04 14:03:51', 53),
(127, 9, 0, 2, '190873.00', '28.00', '190901.00', '2020-05-04 14:03:51', 53),
(128, 9, 1, 9, '191007.00', '131400.00', '59607.00', '2020-05-04 14:05:12', 54),
(129, 1, 0, 9, '808.40', '91980.00', '92788.40', '2020-05-04 14:05:12', 54),
(130, 9, 1, 9, '59607.00', '3888.00', '55719.00', '2020-05-04 14:05:26', 55),
(131, 1, 0, 9, '92788.40', '2721.60', '95510.00', '2020-05-04 14:05:26', 55),
(132, 9, 1, 9, '55719.00', '4000.00', '51719.00', '2020-05-04 14:05:47', 56),
(133, 1, 0, 9, '95510.00', '2800.00', '98310.00', '2020-05-04 14:05:47', 56),
(134, 1, 1, 2, '98363.40', '40.00', '98323.40', '2020-05-04 14:05:57', 57),
(135, 9, 0, 2, '51719.00', '28.00', '51747.00', '2020-05-04 14:05:58', 57),
(136, 1, 0, 11, '53.40', '2.00', '55.40', '2020-05-04 14:10:01', 16),
(137, 1, 0, 11, '55.40', '2.00', '57.40', '2020-05-04 14:10:01', 17),
(138, 1, 0, 11, '57.40', '19710.00', '19767.40', '2020-05-04 14:10:01', 18),
(139, 1, 0, 11, '19767.40', '583.20', '20350.60', '2020-05-04 14:10:01', 19),
(140, 1, 0, 11, '20350.60', '600.00', '20950.60', '2020-05-04 14:10:01', 20),
(141, 1, 0, 11, '20950.60', '2.00', '20952.60', '2020-05-04 14:10:01', 21),
(142, 1, 1, 2, '119222.60', '40.00', '119182.60', '2020-05-04 14:23:00', 58),
(143, 16, 0, 2, '30.80', '28.00', '58.80', '2020-05-04 14:23:00', 58),
(144, 7, 1, 4, '33.40', '10.00', '23.40', '2020-05-07 11:58:50', 59),
(145, 9, 0, 4, '51747.00', '7.00', '51754.00', '2020-05-07 11:58:50', 59),
(146, 17, 0, 13, '0.00', '38.00', '38.00', '2020-05-07 12:15:43', 2),
(147, 18, 0, 13, '0.00', '38.00', '38.00', '2020-05-07 18:11:14', 2),
(148, 19, 0, 13, '0.00', '38.00', '38.00', '2020-05-07 22:27:37', 2),
(149, 21, 0, 13, '0.00', '38.00', '38.00', '2020-05-08 14:40:44', 2),
(150, 11, 1, 1, '34.00', '2.00', '32.00', '2020-05-08 18:09:21', 63),
(151, 1, 1, 2, '119182.60', '40.00', '119142.60', '2020-05-08 20:24:45', 64),
(152, 9, 0, 2, '51754.00', '28.00', '51782.00', '2020-05-08 20:24:45', 64),
(153, 1, 1, 2, '119142.60', '40.00', '119102.60', '2020-05-08 20:28:08', 65),
(154, 9, 0, 2, '51782.00', '28.00', '51810.00', '2020-05-08 20:28:08', 65),
(155, 1, 1, 9, '119102.60', '40.00', '119062.60', '2020-05-08 20:28:45', 66),
(156, 9, 0, 9, '51810.00', '28.00', '51838.00', '2020-05-08 20:28:45', 66),
(157, 9, 1, 9, '51838.00', '520.00', '51318.00', '2020-05-08 20:28:59', 67),
(158, 1, 0, 9, '98110.00', '364.00', '98474.00', '2020-05-08 20:28:59', 67),
(159, 1, 1, 9, '119426.60', '180.00', '119246.60', '2020-05-08 20:29:08', 68),
(160, 9, 0, 9, '51318.00', '126.00', '51444.00', '2020-05-08 20:29:08', 68),
(161, 1, 1, 2, '119246.60', '40.00', '119206.60', '2020-05-08 20:29:16', 69),
(162, 9, 0, 2, '51444.00', '28.00', '51472.00', '2020-05-08 20:29:16', 69),
(163, 1, 0, 11, '20952.60', '2.00', '20954.60', '2020-05-08 20:29:26', 25),
(164, 1, 0, 11, '20954.60', '2.00', '20956.60', '2020-05-08 20:29:26', 26),
(165, 1, 0, 11, '20956.60', '2.00', '20958.60', '2020-05-08 20:29:26', 27),
(166, 1, 0, 11, '20958.60', '78.00', '21036.60', '2020-05-08 20:29:26', 28),
(167, 1, 0, 11, '21036.60', '9.00', '21045.60', '2020-05-08 20:29:26', 29),
(168, 1, 0, 11, '21045.60', '2.00', '21047.60', '2020-05-08 20:29:26', 30),
(169, 1, 1, 9, '119301.60', '300.00', '119001.60', '2020-05-08 20:33:26', 70),
(170, 9, 0, 9, '51472.00', '210.00', '51682.00', '2020-05-08 20:33:26', 70),
(171, 1, 1, 9, '119001.60', '520.00', '118481.60', '2020-05-08 20:33:31', 71),
(172, 9, 0, 9, '51682.00', '364.00', '52046.00', '2020-05-08 20:33:31', 71),
(173, 1, 1, 9, '118481.60', '8888.00', '109593.60', '2020-05-08 20:33:38', 72),
(174, 9, 0, 9, '52046.00', '6221.60', '58267.60', '2020-05-08 20:33:38', 72),
(175, 1, 1, 9, '109593.60', '180.00', '109413.60', '2020-05-08 20:33:47', 73),
(176, 9, 0, 9, '58267.60', '126.00', '58393.60', '2020-05-08 20:33:47', 73),
(177, 1, 1, 2, '109413.60', '80.00', '109333.60', '2020-05-08 20:34:15', 74),
(178, 9, 0, 2, '58393.60', '56.00', '58449.60', '2020-05-08 20:34:15', 74),
(179, 1, 1, 2, '109333.60', '40.00', '109293.60', '2020-05-08 20:36:10', 75),
(180, 9, 0, 2, '58449.60', '28.00', '58477.60', '2020-05-08 20:36:10', 75),
(181, 1, 1, 2, '109293.60', '80.00', '109213.60', '2020-05-08 20:37:51', 76),
(182, 9, 0, 2, '58477.60', '56.00', '58533.60', '2020-05-08 20:37:51', 76),
(183, 1, 1, 2, '109213.60', '40.00', '109173.60', '2020-05-08 20:38:15', 77),
(184, 9, 0, 2, '58533.60', '28.00', '58561.60', '2020-05-08 20:38:15', 77),
(185, 1, 1, 9, '109173.60', '260.00', '108913.60', '2020-05-08 20:41:40', 78),
(186, 9, 0, 9, '58561.60', '182.00', '58743.60', '2020-05-08 20:41:40', 78),
(187, 1, 1, 2, '108913.60', '40.00', '108873.60', '2020-05-08 20:42:26', 79),
(188, 9, 0, 2, '58743.60', '28.00', '58771.60', '2020-05-08 20:42:26', 79),
(189, 1, 1, 18, '108873.60', '30.00', '108843.60', '2020-05-08 20:43:01', 80),
(190, 9, 0, 18, '58771.60', '21.00', '58792.60', '2020-05-08 20:43:01', 80),
(191, 1, 1, 18, '108843.60', '30.00', '108813.60', '2020-05-08 20:44:20', 81),
(192, 9, 0, 18, '58792.60', '21.00', '58813.60', '2020-05-08 20:44:20', 81),
(193, 1, 1, 2, '108813.60', '40.00', '108773.60', '2020-05-08 21:20:52', 82),
(194, 9, 0, 2, '58813.60', '28.00', '58841.60', '2020-05-08 21:20:52', 82),
(195, 1, 0, 11, '21047.60', '15.00', '21062.60', '2020-05-09 11:03:45', 31),
(196, 1, 0, 11, '21062.60', '26.00', '21088.60', '2020-05-09 11:03:45', 32),
(197, 1, 0, 11, '21088.60', '444.40', '21533.00', '2020-05-09 11:03:45', 33),
(198, 1, 0, 11, '21533.00', '9.00', '21542.00', '2020-05-09 11:03:45', 34),
(199, 1, 0, 11, '21542.00', '4.00', '21546.00', '2020-05-09 11:03:45', 35),
(200, 1, 0, 11, '21546.00', '2.00', '21548.00', '2020-05-09 11:03:45', 36),
(201, 1, 0, 11, '21548.00', '4.00', '21552.00', '2020-05-09 11:03:45', 37),
(202, 1, 0, 11, '21552.00', '2.00', '21554.00', '2020-05-09 11:03:45', 38),
(203, 1, 0, 11, '21554.00', '13.00', '21567.00', '2020-05-09 11:03:45', 39),
(204, 1, 0, 11, '21567.00', '2.00', '21569.00', '2020-05-09 11:03:45', 40),
(205, 1, 0, 11, '21569.00', '1.50', '21570.50', '2020-05-09 11:03:45', 41),
(206, 1, 0, 11, '21570.50', '1.50', '21572.00', '2020-05-09 11:03:45', 42),
(207, 1, 0, 11, '21572.00', '2.00', '21574.00', '2020-05-09 11:03:45', 43),
(208, 23, 0, 13, '0.00', '38.00', '38.00', '2020-05-09 12:55:12', 2),
(209, 1, 1, 9, '109300.00', '520.00', '108780.00', '2020-05-09 13:50:14', 84),
(210, 9, 0, 9, '58841.60', '364.00', '59205.60', '2020-05-09 13:50:14', 84),
(211, 1, 1, 9, '108780.00', '8888.00', '99892.00', '2020-05-09 13:50:24', 85),
(212, 9, 0, 9, '59205.60', '6221.60', '65427.20', '2020-05-09 13:50:24', 85),
(213, 1, 1, 2, '99892.00', '40.00', '99852.00', '2020-05-09 13:50:36', 86),
(214, 9, 0, 2, '65427.20', '28.00', '65455.20', '2020-05-09 13:50:36', 86),
(215, 1, 1, 9, '99852.00', '8888.00', '90964.00', '2020-05-09 13:52:17', 87),
(216, 9, 0, 9, '65455.20', '6221.60', '71676.80', '2020-05-09 13:52:17', 87),
(217, 1, 1, 9, '90964.00', '2888.00', '88076.00', '2020-05-09 13:52:34', 88),
(218, 9, 0, 9, '71676.80', '2021.60', '73698.40', '2020-05-09 13:52:34', 88),
(219, 1, 1, 9, '88076.00', '12000.00', '76076.00', '2020-05-09 13:52:45', 89),
(220, 9, 0, 9, '73698.40', '8400.00', '82098.40', '2020-05-09 13:52:45', 89),
(221, 1, 1, 2, '76076.00', '40.00', '76036.00', '2020-05-09 13:52:55', 90),
(222, 9, 0, 2, '82098.40', '28.00', '82126.40', '2020-05-09 13:52:55', 90),
(223, 1, 0, 11, '21574.00', '26.00', '21600.00', '2020-05-09 17:14:09', 45),
(224, 1, 0, 11, '21600.00', '444.40', '22044.40', '2020-05-09 17:14:09', 46),
(225, 1, 0, 11, '22044.40', '2.00', '22046.40', '2020-05-09 17:14:09', 47),
(226, 1, 0, 11, '22046.40', '444.40', '22490.80', '2020-05-09 17:14:09', 48),
(227, 1, 0, 11, '22490.80', '144.40', '22635.20', '2020-05-09 17:14:09', 49),
(228, 1, 0, 11, '22635.20', '600.00', '23235.20', '2020-05-09 17:14:09', 50),
(229, 1, 0, 11, '23235.20', '2.00', '23237.20', '2020-05-09 17:14:09', 51),
(230, 26, 0, 13, '0.00', '38.00', '38.00', '2020-05-09 19:17:48', 2),
(231, 9, 0, 11, '0.00', '10.00', '10.00', '2020-05-09 19:22:55', 52),
(232, 9, 1, 10, '82136.40', '1000.00', '81136.40', '2020-05-09 19:27:34', 4),
(233, 28, 0, 13, '0.00', '38.00', '38.00', '2020-05-09 19:42:19', 2),
(234, 30, 0, 13, '0.00', '38.00', '38.00', '2020-05-09 19:45:53', 2),
(235, 27, 0, 11, '0.00', '10.00', '10.00', '2020-05-09 19:47:46', 53),
(236, 28, 0, 0, '38.00', '300.00', '338.00', '2020-05-09 20:17:45', 24),
(237, 27, 0, 17, '10.00', '30.00', '40.00', '2020-05-09 20:17:45', 94),
(238, 28, 1, 9, '338.00', '40.00', '298.00', '2020-05-09 20:19:24', 95),
(239, 29, 0, 9, '0.00', '28.00', '28.00', '2020-05-09 20:19:24', 95),
(240, 28, 1, 9, '298.00', '120.00', '178.00', '2020-05-09 20:19:28', 96),
(241, 29, 0, 9, '28.00', '84.00', '112.00', '2020-05-09 20:19:28', 96),
(242, 27, 0, 11, '40.00', '6.00', '46.00', '2020-05-09 20:20:59', 55),
(243, 27, 0, 11, '46.00', '2.00', '48.00', '2020-05-09 20:20:59', 56),
(244, 27, 0, 11, '48.00', '18.00', '66.00', '2020-05-09 20:20:59', 57),
(245, 27, 0, 11, '66.00', '6.00', '72.00', '2020-05-09 20:20:59', 58),
(246, 29, 1, 9, '112.00', '40.00', '72.00', '2020-05-09 20:21:47', 97),
(247, 28, 0, 9, '0.00', '28.00', '28.00', '2020-05-09 20:21:47', 97),
(248, 28, 1, 2, '206.00', '60.00', '146.00', '2020-05-09 20:22:01', 98),
(249, 29, 0, 2, '72.00', '42.00', '114.00', '2020-05-09 20:22:01', 98),
(250, 28, 0, 11, '0.00', '10.00', '10.00', '2020-05-09 20:22:09', 54),
(251, 28, 0, 7, '28.00', '100.00', '128.00', '2020-05-09 20:22:09', 59),
(252, 28, 0, 7, '128.00', '1000.00', '1128.00', '2020-05-09 20:22:09', 62),
(253, 28, 1, 9, '1256.00', '40.00', '1216.00', '2020-05-09 20:22:22', 99),
(254, 29, 0, 9, '114.00', '28.00', '142.00', '2020-05-09 20:22:22', 99),
(255, 28, 1, 9, '1216.00', '120.00', '1096.00', '2020-05-09 20:22:25', 100),
(256, 29, 0, 9, '142.00', '84.00', '226.00', '2020-05-09 20:22:25', 100),
(257, 28, 1, 9, '1096.00', '40.00', '1056.00', '2020-05-09 20:22:29', 101),
(258, 29, 0, 9, '226.00', '28.00', '254.00', '2020-05-09 20:22:29', 101),
(259, 28, 1, 9, '1056.00', '300.00', '756.00', '2020-05-09 20:22:32', 102),
(260, 29, 0, 9, '254.00', '210.00', '464.00', '2020-05-09 20:22:32', 102),
(261, 28, 1, 9, '756.00', '260.00', '496.00', '2020-05-09 20:22:41', 103),
(262, 29, 0, 9, '464.00', '182.00', '646.00', '2020-05-09 20:22:41', 103),
(263, 28, 1, 2, '496.00', '20.00', '476.00', '2020-05-09 20:23:08', 104),
(264, 29, 0, 2, '646.00', '14.00', '660.00', '2020-05-09 20:23:08', 104),
(265, 27, 0, 11, '72.00', '6.00', '78.00', '2020-05-09 20:23:36', 60),
(266, 27, 0, 11, '78.00', '2.00', '80.00', '2020-05-09 20:23:36', 61),
(267, 27, 0, 11, '80.00', '9.00', '89.00', '2020-05-09 20:23:36', 63),
(268, 27, 0, 11, '89.00', '3.00', '92.00', '2020-05-09 20:23:36', 64),
(269, 27, 0, 11, '92.00', '6.00', '98.00', '2020-05-09 20:23:36', 65),
(270, 27, 0, 11, '98.00', '2.00', '100.00', '2020-05-09 20:23:36', 66),
(271, 27, 0, 11, '100.00', '18.00', '118.00', '2020-05-09 20:23:36', 67),
(272, 27, 0, 11, '118.00', '6.00', '124.00', '2020-05-09 20:23:36', 68),
(273, 27, 0, 11, '124.00', '6.00', '130.00', '2020-05-09 20:23:36', 69),
(274, 27, 0, 11, '130.00', '2.00', '132.00', '2020-05-09 20:23:36', 70),
(275, 27, 0, 11, '132.00', '45.00', '177.00', '2020-05-09 20:23:36', 71),
(276, 27, 0, 11, '177.00', '15.00', '192.00', '2020-05-09 20:23:36', 72),
(277, 27, 0, 11, '192.00', '39.00', '231.00', '2020-05-09 20:23:36', 73),
(278, 27, 0, 11, '231.00', '13.00', '244.00', '2020-05-09 20:23:36', 74),
(279, 27, 0, 11, '244.00', '3.00', '247.00', '2020-05-09 20:23:36', 75),
(280, 27, 0, 11, '247.00', '1.00', '248.00', '2020-05-09 20:23:36', 76),
(281, 28, 0, 7, '466.00', '10000.00', '10466.00', '2020-05-09 20:23:42', 77),
(282, 28, 0, 7, '10466.00', '10000.00', '20466.00', '2020-05-09 20:23:42', 78),
(283, 28, 1, 9, '20476.00', '180.00', '20296.00', '2020-05-09 20:24:06', 105),
(284, 31, 0, 9, '0.00', '126.00', '126.00', '2020-05-09 20:24:06', 105),
(285, 28, 1, 2, '20296.00', '30.00', '20266.00', '2020-05-09 20:24:34', 106),
(286, 31, 0, 2, '126.00', '21.00', '147.00', '2020-05-09 20:24:34', 106),
(287, 28, 1, 2, '20266.00', '30.00', '20236.00', '2020-05-09 20:25:16', 107),
(288, 31, 0, 2, '147.00', '21.00', '168.00', '2020-05-09 20:25:16', 107),
(289, 27, 0, 11, '248.00', '27.00', '275.00', '2020-05-09 20:25:28', 79),
(290, 27, 0, 11, '275.00', '9.00', '284.00', '2020-05-09 20:25:28', 80),
(291, 27, 0, 11, '284.00', '4.50', '288.50', '2020-05-09 20:25:28', 81),
(292, 27, 0, 11, '288.50', '1.50', '290.00', '2020-05-09 20:25:28', 82),
(293, 27, 0, 11, '290.00', '4.50', '294.50', '2020-05-09 20:25:28', 83),
(294, 27, 0, 11, '294.50', '1.50', '296.00', '2020-05-09 20:25:28', 84),
(295, 28, 1, 9, '20236.00', '300.00', '19936.00', '2020-05-09 20:25:55', 108),
(296, 31, 0, 9, '168.00', '210.00', '378.00', '2020-05-09 20:25:55', 108),
(297, 28, 1, 9, '19936.00', '8888.00', '11048.00', '2020-05-09 20:26:02', 109),
(298, 31, 0, 9, '378.00', '6221.60', '6599.60', '2020-05-09 20:26:02', 109),
(299, 28, 1, 2, '11048.00', '30.00', '11018.00', '2020-05-09 20:26:10', 110),
(300, 31, 0, 2, '6599.60', '21.00', '6620.60', '2020-05-09 20:26:10', 110),
(301, 32, 0, 13, '0.00', '38.00', '38.00', '2020-05-10 01:26:18', 2),
(302, 32, 1, 1, '38.00', '2.00', '36.00', '2020-05-10 01:27:16', 112),
(303, 32, 1, 1, '36.00', '2.00', '34.00', '2020-05-10 01:28:13', 113),
(304, 27, 0, 11, '296.00', '45.00', '341.00', '2020-05-10 11:25:14', 85),
(305, 27, 0, 11, '341.00', '15.00', '356.00', '2020-05-10 11:25:14', 86),
(306, 27, 0, 11, '356.00', '1333.20', '1689.20', '2020-05-10 11:25:14', 87),
(307, 27, 0, 11, '1689.20', '444.40', '2133.60', '2020-05-10 11:25:14', 88),
(308, 27, 0, 11, '2133.60', '4.50', '2138.10', '2020-05-10 11:25:14', 89),
(309, 27, 0, 11, '2138.10', '1.50', '2139.60', '2020-05-10 11:25:14', 90),
(310, 28, 1, 1, '11018.00', '2.00', '11016.00', '2020-05-10 11:31:13', 114),
(311, 28, 1, 1, '11016.00', '2.00', '11014.00', '2020-05-10 11:55:44', 115),
(312, 28, 1, 5, '11014.00', '500.00', '10514.00', '2020-05-10 15:14:02', 116),
(313, 31, 0, 5, '6620.60', '350.00', '6970.60', '2020-05-10 15:14:02', 116),
(314, 28, 1, 5, '10514.00', '500.00', '10014.00', '2020-05-10 15:14:09', 117),
(315, 33, 0, 5, '0.00', '350.00', '350.00', '2020-05-10 15:14:09', 117),
(316, 28, 1, 9, '10014.00', '40.00', '9974.00', '2020-05-10 15:14:22', 118),
(317, 33, 0, 9, '350.00', '28.00', '378.00', '2020-05-10 15:14:22', 118),
(318, 28, 1, 2, '9974.00', '30.00', '9944.00', '2020-05-10 15:15:48', 119),
(319, 31, 0, 2, '6970.60', '21.00', '6991.60', '2020-05-10 15:15:48', 119),
(320, 27, 0, 11, '2139.60', '75.00', '2214.60', '2020-05-10 18:20:19', 92),
(321, 27, 0, 11, '2214.60', '25.00', '2239.60', '2020-05-10 18:20:19', 93),
(322, 27, 0, 11, '2239.60', '75.00', '2314.60', '2020-05-10 18:20:19', 94),
(323, 27, 0, 11, '2314.60', '6.00', '2320.60', '2020-05-10 18:20:19', 95),
(324, 27, 0, 11, '2320.60', '4.50', '2325.10', '2020-05-10 18:20:19', 96),
(325, 27, 0, 11, '2325.10', '1.50', '2326.60', '2020-05-10 18:20:19', 97),
(326, 35, 0, 13, '0.00', '38.00', '38.00', '2020-05-11 00:51:47', 2),
(327, 28, 1, 9, '9944.00', '520.00', '9424.00', '2020-05-11 01:12:43', 120),
(328, 36, 0, 9, '0.00', '364.00', '364.00', '2020-05-11 01:12:43', 120),
(329, 28, 1, 9, '9424.00', '120.00', '9304.00', '2020-05-11 01:12:49', 121),
(330, 36, 0, 9, '364.00', '84.00', '448.00', '2020-05-11 01:12:49', 121),
(331, 28, 1, 9, '9304.00', '2888.00', '6416.00', '2020-05-11 01:12:53', 122),
(332, 36, 0, 9, '448.00', '2021.60', '2469.60', '2020-05-11 01:12:53', 122),
(333, 28, 1, 9, '6416.00', '200.00', '6216.00', '2020-05-11 01:12:57', 123),
(334, 36, 0, 9, '2469.60', '140.00', '2609.60', '2020-05-11 01:12:57', 123),
(335, 27, 0, 11, '2326.60', '78.00', '2404.60', '2020-05-11 12:29:51', 98),
(336, 27, 0, 11, '2404.60', '18.00', '2422.60', '2020-05-11 12:29:51', 99),
(337, 27, 0, 11, '2422.60', '433.20', '2855.80', '2020-05-11 12:29:51', 100),
(338, 27, 0, 11, '2855.80', '30.00', '2885.80', '2020-05-11 12:29:51', 101),
(339, 37, 0, 13, '0.00', '38.00', '38.00', '2020-05-11 12:54:11', 2),
(340, 37, 1, 1, '38.00', '2.00', '36.00', '2020-05-11 13:10:10', 125),
(341, 37, 1, 2, '36.00', '20.00', '16.00', '2020-05-11 13:13:22', 126),
(342, 39, 0, 2, '0.00', '14.00', '14.00', '2020-05-11 13:13:22', 126),
(343, 35, 1, 2, '38.00', '30.00', '8.00', '2020-05-11 13:20:29', 127),
(344, 31, 0, 2, '6991.60', '21.00', '7012.60', '2020-05-11 13:20:29', 127),
(345, 28, 1, 1, '6216.00', '2.00', '6214.00', '2020-05-11 13:22:52', 129),
(346, 28, 1, 5, '6214.00', '500.00', '5714.00', '2020-05-11 13:23:30', 130),
(347, 39, 0, 5, '14.00', '350.00', '364.00', '2020-05-11 13:23:30', 130),
(348, 37, 0, 11, '0.00', '25.00', '25.00', '2020-05-11 13:28:11', 105),
(349, 31, 1, 19, '7012.60', '300.00', '6712.60', '2020-05-11 13:30:48', 131),
(350, 39, 0, 19, '364.00', '210.00', '574.00', '2020-05-11 13:30:48', 131),
(351, 31, 1, 6, '6712.60', '500.00', '6212.60', '2020-05-11 13:30:53', 132),
(352, 39, 0, 6, '574.00', '350.00', '924.00', '2020-05-11 13:30:53', 132),
(353, 28, 1, 2, '5714.00', '30.00', '5684.00', '2020-05-11 13:32:15', 133),
(354, 31, 0, 2, '6212.60', '21.00', '6233.60', '2020-05-11 13:32:15', 133),
(355, 35, 0, 7, '0.00', '1000.00', '1000.00', '2020-05-11 13:44:33', 112),
(356, 35, 0, 7, '1000.00', '1000.00', '2000.00', '2020-05-11 13:44:33', 113),
(357, 35, 0, 7, '2000.00', '100.00', '2100.00', '2020-05-11 13:44:33', 114),
(358, 35, 0, 7, '2100.00', '200.00', '2300.00', '2020-05-11 13:44:33', 115),
(359, 35, 0, 7, '2300.00', '1000.00', '3300.00', '2020-05-11 13:44:33', 116),
(360, 35, 0, 7, '3300.00', '1000.00', '4300.00', '2020-05-11 13:44:33', 117),
(361, 35, 1, 1, '4308.00', '8.00', '4300.00', '2020-05-11 13:47:27', 134),
(362, 35, 1, 2, '4300.00', '40.00', '4260.00', '2020-05-11 13:47:49', 135),
(363, 39, 0, 2, '924.00', '28.00', '952.00', '2020-05-11 13:47:49', 135),
(364, 35, 1, 2, '4260.00', '40.00', '4220.00', '2020-05-11 13:48:11', 136),
(365, 39, 0, 2, '952.00', '28.00', '980.00', '2020-05-11 13:48:11', 136),
(366, 30, 1, 1, '38.00', '8.00', '30.00', '2020-05-11 13:54:39', 137),
(367, 30, 0, 7, '0.00', '2000.00', '2000.00', '2020-05-11 13:54:44', 119),
(368, 35, 1, 2, '4220.00', '40.00', '4180.00', '2020-05-11 13:56:07', 138),
(369, 39, 0, 2, '980.00', '28.00', '1008.00', '2020-05-11 13:56:07', 138),
(370, 35, 1, 2, '4180.00', '40.00', '4140.00', '2020-05-11 13:56:30', 139),
(371, 39, 0, 2, '1008.00', '28.00', '1036.00', '2020-05-11 13:56:30', 139),
(372, 35, 1, 2, '4140.00', '40.00', '4100.00', '2020-05-11 13:57:10', 140),
(373, 39, 0, 2, '1036.00', '28.00', '1064.00', '2020-05-11 13:57:10', 140),
(374, 35, 1, 2, '4100.00', '40.00', '4060.00', '2020-05-11 13:59:00', 141),
(375, 39, 0, 2, '1064.00', '28.00', '1092.00', '2020-05-11 13:59:00', 141),
(376, 30, 1, 5, '2030.00', '500.00', '1530.00', '2020-05-11 14:01:35', 142),
(377, 33, 0, 5, '378.00', '350.00', '728.00', '2020-05-11 14:01:35', 142),
(378, 35, 1, 2, '4060.00', '80.00', '3980.00', '2020-05-11 14:06:16', 143),
(379, 39, 0, 2, '1092.00', '56.00', '1148.00', '2020-05-11 14:06:16', 143),
(380, 28, 1, 2, '5684.00', '40.00', '5644.00', '2020-05-11 14:07:19', 144),
(381, 39, 0, 2, '46.00', '28.00', '74.00', '2020-05-11 14:07:19', 144),
(382, 27, 0, 11, '2885.80', '1.50', '2887.30', '2020-05-11 14:09:45', 103),
(383, 27, 0, 11, '2887.30', '75.00', '2962.30', '2020-05-11 14:09:45', 104),
(384, 27, 0, 11, '2962.30', '45.00', '3007.30', '2020-05-11 14:09:45', 106),
(385, 27, 0, 11, '3007.30', '75.00', '3082.30', '2020-05-11 14:09:45', 108),
(386, 27, 0, 11, '3082.30', '4.50', '3086.80', '2020-05-11 14:09:45', 110),
(387, 27, 0, 11, '3086.80', '1.50', '3088.30', '2020-05-11 14:09:45', 111),
(388, 27, 0, 11, '3088.30', '25.00', '3113.30', '2020-05-11 14:09:45', 125),
(389, 27, 0, 11, '3113.30', '6.00', '3119.30', '2020-05-11 14:09:45', 128),
(390, 44, 0, 13, '0.00', '38.00', '38.00', '2020-05-11 14:45:54', 2),
(391, 44, 1, 1, '38.00', '2.00', '36.00', '2020-05-11 14:47:19', 146),
(392, 44, 1, 1, '36.00', '2.00', '34.00', '2020-05-11 14:47:28', 147),
(393, 44, 1, 1, '34.00', '2.00', '32.00', '2020-05-11 14:47:34', 148),
(394, 46, 0, 13, '0.00', '38.00', '38.00', '2020-05-11 15:32:34', 2),
(395, 47, 0, 13, '0.00', '38.00', '38.00', '2020-05-11 15:42:19', 2),
(396, 46, 1, 1, '38.00', '2.00', '36.00', '2020-05-11 15:46:01', 151),
(397, 48, 0, 13, '0.00', '38.00', '38.00', '2020-05-11 15:54:44', 2),
(398, 49, 0, 13, '0.00', '38.00', '38.00', '2020-05-11 16:10:17', 2),
(399, 49, 1, 1, '38.00', '2.00', '36.00', '2020-05-11 16:11:40', 154),
(400, 49, 1, 1, '36.00', '2.00', '34.00', '2020-05-11 16:11:48', 155),
(401, 49, 1, 1, '34.00', '2.00', '32.00', '2020-05-11 16:12:23', 156),
(402, 51, 0, 13, '0.00', '38.00', '38.00', '2020-05-11 23:09:15', 2),
(403, 51, 1, 1, '38.00', '2.00', '36.00', '2020-05-11 23:20:12', 158),
(404, 51, 1, 1, '36.00', '2.00', '34.00', '2020-05-11 23:20:50', 159),
(405, 54, 0, 13, '0.00', '38.00', '38.00', '2020-05-12 03:45:44', 2),
(406, 54, 1, 1, '38.00', '2.00', '36.00', '2020-05-12 03:48:08', 161),
(407, 30, 1, 2, '1530.00', '40.00', '1490.00', '2020-05-12 11:09:17', 162),
(408, 56, 0, 2, '0.00', '28.00', '28.00', '2020-05-12 11:09:17', 162),
(409, 30, 1, 1, '1490.00', '2.00', '1488.00', '2020-05-12 11:09:46', 163),
(410, 27, 0, 11, '3119.30', '2.00', '3121.30', '2020-05-12 11:15:36', 136),
(411, 39, 0, 11, '0.00', '2.00', '2.00', '2020-05-12 11:28:39', 139),
(412, 58, 0, 13, '0.00', '38.00', '38.00', '2020-05-12 13:05:24', 2),
(413, 59, 0, 13, '0.00', '38.00', '38.00', '2020-05-12 13:21:59', 2),
(414, 60, 0, 13, '0.00', '38.00', '38.00', '2020-05-12 13:59:07', 2),
(415, 60, 1, 1, '38.00', '2.00', '36.00', '2020-05-12 14:00:29', 166),
(416, 30, 0, 0, '0.00', '500.00', '500.00', '2020-05-12 15:52:29', 28),
(417, 28, 0, 17, '0.00', '30.00', '30.00', '2020-05-12 15:52:29', 168),
(418, 30, 1, 1, '500.00', '2.00', '498.00', '2020-05-12 15:54:13', 169),
(419, 30, 1, 2, '498.00', '120.00', '378.00', '2020-05-12 16:00:31', 170),
(420, 53, 0, 2, '0.00', '84.00', '84.00', '2020-05-12 16:00:31', 170),
(421, 30, 1, 9, '378.00', '40.00', '338.00', '2020-05-12 16:05:21', 171),
(422, 53, 0, 9, '84.00', '28.00', '112.00', '2020-05-12 16:05:21', 171),
(423, 30, 1, 9, '338.00', '40.00', '298.00', '2020-05-12 16:05:25', 172),
(424, 53, 0, 9, '112.00', '28.00', '140.00', '2020-05-12 16:05:25', 172),
(425, 30, 1, 9, '298.00', '120.00', '178.00', '2020-05-12 16:05:30', 173),
(426, 53, 0, 9, '140.00', '84.00', '224.00', '2020-05-12 16:05:30', 173),
(427, 30, 1, 9, '178.00', '40.00', '138.00', '2020-05-12 16:05:43', 174),
(428, 53, 0, 9, '224.00', '28.00', '252.00', '2020-05-12 16:05:43', 174),
(429, 30, 1, 9, '138.00', '40.00', '98.00', '2020-05-12 16:05:49', 175),
(430, 53, 0, 9, '252.00', '28.00', '280.00', '2020-05-12 16:05:49', 175),
(431, 27, 0, 11, '0.30', '6.00', '6.30', '2020-05-12 16:06:00', 142),
(432, 27, 0, 11, '6.30', '2.00', '8.30', '2020-05-12 16:06:00', 146),
(433, 27, 0, 11, '8.30', '2.00', '10.30', '2020-05-12 16:06:00', 150),
(434, 27, 0, 11, '10.30', '6.00', '16.30', '2020-05-12 16:06:00', 154),
(435, 27, 0, 11, '16.30', '2.00', '18.30', '2020-05-12 16:06:00', 158),
(436, 27, 0, 11, '18.30', '2.00', '20.30', '2020-05-12 16:06:00', 162),
(437, 30, 1, 2, '98.00', '80.00', '18.00', '2020-05-12 16:07:19', 176),
(438, 53, 0, 2, '280.00', '56.00', '336.00', '2020-05-12 16:07:19', 176),
(439, 27, 0, 11, '20.30', '4.00', '24.30', '2020-05-12 16:13:10', 166),
(440, 30, 1, 1, '18.00', '2.00', '16.00', '2020-05-12 20:16:48', 178),
(441, 39, 0, 11, '2.00', '6.00', '8.00', '2020-05-12 20:29:50', 145),
(442, 39, 0, 11, '8.00', '2.00', '10.00', '2020-05-12 20:29:50', 149),
(443, 39, 0, 11, '10.00', '2.00', '12.00', '2020-05-12 20:29:50', 153),
(444, 39, 0, 11, '12.00', '6.00', '18.00', '2020-05-12 20:29:50', 157),
(445, 39, 0, 11, '18.00', '2.00', '20.00', '2020-05-12 20:29:50', 161),
(446, 39, 0, 11, '20.00', '2.00', '22.00', '2020-05-12 20:29:50', 165),
(447, 39, 0, 11, '22.00', '4.00', '26.00', '2020-05-12 20:29:50', 169),
(448, 35, 0, 11, '0.00', '10.00', '10.00', '2020-05-13 00:22:18', 130),
(449, 35, 0, 11, '10.00', '10.00', '20.00', '2020-05-13 00:22:18', 131),
(450, 35, 0, 11, '20.00', '10.00', '30.00', '2020-05-13 00:22:18', 132),
(451, 35, 0, 11, '30.00', '10.00', '40.00', '2020-05-13 00:22:18', 133),
(452, 35, 0, 11, '40.00', '10.00', '50.00', '2020-05-13 00:22:18', 134),
(453, 35, 0, 11, '50.00', '10.00', '60.00', '2020-05-13 00:22:18', 140),
(454, 35, 0, 11, '60.00', '10.00', '70.00', '2020-05-13 00:22:18', 141),
(455, 35, 1, 1, '70.00', '2.00', '68.00', '2020-05-13 00:22:32', 180),
(456, 35, 1, 9, '68.00', '40.00', '28.00', '2020-05-13 01:21:45', 181),
(457, 53, 0, 9, '336.00', '28.00', '364.00', '2020-05-13 01:21:45', 181),
(458, 35, 1, 1, '28.00', '2.00', '26.00', '2020-05-13 01:22:00', 182),
(459, 35, 1, 1, '26.00', '2.00', '24.00', '2020-05-13 01:22:00', 183),
(460, 35, 1, 1, '24.00', '2.00', '22.00', '2020-05-13 01:22:07', 184),
(461, 58, 1, 1, '38.00', '2.00', '36.00', '2020-05-13 10:37:43', 185),
(462, 39, 0, 11, '26.00', '2.00', '28.00', '2020-05-13 11:56:55', 171),
(463, 37, 0, 11, '25.00', '15.00', '40.00', '2020-05-13 12:10:57', 107),
(464, 37, 0, 11, '40.00', '25.00', '65.00', '2020-05-13 12:10:57', 109),
(465, 37, 0, 11, '65.00', '2.00', '67.00', '2020-05-13 12:10:57', 118),
(466, 37, 0, 11, '67.00', '2.00', '69.00', '2020-05-13 12:10:57', 120),
(467, 37, 0, 11, '69.00', '2.00', '71.00', '2020-05-13 12:10:57', 121),
(468, 37, 0, 11, '71.00', '2.00', '73.00', '2020-05-13 12:10:57', 122),
(469, 37, 0, 11, '73.00', '2.00', '75.00', '2020-05-13 12:10:57', 123),
(470, 37, 0, 11, '75.00', '2.00', '77.00', '2020-05-13 12:10:57', 124),
(471, 37, 0, 11, '77.00', '4.00', '81.00', '2020-05-13 12:10:57', 127),
(472, 37, 0, 11, '81.00', '2.00', '83.00', '2020-05-13 12:10:57', 129),
(473, 37, 0, 11, '83.00', '1.20', '84.20', '2020-05-13 12:10:57', 138),
(474, 37, 0, 11, '84.20', '3.60', '87.80', '2020-05-13 12:10:57', 144),
(475, 37, 0, 11, '87.80', '1.20', '89.00', '2020-05-13 12:10:57', 148),
(476, 37, 0, 11, '89.00', '1.20', '90.20', '2020-05-13 12:10:57', 152),
(477, 37, 0, 11, '90.20', '3.60', '93.80', '2020-05-13 12:10:57', 156),
(478, 37, 0, 11, '93.80', '1.20', '95.00', '2020-05-13 12:10:57', 160),
(479, 37, 0, 11, '95.00', '1.20', '96.20', '2020-05-13 12:10:57', 164),
(480, 37, 0, 11, '96.20', '2.40', '98.60', '2020-05-13 12:10:57', 168),
(481, 37, 0, 11, '98.60', '1.20', '99.80', '2020-05-13 12:10:57', 170),
(482, 65, 0, 13, '0.00', '38.00', '38.00', '2020-05-13 14:13:09', 2),
(483, 65, 1, 1, '38.00', '2.00', '36.00', '2020-05-13 14:14:39', 188),
(484, 65, 1, 1, '36.00', '2.00', '34.00', '2020-05-13 14:14:49', 189),
(485, 65, 1, 1, '34.00', '2.00', '32.00', '2020-05-13 14:14:54', 190),
(486, 65, 1, 1, '32.00', '2.00', '30.00', '2020-05-13 14:15:22', 191),
(487, 35, 0, 11, '22.00', '10.00', '32.00', '2020-05-13 15:05:14', 172),
(488, 66, 0, 13, '0.00', '38.00', '38.00', '2020-05-13 16:16:38', 2),
(489, 67, 0, 13, '0.00', '38.00', '38.00', '2020-05-13 16:17:11', 2),
(490, 67, 1, 1, '38.00', '2.00', '36.00', '2020-05-13 16:19:10', 194),
(491, 67, 1, 1, '36.00', '2.00', '34.00', '2020-05-13 16:19:37', 195),
(492, 67, 1, 1, '34.00', '2.00', '32.00', '2020-05-13 16:19:43', 196),
(493, 67, 1, 1, '32.00', '2.00', '30.00', '2020-05-13 16:20:08', 197),
(494, 66, 1, 1, '38.00', '2.00', '36.00', '2020-05-13 16:42:03', 198),
(495, 35, 0, 11, '32.00', '10.00', '42.00', '2020-05-13 16:48:02', 173),
(496, 35, 0, 11, '42.00', '10.00', '52.00', '2020-05-13 16:48:02', 174),
(497, 66, 0, 7, '0.00', '30.00', '30.00', '2020-05-13 19:53:19', 175),
(498, 66, 0, 7, '30.00', '270.00', '300.00', '2020-05-13 19:54:09', 176),
(499, 66, 1, 2, '336.00', '320.00', '16.00', '2020-05-13 20:18:47', 199),
(500, 53, 0, 2, '364.00', '224.00', '588.00', '2020-05-13 20:18:47', 199),
(501, 66, 1, 1, '16.00', '2.00', '14.00', '2020-05-13 20:26:49', 200),
(502, 53, 1, 10, '588.00', '500.00', '88.00', '2020-05-13 20:28:28', 5),
(503, 66, 1, 1, '14.00', '2.00', '12.00', '2020-05-13 20:29:18', 201),
(504, 66, 1, 1, '12.00', '2.00', '10.00', '2020-05-13 20:34:36', 202),
(505, 66, 1, 1, '10.00', '2.00', '8.00', '2020-05-13 20:34:53', 203),
(506, 66, 1, 1, '8.00', '2.00', '6.00', '2020-05-13 20:39:23', 204),
(507, 35, 0, 11, '52.00', '48.00', '100.00', '2020-05-13 20:52:30', 177),
(508, 42, 0, 11, '0.00', '10.00', '10.00', '2020-05-14 00:41:57', 135),
(509, 70, 0, 13, '0.00', '38.00', '38.00', '2020-05-14 17:29:50', 2),
(510, 71, 0, 13, '0.00', '38.00', '38.00', '2020-05-14 17:33:28', 2),
(511, 35, 0, 11, '100.00', '10.00', '110.00', '2020-05-14 17:41:18', 180),
(512, 35, 1, 1, '110.00', '2.00', '108.00', '2020-05-14 19:38:46', 207),
(513, 35, 1, 1, '108.00', '2.00', '106.00', '2020-05-14 21:47:56', 208),
(514, 72, 0, 13, '0.00', '38.00', '38.00', '2020-05-15 00:53:12', 2),
(515, 72, 1, 1, '38.00', '2.00', '36.00', '2020-05-15 00:58:14', 210),
(516, 72, 1, 1, '36.00', '2.00', '34.00', '2020-05-15 00:58:25', 211),
(517, 72, 1, 1, '34.00', '2.00', '32.00', '2020-05-15 00:58:36', 212),
(518, 72, 1, 1, '32.00', '2.00', '30.00', '2020-05-15 00:58:50', 213),
(519, 30, 0, 11, '0.00', '10.00', '10.00', '2020-05-15 01:54:57', 181),
(520, 73, 0, 13, '0.00', '38.00', '38.00', '2020-05-15 10:39:41', 2),
(521, 73, 1, 1, '38.00', '2.00', '36.00', '2020-05-15 10:42:06', 215),
(522, 35, 0, 11, '106.00', '10.00', '116.00', '2020-05-15 10:44:25', 183),
(523, 74, 0, 13, '0.00', '38.00', '38.00', '2020-05-15 10:54:15', 2),
(524, 75, 0, 13, '0.00', '38.00', '38.00', '2020-05-15 11:17:42', 2),
(525, 39, 0, 11, '28.00', '16.00', '44.00', '2020-05-15 12:53:09', 179),
(526, 35, 1, 2, '116.00', '80.00', '36.00', '2020-05-15 20:56:55', 219),
(527, 76, 0, 2, '0.00', '56.00', '56.00', '2020-05-15 20:56:55', 219),
(528, 35, 1, 1, '36.00', '2.00', '34.00', '2020-05-15 20:57:01', 220),
(529, 35, 1, 1, '34.00', '2.00', '32.00', '2020-05-15 20:58:31', 221),
(530, 35, 1, 1, '32.00', '2.00', '30.00', '2020-05-15 20:59:08', 222),
(531, 35, 1, 1, '30.00', '2.00', '28.00', '2020-05-15 20:59:30', 223),
(532, 35, 1, 1, '28.00', '2.00', '26.00', '2020-05-15 20:59:42', 224),
(533, 35, 1, 1, '26.00', '2.00', '24.00', '2020-05-15 20:59:55', 225),
(534, 35, 1, 1, '24.00', '2.00', '22.00', '2020-05-15 21:00:16', 226),
(535, 35, 1, 1, '22.00', '2.00', '20.00', '2020-05-15 21:00:38', 227),
(536, 35, 1, 1, '20.00', '2.00', '18.00', '2020-05-15 21:01:27', 228),
(537, 35, 1, 1, '18.00', '2.00', '16.00', '2020-05-15 21:03:24', 229),
(538, 35, 1, 1, '16.00', '2.00', '14.00', '2020-05-15 21:04:03', 230),
(539, 35, 1, 1, '14.00', '2.00', '12.00', '2020-05-15 21:04:25', 231),
(540, 35, 1, 1, '12.00', '2.00', '10.00', '2020-05-15 21:04:40', 232),
(541, 35, 1, 1, '10.00', '8.00', '2.00', '2020-05-15 21:50:01', 233),
(542, 39, 0, 11, '44.00', '4.00', '48.00', '2020-05-16 10:02:13', 185),
(543, 28, 0, 11, '30.00', '75.00', '105.00', '2020-05-16 16:34:31', 126),
(544, 28, 0, 11, '105.00', '6.00', '111.00', '2020-05-16 16:34:31', 137),
(545, 28, 0, 11, '111.00', '18.00', '129.00', '2020-05-16 16:34:31', 143),
(546, 28, 0, 11, '129.00', '6.00', '135.00', '2020-05-16 16:34:31', 147),
(547, 28, 0, 11, '135.00', '6.00', '141.00', '2020-05-16 16:34:31', 151),
(548, 28, 0, 11, '141.00', '18.00', '159.00', '2020-05-16 16:34:31', 155),
(549, 28, 0, 11, '159.00', '6.00', '165.00', '2020-05-16 16:34:31', 159),
(550, 28, 0, 11, '165.00', '6.00', '171.00', '2020-05-16 16:34:31', 163),
(551, 28, 0, 11, '171.00', '12.00', '183.00', '2020-05-16 16:34:31', 167),
(552, 80, 0, 13, '0.00', '10.00', '10.00', '2020-05-18 22:42:49', 3),
(553, 81, 0, 13, '0.00', '10.00', '10.00', '2020-05-20 02:40:27', 3),
(554, 82, 0, 13, '0.00', '10.00', '10.00', '2020-05-22 15:45:01', 3),
(555, 83, 0, 13, '0.00', '10.00', '10.00', '2020-05-22 20:47:15', 3),
(556, 84, 0, 13, '0.00', '10.00', '10.00', '2020-05-24 15:25:36', 3),
(557, 46, 1, 1, '36.00', '2.00', '34.00', '2020-05-25 09:18:22', 237),
(558, 35, 0, 11, '2.00', '10.00', '12.00', '2020-05-25 15:49:31', 188),
(559, 85, 0, 13, '0.00', '10.00', '10.00', '2020-05-25 15:50:01', 3),
(560, 35, 0, 11, '12.00', '10.00', '22.00', '2020-05-25 17:00:31', 189),
(561, 86, 0, 13, '0.00', '10.00', '10.00', '2020-06-10 02:13:35', 3),
(562, 87, 0, 13, '0.00', '10.00', '10.00', '2020-06-13 15:05:43', 3),
(563, 87, 0, 7, '0.00', '10000.00', '10000.00', '2020-06-13 16:29:39', 190),
(564, 87, 0, 7, '10000.00', '10000.00', '20000.00', '2020-06-13 16:29:39', 191),
(565, 87, 0, 7, '20000.00', '100.00', '20100.00', '2020-06-13 16:29:39', 192),
(566, 87, 0, 7, '20100.00', '200.00', '20300.00', '2020-06-13 16:29:39', 193),
(567, 87, 0, 7, '20300.00', '1000.00', '21300.00', '2020-06-13 16:29:39', 194),
(568, 87, 1, 9, '21310.00', '40.00', '21270.00', '2020-06-13 16:30:49', 239),
(569, 89, 0, 9, '0.00', '28.00', '28.00', '2020-06-13 16:30:49', 239),
(570, 87, 1, 2, '21270.00', '40.00', '21230.00', '2020-06-13 16:31:13', 240),
(571, 89, 0, 2, '28.00', '28.00', '56.00', '2020-06-13 16:31:13', 240),
(572, 87, 1, 2, '21230.00', '40.00', '21190.00', '2020-06-13 16:32:12', 241),
(573, 89, 0, 2, '56.00', '28.00', '84.00', '2020-06-13 16:32:12', 241),
(574, 90, 0, 13, '0.00', '10.00', '10.00', '2020-06-13 17:07:55', 3),
(575, 90, 1, 1, '10.00', '2.00', '8.00', '2020-06-13 17:09:07', 243),
(576, 90, 1, 1, '8.00', '2.00', '6.00', '2020-06-13 17:09:24', 244),
(577, 90, 1, 1, '6.00', '2.00', '4.00', '2020-06-13 17:09:29', 245),
(578, 28, 0, 11, '183.00', '10.00', '193.00', '2020-06-13 17:55:17', 195),
(579, 87, 1, 1, '21190.00', '2.00', '21188.00', '2020-06-16 00:51:12', 246),
(580, 87, 1, 1, '21188.00', '2.00', '21186.00', '2020-06-16 00:51:39', 247),
(581, 87, 1, 6, '21186.00', '300.00', '20886.00', '2020-06-16 15:28:49', 248),
(582, 52, 0, 6, '0.00', '210.00', '210.00', '2020-06-16 15:28:49', 248),
(583, 92, 0, 13, '0.00', '10.00', '10.00', '2020-06-17 18:11:07', 3),
(584, 93, 0, 13, '0.00', '10.00', '10.00', '2020-06-18 01:02:12', 3),
(585, 87, 1, 1, '20886.00', '2.00', '20884.00', '2020-06-18 02:14:27', 249),
(586, 87, 1, 1, '20884.00', '2.00', '20882.00', '2020-06-18 17:50:25', 250),
(587, 87, 1, 5, '20882.00', '500.00', '20382.00', '2020-06-18 17:54:44', 251),
(588, 89, 0, 5, '84.00', '350.00', '434.00', '2020-06-18 17:54:44', 251),
(589, 87, 1, 5, '20382.00', '500.00', '19882.00', '2020-06-19 15:15:37', 252),
(590, 34, 0, 5, '0.00', '350.00', '350.00', '2020-06-19 15:15:37', 252),
(591, 94, 0, 13, '0.00', '10.00', '10.00', '2020-06-19 22:11:19', 3),
(592, 89, 0, 0, '0.00', '58.00', '58.00', '2020-06-19 23:23:21', 93),
(593, 87, 0, 0, '0.00', '58.00', '58.00', '2020-06-19 23:26:35', 94),
(594, 94, 0, 0, '10.00', '58.00', '68.00', '2020-06-19 23:26:42', 95),
(595, 87, 0, 0, '58.00', '58.00', '116.00', '2020-06-19 23:28:02', 96),
(596, 89, 0, 0, '58.00', '58.00', '116.00', '2020-06-19 23:29:17', 97),
(597, 28, 0, 0, '0.00', '58.00', '58.00', '2020-06-20 00:08:05', 98),
(598, 87, 0, 0, '116.00', '58.00', '174.00', '2020-06-20 01:26:50', 99),
(599, 89, 0, 0, '116.00', '58.00', '174.00', '2020-06-20 01:29:42', 100),
(600, 89, 0, 0, '174.00', '58.00', '232.00', '2020-06-20 01:30:12', 101),
(601, 95, 0, 13, '0.00', '10.00', '10.00', '2020-06-20 23:38:15', 3),
(602, 96, 0, 13, '0.00', '10.00', '10.00', '2020-06-21 00:12:01', 3),
(603, 96, 0, 8, '0.00', '0.00', '0.00', '2020-06-21 00:13:34', 0),
(604, 96, 0, 0, '10.00', '58.00', '68.00', '2020-06-21 00:14:58', 102),
(605, 96, 0, 7, '0.00', '100000.00', '100000.00', '2020-06-21 00:15:48', 198),
(606, 97, 0, 7, '0.00', '100.00', '100.00', '2020-06-22 00:15:18', 199);

-- --------------------------------------------------------

--
-- 表的结构 `t_weixinpay_setup`
--

CREATE TABLE IF NOT EXISTS `t_weixinpay_setup` (
  `t_id` int(11) NOT NULL,
  `appId` varchar(100) DEFAULT NULL,
  `t_mchid` varchar(100) DEFAULT NULL,
  `t_mchid_key` varchar(255) DEFAULT NULL,
  `t_pay_id` int(11) DEFAULT NULL,
  `t_certificate_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `t_yellowing_error`
--

CREATE TABLE IF NOT EXISTS `t_yellowing_error` (
  `t_id` int(11) NOT NULL,
  `t_user_id` int(11) DEFAULT NULL,
  `t_room_msg` varchar(1000) DEFAULT NULL,
  `t_content` varchar(1000) DEFAULT NULL,
  `t_create_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_activity`
--
ALTER TABLE `t_activity`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_activity_detail`
--
ALTER TABLE `t_activity_detail`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_admin`
--
ALTER TABLE `t_admin`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_ad_table`
--
ALTER TABLE `t_ad_table`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_album`
--
ALTER TABLE `t_album`
  ADD PRIMARY KEY (`t_id`),
  ADD KEY `t_user_id` (`t_user_id`,`t_is_private`,`t_auditing_type`) USING BTREE;

--
-- Indexes for table `t_alipay_setup`
--
ALTER TABLE `t_alipay_setup`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_anchor`
--
ALTER TABLE `t_anchor`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_anchor_devote`
--
ALTER TABLE `t_anchor_devote`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_anchor_guild`
--
ALTER TABLE `t_anchor_guild`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_anchor_setup`
--
ALTER TABLE `t_anchor_setup`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_authority`
--
ALTER TABLE `t_authority`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_award_record`
--
ALTER TABLE `t_award_record`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_balance`
--
ALTER TABLE `t_balance`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_banned_setup`
--
ALTER TABLE `t_banned_setup`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_banner`
--
ALTER TABLE `t_banner`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_big_room_man`
--
ALTER TABLE `t_big_room_man`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_big_room_viewer`
--
ALTER TABLE `t_big_room_viewer`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_black_user`
--
ALTER TABLE `t_black_user`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_browse`
--
ALTER TABLE `t_browse`
  ADD PRIMARY KEY (`t_browse_id`),
  ADD KEY `t_browse_user` (`t_browse_user`,`t_cover_browse`,`t_create_time`) USING BTREE;

--
-- Indexes for table `t_call_log`
--
ALTER TABLE `t_call_log`
  ADD PRIMARY KEY (`t_id`),
  ADD KEY `t_callout_user` (`t_callout_user`,`t_answer_user`,`t_state`) USING BTREE;

--
-- Indexes for table `t_certification`
--
ALTER TABLE `t_certification`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_channel_pac`
--
ALTER TABLE `t_channel_pac`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_channel_pac_dow_log`
--
ALTER TABLE `t_channel_pac_dow_log`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_check_user_info`
--
ALTER TABLE `t_check_user_info`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_comment`
--
ALTER TABLE `t_comment`
  ADD PRIMARY KEY (`t_id`),
  ADD KEY `t_com_user_id` (`t_com_user_id`,`t_cover_user_id`) USING BTREE;

--
-- Indexes for table `t_comment_count`
--
ALTER TABLE `t_comment_count`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_coordinate`
--
ALTER TABLE `t_coordinate`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_cover_examine`
--
ALTER TABLE `t_cover_examine`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_cps`
--
ALTER TABLE `t_cps`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_cps_bulletin`
--
ALTER TABLE `t_cps_bulletin`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_cps_day_income`
--
ALTER TABLE `t_cps_day_income`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_cps_devote`
--
ALTER TABLE `t_cps_devote`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_cps_dow`
--
ALTER TABLE `t_cps_dow`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_cps_material`
--
ALTER TABLE `t_cps_material`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_cps_settlement`
--
ALTER TABLE `t_cps_settlement`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_cps_user`
--
ALTER TABLE `t_cps_user`
  ADD PRIMARY KEY (`t_id`),
  ADD UNIQUE KEY `t_login_phone` (`t_login_phone`) USING BTREE;

--
-- Indexes for table `t_device`
--
ALTER TABLE `t_device`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_device_login_log`
--
ALTER TABLE `t_device_login_log`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_disable`
--
ALTER TABLE `t_disable`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_discount`
--
ALTER TABLE `t_discount`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_discuss_record`
--
ALTER TABLE `t_discuss_record`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_domainnamepool`
--
ALTER TABLE `t_domainnamepool`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_dynamic`
--
ALTER TABLE `t_dynamic`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_dynamic_file`
--
ALTER TABLE `t_dynamic_file`
  ADD PRIMARY KEY (`t_id`),
  ADD KEY `t_dynamic_id` (`t_dynamic_id`,`t_file_type`) USING BTREE;

--
-- Indexes for table `t_enroll`
--
ALTER TABLE `t_enroll`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_extract`
--
ALTER TABLE `t_extract`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_feedback`
--
ALTER TABLE `t_feedback`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_financial_statements`
--
ALTER TABLE `t_financial_statements`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_follow`
--
ALTER TABLE `t_follow`
  ADD PRIMARY KEY (`t_id`),
  ADD KEY `t_follow_id` (`t_follow_id`,`t_cover_follow`,`t_create_time`) USING BTREE;

--
-- Indexes for table `t_free_anthor`
--
ALTER TABLE `t_free_anthor`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_gift`
--
ALTER TABLE `t_gift`
  ADD PRIMARY KEY (`t_gift_id`);

--
-- Indexes for table `t_gift_record`
--
ALTER TABLE `t_gift_record`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_give_gold_notice`
--
ALTER TABLE `t_give_gold_notice`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_guild`
--
ALTER TABLE `t_guild`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_guild_invite`
--
ALTER TABLE `t_guild_invite`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_help_center`
--
ALTER TABLE `t_help_center`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_home_table`
--
ALTER TABLE `t_home_table`
  ADD PRIMARY KEY (`t_id`),
  ADD UNIQUE KEY `userId` (`t_id`) USING BTREE COMMENT '用户Id唯一索引';

--
-- Indexes for table `t_im_fitler`
--
ALTER TABLE `t_im_fitler`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_im_log`
--
ALTER TABLE `t_im_log`
  ADD PRIMARY KEY (`t_id`),
  ADD KEY `t_send_user_id` (`t_user_name`,`t_cover_idcard`) USING BTREE;

--
-- Indexes for table `t_label`
--
ALTER TABLE `t_label`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_login_setup`
--
ALTER TABLE `t_login_setup`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_log_time`
--
ALTER TABLE `t_log_time`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_menu`
--
ALTER TABLE `t_menu`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_message`
--
ALTER TABLE `t_message`
  ADD PRIMARY KEY (`t_id`),
  ADD KEY `t_user_id` (`t_user_id`,`t_is_see`) USING BTREE;

--
-- Indexes for table `t_object_storage`
--
ALTER TABLE `t_object_storage`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_order`
--
ALTER TABLE `t_order`
  ADD PRIMARY KEY (`t_id`),
  ADD KEY `t_consume` (`t_consume`,`t_cover_consume`,`t_consume_type`,`t_amount`,`t_create_time`) USING BTREE;

--
-- Indexes for table `t_pay_dispose`
--
ALTER TABLE `t_pay_dispose`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_platform_income`
--
ALTER TABLE `t_platform_income`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_praise`
--
ALTER TABLE `t_praise`
  ADD PRIMARY KEY (`t_id`),
  ADD KEY `t_praise_user` (`t_praise_user`,`t_cover_praise_user`,`t_dynamic_id`) USING BTREE;

--
-- Indexes for table `t_private_collection`
--
ALTER TABLE `t_private_collection`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_profit_detail`
--
ALTER TABLE `t_profit_detail`
  ADD PRIMARY KEY (`t_profit_id`);

--
-- Indexes for table `t_put_forward`
--
ALTER TABLE `t_put_forward`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_put_forward_data`
--
ALTER TABLE `t_put_forward_data`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_ranking_control`
--
ALTER TABLE `t_ranking_control`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_reception_rate`
--
ALTER TABLE `t_reception_rate`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_recharge`
--
ALTER TABLE `t_recharge`
  ADD PRIMARY KEY (`t_id`),
  ADD KEY `t_user_id` (`t_user_id`,`t_recharge_money`,`t_order_no`,`t_order_state`) USING BTREE;

--
-- Indexes for table `t_redpacket_log`
--
ALTER TABLE `t_redpacket_log`
  ADD PRIMARY KEY (`t_redpacket_id`),
  ADD KEY `t_hair_userId` (`t_hair_userId`,`t_receive_userId`,`t_redpacket_type`) USING BTREE;

--
-- Indexes for table `t_report`
--
ALTER TABLE `t_report`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_role`
--
ALTER TABLE `t_role`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_room_time`
--
ALTER TABLE `t_room_time`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_send_sentence`
--
ALTER TABLE `t_send_sentence`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_sentence`
--
ALTER TABLE `t_sentence`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_set_meal`
--
ALTER TABLE `t_set_meal`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_share_notes`
--
ALTER TABLE `t_share_notes`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_simulation`
--
ALTER TABLE `t_simulation`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_sms_steup`
--
ALTER TABLE `t_sms_steup`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_speeddating`
--
ALTER TABLE `t_speeddating`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_speed_manage`
--
ALTER TABLE `t_speed_manage`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_spread`
--
ALTER TABLE `t_spread`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_spread_award`
--
ALTER TABLE `t_spread_award`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_spread_channel`
--
ALTER TABLE `t_spread_channel`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_spreed_img`
--
ALTER TABLE `t_spreed_img`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_style_setup`
--
ALTER TABLE `t_style_setup`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_system_setup`
--
ALTER TABLE `t_system_setup`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_user`
--
ALTER TABLE `t_user`
  ADD PRIMARY KEY (`t_id`),
  ADD KEY `t_idcard` (`t_idcard`,`t_sex`,`t_phone`,`t_create_time`,`t_referee`,`t_role`,`t_disable`,`t_is_vip`,`t_onLine`) USING BTREE;

--
-- Indexes for table `t_user_evaluation`
--
ALTER TABLE `t_user_evaluation`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_user_label`
--
ALTER TABLE `t_user_label`
  ADD PRIMARY KEY (`t_user_lable_id`),
  ADD KEY `t_user_id` (`t_user_id`,`t_lable_id`) USING BTREE;

--
-- Indexes for table `t_user_laud`
--
ALTER TABLE `t_user_laud`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_user_sentence`
--
ALTER TABLE `t_user_sentence`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_vague_check`
--
ALTER TABLE `t_vague_check`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_version`
--
ALTER TABLE `t_version`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_video_record`
--
ALTER TABLE `t_video_record`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_vip`
--
ALTER TABLE `t_vip`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_vip_setmeal`
--
ALTER TABLE `t_vip_setmeal`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_virtual`
--
ALTER TABLE `t_virtual`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_wallet_detail`
--
ALTER TABLE `t_wallet_detail`
  ADD PRIMARY KEY (`t_id`),
  ADD KEY `t_user_id` (`t_user_id`,`t_change_type`,`t_change_category`,`t_value`,`t_change_time`) USING BTREE;

--
-- Indexes for table `t_weixinpay_setup`
--
ALTER TABLE `t_weixinpay_setup`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `t_yellowing_error`
--
ALTER TABLE `t_yellowing_error`
  ADD PRIMARY KEY (`t_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `t_activity`
--
ALTER TABLE `t_activity`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_activity_detail`
--
ALTER TABLE `t_activity_detail`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_admin`
--
ALTER TABLE `t_admin`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `t_ad_table`
--
ALTER TABLE `t_ad_table`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键Id',AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `t_album`
--
ALTER TABLE `t_album`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT for table `t_alipay_setup`
--
ALTER TABLE `t_alipay_setup`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `t_anchor`
--
ALTER TABLE `t_anchor`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_anchor_devote`
--
ALTER TABLE `t_anchor_devote`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `t_anchor_guild`
--
ALTER TABLE `t_anchor_guild`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `t_anchor_setup`
--
ALTER TABLE `t_anchor_setup`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `t_authority`
--
ALTER TABLE `t_authority`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3213;
--
-- AUTO_INCREMENT for table `t_award_record`
--
ALTER TABLE `t_award_record`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_balance`
--
ALTER TABLE `t_balance`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=98;
--
-- AUTO_INCREMENT for table `t_banned_setup`
--
ALTER TABLE `t_banned_setup`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `t_banner`
--
ALTER TABLE `t_banner`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `t_big_room_man`
--
ALTER TABLE `t_big_room_man`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_big_room_viewer`
--
ALTER TABLE `t_big_room_viewer`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_black_user`
--
ALTER TABLE `t_black_user`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_browse`
--
ALTER TABLE `t_browse`
  MODIFY `t_browse_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2131;
--
-- AUTO_INCREMENT for table `t_call_log`
--
ALTER TABLE `t_call_log`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=180;
--
-- AUTO_INCREMENT for table `t_certification`
--
ALTER TABLE `t_certification`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `t_channel_pac`
--
ALTER TABLE `t_channel_pac`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_channel_pac_dow_log`
--
ALTER TABLE `t_channel_pac_dow_log`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_comment`
--
ALTER TABLE `t_comment`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_comment_count`
--
ALTER TABLE `t_comment_count`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_coordinate`
--
ALTER TABLE `t_coordinate`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=65;
--
-- AUTO_INCREMENT for table `t_cover_examine`
--
ALTER TABLE `t_cover_examine`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `t_cps`
--
ALTER TABLE `t_cps`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_cps_bulletin`
--
ALTER TABLE `t_cps_bulletin`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_cps_day_income`
--
ALTER TABLE `t_cps_day_income`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_cps_devote`
--
ALTER TABLE `t_cps_devote`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_cps_dow`
--
ALTER TABLE `t_cps_dow`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_cps_material`
--
ALTER TABLE `t_cps_material`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_cps_settlement`
--
ALTER TABLE `t_cps_settlement`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_cps_user`
--
ALTER TABLE `t_cps_user`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_device`
--
ALTER TABLE `t_device`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=121;
--
-- AUTO_INCREMENT for table `t_device_login_log`
--
ALTER TABLE `t_device_login_log`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `t_disable`
--
ALTER TABLE `t_disable`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `t_discount`
--
ALTER TABLE `t_discount`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_discuss_record`
--
ALTER TABLE `t_discuss_record`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `t_domainnamepool`
--
ALTER TABLE `t_domainnamepool`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `t_dynamic`
--
ALTER TABLE `t_dynamic`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `t_dynamic_file`
--
ALTER TABLE `t_dynamic_file`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `t_enroll`
--
ALTER TABLE `t_enroll`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `t_extract`
--
ALTER TABLE `t_extract`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `t_feedback`
--
ALTER TABLE `t_feedback`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `t_financial_statements`
--
ALTER TABLE `t_financial_statements`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `t_follow`
--
ALTER TABLE `t_follow`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `t_free_anthor`
--
ALTER TABLE `t_free_anthor`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_gift`
--
ALTER TABLE `t_gift`
  MODIFY `t_gift_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `t_gift_record`
--
ALTER TABLE `t_gift_record`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_give_gold_notice`
--
ALTER TABLE `t_give_gold_notice`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `t_guild`
--
ALTER TABLE `t_guild`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `t_guild_invite`
--
ALTER TABLE `t_guild_invite`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_help_center`
--
ALTER TABLE `t_help_center`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `t_im_fitler`
--
ALTER TABLE `t_im_fitler`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `t_im_log`
--
ALTER TABLE `t_im_log`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1033;
--
-- AUTO_INCREMENT for table `t_label`
--
ALTER TABLE `t_label`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `t_login_setup`
--
ALTER TABLE `t_login_setup`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `t_log_time`
--
ALTER TABLE `t_log_time`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1679;
--
-- AUTO_INCREMENT for table `t_menu`
--
ALTER TABLE `t_menu`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=88;
--
-- AUTO_INCREMENT for table `t_message`
--
ALTER TABLE `t_message`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=296;
--
-- AUTO_INCREMENT for table `t_object_storage`
--
ALTER TABLE `t_object_storage`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `t_order`
--
ALTER TABLE `t_order`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=253;
--
-- AUTO_INCREMENT for table `t_pay_dispose`
--
ALTER TABLE `t_pay_dispose`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `t_praise`
--
ALTER TABLE `t_praise`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `t_private_collection`
--
ALTER TABLE `t_private_collection`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_profit_detail`
--
ALTER TABLE `t_profit_detail`
  MODIFY `t_profit_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=134;
--
-- AUTO_INCREMENT for table `t_put_forward`
--
ALTER TABLE `t_put_forward`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `t_put_forward_data`
--
ALTER TABLE `t_put_forward_data`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_ranking_control`
--
ALTER TABLE `t_ranking_control`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `t_reception_rate`
--
ALTER TABLE `t_reception_rate`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `t_recharge`
--
ALTER TABLE `t_recharge`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=103;
--
-- AUTO_INCREMENT for table `t_redpacket_log`
--
ALTER TABLE `t_redpacket_log`
  MODIFY `t_redpacket_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=200;
--
-- AUTO_INCREMENT for table `t_report`
--
ALTER TABLE `t_report`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_role`
--
ALTER TABLE `t_role`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `t_room_time`
--
ALTER TABLE `t_room_time`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_send_sentence`
--
ALTER TABLE `t_send_sentence`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `t_sentence`
--
ALTER TABLE `t_sentence`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `t_set_meal`
--
ALTER TABLE `t_set_meal`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=64;
--
-- AUTO_INCREMENT for table `t_share_notes`
--
ALTER TABLE `t_share_notes`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_simulation`
--
ALTER TABLE `t_simulation`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `t_sms_steup`
--
ALTER TABLE `t_sms_steup`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `t_speeddating`
--
ALTER TABLE `t_speeddating`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `t_speed_manage`
--
ALTER TABLE `t_speed_manage`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `t_spread`
--
ALTER TABLE `t_spread`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_spread_award`
--
ALTER TABLE `t_spread_award`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `t_spread_channel`
--
ALTER TABLE `t_spread_channel`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_spreed_img`
--
ALTER TABLE `t_spreed_img`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `t_style_setup`
--
ALTER TABLE `t_style_setup`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `t_system_setup`
--
ALTER TABLE `t_system_setup`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `t_user`
--
ALTER TABLE `t_user`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=98;
--
-- AUTO_INCREMENT for table `t_user_evaluation`
--
ALTER TABLE `t_user_evaluation`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `t_user_label`
--
ALTER TABLE `t_user_label`
  MODIFY `t_user_lable_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT for table `t_user_laud`
--
ALTER TABLE `t_user_laud`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `t_user_sentence`
--
ALTER TABLE `t_user_sentence`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `t_vague_check`
--
ALTER TABLE `t_vague_check`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_version`
--
ALTER TABLE `t_version`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `t_video_record`
--
ALTER TABLE `t_video_record`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_vip`
--
ALTER TABLE `t_vip`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `t_vip_setmeal`
--
ALTER TABLE `t_vip_setmeal`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `t_virtual`
--
ALTER TABLE `t_virtual`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `t_wallet_detail`
--
ALTER TABLE `t_wallet_detail`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=607;
--
-- AUTO_INCREMENT for table `t_weixinpay_setup`
--
ALTER TABLE `t_weixinpay_setup`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_yellowing_error`
--
ALTER TABLE `t_yellowing_error`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
