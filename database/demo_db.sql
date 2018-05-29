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
(150,	1,	7),
(151,	2,	7),
(152,	3,	7),
(153,	4,	7),
(154,	5,	7),
(155,	6,	7),
(156,	7,	7),
(157,	8,	7),
(158,	9,	7),
(159,	10,	7),
(160,	12,	7),
(161,	13,	7),
(162,	14,	7),
(163,	15,	7),
(164,	16,	7),
(165,	17,	7),
(166,	18,	7),
(167,	19,	7),
(168,	20,	7),
(169,	23,	7),
(170,	24,	7),
(171,	25,	7),
(172,	27,	7),
(173,	28,	7),
(174,	29,	7),
(175,	30,	7),
(176,	31,	7),
(177,	32,	7),
(178,	33,	7),
(179,	34,	7);

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
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

INSERT INTO `category` (`category_id`, `name`, `grouping_id`, `visibility`, `assignment`, `unit`, `status`, `created_date`, `created_by`, `last_modified_date`, `last_modified_by`) VALUES
(1,	'100% for one another',	2,	28,	'1',	4,	1,	'2018-05-26 01:43:01',	1,	'2018-05-29 07:45:27',	1),
(4,	'Test',	1,	1,	'1',	4,	1,	'2020-02-05 00:00:00',	1,	'2018-05-29 07:45:37',	1),
(5,	'Test7',	1,	30,	'2',	2,	1,	'2020-02-05 00:00:00',	1,	'2018-05-29 07:24:36',	1),
(9,	'Test 6',	2,	31,	'2',	3,	1,	'2018-05-26 07:25:00',	1,	'2018-05-29 07:45:52',	1),
(10,	'Welfare One',	3,	1,	'2',	4,	1,	'2018-05-29 11:11:17',	1,	'2018-05-29 11:35:55',	1),
(11,	'Category 5',	2,	1,	'1',	4,	1,	'2018-05-29 01:24:20',	1,	'2018-05-29 11:24:20',	1);

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
('02b982943281af85dbb7b15c4778c8e4eb2d8af3',	'::1',	1526934975,	'__ci_last_regenerate|i:1526934700;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"2\";view_type|s:7:\"Account\";'),
('032fe07ba2ceeef2c30e4cca3a8abfb9876d412d',	'::1',	1526937471,	'__ci_last_regenerate|i:1526937196;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"2\";view_type|s:7:\"Account\";'),
('03c8230d283e65870d931e98d619d4036824a2eb',	'::1',	1527247717,	'__ci_last_regenerate|i:1527247705;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('03fd7575b914c17676599ceb1d7a9eb41813c477',	'::1',	1526941972,	'__ci_last_regenerate|i:1526941834;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"2\";view_type|s:9:\"Dashboard\";'),
('04315c2423f10a04d4dfcb3ca0ccd3616f8777da',	'::1',	1527354968,	'__ci_last_regenerate|i:1527354703;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('06f95cb5cbf2f2f982659fa69c8fb62de3cdde3d',	'::1',	1527244298,	'__ci_last_regenerate|i:1527244027;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('0713bcdf02418466a57abab20b057caf4c8f0e99',	'::1',	1527156899,	'__ci_last_regenerate|i:1527156877;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('07550195f157d2f0dbf3f5317efbd25d6ff3e812',	'::1',	1527583189,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";__ci_last_regenerate|i:1527582924;view_type|s:7:\"Surveys\";'),
('0856bc5aae436fcf474642c5b73b377e53ba8116',	'::1',	1527582577,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";__ci_last_regenerate|i:1527582509;view_type|s:7:\"Surveys\";'),
('09744c8911f80f0206b2152859009037de98095e',	'::1',	1526971375,	'__ci_last_regenerate|i:1526970995;view_type|s:7:\"Account\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";current_language|s:7:\"english\";current_language_changed|b:1;'),
('0aba1e69e93195726ae290f64ec23e9257aec692',	'::1',	1527236321,	'__ci_last_regenerate|i:1527236321;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('0b8b569b5213752fd31d338b12c1955136a0a8ec',	'127.0.0.1',	1527596438,	'__ci_last_regenerate|i:1527596148;user_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:5:\"James\";login_type|s:19:\"Manager Of Training\";profile_id|s:1:\"3\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('0ead6f87cd80be95707a0ccb70e965d3d04368c7',	'::1',	1527529334,	'__ci_last_regenerate|i:1527529319;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('0ef245c36657ce2296045222c5eb7fe43c89c93a',	'::1',	1527239163,	'__ci_last_regenerate|i:1527238880;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('110e2f640bdd5ea24f5690bc5985e87aa4e825ba',	'::1',	1527598218,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";__ci_last_regenerate|i:1527598172;view_type|s:7:\"Surveys\";'),
('12a0f191a7b670436a5febb62567428daa2799cb',	'::1',	1527584290,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";__ci_last_regenerate|i:1527583991;view_type|s:7:\"Surveys\";'),
('1443b4920c4fad925d0c34a6dabcbc71e167b57e',	'127.0.0.1',	1527597743,	'__ci_last_regenerate|i:1527597482;user_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:5:\"James\";login_type|s:19:\"Manager Of Training\";profile_id|s:1:\"3\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('151d0836c8c6da1a47340dc05d9578d866c03270',	'::1',	1527587954,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";__ci_last_regenerate|i:1527587950;view_type|s:7:\"Surveys\";flash_message|s:7:\"Success\";__ci_vars|a:1:{s:13:\"flash_message\";s:3:\"old\";}'),
('1627924bb24abf55a2fe0248b3bea69bf7be8343',	'::1',	1527246103,	'__ci_last_regenerate|i:1527245822;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('163f5b158d98b99b851dfb4a57410cb686923acb',	'::1',	1527229064,	'__ci_last_regenerate|i:1527229064;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('194cf57e329f780ce81bbcc50ad0fca40b5f7379',	'::1',	1527246890,	'__ci_last_regenerate|i:1527246645;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('19e23b87f346a8214732a39b40bd68edd1062c82',	'127.0.0.1',	1526950123,	'__ci_last_regenerate|i:1526950123;view_type|s:9:\"Dashboard\";'),
('1b632472c31ed307b3d120e39d8c56c41f90ccc6',	'127.0.0.1',	1527595147,	'__ci_last_regenerate|i:1527595104;user_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:5:\"James\";login_type|s:19:\"Manager Of Training\";profile_id|s:1:\"3\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('1cb11ed022ebf01917a9e994e535769b882f7bdb',	'::1',	1526945819,	'__ci_last_regenerate|i:1526945646;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"2\";view_type|s:8:\"Settings\";'),
('1ea0652589179f0b007fb94d9611725db773eed3',	'::1',	1526949300,	'__ci_last_regenerate|i:1526949102;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:8:\"Messages\";current_language|s:7:\"english\";current_language_changed|b:1;'),
('1f4e113d6d1cbe445e3889a15b6bf7b66bfdbc49',	'127.0.0.1',	1527241564,	'__ci_last_regenerate|i:1527241552;'),
('2377576afa442bf7a2333c4aab14e5295b0d86af',	'::1',	1527239435,	'__ci_last_regenerate|i:1527239216;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('241c8f3870a2900988a29fad1e9523c32fd4c25c',	'::1',	1527251828,	'__ci_last_regenerate|i:1527251579;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Account\";'),
('24590d70ae1484918f15622ca9bd42cdbb2d35f3',	'::1',	1527528881,	'__ci_last_regenerate|i:1527528826;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('2500725d3b46026f90df6f00fd434ea6639ccfc3',	'::1',	1526936835,	'__ci_last_regenerate|i:1526936484;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"2\";view_type|s:7:\"Account\";'),
('26bb8590ebed5abaef8b3be552315cc40810f7e9',	'::1',	1526933864,	'__ci_last_regenerate|i:1526933570;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"2\";view_type|s:7:\"Account\";'),
('27c10891c2522fc45d6604bfd0c7dd60b1255dc0',	'::1',	1526949418,	'__ci_last_regenerate|i:1526949409;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:8:\"Messages\";current_language|s:7:\"english\";current_language_changed|b:1;'),
('28644635377fa0b12e446e545fdb2110e4cef227',	'::1',	1526932917,	'__ci_last_regenerate|i:1526932647;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"2\";view_type|s:7:\"Account\";'),
('29908cace22a99344594efc7dc65372b6f8db9be',	'::1',	1527233115,	'__ci_last_regenerate|i:1527232660;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('2bcafff07ce55216f8655f321c7136b59042ea8c',	'::1',	1527329307,	'__ci_last_regenerate|i:1527329142;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('2c0c83742d95c548d1fc81dff1f1769274e66322',	'::1',	1527242626,	'__ci_last_regenerate|i:1527242388;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('2c16c2a4adc0e7bfa35876caf951cedfccaf2f58',	'::1',	1527250812,	'__ci_last_regenerate|i:1527250514;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Account\";'),
('2c1e63eaef12c9e9d0ed7495b56371372263119a',	'::1',	1527218309,	'__ci_last_regenerate|i:1527218229;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('2c4da0f8e4edebc003d19bf08d5e993841efba53',	'::1',	1527591546,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";__ci_last_regenerate|i:1527591453;view_type|s:7:\"Surveys\";'),
('2e09be947ca040c0c5e8494cc69c5c6733c36fce',	'127.0.0.1',	1527322939,	'__ci_last_regenerate|i:1527322934;user_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:5:\"James\";login_type|s:19:\"Manager Of Training\";profile_id|s:1:\"3\";country_id|s:2:\"25\";view_type|s:9:\"Dashboard\";'),
('2e1a0543da1772ebc579b923d2b6633ffe255edd',	'127.0.0.1',	1527238519,	'__ci_last_regenerate|i:1527238519;user_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:5:\"James\";login_type|s:19:\"Manager Of Training\";profile_id|s:1:\"3\";view_type|s:9:\"Dashboard\";'),
('2e883960ed0524d36ca7933336ab6b316d644246',	'::1',	1527578638,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";__ci_last_regenerate|i:1527578358;view_type|s:7:\"Surveys\";'),
('2ec4846c27caabdeb2c95a8da81badc2230a496f',	'::1',	1527595795,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";__ci_last_regenerate|i:1527595668;view_type|s:7:\"Surveys\";'),
('2f54264b51e4b5da09992381fba2909cae8999bc',	'::1',	1527528571,	'__ci_last_regenerate|i:1527528500;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('2fea8cdc9fd3b4e09b13e45ac2b6b76f845072c0',	'::1',	1526938147,	'__ci_last_regenerate|i:1526937812;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"2\";view_type|s:7:\"Account\";'),
('31375b8981d188effdbc7759995958684f1ae2b8',	'::1',	1527579574,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";__ci_last_regenerate|i:1527579276;view_type|s:7:\"Surveys\";'),
('319974d00b3b677533eabb7859a186735213da81',	'::1',	1527329090,	'__ci_last_regenerate|i:1527328837;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('32abb05ba3d7f25a72186217cbc96e0a654e150f',	'::1',	1527340806,	'__ci_last_regenerate|i:1527340643;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('341ef810acc6d3a9057fcae2f4fa58d98ceb5439',	'::1',	1527222653,	'__ci_last_regenerate|i:1527222647;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('35a38bd46a4c54d9659295939cee42468939d15c',	'::1',	1527242827,	'__ci_last_regenerate|i:1527242827;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('3a9ed8e6ff8cfdac1a37f679e799b447db5f7b17',	'::1',	1526939139,	'__ci_last_regenerate|i:1526938888;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"2\";view_type|s:7:\"Account\";'),
('3aa1754897a78c0e64b933693acb704374484364',	'::1',	1527358094,	'__ci_last_regenerate|i:1527357853;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('3ac10a7457e31218d350517d0bf7319816df5792',	'::1',	1527585496,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";__ci_last_regenerate|i:1527585452;view_type|s:7:\"Surveys\";'),
('3b2af8ea11bdfd60da1c4ebb766cbf1caa86d9cb',	'::1',	1527159179,	'__ci_last_regenerate|i:1527159017;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('3b48b84b9ac87a91b8b48ce70f3e212648c3603c',	'::1',	1527596691,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";__ci_last_regenerate|i:1527596525;view_type|s:7:\"Surveys\";'),
('3ca5b346bfaf258b8a778f96761269e0d07b09b2',	'::1',	1527587934,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";__ci_last_regenerate|i:1527587641;view_type|s:7:\"Surveys\";'),
('3cce40d9dbfa5fdf50361fb6cb2c71ea478a8782',	'::1',	1527593073,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";__ci_last_regenerate|i:1527593011;view_type|s:7:\"Surveys\";'),
('3ce4d34d8ea232db912faa7ce517d4f8d4542acd',	'127.0.0.1',	1526942942,	'__ci_last_regenerate|i:1526942841;view_type|s:9:\"Dashboard\";user_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:5:\"James\";login_type|s:19:\"Manager Of Training\";profile_id|s:1:\"3\";'),
('3f085dc654a8d0a03457df97246ab39c1154f502',	'::1',	1527530075,	'__ci_last_regenerate|i:1527529779;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('3f4a69fbd2439a87bf0c57d6a5f817a112488bf8',	'::1',	1527341250,	'__ci_last_regenerate|i:1527340977;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('41f30364f6c4c0c4ec83b084a16cb3b52e9eb283',	'::1',	1527583510,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";__ci_last_regenerate|i:1527583236;view_type|s:7:\"Surveys\";'),
('43549a15ca5f8276fdc79270fec60a23aab9fc51',	'::1',	1527333903,	'__ci_last_regenerate|i:1527333854;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('4583167f39e78be81461d488e0ca5bc44896b06e',	'::1',	1526948979,	'__ci_last_regenerate|i:1526948696;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:8:\"Messages\";current_language|s:7:\"english\";current_language_changed|b:1;'),
('46535c64636a38bf44bee6f791bbd358a506a550',	'::1',	1527334662,	'__ci_last_regenerate|i:1527334542;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('493d6a06992b70201adb126abf69bb045eb77ae5',	'::1',	1526939799,	'__ci_last_regenerate|i:1526939752;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"2\";view_type|s:9:\"Dashboard\";'),
('4d367e2d9faa418cd1e57b5ebc7c4ca332d0fd8c',	'::1',	1527342855,	'__ci_last_regenerate|i:1527342836;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('507efc2c466a7841dbb063d1f956099c2048406c',	'::1',	1526950098,	'__ci_last_regenerate|i:1526950058;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:9:\"Dashboard\";current_language|s:7:\"english\";current_language_changed|b:1;'),
('50fe04b3928e3616b10b00aa55a5a943bb8aed26',	'::1',	1527246349,	'__ci_last_regenerate|i:1527246170;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('55683dd73c6b105606b7ea3257a03e7e4b378bf2',	'::1',	1527220030,	'__ci_last_regenerate|i:1527219833;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('56fc5bf67c8d790dd620a550683e8702d9ad5bc6',	'127.0.0.1',	1527161477,	'__ci_last_regenerate|i:1527161199;user_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:5:\"James\";login_type|s:19:\"Manager Of Training\";profile_id|s:1:\"3\";view_type|s:9:\"Dashboard\";'),
('574e11882af5ee0d37abd6e81a2277b178c10fe7',	'::1',	1527245792,	'__ci_last_regenerate|i:1527245459;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('58f1084a114e882d595db5e8ff81aa2a21cc2c30',	'127.0.0.1',	1527596684,	'__ci_last_regenerate|i:1527596459;user_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:5:\"James\";login_type|s:19:\"Manager Of Training\";profile_id|s:1:\"3\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('5950647d06ba5881568521cc6759d006caa88800',	'::1',	1527578009,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";__ci_last_regenerate|i:1527577988;view_type|s:7:\"Surveys\";'),
('5a74a3a0e8276a28bf848381877fab281e32f847',	'127.0.0.1',	1527595808,	'__ci_last_regenerate|i:1527595808;user_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:5:\"James\";login_type|s:19:\"Manager Of Training\";profile_id|s:1:\"3\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('5bcc411a17f24026e72cd1459d74d0e38b820fda',	'::1',	1527220666,	'__ci_last_regenerate|i:1527220542;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('5ce56d42c6fe7457bcf03bd7693f710c3157bc45',	'::1',	1527222033,	'__ci_last_regenerate|i:1527222018;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('5e9ae631498b61ee0dd4e7edc2c328b7f017b1bd',	'::1',	1527171456,	'__ci_last_regenerate|i:1527171256;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";current_language|s:7:\"swahili\";current_language_changed|b:1;'),
('5f7d6155c8368ee4d54dbf16a89a4fb21162955e',	'::1',	1526942351,	'__ci_last_regenerate|i:1526942195;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"2\";view_type|s:9:\"Dashboard\";'),
('603d4d2d3f2202bbe9515882f5ebca021fb7b91e',	'::1',	1527160685,	'__ci_last_regenerate|i:1527160389;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:8:\"Settings\";'),
('606c9874bf687537d2f77df1c2b95f30b57c4401',	'::1',	1527158906,	'__ci_last_regenerate|i:1527158691;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('62cab3ec29e8fe93eb653ce5345e34b52225b710',	'::1',	1527327467,	'__ci_last_regenerate|i:1527327286;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('62fe986c7881e0cbdc633deae5644174897f1bc7',	'::1',	1527223751,	'__ci_last_regenerate|i:1527223199;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('643312a74d77c8af37f76eabcd8057273a9c1988',	'::1',	1526944929,	'__ci_last_regenerate|i:1526944653;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"2\";view_type|s:7:\"Account\";'),
('64b92517bd9283fd67d1ae48780589abebd40b67',	'::1',	1527530864,	'__ci_last_regenerate|i:1527530596;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('66d6580e87a5a70f493b979ad0a2a342af428665',	'127.0.0.1',	1526971380,	'__ci_last_regenerate|i:1526971123;user_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:5:\"James\";login_type|s:19:\"Manager Of Training\";profile_id|s:1:\"3\";view_type|s:9:\"Dashboard\";'),
('679a6054999baaebb941070286edfef1e6f65655',	'::1',	1527354382,	'__ci_last_regenerate|i:1527354380;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('67c1bcef49d74dceeea11360bee7b27f82bf9d50',	'::1',	1527171164,	'__ci_last_regenerate|i:1527170914;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";current_language|s:7:\"swahili\";current_language_changed|b:1;flash_message|s:25:\"User Created Successfully\";__ci_vars|a:1:{s:13:\"flash_message\";s:3:\"old\";}'),
('69182da93421a1f5ba052099b6bc1d28f53316e5',	'::1',	1527249643,	'__ci_last_regenerate|i:1527249189;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Account\";'),
('6bfdffffdf5abb47e88a7bc5277a552420c8003f',	'::1',	1527172917,	'__ci_last_regenerate|i:1527172668;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";current_language|s:7:\"swahili\";current_language_changed|b:1;'),
('6c95bf04151a1b4560a253d3cef3c95ae0d137c7',	'::1',	1527244974,	'__ci_last_regenerate|i:1527244678;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('6cc18df25b388ddf79cd9e00ac9b784fddb76508',	'::1',	1527596274,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";__ci_last_regenerate|i:1527596222;view_type|s:7:\"Surveys\";'),
('6db16320aad6b598c0d6ce743312d549042ded6f',	'127.0.0.1',	1526977286,	'__ci_last_regenerate|i:1526977286;'),
('6e0df4b72fcdbd7ce811b7469a45e35efe2490ef',	'::1',	1527585117,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";__ci_last_regenerate|i:1527584833;view_type|s:7:\"Surveys\";'),
('6edf0c3411d838e266b904fb4cbed6962dfea9d3',	'::1',	1527528497,	'__ci_last_regenerate|i:1527528197;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('6ffa1ab923bcf2a15a057f2023e1ad02682b2c2e',	'::1',	1527341434,	'__ci_last_regenerate|i:1527341330;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('73a61f7b07e8a93c83db75248d6f96a01f30c8c6',	'::1',	1527340087,	'__ci_last_regenerate|i:1527339831;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('762824f3ccfc4579a8d919c65ccdb729391096d8',	'127.0.0.1',	1527594475,	'__ci_last_regenerate|i:1527594346;user_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:5:\"James\";login_type|s:19:\"Manager Of Training\";profile_id|s:1:\"3\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('766817dcd144f3ecbc4e25fb714b1a8c98500dcb',	'::1',	1526943319,	'__ci_last_regenerate|i:1526943202;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"2\";view_type|s:7:\"Account\";'),
('7970eee26001ee0e1907a8fd78b67b29497be86c',	'::1',	1527165876,	'__ci_last_regenerate|i:1527165875;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";current_language|s:7:\"swahili\";current_language_changed|b:1;'),
('79a82749b27ddb2ef1a5b02670cf42816f16193d',	'::1',	1527328542,	'__ci_last_regenerate|i:1527328361;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('7b05ed7ed99c83ab9fb754d90488b2cccc13bd7f',	'::1',	1527531247,	'__ci_last_regenerate|i:1527530961;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('7d8a06ecaf1b256017c025bf67ac208a9d4abc8d',	'127.0.0.1',	1527238932,	'__ci_last_regenerate|i:1527238859;user_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:5:\"James\";login_type|s:19:\"Manager Of Training\";profile_id|s:1:\"3\";view_type|s:9:\"Dashboard\";'),
('8006d75126909544ae764c7ced6a41308586a186',	'::1',	1527530368,	'__ci_last_regenerate|i:1527530082;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('80d16fc3094ea1aa3b7c5546f4485bc5e51d640a',	'::1',	1527219731,	'__ci_last_regenerate|i:1527219421;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('80f817ed00ccc0a70ad7784a15f48fc7cedf1001',	'::1',	1527578676,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";__ci_last_regenerate|i:1527578669;view_type|s:7:\"Surveys\";'),
('82240ee2287c896e8be6886eba625bbb4d8b1990',	'::1',	1526943687,	'__ci_last_regenerate|i:1526943579;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"2\";view_type|s:7:\"Account\";'),
('8227845f388201d3e1697afa28f715ea61ed56cb',	'::1',	1527161470,	'__ci_last_regenerate|i:1527161067;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";current_language|s:7:\"swahili\";current_language_changed|b:1;'),
('828246602851e752e5c7694eaa38d1a0d8a84f6d',	'::1',	1526946302,	'__ci_last_regenerate|i:1526945974;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"2\";view_type|s:7:\"Account\";'),
('82c3f99a0a421ab8a028301b11cc2cb8970a4cbc',	'::1',	1526948092,	'__ci_last_regenerate|i:1526947909;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:9:\"Dashboard\";current_language|s:7:\"swahili\";'),
('82d895e2f407d7081240583460cb5fbce641a3df',	'::1',	1527219315,	'__ci_last_regenerate|i:1527219069;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('8493322acabe8121bbd4fb651e07135ff684632b',	'127.0.0.1',	1527239428,	'__ci_last_regenerate|i:1527239428;user_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:5:\"James\";login_type|s:19:\"Manager Of Training\";profile_id|s:1:\"3\";view_type|s:9:\"Dashboard\";'),
('8541a1ad4a9230c8887175362a78f0734fd250b8',	'::1',	1527245247,	'__ci_last_regenerate|i:1527244988;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('8614cf8dd8d11d62f364d62e289e89dfdbba5c60',	'::1',	1526944193,	'__ci_last_regenerate|i:1526943898;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"2\";view_type|s:7:\"Account\";'),
('88244dc51d89831f5f413a1f8768c18be3c20e0c',	'::1',	1527339788,	'__ci_last_regenerate|i:1527339497;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('88714ecb93c2f9ed497af9bcb86ba1f070b9fed4',	'::1',	1526950044,	'__ci_last_regenerate|i:1526949750;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:8:\"Messages\";current_language|s:7:\"english\";current_language_changed|b:1;'),
('891abf3cd5419f77f22f6b07b63fd823ed26f31b',	'::1',	1527589195,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";__ci_last_regenerate|i:1527588898;view_type|s:7:\"Surveys\";'),
('898b73699e557b6d9e1fa10ecd155ad330cfb587',	'::1',	1527531331,	'__ci_last_regenerate|i:1527531275;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('8c4485816d7b08a6084930340fc93c78e22af773',	'::1',	1526935794,	'__ci_last_regenerate|i:1526935514;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"2\";view_type|s:7:\"Account\";'),
('8db8bf175c2f6331a0e74b32d34ff4f6579102d2',	'::1',	1527526850,	'__ci_last_regenerate|i:1527526715;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('8dbf4f1d49e0c6457c311843034854963d702159',	'::1',	1526946569,	'__ci_last_regenerate|i:1526946362;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('8dfc129517288199663d5e91d81719865ab0131c',	'::1',	1527590371,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";__ci_last_regenerate|i:1527590175;view_type|s:7:\"Surveys\";'),
('8f5350a0b440870c843d5cb40051e7ed51a207bb',	'::1',	1527226197,	'__ci_last_regenerate|i:1527225250;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('91400ac818d1988ebeaf45951c51f725d463f2db',	'::1',	1527590809,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";__ci_last_regenerate|i:1527590522;view_type|s:7:\"Surveys\";'),
('9304462a004b126677fe9e5536d8817871c412d6',	'::1',	1526948484,	'__ci_last_regenerate|i:1526948271;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:9:\"Dashboard\";current_language|s:7:\"swahili\";'),
('93981c9c2dbaa77d97026641da1949977fbee556',	'::1',	1527528165,	'__ci_last_regenerate|i:1527527874;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('94cf58c6879a11dc4201cfe2baae31aeb22e554f',	'::1',	1527218670,	'__ci_last_regenerate|i:1527218666;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('957a964a9e0ad7dc665b96ca8a063ad06a25026b',	'::1',	1527354003,	'__ci_last_regenerate|i:1527353995;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:9:\"Dashboard\";'),
('9582e8ecddd9bf2e024bf1a7e2efe9fa535184c5',	'::1',	1526937067,	'__ci_last_regenerate|i:1526936887;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"2\";view_type|s:7:\"Account\";'),
('968d371db5a109fe6ea5069fa993ed960083c2c5',	'::1',	1527160981,	'__ci_last_regenerate|i:1527160710;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";current_language|s:7:\"swahili\";current_language_changed|b:1;'),
('980d8298bafa36e6df17534a7d58672c9c2eb16f',	'127.0.0.1',	1527238337,	'__ci_last_regenerate|i:1527238111;user_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:5:\"James\";login_type|s:19:\"Manager Of Training\";profile_id|s:1:\"3\";view_type|s:9:\"Dashboard\";'),
('9878266f8e36468dc6df83663a98b31128d166e0',	'127.0.0.1',	1527593532,	'__ci_last_regenerate|i:1527593532;user_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:5:\"James\";login_type|s:19:\"Manager Of Training\";profile_id|s:1:\"3\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('98e4dbce2dd103211d6f526c7e52749f7cb765c2',	'::1',	1527248816,	'__ci_last_regenerate|i:1527248523;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('993403cac07ad39b779bac7eb005f2e769dd634f',	'::1',	1527232641,	'__ci_last_regenerate|i:1527231482;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('9a1025b7dce6df2da68d5edb4813ac4807032d79',	'::1',	1527250351,	'__ci_last_regenerate|i:1527249694;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Account\";'),
('9cdd0fb0941cfca48b9856444dbbb993d8912193',	'::1',	1527339457,	'__ci_last_regenerate|i:1527339167;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('9d2b6e2fb36964dfeeb4e76e834814d1b4fd2dbd',	'::1',	1527330874,	'__ci_last_regenerate|i:1527330578;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('9d65ad3c07d8590971e6b763e673770e58568ff0',	'::1',	1527580083,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";__ci_last_regenerate|i:1527579905;view_type|s:7:\"Surveys\";'),
('9dc66c11f76431aff799b6391ca74a0c77017395',	'::1',	1527160388,	'__ci_last_regenerate|i:1527159732;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";'),
('9e1a164eaa97ef2a4b8eb37352869a28182c9d7b',	'::1',	1527244618,	'__ci_last_regenerate|i:1527244330;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('9e41f72d920c39b223e2230a927dd139144f1d08',	'::1',	1526937796,	'__ci_last_regenerate|i:1526937509;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"2\";view_type|s:7:\"Account\";'),
('9ebcb292bcce8d2fd207491d194ed36f1dd7a559',	'::1',	1526936477,	'__ci_last_regenerate|i:1526936172;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"2\";view_type|s:7:\"Account\";'),
('9fdd74a65a496d01793f047ea3b8ea8b1ccf96e9',	'::1',	1527357814,	'__ci_last_regenerate|i:1527357529;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('a1028328107d7a15dc997af349f28cf95aa4ae4f',	'::1',	1527240312,	'__ci_last_regenerate|i:1527240077;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('a2b20350dd4f0d243812b7a0d504a939491572f9',	'::1',	1527330963,	'__ci_last_regenerate|i:1527330894;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";flash_message|s:7:\"Success\";__ci_vars|a:1:{s:13:\"flash_message\";s:3:\"old\";}'),
('a7451841702526349f837b4064aa33b5a83a1141',	'::1',	1527355610,	'__ci_last_regenerate|i:1527355485;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('a92e945ad63f565859d2c52e7961420795e8df8f',	'::1',	1527161534,	'__ci_last_regenerate|i:1527161507;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";current_language|s:7:\"swahili\";current_language_changed|b:1;'),
('a9ed8f9979d1d4025b29725b458f0e21a5dc9121',	'::1',	1527592263,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";__ci_last_regenerate|i:1527592036;view_type|s:7:\"Surveys\";'),
('aaf0e283c31a20a4f089c4aa79b48125fdb722c6',	'::1',	1527597961,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";__ci_last_regenerate|i:1527597777;view_type|s:7:\"Surveys\";'),
('addfb2227a32b1f867f3611ddb001317aa6d061f',	'::1',	1527324564,	'__ci_last_regenerate|i:1527324555;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:8:\"Settings\";'),
('aff24b5bfda58cd493893af7753116d69d259a0b',	'::1',	1527339127,	'__ci_last_regenerate|i:1527338827;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('b0e85de44e9aa06e2c7343daeb9bf1d3985af4b1',	'::1',	1527332018,	'__ci_last_regenerate|i:1527331720;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('b0f81d2e76b2fa10bd6e157da6747468965835d3',	'::1',	1527527648,	'__ci_last_regenerate|i:1527527565;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('b217f6507250a006dcf4447ab2c84657d8c12af4',	'::1',	1526940115,	'__ci_last_regenerate|i:1526939826;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"2\";view_type|s:9:\"Dashboard\";'),
('b242060ae374d5ab1ea307a21603c62cf109b4d0',	'::1',	1527597357,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";__ci_last_regenerate|i:1527597142;view_type|s:7:\"Surveys\";'),
('b32348ef6d961e431db0310cc0be45e3d4bb9fe4',	'::1',	1527341989,	'__ci_last_regenerate|i:1527341937;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('b632c4481e770aae64d0c86fd20f3e33522cbac5',	'::1',	1527243365,	'__ci_last_regenerate|i:1527243220;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('b6e521325a96b748ba64b4bae405807ebb996044',	'::1',	1527217636,	'__ci_last_regenerate|i:1527217335;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('b8faf6fb244976faae4b0aa57421e8eaf2261fdf',	'::1',	1527241827,	'__ci_last_regenerate|i:1527241763;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('bb514a6dc8133b5efb6bb0fe117ae49b697d95e8',	'::1',	1526939697,	'__ci_last_regenerate|i:1526939412;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"2\";view_type|s:9:\"Dashboard\";'),
('bb9d4b8d4aae8571a674a5bb887733be19a3f419',	'::1',	1526941531,	'__ci_last_regenerate|i:1526941376;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"2\";view_type|s:9:\"Dashboard\";'),
('bbca9ed74ba0607fcf5b8f199fb091c0ea56a927',	'::1',	1527580922,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";__ci_last_regenerate|i:1527580724;view_type|s:7:\"Surveys\";'),
('bbf5a2209187836a84e46acaebf3e9d349aa9b44',	'::1',	1527582284,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";__ci_last_regenerate|i:1527582111;view_type|s:7:\"Surveys\";'),
('be4d8d629328394abd88feed416ca6c1aae2ab48',	'::1',	1526947792,	'__ci_last_regenerate|i:1526947582;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:9:\"Dashboard\";current_language|s:7:\"swahili\";'),
('c0ea9810c88b719b589658c0b0f89b43989c5fa5',	'::1',	1527580677,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";__ci_last_regenerate|i:1527580407;view_type|s:7:\"Surveys\";'),
('c0eef7c21c2e5f9ee6b4555114fd30022fa6746d',	'127.0.0.1',	1527240192,	'__ci_last_regenerate|i:1527239912;user_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:5:\"James\";login_type|s:19:\"Manager Of Training\";profile_id|s:1:\"3\";view_type|s:7:\"Account\";'),
('c16fc4e2a7d5d2e46f1851346be4f1039e490d28',	'::1',	1527332228,	'__ci_last_regenerate|i:1527332043;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('c5795b3df4558a765e3cc4990c6788512e2b27e7',	'::1',	1527170588,	'__ci_last_regenerate|i:1527170411;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";current_language|s:7:\"swahili\";current_language_changed|b:1;'),
('c625cc3bed8c1a9d358e480a763c8eecd821e874',	'::1',	1526942934,	'__ci_last_regenerate|i:1526942604;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"2\";view_type|s:7:\"Account\";'),
('c688ad3246bb41b14d9e77412f757094c774cf75',	'::1',	1527584517,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";__ci_last_regenerate|i:1527584414;view_type|s:7:\"Surveys\";'),
('c6e5147aeb72e44cca81d81566558e21a46e6d50',	'::1',	1527247326,	'__ci_last_regenerate|i:1527247031;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('c748b144fc3578bcc7d957639f24cc74d60da53c',	'::1',	1526940346,	'__ci_last_regenerate|i:1526940149;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"2\";view_type|s:7:\"Account\";'),
('c8a3449e7707c89000bf15a9c96a88f4c890fe29',	'::1',	1527330461,	'__ci_last_regenerate|i:1527330236;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('c8c0b78d84709295e2a449881dc7c15fccf68a7f',	'::1',	1527242356,	'__ci_last_regenerate|i:1527242087;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('ca5a0df3087facf1f8d35731bfada20294d1975b',	'::1',	1527327202,	'__ci_last_regenerate|i:1527326976;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:8:\"Settings\";'),
('cb80b3b90acdf402bacf7cf197e038fa905d238c',	'::1',	1526934242,	'__ci_last_regenerate|i:1526933941;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"2\";view_type|s:7:\"Account\";'),
('cbeaaba8ff69acbfdc3d82ee7c81a86ccbaf9767',	'::1',	1527239908,	'__ci_last_regenerate|i:1527239775;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('ccf38bdf63cd3b3fbb3ed1f5ef9f7847c8f97ded',	'::1',	1527356775,	'__ci_last_regenerate|i:1527356700;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('ce7b76fef6cf914ad0e3df83a8ca7702b3ee3f82',	'::1',	1527158302,	'__ci_last_regenerate|i:1527158120;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('ceca31cbad8e0ca69646f72d9ea5ebf9de75fcd9',	'::1',	1527595391,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";__ci_last_regenerate|i:1527595096;view_type|s:7:\"Surveys\";'),
('cef24d9b08127f1bee7ad398268b9eb7d51d000e',	'::1',	1527238514,	'__ci_last_regenerate|i:1527237275;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('cef8a6f24213b23601a368aea5f8b9ffd75aa8f0',	'::1',	1527221164,	'__ci_last_regenerate|i:1527221032;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('d0b9ad410adb9b815a528c7df4deaf4ae2e8f03c',	'::1',	1527583857,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";__ci_last_regenerate|i:1527583623;view_type|s:7:\"Surveys\";'),
('d0e07c83e79cf6e977397bf83b1da7cc2a4c8453',	'::1',	1527581554,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";__ci_last_regenerate|i:1527581295;view_type|s:7:\"Surveys\";'),
('d129072ea261951af464ef75b6a7f99c7d9c15b7',	'::1',	1527322463,	'__ci_last_regenerate|i:1527322347;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:9:\"Dashboard\";'),
('d2e1724cd8e21aafe816af1d4467e906f5ff2142',	'::1',	1527172293,	'__ci_last_regenerate|i:1527171902;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";current_language|s:7:\"swahili\";current_language_changed|b:1;'),
('d5090305696b5fca2a038d7672e0e8a9ddeeb940',	'::1',	1526946957,	'__ci_last_regenerate|i:1526946664;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:8:\"Settings\";'),
('d52bb32e49c992f00bf6e2168932826400180779',	'127.0.0.1',	1527598230,	'__ci_last_regenerate|i:1527598230;user_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:5:\"James\";login_type|s:19:\"Manager Of Training\";profile_id|s:1:\"3\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";'),
('d6359d585c9bfcdecfbbd8632b5f43a3c43c988f',	'::1',	1527358421,	'__ci_last_regenerate|i:1527358421;'),
('d77763d8503019d277d57dff559eab7b98c4eab3',	'::1',	1527248973,	'__ci_last_regenerate|i:1527248843;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('d8a3c666257dbce8ba440b5ebe98d182d20af718',	'::1',	1526934543,	'__ci_last_regenerate|i:1526934290;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"2\";view_type|s:7:\"Account\";'),
('d99c1824c5cccfe0456fd8f7ca841f72cd2f2268',	'::1',	1527586915,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";__ci_last_regenerate|i:1527586701;view_type|s:7:\"Surveys\";'),
('d9d66a9b72cc5495996bc39e1ce07f44e28c6ce6',	'::1',	1527226859,	'__ci_last_regenerate|i:1527226648;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('da7b9d6330b2a8e2a6701f2bb755cb7ee4831f88',	'::1',	1527569976,	'__ci_last_regenerate|i:1527569976;'),
('dacd7f83ff8b893334b48ddcdb33a98a71d9cdf6',	'127.0.0.1',	1527593380,	'__ci_last_regenerate|i:1527593135;user_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:5:\"James\";login_type|s:19:\"Manager Of Training\";profile_id|s:1:\"3\";country_id|s:2:\"25\";view_type|s:7:\"Surveys\";flash_message|s:7:\"Success\";__ci_vars|a:1:{s:13:\"flash_message\";s:3:\"old\";}'),
('db053b7c9b076f47426c0dae1bd40c8b79d51a13',	'::1',	1527251114,	'__ci_last_regenerate|i:1527250904;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Account\";'),
('dc468aab01740dc789a910fa9fef3eff217a03cb',	'127.0.0.1',	1527240292,	'__ci_last_regenerate|i:1527240292;user_login|s:1:\"1\";login_user_id|s:1:\"2\";name|s:5:\"James\";login_type|s:19:\"Manager Of Training\";profile_id|s:1:\"3\";view_type|s:7:\"Account\";'),
('dcfc6e4f62e572cb932477855ca9f4971f8ccd2a',	'::1',	1527591292,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";__ci_last_regenerate|i:1527590997;view_type|s:7:\"Surveys\";'),
('ddc11dfc1cd472ab2a5f30693e7b65ebd77f0840',	'::1',	1526945644,	'__ci_last_regenerate|i:1526945345;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"2\";view_type|s:8:\"Settings\";'),
('de98150bff5ffdc26f71619c0dd66e9df22c3ca1',	'::1',	1527332842,	'__ci_last_regenerate|i:1527332674;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('dfc6262153c950516ba2434a11b5351a850c6901',	'::1',	1526971396,	'__ci_last_regenerate|i:1526971396;view_type|s:7:\"Account\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";current_language|s:7:\"english\";current_language_changed|b:1;'),
('e443a84e39d4471c774fd56adcaf39d756263f27',	'::1',	1527355297,	'__ci_last_regenerate|i:1527355096;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('e6fc822f5003a212fc99aa69501131b084b2e9ce',	'::1',	1527594467,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";__ci_last_regenerate|i:1527594171;view_type|s:7:\"Surveys\";'),
('e796da6308954d34cad767975dd8475098210867',	'::1',	1526933548,	'__ci_last_regenerate|i:1526933260;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"2\";view_type|s:7:\"Account\";'),
('e89b4ee025a65ed98a80da754a42e72f2d0c984c',	'::1',	1527527109,	'__ci_last_regenerate|i:1527527096;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('e8ae6aa6b4f9714bd3e9c7de4acc06901f5cffdb',	'::1',	1526936161,	'__ci_last_regenerate|i:1526935821;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"2\";view_type|s:7:\"Account\";'),
('e9d149d90d950d899a1c9e1efc9d2863a65512b7',	'::1',	1526971724,	'__ci_last_regenerate|i:1526971724;view_type|s:7:\"Account\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";current_language|s:7:\"english\";current_language_changed|b:1;'),
('ea942ccf7e29478d0fe4fec0056bc258c364d9e9',	'::1',	1527593760,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";__ci_last_regenerate|i:1527593668;view_type|s:7:\"Surveys\";'),
('eae212d6c06db6c0ac049f0fe2e5f4af2fa87817',	'::1',	1526938523,	'__ci_last_regenerate|i:1526938174;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"2\";view_type|s:7:\"Account\";'),
('eb370c915556ca8f520570fdef79ae51a3cb5be9',	'::1',	1526945312,	'__ci_last_regenerate|i:1526944977;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"2\";view_type|s:7:\"Account\";'),
('ebdbcf5ef339ac6a3edb60a8322a4c2948cb11f4',	'::1',	1527579759,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";__ci_last_regenerate|i:1527579583;view_type|s:7:\"Surveys\";'),
('ece5ebd1b291e3fc563b7d6a499d4681116fd4a8',	'::1',	1527335011,	'__ci_last_regenerate|i:1527334871;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('edceee8a865b4d08b3646dc053a7125828893d86',	'::1',	1527218012,	'__ci_last_regenerate|i:1527217748;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('edd09fef6baea970867ee0b8e96d9cac1fb336d3',	'::1',	1526944518,	'__ci_last_regenerate|i:1526944236;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"2\";view_type|s:7:\"Account\";'),
('eef5a0088d76609e85b79e9d8b18afc37c3f6133',	'::1',	1526933160,	'__ci_last_regenerate|i:1526932952;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"2\";view_type|s:7:\"Account\";'),
('f128508c1e85fc72108a39b310e66143db4227c3',	'::1',	1527356401,	'__ci_last_regenerate|i:1527356341;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('f16d8cd391d1e9601e35b105178daec3312e0985',	'::1',	1527597757,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";__ci_last_regenerate|i:1527597466;view_type|s:7:\"Surveys\";'),
('f2f9071ecef6f4bbca82e8ddca7ea2859c1d2dd0',	'::1',	1527342668,	'__ci_last_regenerate|i:1527342466;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Surveys\";'),
('f3897a6cf68e1446733a8718af52619eadef8608',	'::1',	1527173416,	'__ci_last_regenerate|i:1527173136;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";current_language|s:7:\"swahili\";current_language_changed|b:1;'),
('f42be00beee048743a024d8880a98349a7e9f0fe',	'::1',	1527243699,	'__ci_last_regenerate|i:1527243575;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('f587a0ea07c8ba8a2a7e23cbf9edfca1c947284f',	'::1',	1527221752,	'__ci_last_regenerate|i:1527221487;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('f7065fa280739b82edff030cb0dd80ce33f71f3a',	'::1',	1526947143,	'__ci_last_regenerate|i:1526946971;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:8:\"Settings\";'),
('f80103bef88322cd64b9ed0e5294dd0c677f2212',	'::1',	1527251495,	'__ci_last_regenerate|i:1527251248;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";view_type|s:7:\"Account\";'),
('f863952d21954293f32170c508b888cb1467808d',	'::1',	1527226617,	'__ci_last_regenerate|i:1527226228;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('f948f6701e408fdfd65756dffcc17ebfb46e1e70',	'::1',	1527158082,	'__ci_last_regenerate|i:1527157668;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";'),
('f9dc1f599cac0a6ddef97d908bffc99909b943cc',	'::1',	1527579261,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";__ci_last_regenerate|i:1527578972;view_type|s:7:\"Surveys\";'),
('faf99f3ee76d5aff5b3248de65e038712b715690',	'::1',	1527585988,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";country_id|s:2:\"28\";__ci_last_regenerate|i:1527585988;view_type|s:7:\"Surveys\";'),
('fdee291ef3c367c5362fd4c55742783fb9ab23c2',	'::1',	1527224106,	'__ci_last_regenerate|i:1527223780;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";login_type|s:15:\"Program Trainer\";profile_id|s:1:\"7\";view_type|s:7:\"Account\";');

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
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `country` (`country_id`, `name`) VALUES
(1,	'All'),
(25,	'Kenya'),
(26,	'Uganda'),
(27,	'Rwanda'),
(28,	'Tanzania'),
(29,	'Togo'),
(30,	'Ethiopia'),
(31,	'Ghana'),
(33,	'Burkina Faso');

DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `department_id` int(50) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `department` (`department_id`, `name`) VALUES
(1,	'Program Support'),
(2,	'Partnership'),
(4,	'Risk Management'),
(5,	'IT'),
(6,	'Business Services');

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
(38,	'delete_survey',	35);

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
(1,	'Business Engagement',	'How does the staff portrays diligence in the following business parameters?',	1,	'2018-05-26 13:30:50',	'2018-05-26 10:30:50',	1,	1),
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
(225,	'you_have_already_participated_in_voting',	'',	'',	'',	NULL);

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
(4,	8,	1,	0,	'2018-05-29 12:57:38',	1,	1,	'2018-05-29 11:10:41'),
(5,	8,	2,	0,	'2018-05-29 01:29:40',	2,	2,	'2018-05-29 11:29:40');

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(50) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `contribution` tinyint(4) NOT NULL,
  `department_id` int(100) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `role` (`role_id`, `name`, `contribution`, `department_id`) VALUES
(1,	'Program Trainer',	1,	0),
(2,	'Program Support Specialist',	1,	0),
(3,	'Partnership Facilitator',	1,	0),
(4,	'Manager Of Training',	2,	0),
(6,	'Partnership Preparation Specialist',	1,	2),
(8,	'ITS',	1,	5);

DROP TABLE IF EXISTS `scope`;
CREATE TABLE `scope` (
  `scope_id` int(100) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `two_way` tinyint(4) NOT NULL COMMENT '1=yes (Can nominate and be nominated by other FOs),0=no (User can only nominate other FOs)',
  `strict` tinyint(4) NOT NULL COMMENT '0=all departments,1=only user department',
  `type` varchar(10) NOT NULL COMMENT 'admin,vote,both',
  PRIMARY KEY (`scope_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `scope` (`scope_id`, `user_id`, `two_way`, `strict`, `type`) VALUES
(1,	1,	1,	0,	'admin'),
(4,	3,	1,	1,	'admin');

DROP TABLE IF EXISTS `scope_country`;
CREATE TABLE `scope_country` (
  `scope_country_id` int(100) NOT NULL AUTO_INCREMENT,
  `scope_id` tinyint(4) NOT NULL,
  `country_id` tinyint(4) NOT NULL,
  PRIMARY KEY (`scope_country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `scope_country` (`scope_country_id`, `scope_id`, `country_id`) VALUES
(26,	4,	26),
(27,	4,	33),
(61,	1,	26),
(62,	1,	27),
(63,	1,	29),
(64,	1,	31);

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
  `country_id` int(100) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_by` int(100) NOT NULL,
  `created_date` date NOT NULL,
  `last_modified_by` int(100) NOT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`survey_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `survey` (`survey_id`, `start_date`, `end_date`, `country_id`, `status`, `created_by`, `created_date`, `last_modified_by`, `last_modified_date`) VALUES
(8,	'2018-05-29 00:00:00',	'2018-05-31 00:00:00',	1,	1,	1,	'2018-05-29',	1,	'2018-05-29 10:51:42');

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
(5,	'Tendering Team',	27,	'Testing'),
(6,	'Sports',	28,	'For events planning'),
(7,	'Talent Developemt',	28,	'For beneficiary talents'),
(8,	'POYA',	28,	'ICP Wards');

DROP TABLE IF EXISTS `teamset`;
CREATE TABLE `teamset` (
  `teamset_id` int(100) NOT NULL AUTO_INCREMENT,
  `user_id` int(50) NOT NULL,
  `team_id` int(50) NOT NULL,
  PRIMARY KEY (`teamset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `teamset` (`teamset_id`, `user_id`, `team_id`) VALUES
(1,	1,	1),
(2,	1,	2),
(3,	2,	2);

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
  `role_id` tinyint(10) NOT NULL,
  `profile_id` tinyint(5) NOT NULL,
  `auth` tinyint(5) NOT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `user` (`user_id`, `firstname`, `lastname`, `email`, `password`, `gender`, `phone`, `role_id`, `profile_id`, `auth`, `country_id`) VALUES
(1,	'Nicodemus',	'Karisa Mwambire',	'NKarisa@ke.ci.org',	'956d2d5467ed373328ee2d165a51c399',	'male',	'254711808071',	1,	7,	1,	28),
(2,	'James',	'Mulandi',	'JMulandi@ke.ci.org',	'956d2d5467ed373328ee2d165a51c399',	'male',	'254720648480',	4,	3,	1,	25),
(3,	'Ann',	'Kakenya',	'AKakenya@ke.ci.org',	'956d2d5467ed373328ee2d165a51c399',	'female',	'445544566',	3,	8,	1,	25),
(4,	'Joyce ',	'Cherono',	'JCherono@ke.ci.org',	'f6f4a1b',	'female',	'2547889827',	2,	4,	1,	27),
(6,	'Charles',	'Rukia',	'CRukia@ug.ci.org',	'abc6aa8',	'male',	'7667894745',	2,	4,	1,	26),
(7,	'Victor',	'Wanyama',	'VWanyama@rw.ci.org',	'233b448',	'male',	'8654656337',	1,	4,	0,	27),
(8,	'Betty',	'Kanze',	'BYeri@ke.ci.org',	'bfd4e50',	'female',	'254767847663',	1,	4,	1,	30),
(9,	'Evans',	'Macharia',	'EMacharia@ke.ci.org',	'172f730',	'male',	'8777688976',	1,	4,	1,	25),
(10,	'Patricia',	'Mghendi',	'EMghendi@ke.ci.org',	'15d9570',	'female',	'9782845675',	8,	4,	1,	28),
(11,	'Velma',	'Odhiambo',	'VOdhiambo@ke.ci.org',	'135ec68',	'female',	'88756785',	3,	4,	1,	25);

-- 2018-05-29 12:54:53
