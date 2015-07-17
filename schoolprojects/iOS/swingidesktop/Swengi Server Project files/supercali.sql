-- phpMyAdmin SQL Dump
-- version 3.3.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 15, 2011 at 12:04 PM
-- Server version: 5.1.54
-- PHP Version: 5.3.5-1ubuntu7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `supercali`
--

-- --------------------------------------------------------

--
-- Table structure for table `alarm`
--

CREATE TABLE IF NOT EXISTS `alarm` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `event` text COLLATE utf8_unicode_ci NOT NULL,
  `event_date` date NOT NULL,
  `alarm_time` time NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `alarm`
--



-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `category_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `sub_of` int(6) unsigned NOT NULL DEFAULT '1',
  `sequence` int(2) unsigned NOT NULL DEFAULT '1',
  `restricted` int(1) unsigned NOT NULL DEFAULT '0',
  `description` text,
  `color` varchar(30) DEFAULT NULL,
  `background` varchar(255) DEFAULT '',
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `categories`
--



-- --------------------------------------------------------

--
-- Table structure for table `dates`
--

CREATE TABLE IF NOT EXISTS `dates` (
  `event_id` int(8) unsigned DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dates`
--


-- --------------------------------------------------------

--
-- Table structure for table `events`
--
DROP TABLE IF EXISTS `events`;
CREATE TABLE IF NOT EXISTS `events` (
  `event_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `venue_id` int(6) unsigned NOT NULL DEFAULT '1',
  `contact_id` int(6) unsigned NOT NULL DEFAULT '1',
  `description` text,
  `category_id` int(6) unsigned NOT NULL DEFAULT '1',
  `user_id` int(6) unsigned DEFAULT NULL,
  `group_id` int(6) unsigned NOT NULL DEFAULT '1',
  `status_id` int(1) unsigned NOT NULL DEFAULT '1',
  `stamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `quick_approve` varchar(32) DEFAULT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=248 ;

--
-- Dumping data for table `events`
--


--
-- Triggers `events`
--

DROP TRIGGER IF EXISTS `after_insert_events`;
DELIMITER //
CREATE TRIGGER `after_insert_events` AFTER INSERT ON `events`
 FOR EACH ROW BEGIN

INSERT INTO trigger_updates(event_id, title, user_id, stamp, date)  

        VALUES (NEW.event_id, NEW.title, NEW.user_id, NEW.stamp, NEW.date);

END
//

DELIMITER ;
DROP TRIGGER IF EXISTS `after_update_trigger`;
DELIMITER //
CREATE TRIGGER `after_update_trigger` AFTER UPDATE ON `events`
 FOR EACH ROW BEGIN

INSERT INTO trigger_updates(event_id, title, user_id, stamp, date, updated)  

        VALUES (NEW.event_id, NEW.title, NEW.user_id, NEW.stamp, NEW.date, 1);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `geolocation`
--

CREATE TABLE IF NOT EXISTS `geolocation` (
  `event_id` int(8) DEFAULT NULL,
  `user_id` int(6) DEFAULT NULL,
  `latitude` decimal(10,6) DEFAULT NULL,
  `longitude` decimal(10,6) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `geolocation`
--


-- --------------------------------------------------------

--
-- Stand-in structure for view `get_event`
--
CREATE TABLE IF NOT EXISTS `get_event` (
`event_id` int(8) unsigned
,`title` varchar(255)
,`venue_id` int(6) unsigned
,`contact_id` int(6) unsigned
,`description` text
,`category_id` int(6) unsigned
,`user_id` int(6) unsigned
,`group_id` int(6) unsigned
,`status_id` int(1) unsigned
,`stamp` timestamp
,`date_event_id` int(8) unsigned
,`date` datetime
,`end_date` datetime
,`geo_event_id` int(8)
,`geo_user_id` int(6)
,`latitude` decimal(10,6)
,`longitude` decimal(10,6)
);
-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `group_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `sub_of` int(6) unsigned NOT NULL DEFAULT '1',
  `sequence` int(2) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `groups`
--


-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE IF NOT EXISTS `links` (
  `link_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `company` varchar(50) DEFAULT NULL,
  `address1` varchar(40) DEFAULT NULL,
  `address2` varchar(40) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `fax` varchar(15) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `url` varchar(120) DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`link_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `links`
--



-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE IF NOT EXISTS `modules` (
  `module_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `link_name` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(60) NOT NULL DEFAULT '',
  `active` int(1) unsigned NOT NULL DEFAULT '0',
  `sequence` int(2) unsigned NOT NULL DEFAULT '1',
  `script` varchar(60) DEFAULT NULL,
  `year` int(2) unsigned DEFAULT NULL,
  `month` int(2) unsigned DEFAULT NULL,
  `week` int(2) unsigned DEFAULT NULL,
  `day` int(2) unsigned DEFAULT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `modules`
--


-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE IF NOT EXISTS `tokens` (
  `token_id` int(11) NOT NULL AUTO_INCREMENT,
  `token_no` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`token_id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `tokens`
--


-- --------------------------------------------------------

--
-- Table structure for table `trigger_updates`
--

CREATE TABLE IF NOT EXISTS `trigger_updates` (
  `event_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date` datetime NOT NULL,
  `checked` int(1) NOT NULL DEFAULT '0',
  `updated` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trigger_updates`
--



-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `password` varchar(32) NOT NULL DEFAULT '',
  `temp_password` varchar(32) DEFAULT NULL,
  `email` varchar(80) NOT NULL DEFAULT '',
  `view` int(1) unsigned NOT NULL DEFAULT '0',
  `post` int(1) unsigned NOT NULL DEFAULT '0',
  `add_users` int(1) unsigned NOT NULL DEFAULT '0',
  `add_categories` int(1) unsigned NOT NULL DEFAULT '0',
  `add_groups` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `users`
--


-- --------------------------------------------------------

--
-- Table structure for table `users_to_categories`
--

CREATE TABLE IF NOT EXISTS `users_to_categories` (
  `user_id` int(6) unsigned NOT NULL DEFAULT '0',
  `category_id` int(6) unsigned NOT NULL DEFAULT '0',
  `moderate` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_to_categories`
--



-- --------------------------------------------------------

--
-- Table structure for table `users_to_groups`
--

CREATE TABLE IF NOT EXISTS `users_to_groups` (
  `user_id` int(6) unsigned NOT NULL DEFAULT '0',
  `group_id` int(6) unsigned NOT NULL DEFAULT '0',
  `moderate` int(1) NOT NULL DEFAULT '0',
  `subscribe` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_to_groups`
--



-- --------------------------------------------------------

--
-- Structure for view `get_event`
--
DROP TABLE IF EXISTS `get_event`;

CREATE ALGORITHM=UNDEFINED DEFINER=`swengi11`@`localhost` SQL SECURITY DEFINER VIEW `get_event` AS select `events`.`event_id` AS `event_id`,`events`.`title` AS `title`,`events`.`venue_id` AS `venue_id`,`events`.`contact_id` AS `contact_id`,`events`.`description` AS `description`,`events`.`category_id` AS `category_id`,`events`.`user_id` AS `user_id`,`events`.`group_id` AS `group_id`,`events`.`status_id` AS `status_id`,`events`.`stamp` AS `stamp`,`dates`.`event_id` AS `date_event_id`,`dates`.`date` AS `date`,`dates`.`end_date` AS `end_date`,`geolocation`.`event_id` AS `geo_event_id`,`geolocation`.`user_id` AS `geo_user_id`,`geolocation`.`latitude` AS `latitude`,`geolocation`.`longitude` AS `longitude` from ((`events` left join `dates` on((`events`.`event_id` = `dates`.`event_id`))) left join `geolocation` on((`geolocation`.`event_id` = `events`.`event_id`)));
