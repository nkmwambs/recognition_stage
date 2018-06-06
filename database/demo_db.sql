-- Adminer 4.3.1 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `access`;
CREATE TABLE `access` (
  `access_id` int(100) NOT NULL AUTO_INCREMENT,
  `entitlement_id` int(100) NOT NULL,
  `profile_id` int(10) NOT NULL,
  PRIMARY KEY (`access_id`),
  KEY `privilege_id` (`entitlement_id`),
  CONSTRAINT `access_ibfk_1` FOREIGN KEY (`entitlement_id`) REFERENCES `entitlement` (`entitlement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `access` (`access_id`, `entitlement_id`, `profile_id`) VALUES
(0,	59,	7),
(1,	32,	8),
(2,	26,	7),
(3,	1,	7),
(4,	2,	7),
(5,	3,	7),
(6,	4,	7),
(7,	5,	7),
(8,	2,	1),
(9,	5,	1),
(10,	8,	7),
(11,	9,	7),
(12,	10,	7),
(13,	12,	7),
(14,	13,	7),
(15,	14,	7),
(16,	15,	7),
(17,	16,	7),
(18,	17,	7),
(19,	18,	7),
(20,	19,	7),
(21,	20,	7),
(22,	23,	7),
(23,	24,	7),
(24,	25,	7),
(25,	27,	7),
(26,	28,	7),
(27,	29,	7),
(28,	30,	7),
(29,	31,	7),
(30,	32,	7),
(31,	33,	7),
(32,	34,	7),
(33,	35,	7),
(34,	36,	7),
(35,	37,	7),
(36,	38,	7),
(37,	39,	7),
(38,	40,	7),
(39,	41,	7),
(40,	42,	7),
(41,	43,	7),
(42,	44,	7),
(43,	45,	7),
(44,	46,	7),
(45,	47,	7),
(46,	48,	7),
(47,	49,	7),
(48,	50,	7),
(49,	51,	7),
(50,	52,	7),
(51,	53,	7),
(52,	54,	7),
(53,	6,	7),
(54,	55,	7),
(55,	56,	7),
(56,	57,	7),
(57,	62,	7),
(58,	7,	7),
(59,	58,	7),
(60,	60,	7),
(61,	21,	7),
(64,	1,	2),
(65,	2,	2),
(66,	4,	2),
(67,	10,	2),
(68,	12,	2),
(69,	13,	2),
(70,	16,	2),
(71,	19,	2),
(72,	20,	2),
(96,	1,	3),
(98,	23,	3),
(100,	18,	0),
(101,	23,	1),
(639,	2,	2),
(640,	32,	0),
(641,	32,	0),
(643,	4,	8),
(647,	63,	7),
(649,	61,	7),
(651,	64,	7);

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `grouping_id` int(100) NOT NULL,
  `visibility` int(100) NOT NULL COMMENT '1=all countries, country_ids',
  `assignment` varchar(20) NOT NULL COMMENT '2=>manager,1=>peer',
  `unit` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '0=inactive,1=active',
  `created_date` datetime NOT NULL,
  `created_by` int(100) NOT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_by` int(100) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `category` (`category_id`, `name`, `description`, `grouping_id`, `visibility`, `assignment`, `unit`, `status`, `created_date`, `created_by`, `last_modified_date`, `last_modified_by`) VALUES
(2,	'Customer service ',	'<p>\r\n	Customer service to Colleagues, Partners, Suppliers, Beneficiaries</p>\r\n',	1,	1,	'1',	4,	1,	'2018-06-04 11:46:54',	1,	'2018-06-04 17:46:54',	1),
(3,	'Innovative initiative ',	'<p>\r\n	Innovative initiative&nbsp;</p>\r\n',	1,	1,	'1',	4,	1,	'2018-06-04 11:47:34',	1,	'2018-06-04 17:47:34',	1),
(4,	'Innovative initiative ',	'<p>\r\n	Innovative initiative&nbsp;</p>\r\n',	2,	1,	'2',	4,	1,	'2018-06-04 11:48:17',	1,	'2018-06-04 17:48:17',	1),
(5,	'Demonstration of Excellent leadership ',	'<p>\r\n	Demonstration of Excellent leadership&nbsp;</p>\r\n',	2,	1,	'2',	4,	1,	'2018-06-04 11:49:11',	1,	'2018-06-04 17:49:11',	1),
(6,	'Demonstration of Excellent leadership ',	'<p>\r\n	Demonstration of Excellent leadership&nbsp;</p>\r\n',	1,	1,	'1',	4,	1,	'2018-06-04 11:49:43',	1,	'2018-06-04 17:49:43',	1),
(7,	'Excellent Performance ',	'<p>\r\n	Excellent Performance&nbsp;</p>\r\n',	2,	1,	'2',	4,	1,	'2018-06-04 11:52:17',	1,	'2018-06-04 17:52:17',	1),
(8,	'Outstanding demonstration of Cultural behaviors',	'<p>\r\n	Outstanding demonstration of Cultural behaviors</p>\r\n',	1,	1,	'1',	4,	1,	'2018-06-04 08:14:59',	1,	'2018-06-04 18:14:59',	1),
(9,	'Team Dedication to Service',	'<p>\r\n	Team Dedication to Service</p>\r\n',	1,	1,	'1',	3,	1,	'2018-06-06 12:38:53',	1,	'2018-06-06 10:38:53',	1);

DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE `ci_sessions` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('080ad2afa8bd99806409cd519ab41c20862f31d1',	'::1',	1528273230,	'__ci_last_regenerate|i:1528272955;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"account\";'),
('0d85fec56ed312151a410f4600f974a20316d19d',	'::1',	1528286276,	'__ci_last_regenerate|i:1528285653;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"account\";'),
('138a52b1a46cf0eca926f3fdd747d77e62f5c11f',	'::1',	1528272452,	'__ci_last_regenerate|i:1528272302;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"account\";'),
('22cd89fb4f67d8fd3bafcbf03cf4ba900f693db2',	'::1',	1528275185,	'__ci_last_regenerate|i:1528275180;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"surveys\";'),
('2595af9bb7e70f709288cc45abe716d4f74f2cb4',	'::1',	1528286306,	'__ci_last_regenerate|i:1528286305;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"account\";'),
('25f7ae881c57452f114d63b7898ca412bfc5d36d',	'::1',	1528297509,	'__ci_last_regenerate|i:1528297439;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:9:\"dashboard\";'),
('34e9573904965a7ba49ecc3701f1dbc45d9a30e5',	'::1',	1528296913,	'__ci_last_regenerate|i:1528296693;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:9:\"dashboard\";'),
('391607b083a98709226ab7374ce9faa03382238a',	'::1',	1528270973,	'__ci_last_regenerate|i:1528270872;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"account\";'),
('39b494da6e72030a399f6812278521122cda21f9',	'::1',	1528273624,	'__ci_last_regenerate|i:1528273607;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"account\";'),
('45d40610f39b270e52f7f28fec29c747708705c1',	'::1',	1528296499,	'__ci_last_regenerate|i:1528296240;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:9:\"dashboard\";'),
('46fc3e3bbedf1ef7674afe199dc764feec2fc7fd',	'::1',	1528283024,	'__ci_last_regenerate|i:1528282757;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:9:\"Dashboard\";'),
('4d28321e073ed79977eaa4e19cd65990f50ddc30',	'::1',	1528267211,	'__ci_last_regenerate|i:1528267170;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"account\";'),
('52cf1d9b5a5826b1b7596fa41125fd9c675efa34',	'::1',	1528279796,	'__ci_last_regenerate|i:1528279751;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"account\";'),
('5dca50a9009ada9271a835b9507b7a305ddca6b7',	'::1',	1528271803,	'__ci_last_regenerate|i:1528271505;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"account\";'),
('663966859bfea9e24dd2b1fdab1af8def02078ba',	'::1',	1528272051,	'__ci_last_regenerate|i:1528271949;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"account\";'),
('6f1dcfe1e034cd33f0d4091f8e7eb91613f71416',	'::1',	1528281571,	'__ci_last_regenerate|i:1528281406;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"account\";'),
('7550784a11a33720ca61f8048a70e8d0994a6cf4',	'::1',	1528267564,	'__ci_last_regenerate|i:1528267554;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"account\";'),
('8501c72d97663d0709ab71d2029ad4019ed48814',	'::1',	1528259357,	'__ci_last_regenerate|i:1528259106;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:9:\"Dashboard\";'),
('85ab94be755b865e4dba2a8943e1fac76a5dea4b',	'::1',	1528268072,	'__ci_last_regenerate|i:1528267872;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"account\";'),
('88043c2cc787916e291adcef37d280389bcc309e',	'127.0.0.1',	1528281556,	'__ci_last_regenerate|i:1528281555;user_login|s:1:\"1\";login_user_id|s:1:\"9\";name|s:5:\"Evans\";login_type|s:23:\"Partnership Facilitator\";profile_id|s:1:\"8\";country_id|s:2:\"25\";view_type|s:7:\"surveys\";'),
('991316ffe92ee8ac57a489cc1e8db694aff296f9',	'::1',	1528258741,	'__ci_last_regenerate|i:1528258379;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";'),
('9b92d3cc26da1d639d40da4cffff8084d5ef2c2d',	'::1',	1528260188,	'__ci_last_regenerate|i:1528260114;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"account\";'),
('9d6fef204ae3de88e999267f251730343ab5e406',	'::1',	1528274325,	'__ci_last_regenerate|i:1528274324;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:9:\"Dashboard\";'),
('af89d0d7efae1d5dee8988844efee38c785e3fbb',	'::1',	1528258978,	'__ci_last_regenerate|i:1528258743;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:9:\"Dashboard\";'),
('b039a2c567c706d6dd8259aaba08a4457f3e3dde',	'::1',	1528283408,	'__ci_last_regenerate|i:1528283069;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"account\";'),
('b0b5e32234f237a7531c27e35b42ed151e7c872c',	'::1',	1528297292,	'__ci_last_regenerate|i:1528297003;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:9:\"dashboard\";'),
('b191ce48291031345cc834a9d6ee0a818b2d63c0',	'::1',	1528283944,	'__ci_last_regenerate|i:1528283704;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"account\";'),
('bea9409776cb4a5cbb32fae82a14c9dde0d0abe5',	'::1',	1528281137,	'__ci_last_regenerate|i:1528281017;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"account\";'),
('cbc3ef298c7fcb95bc6b78d51e5fb7fc4d2a5f44',	'::1',	1528266215,	'__ci_last_regenerate|i:1528266207;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"account\";'),
('ccefb2821fc02c86902d6b86f17b749bbbdf02e0',	'::1',	1528269040,	'__ci_last_regenerate|i:1528268885;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"account\";'),
('d10badfc85c547d28539da0cbfe30ca984ed6b1b',	'::1',	1528268795,	'__ci_last_regenerate|i:1528268576;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"account\";'),
('d40abbcfbe7aebe34c08db5e350718d93d8090df',	'127.0.0.1',	1528282738,	'__ci_last_regenerate|i:1528282545;user_login|s:1:\"1\";login_user_id|s:1:\"9\";name|s:5:\"Evans\";login_type|s:23:\"Partnership Facilitator\";profile_id|s:1:\"8\";country_id|s:2:\"25\";view_type|s:7:\"surveys\";'),
('d92ff8f2381f6f23041df926cefd04644b4b4124',	'127.0.0.1',	1528281118,	'__ci_last_regenerate|i:1528281098;user_login|s:1:\"1\";login_user_id|s:1:\"9\";name|s:5:\"Evans\";login_type|s:23:\"Partnership Facilitator\";profile_id|s:1:\"8\";country_id|s:2:\"25\";view_type|s:7:\"surveys\";flash_message|s:7:\"Success\";__ci_vars|a:1:{s:13:\"flash_message\";s:3:\"old\";}'),
('e6f272f46a8fdc6577547fc2caadc24333299445',	'::1',	1528266663,	'__ci_last_regenerate|i:1528266617;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"account\";'),
('ef694cd273f6031bf4e28fee25d6dea94fc4fc2c',	'::1',	1528289395,	'__ci_last_regenerate|i:1528289390;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:9:\"Dashboard\";'),
('f31e0b6bc4e19020761eddf6b938cf71ce5ef15b',	'::1',	1528285630,	'__ci_last_regenerate|i:1528284164;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"account\";'),
('f6d4b2529803f0583fc5090277610b23b273d0f3',	'::1',	1528260054,	'__ci_last_regenerate|i:1528259795;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"account\";'),
('fbdc33a270461f187c0bcbba746817da1c32957a',	'::1',	1528276201,	'__ci_last_regenerate|i:1528276200;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:9:\"Dashboard\";'),
('fe1023898b4e99a6848ec0cbb10a7872e020a4e0',	'::1',	1528259485,	'__ci_last_regenerate|i:1528259417;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"account\";');

DROP TABLE IF EXISTS `contribution`;
CREATE TABLE `contribution` (
  `contribution_id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`contribution_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `contribution` (`contribution_id`, `name`) VALUES
(1,	'staff'),
(2,	'manager');

DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `country_id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `created_date` datetime NOT NULL,
  `created_by` int(100) NOT NULL,
  `last_modified_by` int(100) NOT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `country` (`country_id`, `name`, `created_date`, `created_by`, `last_modified_by`, `last_modified_date`) VALUES
(1,	'All',	'0000-00-00 00:00:00',	0,	0,	'2018-05-31 13:38:14'),
(25,	'Kenya',	'0000-00-00 00:00:00',	0,	0,	'2018-05-31 13:38:14'),
(26,	'Uganda',	'0000-00-00 00:00:00',	0,	0,	'2018-05-31 13:38:14'),
(27,	'Rwanda',	'0000-00-00 00:00:00',	0,	0,	'2018-05-31 13:38:14'),
(28,	'Tanzania',	'0000-00-00 00:00:00',	0,	0,	'2018-05-31 13:38:14'),
(31,	'Ghana',	'0000-00-00 00:00:00',	0,	0,	'2018-05-31 13:38:14'),
(34,	'Togo',	'0000-00-00 00:00:00',	0,	0,	'2018-06-06 06:54:00'),
(35,	'Burkina Faso',	'0000-00-00 00:00:00',	0,	0,	'2018-06-06 06:54:14'),
(36,	'Ethiopia',	'0000-00-00 00:00:00',	0,	0,	'2018-06-06 06:54:29');

DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `department_id` int(50) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `created_by` int(100) NOT NULL,
  `created_date` datetime NOT NULL,
  `last_modified_by` int(100) NOT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `department` (`department_id`, `name`, `created_by`, `created_date`, `last_modified_by`, `last_modified_date`) VALUES
(1,	'Program Support',	0,	'0000-00-00 00:00:00',	0,	'2018-05-31 14:12:40'),
(2,	'Partnership',	0,	'0000-00-00 00:00:00',	0,	'2018-05-31 14:12:40'),
(5,	'IT',	0,	'0000-00-00 00:00:00',	0,	'2018-05-31 14:12:40'),
(6,	'Business Services',	0,	'0000-00-00 00:00:00',	0,	'2018-05-31 14:12:40'),
(7,	'Risk Management',	0,	'0000-00-00 00:00:00',	0,	'2018-06-06 08:05:31');

DROP TABLE IF EXISTS `entitlement`;
CREATE TABLE `entitlement` (
  `entitlement_id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `derivative_id` int(10) NOT NULL,
  PRIMARY KEY (`entitlement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `entitlement` (`entitlement_id`, `name`, `derivative_id`) VALUES
(1,	'switch_user',	0),
(2,	'add_user',	20),
(3,	'delete_user',	20),
(4,	'edit_user',	20),
(5,	'manage_language',	7),
(6,	'translate_language',	5),
(7,	'manage_settings',	0),
(8,	'system_settings',	7),
(9,	'sms_settings',	7),
(10,	'manage_surveys',	0),
(12,	'survey_results',	10),
(13,	'manage_setup_parameters',	19),
(14,	'setup_countries',	13),
(15,	'setup_departments',	13),
(16,	'setup_teams',	13),
(17,	'setup_roles',	13),
(18,	'setup_profiles',	13),
(19,	'manage_users',	0),
(20,	'manage_accounts',	19),
(21,	'self_assign_privilege',	0),
(23,	'change_scope',	20),
(24,	'suspend_user',	20),
(25,	'add_language',	5),
(26,	'self_update',	20),
(27,	'manage_grouping',	10),
(28,	'add_grouping',	27),
(29,	'edit_grouping',	27),
(30,	'delete_grouping',	27),
(31,	'manage_category',	10),
(32,	'add_category',	31),
(33,	'edit_category',	31),
(34,	'delete_category',	31),
(35,	'survey_settings',	10),
(36,	'add_survey',	35),
(37,	'edit_survey',	35),
(38,	'delete_survey',	35),
(39,	'add_country',	14),
(40,	'edit_country',	14),
(41,	'delete_country',	14),
(42,	'add_department',	15),
(43,	'edit_department',	15),
(44,	'delete_department',	15),
(45,	'add_team',	16),
(46,	'edit_team',	16),
(47,	'delete_team',	16),
(48,	'add_role',	17),
(49,	'edit_role',	17),
(50,	'delete_role',	17),
(51,	'mail_templates',	10),
(52,	'messages',	0),
(53,	'add_profile',	18),
(54,	'edit_profile',	18),
(55,	'add_vote',	10),
(56,	'edit_vote',	10),
(57,	'delete_vote',	10),
(58,	'delete_profile',	18),
(59,	'dashboard',	0),
(60,	'active_survey',	59),
(61,	'registered_users',	59),
(62,	'cast_votes',	59),
(63,	'voting_days',	59),
(64,	'uncast_votes',	59);

DROP TABLE IF EXISTS `grouping`;
CREATE TABLE `grouping` (
  `grouping_id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(100) NOT NULL,
  `last_modified_by` int(100) NOT NULL,
  PRIMARY KEY (`grouping_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `grouping` (`grouping_id`, `name`, `description`, `status`, `created_date`, `last_modified`, `created_by`, `last_modified_by`) VALUES
(1,	'Peer Categories',	'Peer Categories\n',	1,	'2018-06-04 21:02:52',	'2018-06-04 18:02:52',	0,	0),
(2,	'Manager Categories',	'Manager Categories\n',	1,	'2018-06-04 21:03:07',	'2018-06-04 18:03:07',	0,	0);

DROP TABLE IF EXISTS `language`;
CREATE TABLE `language` (
  `phrase_id` int(11) NOT NULL AUTO_INCREMENT,
  `phrase` longtext COLLATE utf8_unicode_ci NOT NULL,
  `english` longtext COLLATE utf8_unicode_ci NOT NULL,
  `spanish` longtext COLLATE utf8_unicode_ci NOT NULL,
  `french` longtext COLLATE utf8_unicode_ci NOT NULL,
  `swahili` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`phrase_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `language` (`phrase_id`, `phrase`, `english`, `spanish`, `french`, `swahili`) VALUES
(1,	'login',	'',	'',	'',	''),
(2,	'forgot_your_password',	'',	'',	'',	''),
(3,	'staff_dashboard',	'',	'',	'',	''),
(4,	'dashboard',	'',	'',	'',	'Deshibodi'),
(5,	'account',	'',	'',	'',	''),
(6,	'edit_profile',	'',	'',	'',	''),
(7,	'change_password',	'',	'',	'',	''),
(8,	'event_schedule',	'',	'',	'',	''),
(9,	'users',	'',	'',	'',	''),
(10,	'delete',	'',	'',	'',	''),
(11,	'cancel',	'',	'',	'',	''),
(12,	'Ok',	'',	'',	'',	''),
(13,	'language',	'',	'',	'',	''),
(14,	'administrator',	'',	'',	'',	''),
(15,	'switch_user',	'',	'',	'',	''),
(16,	'reset_password',	'',	'',	'',	''),
(17,	'return_to_login_page',	'',	'',	'',	''),
(18,	'manager_dashboard',	'',	'',	'',	''),
(19,	'manage_profile',	'',	'',	'',	''),
(20,	'firstname',	'',	'',	'',	''),
(21,	'lastname',	'',	'',	'',	''),
(22,	'email',	'',	'',	'',	''),
(23,	'photo',	'',	'',	'',	''),
(24,	'update_profile',	'',	'',	'',	''),
(25,	'current_password',	'',	'',	'',	''),
(26,	'new_password',	'',	'',	'',	''),
(27,	'confirm_new_password',	'',	'',	'',	''),
(28,	'display_settings',	'',	'',	'',	''),
(29,	'general_settings',	'',	'',	'',	''),
(30,	'sms_settings',	'',	'',	'',	''),
(31,	'language_settings',	'',	'',	'',	''),
(32,	'previledges',	'',	'',	'',	''),
(33,	'accounts_setup',	'',	'',	'',	''),
(34,	'settings',	'',	'',	'',	''),
(35,	'manage_language',	'',	'',	'',	''),
(36,	'messages',	'',	'',	'',	''),
(37,	'new_message',	'',	'',	'',	''),
(38,	'setup',	'',	'',	'',	''),
(39,	'countries',	'',	'',	'',	''),
(40,	'roles',	'',	'',	'',	''),
(41,	'departments',	'',	'',	'',	''),
(42,	'teams',	'',	'',	'',	''),
(43,	'profiles',	'',	'',	'',	''),
(44,	'add_country',	'',	'',	'',	''),
(45,	'surveys',	'',	'',	'',	''),
(46,	'manage_surveys',	'',	'',	'',	''),
(47,	'nominate',	'',	'',	'',	''),
(48,	'survey_results',	'',	'',	'',	''),
(49,	'name',	'',	'',	'',	''),
(50,	'staff_count',	'',	'',	'',	''),
(51,	'manager_count',	'',	'',	'',	''),
(52,	'action',	'',	'',	'',	''),
(53,	'country',	'',	'',	'',	''),
(54,	'save',	'',	'',	'',	''),
(55,	'success',	'',	'',	'',	''),
(56,	'failed',	'',	'',	'',	''),
(57,	'edit',	'',	'',	'',	''),
(58,	'edit_country',	'',	'',	'',	''),
(59,	'message',	'',	'',	'',	''),
(60,	'add_department',	'',	'',	'',	''),
(61,	'department',	'',	'',	'',	''),
(62,	'edit_department',	'',	'',	'',	''),
(63,	'add_team',	'',	'',	'',	''),
(64,	'description',	'',	'',	'',	''),
(65,	'team',	'',	'',	'',	''),
(66,	'select',	'',	'',	'',	''),
(67,	'team_title',	'',	'',	'',	''),
(68,	'add_role',	'',	'',	'',	''),
(69,	'contribution',	'',	'',	'',	''),
(70,	'role',	'',	'',	'',	''),
(71,	'role_title',	'',	'',	'',	''),
(72,	'staff',	'',	'',	'',	''),
(73,	'manager',	'',	'',	'',	''),
(74,	'add_profile',	'',	'',	'',	''),
(75,	'profile_name',	'',	'',	'',	''),
(76,	'profile_title',	'',	'',	'',	''),
(77,	'assignment',	'',	'',	'',	''),
(78,	'assign_privileges',	'',	'',	'',	''),
(79,	'assign_previledges',	'',	'',	'',	''),
(80,	'add_user',	'',	'',	'',	''),
(81,	'delete_user',	'',	'',	'',	''),
(82,	'update_user',	'',	'',	'',	''),
(83,	'translate_language',	'',	'',	'',	''),
(84,	'manage_settings',	'',	'',	'',	''),
(85,	'system_settings',	'',	'',	'',	''),
(86,	'Are_you_sure_you_want_to_perform_this_action?',	'',	'',	'',	''),
(87,	'process_aborted',	'',	'',	'',	''),
(88,	'please_wait_until_you_receive_confirmation',	'',	'',	'',	''),
(89,	'edit_role',	'',	'',	'',	''),
(90,	'title',	'',	'',	'',	''),
(91,	'manage_users',	'',	'',	'',	''),
(92,	'cash_journal',	'',	'',	'',	''),
(93,	'budget',	'',	'',	'',	''),
(94,	'budget_limits',	'',	'',	'',	''),
(95,	'budget_summary',	'',	'',	'',	''),
(96,	'budget_schedules',	'',	'',	'',	''),
(97,	'complete_budget',	'',	'',	'',	''),
(98,	'C.I.Vs',	'',	'',	'',	''),
(99,	'accounts_chart',	'',	'',	'',	''),
(100,	'manage_setup_parameters',	'',	'',	'',	''),
(101,	'setup_countries',	'',	'',	'',	''),
(102,	'setup_departments',	'',	'',	'',	''),
(103,	'setup_teams',	'',	'',	'',	''),
(104,	'setup_roles',	'',	'',	'',	''),
(105,	'setup_profiles',	'',	'',	'',	''),
(106,	'manage_accounts',	'',	'',	'',	''),
(107,	'first_name',	'',	'',	'',	''),
(108,	'last_name',	'',	'',	'',	''),
(109,	'status',	'',	'',	'',	''),
(110,	'suspend',	'',	'',	'',	''),
(111,	'active',	'',	'',	'',	''),
(112,	'self_assign_privilege',	'',	'',	'',	''),
(113,	'system_name',	'',	'',	'',	''),
(114,	'system_title',	'',	'',	'',	''),
(115,	'address',	'',	'',	'',	''),
(116,	'phone',	'',	'',	'',	''),
(117,	'paypal_email',	'',	'',	'',	''),
(118,	'currency',	'',	'',	'',	''),
(119,	'system_email',	'',	'',	'',	''),
(120,	'text_align',	'',	'',	'',	''),
(121,	'update_product',	'',	'',	'',	''),
(122,	'file',	'',	'',	'',	''),
(123,	'install_update',	'',	'',	'',	''),
(124,	'theme_settings',	'',	'',	'',	''),
(125,	'default',	'',	'',	'',	''),
(126,	'select_theme',	'',	'',	'',	''),
(127,	'select_a_theme_to_make_changes',	'',	'',	'',	''),
(128,	'upload_logo',	'',	'',	'',	''),
(129,	'upload',	'',	'',	'',	''),
(130,	'profile',	'',	'',	'',	''),
(131,	'select_a_service',	'',	'',	'',	''),
(132,	'not_selected',	'',	'',	'',	''),
(133,	'disabled',	'',	'',	'',	''),
(134,	'clickatell_username',	'',	'',	'',	''),
(135,	'clickatell_password',	'',	'',	'',	''),
(136,	'clickatell_api_id',	'',	'',	'',	''),
(137,	'twilio_account',	'',	'',	'',	''),
(138,	'authentication_token',	'',	'',	'',	''),
(139,	'registered_phone_number',	'',	'',	'',	''),
(140,	'language_list',	'',	'',	'',	''),
(141,	'add_phrase',	'',	'',	'',	''),
(142,	'add_language',	'',	'',	'',	''),
(143,	'option',	'',	'',	'',	''),
(144,	'edit_phrase',	'',	'',	'',	''),
(145,	'delete_language',	'',	'',	'',	''),
(146,	'phrase',	'',	'',	'',	''),
(147,	'value_required',	'',	'',	'',	''),
(148,	'update_phrase',	'',	'',	'',	''),
(149,	'theme_selected',	'',	'',	'',	''),
(150,	'private_messaging',	'',	'',	'',	NULL),
(151,	'write_new_message',	'',	'',	'',	NULL),
(152,	'recipient',	'',	'',	'',	NULL),
(153,	'select_a_user',	'',	'',	'',	NULL),
(154,	'student',	'',	'',	'',	NULL),
(155,	'gender',	'',	'',	'',	NULL),
(156,	'male',	'',	'',	'',	NULL),
(157,	'female',	'',	'',	'',	NULL),
(158,	'254711808075',	'',	'',	'',	NULL),
(159,	'user_created_successfully',	'',	'',	'',	NULL),
(160,	'change_scope',	'',	'',	'',	NULL),
(161,	'edit_user',	'',	'',	'',	NULL),
(162,	'user_deleted',	'',	'',	'',	NULL),
(163,	'suspended',	'',	'',	'',	NULL),
(164,	'view',	'',	'',	'',	NULL),
(165,	'Kenya',	'',	'',	'',	NULL),
(166,	'Uganda',	'',	'',	'',	NULL),
(167,	'Rwanda',	'',	'',	'',	NULL),
(168,	'Tanzania',	'',	'',	'',	NULL),
(169,	'Togo',	'',	'',	'',	NULL),
(170,	'Ethiopia',	'',	'',	'',	NULL),
(171,	'Ghana',	'',	'',	'',	NULL),
(172,	'Burkina Faso',	'',	'',	'',	NULL),
(173,	'scope',	'',	'',	'',	NULL),
(174,	'one_way',	'',	'',	'',	NULL),
(175,	'strict',	'',	'',	'',	NULL),
(176,	'no',	'',	'',	'',	NULL),
(177,	'yes',	'',	'',	'',	NULL),
(178,	'two_way',	'',	'',	'',	NULL),
(179,	'full_name',	'',	'',	'',	NULL),
(180,	'suspend_user',	'',	'',	'',	NULL),
(181,	'type',	'',	'',	'',	NULL),
(182,	'voting',	'',	'',	'',	NULL),
(183,	'administration',	'',	'',	'',	NULL),
(184,	'both',	'',	'',	'',	NULL),
(185,	'category_groups',	'',	'',	'',	NULL),
(186,	'categories',	'',	'',	'',	NULL),
(187,	'survey_setting',	'',	'',	'',	NULL),
(188,	'mail_templates',	'',	'',	'',	NULL),
(189,	'grouping',	'',	'',	'',	NULL),
(190,	'add_grouping',	'',	'',	'',	NULL),
(191,	'inactive',	'',	'',	'',	NULL),
(192,	'edit_grouping',	'',	'',	'',	NULL),
(193,	'self_update',	'',	'',	'',	NULL),
(194,	'manage_grouping',	'',	'',	'',	NULL),
(195,	'delete_grouping',	'',	'',	'',	NULL),
(196,	'category_group',	'',	'',	'',	NULL),
(197,	'created_by',	'',	'',	'',	NULL),
(198,	'created_date',	'',	'',	'',	NULL),
(199,	'last_modified',	'',	'',	'',	NULL),
(200,	'last_modified_by',	'',	'',	'',	NULL),
(201,	'add_categories',	'',	'',	'',	NULL),
(202,	'visibility',	'',	'',	'',	NULL),
(203,	'user_type_assignment',	'',	'',	'',	NULL),
(204,	'peer',	'',	'',	'',	NULL),
(205,	'country_visibility',	'',	'',	'',	NULL),
(206,	'all_countries',	'',	'',	'',	NULL),
(207,	'category',	'',	'',	'',	NULL),
(208,	'manage_category',	'',	'',	'',	NULL),
(209,	'add_category',	'',	'',	'',	NULL),
(210,	'edit_category',	'',	'',	'',	NULL),
(211,	'delete_category',	'',	'',	'',	NULL),
(212,	'category_grouping',	'',	'',	'',	NULL),
(213,	'survey',	'',	'',	'',	NULL),
(214,	'assigned_user_type',	'',	'',	'',	NULL),
(215,	'user',	'',	'',	'',	NULL),
(216,	'nominate_unit',	'',	'',	'',	NULL),
(217,	'submit',	'',	'',	'',	NULL),
(218,	'unit',	'',	'',	'',	NULL),
(219,	'your_voting_privileges',	'',	'',	'',	NULL),
(220,	'position',	'',	'',	'',	NULL),
(221,	'your_country',	'',	'',	'',	NULL),
(222,	'All',	'',	'',	'',	NULL),
(223,	'start_voting',	'',	'',	'',	NULL),
(226,	'there_is_no_active_survey',	'',	'',	'',	NULL),
(225,	'you_have_already_participated_in_voting',	'',	'',	'',	NULL),
(227,	'nominate_team',	'',	'',	'',	NULL),
(228,	'nominate_user',	'',	'',	'',	NULL),
(229,	'nominate_country',	'',	'',	'',	NULL),
(230,	'nominate_department',	'',	'',	'',	NULL),
(231,	'nominate_',	'',	'',	'',	NULL),
(232,	'survey_settings',	'',	'',	'',	NULL),
(233,	'add_survey',	'',	'',	'',	NULL),
(234,	'edit_survey',	'',	'',	'',	NULL),
(235,	'delete_survey',	'',	'',	'',	NULL),
(236,	'results',	'',	'',	'',	NULL),
(237,	'voting_staff',	'',	'',	'',	NULL),
(238,	'vote_status',	'',	'',	'',	NULL),
(239,	'voting_start_date',	'',	'',	'',	NULL),
(240,	'voting_end_date',	'',	'',	'',	NULL),
(241,	'nomination_type',	'',	'',	'',	NULL),
(242,	'voting_unit',	'',	'',	'',	NULL),
(243,	'nominee',	'',	'',	'',	NULL),
(244,	'staff_number',	'',	'',	'',	NULL),
(245,	'completed',	'',	'',	'',	NULL),
(246,	'in_progress',	'',	'',	'',	NULL),
(247,	'no_data_found',	'',	'',	'',	NULL),
(250,	'employee_numner',	'',	'',	'',	NULL),
(249,	'employee_number',	'',	'',	'',	NULL),
(251,	'delete_country',	'',	'',	'',	NULL),
(252,	'add_departments',	'',	'',	'',	NULL),
(253,	'edit_departments',	'',	'',	'',	NULL),
(254,	'delete_departments',	'',	'',	'',	NULL),
(255,	'delete_department',	'',	'',	'',	NULL),
(256,	'edit_team',	'',	'',	'',	NULL),
(257,	'delete_team',	'',	'',	'',	NULL),
(258,	'delete_role',	'',	'',	'',	NULL),
(259,	'comment_here',	'',	'',	'',	NULL),
(260,	'comment',	'',	'',	'',	NULL),
(261,	'you_have_missing_fields',	'',	'',	'',	NULL),
(262,	'submit_successful',	'',	'',	'',	NULL),
(263,	'edit_entitlement',	'',	'',	'',	NULL),
(264,	'votes',	'',	'',	'',	NULL),
(265,	'survey_start_date',	'',	'',	'',	NULL),
(266,	'voter_last_name',	'',	'',	'',	NULL),
(267,	'add_vote',	'',	'',	'',	NULL),
(268,	'edit_vote',	'',	'',	'',	NULL),
(269,	'delete_vote',	'',	'',	'',	NULL),
(270,	'start_date',	'',	'',	'',	NULL),
(271,	'voter_staff_number',	'',	'',	'',	NULL),
(272,	'privileges',	'',	'',	'',	NULL);

DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_thread_code` longtext NOT NULL,
  `message` longtext NOT NULL,
  `sender` longtext NOT NULL,
  `timestamp` longtext NOT NULL,
  `read_status` int(11) NOT NULL DEFAULT '0' COMMENT '0 unread 1 read',
  PRIMARY KEY (`message_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `message_thread`;
CREATE TABLE `message_thread` (
  `message_thread_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_thread_code` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sender` longtext COLLATE utf8_unicode_ci NOT NULL,
  `reciever` longtext COLLATE utf8_unicode_ci NOT NULL,
  `last_message_timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`message_thread_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `noticeboard`;
CREATE TABLE `noticeboard` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `notice` longtext COLLATE utf8_unicode_ci NOT NULL,
  `create_timestamp` int(11) NOT NULL,
  PRIMARY KEY (`notice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile` (
  `profile_id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `profile` (`profile_id`, `name`, `description`) VALUES
(2,	'Country Admin',	''),
(3,	'Manager',	''),
(4,	'Staff',	''),
(7,	'Super Admin',	'<p>\r\n	Has all privileges</p>\r\n'),
(8,	'HRBP',	'<p>\r\n	Human Resource Staff</p>\r\n');

DROP TABLE IF EXISTS `result`;
CREATE TABLE `result` (
  `result_id` int(100) NOT NULL AUTO_INCREMENT,
  `survey_id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '0-not submitted,1-submitted',
  `created_date` datetime NOT NULL,
  `created_by` int(100) NOT NULL,
  `last_modified_by` int(100) NOT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`result_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `result` (`result_id`, `survey_id`, `user_id`, `status`, `created_date`, `created_by`, `last_modified_by`, `last_modified_date`) VALUES
(15,	8,	1,	0,	'2018-06-04 07:57:41',	1,	1,	'2018-06-04 17:57:41'),
(16,	8,	2,	0,	'2018-06-04 08:25:12',	2,	2,	'2018-06-04 18:25:12'),
(17,	8,	4,	0,	'2018-06-06 12:29:14',	4,	4,	'2018-06-06 10:29:14'),
(18,	8,	9,	0,	'2018-06-06 12:31:57',	9,	9,	'2018-06-06 10:31:57');

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(50) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `contribution` tinyint(4) NOT NULL,
  `department_id` int(100) NOT NULL,
  `created_date` datetime NOT NULL,
  `created_by` int(100) NOT NULL,
  `last_modified_by` int(100) NOT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `role` (`role_id`, `name`, `contribution`, `department_id`, `created_date`, `created_by`, `last_modified_by`, `last_modified_date`) VALUES
(1,	'Program Trainer',	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2018-05-31 14:27:45'),
(2,	'Program Support Specialist',	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2018-05-31 14:27:45'),
(3,	'Partnership Facilitator',	1,	2,	'0000-00-00 00:00:00',	0,	0,	'2018-05-31 14:27:45'),
(4,	'Manager Of Training',	2,	1,	'0000-00-00 00:00:00',	0,	0,	'2018-05-31 14:27:45'),
(6,	'Partnership Preparation Specialist',	1,	2,	'0000-00-00 00:00:00',	0,	0,	'2018-05-31 14:27:45'),
(8,	'ITS',	1,	5,	'0000-00-00 00:00:00',	0,	0,	'2018-05-31 14:27:45');

DROP TABLE IF EXISTS `scope`;
CREATE TABLE `scope` (
  `scope_id` int(100) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `two_way` tinyint(4) NOT NULL COMMENT '1=yes (Can nominate and be nominated by other FOs),0=no (User can only nominate other FOs)',
  `strict` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=all departments,1=only user department',
  `type` varchar(10) NOT NULL COMMENT 'admin,vote,both',
  PRIMARY KEY (`scope_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `scope` (`scope_id`, `user_id`, `two_way`, `strict`, `type`) VALUES
(1,	1,	1,	0,	'both'),
(4,	3,	0,	0,	'both'),
(5,	8,	1,	0,	'vote'),
(6,	9,	1,	0,	'vote');

DROP TABLE IF EXISTS `scope_country`;
CREATE TABLE `scope_country` (
  `scope_country_id` int(100) NOT NULL AUTO_INCREMENT,
  `scope_id` tinyint(4) NOT NULL,
  `country_id` tinyint(4) NOT NULL,
  PRIMARY KEY (`scope_country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `scope_country` (`scope_country_id`, `scope_id`, `country_id`) VALUES
(69,	5,	25),
(118,	1,	28),
(119,	6,	26),
(120,	6,	27),
(124,	4,	25),
(125,	4,	26),
(126,	4,	33);

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `settings_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`settings_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `settings` (`settings_id`, `type`, `description`) VALUES
(1,	'system_name',	'Staff Recognition System'),
(2,	'system_title',	'Staff Recognition'),
(3,	'address',	'1945 Nairobi'),
(4,	'phone',	'254711808071'),
(7,	'system_email',	'NKarisa@ke.ci.org'),
(8,	'active_sms_service',	'disabled'),
(9,	'language',	'english'),
(10,	'text_align',	'left-to-right'),
(11,	'clickatell_user',	''),
(12,	'clickatell_password',	''),
(13,	'clickatell_api_id',	''),
(14,	'skin_colour',	'default'),
(15,	'twilio_account_sid',	''),
(16,	'twilio_auth_token',	''),
(17,	'twilio_sender_phone_number',	'');

DROP TABLE IF EXISTS `survey`;
CREATE TABLE `survey` (
  `survey_id` int(100) NOT NULL AUTO_INCREMENT,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `country_id` int(100) NOT NULL DEFAULT '1',
  `status` tinyint(4) NOT NULL,
  `created_by` int(100) NOT NULL,
  `created_date` date NOT NULL,
  `last_modified_by` int(100) NOT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`survey_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `survey` (`survey_id`, `start_date`, `end_date`, `country_id`, `status`, `created_by`, `created_date`, `last_modified_by`, `last_modified_date`) VALUES
(8,	'2018-05-29 00:00:00',	'2018-06-29 00:00:00',	1,	1,	1,	'2018-05-29',	1,	'2018-06-04 17:57:32');

DROP TABLE IF EXISTS `tabulate`;
CREATE TABLE `tabulate` (
  `tabulate_id` int(11) NOT NULL AUTO_INCREMENT,
  `result_id` int(100) NOT NULL,
  `category_id` int(100) NOT NULL,
  `nominated_unit` tinyint(4) NOT NULL,
  `nominee_id` int(100) NOT NULL,
  `comment` longtext NOT NULL,
  `created_date` datetime NOT NULL,
  `created_by` int(100) NOT NULL,
  `last_modified_by` int(100) NOT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tabulate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `tabulate` (`tabulate_id`, `result_id`, `category_id`, `nominated_unit`, `nominee_id`, `comment`, `created_date`, `created_by`, `last_modified_by`, `last_modified_date`) VALUES
(18,	9,	4,	3,	9,	'',	'2018-05-31 10:57:39',	3,	3,	'2018-05-31 08:57:39'),
(19,	9,	11,	4,	2,	'',	'2018-05-31 10:58:36',	3,	3,	'2018-05-31 08:58:36'),
(20,	14,	4,	3,	5,	'The most organized team',	'2018-06-04 02:14:58',	1,	1,	'2018-06-04 12:14:58'),
(21,	14,	11,	4,	2,	'Just a test 1',	'2018-06-04 02:28:33',	1,	1,	'2018-06-04 12:28:39'),
(22,	14,	12,	4,	11,	'Just a test 2',	'2018-06-04 02:28:40',	1,	1,	'2018-06-04 12:28:47'),
(23,	15,	3,	4,	9,	'',	'2018-06-04 08:24:43',	1,	1,	'2018-06-04 18:24:43'),
(24,	17,	2,	4,	9,	'',	'2018-06-06 12:29:20',	4,	4,	'2018-06-06 10:29:20');

DROP TABLE IF EXISTS `team`;
CREATE TABLE `team` (
  `team_id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `country_id` int(100) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `team` (`team_id`, `name`, `country_id`, `description`) VALUES
(3,	'Welfare Committee',	25,	'This deals with staff welfare matters'),
(4,	'Spiritual Welfare ',	26,	'For planning National Office Devotions'),
(6,	'Sports',	25,	'For events planning'),
(7,	'Talent Developemt',	28,	'For beneficiary talents'),
(8,	'POYA',	25,	'<p>\r\n	ICP Wards</p>\r\n'),
(9,	'Intercessory',	31,	'Prayers');

DROP TABLE IF EXISTS `teamset`;
CREATE TABLE `teamset` (
  `teamset_id` int(100) NOT NULL AUTO_INCREMENT,
  `user_id` int(50) NOT NULL,
  `team_id` int(50) NOT NULL,
  PRIMARY KEY (`teamset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `teamset` (`teamset_id`, `user_id`, `team_id`) VALUES
(1,	1,	3),
(2,	11,	6),
(3,	2,	3);

DROP TABLE IF EXISTS `unit`;
CREATE TABLE `unit` (
  `unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `unit` (`unit_id`, `name`) VALUES
(1,	'country'),
(2,	'department'),
(3,	'team'),
(4,	'user');

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(100) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `employee_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `role_id` tinyint(10) NOT NULL,
  `profile_id` tinyint(5) NOT NULL,
  `manager_id` int(100) NOT NULL,
  `auth` tinyint(5) NOT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `user` (`user_id`, `firstname`, `lastname`, `email`, `password`, `gender`, `phone`, `employee_id`, `role_id`, `profile_id`, `manager_id`, `auth`, `country_id`) VALUES
(1,	'Nicodemus',	'Karisa Mwambire',	'NKarisa@ke.ci.org',	'956d2d5467ed373328ee2d165a51c399',	'male',	'254711808071',	'KE136',	1,	7,	2,	1,	25),
(2,	'James',	'Mulandi',	'JMulandi@ke.ci.org',	'956d2d5467ed373328ee2d165a51c399',	'male',	'254720648480',	'',	4,	3,	0,	1,	25),
(3,	'Ann',	'Kakenya',	'AKakenya@ke.ci.org',	'956d2d5467ed373328ee2d165a51c399',	'female',	'445544566',	'',	3,	8,	0,	1,	31),
(4,	'Joyce ',	'Cherono',	'JCherono@ke.ci.org',	'956d2d5467ed373328ee2d165a51c399',	'female',	'2547889827',	'',	2,	4,	2,	1,	27),
(6,	'Charles',	'Rukia',	'CRukia@ug.ci.org',	'956d2d5467ed373328ee2d165a51c399',	'male',	'7667894745',	'',	2,	4,	0,	1,	26),
(7,	'Victor',	'Wanyama',	'VWanyama@rw.ci.org',	'956d2d5467ed373328ee2d165a51c399',	'male',	'8654656337',	'',	1,	4,	0,	0,	27),
(8,	'Betty',	'Kanze',	'BYeri@ke.ci.org',	'956d2d5467ed373328ee2d165a51c399',	'female',	'254767847663',	'',	1,	4,	0,	1,	28),
(9,	'Evans',	'Macharia',	'EMacharia@ke.ci.org',	'956d2d5467ed373328ee2d165a51c399',	'male',	'8777688976',	'',	3,	8,	0,	1,	25),
(10,	'Patricia',	'Mghendi',	'EMghendi@ke.ci.org',	'956d2d5467ed373328ee2d165a51c399',	'female',	'9782845675',	'',	8,	4,	0,	1,	28),
(11,	'Velma',	'Odhiambo',	'VOdhiambo@ke.ci.org',	'956d2d5467ed373328ee2d165a51c399',	'female',	'88756785',	'',	3,	4,	2,	1,	27),
(12,	'Jackson',	'Maingi',	'nkmwambs@gmail.com',	'9605b753806fae5c65be5267af27b666',	'male',	'0722654376',	'KE138',	1,	4,	0,	1,	25),
(13,	'Geoffrey',	'Mulusa',	'GMulusa@ke.ci.org',	'0fc90c560c94d1033fbecc58300d2dcb',	'male',	'724955786',	'KE125',	3,	4,	2,	1,	25);

-- 2018-06-06 15:07:43
