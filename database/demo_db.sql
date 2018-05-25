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
(26,	'self_update',	20);

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
(184,	'both',	'',	'',	'',	NULL);

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
  `user_id` int(11) NOT NULL,
  `two_way` tinyint(4) NOT NULL COMMENT '1=yes (Can nominate and be nominated by other FOs),0=no (User can only nominate other FOs)',
  `strict` tinyint(4) NOT NULL COMMENT '0=all departments,1=only user department',
  `type` varchar(10) NOT NULL COMMENT 'admin,vote,both',
  PRIMARY KEY (`scope_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `scope_country`;
CREATE TABLE `scope_country` (
  `scope_country_id` int(100) NOT NULL AUTO_INCREMENT,
  `scope_id` tinyint(4) NOT NULL,
  `country_id` tinyint(4) NOT NULL,
  PRIMARY KEY (`scope_country_id`)
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
(14,	'skin_colour',	'green'),
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

-- 2018-05-25 13:44:41
