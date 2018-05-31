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
(8,	2,	1),
(9,	5,	1),
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
(97,	6,	3),
(98,	23,	3),
(100,	18,	8),
(101,	23,	8),
(441,	1,	7),
(442,	2,	7),
(443,	3,	7),
(444,	4,	7),
(445,	5,	7),
(446,	6,	7),
(447,	7,	7),
(448,	8,	7),
(449,	9,	7),
(450,	10,	7),
(451,	12,	7),
(452,	13,	7),
(453,	14,	7),
(454,	15,	7),
(455,	16,	7),
(456,	17,	7),
(457,	18,	7),
(458,	19,	7),
(459,	20,	7),
(460,	23,	7),
(461,	24,	7),
(462,	25,	7),
(463,	27,	7),
(464,	28,	7),
(465,	29,	7),
(466,	30,	7),
(467,	31,	7),
(468,	32,	7),
(469,	33,	7),
(470,	34,	7),
(471,	35,	7),
(472,	36,	7),
(473,	37,	7),
(474,	38,	7),
(475,	39,	7),
(476,	40,	7),
(477,	41,	7),
(478,	42,	7),
(479,	43,	7),
(480,	44,	7),
(481,	45,	7),
(482,	46,	7),
(483,	47,	7),
(484,	48,	7),
(485,	49,	7),
(486,	50,	7);

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
(1,	'100% for one another',	'',	2,	28,	'1',	4,	1,	'2018-05-26 01:43:01',	1,	'2018-05-29 07:45:27',	1),
(4,	'Test',	'',	1,	1,	'1',	3,	1,	'2020-02-05 00:00:00',	1,	'2018-05-29 17:37:51',	1),
(5,	'Test7',	'',	1,	30,	'2',	2,	1,	'2020-02-05 00:00:00',	1,	'2018-05-29 07:24:36',	1),
(9,	'Test 6',	'',	2,	31,	'2',	3,	1,	'2018-05-26 07:25:00',	1,	'2018-05-29 07:45:52',	1),
(10,	'Welfare One',	'',	3,	1,	'2',	4,	1,	'2018-05-29 11:11:17',	1,	'2018-05-29 11:35:55',	1),
(11,	'Category 5',	'',	2,	1,	'1',	4,	1,	'2018-05-29 01:24:20',	1,	'2018-05-29 11:24:20',	1),
(12,	'Getting tasty',	'',	2,	25,	'1',	4,	1,	'2018-05-30 05:56:51',	1,	'2018-05-30 15:56:51',	1),
(13,	'Well done for this',	'',	2,	31,	'1',	4,	1,	'2018-05-30 05:59:29',	1,	'2018-05-30 15:59:29',	1),
(14,	'Test category three',	'<p>\r\n	Just for testing</p>\r\n',	2,	1,	'1',	4,	1,	'2018-05-31 10:33:32',	1,	'2018-05-31 08:33:32',	1);

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
('052967a14f2951712ee2a841b05dad757533a776',	'::1',	1527703681,	'__ci_last_regenerate|i:1527703641;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('0b3b7e364ba474acbf3e58bde31be5129881702d',	'::1',	1527722163,	'__ci_last_regenerate|i:1527722015;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('0b478effbba974826335dff5558c2e8c2a4a5188',	'127.0.0.1',	1527710270,	'__ci_last_regenerate|i:1527710270;user_login|s:1:\"1\";login_user_id|s:1:\"3\";name|s:3:\"Ann\";login_type|s:23:\"Partnership Facilitator\";profile_id|s:1:\"8\";country_id|s:2:\"31\";view_type|s:7:\"Surveys\";'),
('0e4efabde0ac1ca73d2872d81862df60dfd1011a',	'::1',	1527750011,	'__ci_last_regenerate|i:1527749981;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Account\";'),
('11effb26f2ee3e4227123582e69981f43f384ce2',	'127.0.0.1',	1527775155,	'__ci_last_regenerate|i:1527775105;view_type|s:7:\"Account\";user_login|s:1:\"1\";login_user_id|s:1:\"3\";name|s:3:\"Ann\";login_type|s:23:\"Partnership Facilitator\";profile_id|s:1:\"8\";country_id|s:2:\"31\";'),
('13c192fd68862a6f317965a747c3305bbd5b87a5',	'::1',	1527709826,	'__ci_last_regenerate|i:1527709537;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('1c4fee8fe926e1313e0964d86920bacf5a0841a6',	'::1',	1527719309,	'__ci_last_regenerate|i:1527719105;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('1da25657f2b154fec0174afd47cd42f4ab8444e4',	'::1',	1527755912,	'__ci_last_regenerate|i:1527755613;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('1e49c994cca8ecc6e175ed0e6ccf3dfb8baa07bb',	'::1',	1527749657,	'__ci_last_regenerate|i:1527749493;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Account\";'),
('23ee6c4520a666ef340e040d5446cb9785b287db',	'::1',	1527711640,	'__ci_last_regenerate|i:1527711546;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('25dc14ecc64584fb91142e80c442931cafd4ce3d',	'::1',	1527710101,	'__ci_last_regenerate|i:1527709858;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('25dec8da81948264e7f4db2b263d976b17e7a3cb',	'127.0.0.1',	1527711658,	'__ci_last_regenerate|i:1527711646;user_login|s:1:\"1\";login_user_id|s:2:\"11\";name|s:5:\"Velma\";login_type|s:23:\"Partnership Facilitator\";profile_id|s:1:\"4\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('27c26357b07d03602638f09d70b1d26ff8d15dfd',	'::1',	1527724026,	'__ci_last_regenerate|i:1527723999;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('284a7e380d4c6aaaa716bdfc9b34047a30b186ba',	'127.0.0.1',	1527756559,	'__ci_last_regenerate|i:1527756337;user_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:5:\"James\";login_type|s:19:\"Manager Of Training\";profile_id|s:1:\"3\";country_id|s:2:\"25\";view_type|s:7:\"Account\";'),
('28b58ed64137c55139268b97e2a5043e9bff3a79',	'::1',	1527725220,	'__ci_last_regenerate|i:1527725000;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('29c248cd43fafa89ac1ccca5f14cbc3a9af5eb76',	'::1',	1527723284,	'__ci_last_regenerate|i:1527723018;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('2d1192cdf941aab92b9ddb376b9c318efa9db1a1',	'127.0.0.1',	1527757116,	'__ci_last_regenerate|i:1527757083;user_login|s:1:\"1\";login_user_id|s:1:\"3\";name|s:3:\"Ann\";login_type|s:23:\"Partnership Facilitator\";profile_id|s:1:\"8\";country_id|s:2:\"31\";view_type|s:7:\"Surveys\";'),
('3398694590127785760095069eecaee39e402f9b',	'::1',	1527712095,	'__ci_last_regenerate|i:1527711878;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:8:\"Messages\";'),
('36e580a1cc09ef8deb8268a40d6c83c5158b6cc8',	'::1',	1527721381,	'__ci_last_regenerate|i:1527721120;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('3ccf575e2b30b7d60f5354f10e823b6493b57e72',	'::1',	1527712315,	'__ci_last_regenerate|i:1527712257;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('3e460a7c2c3de1fdc3a37d360c7ffc91bff67c1f',	'::1',	1527777305,	'__ci_last_regenerate|i:1527777219;view_type|s:7:\"Account\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";'),
('3faf6c6ea3ac863ce12cbe84986f48ddbf96ab89',	'::1',	1527716660,	'__ci_last_regenerate|i:1527716469;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('44674286720f0f5275e58f08dda99916b21b1d4f',	'::1',	1527754254,	'__ci_last_regenerate|i:1527754169;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Account\";'),
('4ba4a80d0f841f6b292a592e01667417b9fc5abc',	'::1',	1527702865,	'__ci_last_regenerate|i:1527702602;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('4be36cffae80b986220ead1a92a84c15707ef3ed',	'127.0.0.1',	1527706391,	'__ci_last_regenerate|i:1527706106;user_login|s:1:\"1\";login_user_id|s:1:\"3\";name|s:3:\"Ann\";login_type|s:23:\"Partnership Facilitator\";profile_id|s:1:\"8\";country_id|s:2:\"31\";view_type|s:7:\"Surveys\";'),
('4c5472fc40542ece9b4fe8cbd063c6652c6444e7',	'::1',	1527707085,	'__ci_last_regenerate|i:1527706489;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Account\";'),
('4f10ba072c39872aeaa34e75228400107418e8c7',	'::1',	1527714003,	'__ci_last_regenerate|i:1527713786;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('4f50b38e2e9775d3a8d3c5e1c92a70442ebdff75',	'::1',	1527754767,	'__ci_last_regenerate|i:1527754649;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('4fa834dfdcba5cfd8880bfe2baaf9d042511b46c',	'127.0.0.1',	1527708777,	'__ci_last_regenerate|i:1527708511;user_login|s:1:\"1\";login_user_id|s:1:\"3\";name|s:3:\"Ann\";login_type|s:23:\"Partnership Facilitator\";profile_id|s:1:\"8\";country_id|s:2:\"31\";view_type|s:7:\"Surveys\";'),
('512e7c469ae15c3424cb27781912396bb7c10bd8',	'127.0.0.1',	1527776393,	'__ci_last_regenerate|i:1527775650;view_type|s:7:\"Account\";user_login|s:1:\"1\";login_user_id|s:1:\"3\";name|s:3:\"Ann\";login_type|s:23:\"Partnership Facilitator\";profile_id|s:1:\"8\";country_id|s:2:\"31\";'),
('514c45dded3dca2f9aab08f14eaf7749464f175e',	'127.0.0.1',	1527723160,	'__ci_last_regenerate|i:1527723140;user_login|s:1:\"1\";login_user_id|s:2:\"10\";name|s:8:\"Patricia\";login_type|s:3:\"ITS\";profile_id|s:1:\"4\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('57bcc1b0843a4f93f250f434e6e1e96ee39f910e',	'::1',	1527715572,	'__ci_last_regenerate|i:1527715298;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('58f27e6bfdd9e655dcd3fe84d4ac596bc72bea97',	'::1',	1527749391,	'__ci_last_regenerate|i:1527749132;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('59cac961f5e411dc21c73377a3e76fe7ec4736e9',	'::1',	1527711267,	'__ci_last_regenerate|i:1527710971;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Account\";'),
('5c01c324e706ac028c9c7b607db03a75ddc449bd',	'::1',	1527775837,	'__ci_last_regenerate|i:1527775613;view_type|s:7:\"Account\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";'),
('5cd7e139fc0a3b1a711bcf35355c2340953d29c6',	'127.0.0.1',	1527756697,	'__ci_last_regenerate|i:1527756684;user_login|s:1:\"1\";login_user_id|s:1:\"3\";name|s:3:\"Ann\";login_type|s:23:\"Partnership Facilitator\";profile_id|s:1:\"8\";country_id|s:2:\"31\";view_type|s:7:\"Surveys\";'),
('5d1e376238668816c77c73a6976e23e5bc2033c2',	'127.0.0.1',	1527713838,	'__ci_last_regenerate|i:1527713838;user_login|s:1:\"1\";login_user_id|s:2:\"11\";name|s:5:\"Velma\";login_type|s:23:\"Partnership Facilitator\";profile_id|s:1:\"4\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('5ea73dc3999ad2488517f4e0b7e749f08c4954b1',	'::1',	1527719080,	'__ci_last_regenerate|i:1527718791;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('5f3879131d5716e656e60eb1a9b4ae06b4a878b1',	'127.0.0.1',	1527717789,	'__ci_last_regenerate|i:1527717540;user_login|s:1:\"1\";login_user_id|s:1:\"4\";name|s:6:\"Joyce \";login_type|s:26:\"Program Support Specialist\";profile_id|s:1:\"4\";country_id|s:2:\"27\";view_type|s:7:\"Surveys\";'),
('6048bca6992ccf8ff499fa8ca6a7b60ba1e9c001',	'::1',	1527756594,	'__ci_last_regenerate|i:1527756324;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Account\";'),
('60b627a67af0a0b53587016e6375d3ac1f7ecc2f',	'::1',	1527708741,	'__ci_last_regenerate|i:1527708503;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('61253aaa560a95b38a4f6b232c0b37b7fd144f0d',	'127.0.0.1',	1527707802,	'__ci_last_regenerate|i:1527707510;user_login|s:1:\"1\";login_user_id|s:1:\"3\";name|s:3:\"Ann\";login_type|s:23:\"Partnership Facilitator\";profile_id|s:1:\"8\";country_id|s:2:\"31\";view_type|s:7:\"Surveys\";'),
('67be89fc881f23a1699ec2025bdc6b10172d3be3',	'::1',	1527715197,	'__ci_last_regenerate|i:1527714971;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('67d861dd944327cd35fb51281cb880d726dd7c6b',	'::1',	1527725736,	'__ci_last_regenerate|i:1527725643;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('69029a078e3717b50c0be05a2a527fc6e1f50d70',	'::1',	1527722847,	'__ci_last_regenerate|i:1527722700;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('6d9b7eb869b76738c19959352c05d7e4f9eac219',	'::1',	1527724631,	'__ci_last_regenerate|i:1527724340;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('71f2c92f11fcc39cfdd6cb5a3506a39aa8d38a3c',	'::1',	1527710875,	'__ci_last_regenerate|i:1527710659;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('777dcb5cc4ced9640d16f38538cff904595e55d0',	'::1',	1527720268,	'__ci_last_regenerate|i:1527719988;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('7939e03e7245aa9bfaf793c0adc7b7100ab9e794',	'::1',	1527756977,	'__ci_last_regenerate|i:1527756738;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Account\";'),
('7bbf88da8cde3dd88db95c8e5ef11718590e8ad5',	'127.0.0.1',	1527708283,	'__ci_last_regenerate|i:1527708058;user_login|s:1:\"1\";login_user_id|s:1:\"3\";name|s:3:\"Ann\";login_type|s:23:\"Partnership Facilitator\";profile_id|s:1:\"8\";country_id|s:2:\"31\";view_type|s:7:\"Surveys\";'),
('7c26ca7760c6b06d6bf8d15695362badae20f2ef',	'::1',	1527706291,	'__ci_last_regenerate|i:1527706088;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('857f94a6f27ab928d18de420e7401bbe3afe1ab6',	'::1',	1527720900,	'__ci_last_regenerate|i:1527720655;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('859ce8f664ad2c29b0f95394cf7e3461d22b4502',	'::1',	1527769089,	'__ci_last_regenerate|i:1527768915;view_type|s:7:\"Account\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";'),
('88180b6c20bfabc18c334ee51d5a7935dc8c20e5',	'::1',	1527717366,	'__ci_last_regenerate|i:1527717342;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('8b38bcdbc6b36f4e64e61cc83ea4e01c903160fa',	'127.0.0.1',	1527711467,	'__ci_last_regenerate|i:1527711221;user_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:5:\"James\";login_type|s:19:\"Manager Of Training\";profile_id|s:1:\"3\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('8ef642b3454f4727e4a4eeae2f727b33795b1943',	'::1',	1527713491,	'__ci_last_regenerate|i:1527713295;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('9026b0af1d6d0075f26c251f86935a91b2d269d6',	'::1',	1527776496,	'__ci_last_regenerate|i:1527776359;view_type|s:7:\"Account\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";'),
('933e624fca3fb9442857ca2a206a5122fb2bc25d',	'127.0.0.1',	1527719381,	'__ci_last_regenerate|i:1527719337;user_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:5:\"James\";login_type|s:19:\"Manager Of Training\";profile_id|s:1:\"3\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('9883ecea225ad3095368fd9ee88fad1e8b82ffbb',	'::1',	1527719810,	'__ci_last_regenerate|i:1527719554;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('9ca43711db85ce97e04e5cbd39a9f55b77b591e5',	'::1',	1527724914,	'__ci_last_regenerate|i:1527724644;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('a3923dddcd34e2127fabe983eeeca08f8a668f39',	'::1',	1527708333,	'__ci_last_regenerate|i:1527708082;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('a61cfce7837ff3d2e7a401cfef6aa63768fd7cf6',	'::1',	1527710451,	'__ci_last_regenerate|i:1527710179;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('a92cb7ed91bd844760720be3f62f4c2fdc3ce228',	'::1',	1527723939,	'__ci_last_regenerate|i:1527723673;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('ab3f37941f86787817d0cb0f9f2bf6398fe6d50a',	'::1',	1527703283,	'__ci_last_regenerate|i:1527702999;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('b118ad2403496c47a1defa6b4446af6deedb4b97',	'::1',	1527775977,	'__ci_last_regenerate|i:1527775977;view_type|s:7:\"Account\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";'),
('b457cb04a65745fc4b47d613dc4afad04b25b94e',	'127.0.0.1',	1527721608,	'__ci_last_regenerate|i:1527719938;user_login|s:1:\"1\";login_user_id|s:1:\"9\";name|s:5:\"Evans\";login_type|s:23:\"Partnership Facilitator\";profile_id|s:1:\"8\";country_id|s:2:\"25\";view_type|s:7:\"Account\";'),
('b7692b602fa5c63cdb29d4fccb1eb2185044c690',	'::1',	1527755613,	'__ci_last_regenerate|i:1527755110;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('b7c5733afb99c4461364581494f0eea7b26d33ee',	'::1',	1527777171,	'__ci_last_regenerate|i:1527776890;view_type|s:7:\"Account\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";'),
('bc30f5cab1afa934ca82e77d17430fcc379a36ac',	'::1',	1527717339,	'__ci_last_regenerate|i:1527716988;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('bdd1cd171151a9d0e98ed9ffa99c7c50077f5f19',	'127.0.0.1',	1527704422,	'__ci_last_regenerate|i:1527704422;user_login|s:1:\"1\";login_user_id|s:2:\"10\";name|s:8:\"Patricia\";login_type|s:3:\"ITS\";profile_id|s:1:\"4\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('bf10298c603bc99d1d73892c5af276016f293c3f',	'::1',	1527723630,	'__ci_last_regenerate|i:1527723350;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('c23a96dc1444bab938454d4c6dccc6bc43e39070',	'127.0.0.1',	1527709751,	'__ci_last_regenerate|i:1527709635;user_login|s:1:\"1\";login_user_id|s:1:\"3\";name|s:3:\"Ann\";login_type|s:23:\"Partnership Facilitator\";profile_id|s:1:\"8\";country_id|s:2:\"31\";view_type|s:7:\"Surveys\";'),
('c986e9042776f20ffc5b977be61e0568a4fd34dc',	'::1',	1527704709,	'__ci_last_regenerate|i:1527704414;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('cdc3cf29d80e5f0e0e945565b803622648df6e24',	'::1',	1527707851,	'__ci_last_regenerate|i:1527707767;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Account\";'),
('d13582829368b10769ce8612c6addad17b67bcb6',	'::1',	1527748926,	'__ci_last_regenerate|i:1527748635;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Account\";'),
('d1a310cc0f6c5eda5314df3c4db156111faa606b',	'::1',	1527773489,	'__ci_last_regenerate|i:1527773420;view_type|s:7:\"Account\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";'),
('daadb9e1c9e4f82002ff5b3c8bafdf9afbb4c3e4',	'::1',	1527714381,	'__ci_last_regenerate|i:1527714183;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('dafa7326e22eca17e9e23b11a6b9be9c26f359e1',	'::1',	1527725625,	'__ci_last_regenerate|i:1527725328;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('dcbe79c9a63f93b5fece171158e31ce1e4206fb0',	'127.0.0.1',	1527756106,	'__ci_last_regenerate|i:1527754182;user_login|s:1:\"1\";login_user_id|s:1:\"4\";name|s:6:\"Joyce \";login_type|s:26:\"Program Support Specialist\";profile_id|s:1:\"4\";country_id|s:2:\"27\";'),
('e21cb9f1b24fd20e2731d9d1d07f2aeed3251915',	'::1',	1527720327,	'__ci_last_regenerate|i:1527720302;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('e2cdee26a98077a5534f8ac3f98fcc966d392150',	'127.0.0.1',	1527777164,	'__ci_last_regenerate|i:1527776399;view_type|s:7:\"Account\";user_login|s:1:\"1\";login_user_id|s:1:\"3\";name|s:3:\"Ann\";login_type|s:23:\"Partnership Facilitator\";profile_id|s:1:\"8\";country_id|s:2:\"31\";'),
('e75d9333d1b9cafa6eb633930cc371dc4ce18e66',	'127.0.0.1',	1527703354,	'__ci_last_regenerate|i:1527703292;user_login|s:1:\"1\";login_user_id|s:2:\"10\";name|s:8:\"Patricia\";login_type|s:3:\"ITS\";profile_id|s:1:\"4\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('e7c9f47d3b803e55b882076d822cdb996bb6b1c6',	'::1',	1527775221,	'__ci_last_regenerate|i:1527774971;view_type|s:7:\"Account\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";'),
('ec837cd54128dbb33df841d9452cfeba0456c765',	'::1',	1527748589,	'__ci_last_regenerate|i:1527747923;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Account\";'),
('ee9796ec5bcde8b6731af2d0838cac3b2f2d0999',	'::1',	1527717808,	'__ci_last_regenerate|i:1527717783;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('efa6de8115dd12b3b28ad1f4aeff008a53dd4ce0',	'::1',	1527756218,	'__ci_last_regenerate|i:1527755924;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('f3220c075f1809756c4a5ec9c38093b0aac16111',	'::1',	1527704093,	'__ci_last_regenerate|i:1527704092;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('f9654affaece80455bb2b875dd9017f867108363',	'127.0.0.1',	1527716997,	'__ci_last_regenerate|i:1527716997;user_login|s:1:\"1\";login_user_id|s:2:\"11\";name|s:5:\"Velma\";login_type|s:23:\"Partnership Facilitator\";profile_id|s:1:\"4\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('ff1028f0e6fd36843a3248c587e55cdd18e5e880',	'::1',	1527721623,	'__ci_last_regenerate|i:1527721501;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";');

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
(29,	'Togo',	'0000-00-00 00:00:00',	0,	0,	'2018-05-31 13:38:14'),
(30,	'Ethiopia',	'0000-00-00 00:00:00',	0,	0,	'2018-05-31 13:38:14'),
(31,	'Ghana',	'0000-00-00 00:00:00',	0,	0,	'2018-05-31 13:38:14'),
(33,	'Burkina Faso',	'0000-00-00 00:00:00',	0,	0,	'2018-05-31 13:38:14');

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
(4,	'Risk Management',	0,	'0000-00-00 00:00:00',	0,	'2018-05-31 14:12:40'),
(5,	'IT',	0,	'0000-00-00 00:00:00',	0,	'2018-05-31 14:12:40'),
(6,	'Business Services',	0,	'0000-00-00 00:00:00',	0,	'2018-05-31 14:12:40');

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
(4,	'update_user',	20),
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
(50,	'delete_role',	17);

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
(1,	'Business Engagement',	'<p>\r\n	How does the staff portrays diligence in the following business parameters?</p>\r\n',	1,	'2018-05-30 23:31:50',	'2018-05-30 20:31:50',	1,	1),
(2,	'Cultural Behaviours',	'How does the staff portrays diligence in the following cultural parameters?',	1,	'2018-05-26 13:31:17',	'2018-05-26 10:31:17',	1,	1),
(3,	'Staff Welfare',	'<p>\r\n	This is to check on the welfare of the staff</p>\r\n',	1,	'0000-00-00 00:00:00',	'2018-05-29 09:09:43',	0,	0);

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
(258,	'delete_role',	'',	'',	'',	NULL);

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
(7,	'Super Admin',	'Has all privileges'),
(8,	'HRBP',	'Human Resource Staff');

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
(8,	8,	11,	0,	'2018-05-30 01:50:25',	11,	11,	'2018-05-30 11:50:25'),
(9,	8,	3,	0,	'2018-05-30 05:58:28',	3,	3,	'2018-05-30 15:58:28'),
(10,	8,	2,	0,	'2018-05-30 06:01:13',	2,	2,	'2018-05-30 16:01:13'),
(11,	8,	10,	0,	'2018-05-30 07:28:14',	10,	10,	'2018-05-30 17:28:14'),
(12,	8,	9,	0,	'2018-05-30 08:57:15',	9,	9,	'2018-05-30 18:57:15'),
(13,	8,	4,	0,	'2018-05-31 12:28:46',	4,	4,	'2018-05-30 22:28:46'),
(14,	8,	1,	0,	'2018-05-31 10:45:24',	1,	1,	'2018-05-31 08:45:24');

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
(14,	'skin_colour',	'green'),
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
(8,	'2018-05-29 00:00:00',	'2018-05-31 00:00:00',	1,	1,	1,	'2018-05-29',	1,	'2018-05-29 10:51:42');

DROP TABLE IF EXISTS `tabulate`;
CREATE TABLE `tabulate` (
  `tabulate_id` int(11) NOT NULL AUTO_INCREMENT,
  `result_id` int(100) NOT NULL,
  `category_id` int(100) NOT NULL,
  `nominated_unit` tinyint(4) NOT NULL,
  `nominee_id` int(100) NOT NULL,
  `created_date` datetime NOT NULL,
  `created_by` int(100) NOT NULL,
  `last_modified_by` int(100) NOT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tabulate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `tabulate` (`tabulate_id`, `result_id`, `category_id`, `nominated_unit`, `nominee_id`, `created_date`, `created_by`, `last_modified_by`, `last_modified_date`) VALUES
(18,	9,	4,	3,	9,	'2018-05-31 10:57:39',	3,	3,	'2018-05-31 08:57:39'),
(19,	9,	11,	4,	2,	'2018-05-31 10:58:36',	3,	3,	'2018-05-31 08:58:36');

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
(5,	'Tendering Team',	25,	'Testing'),
(6,	'Sports',	25,	'For events planning'),
(7,	'Talent Developemt',	28,	'For beneficiary talents'),
(8,	'POYA',	28,	'ICP Wards'),
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
(11,	'Velma',	'Odhiambo',	'VOdhiambo@ke.ci.org',	'956d2d5467ed373328ee2d165a51c399',	'female',	'88756785',	'',	3,	4,	2,	1,	25);

-- 2018-05-31 14:50:11
