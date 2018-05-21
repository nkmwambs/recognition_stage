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


DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE `ci_sessions` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `country_id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `department_id` int(50) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `entitlement`;
CREATE TABLE `entitlement` (
  `entitlement_id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`entitlement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


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
(1,	'login',	'',	'',	'',	NULL),
(2,	'forgot_your_password',	'',	'',	'',	NULL),
(3,	'staff_dashboard',	'',	'',	'',	NULL),
(4,	'dashboard',	'',	'',	'',	NULL),
(5,	'account',	'',	'',	'',	NULL),
(6,	'edit_profile',	'',	'',	'',	NULL),
(7,	'change_password',	'',	'',	'',	NULL),
(8,	'event_schedule',	'',	'',	'',	NULL),
(9,	'users',	'',	'',	'',	NULL),
(10,	'delete',	'',	'',	'',	NULL),
(11,	'cancel',	'',	'',	'',	NULL),
(12,	'Ok',	'',	'',	'',	NULL),
(13,	'language',	'',	'',	'',	NULL),
(14,	'administrator',	'',	'',	'',	NULL),
(15,	'switch_user',	'',	'',	'',	NULL),
(16,	'reset_password',	'',	'',	'',	NULL),
(17,	'return_to_login_page',	'',	'',	'',	NULL),
(18,	'manager_dashboard',	'',	'',	'',	NULL),
(19,	'manage_profile',	'',	'',	'',	NULL),
(20,	'firstname',	'',	'',	'',	NULL),
(21,	'lastname',	'',	'',	'',	NULL),
(22,	'email',	'',	'',	'',	NULL),
(23,	'photo',	'',	'',	'',	NULL),
(24,	'update_profile',	'',	'',	'',	NULL),
(25,	'current_password',	'',	'',	'',	NULL),
(26,	'new_password',	'',	'',	'',	NULL),
(27,	'confirm_new_password',	'',	'',	'',	NULL),
(28,	'display_settings',	'',	'',	'',	NULL),
(29,	'general_settings',	'',	'',	'',	NULL),
(30,	'sms_settings',	'',	'',	'',	NULL),
(31,	'language_settings',	'',	'',	'',	NULL),
(32,	'previledges',	'',	'',	'',	NULL),
(33,	'accounts_setup',	'',	'',	'',	NULL),
(34,	'settings',	'',	'',	'',	NULL),
(35,	'manage_language',	'',	'',	'',	NULL),
(36,	'messages',	'',	'',	'',	NULL),
(37,	'new_message',	'',	'',	'',	NULL),
(38,	'setup',	'',	'',	'',	NULL),
(39,	'countries',	'',	'',	'',	NULL),
(40,	'roles',	'',	'',	'',	NULL),
(41,	'departments',	'',	'',	'',	NULL),
(42,	'teams',	'',	'',	'',	NULL),
(43,	'profiles',	'',	'',	'',	NULL),
(44,	'add_country',	'',	'',	'',	NULL),
(45,	'surveys',	'',	'',	'',	NULL),
(46,	'manage_surveys',	'',	'',	'',	NULL),
(47,	'nominate',	'',	'',	'',	NULL),
(48,	'survey_results',	'',	'',	'',	NULL),
(49,	'name',	'',	'',	'',	NULL),
(50,	'staff_count',	'',	'',	'',	NULL),
(51,	'manager_count',	'',	'',	'',	NULL),
(52,	'action',	'',	'',	'',	NULL),
(53,	'country',	'',	'',	'',	NULL),
(54,	'save',	'',	'',	'',	NULL),
(55,	'success',	'',	'',	'',	NULL),
(56,	'failed',	'',	'',	'',	NULL),
(57,	'edit',	'',	'',	'',	NULL),
(58,	'edit_country',	'',	'',	'',	NULL),
(59,	'message',	'',	'',	'',	NULL),
(60,	'add_department',	'',	'',	'',	NULL),
(61,	'department',	'',	'',	'',	NULL),
(62,	'edit_department',	'',	'',	'',	NULL),
(63,	'add_team',	'',	'',	'',	NULL),
(64,	'description',	'',	'',	'',	NULL),
(65,	'team',	'',	'',	'',	NULL),
(66,	'select',	'',	'',	'',	NULL),
(67,	'team_title',	'',	'',	'',	NULL),
(68,	'add_role',	'',	'',	'',	NULL),
(69,	'contribution',	'',	'',	'',	NULL),
(70,	'role',	'',	'',	'',	NULL),
(71,	'role_title',	'',	'',	'',	NULL),
(72,	'staff',	'',	'',	'',	NULL),
(73,	'manager',	'',	'',	'',	NULL),
(74,	'add_profile',	'',	'',	'',	NULL),
(75,	'profile_name',	'',	'',	'',	NULL),
(76,	'profile_title',	'',	'',	'',	NULL),
(77,	'assignment',	'',	'',	'',	NULL),
(78,	'assign_privileges',	'',	'',	'',	NULL),
(79,	'assign_previledges',	'',	'',	'',	NULL),
(80,	'add_user',	'',	'',	'',	NULL),
(81,	'delete_user',	'',	'',	'',	NULL),
(82,	'update_user',	'',	'',	'',	NULL),
(83,	'translate_language',	'',	'',	'',	NULL),
(84,	'manage_settings',	'',	'',	'',	NULL),
(85,	'system_settings',	'',	'',	'',	NULL),
(86,	'Are_you_sure_you_want_to_perform_this_action?',	'',	'',	'',	NULL),
(87,	'process_aborted',	'',	'',	'',	NULL),
(88,	'please_wait_until_you_receive_confirmation',	'',	'',	'',	NULL),
(89,	'edit_role',	'',	'',	'',	NULL),
(90,	'title',	'',	'',	'',	NULL),
(91,	'manage_users',	'',	'',	'',	NULL),
(92,	'cash_journal',	'',	'',	'',	NULL),
(93,	'budget',	'',	'',	'',	NULL),
(94,	'budget_limits',	'',	'',	'',	NULL),
(95,	'budget_summary',	'',	'',	'',	NULL),
(96,	'budget_schedules',	'',	'',	'',	NULL),
(97,	'complete_budget',	'',	'',	'',	NULL),
(98,	'C.I.Vs',	'',	'',	'',	NULL),
(99,	'accounts_chart',	'',	'',	'',	NULL);

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


DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(50) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `contribution` varchar(20) NOT NULL COMMENT 'manager,staff',
  `department_id` int(100) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `scope`;
CREATE TABLE `scope` (
  `scope_id` int(100) NOT NULL AUTO_INCREMENT,
  `country_id` int(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`scope_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


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

DROP TABLE IF EXISTS `team`;
CREATE TABLE `team` (
  `team_id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `country_id` int(100) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `teamset`;
CREATE TABLE `teamset` (
  `teamset_id` int(100) NOT NULL AUTO_INCREMENT,
  `user_id` int(50) NOT NULL,
  `team_id` int(50) NOT NULL,
  PRIMARY KEY (`teamset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


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
(1,	'Nicodemus',	'Karisa',	'NKarisa@ke.ci.org',	'956d2d5467ed373328ee2d165a51c399',	'male',	'254711808071',	1,	2,	1,	1),
(2,	'James',	'Mulandi',	'JMulandi@ke.ci.org',	'956d2d5467ed373328ee2d165a51c399',	'male',	'254720648480',	4,	3,	1,	1);

-- 2018-05-21 22:09:50
