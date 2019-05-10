-- Adminer 4.6.3 MySQL dump

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
  KEY `privilege_id` (`entitlement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `access` (`access_id`, `entitlement_id`, `profile_id`) VALUES
(1,	16,	8),
(2,	32,	8),
(3,	33,	8),
(4,	35,	8),
(5,	45,	8),
(6,	46,	8),
(7,	56,	8),
(8,	2,	1),
(9,	5,	1),
(10,	9,	7),
(11,	10,	7),
(12,	12,	7),
(13,	13,	7),
(14,	14,	7),
(15,	15,	7),
(16,	16,	7),
(17,	17,	7),
(18,	18,	7),
(19,	19,	7),
(20,	20,	7),
(21,	21,	7),
(22,	23,	7),
(23,	24,	7),
(24,	25,	7),
(25,	26,	7),
(26,	27,	7),
(27,	28,	7),
(28,	29,	7),
(29,	30,	7),
(30,	31,	7),
(31,	32,	7),
(32,	33,	7),
(33,	34,	7),
(34,	35,	7),
(35,	36,	7),
(36,	37,	7),
(37,	38,	7),
(38,	39,	7),
(39,	40,	7),
(40,	41,	7),
(41,	42,	7),
(42,	43,	7),
(43,	44,	7),
(44,	45,	7),
(45,	46,	7),
(46,	47,	7),
(47,	48,	7),
(48,	49,	7),
(49,	50,	7),
(50,	51,	7),
(51,	52,	7),
(52,	53,	7),
(53,	54,	7),
(54,	55,	7),
(55,	56,	7),
(56,	57,	7),
(57,	3,	7),
(58,	4,	7),
(59,	5,	7),
(60,	6,	7),
(61,	7,	7),
(62,	8,	7),
(65,	2,	2),
(66,	4,	2),
(68,	12,	2),
(70,	16,	2),
(96,	1,	3),
(97,	6,	3),
(98,	23,	3),
(751,	1,	7),
(752,	2,	7),
(831,	60,	7),
(832,	32,	2),
(834,	35,	2),
(835,	45,	2),
(836,	46,	2),
(837,	56,	2),
(838,	60,	4),
(839,	60,	4),
(840,	60,	8),
(841,	60,	2),
(842,	60,	3),
(843,	60,	7),
(844,	12,	8);

DROP TABLE IF EXISTS `assign_profile`;
CREATE TABLE `assign_profile` (
  `assign_profile_id` int(100) NOT NULL AUTO_INCREMENT,
  `user_id` int(100) NOT NULL,
  `profile_id` int(100) NOT NULL,
  PRIMARY KEY (`assign_profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `assign_profile` (`assign_profile_id`, `user_id`, `profile_id`) VALUES
(1,	152,	7);

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `grouping_id` int(100) NOT NULL,
  `visibility` int(100) NOT NULL COMMENT '1=all countries, country_ids',
  `assignment` varchar(20) NOT NULL COMMENT 'Who is the voter? 2=>manager,1=>peer',
  `unit` tinyint(4) NOT NULL COMMENT 'Who will be voted? Department, Staff, Team',
  `status` tinyint(4) NOT NULL COMMENT '0=inactive,1=active',
  `created_date` datetime NOT NULL,
  `created_by` int(100) NOT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_by` int(100) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `category` (`category_id`, `name`, `description`, `grouping_id`, `visibility`, `assignment`, `unit`, `status`, `created_date`, `created_by`, `last_modified_date`, `last_modified_by`) VALUES
(1,	'Demonstration of Compassion Cultural Behaviors',	'Demonstration of Compassion Cultural Behaviors\r\n',	1,	1,	'1',	4,	1,	'2018-07-17 11:09:07',	152,	'2018-07-17 11:09:07',	152),
(2,	'Innovative initiative',	'The employee has come up with creative idea that has been adopted and has led to efficiency and effectiveness not only to their role but to the team, department, organization, region or globally',	1,	1,	'1',	4,	1,	'2018-07-17 11:09:32',	152,	'2018-10-18 11:55:19',	152),
(3,	'Demonstration of excellent  leadership skills',	'The Employee’s Leadership is consistently characterized by exceptional Leadership skills that Inspires a shared vision and empowers staff to connect their role(s) to the strategic priorities and is recognized as an exemplary role model by other staff in the office.',	1,	1,	'1',	4,	1,	'2018-07-17 11:09:59',	152,	'2018-10-18 11:55:19',	152),
(4,	'Excellent service to children and partners',	'The employee consistently goes an extra mile in ensuring customer experience in a timely and a pleasant manner',	1,	1,	'1',	4,	1,	'2018-07-17 11:10:22',	152,	'2018-10-18 12:21:15',	152),
(5,	'Excellent performance (in KRI or a project)',	'The employee’s performance is consistently characterized by exceptionally high-quality work. This employee far exceeds all job responsibilities, business results and behavioral standards.',	2,	1,	'2',	4,	1,	'2018-07-17 11:10:58',	152,	'2018-10-18 11:55:19',	152),
(7,	'Demonstration of excellent  leadership skills',	'The Employee’s Leadership is consistently characterized by exceptional Leadership skills that Inspires a shared vision and empowers staff to connect their role(s) to the strategic priorities and is recognized as an exemplary role model by other staff in the office.',	2,	1,	'2',	4,	1,	'2018-07-17 11:12:00',	152,	'2018-10-18 11:55:19',	152),
(9,	'Demonstration of Compassion Cultural Behaviors',	'Demonstration of Compassion Cultural Behaviors\r\n',	3,	1,	'1',	3,	1,	'2018-07-17 11:09:07',	152,	'2018-09-06 09:25:14',	152),
(10,	'Innovative initiative',	'The employee has come up with creative idea that has been adopted and has led to efficiency and effectiveness not only to their role but to the team, department, organization, region or globally',	3,	1,	'1',	3,	1,	'2018-07-17 11:09:32',	152,	'2018-10-18 11:55:19',	152),
(11,	'Demonstration of excellent  leadership skills.',	'The Employee’s Leadership is consistently characterized by exceptional Leadership skills that Inspires a shared vision and empowers staff to connect their role(s) to the strategic priorities and is recognized as an exemplary role model by other staff in the office.',	3,	1,	'1',	3,	1,	'2018-07-17 11:09:59',	152,	'2019-04-29 09:42:47',	152),
(12,	'Excellent service to children and partners',	'The employee consistently goes an extra mile in ensuring customer experience in a timely and a pleasant manner',	3,	1,	'1',	3,	1,	'2018-07-17 11:10:22',	152,	'2018-10-18 12:21:15',	152),
(16,	'Demonstration of Compassion Cultural Behaviors',	'Demonstration of Compassion Cultural Behaviors\r\n',	4,	1,	'1',	2,	1,	'2018-07-17 11:09:07',	152,	'2018-09-06 09:25:33',	152),
(17,	'Innovative initiative',	'The employee has come up with creative idea that has been adopted and has led to efficiency and effectiveness not only to their role but to the team, department, organization, region or globally',	4,	1,	'1',	2,	1,	'2018-07-17 11:09:32',	152,	'2018-10-18 11:55:19',	152),
(18,	'Demonstration of excellent  leadership skills',	'The Employee’s Leadership is consistently characterized by exceptional Leadership skills that Inspires a shared vision and empowers staff to connect their role(s) to the strategic priorities and is recognized as an exemplary role model by other staff in the office.',	4,	1,	'1',	2,	1,	'2018-07-17 11:09:59',	152,	'2018-10-18 11:55:19',	152),
(19,	'Excellent service to children and partners',	'The employee consistently goes an extra mile in ensuring customer experience in a timely and a pleasant manner',	4,	1,	'1',	2,	1,	'2018-07-17 11:10:22',	152,	'2018-10-18 12:21:15',	152),
(24,	'Health and Wellness',	'Health and Wellness',	1,	25,	'1',	4,	1,	'2018-09-12 11:58:26',	425,	'2018-09-12 11:58:26',	425),
(50,	'Demonstration of excellent  leadership skills.',	'The Employee’s Leadership is consistently characterized by exceptional Leadership skills that Inspires a shared vision and empowers staff to connect their role(s) to the strategic priorities and is recognized as an exemplary role model by other staff in the office.',	3,	1,	'2',	4,	1,	'2018-07-17 11:12:00',	152,	'2019-05-02 07:12:38',	152),
(52,	'Demonstration of Compassion Cultural Behaviors',	'Demonstration of Compassion Cultural Behaviors\r\n',	3,	1,	'1',	3,	0,	'2018-07-17 11:09:07',	152,	'2018-11-27 08:15:20',	152),
(54,	'Demonstration of Compassion Cultural Behaviors',	'Demonstration of Compassion Cultural Behaviors\r\n',	3,	1,	'1',	2,	0,	'2018-07-17 11:09:07',	152,	'2018-11-27 08:15:20',	152),
(66,	'Self-motivation',	'This staff demonstrate a high degree of self motivation by doing or achieving something because of one\'s own enthusiasm or interest, without needing pressure from others. This person is always ready to extra mile in whatever they and ready to support others.',	1,	28,	'1',	4,	1,	'2018-10-25 08:41:48',	600,	'2018-10-25 08:41:48',	600),
(68,	'Teamwork',	'This team demonstrate high degree of working collaboratively with each other as one in order to achieve business goal. As it is often necessary for colleagues to work well together, trying their best in any circumstance and cooperate, using their individual skills and providing constructive feedback, despite any personal conflict between individuals. This is vivid in the this team.\n\n',	3,	28,	'1',	3,	1,	'2018-10-25 08:46:58',	600,	'2018-10-25 08:46:58',	600),
(69,	'UK Initiative Workforce',	'Has worked on assignment to have UK sponsored waterborhole drilling in Haho',	3,	29,	'1',	3,	1,	'2018-12-18 03:00:29',	517,	'2018-12-18 15:00:29',	517),
(70,	'CIV AWASH Team ',	'WASH Initiative developed and funded for 21 FCPs with UK board successful visit',	3,	29,	'1',	3,	1,	'2018-12-29 03:35:56',	517,	'2018-12-29 15:35:56',	517);

DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE `ci_sessions` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


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
(1,	'All',	'0000-00-00 00:00:00',	0,	0,	'2018-05-31 07:38:14'),
(25,	'Kenya',	'0000-00-00 00:00:00',	0,	0,	'2018-05-31 07:38:14'),
(26,	'Uganda',	'0000-00-00 00:00:00',	0,	0,	'2018-05-31 07:38:14'),
(27,	'Rwanda',	'0000-00-00 00:00:00',	0,	0,	'2018-06-13 15:17:10'),
(28,	'Tanzania',	'0000-00-00 00:00:00',	0,	0,	'2018-05-31 07:38:14'),
(29,	'Togo',	'0000-00-00 00:00:00',	0,	0,	'2018-05-31 07:38:14'),
(30,	'Ethiopia',	'0000-00-00 00:00:00',	0,	0,	'2018-05-31 07:38:14'),
(31,	'Ghana',	'0000-00-00 00:00:00',	0,	0,	'2018-05-31 07:38:14'),
(33,	'Burkina Faso',	'0000-00-00 00:00:00',	0,	0,	'2018-05-31 07:38:14');

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
(1,	'Finance\r',	0,	'0000-00-00 00:00:00',	0,	'2018-06-13 04:58:43'),
(2,	'Business\r',	0,	'0000-00-00 00:00:00',	0,	'2018-06-13 04:58:43'),
(3,	'GTS',	0,	'0000-00-00 00:00:00',	0,	'2018-06-13 15:22:35'),
(4,	'Risk\r',	0,	'0000-00-00 00:00:00',	0,	'2018-06-13 04:58:43'),
(5,	'Program Support\r',	0,	'0000-00-00 00:00:00',	0,	'2018-06-13 04:58:43'),
(6,	'HR\r',	0,	'0000-00-00 00:00:00',	0,	'2018-06-13 04:58:43'),
(7,	'Supporter Experiences\r',	0,	'0000-00-00 00:00:00',	0,	'2018-06-13 04:58:43'),
(8,	'Partnership\r',	0,	'0000-00-00 00:00:00',	0,	'2018-06-13 04:58:43'),
(9,	'Global Program',	0,	'0000-00-00 00:00:00',	0,	'2019-05-09 08:36:05');

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
(36,	'add_survey',	10),
(37,	'edit_survey',	10),
(38,	'delete_survey',	10),
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
(64,	'uncast_votes',	59),
(65,	'survey_status',	10);

DROP TABLE IF EXISTS `grouping`;
CREATE TABLE `grouping` (
  `grouping_id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `status` tinyint(4) NOT NULL,
  `fa-icon` varchar(20) NOT NULL DEFAULT 'users',
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(100) NOT NULL,
  `last_modified_by` int(100) NOT NULL,
  PRIMARY KEY (`grouping_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `grouping` (`grouping_id`, `name`, `description`, `status`, `fa-icon`, `created_date`, `last_modified`, `created_by`, `last_modified_by`) VALUES
(1,	'Staff Recognition Categories ',	'<p>\r\n	Peer Recognition Categories</p>\r\n',	1,	'user',	'2019-02-20 21:19:37',	'2019-02-20 18:19:37',	0,	0),
(2,	'Managers Recognition Categories',	'<p>\r\n	Managers Recognition Categories</p>\r\n',	1,	'black-tie',	'2019-02-20 21:23:39',	'2019-02-20 18:23:39',	0,	0),
(3,	'Special Teams Recognition Categories',	'<p>\r\n	Peer Recognition Categories</p>\r\n',	1,	'users',	'2019-02-22 12:18:59',	'2019-02-22 09:18:59',	0,	0),
(4,	'Functional Team Recognition Categories',	'<p>\r\n	Peer Recognition Categories</p>\r\n',	1,	'home',	'2019-02-22 12:18:51',	'2019-02-22 09:18:51',	0,	0);

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


DROP TABLE IF EXISTS `notify_cron`;
CREATE TABLE `notify_cron` (
  `notify_cron_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(100) NOT NULL,
  `days_to_closure` int(5) NOT NULL,
  `notify_based_on_vote_not_submitted` int(5) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`notify_cron_id`),
  KEY `template_id` (`template_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `notify_cron` (`notify_cron_id`, `template_id`, `days_to_closure`, `notify_based_on_vote_not_submitted`, `status`) VALUES
(1,	5,	7,	0,	1),
(2,	11,	7,	1,	1),
(3,	5,	3,	0,	1),
(4,	11,	3,	1,	1),
(5,	5,	1,	0,	1),
(6,	11,	1,	1,	1);

DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile` (
  `profile_id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `assignable` tinyint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `profile` (`profile_id`, `name`, `description`, `assignable`) VALUES
(2,	'Country HRBP',	'<p>\r\n	These are country specific administrators that are able to:</p>\r\n<div style=\"margin-left:.31in;\">\r\n	- View Nomination Results for a Country</div>\r\n<div style=\"margin-left:.31in;\">\r\n	- View Votes Cast for a country</div>\r\n<div style=\"margin-left:.31in;\">\r\n	- Add Country Specific Categories</div>\r\n<div style=\"margin-left:.31in;\">\r\n	- Manage Country Users - Add and Edit Users Except Scope Changes</div>\r\n<div style=\"margin-left:.31in;\">\r\n	- Managing Country Team</div>\r\n<div style=\"margin-left:.31in;\">\r\n	- Suspend Users</div>\r\n<div style=\"margin-left:.31in;\">\r\n	- View Countries, Departments and All Teams</div>\r\n<div style=\"margin-left:.31in;\">\r\n	- Manage Country Votes</div>\r\n<p>\r\n	&nbsp;</p>\r\n',	0),
(3,	'Manager',	'',	1),
(4,	'Staff',	'',	1),
(7,	'Super Admin',	'<p>\r\n	Has all privileges</p>\r\n',	0),
(8,	'HRBP',	'<p>\r\n	Human Resource Staff</p>\r\n',	0);

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(50) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `contribution` int(100) NOT NULL,
  `department_id` int(50) NOT NULL,
  `vote_all_in_user_scope` int(100) NOT NULL DEFAULT '1' COMMENT '1 = no, 2 = yes: Allows user with this role to vote all staff in their scope if 2',
  `last_line_manager` int(100) NOT NULL DEFAULT '1' COMMENT '1= no, 2 = yes: 2 indicates that in the manager hierarchy is the last',
  `is_bt_role` int(5) NOT NULL DEFAULT '1' COMMENT '1=no, 2=yes: 2 means it is a transnational role, whereas 1 is national office',
  `created_date` datetime NOT NULL,
  `created_by` int(100) NOT NULL,
  `last_modified_by` int(100) NOT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`role_id`),
  KEY `department_id` (`department_id`),
  KEY `contribution` (`contribution`),
  CONSTRAINT `role_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`),
  CONSTRAINT `role_ibfk_2` FOREIGN KEY (`contribution`) REFERENCES `contribution` (`contribution_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `role` (`role_id`, `name`, `contribution`, `department_id`, `vote_all_in_user_scope`, `last_line_manager`, `is_bt_role`, `created_date`, `created_by`, `last_modified_by`, `last_modified_date`) VALUES
(1,	'Accountant',	1,	1,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(2,	'Admin Assistant',	1,	2,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(3,	'App Support Spec',	1,	3,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(4,	'Assistant General Counsel',	1,	4,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(5,	'Auditor',	1,	4,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(6,	'Bus Analyst',	1,	2,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(7,	'Child Protection Spec',	1,	5,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(8,	'Developer',	1,	3,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(9,	'Dir Finance',	2,	1,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(10,	'Dir HR',	2,	6,	1,	1,	2,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 09:27:56'),
(11,	'Dir IT Support',	2,	3,	1,	1,	2,	'0000-00-00 00:00:00',	0,	0,	'2019-05-10 14:33:52'),
(12,	'Dir Prgm Support',	2,	5,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(13,	'Driver',	1,	2,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(14,	'Facilities Tech',	1,	2,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(15,	'Hospitality Assoc',	1,	2,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(16,	'HRBP',	1,	6,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(17,	'IT Support Spec',	1,	3,	1,	1,	2,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 08:54:22'),
(18,	'Learning & Dev Spec',	1,	5,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(19,	'Mgr Audit',	2,	4,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(20,	'Mgr IT Support',	2,	3,	1,	2,	2,	'0000-00-00 00:00:00',	0,	0,	'2019-05-10 14:33:11'),
(21,	'Mgr Learning & Dev',	2,	5,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(22,	'Mgr Media Content',	2,	7,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(23,	'Mgr Partnership',	2,	8,	1,	2,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 11:40:13'),
(24,	'Mgr Prgm Support',	2,	5,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(25,	'Mgr Prgm Training',	2,	5,	1,	2,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 08:08:05'),
(26,	'Mgr Supporter Engagmt',	2,	7,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(27,	'Monitoring & Eval Spec',	1,	5,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(28,	'National Dir',	2,	5,	2,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:57:41'),
(29,	'Partnership Facilitat',	1,	8,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(30,	'Partnership Prep Spec',	1,	8,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(31,	'Photojournalist',	1,	7,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(32,	'Prgm Support Spec',	1,	5,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(33,	'Prgm Trainer',	1,	5,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(34,	'Prog Eff Resrch Spec',	1,	5,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(35,	'Public Relations Spec',	1,	2,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(36,	'Receptionist',	1,	2,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(37,	'SDS Assoc',	1,	7,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(38,	'Sr Accountant',	1,	1,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(39,	'Sr Accounting Assoc',	1,	1,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(40,	'Sr Admin Assistant',	1,	2,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(41,	'Sr Dir Regional Prgm',	2,	5,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(42,	'Sr HRBP',	2,	6,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(43,	'Sr IT Support Spec',	1,	3,	1,	1,	2,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 08:55:00'),
(44,	'Sr Leadership Dev Spec',	1,	5,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(45,	'Sr Mgr Accounting',	2,	1,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(46,	'Sr Mgr Bus Support',	2,	2,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(47,	'Sr Mgr Partnership',	2,	8,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(48,	'Sr Mgr Prgm Support',	2,	5,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(49,	'Sr Partnership Facilitat',	1,	8,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(50,	'Sr Prgm Support Spec',	1,	9,	1,	1,	2,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 09:14:39'),
(51,	'Sr SDS Assoc',	1,	7,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(52,	'Sr Tours & Visits Spec',	1,	7,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(53,	'Supv Audit',	2,	4,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(54,	'Supv Bus Support',	2,	2,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(55,	'Supv SDS',	2,	7,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(56,	'Systems Admin',	1,	3,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(57,	'Tours & Visits Spec',	1,	7,	1,	1,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:54:34'),
(58,	'Test Role',	2,	6,	1,	2,	1,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 04:59:48'),
(61,	'Test transitional role',	2,	6,	1,	2,	2,	'0000-00-00 00:00:00',	0,	0,	'2019-05-09 11:52:21'),
(62,	'Mgr HR',	2,	6,	1,	1,	2,	'0000-00-00 00:00:00',	0,	0,	'2019-05-10 09:52:47');

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
(7,	'system_email',	'support@compassionkenya.com'),
(8,	'active_sms_service',	'disabled'),
(9,	'language',	'english'),
(10,	'text_align',	'left-to-right'),
(11,	'clickatell_user',	''),
(12,	'clickatell_password',	''),
(13,	'clickatell_api_id',	''),
(14,	'skin_colour',	'blue'),
(15,	'twilio_account_sid',	''),
(16,	'twilio_auth_token',	''),
(17,	'twilio_sender_phone_number',	'');

DROP TABLE IF EXISTS `template`;
CREATE TABLE `template` (
  `template_id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `template_trigger` varchar(50) NOT NULL,
  `mail_tags` mediumtext NOT NULL,
  `template_subject` varchar(100) NOT NULL,
  `template_body` longtext NOT NULL,
  `run_as_scheduled` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `template` (`template_id`, `name`, `template_trigger`, `mail_tags`, `template_subject`, `template_body`, `run_as_scheduled`) VALUES
(1,	'User Registration',	'user_invite',	'{user} = User\'s First and Last Name,\r\n{system_name} = System Name,\r\n{user_email} = User\'s Email,\r\n{user_password} = User\'s Password,\r\n{user_role} = User\'s role,\r\n{user_profile} = User\'s Profile,\r\n{site_url} = Site URL,\r\n{system_admin_email} = Country Admin Email\r\n\r\n ',	'User Registration',	'<p>\n	Dear {user}</p>\n<p>\n	Your account has successfully been created . Below are your updated account details:</p>\n<p>\n	Login Email: {user_email}</p>\n<p>\n	Password: {user_password}</p>\n<p>\n	Your Role: {user_role}</p>\n<p>\n	Profile: {user_profile}</p>\n<p>\n	Scope: {system_user_scope}</p>\n<p>\n	Team: {user_team}</p>\n<p>\n	Department: {user_department}</p>\n<p>\n	Account Status: {user_status}</p>\n<p>\n	You can proceed logging in at {site_url}. For information contact the administrator at {system_admin_email}&nbsp;or your HRBP in your country.</p>\n<p>\n	&nbsp;</p>\n<p>\n	Regards,</p>\n<p>\n	System Administrator&nbsp; &nbsp;</p>\n',	0),
(2,	'Password Reset',	'password_reset',	'{user} = User\'s First and Last Name,\r\n{system_name} = System Name,\r\n{user_email} = User\'s Email,\r\n{user_password} = User\'s Password,\r\n{user_role} = User\'s role,\r\n{user_profile} = User\'s Profile,\r\n{site_url} = Site URL,\r\n{system_admin_email} = Country Admin Email\r\n{system_user_scope} = User Scope\r\n{user_team} = User Team\r\n{user_department} = User Department\r\n{user_status} = User Status\r\n{user_role} = User role\r\n ',	'Welcome {user}',	'<p>\n	Dear {user}</p>\n<p>\n	Your password has successfully been reset in the {system_name}. Below are your new account details:</p>\n<p>\n	Login Email: {user_email}</p>\n<p>\n	Password: {user_password}</p>\n<p>\n	Account Status: {user_status}</p>\n<p>\n	You can proceed logging in at {site_url}. For information contact the administrator at {system_admin_email}&nbsp;or your HRBP in your country.</p>\n<p>\n	&nbsp;</p>\n<p>\n	Regards,</p>\n<p>\n	System Administrator&nbsp; &nbsp;</p>\n',	0),
(3,	'Survey Invitation',	'survey_invite',	'{user} = User\'s First and Last Name,\n{site_url} = Site URL,\n{system_admin_email} = Country Admin Email,\n{survey_start_date} = Nomination start date,\n{survey_end_date} = Nomination end date',	'Invitation for Participation',	'<p>\n	Dear {user}</p>\n<p>\n	You are invited to participate in the process of nomination Compassion&#39;s most outstanding staff of the year.&nbsp;</p>\n<p>\n	To participate you will be required to log in to the AFR staff recognition system via {site_url}.&nbsp;</p>\n<p>\n	The nomination activity commences on {survey_start_date} to {survey_end_date}.</p>\n\n<p>\n	Please interact with the system help documentation to have a good feel on how the system works before voting.</p>\n<p>\n	Incase you have any challage feel free to contact the system administrator at {system_admin_email} or your HRBP.</p>\n<p>\n	&nbsp;</p>\n<p>\n	Regards,</p>\n<p>\n	&nbsp;</p>\n<p>\n	System Administrator</p>\n<p>\n	&nbsp;</p>\n',	0),
(4,	'Survey Closure',	'survey_closure',	'{user} = User\'s First and Last Name,\r\n{system_admin_email} = Country Admin Email,\r\n{survey_start_date} = Nomination start date,\r\n{survey_end_date} = Nomination end date',	'Nomination Closure ',	'<p>\r\n	Dear {user}</p>\r\n<p>\r\n	We are happy to notify you that the nomination for the period between&nbsp;{survey_start_date} to {survey_end_date} has come to and end.</p>\r\n<p>\r\n	We are very grateful for your participation in making this effort a success.&nbsp;</p>\r\n<p>\r\n	You feedback will be used in recognising our staff who have tremendously shown their deligency in their service to the ministry to children.</p>\r\n<p>\r\n	For any query, feel free to contact the system administrator at {system_admin_email} or your HRBP.</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	Regards,</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	System Administrator</p>\r\n<p>\r\n	&nbsp;</p>\r\n',	1),
(5,	'Survey  Closure Due',	'survey_closure_due',	'{user} = User\'s First and Last Name,\r\n{system_admin_email} = Country Admin Email,\r\n{survey_start_date} = Nomination start date,\r\n{survey_end_date} = Nomination end date',	'Nomination Closure Due',	'<p>\r\n	Dear {user}</p>\r\n<p>\r\n	We have {days_to_go} days remaining to the closure of the nomination exercise that was to run between {survey_start_date} to {survey_end_date}.</p>\r\n<p>\r\n	We are very grateful for your participation in making this effort a success.&nbsp;</p>\r\n<p>\r\n	In case you have not submitted your nomination, we&#39;d like to request you to spare some time of doing so before {survey_end_date}.</p>\r\n<p>\r\n	For any query, feel free to contact the system administrator at {system_admin_email} or your HRBP.</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	Regards,</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	System Administrator</p>\r\n<p>\r\n	&nbsp;</p>\r\n',	1),
(6,	'Vote Deletion',	'vote_deletion',	'{user} = User\'s First and Last Name,\r\n{system_admin_email} = Country Admin Email,\r\n',	'Vote Deletion',	'<p>\n	Dear {user}</p>\n<p>\n	We wish to inform you that your request to delete your vote has been effected.&nbsp; &nbsp;</p>\n<p>\n	In case this is an error, feel free contact the system administrator at {system_admin_email} or your HRBP in your country.&nbsp;</p>\n<p>\n	&nbsp;</p>\n<p>\n	Regards,</p>\n<p>\n	System Administrator</p>\n<p>\n	&nbsp;</p>\n',	0),
(7,	'Vote Activation',	'vote_activation',	'{user} = User\'s First and Last Name,\r\n{system_admin_email} = Country Admin Email,\r\n',	'Vote Activation',	'<p>\n	Dear {user}</p>\n<p>\n	We wish to inform you that your request to activate your vote has been effected.&nbsp; &nbsp;</p>\n<p>\n	In case this is an error, feel free contact the system administrator at {system_admin_emal} or your HRBP in your country.&nbsp;</p>\n<p>\n	&nbsp;</p>\n<p>\n	Regards,</p>\n<p>\n	System Administrator</p>\n<p>\n	&nbsp;</p>\n',	0),
(8,	'Vote Submitted',	'vote_submitted',	'{user} = User\'s First and Last Name,\r\n{system_admin_email} = Country Admin Email,\r\n',	'Vote Submitted',	'<p>\n	Dear {user}</p>\n<p>\n	Your vote has successfully been submitted.&nbsp; &nbsp;&nbsp;</p>\n<p>\n	In case this is an error, feel free contact the system administrator at {system_admin_email} or your HRBP in your country.&nbsp;</p>\n<p>\n	&nbsp;</p>\n<p>\n	Regards,</p>\n<p>\n	System Administrator</p>\n<p>\n	&nbsp;</p>\n',	0),
(9,	'Vote Initiated',	'vote_initiated',	'{user} = User\'s First and Last Name,\r\n{system_admin_email} = Country Admin Email,\r\n',	'Voting Initiation',	'<p>\r\n	Dear {user}</p>\r\n<p>\r\n	Thanks you for initiating your nomination form. We wish you a blessed nomination exercise.&nbsp; &nbsp;&nbsp;</p>\r\n<p>\r\n	In case this is an error, feel free contact the system administrator at {system_admin_email} or your HRBP in your country.&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	Regards,</p>\r\n<p>\r\n	System Administrator</p>\r\n<p>\r\n	&nbsp;</p>\r\n',	0),
(10,	'Notify Nominee',	'notify_nominee',	'{user} = User\'s First and Last Name,\r\n{nominated_categories} = Nominated categories\r\n',	'Nominee Notification',	'<p>\r\n	Dear {user}</p>\r\n<p>\r\n	Someone has nominated you for the Staff recognition Award in the following categories: {nominated_categories}.</p>\r\n<p>\r\n	God bless you as you continue serving deligently in the ministry to children,</p>\r\n<p>\r\n	Regards,</p>\r\n<p>\r\n	System Administrator</p>\r\n<div>\r\n	&nbsp;</div>\r\n',	1),
(11,	'Voting Reminder',	'voting_reminder',	'{user} = User\'s First and Last Name,\r\n{days_to_go} = Days to go to survey closure\r\n',	'Voting Reminder',	'<p>\r\n	Dear {user}</p>\r\n<p>\r\n	We have noticed that you have not yet submitted your vote to date. You have {days_to_go} days to the closure of this exercise.&nbsp;</p>\r\n<p>\r\n	Kindly spare some time submit your Staff Recognition Award vote.&nbsp;</p>\r\n<p>\r\n	Regards,</p>\r\n<p>\r\n	System Administrator</p>\r\n<div>\r\n	&nbsp;</div>\r\n',	1),
(12,	'User Profile Edit',	'user_profile_edit',	'{user} = User\'s First and Last Name,\r\n{system_name} = System Name,\r\n{user_email} = User\'s Email,\r\n{user_password} = User\'s Password,\r\n{user_role} = User\'s role,\r\n{user_profile} = User\'s Profile,\r\n{site_url} = Site URL,\r\n{system_admin_email} = Country Admin Email\r\n{system_user_scope} = User Scope\r\n{user_team} = User Team\r\n{user_department} = Country Admin Email\r\n{user_status} = Country Admin Email\r\n\r\n ',	'User Profile Update',	'<p>\n	Dear {user}</p>\n<p>\n	Your account has been edited . Below are your updated account details:</p>\n<p>\n	Login Email: {user_email}</p>\n<p>\n	Your Role: {user_role}</p>\n<p>\n	Profile: {user_profile}</p>\n<p>\n	Scope: {system_user_scope}</p>\n<p>\n	Team: {user_team}</p>\n<p>\n	Department: {user_department}</p>\n<p>\n	Account Status: {user_status}</p>\n<p>\n	You can proceed logging in at {site_url}. For information contact the administrator at {system_admin_email}&nbsp;or your HRBP in your country.</p>\n<p>\n	&nbsp;</p>\n<p>\n	Regards,</p>\n<p>\n	System Administrator&nbsp; &nbsp;</p>\n',	0);

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
  `email_notify` tinyint(5) NOT NULL DEFAULT '1',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `employee_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `role_id` int(50) NOT NULL,
  `profile_id` tinyint(5) NOT NULL,
  `manager_id` int(100) NOT NULL,
  `auth` tinyint(5) NOT NULL,
  `system_admin` tinyint(5) NOT NULL DEFAULT '0',
  `country_id` int(11) NOT NULL,
  `manage_staff_in_your_country` int(5) NOT NULL DEFAULT '1',
  `first_login_attempt` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `yes_no_option`;
CREATE TABLE `yes_no_option` (
  `yes_no_option_id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(5) NOT NULL,
  PRIMARY KEY (`yes_no_option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `yes_no_option` (`yes_no_option_id`, `name`) VALUES
(1,	'No'),
(2,	'Yes');

-- 2019-05-10 14:53:57
