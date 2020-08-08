-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2020 at 07:27 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbs197403`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `resource_id` int(10) UNSIGNED NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `country_code` varchar(2) NOT NULL DEFAULT '',
  `country_name` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_code`, `country_name`) VALUES
(1, 'AF', 'Afghanistan'),
(2, 'AL', 'Albania'),
(3, 'DZ', 'Algeria'),
(4, 'DS', 'American Samoa'),
(5, 'AD', 'Andorra'),
(6, 'AO', 'Angola'),
(7, 'AI', 'Anguilla'),
(8, 'AQ', 'Antarctica'),
(9, 'AG', 'Antigua and Barbuda'),
(10, 'AR', 'Argentina'),
(11, 'AM', 'Armenia'),
(12, 'AW', 'Aruba'),
(13, 'AU', 'Australia'),
(14, 'AT', 'Austria'),
(15, 'AZ', 'Azerbaijan'),
(16, 'BS', 'Bahamas'),
(17, 'BH', 'Bahrain'),
(18, 'BD', 'Bangladesh'),
(19, 'BB', 'Barbados'),
(20, 'BY', 'Belarus'),
(21, 'BE', 'Belgium'),
(22, 'BZ', 'Belize'),
(23, 'BJ', 'Benin'),
(24, 'BM', 'Bermuda'),
(25, 'BT', 'Bhutan'),
(26, 'BO', 'Bolivia'),
(27, 'BA', 'Bosnia and Herzegovina'),
(28, 'BW', 'Botswana'),
(29, 'BV', 'Bouvet Island'),
(30, 'BR', 'Brazil'),
(31, 'IO', 'British Indian Ocean Territory'),
(32, 'BN', 'Brunei Darussalam'),
(33, 'BG', 'Bulgaria'),
(34, 'BF', 'Burkina Faso'),
(35, 'BI', 'Burundi'),
(36, 'KH', 'Cambodia'),
(37, 'CM', 'Cameroon'),
(38, 'CA', 'Canada'),
(39, 'CV', 'Cape Verde'),
(40, 'KY', 'Cayman Islands'),
(41, 'CF', 'Central African Republic'),
(42, 'TD', 'Chad'),
(43, 'CL', 'Chile'),
(44, 'CN', 'China'),
(45, 'CX', 'Christmas Island'),
(46, 'CC', 'Cocos (Keeling) Islands'),
(47, 'CO', 'Colombia'),
(48, 'KM', 'Comoros'),
(49, 'CD', 'Democratic Republic of the Congo'),
(50, 'CG', 'Republic of Congo'),
(51, 'CK', 'Cook Islands'),
(52, 'CR', 'Costa Rica'),
(53, 'HR', 'Croatia (Hrvatska)'),
(54, 'CU', 'Cuba'),
(55, 'CY', 'Cyprus'),
(56, 'CZ', 'Czech Republic'),
(57, 'DK', 'Denmark'),
(58, 'DJ', 'Djibouti'),
(59, 'DM', 'Dominica'),
(60, 'DO', 'Dominican Republic'),
(61, 'TP', 'East Timor'),
(62, 'EC', 'Ecuador'),
(63, 'EG', 'Egypt'),
(64, 'SV', 'El Salvador'),
(65, 'GQ', 'Equatorial Guinea'),
(66, 'ER', 'Eritrea'),
(67, 'EE', 'Estonia'),
(68, 'ET', 'Ethiopia'),
(69, 'FK', 'Falkland Islands (Malvinas)'),
(70, 'FO', 'Faroe Islands'),
(71, 'FJ', 'Fiji'),
(72, 'FI', 'Finland'),
(73, 'FR', 'France'),
(74, 'FX', 'France, Metropolitan'),
(75, 'GF', 'French Guiana'),
(76, 'PF', 'French Polynesia'),
(77, 'TF', 'French Southern Territories'),
(78, 'GA', 'Gabon'),
(79, 'GM', 'Gambia'),
(80, 'GE', 'Georgia'),
(81, 'DE', 'Germany'),
(82, 'GH', 'Ghana'),
(83, 'GI', 'Gibraltar'),
(84, 'GK', 'Guernsey'),
(85, 'GR', 'Greece'),
(86, 'GL', 'Greenland'),
(87, 'GD', 'Grenada'),
(88, 'GP', 'Guadeloupe'),
(89, 'GU', 'Guam'),
(90, 'GT', 'Guatemala'),
(91, 'GN', 'Guinea'),
(92, 'GW', 'Guinea-Bissau'),
(93, 'GY', 'Guyana'),
(94, 'HT', 'Haiti'),
(95, 'HM', 'Heard and Mc Donald Islands'),
(96, 'HN', 'Honduras'),
(97, 'HK', 'Hong Kong'),
(98, 'HU', 'Hungary'),
(99, 'IS', 'Iceland'),
(100, 'IN', 'India'),
(101, 'IM', 'Isle of Man'),
(102, 'ID', 'Indonesia'),
(103, 'IR', 'Iran (Islamic Republic of)'),
(104, 'IQ', 'Iraq'),
(105, 'IE', 'Ireland'),
(106, 'IL', 'Israel'),
(107, 'IT', 'Italy'),
(108, 'CI', 'Ivory Coast'),
(109, 'JE', 'Jersey'),
(110, 'JM', 'Jamaica'),
(111, 'JP', 'Japan'),
(112, 'JO', 'Jordan'),
(113, 'KZ', 'Kazakhstan'),
(114, 'KE', 'Kenya'),
(115, 'KI', 'Kiribati'),
(116, 'KP', 'Korea, Democratic People\'s Republic of'),
(117, 'KR', 'Korea, Republic of'),
(118, 'XK', 'Kosovo'),
(119, 'KW', 'Kuwait'),
(120, 'KG', 'Kyrgyzstan'),
(121, 'LA', 'Lao People\'s Democratic Republic'),
(122, 'LV', 'Latvia'),
(123, 'LB', 'Lebanon'),
(124, 'LS', 'Lesotho'),
(125, 'LR', 'Liberia'),
(126, 'LY', 'Libyan Arab Jamahiriya'),
(127, 'LI', 'Liechtenstein'),
(128, 'LT', 'Lithuania'),
(129, 'LU', 'Luxembourg'),
(130, 'MO', 'Macau'),
(131, 'MK', 'North Macedonia'),
(132, 'MG', 'Madagascar'),
(133, 'MW', 'Malawi'),
(134, 'MY', 'Malaysia'),
(135, 'MV', 'Maldives'),
(136, 'ML', 'Mali'),
(137, 'MT', 'Malta'),
(138, 'MH', 'Marshall Islands'),
(139, 'MQ', 'Martinique'),
(140, 'MR', 'Mauritania'),
(141, 'MU', 'Mauritius'),
(142, 'TY', 'Mayotte'),
(143, 'MX', 'Mexico'),
(144, 'FM', 'Micronesia, Federated States of'),
(145, 'MD', 'Moldova, Republic of'),
(146, 'MC', 'Monaco'),
(147, 'MN', 'Mongolia'),
(148, 'ME', 'Montenegro'),
(149, 'MS', 'Montserrat'),
(150, 'MA', 'Morocco'),
(151, 'MZ', 'Mozambique'),
(152, 'MM', 'Myanmar'),
(153, 'NA', 'Namibia'),
(154, 'NR', 'Nauru'),
(155, 'NP', 'Nepal'),
(156, 'NL', 'Netherlands'),
(157, 'AN', 'Netherlands Antilles'),
(158, 'NC', 'New Caledonia'),
(159, 'NZ', 'New Zealand'),
(160, 'NI', 'Nicaragua'),
(161, 'NE', 'Niger'),
(162, 'NG', 'Nigeria'),
(163, 'NU', 'Niue'),
(164, 'NF', 'Norfolk Island'),
(165, 'MP', 'Northern Mariana Islands'),
(166, 'NO', 'Norway'),
(167, 'OM', 'Oman'),
(168, 'PK', 'Pakistan'),
(169, 'PW', 'Palau'),
(170, 'PS', 'Palestine'),
(171, 'PA', 'Panama'),
(172, 'PG', 'Papua New Guinea'),
(173, 'PY', 'Paraguay'),
(174, 'PE', 'Peru'),
(175, 'PH', 'Philippines'),
(176, 'PN', 'Pitcairn'),
(177, 'PL', 'Poland'),
(178, 'PT', 'Portugal'),
(179, 'PR', 'Puerto Rico'),
(180, 'QA', 'Qatar'),
(181, 'RE', 'Reunion'),
(182, 'RO', 'Romania'),
(183, 'RU', 'Russian Federation'),
(184, 'RW', 'Rwanda'),
(185, 'KN', 'Saint Kitts and Nevis'),
(186, 'LC', 'Saint Lucia'),
(187, 'VC', 'Saint Vincent and the Grenadines'),
(188, 'WS', 'Samoa'),
(189, 'SM', 'San Marino'),
(190, 'ST', 'Sao Tome and Principe'),
(191, 'SA', 'Saudi Arabia'),
(192, 'SN', 'Senegal'),
(193, 'RS', 'Serbia'),
(194, 'SC', 'Seychelles'),
(195, 'SL', 'Sierra Leone'),
(196, 'SG', 'Singapore'),
(197, 'SK', 'Slovakia'),
(198, 'SI', 'Slovenia'),
(199, 'SB', 'Solomon Islands'),
(200, 'SO', 'Somalia'),
(201, 'ZA', 'South Africa'),
(202, 'GS', 'South Georgia South Sandwich Islands'),
(203, 'SS', 'South Sudan'),
(204, 'ES', 'Spain'),
(205, 'LK', 'Sri Lanka'),
(206, 'SH', 'St. Helena'),
(207, 'PM', 'St. Pierre and Miquelon'),
(208, 'SD', 'Sudan'),
(209, 'SR', 'Suriname'),
(210, 'SJ', 'Svalbard and Jan Mayen Islands'),
(211, 'SZ', 'Swaziland'),
(212, 'SE', 'Sweden'),
(213, 'CH', 'Switzerland'),
(214, 'SY', 'Syrian Arab Republic'),
(215, 'TW', 'Taiwan'),
(216, 'TJ', 'Tajikistan'),
(217, 'TZ', 'Tanzania, United Republic of'),
(218, 'TH', 'Thailand'),
(219, 'TG', 'Togo'),
(220, 'TK', 'Tokelau'),
(221, 'TO', 'Tonga'),
(222, 'TT', 'Trinidad and Tobago'),
(223, 'TN', 'Tunisia'),
(224, 'TR', 'Turkey'),
(225, 'TM', 'Turkmenistan'),
(226, 'TC', 'Turks and Caicos Islands'),
(227, 'TV', 'Tuvalu'),
(228, 'UG', 'Uganda'),
(229, 'UA', 'Ukraine'),
(230, 'AE', 'United Arab Emirates'),
(231, 'GB', 'United Kingdom'),
(232, 'US', 'United States'),
(233, 'UM', 'United States minor outlying islands'),
(234, 'UY', 'Uruguay'),
(235, 'UZ', 'Uzbekistan'),
(236, 'VU', 'Vanuatu'),
(237, 'VA', 'Vatican City State'),
(238, 'VE', 'Venezuela'),
(239, 'VN', 'Vietnam'),
(240, 'VG', 'Virgin Islands (British)'),
(241, 'VI', 'Virgin Islands (U.S.)'),
(242, 'WF', 'Wallis and Futuna Islands'),
(243, 'EH', 'Western Sahara'),
(244, 'YE', 'Yemen'),
(245, 'ZM', 'Zambia'),
(246, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

CREATE TABLE `donations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faq_main`
--

CREATE TABLE `faq_main` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `faq_main`
--

INSERT INTO `faq_main` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Basic', '2019-11-23 11:42:26', '2019-11-23 06:12:26'),
(2, 'About Us', '2019-11-23 11:43:53', '2019-11-23 11:43:53'),
(3, 'Help', '2019-12-05 16:13:44', '2019-12-05 16:13:44'),
(4, 'Facts', '2019-12-24 18:39:52', '2019-12-24 18:39:52'),
(5, 'Resource Types', '2019-12-24 18:39:59', '2019-12-24 18:39:59'),
(6, 'Account Types', '2019-12-29 15:48:29', '2019-12-29 15:48:29');

-- --------------------------------------------------------

--
-- Table structure for table `faq_sub`
--

CREATE TABLE `faq_sub` (
  `id` int(10) UNSIGNED NOT NULL,
  `faq_main_id` int(11) DEFAULT NULL,
  `name` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `faq_sub`
--

INSERT INTO `faq_sub` (`id`, `faq_main_id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 'Question 1', 'Does this edit work?', '2019-12-29 10:39:28', '2019-12-29 15:39:28'),
(2, 2, 'Question 2', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2019-11-23 11:44:26', '2019-11-23 11:44:26'),
(3, 1, 'Does this add FAQ function work?', 'Yes it seems to, but I\'m just checking really.', '2019-12-05 16:12:52', '2019-12-05 16:12:52'),
(4, 1, 'dasdas', 'sadasdasd yggyy g  gg', '2019-12-09 13:56:52', '2019-12-09 18:56:52'),
(5, 1, 'Test Question', 'Test ans', '2019-12-10 16:19:30', '2019-12-10 16:19:30'),
(6, 2, 'Test Question about', 'Test Ans about', '2019-12-10 16:20:07', '2019-12-10 16:20:07'),
(7, 3, 'Test Question help', 'Test Ans help', '2019-12-10 16:20:25', '2019-12-10 16:20:25'),
(8, 1, 'fgnfgdn', 'bfgbfgngfnn', '2019-12-24 18:39:22', '2019-12-24 18:39:22'),
(9, 1, 'nfgdnfgnd', 'nfgdnfgdn', '2019-12-24 18:39:27', '2019-12-24 18:39:27'),
(11, 6, 'How many types of accounts are there?', 'there are Day 1: Tashkent\r\n•	Arrival Tashkent, meet our guide and transfer to the hotel. \r\n•	After breakfast a full day tour in Tashkent: Old city – the area which preserves the traditional Uzbek style: \r\no	Kukaldash Madrasah (16th century)\r\n-	Madrasah exhibits one of the Islamic relics – the Othman Quran, one of the world’s oldest Quran copy dating back to 8th century.\r\no	Hast Imam complex. This architectural complex consists of;\r\n-	 Barak-Khan Madrasah\r\n-	Tilla sheikh mosque\r\n-	 Muyi Muborak Madrasah,\r\n-	Kaffal shashi mausoleum, \r\n-	Namazgoh mosque, \r\n-	the new Khazrati Imam mosque \r\n-	the muftiate building (the Muslim board of Uzbekistan) built in 2007 \r\n-	Muyi muborak Madrasah (16th century).\r\n•	Overnight stay at the hotel.', '2019-12-29 15:52:21', '2019-12-29 15:52:21');

-- --------------------------------------------------------

--
-- Table structure for table `mail_settings`
--

CREATE TABLE `mail_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mail_settings`
--

INSERT INTO `mail_settings` (`id`, `name`, `value`) VALUES
(1, 'footer', '“This email may contain confidential information and is intended solely for the individual to whom it is addressed. If you\nare not the named addressee, you should not use, disseminate, forward, print, or copy this email. Please inform the\nsender immediately by email that you have received this email by mistake, do not open any attachments, and delete the\nemail immediately. Any views and opinions in this email are those of the individual sender and not necessarily those of\nIslamic Resource Hub. Please note that neither the sender nor do Islamic Resource Hub accept any responsibility for\nviruses. It is your responsibility to check/scan the email or attachments for malicious software. We reserve the right to\nmonitor e-mail messages passing through our network as permitted under UK law.”'),
(2, 'ban_mail', 'Jazakallahu Khairan for submitting your resource. Unfortunately, we are unable to approve\r\nyour resource due to the follow reason(s) stated below:');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `chat_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_from` int(10) UNSIGNED NOT NULL,
  `user_to` int(10) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `unread` tinyint(4) NOT NULL DEFAULT 1,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `chat_id`, `user_from`, `user_to`, `message`, `unread`, `status`, `created_at`, `updated_at`) VALUES
(1, 'fayezrahman_muhammadzakir', 4, 5, 'salam', 0, 1, '2019-03-28 10:35:11', '2019-04-28 22:06:01'),
(2, 'fayezrahman_muhammadzakir', 5, 4, 'wsalam', 0, 1, '2019-03-28 10:35:27', '2019-04-28 22:06:01'),
(3, 'fayezrahman_muhammadzakir', 4, 5, 'how are u?', 0, 1, '2019-03-28 10:35:44', '2019-04-28 22:06:01'),
(4, 'fayezrahman_muhammadzakir', 5, 4, 'i am good', 0, 1, '2019-03-28 10:35:53', '2019-04-28 22:06:01'),
(5, 'muhammadzakir05@hotmail.com_admin', 6, 1, 'N', 0, 1, '2019-03-29 22:19:09', '2019-05-16 03:54:18'),
(6, 'dasds_fayezrahman', 9, 4, 'does this really work?', 0, 1, '2019-04-02 17:34:29', '2019-04-14 23:24:04'),
(7, 'dasds_fayezrahman', 9, 4, 'does it work???', 0, 1, '2019-04-02 17:34:36', '2019-04-14 23:24:04'),
(8, 'muhammadzakir_muhammadzakir', 5, 5, 'Bro you getting this message', 0, 1, '2019-04-02 19:06:36', '2019-04-28 22:06:01'),
(9, 'Muhammadibn_muhammadzakir', 10, 5, 'Assalamu\'alaykum', 0, 1, '2019-04-02 19:41:20', '2019-04-28 22:06:01'),
(10, 'Muhammadibn_muhammadzakir', 10, 5, 'Assalamu\'alaykum', 0, 1, '2019-04-02 19:41:35', '2019-04-28 22:06:01'),
(11, 'muhammadzakir_muhammadzakir', 5, 5, 'Yes', 0, 1, '2019-04-04 02:03:34', '2019-04-28 22:06:01'),
(12, 'fayezrahman_muhammadzakir', 5, 4, 'Walaikum salam', 0, 1, '2019-04-04 02:03:48', '2019-04-28 22:06:01'),
(13, 'Muhammadibn_muhammadzakir', 5, 10, 'Walaikum Salam Mawlana, welcome and Jazakllahu Khairan for joining!\n\nWassalam\nZakir', 0, 1, '2019-04-04 02:15:52', '2019-04-28 22:06:01'),
(14, 'fayezrahman_muhammadzakir', 5, 4, 'Wasalam', 0, 1, '2019-04-04 02:16:58', '2019-04-28 22:06:01'),
(15, 'Muhammadibn_muhammadzakir', 5, 10, 'Walaikum salam mawlana jazākallāhu khairan for joining.', 0, 1, '2019-04-04 10:48:03', '2019-04-28 22:06:01'),
(16, 'muhammadzakir05@hotmail.com_admin', 1, 6, '123', 0, 1, '2019-04-04 14:17:28', '2019-05-16 03:54:18'),
(17, 'muhammadzakir05@hotmail.com_admin', 6, 1, '123', 0, 1, '2019-04-04 14:53:42', '2019-05-16 03:54:18'),
(18, 'muhammadzakir05@hotmail.com_muhammadzakir05@hotmail.com', 6, 6, 'You getting this bro', 0, 1, '2019-04-04 15:19:14', '2019-05-16 03:54:18'),
(19, 'muhammadzakir05@hotmail.com_admin', 6, 1, '123', 0, 1, '2019-04-04 20:49:31', '2019-05-16 03:54:18'),
(20, 'test_fayezrahman', 23, 4, 'Does this really work', 0, 1, '2019-04-14 23:24:02', '2019-05-19 15:25:47'),
(21, 'muhammad.zakir@alkhairschool.org.uk_muhammadzakir', 30, 5, 'hello', 0, 1, '2019-04-28 22:05:58', '2019-04-28 22:06:01');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(0, '2019_09_06_061159_create_testimonials_table', 10),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_03_08_075022_create_resource_flags_table', 1),
(5, '2019_03_08_075141_create_resource_reviews_table', 1),
(6, '2019_03_08_075343_create_resource_likes_table', 1),
(8, '2019_03_08_092639_create_permission_tables', 1),
(9, '2019_03_08_092932_create_resource_categories_table', 2),
(10, '2019_03_08_094051_create_tags_table', 3),
(11, '2019_03_08_075721_create_resource_tag_table', 4),
(12, '2014_10_12_000000_create_users_table', 5),
(14, '2019_03_08_074402_create_resources_table', 6),
(15, '2019_03_14_074111_create_subscribers_table', 7),
(17, '2019_03_20_115257_create_donations_table', 8),
(20, '2019_03_26_042625_create_messages_table', 9);

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notices`
--

INSERT INTO `notices` (`id`, `user_id`, `message`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '', 0, '2019-12-02 10:43:14', '2019-12-02 10:43:14'),
(2, 1, '', 0, '2019-12-07 16:20:16', '2019-12-07 16:20:16'),
(4, 3, '', 0, '2019-12-24 18:35:00', '2019-12-24 18:35:00'),
(5, 2, '', 0, '2019-12-29 17:23:50', '2019-12-29 17:23:50'),
(6, 2, '', 0, '2019-12-29 17:23:57', '2019-12-29 17:23:57'),
(7, 4, '', 0, '2020-01-04 01:51:50', '2020-01-04 01:51:50');

-- --------------------------------------------------------

--
-- Stand-in structure for view `notices_view`
-- (See below for the actual view)
--
CREATE TABLE `notices_view` (
`total_notice` bigint(21)
,`user_id` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `message`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '<a href=\"/resource/author/3\">frahman</a> comments on your resource', 1, '2019-12-10 11:30:29', '2019-12-10 11:30:29'),
(2, 1, '<a href=\"/resource/author/3\">frahman</a> follows you', 1, '2019-12-10 11:30:29', '2019-12-10 11:30:29'),
(3, 3, '<a href=\"/resource/author/3\">frahman</a> comments on your resource', 0, '2019-12-10 16:49:19', '2019-12-10 16:49:19'),
(4, 3, '<a href=\"/resource/author/3\">frahman</a> likes your resource', 0, '2019-12-23 11:29:48', '2019-12-23 11:29:48'),
(5, 3, '<a href=\"/resource/author/3\">frahman</a> comments on your resource', 0, '2019-12-23 14:38:33', '2019-12-23 14:38:33'),
(6, 3, '<a href=\"/resource/author/1\">kalyan</a> likes your resource', 0, '2019-12-24 18:34:28', '2019-12-24 18:34:28');

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, 'SOCIAL_YT', 'https://www.youtube.com/channel/UCtIsBMybyNRAU7Fy4qv5gyw', NULL, NULL),
(2, 'SOCIAL_TT', 'https://twitter.com/islamicrh', NULL, NULL),
(3, 'SOCIAL_FB', 'https://www.facebook.com/islamicresourcehub/', NULL, NULL),
(4, 'SOCIAL_INS', 'https://www.instagram.com/islamicresourcehub/', NULL, NULL),
(5, 'STRIPE_PK_KEY', 'pk_test_sZTDqlZrjMGr2N0RDedOoTGv', '2019-11-05 04:19:39', '2019-11-05 04:19:39'),
(6, 'STRIPE_SC_KEY', 'sk_test_e5M9OEvHhLaOmxeGYwbq42yS', NULL, NULL),
(7, 'OTD_AMT', '10,20,30,40,50,60', NULL, NULL),
(8, 'HEADER_IMG_HOME', 'HEADER_IMG_HOME.jpg', '2019-11-22 15:02:10', '2019-11-22 09:32:10'),
(9, 'HEADER_IMG_RESOURCES', 'HEADER_IMG_RESOURCES.jpg', '2019-11-22 15:03:59', '2019-11-22 09:33:59'),
(10, 'HEADER_IMG_SUPPORT_US', 'HEADER_IMG_SUPPORT_US.jpg', '2019-11-22 15:04:22', '2019-11-22 09:34:22'),
(11, 'HEADER_IMG_CONTACT_US', 'HEADER_IMG_CONTACT_US.jpg', '2019-11-22 15:04:49', '2019-11-22 09:34:49'),
(12, 'SOCIAL_FB_SH', 'http://www.facebook.com/share.php?u=', '2019-12-13 05:00:00', '2019-12-13 05:00:00'),
(13, 'SOCIAL_TT_SH', 'https://twitter.com/share?url=', '2019-12-13 05:00:00', '2019-12-13 05:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `content`, `created_at`, `updated_at`) VALUES
(1, 'privacy', '<div id=\"lipsum\" style=\"margin: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><span style=\"color: rgb(0, 0, 10); font-family: &quot;Helvetica Neue&quot;; font-size: 11pt; text-align: start;\">This privacy policy applies between you, the User of this Website and Islamic Resource Hub, the owner and provider of this Website. Islamic Resource Hub takes the privacy of your information very seriously. This privacy policy applies to our use of any and all Data collected by us or provided by you in relation to your use of the Website.</span><br><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Please read this privacy policy carefully</span></b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">.tyyyyy</span><o:p></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Definitions and interpretation</span><o:p></o:p></h2><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">1.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">In this privacy policy, the following definitions are used:&nbsp;</span><o:p></o:p></p><table class=\"MsoNormalTable\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" style=\"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: -webkit-standard; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none; margin-left: 2.75pt; border-collapse: collapse; border: none;\"><tbody><tr><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border-top-width: 1pt; border-style: solid none; border-top-color: black; border-bottom-width: 1pt; border-bottom-color: black; padding: 2.75pt;\"><p class=\"DefinitionDescription\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Data</span></b><o:p></o:p></p></td><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border-top-width: 1pt; border-style: solid none; border-top-color: black; border-bottom-width: 1pt; border-bottom-color: black; padding: 2.75pt;\"><p class=\"DefinitionDescription\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">collectively all information that you submit to Islamic Resource Hub via the Website. This definition incorporates, where applicable, the definitions provided in the Data Protection Laws;</span><o:p></o:p></p></td></tr><tr><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border-style: none none solid; border-bottom-width: 1pt; border-bottom-color: black; padding: 2.75pt;\"><p class=\"DefinitionDescription\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Cookies</span></b><o:p></o:p></p></td><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border-style: none none solid; border-bottom-width: 1pt; border-bottom-color: black; padding: 2.75pt;\"><p class=\"DefinitionDescription\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">a small text file placed on your computer by this Website when you visit certain parts of the Website and/or when you use certain features of the Website. Details of the cookies used by this Website are set out in the clause below (</span><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Cookies</span></b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">);</span><o:p></o:p></p></td></tr><tr><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border-style: none none solid; border-bottom-width: 1pt; border-bottom-color: black; padding: 2.75pt;\"><p class=\"DefinitionDescription\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Data Protection Laws</span></b><o:p></o:p></p></td><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border-style: none none solid; border-bottom-width: 1pt; border-bottom-color: black; padding: 2.75pt;\"><p class=\"DefinitionDescription\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">any applicable law relating to the processing of personal Data, including but not limited to the Directive 96/46/EC (Data Protection Directive) or the GDPR, and any national implementing laws, regulations and secondary legislation, for as long as the GDPR is effective in the UK;</span><o:p></o:p></p></td></tr><tr><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border-style: none none solid; border-bottom-width: 1pt; border-bottom-color: black; padding: 2.75pt;\"><p class=\"DefinitionDescription\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">GDPR</span></b><o:p></o:p></p></td><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border-style: none none solid; border-bottom-width: 1pt; border-bottom-color: black; padding: 2.75pt;\"><p class=\"DefinitionDescription\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">the General Data Protection Regulation (EU) 2016/679;</span><o:p></o:p></p></td></tr><tr><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border-style: none none solid; border-bottom-width: 1pt; border-bottom-color: black; padding: 2.75pt;\"><p class=\"DefinitionDescription\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Islamic Resource Hub,</span></b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;or&nbsp;</span><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">us</span></b><o:p></o:p></p></td><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border-style: none none solid; border-bottom-width: 1pt; border-bottom-color: black; padding: 2.75pt;\"><p class=\"DefinitionDescription\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Islamic Resource Hub, a company incorporated in England and Wales with registered number _______________ whose registered office is at _______________, _______________;</span><o:p></o:p></p></td></tr><tr><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border-style: none none solid; border-bottom-width: 1pt; border-bottom-color: black; padding: 2.75pt;\"><p class=\"DefinitionDescription\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">UK and EU Cookie Law</span></b><o:p></o:p></p></td><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border-style: none none solid; border-bottom-width: 1pt; border-bottom-color: black; padding: 2.75pt;\"><p class=\"DefinitionDescription\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">the Privacy and Electronic Communications (EC Directive) Regulations 2003 as amended by the Privacy and Electronic Communications (EC Directive) (Amendment) Regulations 2011;</span><o:p></o:p></p></td></tr><tr><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border-style: none none solid; border-bottom-width: 1pt; border-bottom-color: black; padding: 2.75pt;\"><p class=\"DefinitionDescription\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">User</span></b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;or&nbsp;</span><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">you</span></b><o:p></o:p></p></td><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border-style: none none solid; border-bottom-width: 1pt; border-bottom-color: black; padding: 2.75pt;\"><p class=\"DefinitionDescription\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">any third party that accesses the Website and is not either (i) employed by Islamic Resource Hub and acting in the course of their employment or (ii) engaged as a consultant or otherwise providing services to Islamic Resource Hub and accessing the Website in connection with the provision of such services; and</span><o:p></o:p></p></td></tr><tr><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border-style: none none solid; border-bottom-width: 1pt; border-bottom-color: black; padding: 2.75pt;\"><p class=\"DefinitionDescription\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Website</span></b><o:p></o:p></p></td><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border-style: none none solid; border-bottom-width: 1pt; border-bottom-color: black; padding: 2.75pt;\"><p class=\"DefinitionDescription\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">the website that you are currently using, www.islamicresourcehub.com, and any sub-domains of this site unless expressly excluded by their own terms and conditions.</span><o:p></o:p></p></td></tr></tbody></table><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">2.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">In this privacy policy, unless the context requires a different interpretation:&nbsp;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">a.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">the singular includes the plural and vice versa;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">b.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">references to sub-clauses, clauses, schedules or appendices are to sub-clauses, clauses, schedules or appendices of this privacy policy;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">c.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">a reference to a person includes firms, companies, government entities, trusts and partnerships;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">d.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">\"including\" is understood to mean \"including without limitation\";</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">e.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">reference to any statutory provision includes any modification or amendment of it;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">f.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">the headings and sub-headings do not form part of this privacy policy.</span><o:p></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Scope of this privacy policy</span><o:p></o:p></h2><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">3.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">This privacy policy applies only to the actions of Islamic Resource Hub and Users with respect to this Website. It does not extend to any websites that can be accessed from this Website including, but not limited to, any links we may provide to social media websites.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">4.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">For purposes of the applicable Data Protection Laws, Islamic Resource Hub is the \"data controller\". This means that Islamic Resource Hub determines the purposes for which, and the manner in which, your Data is processed.</span><o:p></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Data collected</span><o:p></o:p></h2><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">5.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">We may collect the following Data, which includes personal Data, from you:&nbsp;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">a.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">name;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">b.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">contact Information such as email addresses and telephone numbers;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">c.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">demographic information such as postcode, preferences and interests;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">d.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">IP address (automatically collected);</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">e.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Records of actions performed on the website;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">f.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">in each case, in accordance with this privacy policy.</span><o:p></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">How we collect Data</span><o:p></o:p></h2><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">6.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">We collect Data in the following ways:&nbsp;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">a.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">data is given to us by you; and</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">b.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">data is collected automatically.</span><o:p></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Data that is given to us by you</span><o:p></o:p></h2><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">7.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Islamic Resource Hub will collect your Data in a number of ways, for example:&nbsp;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">a.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">when you contact us through the Website, by telephone, post, e-mail or through any other means;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">b.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">when you register with us and set up an account to receive our products/services;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">c.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">when you complete surveys that we use for research purposes (although you are not obliged to respond to them);</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">d.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">when you use our services;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">in each case, in accordance with this privacy policy.</span><o:p></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Data that is collected automatically</span><o:p></o:p></h2><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">8.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">To the extent that you access the Website, we will collect your Data automatically, for example:&nbsp;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">a.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">we automatically collect some information about your visit to the Website. This information helps us to make improvements to Website content and navigation, and includes your IP address, the date, times and frequency with which you access the Website and the way you use and interact with its content.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">b.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">we will collect your Data automatically via cookies, in line with the cookie settings on your browser. For more information about cookies, and how we use them on the Website, see the section below, headed \"Cookies\".</span><o:p></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Our use of Data</span><o:p></o:p></h2><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">9.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Any or all of the above Data may be required by us from time to time in order to provide you with the best possible service and experience when using our Website. Specifically, Data may be used by us for the following reasons:&nbsp;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">a.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">internal record keeping;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">b.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">improvement of our products / services;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">in each case, in accordance with this privacy policy.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">10.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">We may use your Data for the above purposes if we deem it necessary to do so for our legitimate interests. If you are not satisfied with this, you have the right to object in certain circumstances (see the section headed \"Your rights\" below).</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">11.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">When you register with us and set up an account to receive our services, the legal basis for this processing is the performance of a contract between you and us and/or taking steps, at your request, to enter into such a contract.</span><o:p></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Who we share Data with</span><o:p></o:p></h2><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">12.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">We may share your Data with the following groups of people for the following reasons:&nbsp;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">a.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">our employees, agents and/or professional advisors - for administration purposes and to obtain advice from professional advisers however under no circumstances will we share any information with third parties;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">in each case, in accordance with this privacy policy.</span><o:p></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Keeping Data secure</span><o:p></o:p></h2><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">13.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">We will use technical and organisational measures to safeguard your Data, for example:&nbsp;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">a.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">access to your account is controlled by a password and a user name that is unique to you.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">b.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">we store your Data on secure servers.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">14.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Technical and organisational measures include measures to deal with any suspected data breach. If you suspect any misuse or loss or unauthorised access to your Data, please let us know immediately by contacting us via this e-mail address: support@islamicresourcehub.com .</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">15.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">If you want detailed information from Get Safe Online on how to protect your information and your computers and devices against fraud, identity theft, viruses and many other online problems, please visit www.getsafeonline.org. Get Safe Online is supported by HM Government and leading businesses.</span><o:p></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Data retention</span><o:p></o:p></h2><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">16.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Unless a longer retention period is required or permitted by law, we will only hold your Data on our systems for the period necessary to fulfil the purposes outlined in this privacy policy or until you request that the Data be deleted.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">17.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Even if we delete your Data, it may persist on backup or archival media for legal, tax or regulatory purposes.</span><o:p></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Your rights</span><o:p></o:p></h2><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">18.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">You have the following rights in relation to your Data:&nbsp;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">a.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Right to access</span></b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">- the right to request (i) copies of the information we hold about you at any time, or (ii) that we modify, update or delete such information. If we provide you with access to the information we hold about you, we will not charge you for this, unless your request is \"manifestly unfounded or excessive.\" Where we are legally permitted to do so, we may refuse your request. If we refuse your request, we will tell you the reasons why.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">b.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Right to correct</span></b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">- the right to have your Data rectified if it is inaccurate or incomplete.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">c.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Right to erase</span></b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">- the right to request that we delete or remove your Data from our systems.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">d.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Right to restrict our use of your Data</span></b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">- the right to \"block\" us from using your Data or limit the way in which we can use it.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">e.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Right to data portability</span></b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">- the right to request that we move, copy or transfer your Data.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">f.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Right to object</span></b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">- the right to object to our use of your Data including where we use it for our legitimate interests.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">19.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">To make enquiries, exercise any of your rights set out above, or withdraw your consent to the processing of your Data (where consent is our legal basis for processing your Data), please contact us via this e-mail address: support@islamicresourcehub.com .</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">20.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">If you are not satisfied with the way a complaint you make in relation to your Data is handled by us, you may be able to refer your complaint to the relevant data protection authority. For the UK, this is the Information Commissioner\'s Office (ICO). The ICO\'s contact details can be found on their website at https://ico.org.uk/.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">21.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">It is important that the Data we hold about you is accurate and current. Please keep us informed if your Data changes during the period for which we hold it.</span><o:p></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Links to other websites</span><o:p></o:p></h2><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">22.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">This Website may, from time to time, provide links to other websites. We have no control over such websites and are not responsible for the content of these websites. This privacy policy does not extend to your use of such websites. You are advised to read the privacy policy or statement of other websites prior to using them.</span><o:p></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Changes of business ownership and control</span><o:p></o:p></h2><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">23.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Islamic Resource Hub may, from time to time, expand or reduce our business and this may involve the sale and/or the transfer of control of all or part of Islamic Resource Hub. Data provided by Users will, where it is relevant to any part of our business so transferred, be transferred along with that part and the new owner or newly controlling party will, under the terms of this privacy policy, be permitted to use the Data for the purposes for which it was originally supplied to us.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">24.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">We may also disclose Data to a prospective purchaser of our business or any part of it.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">25.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">In the above instances, we will take steps with the aim of ensuring your privacy is protected.</span><o:p></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Cookies</span><o:p></o:p></h2><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">26.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">This Website may place and access certain Cookies on your computer. Islamic Resource Hub uses Cookies to improve your experience of using the Website. Islamic Resource Hub has carefully chosen these Cookies and has taken steps to ensure that your privacy is protected and respected at all times.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">27.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">All Cookies used by this Website are used in accordance with current UK and EU Cookie Law.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">28.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Before the Website places Cookies on your computer, you will be presented with a message bar requesting your consent to set those Cookies. By giving your consent to the placing of Cookies, you are enabling Islamic Resource Hub to provide a better experience and service to you. You may, if you wish, deny consent to the placing of Cookies; however certain features of the Website may not function fully or as intended.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">29.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">This Website may place the following Cookies:</span><o:p></o:p></p><table class=\"MsoNormalTable\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" style=\"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: -webkit-standard; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none; margin-left: 2.75pt; border-collapse: collapse; border: none;\"><tbody><tr><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border: 1pt solid black; padding: 2.75pt;\"><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Type of Cookie</span></b><o:p></o:p></p></td><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border-top-width: 1pt; border-right-width: 1pt; border-bottom-width: 1pt; border-style: solid solid solid none; border-top-color: black; border-right-color: black; border-bottom-color: black; padding: 2.75pt;\"><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Purpose</span></b><o:p></o:p></p></td></tr><tr><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border-right-width: 1pt; border-bottom-width: 1pt; border-left-width: 1pt; border-style: none solid solid; border-right-color: black; border-bottom-color: black; border-left-color: black; padding: 2.75pt;\"><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Strictly necessary cookies</span><o:p></o:p></p></td><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border-style: none solid solid none; border-bottom-width: 1pt; border-bottom-color: black; border-right-width: 1pt; border-right-color: black; padding: 2.75pt;\"><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">These are cookies that are required for the operation of our website. They include, for example, cookies that enable you to log into secure areas of our website, use a shopping cart or make use of e-billing services.</span><o:p></o:p></p></td></tr></tbody></table><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">30.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">You can find a list of Cookies that we use in the Cookies Schedule.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">31.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">You can choose to enable or disable Cookies in your internet browser. By default, most internet browsers accept Cookies but this can be changed. For further details, please consult the help menu in your internet browser.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">32.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">You can choose to delete Cookies at any time; however you may lose any information that enables you to access the Website more quickly and efficiently including, but not limited to, personalisation settings.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">33.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">It is recommended that you ensure that your internet browser is up-to-date and that you consult the help and guidance provided by the developer of your internet browser if you are unsure about adjusting your privacy settings.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">34.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">For more information generally on cookies, including how to disable them, please refer to aboutcookies.org. You will also find details on how to delete cookies from your computer.</span><o:p></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">General</span><o:p></o:p></h2><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--></p></div>', '2019-11-21 16:13:52', '2019-11-21 10:43:52');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profile_view`
--

CREATE TABLE `profile_view` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `profile_view` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `profile_view`
--

INSERT INTO `profile_view` (`id`, `user_id`, `profile_view`) VALUES
(2, 1, 58),
(3, 6, 56),
(4, 7, 53),
(5, 3, 53);

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

CREATE TABLE `resources` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `license_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resource_attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preview_attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `embed_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `downloads` int(11) NOT NULL DEFAULT 0,
  `resource_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'drafted',
  `approved_by` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `block` int(11) DEFAULT 1,
  `isFeatured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resources`
--

INSERT INTO `resources` (`id`, `user_id`, `category_id`, `title`, `description`, `license_type`, `resource_attachment`, `preview_attachment`, `embed_link`, `views`, `downloads`, `resource_status`, `approved_by`, `status`, `block`, `isFeatured`, `created_at`, `updated_at`) VALUES
(4, 3, 6, 'Funny', 'Yes', 'Attribution Licence', NULL, 'dummypreview.png', NULL, 13, 0, 'published', 1, 1, 1, 1, '2019-12-01 12:46:09', '2019-12-28 13:43:27'),
(7, 3, 6, 'Funny', 'Yes', 'Attribution Licence', NULL, 'dummypreview.png', NULL, 11, 0, 'published', 1, 1, 1, 1, '2019-12-01 12:46:09', '2019-12-28 13:49:44'),
(17, 1, 0, 'hgdghdhfg', NULL, NULL, NULL, NULL, NULL, 0, 0, 'draft', NULL, 1, 1, 0, '2019-12-12 17:09:08', '2019-12-12 17:09:08'),
(18, 3, 6, 'test', 'In the box below, describe what your resource is about and which age group it\'s aimed at in a few sentencs. Try to also give tips on how you\'ve used the resource in classroom settings.In the box below, describe what your resource is about and which age group it\'s aimed at in a few sentencs. Try to also give tips on how you\'ve used the resource in classroom settings.', 'ShareAlike Licence', '3.png', '3.png', NULL, 18, 0, 'published', NULL, 1, 1, 1, '2019-12-23 10:55:56', '2019-12-27 22:42:51'),
(19, 3, 11, 'test', 'In the box below, describe what your resource is about.', 'ShareAlike Licence', '3.png', '3.png', NULL, 14, 1, 'published', NULL, 1, 1, 1, '2019-12-23 10:57:18', '2019-12-29 11:01:56'),
(20, 3, 11, 'test 1fgbfghfgh', 'test', 'Attribution Licence', '3.png', '3.png', NULL, 19, 0, 'published', NULL, 1, 1, 1, '2019-12-23 11:00:15', '2019-12-29 13:41:08'),
(21, 3, 13, 'my test', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'Attribution Licence', '3.png', '3.png', NULL, 76, 0, 'published', NULL, 1, 1, 1, '2019-12-23 11:01:24', '2019-12-29 21:16:48');

-- --------------------------------------------------------

--
-- Table structure for table `resource_categories`
--

CREATE TABLE `resource_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resource_categories`
--

INSERT INTO `resource_categories` (`id`, `title`, `created_at`, `updated_at`) VALUES
(4, 'Fiqh', '2019-03-12 06:40:30', '2019-03-12 06:40:30'),
(5, 'Hadith', '2019-03-12 06:40:41', '2019-03-12 06:40:41'),
(6, 'Qaidah', '2019-03-12 06:40:50', '2019-03-12 06:40:50'),
(7, 'Tajweed', '2019-03-12 06:41:00', '2019-03-12 06:41:00'),
(8, 'Akhlaaq', '2019-03-12 06:41:07', '2019-03-12 06:41:07'),
(9, 'Seerah', '2019-03-12 06:41:15', '2019-03-12 06:41:15'),
(10, 'Arabic', '2019-03-12 06:41:24', '2019-03-12 06:41:24'),
(11, 'History', '2019-03-12 06:41:31', '2019-03-12 06:41:31'),
(12, 'Aqeedah', '2019-03-12 06:41:39', '2019-03-12 06:41:39'),
(13, 'Misc', '2019-03-12 06:41:44', '2019-03-12 06:41:44'),
(14, 'Khutbah', '2019-03-12 06:41:56', '2019-03-12 06:41:56'),
(15, 'PSHE', '2019-03-12 06:42:06', '2019-03-12 06:42:06'),
(16, 'Safar', '2019-12-29 16:00:38', '2019-12-29 16:00:38');

-- --------------------------------------------------------

--
-- Table structure for table `resource_download`
--

CREATE TABLE `resource_download` (
  `id` int(10) UNSIGNED NOT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `downloads` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `resource_download`
--

INSERT INTO `resource_download` (`id`, `resource_id`, `user_id`, `downloads`, `created_at`, `updated_at`) VALUES
(4, 19, 1, 1, '2019-12-24 18:34:20', '2019-12-24 18:34:20');

-- --------------------------------------------------------

--
-- Table structure for table `resource_flags`
--

CREATE TABLE `resource_flags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `resource_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resource_likes`
--

CREATE TABLE `resource_likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `resource_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resource_likes`
--

INSERT INTO `resource_likes` (`id`, `resource_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 3, 3, '2019-12-01 16:45:57', '2019-12-01 16:45:57'),
(2, 8, 1, '2019-12-05 13:30:41', '2019-12-05 13:30:41'),
(3, 4, 3, '2019-12-23 11:29:48', '2019-12-23 11:29:48'),
(4, 19, 1, '2019-12-24 18:34:28', '2019-12-24 18:34:28');

-- --------------------------------------------------------

--
-- Table structure for table `resource_reviews`
--

CREATE TABLE `resource_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `resource_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `review` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stars` int(1) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resource_reviews`
--

INSERT INTO `resource_reviews` (`id`, `resource_id`, `user_id`, `review`, `stars`, `status`, `created_at`, `updated_at`) VALUES
(1, 8, 1, 'werewfree', 1, 1, '2019-12-05 13:29:47', '2019-12-05 13:29:47'),
(2, 1, 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 3, 1, '2019-12-10 14:52:07', '2019-12-10 14:52:07'),
(3, 3, 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 5, 1, '2019-12-10 16:49:19', '2019-12-10 16:49:19'),
(4, 21, 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 3, 1, '2019-12-23 14:38:33', '2019-12-23 14:38:33');

-- --------------------------------------------------------

--
-- Table structure for table `resource_tag`
--

CREATE TABLE `resource_tag` (
  `resource_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resource_tag`
--

INSERT INTO `resource_tag` (`resource_id`, `tag_id`) VALUES
(3, 16),
(3, 21),
(1, 18),
(1, 21),
(1, 25),
(1, 27),
(4, 16),
(5, 16),
(6, 16),
(7, 16),
(8, 18),
(8, 21),
(20, 16),
(20, 17),
(20, 18),
(20, 33),
(20, 21),
(18, 16),
(18, 17),
(18, 18),
(18, 33),
(18, 23),
(19, 16),
(19, 17),
(19, 18),
(19, 33),
(19, 23),
(21, 16),
(21, 17),
(21, 18),
(21, 33),
(21, 27);

-- --------------------------------------------------------

--
-- Stand-in structure for view `res_like_count`
-- (See below for the actual view)
--
CREATE TABLE `res_like_count` (
`res_likes` bigint(21)
,`resource_id` int(10) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `res_view_count`
-- (See below for the actual view)
--
CREATE TABLE `res_view_count` (
`res_reviews` bigint(21)
,`resource_id` int(10) unsigned
,`stars` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', NULL, NULL),
(2, 'user', NULL, NULL),
(3, 'moderator', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 1, 1, '2019-12-09 07:33:16', '2019-12-09 07:33:16'),
(3, 2, 2, '2019-12-14 20:03:16', '2019-12-14 20:03:16'),
(5, 2, 4, NULL, NULL),
(6, 3, 5, '2019-12-05 11:52:51', '2019-12-05 11:52:51'),
(7, 2, 6, NULL, NULL),
(8, 2, 7, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `privacy_policy` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `terms_conditions` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `privacy_policy`, `terms_conditions`, `created_at`, `updated_at`) VALUES
(1, '<div id=\"lipsum\" style=\"margin: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><span style=\"color: rgb(0, 0, 10); font-family: &quot;Helvetica Neue&quot;; font-size: 11pt; text-align: start;\">This privacy policy applies between you, the User of this Website and Islamic Resource Hub, the owner and provider of this Website. Islamic Resource Hub takes the privacy of your information very seriously. This privacy policy applies to our use of any and all Data collected by us or provided by you in relation to your use of the Website.</span><br><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Please read this privacy policy carefully</span></b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">.</span><o:p></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Definitions and interpretation</span><o:p></o:p></h2><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">1.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">In this privacy policy, the following definitions are used:&nbsp;</span><o:p></o:p></p><table class=\"MsoNormalTable\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" style=\"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: -webkit-standard; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none; margin-left: 2.75pt; border-collapse: collapse; border: none;\"><tbody><tr><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border-top-width: 1pt; border-style: solid none; border-top-color: black; border-bottom-width: 1pt; border-bottom-color: black; padding: 2.75pt;\"><p class=\"DefinitionDescription\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Data</span></b><o:p></o:p></p></td><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border-top-width: 1pt; border-style: solid none; border-top-color: black; border-bottom-width: 1pt; border-bottom-color: black; padding: 2.75pt;\"><p class=\"DefinitionDescription\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">collectively all information that you submit to Islamic Resource Hub via the Website. This definition incorporates, where applicable, the definitions provided in the Data Protection Laws;</span><o:p></o:p></p></td></tr><tr><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border-style: none none solid; border-bottom-width: 1pt; border-bottom-color: black; padding: 2.75pt;\"><p class=\"DefinitionDescription\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Cookies</span></b><o:p></o:p></p></td><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border-style: none none solid; border-bottom-width: 1pt; border-bottom-color: black; padding: 2.75pt;\"><p class=\"DefinitionDescription\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">a small text file placed on your computer by this Website when you visit certain parts of the Website and/or when you use certain features of the Website. Details of the cookies used by this Website are set out in the clause below (</span><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Cookies</span></b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">);</span><o:p></o:p></p></td></tr><tr><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border-style: none none solid; border-bottom-width: 1pt; border-bottom-color: black; padding: 2.75pt;\"><p class=\"DefinitionDescription\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Data Protection Laws</span></b><o:p></o:p></p></td><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border-style: none none solid; border-bottom-width: 1pt; border-bottom-color: black; padding: 2.75pt;\"><p class=\"DefinitionDescription\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">any applicable law relating to the processing of personal Data, including but not limited to the Directive 96/46/EC (Data Protection Directive) or the GDPR, and any national implementing laws, regulations and secondary legislation, for as long as the GDPR is effective in the UK;</span><o:p></o:p></p></td></tr><tr><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border-style: none none solid; border-bottom-width: 1pt; border-bottom-color: black; padding: 2.75pt;\"><p class=\"DefinitionDescription\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">GDPR</span></b><o:p></o:p></p></td><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border-style: none none solid; border-bottom-width: 1pt; border-bottom-color: black; padding: 2.75pt;\"><p class=\"DefinitionDescription\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">the General Data Protection Regulation (EU) 2016/679;</span><o:p></o:p></p></td></tr><tr><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border-style: none none solid; border-bottom-width: 1pt; border-bottom-color: black; padding: 2.75pt;\"><p class=\"DefinitionDescription\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Islamic Resource Hub,</span></b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;or&nbsp;</span><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">us</span></b><o:p></o:p></p></td><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border-style: none none solid; border-bottom-width: 1pt; border-bottom-color: black; padding: 2.75pt;\"><p class=\"DefinitionDescription\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Islamic Resource Hub, a company incorporated in England and Wales with registered number _______________ whose registered office is at _______________, _______________;</span><o:p></o:p></p></td></tr><tr><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border-style: none none solid; border-bottom-width: 1pt; border-bottom-color: black; padding: 2.75pt;\"><p class=\"DefinitionDescription\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">UK and EU Cookie Law</span></b><o:p></o:p></p></td><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border-style: none none solid; border-bottom-width: 1pt; border-bottom-color: black; padding: 2.75pt;\"><p class=\"DefinitionDescription\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">the Privacy and Electronic Communications (EC Directive) Regulations 2003 as amended by the Privacy and Electronic Communications (EC Directive) (Amendment) Regulations 2011;</span><o:p></o:p></p></td></tr><tr><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border-style: none none solid; border-bottom-width: 1pt; border-bottom-color: black; padding: 2.75pt;\"><p class=\"DefinitionDescription\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">User</span></b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;or&nbsp;</span><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">you</span></b><o:p></o:p></p></td><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border-style: none none solid; border-bottom-width: 1pt; border-bottom-color: black; padding: 2.75pt;\"><p class=\"DefinitionDescription\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">any third party that accesses the Website and is not either (i) employed by Islamic Resource Hub and acting in the course of their employment or (ii) engaged as a consultant or otherwise providing services to Islamic Resource Hub and accessing the Website in connection with the provision of such services; and</span><o:p></o:p></p></td></tr><tr><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border-style: none none solid; border-bottom-width: 1pt; border-bottom-color: black; padding: 2.75pt;\"><p class=\"DefinitionDescription\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Website</span></b><o:p></o:p></p></td><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border-style: none none solid; border-bottom-width: 1pt; border-bottom-color: black; padding: 2.75pt;\"><p class=\"DefinitionDescription\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">the website that you are currently using, www.islamicresourcehub.com, and any sub-domains of this site unless expressly excluded by their own terms and conditions.</span><o:p></o:p></p></td></tr></tbody></table><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">2.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">In this privacy policy, unless the context requires a different interpretation:&nbsp;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">a.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">the singular includes the plural and vice versa;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">b.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">references to sub-clauses, clauses, schedules or appendices are to sub-clauses, clauses, schedules or appendices of this privacy policy;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">c.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">a reference to a person includes firms, companies, government entities, trusts and partnerships;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">d.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">\"including\" is understood to mean \"including without limitation\";</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">e.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">reference to any statutory provision includes any modification or amendment of it;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">f.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">the headings and sub-headings do not form part of this privacy policy.</span><o:p></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Scope of this privacy policy</span><o:p></o:p></h2><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">3.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">This privacy policy applies only to the actions of Islamic Resource Hub and Users with respect to this Website. It does not extend to any websites that can be accessed from this Website including, but not limited to, any links we may provide to social media websites.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">4.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">For purposes of the applicable Data Protection Laws, Islamic Resource Hub is the \"data controller\". This means that Islamic Resource Hub determines the purposes for which, and the manner in which, your Data is processed.</span><o:p></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Data collected</span><o:p></o:p></h2><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">5.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">We may collect the following Data, which includes personal Data, from you:&nbsp;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">a.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">name;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">b.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">contact Information such as email addresses and telephone numbers;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">c.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">demographic information such as postcode, preferences and interests;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">d.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">IP address (automatically collected);</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">e.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Records of actions performed on the website;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">f.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">in each case, in accordance with this privacy policy.</span><o:p></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">How we collect Data</span><o:p></o:p></h2><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">6.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">We collect Data in the following ways:&nbsp;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">a.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">data is given to us by you; and</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">b.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">data is collected automatically.</span><o:p></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Data that is given to us by you</span><o:p></o:p></h2><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">7.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Islamic Resource Hub will collect your Data in a number of ways, for example:&nbsp;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">a.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">when you contact us through the Website, by telephone, post, e-mail or through any other means;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">b.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">when you register with us and set up an account to receive our products/services;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">c.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">when you complete surveys that we use for research purposes (although you are not obliged to respond to them);</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">d.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">when you use our services;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">in each case, in accordance with this privacy policy.</span><o:p></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Data that is collected automatically</span><o:p></o:p></h2><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">8.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">To the extent that you access the Website, we will collect your Data automatically, for example:&nbsp;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">a.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">we automatically collect some information about your visit to the Website. This information helps us to make improvements to Website content and navigation, and includes your IP address, the date, times and frequency with which you access the Website and the way you use and interact with its content.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">b.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">we will collect your Data automatically via cookies, in line with the cookie settings on your browser. For more information about cookies, and how we use them on the Website, see the section below, headed \"Cookies\".</span><o:p></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Our use of Data</span><o:p></o:p></h2><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">9.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Any or all of the above Data may be required by us from time to time in order to provide you with the best possible service and experience when using our Website. Specifically, Data may be used by us for the following reasons:&nbsp;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">a.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">internal record keeping;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">b.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">improvement of our products / services;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">in each case, in accordance with this privacy policy.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">10.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">We may use your Data for the above purposes if we deem it necessary to do so for our legitimate interests. If you are not satisfied with this, you have the right to object in certain circumstances (see the section headed \"Your rights\" below).</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">11.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">When you register with us and set up an account to receive our services, the legal basis for this processing is the performance of a contract between you and us and/or taking steps, at your request, to enter into such a contract.</span><o:p></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Who we share Data with</span><o:p></o:p></h2><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">12.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">We may share your Data with the following groups of people for the following reasons:&nbsp;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">a.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">our employees, agents and/or professional advisors - for administration purposes and to obtain advice from professional advisers however under no circumstances will we share any information with third parties;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">in each case, in accordance with this privacy policy.</span><o:p></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Keeping Data secure</span><o:p></o:p></h2><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">13.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">We will use technical and organisational measures to safeguard your Data, for example:&nbsp;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">a.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">access to your account is controlled by a password and a user name that is unique to you.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">b.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">we store your Data on secure servers.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">14.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Technical and organisational measures include measures to deal with any suspected data breach. If you suspect any misuse or loss or unauthorised access to your Data, please let us know immediately by contacting us via this e-mail address: support@islamicresourcehub.com .</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">15.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">If you want detailed information from Get Safe Online on how to protect your information and your computers and devices against fraud, identity theft, viruses and many other online problems, please visit www.getsafeonline.org. Get Safe Online is supported by HM Government and leading businesses.</span><o:p></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Data retention</span><o:p></o:p></h2><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">16.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Unless a longer retention period is required or permitted by law, we will only hold your Data on our systems for the period necessary to fulfil the purposes outlined in this privacy policy or until you request that the Data be deleted.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">17.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Even if we delete your Data, it may persist on backup or archival media for legal, tax or regulatory purposes.</span><o:p></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Your rights</span><o:p></o:p></h2><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">18.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">You have the following rights in relation to your Data:&nbsp;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">a.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Right to access</span></b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">- the right to request (i) copies of the information we hold about you at any time, or (ii) that we modify, update or delete such information. If we provide you with access to the information we hold about you, we will not charge you for this, unless your request is \"manifestly unfounded or excessive.\" Where we are legally permitted to do so, we may refuse your request. If we refuse your request, we will tell you the reasons why.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">b.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Right to correct</span></b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">- the right to have your Data rectified if it is inaccurate or incomplete.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">c.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Right to erase</span></b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">- the right to request that we delete or remove your Data from our systems.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">d.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Right to restrict our use of your Data</span></b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">- the right to \"block\" us from using your Data or limit the way in which we can use it.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">e.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Right to data portability</span></b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">- the right to request that we move, copy or transfer your Data.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">f.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Right to object</span></b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">- the right to object to our use of your Data including where we use it for our legitimate interests.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">19.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">To make enquiries, exercise any of your rights set out above, or withdraw your consent to the processing of your Data (where consent is our legal basis for processing your Data), please contact us via this e-mail address: support@islamicresourcehub.com .</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">20.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">If you are not satisfied with the way a complaint you make in relation to your Data is handled by us, you may be able to refer your complaint to the relevant data protection authority. For the UK, this is the Information Commissioner\'s Office (ICO). The ICO\'s contact details can be found on their website at https://ico.org.uk/.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">21.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">It is important that the Data we hold about you is accurate and current. Please keep us informed if your Data changes during the period for which we hold it.</span><o:p></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Links to other websites</span><o:p></o:p></h2><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">22.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">This Website may, from time to time, provide links to other websites. We have no control over such websites and are not responsible for the content of these websites. This privacy policy does not extend to your use of such websites. You are advised to read the privacy policy or statement of other websites prior to using them.</span><o:p></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Changes of business ownership and control</span><o:p></o:p></h2><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">23.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Islamic Resource Hub may, from time to time, expand or reduce our business and this may involve the sale and/or the transfer of control of all or part of Islamic Resource Hub. Data provided by Users will, where it is relevant to any part of our business so transferred, be transferred along with that part and the new owner or newly controlling party will, under the terms of this privacy policy, be permitted to use the Data for the purposes for which it was originally supplied to us.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">24.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">We may also disclose Data to a prospective purchaser of our business or any part of it.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">25.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">In the above instances, we will take steps with the aim of ensuring your privacy is protected.</span><o:p></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Cookies</span><o:p></o:p></h2><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">26.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">This Website may place and access certain Cookies on your computer. Islamic Resource Hub uses Cookies to improve your experience of using the Website. Islamic Resource Hub has carefully chosen these Cookies and has taken steps to ensure that your privacy is protected and respected at all times.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">27.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">All Cookies used by this Website are used in accordance with current UK and EU Cookie Law.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">28.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Before the Website places Cookies on your computer, you will be presented with a message bar requesting your consent to set those Cookies. By giving your consent to the placing of Cookies, you are enabling Islamic Resource Hub to provide a better experience and service to you. You may, if you wish, deny consent to the placing of Cookies; however certain features of the Website may not function fully or as intended.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">29.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">This Website may place the following Cookies:</span><o:p></o:p></p><table class=\"MsoNormalTable\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" style=\"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: -webkit-standard; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none; margin-left: 2.75pt; border-collapse: collapse; border: none;\"><tbody><tr><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border: 1pt solid black; padding: 2.75pt;\"><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Type of Cookie</span></b><o:p></o:p></p></td><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border-top-width: 1pt; border-right-width: 1pt; border-bottom-width: 1pt; border-style: solid solid solid none; border-top-color: black; border-right-color: black; border-bottom-color: black; padding: 2.75pt;\"><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Purpose</span></b><o:p></o:p></p></td></tr><tr><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border-right-width: 1pt; border-bottom-width: 1pt; border-left-width: 1pt; border-style: none solid solid; border-right-color: black; border-bottom-color: black; border-left-color: black; padding: 2.75pt;\"><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Strictly necessary cookies</span><o:p></o:p></p></td><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border-style: none solid solid none; border-bottom-width: 1pt; border-bottom-color: black; border-right-width: 1pt; border-right-color: black; padding: 2.75pt;\"><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">These are cookies that are required for the operation of our website. They include, for example, cookies that enable you to log into secure areas of our website, use a shopping cart or make use of e-billing services.</span><o:p></o:p></p></td></tr></tbody></table><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">30.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">You can find a list of Cookies that we use in the Cookies Schedule.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">31.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">You can choose to enable or disable Cookies in your internet browser. By default, most internet browsers accept Cookies but this can be changed. For further details, please consult the help menu in your internet browser.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">32.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">You can choose to delete Cookies at any time; however you may lose any information that enables you to access the Website more quickly and efficiently including, but not limited to, personalisation settings.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">33.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">It is recommended that you ensure that your internet browser is up-to-date and that you consult the help and guidance provided by the developer of your internet browser if you are unsure about adjusting your privacy settings.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">34.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">For more information generally on cookies, including how to disable them, please refer to aboutcookies.org. You will also find details on how to delete cookies from your computer.</span><o:p></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">General</span><o:p></o:p></h2><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">35.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">You may not transfer any of your rights under this privacy policy to any other person. We may transfer our rights under this privacy policy where we reasonably believe your rights will not be affected.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">36.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">If any court or competent authority finds that any provision of this privacy policy (or part of any provision) is invalid, illegal or unenforceable, that provision or part-provision will, to the extent required, be deemed to be deleted, and the validity and enforceability of the other provisions of this privacy policy will not be affected.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">37.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Unless otherwise agreed, no delay, act or omission by a party in exercising any right or remedy will be deemed a waiver of that, or any other, right or remedy.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">38.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">This Agreement will be governed by and interpreted according to the law of England and Wales. All disputes arising under the Agreement will be subject to the exclusive jurisdiction of the English and Welsh courts.</span><o:p></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Changes to this privacy policy</span><o:p></o:p></h2><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">39.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Islamic Resource Hub reserves the right to change this privacy policy as we may deem necessary from time to time or as may be required by law. Any changes will be immediately posted on the Website and you are deemed to have accepted the terms of the privacy policy on your first use of the Website following the alterations.</span><br><br><span style=\"font-family: &quot;Helvetica Neue&quot;;\">You may contact Islamic Resource Hub by email at support@islamicresourcehub.com .</span><o:p></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Attribution</span><o:p></o:p></h2><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">40.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">This privacy policy was created using a document from Rocket Lawyer (https://www.rocketlawyer.co.uk).</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">27 October 2018</span></b><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none; break-before: page;\"><o:p><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Cookies</span><o:p></o:p></h2><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Below is a list of the cookies that we use. We have tried to ensure this is complete and up to date, but if you think that we have missed a cookie or there is any discrepancy, please let us know.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Strictly necessary</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">We use the following strictly necessary cookies:</span><o:p></o:p></p><table class=\"MsoNormalTable\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" style=\"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: -webkit-standard; font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none; margin-left: 2.75pt; border-collapse: collapse; border: none;\"><tbody><tr><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border: 1pt solid black; padding: 2.75pt;\"><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Description of Cookie</span></b><o:p></o:p></p></td><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border-top-width: 1pt; border-right-width: 1pt; border-bottom-width: 1pt; border-style: solid solid solid none; border-top-color: black; border-right-color: black; border-bottom-color: black; padding: 2.75pt;\"><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Purpose</span></b><o:p></o:p></p></td></tr><tr><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border-right-width: 1pt; border-bottom-width: 1pt; border-left-width: 1pt; border-style: none solid solid; border-right-color: black; border-bottom-color: black; border-left-color: black; padding: 2.75pt;\"><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">remember me</span><o:p></o:p></p></td><td width=\"446\" valign=\"top\" style=\"width: 334.2pt; border-style: none solid solid none; border-bottom-width: 1pt; border-bottom-color: black; border-right-width: 1pt; border-right-color: black; padding: 2.75pt;\"><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10);\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">for ease of signing in</span></p></td></tr></tbody></table><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; text-align: start;\"><o:p></o:p></p></div><style class=\"WebKit-mso-list-quirks-style\">\r\n<!--\r\n/* Style Definitions */\r\n p.MsoNormal, li.MsoNormal, div.MsoNormal\r\n	{mso-style-unhide:no;\r\n	mso-style-qformat:yes;\r\n	mso-style-parent:\"\";\r\n	margin-top:0cm;\r\n	margin-right:0cm;\r\n	margin-bottom:10.0pt;\r\n	margin-left:0cm;\r\n	line-height:115%;\r\n	mso-pagination:none;\r\n	mso-hyphenate:none;\r\n	font-size:11.0pt;\r\n	font-family:\"Times New Roman\",serif;\r\n	mso-fareast-font-family:\"AR PL KaitiM GB\";\r\n	color:#00000A;\r\n	mso-fareast-language:EN-GB;}\r\nh1\r\n	{mso-style-priority:9;\r\n	mso-style-unhide:no;\r\n	mso-style-qformat:yes;\r\n	mso-style-link:\"Heading 1 Char\";\r\n	mso-style-next:Normal;\r\n	margin-top:24.0pt;\r\n	margin-right:0cm;\r\n	margin-bottom:10.0pt;\r\n	margin-left:0cm;\r\n	text-align:center;\r\n	line-height:115%;\r\n	mso-pagination:lines-together;\r\n	page-break-after:avoid;\r\n	mso-outline-level:1;\r\n	mso-hyphenate:none;\r\n	font-size:20.0pt;\r\n	mso-bidi-font-size:14.0pt;\r\n	font-family:\"Times New Roman\",serif;\r\n	color:#00000A;\r\n	mso-font-kerning:0pt;\r\n	mso-fareast-language:EN-GB;}\r\nh2\r\n	{mso-style-priority:9;\r\n	mso-style-qformat:yes;\r\n	mso-style-link:\"Heading 2 Char\";\r\n	mso-style-next:Normal;\r\n	margin-top:10.0pt;\r\n	margin-right:0cm;\r\n	margin-bottom:10.0pt;\r\n	margin-left:0cm;\r\n	line-height:115%;\r\n	mso-pagination:lines-together;\r\n	page-break-after:avoid;\r\n	mso-outline-level:2;\r\n	mso-hyphenate:none;\r\n	font-size:13.0pt;\r\n	font-family:\"Times New Roman\",serif;\r\n	color:#00000A;\r\n	mso-fareast-language:EN-GB;}\r\nspan.Heading1Char\r\n	{mso-style-name:\"Heading 1 Char\";\r\n	mso-style-priority:9;\r\n	mso-style-unhide:no;\r\n	mso-style-locked:yes;\r\n	mso-style-link:\"Heading 1\";\r\n	mso-ansi-font-size:20.0pt;\r\n	mso-bidi-font-size:14.0pt;\r\n	color:#00000A;\r\n	font-weight:bold;}\r\nspan.Heading2Char\r\n	{mso-style-name:\"Heading 2 Char\";\r\n	mso-style-priority:9;\r\n	mso-style-unhide:no;\r\n	mso-style-locked:yes;\r\n	mso-style-link:\"Heading 2\";\r\n	mso-ansi-font-size:13.0pt;\r\n	mso-bidi-font-size:13.0pt;\r\n	color:#00000A;\r\n	font-weight:bold;}\r\np.DefinitionDescription, li.DefinitionDescription, div.DefinitionDescription\r\n	{mso-style-name:DefinitionDescription;\r\n	mso-style-unhide:no;\r\n	margin-top:0cm;\r\n	margin-right:0cm;\r\n	margin-bottom:10.0pt;\r\n	margin-left:0cm;\r\n	line-height:115%;\r\n	mso-pagination:none;\r\n	mso-hyphenate:none;\r\n	font-size:11.0pt;\r\n	font-family:\"Times New Roman\",serif;\r\n	mso-fareast-font-family:\"AR PL KaitiM GB\";\r\n	color:#00000A;\r\n	mso-fareast-language:EN-GB;}\r\n.MsoChpDefault\r\n	{mso-style-type:export-only;\r\n	mso-default-props:yes;\r\n	font-size:11.0pt;\r\n	mso-ansi-font-size:11.0pt;\r\n	mso-bidi-font-size:11.0pt;\r\n	mso-fareast-font-family:\"AR PL KaitiM GB\";\r\n	mso-fareast-language:EN-GB;}\r\n.MsoPapDefault\r\n	{mso-style-type:export-only;\r\n	line-height:115%;}\r\n@page WordSection1\r\n	{size:595.3pt 841.9pt;\r\n	margin:72.0pt 72.0pt 72.0pt 72.0pt;\r\n	mso-header-margin:36.0pt;\r\n	mso-footer-margin:36.0pt;\r\n	mso-paper-source:0;}\r\ndiv.WordSection1\r\n	{page:WordSection1;}\r\n /* List Definitions */\r\n @list l0\r\n	{mso-list-id:795296346;\r\n	mso-list-template-ids:1915665908;}\r\n@list l0:level1\r\n	{mso-level-suffix:space;\r\n	mso-level-text:\" %1\\.\";\r\n	mso-level-tab-stop:none;\r\n	mso-level-number-position:left;\r\n	margin-left:14.15pt;\r\n	text-indent:-14.15pt;}\r\n@list l0:level2\r\n	{mso-level-number-format:alpha-lower;\r\n	mso-level-suffix:space;\r\n	mso-level-text:\" %2\\.\";\r\n	mso-level-tab-stop:none;\r\n	mso-level-number-position:left;\r\n	margin-left:1.0cm;\r\n	text-indent:-14.15pt;}\r\n@list l0:level3\r\n	{mso-level-number-format:roman-lower;\r\n	mso-level-suffix:space;\r\n	mso-level-tab-stop:none;\r\n	mso-level-number-position:left;\r\n	margin-left:42.5pt;\r\n	text-indent:-14.15pt;\r\n	font-family:Symbol;\r\n	mso-bidi-font-family:Symbol;}\r\n@list l0:level4\r\n	{mso-level-number-format:bullet;\r\n	mso-level-suffix:space;\r\n	mso-level-text:;\r\n	mso-level-tab-stop:none;\r\n	mso-level-number-position:left;\r\n	margin-left:2.0cm;\r\n	text-indent:-14.15pt;\r\n	font-family:Symbol;\r\n	mso-bidi-font-family:Symbol;}\r\n@list l0:level5\r\n	{mso-level-number-format:bullet;\r\n	mso-level-suffix:space;\r\n	mso-level-text:;\r\n	mso-level-tab-stop:none;\r\n	mso-level-number-position:left;\r\n	margin-left:70.85pt;\r\n	text-indent:-14.15pt;\r\n	font-family:Symbol;\r\n	mso-bidi-font-family:Symbol;}\r\n@list l0:level6\r\n	{mso-level-number-format:bullet;\r\n	mso-level-suffix:space;\r\n	mso-level-text:;\r\n	mso-level-tab-stop:none;\r\n	mso-level-number-position:left;\r\n	margin-left:3.0cm;\r\n	text-indent:-14.15pt;\r\n	font-family:Symbol;\r\n	mso-bidi-font-family:Symbol;}\r\n@list l0:level7\r\n	{mso-level-number-format:bullet;\r\n	mso-level-suffix:space;\r\n	mso-level-text:;\r\n	mso-level-tab-stop:none;\r\n	mso-level-number-position:left;\r\n	margin-left:99.2pt;\r\n	text-indent:-14.15pt;\r\n	font-family:Symbol;\r\n	mso-bidi-font-family:Symbol;}\r\n@list l0:level8\r\n	{mso-level-number-format:bullet;\r\n	mso-level-suffix:space;\r\n	mso-level-text:;\r\n	mso-level-tab-stop:none;\r\n	mso-level-number-position:left;\r\n	margin-left:4.0cm;\r\n	text-indent:-14.15pt;\r\n	font-family:Symbol;\r\n	mso-bidi-font-family:Symbol;}\r\n@list l0:level9\r\n	{mso-level-number-format:bullet;\r\n	mso-level-suffix:space;\r\n	mso-level-text:;\r\n	mso-level-tab-stop:none;\r\n	mso-level-number-position:left;\r\n	margin-left:127.55pt;\r\n	text-indent:-14.15pt;\r\n	font-family:Symbol;\r\n	mso-bidi-font-family:Symbol;}\r\n\r\n-->\r\n</style>', '<div id=\"lipsum\" style=\"margin: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><h1 style=\"margin: 24pt 0cm 10pt; text-align: center; line-height: 30.666664123535156px; break-after: avoid-page; font-size: 20pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"color: rgb(0, 0, 10); font-size: 13pt; text-align: start; font-family: &quot;Helvetica Neue&quot;;\">Introduction</span><br></h1><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><o:p></o:p></h2><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">These terms and conditions apply between you, the User of this Website (including any sub-domains, unless expressly excluded by their own terms and conditions), and Islamic Resource Hub, the owner and operator of this Website. Please read these terms and conditions carefully, as they affect your legal rights. Your agreement to comply with and be bound by these terms and conditions is deemed to occur upon your first use of the Website. If you do not agree to be bound by these terms and conditions, you should stop using the Website immediately.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">In these terms and conditions,&nbsp;</span><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">User</span></b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">or&nbsp;</span><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Users</span></b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">means any third party that accesses the Website and is not either (i) employed by Islamic Resource Hub and acting in the course of their employment or (ii) engaged as a consultant or otherwise providing services to Islamic Resource Hub and accessing the Website in connection with the provision of such services.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">You must be at least 18 years of age to use this Website. By using the Website and agreeing to these terms and conditions, you represent and warrant that you are at least 18 years of age.</span><o:p></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Intellectual property and acceptable use</span><o:p></o:p></h2><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">1.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">All Content included on the Website, unless uploaded by Users, is the property of Islamic Resource Hub, our affiliates or other relevant third parties. In these terms and conditions, Content means any text, graphics, images, audio, video, software, data compilations, page layout, underlying code and software and any other form of information capable of being stored in a computer that appears on or forms part of this Website, including any such content uploaded by Users. By continuing to use the Website you acknowledge that such Content is protected by copyright, trademarks, database rights and other intellectual property rights. Nothing on this site shall be construed as granting, by implication, estoppel, or otherwise, any license or right to use any trademark, logo or service mark displayed on the site without the owner\'s prior written permission</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">2.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">You may, for your own personal, non-commercial use only, do the following:&nbsp;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">a.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">retrieve, display and view the Content on a computer screen</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">b.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">download and store the Content in electronic form on a disk (but not on any server or other storage device connected to a network)</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">c.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">print one copy of the Content</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">3.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">You must not otherwise reproduce, modify, copy, distribute or use for commercial purposes any Content without the written permission of Islamic Resource Hub.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">4.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">You acknowledge that you are responsible for any Content you may submit via the Website, including the legality, reliability, appropriateness, originality and copyright of any such Content. You may not upload to, distribute or otherwise publish through the Website any Content that (i) is confidential, proprietary, false, fraudulent, libellous, defamatory, obscene, threatening, invasive of privacy or publicity rights, infringing on intellectual property rights, abusive, illegal or otherwise objectionable; (ii) may constitute or encourage a criminal offence, violate the rights of any party or otherwise give rise to liability or violate any law; or (iii) may contain software viruses, political campaigning, chain letters, mass mailings, or any form of \"spam.\" You may not use a false email address or other identifying information, impersonate any person or entity or otherwise mislead as to the origin of any content. You may not upload commercial content onto the Website.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">5.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">You represent and warrant that you own or otherwise control all the rights to the Content you post; that the Content is accurate; that use of the Content you supply does not violate any provision of these terms and conditions and will not cause injury to any person; and that you will indemnify Islamic Resource Hub for all claims resulting from Content you supply.</span><o:p></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Prohibited use</span><o:p></o:p></h2><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">6.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">You may not use the Website for any of the following purposes:&nbsp;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">a.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">in any way which causes, or may cause, damage to the Website or interferes with any other person\'s use or enjoyment of the Website;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">b.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">in any way which is harmful, unlawful, illegal, abusive, harassing, threatening or otherwise objectionable or in breach of any applicable law, regulation, governmental order;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">c.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">making, transmitting or storing electronic copies of Content protected by copyright without the permission of the owner.</span><o:p></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Registration</span><o:p></o:p></h2><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">7.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">You must ensure that the details provided by you on registration or at any time are correct and complete.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">8.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">You must inform us immediately of any changes to the information that you provide when registering by updating your personal details to ensure we can communicate with you effectively.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">9.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">We may suspend or cancel your registration with immediate effect for any reasonable purposes or if you breach these terms and conditions.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">10.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">You may cancel your registration at any time by informing us in writing to the address at the end of these terms and conditions. If you do so, you must immediately stop using the Website. Cancellation or suspension of your registration does not affect any statutory rights.</span><o:p></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Password and security</span><o:p></o:p></h2><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">11.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">When you register on this Website, you will be asked to create a password, which you should keep confidential and not disclose or share with anyone.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">12.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">If we have reason to believe that there is or is likely to be any misuse of the Website or breach of security, we may require you to change your password or suspend your account.</span><o:p></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Links to other websites</span><o:p></o:p></h2><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">13.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">This Website may contain links to other sites. Unless expressly stated, these sites are not under the control of Islamic Resource Hub or that of our affiliates.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">14.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">We assume no responsibility for the content of such Websites and disclaim liability for any and all forms of loss or damage arising out of the use of them.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">15.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">The inclusion of a link to another site on this Website does not imply any endorsement of the sites themselves or of those in control of them.</span><o:p></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Availability of the Website and disclaimers</span><o:p></o:p></h2><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">16.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Any online facilities, tools, services or information that Islamic Resource Hub makes available through the Website (the&nbsp;</span><b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Service</span></b><span style=\"font-family: &quot;Helvetica Neue&quot;;\">) is provided \"as is\" and on an \"as available\" basis. We give no warranty that the Service will be free of defects and/or faults. To the maximum extent permitted by the law, we provide no warranties (express or implied) of fitness for a particular purpose, accuracy of information, compatibility and satisfactory quality. Islamic Resource Hub is under no obligation to update information on the Website.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">17.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Whilst Islamic Resource Hub uses reasonable endeavours to ensure that the Website is secure and free of errors, viruses and other malware, we give no warranty or guaranty in that regard and all Users take responsibility for their own security, that of their personal details and their computers.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">18.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Islamic Resource Hub accepts no liability for any disruption or non-availability of the Website.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">19.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Islamic Resource Hub reserves the right to alter, suspend or discontinue any part (or the whole of) the Website including, but not limited to, any products and/or services available. These terms and conditions shall continue to apply to any modified version of the Website unless it is expressly stated otherwise.</span><o:p></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Limitation of liability</span><o:p></o:p></h2><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">20.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Nothing in these terms and conditions will: (a) limit or exclude our or your liability for death or personal injury resulting from our or your negligence, as applicable; (b) limit or exclude our or your liability for fraud or fraudulent misrepresentation; or (c) limit or exclude any of our or your liabilities in any way that is not permitted under applicable law.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">21.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">We will not be liable to you in respect of any losses arising out of events beyond our reasonable control.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">22.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">To the maximum extent permitted by law, Islamic Resource Hub accepts no liability for any of the following:&nbsp;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">a.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">any business losses, such as loss of profits, income, revenue, anticipated savings, business, contracts, goodwill or commercial opportunities;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">b.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">loss or corruption of any data, database or software;</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:1.0cm;text-indent:-14.15pt;mso-list:l0 level2 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">c.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">any special, indirect or consequential loss or damage.</span><o:p></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">General</span><o:p></o:p></h2><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">23.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">You may not transfer any of your rights under these terms and conditions to any other person. We may transfer our rights under these terms and conditions where we reasonably believe your rights will not be affected.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">24.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">These terms and conditions may be varied by us from time to time. Such revised terms will apply to the Website from the date of publication. Users should check the terms and conditions regularly to ensure familiarity with the then current version.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">25.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">These terms and conditions contain the whole agreement between the parties relating to its subject matter and supersede all prior discussions, arrangements or agreements that might have taken place in relation to the terms and conditions.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">26.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">The Contracts (Rights of Third Parties) Act 1999 shall not apply to these terms and conditions and no third party will have any right to enforce or rely on any provision of these terms and conditions.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">27.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">If any court or competent authority finds that any provision of these terms and conditions (or part of any provision) is invalid, illegal or unenforceable, that provision or part-provision will, to the extent required, be deemed to be deleted, and the validity and enforceability of the other provisions of these terms and conditions will not be affected.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">28.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Unless otherwise agreed, no delay, act or omission by a party in exercising any right or remedy will be deemed a waiver of that, or any other, right or remedy.</span><o:p></o:p></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"mso-fareast-font-family:&quot;Times New Roman&quot;\"><span style=\"mso-list:Ignore\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;</span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">29.&nbsp;</span></span></span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">This Agreement shall be governed by and interpreted according to the law of England and Wales and all disputes arising under the Agreement (including non-contractual disputes or claims) shall be subject to the exclusive jurisdiction of the English and Welsh courts.</span><o:p></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Islamic Resource Hub details</span></h2><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">You can contact Islamic Resource Hub by email on admin@islamicresourcehub.com.</span><o:p></o:p></p><h2 style=\"margin: 10pt 0cm; line-height: 19.933334350585938px; break-after: avoid-page; font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif; color: rgb(0, 0, 10); font-style: normal; font-variant-caps: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">Attribution</span><o:p></o:p></h2><p style=\"margin-bottom: 15px; padding: 0px;\"><style class=\"WebKit-mso-list-quirks-style\"><span style=\"font-family: &quot;Helvetica Neue&quot;;\">\r\n&lt;!--\r\n/* Style Definitions */\r\n p.MsoNormal, li.MsoNormal, div.MsoNormal\r\n	{mso-style-unhide:no;\r\n	mso-style-qformat:yes;\r\n	mso-style-parent:\"\";\r\n	margin-top:0cm;\r\n	margin-right:0cm;\r\n	margin-bottom:10.0pt;\r\n	margin-left:0cm;\r\n	line-height:115%;\r\n	mso-pagination:none;\r\n	mso-hyphenate:none;\r\n	font-size:11.0pt;\r\n	font-family:\"Times New Roman\",serif;\r\n	mso-fareast-font-family:\"AR PL KaitiM GB\";\r\n	color:#00000A;\r\n	mso-fareast-language:EN-GB;}\r\nh1\r\n	{mso-style-priority:9;\r\n	mso-style-unhide:no;\r\n	mso-style-qformat:yes;\r\n	mso-style-link:\"Heading 1 Char\";\r\n	mso-style-next:Normal;\r\n	margin-top:24.0pt;\r\n	margin-right:0cm;\r\n	margin-bottom:10.0pt;\r\n	margin-left:0cm;\r\n	text-align:center;\r\n	line-height:115%;\r\n	mso-pagination:lines-together;\r\n	page-break-after:avoid;\r\n	mso-outline-level:1;\r\n	mso-hyphenate:none;\r\n	font-size:20.0pt;\r\n	mso-bidi-font-size:14.0pt;\r\n	font-family:\"Times New Roman\",serif;\r\n	color:#00000A;\r\n	mso-font-kerning:0pt;\r\n	mso-fareast-language:EN-GB;}\r\nh2\r\n	{mso-style-priority:9;\r\n	mso-style-qformat:yes;\r\n	mso-style-link:\"Heading 2 Char\";\r\n	mso-style-next:Normal;\r\n	margin-top:10.0pt;\r\n	margin-right:0cm;\r\n	margin-bottom:10.0pt;\r\n	margin-left:0cm;\r\n	line-height:115%;\r\n	mso-pagination:lines-together;\r\n	page-break-after:avoid;\r\n	mso-outline-level:2;\r\n	mso-hyphenate:none;\r\n	font-size:13.0pt;\r\n	font-family:\"Times New Roman\",serif;\r\n	color:#00000A;\r\n	mso-fareast-language:EN-GB;}\r\nspan.Heading1Char\r\n	{mso-style-name:\"Heading 1 Char\";\r\n	mso-style-priority:9;\r\n	mso-style-unhide:no;\r\n	mso-style-locked:yes;\r\n	mso-style-link:\"Heading 1\";\r\n	mso-ansi-font-size:20.0pt;\r\n	mso-bidi-font-size:14.0pt;\r\n	color:#00000A;\r\n	font-weight:bold;}\r\nspan.Heading2Char\r\n	{mso-style-name:\"Heading 2 Char\";\r\n	mso-style-priority:9;\r\n	mso-style-unhide:no;\r\n	mso-style-locked:yes;\r\n	mso-style-link:\"Heading 2\";\r\n	mso-ansi-font-size:13.0pt;\r\n	mso-bidi-font-size:13.0pt;\r\n	color:#00000A;\r\n	font-weight:bold;}\r\n.MsoChpDefault\r\n	{mso-style-type:export-only;\r\n	mso-default-props:yes;\r\n	font-size:11.0pt;\r\n	mso-ansi-font-size:11.0pt;\r\n	mso-bidi-font-size:11.0pt;\r\n	mso-fareast-font-family:\"AR PL KaitiM GB\";\r\n	mso-fareast-language:EN-GB;}\r\n.MsoPapDefault\r\n	{mso-style-type:export-only;\r\n	line-height:115%;}\r\n@page WordSection1\r\n	{size:595.3pt 841.9pt;\r\n	margin:72.0pt 72.0pt 72.0pt 72.0pt;\r\n	mso-header-margin:36.0pt;\r\n	mso-footer-margin:36.0pt;\r\n	mso-paper-source:0;}\r\ndiv.WordSection1\r\n	{page:WordSection1;}\r\n /* List Definitions */\r\n @list l0\r\n	{mso-list-id:2074693261;\r\n	mso-list-template-ids:1761406626;}\r\n@list l0:level1\r\n	{mso-level-suffix:space;\r\n	mso-level-text:\" %1\\.\";\r\n	mso-level-tab-stop:none;\r\n	mso-level-number-position:left;\r\n	margin-left:14.15pt;\r\n	text-indent:-14.15pt;}\r\n@list l0:level2\r\n	{mso-level-number-format:alpha-lower;\r\n	mso-level-suffix:space;\r\n	mso-level-text:\" %2\\.\";\r\n	mso-level-tab-stop:none;\r\n	mso-level-number-position:left;\r\n	margin-left:1.0cm;\r\n	text-indent:-14.15pt;}\r\n@list l0:level3\r\n	{mso-level-number-format:roman-lower;\r\n	mso-level-suffix:space;\r\n	mso-level-tab-stop:none;\r\n	mso-level-number-position:left;\r\n	margin-left:42.5pt;\r\n	text-indent:-14.15pt;\r\n	font-family:Symbol;\r\n	mso-bidi-font-family:Symbol;}\r\n@list l0:level4\r\n	{mso-level-number-format:bullet;\r\n	mso-level-suffix:space;\r\n	mso-level-text:;\r\n	mso-level-tab-stop:none;\r\n	mso-level-number-position:left;\r\n	margin-left:2.0cm;\r\n	text-indent:-14.15pt;\r\n	font-family:Symbol;\r\n	mso-bidi-font-family:Symbol;}\r\n@list l0:level5\r\n	{mso-level-number-format:bullet;\r\n	mso-level-suffix:space;\r\n	mso-level-text:;\r\n	mso-level-tab-stop:none;\r\n	mso-level-number-position:left;\r\n	margin-left:70.85pt;\r\n	text-indent:-14.15pt;\r\n	font-family:Symbol;\r\n	mso-bidi-font-family:Symbol;}\r\n@list l0:level6\r\n	{mso-level-number-format:bullet;\r\n	mso-level-suffix:space;\r\n	mso-level-text:;\r\n	mso-level-tab-stop:none;\r\n	mso-level-number-position:left;\r\n	margin-left:3.0cm;\r\n	text-indent:-14.15pt;\r\n	font-family:Symbol;\r\n	mso-bidi-font-family:Symbol;}\r\n@list l0:level7\r\n	{mso-level-number-format:bullet;\r\n	mso-level-suffix:space;\r\n	mso-level-text:;\r\n	mso-level-tab-stop:none;\r\n	mso-level-number-position:left;\r\n	margin-left:99.2pt;\r\n	text-indent:-14.15pt;\r\n	font-family:Symbol;\r\n	mso-bidi-font-family:Symbol;}\r\n@list l0:level8\r\n	{mso-level-number-format:bullet;\r\n	mso-level-suffix:space;\r\n	mso-level-text:;\r\n	mso-level-tab-stop:none;\r\n	mso-level-number-position:left;\r\n	margin-left:4.0cm;\r\n	text-indent:-14.15pt;\r\n	font-family:Symbol;\r\n	mso-bidi-font-family:Symbol;}\r\n@list l0:level9\r\n	{mso-level-number-format:bullet;\r\n	mso-level-suffix:space;\r\n	mso-level-text:;\r\n	mso-level-tab-stop:none;\r\n	mso-level-number-position:left;\r\n	margin-left:127.55pt;\r\n	text-indent:-14.15pt;\r\n	font-family:Symbol;\r\n	mso-bidi-font-family:Symbol;}\r\n\r\n--&gt;\r\n</span></style></p><p class=\"MsoNormal\" style=\"margin-left:14.15pt;text-indent:-14.15pt;mso-list:\r\nl0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-family: &quot;Helvetica Neue&quot;;\">&nbsp;31.&nbsp;</span><!--[endif]--><span dir=\"LTR\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;;\">These terms and conditions were created using a document from Rocket Lawyer (https://www.rocketlawyer.co.uk).</span><o:p></o:p></p></div>', '2019-04-08 00:06:50', '2019-04-08 15:09:20');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'kalyan.cmc@gmail.com', 1, '2019-12-10 12:47:39', '2019-12-10 12:47:39');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag_group` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `tag_group`, `name`, `description`, `order`, `created_at`, `updated_at`) VALUES
(16, 'Age Group', '3-5', NULL, 10, '2019-04-06 22:56:28', '2019-11-23 00:06:25'),
(17, 'Age Group', '5-7', NULL, 11, '2019-04-06 22:56:39', '2019-11-23 00:12:37'),
(18, 'Age Group', '7-11', NULL, 12, '2019-04-06 22:57:05', '2019-08-13 03:53:09'),
(21, 'Resource Type', 'PowerPoints', NULL, 1, '2019-04-06 23:03:59', '2019-04-06 23:03:59'),
(22, 'Resource Type', 'Activity Sheets', NULL, 2, '2019-04-06 23:04:21', '2019-04-06 23:04:21'),
(23, 'Resource Type', 'eBooks', NULL, 3, '2019-04-06 23:04:43', '2019-04-06 23:04:43'),
(24, 'Resource Type', 'Resource Packs', NULL, 4, '2019-04-06 23:05:13', '2019-04-06 23:05:13'),
(25, 'Resource Type', 'Activities and Games', NULL, 5, '2019-04-06 23:05:40', '2019-04-06 23:05:40'),
(27, 'Resource Type', 'Visual Aids', NULL, 6, '2019-04-06 23:06:58', '2019-04-06 23:06:58'),
(28, 'Resource Type', 'Lesson Plans', NULL, 7, '2019-04-06 23:07:37', '2019-04-06 23:08:22'),
(29, 'Resource Type', 'Display', NULL, 8, '2019-04-06 23:09:39', '2019-04-06 23:09:39'),
(30, 'Resource Type', 'Assessment', NULL, 9, '2019-04-06 23:10:16', '2019-04-06 23:10:16'),
(31, 'Resource Type', 'School Policies', NULL, 10, '2019-04-06 23:10:39', '2019-04-06 23:10:39'),
(32, 'Resource Type', 'Administration', NULL, 11, '2019-04-06 23:11:05', '2019-04-06 23:11:05'),
(33, 'Age Group', '11-14', NULL, 13, '2019-08-13 03:58:30', '2019-08-13 03:58:30');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `testimonial_by` text COLLATE utf8_unicode_ci NOT NULL,
  `testimonial_text` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `testimonial_by`, `testimonial_text`, `created_at`, `updated_at`) VALUES
(1, 'John Doe', '\"It\'s really wonderful. I don\'t know what else to say.\"', '2019-12-09 05:00:00', '2019-12-09 05:00:00'),
(2, 'John Doe', '\"It\'s really wonderful. I don\'t know what else to say.\"', '2019-12-09 05:00:00', '2019-12-09 05:00:00'),
(3, 'John Doe', '\"It\'s really wonderful. I don\'t know what else to say.\"', '2019-12-09 05:00:00', '2019-12-09 05:00:00'),
(4, 'John Doe', '\"It\'s really wonderful. I don\'t know what else to say.\"', '2019-12-09 05:00:00', '2019-12-09 05:00:00'),
(5, 'John Doe', '\"It\'s really wonderful. I don\'t know what else to say.\"', '2019-12-09 05:00:00', '2019-12-09 05:00:00'),
(6, 'John Doe', '\"It\'s really wonderful. I don\'t know what else to say.\"', '2019-12-09 05:00:00', '2019-12-09 05:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `working_in` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subjects` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_me` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_subscription` tinyint(4) NOT NULL DEFAULT 1,
  `private_info` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `saved_resources` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `followers` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `following` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twiter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_social` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hobbies` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verified` tinyint(4) NOT NULL DEFAULT 0,
  `validate` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `block` tinyint(4) DEFAULT 1,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `username`, `password`, `position`, `working_in`, `subjects`, `country`, `about_me`, `profile_picture`, `mail_subscription`, `private_info`, `saved_resources`, `followers`, `following`, `twiter`, `instagram`, `linkedin`, `fb`, `new_social`, `hobbies`, `verified`, `validate`, `status`, `block`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Kalyan', 'Debnath', 'kalyan.cmc@gmail.com', 'kalyan', '$2y$10$hlEQIaXIhO5HlLWvrQTCGunrTYhCH8bRKBnrLFNd6xXewFFzl49yG', 'Manager', NULL, 'Marketing', 'Afghanistan', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '1.png', 1, NULL, '5,3,6,19', '3', '3', NULL, NULL, NULL, NULL, NULL, 'Traveling', 0, 1, 1, 1, NULL, '0ouk85yNbKQUvjTcUi5q4vefeUHl89dfs1XBkKozpwBD6s2LL6c7I9jb8bsd', '2019-11-29 08:36:46', '2019-12-24 18:36:56'),
(2, 'Muhammad', 'Hussein', 'abdullah05@hotmail.co.uk', 'Abdullah', '$2y$10$lcqicMmSKCnkfJ2TQWISburAh.U7.9hXnKFMTrCayqXm0pZZmsFAC', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, NULL, NULL, '2019-11-29 13:17:16', '2020-01-03 03:34:30'),
(4, 'KALYAN', 'DEBNATH', 'kalyandebnath@live.com', 'kalyandeb', '$2y$10$5ILBj0CcXL3dISYS6pGRJujQ.gs71Zg25qIwvmH5HW4LKP1ogdgRK', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, NULL, NULL, '2019-11-29 16:57:35', '2019-11-29 16:59:57'),
(5, 'utsab', 'roy', 'utsab@synergicsoftek.com', 'utsab@synergicsoftek.com', '$2y$10$CbMOMXHniE3.Z3Jp/xqmDOmMq3KfgcFmDHFbT8DJ8uvUhYSp/MI12', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, NULL, NULL, '2019-12-05 16:41:24', '2019-12-05 16:41:35'),
(6, 'Test', 'Ing', 'ewart.fr@gmail.com', 'test', '$2y$10$Du0CCtxWgvsD3d8d1Ofdmuirq1s80l5vEcPbSmTlWlWR4165gZHWi', 'Headmaster', 'RGSHW', 'Science', 'Afghanistan', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,', '6.jpg', 1, 'I like to test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Testing websites', 0, 1, 1, 1, NULL, NULL, '2019-12-05 16:57:42', '2019-12-05 17:05:13'),
(7, 'muhammad', 'hussein', 'muhammadzakir05@hotmail.com', 'Muhammad Zakir', '$2y$10$rQUNJZJPSl5xywZEnv1Zu.seoGMS.b3GLPhTUbKTpZW4ptX9/uGlm', NULL, NULL, NULL, 'Afghanistan', NULL, NULL, 1, NULL, '6,7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, NULL, NULL, '2019-12-06 15:14:32', '2019-12-06 15:32:46');

-- --------------------------------------------------------

--
-- Table structure for table `user_resource_visit`
--

CREATE TABLE `user_resource_visit` (
  `id` int(10) UNSIGNED NOT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_resource_visit`
--

INSERT INTO `user_resource_visit` (`id`, `resource_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 3, 1, '2019-12-01 16:33:40', '2019-12-01 16:33:40'),
(2, 3, 3, '2019-12-01 16:44:21', '2019-12-01 16:44:21'),
(3, 1, 1, '2019-12-02 08:52:26', '2019-12-02 08:52:26'),
(4, 3, 1, '2019-12-02 10:51:27', '2019-12-02 10:51:27'),
(5, 1, 1, '2019-12-03 06:15:21', '2019-12-03 06:15:21'),
(7, 1, 1, '2019-12-04 18:16:31', '2019-12-04 18:16:31'),
(8, 3, 1, '2019-12-05 12:24:48', '2019-12-05 12:24:48'),
(9, 8, 1, '2019-12-05 12:27:09', '2019-12-05 12:27:09'),
(10, 3, 3, '2019-12-05 16:51:29', '2019-12-05 16:51:29'),
(11, 1, 6, '2019-12-05 17:06:50', '2019-12-05 17:06:50'),
(12, 4, 1, '2019-12-06 16:51:37', '2019-12-06 16:51:37'),
(13, 3, 3, '2019-12-09 18:00:37', '2019-12-09 18:00:37'),
(14, 5, 3, '2019-12-09 18:00:42', '2019-12-09 18:00:42'),
(15, 4, 3, '2019-12-09 18:00:50', '2019-12-09 18:00:50'),
(16, 6, 3, '2019-12-09 18:00:53', '2019-12-09 18:00:53'),
(17, 7, 3, '2019-12-09 18:00:57', '2019-12-09 18:00:57'),
(18, 1, 3, '2019-12-09 18:01:00', '2019-12-09 18:01:00'),
(19, 1, 1, '2019-12-10 12:40:47', '2019-12-10 12:40:47'),
(20, 1, 3, '2019-12-10 14:51:30', '2019-12-10 14:51:30'),
(21, 3, 3, '2019-12-10 16:48:58', '2019-12-10 16:48:58'),
(22, 3, 1, '2019-12-13 08:11:52', '2019-12-13 08:11:52'),
(23, 5, 3, '2019-12-19 18:26:00', '2019-12-19 18:26:00'),
(24, 4, 3, '2019-12-23 11:29:36', '2019-12-23 11:29:36'),
(25, 20, 3, '2019-12-23 11:30:11', '2019-12-23 11:30:11'),
(26, 21, 3, '2019-12-23 14:37:58', '2019-12-23 14:37:58'),
(27, 19, 1, '2019-12-24 18:33:53', '2019-12-24 18:33:53'),
(28, 21, 3, '2019-12-26 11:31:11', '2019-12-26 11:31:11'),
(29, 18, 1, '2019-12-27 15:05:55', '2019-12-27 15:05:55'),
(30, 20, 3, '2019-12-27 17:34:56', '2019-12-27 17:34:56'),
(31, 21, 3, '2019-12-27 17:35:11', '2019-12-27 17:35:11'),
(32, 18, 3, '2019-12-27 17:51:15', '2019-12-27 17:51:15'),
(33, 20, 1, '2019-12-29 13:41:08', '2019-12-29 13:41:08'),
(34, 19, 1, '2019-12-29 20:27:30', '2019-12-29 20:27:30'),
(35, 21, 1, '2019-12-29 21:16:48', '2019-12-29 21:16:48');

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE `visitors` (
  `id` int(10) UNSIGNED NOT NULL,
  `host` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `visitors`
--

INSERT INTO `visitors` (`id`, `host`, `created_at`, `updated_at`) VALUES
(1, '2405:204:400c:936e:3827:baea:587c:5c17', '2019-11-30 01:24:20', '2019-11-30 01:24:20'),
(2, '92.12.132.36', '2019-11-30 14:32:22', '2019-11-30 14:32:22'),
(3, '92.12.132.36', '2019-11-30 14:32:22', '2019-11-30 14:32:22'),
(4, '92.17.94.210', '2019-12-01 10:58:37', '2019-12-01 10:58:37'),
(5, '2405:204:4212:5e83::1627:88a4', '2019-12-01 11:40:15', '2019-12-01 11:40:15'),
(6, '2405:204:4298:1f8c:bbbd:d4d6:e41a:8ab9', '2019-12-01 12:12:03', '2019-12-01 12:12:03'),
(7, '2405:204:4212:5e83:2130:60dd:fe0a:1b03', '2019-12-01 14:13:46', '2019-12-01 14:13:46'),
(8, '202.142.65.175', '2019-12-01 16:06:56', '2019-12-01 16:06:56'),
(9, '202.142.82.108', '2019-12-02 08:50:51', '2019-12-02 08:50:51'),
(10, '92.17.94.210', '2019-12-02 10:05:10', '2019-12-02 10:05:10'),
(11, '122.176.27.53', '2019-12-02 10:37:30', '2019-12-02 10:37:30'),
(12, '2405:204:4298:1f8c:2e06:24a3:2271:8b70', '2019-12-02 12:50:25', '2019-12-02 12:50:25'),
(13, '122.176.27.53', '2019-12-03 05:45:55', '2019-12-03 05:45:55'),
(14, '202.142.65.247', '2019-12-03 05:57:09', '2019-12-03 05:57:09'),
(15, '202.142.65.132', '2019-12-03 07:22:59', '2019-12-03 07:22:59'),
(16, '92.17.94.210', '2019-12-03 10:24:20', '2019-12-03 10:24:20'),
(17, '202.142.82.102', '2019-12-03 10:40:05', '2019-12-03 10:40:05'),
(18, '85.255.232.226', '2019-12-03 13:42:05', '2019-12-03 13:42:05'),
(19, '202.142.82.102', '2019-12-04 02:14:44', '2019-12-04 02:14:44'),
(20, '122.176.27.53', '2019-12-04 05:48:47', '2019-12-04 05:48:47'),
(21, '78.141.41.212', '2019-12-04 14:52:06', '2019-12-04 14:52:06'),
(22, '202.142.65.254', '2019-12-11 21:04:33', '2019-12-11 21:04:33'),
(23, '78.141.41.212', '2019-12-11 21:34:36', '2019-12-11 21:34:36'),
(24, '202.142.65.180', '2019-12-12 07:15:23', '2019-12-12 07:15:23'),
(25, '122.176.27.53', '2019-12-12 10:05:16', '2019-12-12 10:05:16'),
(26, '136.232.64.10', '2019-12-12 11:52:43', '2019-12-12 11:52:43'),
(27, '78.141.41.212', '2019-12-12 13:18:26', '2019-12-12 13:18:26'),
(28, '117.227.44.166', '2019-12-12 16:14:02', '2019-12-12 16:14:02'),
(29, '92.12.130.19', '2019-12-12 16:40:57', '2019-12-12 16:40:57'),
(30, '85.255.235.211', '2019-12-12 20:25:13', '2019-12-12 20:25:13'),
(31, '202.142.82.100', '2019-12-12 21:26:01', '2019-12-12 21:26:01'),
(32, '202.142.65.196', '2019-12-13 08:03:43', '2019-12-13 08:03:43'),
(33, '2a03:2880:30ff:17::face:b00c', '2019-12-13 08:12:58', '2019-12-13 08:12:58'),
(34, '122.176.27.53', '2019-12-13 10:56:57', '2019-12-13 10:56:57'),
(35, '78.141.41.212', '2019-12-13 14:28:30', '2019-12-13 14:28:30'),
(36, '136.232.64.10', '2019-12-13 16:58:22', '2019-12-13 16:58:22'),
(37, '2409:4060:2082:b5f9:9590:9a14:8660:bf6f', '2019-12-13 17:15:14', '2019-12-13 17:15:14'),
(38, '202.142.101.8', '2019-12-13 17:30:48', '2019-12-13 17:30:48'),
(39, '148.252.128.239', '2019-12-13 22:17:11', '2019-12-13 22:17:11'),
(40, '2.98.236.91', '2019-12-14 21:55:26', '2019-12-14 21:55:26'),
(41, '92.12.130.19', '2019-12-14 23:17:24', '2019-12-14 23:17:24'),
(42, '92.12.130.19', '2019-12-15 13:20:12', '2019-12-15 13:20:12'),
(43, '202.142.82.56', '2019-12-15 23:04:27', '2019-12-15 23:04:27'),
(44, '202.142.101.33', '2019-12-17 09:59:11', '2019-12-17 09:59:11'),
(45, '122.176.27.53', '2019-12-17 10:02:08', '2019-12-17 10:02:08'),
(46, '64.233.173.48', '2019-12-17 10:16:08', '2019-12-17 10:16:08'),
(47, '2405:204:439b:cdc3:646a:e385:e0de:e63c', '2019-12-17 10:45:40', '2019-12-17 10:45:40'),
(48, '92.12.130.19', '2019-12-17 16:45:45', '2019-12-17 16:45:45'),
(49, '2405:204:439b:cdc3:2865:f423:a20f:aa12', '2019-12-18 10:47:19', '2019-12-18 10:47:19'),
(50, '122.176.27.53', '2019-12-18 11:30:20', '2019-12-18 11:30:20'),
(51, '78.141.41.212', '2019-12-18 13:37:49', '2019-12-18 13:37:49'),
(52, '64.233.173.50', '2019-12-18 15:24:46', '2019-12-18 15:24:46'),
(53, '202.142.101.74', '2019-12-18 16:40:48', '2019-12-18 16:40:48'),
(54, '136.232.64.10', '2019-12-18 17:55:00', '2019-12-18 17:55:00'),
(55, '2409:4060:209:136b:13e5:8ebe:e093:3c80', '2019-12-18 18:09:44', '2019-12-18 18:09:44'),
(56, '92.12.130.19', '2019-12-19 03:10:44', '2019-12-19 03:10:44'),
(57, '122.176.27.53', '2019-12-19 12:32:15', '2019-12-19 12:32:15'),
(58, '202.142.101.71', '2019-12-19 13:07:53', '2019-12-19 13:07:53'),
(59, '2409:4060:209:136b:13e5:8ebe:e093:3c80', '2019-12-19 13:48:47', '2019-12-19 13:48:47'),
(60, '78.141.41.212', '2019-12-19 16:15:17', '2019-12-19 16:15:17'),
(61, '85.255.235.131', '2019-12-19 16:49:42', '2019-12-19 16:49:42'),
(62, '136.232.64.10', '2019-12-19 16:51:34', '2019-12-19 16:51:34'),
(63, '86.1.15.187', '2019-12-19 18:25:10', '2019-12-19 18:25:10'),
(64, '89.238.130.202', '2019-12-19 23:14:24', '2019-12-19 23:14:24'),
(65, '2409:4060:209:136b:87b9:cc4:c319:8eb2', '2019-12-20 11:22:56', '2019-12-20 11:22:56'),
(66, '136.232.64.10', '2019-12-20 11:53:16', '2019-12-20 11:53:16'),
(67, '122.176.27.53', '2019-12-20 11:57:26', '2019-12-20 11:57:26'),
(68, '223.191.51.209', '2019-12-20 12:08:03', '2019-12-20 12:08:03'),
(69, '85.255.237.230', '2019-12-20 13:22:55', '2019-12-20 13:22:55'),
(70, '185.195.202.198', '2019-12-20 13:30:26', '2019-12-20 13:30:26'),
(71, '2a01:4c8:80c:c67f:c4e3:5f73:529c:308b', '2019-12-20 14:16:28', '2019-12-20 14:16:28'),
(72, '202.142.65.228', '2019-12-21 12:42:39', '2019-12-21 12:42:39'),
(73, '31.50.196.87', '2019-12-21 16:19:17', '2019-12-21 16:19:17'),
(74, '2409:4060:209:136b:87b9:cc4:c319:8eb2', '2019-12-21 18:34:17', '2019-12-21 18:34:17'),
(75, '78.145.48.92', '2019-12-22 13:16:29', '2019-12-22 13:16:29'),
(76, '5.226.139.22', '2019-12-22 14:39:44', '2019-12-22 14:39:44'),
(77, '185.69.145.132', '2019-12-22 23:39:36', '2019-12-22 23:39:36'),
(78, '31.50.196.87', '2019-12-22 23:50:39', '2019-12-22 23:50:39'),
(79, '122.176.27.53', '2019-12-23 10:30:12', '2019-12-23 10:30:12'),
(80, '2a01:4c8:2b:1a38:71d1:7ffd:3568:9b7d', '2019-12-23 12:24:34', '2019-12-23 12:24:34'),
(81, '185.69.145.132', '2019-12-23 12:34:05', '2019-12-23 12:34:05'),
(82, '31.50.196.87', '2019-12-23 13:50:39', '2019-12-23 13:50:39'),
(83, '202.142.65.192', '2019-12-24 09:56:30', '2019-12-24 09:56:30'),
(84, '85.255.234.221', '2019-12-24 12:18:44', '2019-12-24 12:18:44'),
(85, '122.176.27.53', '2019-12-24 14:11:31', '2019-12-24 14:11:31'),
(86, '185.108.105.21', '2019-12-24 15:33:40', '2019-12-24 15:33:40'),
(87, '31.50.196.87', '2019-12-24 16:19:06', '2019-12-24 16:19:06'),
(88, '5.226.139.66', '2019-12-25 01:04:36', '2019-12-25 01:04:36'),
(89, '31.50.196.87', '2019-12-26 00:33:36', '2019-12-26 00:33:36'),
(90, '122.176.27.53', '2019-12-26 10:48:22', '2019-12-26 10:48:22'),
(91, '5.226.139.66', '2019-12-26 17:36:51', '2019-12-26 17:36:51'),
(92, '85.255.237.204', '2019-12-26 18:13:42', '2019-12-26 18:13:42'),
(93, '2401:4900:3149:ba4f:1235:1d2d:c5c1:2c78', '2019-12-27 03:13:30', '2019-12-27 03:13:30'),
(94, '185.108.105.4', '2019-12-27 05:33:30', '2019-12-27 05:33:30'),
(95, '122.176.27.53', '2019-12-27 10:05:45', '2019-12-27 10:05:45'),
(96, '31.50.196.87', '2019-12-27 13:01:03', '2019-12-27 13:01:03'),
(97, '109.151.181.110', '2019-12-27 14:08:18', '2019-12-27 14:08:18'),
(98, '2409:4060:2014:a4a8:a217:d548:c920:9397', '2019-12-27 16:45:12', '2019-12-27 16:45:12'),
(99, '109.151.181.110', '2019-12-28 13:40:26', '2019-12-28 13:40:26'),
(100, '202.142.65.180', '2019-12-28 20:52:58', '2019-12-28 20:52:58'),
(101, '109.151.181.110', '2019-12-29 13:18:19', '2019-12-29 13:18:19'),
(102, '185.69.145.171', '2019-12-29 19:16:07', '2019-12-29 19:16:07'),
(103, '185.108.105.21', '2019-12-29 19:26:00', '2019-12-29 19:26:00'),
(104, '202.142.101.103', '2019-12-29 20:26:39', '2019-12-29 20:26:39');

-- --------------------------------------------------------

--
-- Structure for view `notices_view`
--
DROP TABLE IF EXISTS `notices_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `notices_view`  AS  select count(`notices`.`user_id`) AS `total_notice`,`notices`.`user_id` AS `user_id` from `notices` group by `notices`.`user_id` ;

-- --------------------------------------------------------

--
-- Structure for view `res_like_count`
--
DROP TABLE IF EXISTS `res_like_count`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `res_like_count`  AS  select count(`resource_likes`.`resource_id`) AS `res_likes`,`resource_likes`.`resource_id` AS `resource_id` from `resource_likes` group by `resource_likes`.`resource_id` ;

-- --------------------------------------------------------

--
-- Structure for view `res_view_count`
--
DROP TABLE IF EXISTS `res_view_count`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `res_view_count`  AS  select count(`resource_reviews`.`resource_id`) AS `res_reviews`,`resource_reviews`.`resource_id` AS `resource_id`,sum(`resource_reviews`.`stars`) AS `stars` from `resource_reviews` group by `resource_reviews`.`resource_id` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_index` (`user_id`),
  ADD KEY `comments_resource_id_index` (`resource_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `donations`
--
ALTER TABLE `donations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq_main`
--
ALTER TABLE `faq_main`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq_sub`
--
ALTER TABLE `faq_sub`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mail_settings`
--
ALTER TABLE `mail_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_chat_id_index` (`chat_id`(191)),
  ADD KEY `messages_user_from_index` (`user_from`),
  ADD KEY `messages_user_to_index` (`user_to`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`(191));

--
-- Indexes for table `profile_view`
--
ALTER TABLE `profile_view`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resources_user_id_index` (`user_id`),
  ADD KEY `resources_category_id_index` (`category_id`);

--
-- Indexes for table `resource_categories`
--
ALTER TABLE `resource_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resource_download`
--
ALTER TABLE `resource_download`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resource_flags`
--
ALTER TABLE `resource_flags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resource_flags_resource_id_index` (`resource_id`),
  ADD KEY `resource_flags_user_id_index` (`user_id`);

--
-- Indexes for table `resource_likes`
--
ALTER TABLE `resource_likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resource_reviews`
--
ALTER TABLE `resource_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resource_tag`
--
ALTER TABLE `resource_tag`
  ADD KEY `resource_id` (`resource_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_resource_visit`
--
ALTER TABLE `user_resource_visit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `donations`
--
ALTER TABLE `donations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faq_main`
--
ALTER TABLE `faq_main`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `faq_sub`
--
ALTER TABLE `faq_sub`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `mail_settings`
--
ALTER TABLE `mail_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `profile_view`
--
ALTER TABLE `profile_view`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `resources`
--
ALTER TABLE `resources`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `resource_categories`
--
ALTER TABLE `resource_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `resource_download`
--
ALTER TABLE `resource_download`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `resource_flags`
--
ALTER TABLE `resource_flags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `resource_likes`
--
ALTER TABLE `resource_likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `resource_reviews`
--
ALTER TABLE `resource_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_resource_visit`
--
ALTER TABLE `user_resource_visit`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
