-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02-Abr-2024 às 02:00
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `real`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `password` char(40) NOT NULL,
  `secret` char(16) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT 1,
  `premium_ends_at` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `email` varchar(255) NOT NULL DEFAULT '',
  `created` int(11) NOT NULL DEFAULT 0,
  `creation` int(11) NOT NULL DEFAULT 0,
  `key` varchar(64) NOT NULL DEFAULT '',
  `create_ip` int(11) NOT NULL DEFAULT 0,
  `premium_points` int(11) NOT NULL DEFAULT 0,
  `page_access` int(11) NOT NULL DEFAULT 0,
  `location` varchar(255) DEFAULT NULL,
  `country` varchar(3) NOT NULL DEFAULT '',
  `web_lastlogin` int(11) NOT NULL DEFAULT 0,
  `web_flags` int(11) NOT NULL DEFAULT 0,
  `email_hash` varchar(32) NOT NULL DEFAULT '',
  `email_verified` tinyint(1) NOT NULL DEFAULT 0,
  `rlname` varchar(100) DEFAULT NULL,
  `email_new` varchar(255) DEFAULT NULL,
  `email_new_time` int(11) DEFAULT NULL,
  `email_code` varchar(50) DEFAULT NULL,
  `email_next` int(11) NOT NULL DEFAULT 0,
  `last_post` datetime DEFAULT NULL,
  `flag` varchar(50) DEFAULT NULL,
  `vote` int(11) NOT NULL DEFAULT 0,
  `next_email` int(11) NOT NULL DEFAULT 0,
  `create_date` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `password`, `secret`, `type`, `premium_ends_at`, `email`, `created`, `creation`, `key`, `create_ip`, `premium_points`, `page_access`, `location`, `country`, `web_lastlogin`, `web_flags`, `email_hash`, `email_verified`, `rlname`, `email_new`, `email_new_time`, `email_code`, `email_next`, `last_post`, `flag`, `vote`, `next_email`, `create_date`) VALUES
(2, 'god2', '21298df8a3277357ee55b01df9530b535cf08ec1', NULL, 6, 0, 'god@god', 1712013385, 0, '', 0, 0, 0, '', 'us', 0, 3, '', 0, '', NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 0),
(3, '1', '21298df8a3277357ee55b01df9530b535cf08ec1', NULL, 6, 0, 'god@god', 0, 1712015478, '', 2130706433, 0, 3, '', '', 0, 0, '', 0, '', '', 0, '', 0, '0000-00-00 00:00:00', 'pl', 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `account_bans`
--

CREATE TABLE `account_bans` (
  `account_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `account_ban_history`
--

CREATE TABLE `account_ban_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expired_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `account_storage`
--

CREATE TABLE `account_storage` (
  `account_id` int(11) NOT NULL,
  `key` int(10) UNSIGNED NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `account_viplist`
--

CREATE TABLE `account_viplist` (
  `account_id` int(11) NOT NULL COMMENT 'id of account whose viplist entry it is',
  `player_id` int(11) NOT NULL COMMENT 'id of target player of viplist entry',
  `description` varchar(128) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auction_system`
--

CREATE TABLE `auction_system` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_id` smallint(6) NOT NULL,
  `count` smallint(5) NOT NULL,
  `value` int(7) NOT NULL,
  `date` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `boost_creature`
--

CREATE TABLE `boost_creature` (
  `name` varchar(255) NOT NULL,
  `exp` int(11) NOT NULL DEFAULT 0,
  `loot` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `boost_creature`
--

INSERT INTO `boost_creature` (`name`, `exp`, `loot`) VALUES
('Frost dragon', 33, 34);

-- --------------------------------------------------------

--
-- Estrutura da tabela `boss_room`
--

CREATE TABLE `boss_room` (
  `room_id` int(2) NOT NULL,
  `guid_player` varchar(32) NOT NULL,
  `time` int(11) NOT NULL,
  `to_time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `castle`
--

CREATE TABLE `castle` (
  `name` varchar(255) NOT NULL,
  `guild_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `castle_48`
--

CREATE TABLE `castle_48` (
  `guild_id` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `coinbase_payments`
--

CREATE TABLE `coinbase_payments` (
  `id` int(11) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `code` varchar(180) NOT NULL,
  `amount` varchar(10) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `created_at` int(10) NOT NULL,
  `updated_at` int(10) NOT NULL,
  `expires_at` int(10) NOT NULL,
  `payment_url` varchar(180) NOT NULL,
  `payment_data` text NOT NULL,
  `payment_timeline` text DEFAULT NULL,
  `points` int(10) NOT NULL,
  `points_delivered` int(10) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `exclusive_hunts`
--

CREATE TABLE `exclusive_hunts` (
  `hunt_id` int(2) NOT NULL,
  `guid_player` varchar(32) NOT NULL,
  `time` int(11) NOT NULL,
  `to_time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `exclusive_hunts`
--

INSERT INTO `exclusive_hunts` (`hunt_id`, `guid_player`, `time`, `to_time`) VALUES
(20000, '0', 0, 0),
(20001, '0', 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `guilds`
--

CREATE TABLE `guilds` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `ownerid` int(11) NOT NULL,
  `creationdata` int(11) NOT NULL,
  `motd` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `logo_name` varchar(255) NOT NULL DEFAULT 'default.gif',
  `guild_logo` mediumblob DEFAULT NULL,
  `create_ip` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `balance` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Acionadores `guilds`
--
DELIMITER $$
CREATE TRIGGER `oncreate_guilds` AFTER INSERT ON `guilds` FOR EACH ROW BEGIN
    INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('the Leader', 3, NEW.`id`);
    INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('a Vice-Leader', 2, NEW.`id`);
    INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('a Member', 1, NEW.`id`);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guildwar_kills`
--

CREATE TABLE `guildwar_kills` (
  `id` int(11) NOT NULL,
  `killer` varchar(50) NOT NULL,
  `target` varchar(50) NOT NULL,
  `killerguild` int(11) NOT NULL DEFAULT 0,
  `targetguild` int(11) NOT NULL DEFAULT 0,
  `warid` int(11) NOT NULL DEFAULT 0,
  `time` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_invites`
--

CREATE TABLE `guild_invites` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `guild_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_membership`
--

CREATE TABLE `guild_membership` (
  `player_id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `rank_id` int(11) NOT NULL,
  `nick` varchar(15) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_ranks`
--

CREATE TABLE `guild_ranks` (
  `id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL COMMENT 'guild',
  `name` varchar(255) NOT NULL COMMENT 'rank name',
  `level` int(11) NOT NULL COMMENT 'rank level - leader, vice, member, maybe something else'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_wars`
--

CREATE TABLE `guild_wars` (
  `id` int(11) NOT NULL,
  `guild1` int(11) NOT NULL DEFAULT 0,
  `guild2` int(11) NOT NULL DEFAULT 0,
  `name1` varchar(255) NOT NULL,
  `name2` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `started` bigint(20) NOT NULL DEFAULT 0,
  `ended` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `houses`
--

CREATE TABLE `houses` (
  `id` int(11) NOT NULL,
  `owner` int(11) NOT NULL,
  `paid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `warnings` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `rent` int(11) NOT NULL DEFAULT 0,
  `town_id` int(11) NOT NULL DEFAULT 0,
  `bid` int(11) NOT NULL DEFAULT 0,
  `bid_end` int(11) NOT NULL DEFAULT 0,
  `last_bid` int(11) NOT NULL DEFAULT 0,
  `highest_bidder` int(11) NOT NULL DEFAULT 0,
  `size` int(11) NOT NULL DEFAULT 0,
  `beds` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `houses`
--

INSERT INTO `houses` (`id`, `owner`, `paid`, `warnings`, `name`, `rent`, `town_id`, `bid`, `bid_end`, `last_bid`, `highest_bidder`, `size`, `beds`) VALUES
(1, 0, 0, 0, 'Thunder City #1', 0, 1, 0, 0, 0, 0, 42, 1),
(2, 0, 0, 0, 'Thunder City #2', 0, 1, 0, 0, 0, 0, 49, 1),
(3, 0, 0, 0, 'Thunder City #3', 0, 1, 0, 0, 0, 0, 48, 1),
(4, 0, 0, 0, 'Thunder City #4', 0, 1, 0, 0, 0, 0, 49, 1),
(5, 0, 0, 0, 'Thunder City #5', 0, 1, 0, 0, 0, 0, 56, 1),
(6, 0, 0, 0, 'Thunder City #6', 0, 1, 0, 0, 0, 0, 49, 1),
(14, 0, 0, 0, 'Thunder City #15', 0, 1, 0, 0, 0, 0, 36, 1),
(15, 0, 0, 0, 'Thunder City #16', 0, 1, 0, 0, 0, 0, 30, 1),
(16, 0, 0, 0, 'Thunder City #17', 0, 1, 0, 0, 0, 0, 49, 1),
(17, 0, 0, 0, 'Thunder City #18', 0, 1, 0, 0, 0, 0, 42, 1),
(18, 0, 0, 0, 'Thunder City #19', 0, 1, 0, 0, 0, 0, 42, 1),
(19, 0, 0, 0, 'Thunder City #20', 0, 1, 0, 0, 0, 0, 36, 1),
(20, 0, 0, 0, 'Thunder City #21', 0, 1, 0, 0, 0, 0, 48, 1),
(21, 0, 0, 0, 'Thunder City #22', 0, 1, 0, 0, 0, 0, 60, 1),
(22, 0, 0, 0, 'Thunder City #23', 0, 1, 0, 0, 0, 0, 30, 1),
(23, 0, 0, 0, 'Thunder City #24', 0, 1, 0, 0, 0, 0, 36, 1),
(24, 0, 0, 0, 'Thunder City #25', 0, 1, 0, 0, 0, 0, 549, 6),
(25, 0, 0, 0, 'Thunder City #26', 0, 1, 0, 0, 0, 0, 56, 1),
(26, 0, 0, 0, 'Thunder City #27', 0, 1, 0, 0, 0, 0, 63, 2),
(27, 0, 0, 0, 'Thunder City #28', 0, 1, 0, 0, 0, 0, 49, 1),
(28, 0, 0, 0, 'Thunder City #29', 0, 1, 0, 0, 0, 0, 70, 2),
(29, 0, 0, 0, 'Thunder City #30', 0, 1, 0, 0, 0, 0, 72, 2),
(30, 0, 0, 0, 'Thunder City #31', 0, 1, 0, 0, 0, 0, 35, 1),
(31, 0, 0, 0, 'Thunder City #32', 0, 1, 0, 0, 0, 0, 35, 1),
(32, 0, 0, 0, 'Thunder City #33', 0, 1, 0, 0, 0, 0, 35, 1),
(33, 0, 0, 0, 'Thunder City #34', 0, 1, 0, 0, 0, 0, 56, 2),
(34, 0, 0, 0, 'Thunder City #35', 0, 1, 0, 0, 0, 0, 216, 4),
(35, 0, 0, 0, 'Thunder City #36', 0, 1, 0, 0, 0, 0, 50, 1),
(36, 0, 0, 0, 'Thunder City #37', 0, 1, 0, 0, 0, 0, 50, 1),
(37, 0, 0, 0, 'Thunder City #38', 0, 1, 0, 0, 0, 0, 50, 1),
(38, 0, 0, 0, 'Thunder City #39', 0, 1, 0, 0, 0, 0, 81, 2),
(39, 0, 0, 0, 'Thunder City #40', 0, 1, 0, 0, 0, 0, 48, 1),
(40, 0, 0, 0, 'Thunder City #41', 0, 1, 0, 0, 0, 0, 63, 1),
(41, 0, 0, 0, 'Thunder City #42', 0, 1, 0, 0, 0, 0, 54, 1),
(42, 0, 0, 0, 'Thunder City #43', 0, 1, 0, 0, 0, 0, 48, 1),
(43, 0, 0, 0, 'Thunder City #44', 0, 1, 0, 0, 0, 0, 48, 1),
(44, 0, 0, 0, 'Thunder City #45', 0, 1, 0, 0, 0, 0, 48, 1),
(45, 0, 0, 0, 'Thunder City #46', 0, 1, 0, 0, 0, 0, 48, 1),
(46, 0, 0, 0, 'Thunder City #47', 0, 1, 0, 0, 0, 0, 48, 1),
(49, 0, 0, 0, 'Thunder City #50', 0, 1, 0, 0, 0, 0, 31, 1),
(50, 0, 0, 0, 'Thunder City #51', 0, 1, 0, 0, 0, 0, 49, 1),
(51, 0, 0, 0, 'Thunder City #52', 0, 1, 0, 0, 0, 0, 105, 1),
(52, 0, 0, 0, 'Thunder City #53', 0, 1, 0, 0, 0, 0, 98, 1),
(53, 0, 0, 0, 'Thunder City #54', 0, 1, 0, 0, 0, 0, 42, 1),
(54, 0, 0, 0, 'Thunder City #55', 0, 1, 0, 0, 0, 0, 49, 1),
(55, 0, 0, 0, 'Thunder City #56', 0, 1, 0, 0, 0, 0, 45, 1),
(56, 0, 0, 0, 'Thunder City #57', 0, 1, 0, 0, 0, 0, 45, 1),
(57, 0, 0, 0, 'Thunder City #58', 0, 1, 0, 0, 0, 0, 35, 1),
(58, 0, 0, 0, 'Thunder City #59', 0, 1, 0, 0, 0, 0, 28, 1),
(59, 0, 0, 0, 'Thunder City #60', 0, 1, 0, 0, 0, 0, 56, 1),
(60, 0, 0, 0, 'Thunder City #61', 0, 1, 0, 0, 0, 0, 47, 1),
(62, 0, 0, 0, 'Thunder City #63', 0, 1, 0, 0, 0, 0, 50, 1),
(63, 0, 0, 0, 'Thunder City #64', 0, 1, 0, 0, 0, 0, 56, 2),
(64, 0, 0, 0, 'Thunder City #65', 0, 1, 0, 0, 0, 0, 46, 1),
(65, 0, 0, 0, 'Thunder City #66', 0, 1, 0, 0, 0, 0, 25, 1),
(66, 0, 0, 0, 'Thunder City #67', 0, 1, 0, 0, 0, 0, 48, 1),
(68, 0, 0, 0, 'Thunder City #69', 0, 1, 0, 0, 0, 0, 77, 1),
(69, 0, 0, 0, 'Thunder City #70', 0, 1, 0, 0, 0, 0, 66, 1),
(70, 0, 0, 0, 'Thunder City #71', 0, 1, 0, 0, 0, 0, 48, 1),
(71, 0, 0, 0, 'Thunder City #72', 0, 1, 0, 0, 0, 0, 42, 1),
(72, 0, 0, 0, 'Thunder City #73', 0, 1, 0, 0, 0, 0, 30, 1),
(73, 0, 0, 0, 'Thunder City #74', 0, 1, 0, 0, 0, 0, 48, 1),
(74, 0, 0, 0, 'Thunder City #75', 0, 1, 0, 0, 0, 0, 42, 1),
(75, 0, 0, 0, 'Thunder City #76', 0, 1, 0, 0, 0, 0, 15, 1),
(76, 0, 0, 0, 'Thunder City #77', 0, 1, 0, 0, 0, 0, 20, 1),
(77, 0, 0, 0, 'Thunder City #78', 0, 1, 0, 0, 0, 0, 15, 1),
(78, 0, 0, 0, 'Thunder City #79', 0, 1, 0, 0, 0, 0, 20, 1),
(79, 0, 0, 0, 'Thunder City #80', 0, 1, 0, 0, 0, 0, 15, 1),
(80, 0, 0, 0, 'Thunder City #81', 0, 1, 0, 0, 0, 0, 15, 1),
(81, 0, 0, 0, 'Thunder City #82', 0, 1, 0, 0, 0, 0, 20, 1),
(82, 0, 0, 0, 'Thunder City #83', 0, 1, 0, 0, 0, 0, 20, 1),
(84, 0, 0, 0, 'Thunder City #85', 0, 1, 0, 0, 0, 0, 35, 1),
(85, 0, 0, 0, 'Thunder City #86', 0, 1, 0, 0, 0, 0, 35, 1),
(86, 0, 0, 0, 'Thunder City #87', 0, 1, 0, 0, 0, 0, 33, 1),
(87, 0, 0, 0, 'Thunder City #88', 0, 1, 0, 0, 0, 0, 51, 1),
(88, 0, 0, 0, 'Thunder City #89', 0, 1, 0, 0, 0, 0, 56, 1),
(89, 0, 0, 0, 'Thunder City #90', 0, 1, 0, 0, 0, 0, 64, 2),
(90, 0, 0, 0, 'Thunder City #91', 0, 1, 0, 0, 0, 0, 42, 1),
(91, 0, 0, 0, 'Thunder City #92', 0, 1, 0, 0, 0, 0, 24, 1),
(97, 0, 0, 0, 'Jamila Island #1', 0, 2, 0, 0, 0, 0, 64, 2),
(98, 0, 0, 0, 'Jamila Island #2', 0, 2, 0, 0, 0, 0, 84, 2),
(99, 0, 0, 0, 'Jamila Island #3', 0, 2, 0, 0, 0, 0, 55, 2),
(100, 0, 0, 0, 'Jamila Island #4', 0, 2, 0, 0, 0, 0, 106, 2),
(101, 0, 0, 0, 'Jamila Island #5', 0, 2, 0, 0, 0, 0, 49, 2),
(102, 0, 0, 0, 'Jamila Island #6', 0, 2, 0, 0, 0, 0, 40, 1),
(103, 0, 0, 0, 'Jamila Island #7', 0, 2, 0, 0, 0, 0, 35, 2),
(104, 0, 0, 0, 'Jamila Island #8', 0, 2, 0, 0, 0, 0, 42, 1),
(105, 0, 0, 0, 'Jamila Island #9', 0, 2, 0, 0, 0, 0, 42, 1),
(106, 0, 0, 0, 'Jamila Island #10', 0, 2, 0, 0, 0, 0, 42, 1),
(107, 0, 0, 0, 'Jamila Island #11', 0, 2, 0, 0, 0, 0, 74, 2),
(108, 0, 0, 0, 'Jamila Island #12', 0, 2, 0, 0, 0, 0, 60, 0),
(109, 0, 0, 0, 'Jamila Island #13', 0, 2, 0, 0, 0, 0, 42, 1),
(110, 0, 0, 0, 'Jamila Island #14', 0, 2, 0, 0, 0, 0, 90, 1),
(111, 0, 0, 0, 'Jamila Island #15', 0, 2, 0, 0, 0, 0, 20, 1),
(112, 0, 0, 0, 'Jamila Island #16', 0, 2, 0, 0, 0, 0, 20, 1),
(113, 0, 0, 0, 'Jamila Island #17', 0, 2, 0, 0, 0, 0, 23, 1),
(114, 0, 0, 0, 'Jamila Island #18', 0, 2, 0, 0, 0, 0, 23, 1),
(115, 0, 0, 0, 'Jamila Island #19', 0, 2, 0, 0, 0, 0, 20, 1),
(116, 0, 0, 0, 'Jamila Island #20', 0, 2, 0, 0, 0, 0, 20, 1),
(117, 0, 0, 0, 'Jamila Island #21', 0, 2, 0, 0, 0, 0, 16, 1),
(118, 0, 0, 0, 'Jamila Island #22', 0, 2, 0, 0, 0, 0, 16, 1),
(119, 0, 0, 0, 'Bhark #1', 0, 5, 0, 0, 0, 0, 24, 0),
(120, 0, 0, 0, 'Bhark #2', 0, 5, 0, 0, 0, 0, 20, 0),
(121, 0, 0, 0, 'Bhark #3', 0, 5, 0, 0, 0, 0, 13, 0),
(122, 0, 0, 0, 'Bhark #4', 0, 5, 0, 0, 0, 0, 10, 0),
(123, 0, 0, 0, 'Bhark #5', 0, 5, 0, 0, 0, 0, 40, 1),
(124, 0, 0, 0, 'Bhark #6', 0, 5, 0, 0, 0, 0, 28, 1),
(125, 0, 0, 0, 'Bhark #7', 0, 5, 0, 0, 0, 0, 64, 2),
(126, 0, 0, 0, 'Bhark #8', 0, 5, 0, 0, 0, 0, 16, 1),
(127, 0, 0, 0, 'Bhark #9', 0, 5, 0, 0, 0, 0, 35, 1),
(128, 0, 0, 0, 'Bhark #10', 0, 5, 0, 0, 0, 0, 28, 1),
(129, 0, 0, 0, 'Bhark #11', 0, 5, 0, 0, 0, 0, 48, 2),
(130, 0, 0, 0, 'Bhark #12', 0, 5, 0, 0, 0, 0, 20, 1),
(131, 0, 0, 0, 'Bhark #13', 0, 5, 0, 0, 0, 0, 40, 2),
(132, 0, 0, 0, 'Bhark #14', 0, 5, 0, 0, 0, 0, 20, 1),
(133, 0, 0, 0, 'Bhark #15', 0, 5, 0, 0, 0, 0, 24, 1),
(134, 0, 0, 0, 'Bhark #16', 0, 5, 0, 0, 0, 0, 24, 1),
(135, 0, 0, 0, 'Bhark #17', 0, 5, 0, 0, 0, 0, 58, 1),
(136, 0, 0, 0, 'Bhark #18', 0, 5, 0, 0, 0, 0, 34, 1),
(137, 0, 0, 0, 'Bhark #19', 0, 5, 0, 0, 0, 0, 44, 1),
(138, 0, 0, 0, 'Bhark #20', 0, 5, 0, 0, 0, 0, 26, 1),
(139, 0, 0, 0, 'Bhark #21', 0, 5, 0, 0, 0, 0, 35, 1),
(140, 0, 0, 0, 'Bhark #22', 0, 5, 0, 0, 0, 0, 20, 1),
(141, 0, 0, 0, 'Bhark #23', 0, 5, 0, 0, 0, 0, 16, 1),
(142, 0, 0, 0, 'Bhark #24', 0, 5, 0, 0, 0, 0, 32, 2),
(143, 0, 0, 0, 'Bhark #25', 0, 5, 0, 0, 0, 0, 24, 1),
(144, 0, 0, 0, 'Bhark #26', 0, 5, 0, 0, 0, 0, 21, 1),
(145, 0, 0, 0, 'Bhark #27', 0, 5, 0, 0, 0, 0, 20, 1),
(146, 0, 0, 0, 'Bhark #28', 0, 5, 0, 0, 0, 0, 20, 1),
(147, 0, 0, 0, 'Bhark #29', 0, 5, 0, 0, 0, 0, 42, 1),
(148, 0, 0, 0, 'Bhark #30', 0, 5, 0, 0, 0, 0, 56, 2),
(149, 0, 0, 0, 'Bhark #31', 0, 5, 0, 0, 0, 0, 20, 1),
(150, 0, 0, 0, 'Bhark #32', 0, 5, 0, 0, 0, 0, 20, 1),
(151, 0, 0, 0, 'Bhark #33', 0, 5, 0, 0, 0, 0, 16, 1),
(152, 0, 0, 0, 'Bhark #34', 0, 5, 0, 0, 0, 0, 20, 1),
(153, 0, 0, 0, 'Bhark #35', 0, 5, 0, 0, 0, 0, 25, 1),
(154, 0, 0, 0, 'Bhark #36', 0, 5, 0, 0, 0, 0, 25, 1),
(155, 0, 0, 0, 'Bhark #37', 0, 5, 0, 0, 0, 0, 25, 1),
(156, 0, 0, 0, 'Bhark #38', 0, 5, 0, 0, 0, 0, 20, 1),
(157, 0, 0, 0, 'Bhark #39', 0, 5, 0, 0, 0, 0, 27, 1),
(158, 0, 0, 0, 'Bhark #40', 0, 5, 0, 0, 0, 0, 49, 1),
(159, 0, 0, 0, 'Bhark #41', 0, 5, 0, 0, 0, 0, 30, 1),
(160, 0, 0, 0, 'Bhark #42', 0, 5, 0, 0, 0, 0, 30, 1),
(161, 0, 0, 0, 'Bhark #43', 0, 5, 0, 0, 0, 0, 11, 0),
(162, 0, 0, 0, 'Bhark #44', 0, 5, 0, 0, 0, 0, 11, 0),
(163, 0, 0, 0, 'Thunder City #8', 0, 1, 0, 0, 0, 0, 35, 1),
(164, 0, 0, 0, 'Akravi #1', 0, 3, 0, 0, 0, 0, 56, 1),
(165, 0, 0, 0, 'Akravi #2', 0, 3, 0, 0, 0, 0, 49, 3),
(166, 0, 0, 0, 'Akravi #3', 0, 3, 0, 0, 0, 0, 56, 2),
(167, 0, 0, 0, 'Akravi #4', 0, 3, 0, 0, 0, 0, 56, 2),
(168, 0, 0, 0, 'Akravi #5', 0, 3, 0, 0, 0, 0, 49, 2),
(169, 0, 0, 0, 'Akravi #6', 0, 3, 0, 0, 0, 0, 30, 1),
(170, 0, 0, 0, 'Akravi #7', 0, 3, 0, 0, 0, 0, 30, 1),
(171, 0, 0, 0, 'Akravi #8', 0, 3, 0, 0, 0, 0, 50, 2),
(172, 0, 0, 0, 'Akravi #9', 0, 3, 0, 0, 0, 0, 25, 1),
(173, 0, 0, 0, 'Akravi #10', 0, 3, 0, 0, 0, 0, 25, 1),
(174, 0, 0, 0, 'Akravi #11', 0, 3, 0, 0, 0, 0, 25, 1),
(175, 0, 0, 0, 'Akravi #12', 0, 3, 0, 0, 0, 0, 50, 2),
(176, 0, 0, 0, 'Akravi #13', 0, 3, 0, 0, 0, 0, 30, 1),
(177, 0, 0, 0, 'Akravi #14', 0, 3, 0, 0, 0, 0, 25, 1),
(178, 0, 0, 0, 'Akravi #15', 0, 3, 0, 0, 0, 0, 25, 1),
(179, 0, 0, 0, 'Akravi #16', 0, 3, 0, 0, 0, 0, 49, 2),
(180, 0, 0, 0, 'Akravi #17', 0, 3, 0, 0, 0, 0, 12, 1),
(181, 0, 0, 0, 'Akravi #18', 0, 3, 0, 0, 0, 0, 72, 3),
(182, 0, 0, 0, 'Akravi #19', 0, 3, 0, 0, 0, 0, 41, 2),
(183, 0, 0, 0, 'Akravi #20', 0, 3, 0, 0, 0, 0, 42, 2),
(184, 0, 0, 0, 'Akravi #21', 0, 3, 0, 0, 0, 0, 12, 1),
(185, 0, 0, 0, 'Akravi #22', 0, 3, 0, 0, 0, 0, 9, 1),
(186, 0, 0, 0, 'Akravi #23', 0, 3, 0, 0, 0, 0, 20, 1),
(187, 0, 0, 0, 'Akravi #24', 0, 3, 0, 0, 0, 0, 16, 1),
(188, 0, 0, 0, 'Akravi #25', 0, 3, 0, 0, 0, 0, 20, 1),
(189, 0, 0, 0, 'Akravi #26', 0, 3, 0, 0, 0, 0, 25, 1),
(190, 0, 0, 0, 'Akravi #27', 0, 3, 0, 0, 0, 0, 25, 1),
(191, 0, 0, 0, 'Akravi #28', 0, 3, 0, 0, 0, 0, 30, 1),
(192, 0, 0, 0, 'Akravi #29', 0, 3, 0, 0, 0, 0, 25, 1),
(193, 0, 0, 0, 'Akravi #30', 0, 3, 0, 0, 0, 0, 42, 2),
(194, 0, 0, 0, 'Akravi #31', 0, 3, 0, 0, 0, 0, 12, 1),
(195, 0, 0, 0, 'Akravi #32', 0, 3, 0, 0, 0, 0, 21, 1),
(196, 0, 0, 0, 'Akravi #33', 0, 3, 0, 0, 0, 0, 21, 1),
(197, 0, 0, 0, 'Akravi #34', 0, 3, 0, 0, 0, 0, 21, 1),
(198, 0, 0, 0, 'Akravi #35', 0, 3, 0, 0, 0, 0, 21, 1),
(199, 0, 0, 0, 'Wintermere #1', 0, 6, 0, 0, 0, 0, 111, 2),
(200, 0, 0, 0, 'Wintermere #2', 0, 6, 0, 0, 0, 0, 54, 2),
(201, 0, 0, 0, 'Wintermere #3', 0, 6, 0, 0, 0, 0, 24, 1),
(202, 0, 0, 0, 'Wintermere #4', 0, 6, 0, 0, 0, 0, 94, 0),
(203, 0, 0, 0, 'Wintermere #5', 0, 6, 0, 0, 0, 0, 152, 2),
(204, 0, 0, 0, 'Wintermere #6', 0, 6, 0, 0, 0, 0, 131, 3),
(205, 0, 0, 0, 'Wintermere #7', 0, 6, 0, 0, 0, 0, 65, 2),
(206, 0, 0, 0, 'Wintermere #8', 0, 6, 0, 0, 0, 0, 48, 0),
(207, 0, 0, 0, 'Wintermere #9', 0, 6, 0, 0, 0, 0, 45, 0),
(208, 0, 0, 0, 'Wintermere #10', 0, 6, 0, 0, 0, 0, 73, 1),
(209, 0, 0, 0, 'Wintermere #11', 0, 6, 0, 0, 0, 0, 76, 0),
(210, 0, 0, 0, 'Wintermere #12', 0, 6, 0, 0, 0, 0, 147, 0),
(211, 0, 0, 0, 'Wintermere #13', 0, 6, 0, 0, 0, 0, 65, 0),
(212, 0, 0, 0, 'Wintermere #14', 0, 6, 0, 0, 0, 0, 38, 0),
(213, 0, 0, 0, 'Wintermere #15', 0, 6, 0, 0, 0, 0, 108, 0),
(214, 0, 0, 0, 'Wintermere #16', 0, 6, 0, 0, 0, 0, 86, 0),
(215, 0, 0, 0, 'Wintermere #17', 0, 6, 0, 0, 0, 0, 129, 3),
(216, 0, 0, 0, 'Wintermere #18', 0, 6, 0, 0, 0, 0, 84, 0),
(217, 0, 0, 0, 'Wintermere #19', 0, 6, 0, 0, 0, 0, 97, 0),
(218, 0, 0, 0, 'Wintermere #20', 0, 6, 0, 0, 0, 0, 42, 0),
(219, 0, 0, 0, 'Wintermere #21', 0, 6, 0, 0, 0, 0, 48, 0),
(220, 0, 0, 0, 'Wintermere #22', 0, 6, 0, 0, 0, 0, 93, 1),
(221, 0, 0, 0, 'Wintermere #23', 0, 6, 0, 0, 0, 0, 69, 1),
(222, 0, 0, 0, 'Wintermere #24', 0, 6, 0, 0, 0, 0, 60, 0),
(223, 0, 0, 0, 'Wintermere #25', 0, 6, 0, 0, 0, 0, 83, 0),
(224, 0, 0, 0, 'Al Arar #1', 0, 4, 0, 0, 0, 0, 48, 0),
(225, 0, 0, 0, 'Al Arar #2', 0, 4, 0, 0, 0, 0, 87, 0),
(226, 0, 0, 0, 'Al Arar #3', 0, 4, 0, 0, 0, 0, 21, 0),
(227, 0, 0, 0, 'Al Arar #4', 0, 4, 0, 0, 0, 0, 70, 0),
(228, 0, 0, 0, 'Al Arar #5', 0, 4, 0, 0, 0, 0, 27, 0),
(229, 0, 0, 0, 'Al Arar #6', 0, 4, 0, 0, 0, 0, 24, 0),
(230, 0, 0, 0, 'Al Arar #7', 0, 4, 0, 0, 0, 0, 114, 0),
(231, 0, 0, 0, 'Al Arar #8', 0, 4, 0, 0, 0, 0, 79, 0),
(232, 0, 0, 0, 'Al Arar #9', 0, 4, 0, 0, 0, 0, 50, 0),
(233, 0, 0, 0, 'Al Arar #10', 0, 4, 0, 0, 0, 0, 52, 0),
(234, 0, 0, 0, 'Al Arar #11', 0, 4, 0, 0, 0, 0, 23, 1),
(235, 0, 0, 0, 'Al Arar #12', 0, 4, 0, 0, 0, 0, 235, 0),
(236, 0, 0, 0, 'Al Arar #13', 0, 4, 0, 0, 0, 0, 20, 0),
(237, 0, 0, 0, 'Shadow Wood #1', 0, 7, 0, 0, 0, 0, 20, 0),
(238, 0, 0, 0, 'Shadow Wood #2', 0, 7, 0, 0, 0, 0, 20, 0),
(239, 0, 0, 0, 'Shadow Wood #3', 0, 7, 0, 0, 0, 0, 24, 0),
(240, 0, 0, 0, 'Shadow Wood #4', 0, 7, 0, 0, 0, 0, 20, 0),
(241, 0, 0, 0, 'Shadow Wood #5', 0, 7, 0, 0, 0, 0, 30, 0),
(242, 0, 0, 0, 'Shadow Wood #6', 0, 7, 0, 0, 0, 0, 16, 0),
(243, 0, 0, 0, 'Shadow Wood #7', 0, 7, 0, 0, 0, 0, 16, 0),
(244, 0, 0, 0, 'Shadow Wood #8', 0, 7, 0, 0, 0, 0, 16, 0),
(245, 0, 0, 0, 'Shadow Wood #9', 0, 7, 0, 0, 0, 0, 20, 0),
(246, 0, 0, 0, 'Shadow Wood #10', 0, 7, 0, 0, 0, 0, 63, 0),
(247, 0, 0, 0, 'Shadow Wood #11', 0, 7, 0, 0, 0, 0, 16, 0),
(248, 0, 0, 0, 'Shadow Wood #12', 0, 7, 0, 0, 0, 0, 12, 0),
(249, 0, 0, 0, 'Shadow Wood #13', 0, 7, 0, 0, 0, 0, 88, 0),
(250, 0, 0, 0, 'Fork Village #1', 0, 1, 0, 0, 0, 0, 30, 1),
(251, 0, 0, 0, 'Fork Village #2', 0, 1, 0, 0, 0, 0, 49, 2),
(252, 0, 0, 0, 'Fork Village #3', 0, 1, 0, 0, 0, 0, 33, 1),
(253, 0, 0, 0, 'Fork Village #4', 0, 1, 0, 0, 0, 0, 39, 1),
(254, 0, 0, 0, 'Fork Village #5', 0, 1, 0, 0, 0, 0, 65, 1),
(255, 0, 0, 0, 'Fork Village #6', 0, 1, 0, 0, 0, 0, 45, 2),
(256, 0, 0, 0, 'Fork Village #7', 0, 1, 0, 0, 0, 0, 37, 1),
(257, 0, 0, 0, 'Fork Village #8', 0, 1, 0, 0, 0, 0, 31, 1),
(258, 0, 0, 0, 'Fork Village #9', 0, 1, 0, 0, 0, 0, 28, 1),
(259, 0, 0, 0, 'Fork Village #10', 0, 1, 0, 0, 0, 0, 62, 1),
(260, 0, 0, 0, 'Fork Village #11', 0, 1, 0, 0, 0, 0, 36, 1),
(261, 0, 0, 0, 'Fork Village #12', 0, 1, 0, 0, 0, 0, 24, 1),
(262, 0, 0, 0, 'Fork Village #13', 0, 1, 0, 0, 0, 0, 25, 1),
(263, 0, 0, 0, 'Thunder Hut #1', 0, 1, 0, 0, 0, 0, 30, 1),
(264, 0, 0, 0, 'Thunder Hut #2', 0, 1, 0, 0, 0, 0, 30, 1),
(265, 0, 0, 0, 'Thunder Hut #3', 0, 1, 0, 0, 0, 0, 30, 1),
(266, 0, 0, 0, 'Thunder Hut #4', 0, 1, 0, 0, 0, 0, 25, 1),
(267, 0, 0, 0, 'Thunder Hut #5', 0, 1, 0, 0, 0, 0, 25, 1),
(268, 0, 0, 0, 'Premia #1', 0, 8, 0, 0, 0, 0, 550, 4),
(269, 0, 0, 0, 'Premia #2', 0, 8, 0, 0, 0, 0, 565, 4),
(270, 0, 0, 0, 'Premia #3', 0, 8, 0, 0, 0, 0, 327, 3),
(271, 0, 0, 0, 'Premia #4', 0, 8, 0, 0, 0, 0, 364, 3),
(272, 0, 0, 0, 'Premia #5', 0, 8, 0, 0, 0, 0, 389, 3),
(273, 0, 0, 0, 'Premia #6', 0, 8, 0, 0, 0, 0, 509, 5),
(274, 0, 0, 0, 'Premia #7', 0, 8, 0, 0, 0, 0, 218, 1),
(275, 0, 0, 0, 'Premia #8', 0, 8, 0, 0, 0, 0, 218, 1),
(276, 0, 0, 0, 'Premia #9', 0, 8, 0, 0, 0, 0, 218, 1),
(277, 0, 0, 0, 'Premia #10', 0, 8, 0, 0, 0, 0, 677, 6),
(278, 0, 0, 0, 'Premia #11', 0, 8, 0, 0, 0, 0, 311, 2),
(279, 0, 0, 0, 'Premia #12', 0, 8, 0, 0, 0, 0, 407, 2),
(280, 0, 0, 0, 'Premia #13', 0, 8, 0, 0, 0, 0, 904, 7),
(281, 0, 0, 0, 'Premia #14', 0, 8, 0, 0, 0, 0, 218, 1),
(282, 0, 0, 0, 'Premia #15', 0, 8, 0, 0, 0, 0, 212, 1),
(283, 0, 0, 0, 'Premia #16', 0, 8, 0, 0, 0, 0, 221, 1),
(284, 0, 0, 0, 'Premia #17', 0, 8, 0, 0, 0, 0, 224, 1),
(285, 0, 0, 0, 'Premia #18', 0, 8, 0, 0, 0, 0, 231, 1),
(286, 0, 0, 0, 'Premia Subsolo #1', 0, 8, 0, 0, 0, 0, 49, 1),
(287, 0, 0, 0, 'Premia Subsolo #2', 0, 8, 0, 0, 0, 0, 64, 1),
(288, 0, 0, 0, 'Premia Subsolo #3', 0, 8, 0, 0, 0, 0, 49, 1),
(289, 0, 0, 0, 'Premia Subsolo #4', 0, 8, 0, 0, 0, 0, 64, 1),
(290, 0, 0, 0, 'Premia Subsolo #5', 0, 8, 0, 0, 0, 0, 128, 4),
(291, 0, 0, 0, 'Premia Subsolo #6', 0, 8, 0, 0, 0, 0, 70, 2),
(292, 0, 0, 0, 'Premia Subsolo #7', 0, 8, 0, 0, 0, 0, 70, 2),
(293, 0, 0, 0, 'Premia Subsolo #8', 0, 8, 0, 0, 0, 0, 187, 4),
(294, 0, 0, 0, 'Premia Subsolo #9', 0, 8, 0, 0, 0, 0, 75, 0),
(295, 0, 0, 0, 'Premia Subsolo #10', 0, 8, 0, 0, 0, 0, 116, 1),
(296, 0, 0, 0, 'Premia Subsolo #11', 0, 8, 0, 0, 0, 0, 99, 1),
(297, 0, 0, 0, 'Premia Subsolo #12', 0, 8, 0, 0, 0, 0, 233, 4),
(298, 0, 0, 0, 'Thunder Farm #1', 0, 1, 0, 0, 0, 0, 268, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `house_lists`
--

CREATE TABLE `house_lists` (
  `house_id` int(11) NOT NULL,
  `listid` int(11) NOT NULL,
  `list` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `hunted_system`
--

CREATE TABLE `hunted_system` (
  `playerGuid` varchar(255) NOT NULL,
  `targetGuid` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ip_bans`
--

CREATE TABLE `ip_bans` (
  `ip` int(10) UNSIGNED NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `market_history`
--

CREATE TABLE `market_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `sale` tinyint(4) NOT NULL DEFAULT 0,
  `itemtype` smallint(5) UNSIGNED NOT NULL,
  `amount` smallint(5) UNSIGNED NOT NULL,
  `price` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `expires_at` bigint(20) UNSIGNED NOT NULL,
  `inserted` bigint(20) UNSIGNED NOT NULL,
  `state` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `market_offers`
--

CREATE TABLE `market_offers` (
  `id` int(10) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `sale` tinyint(4) NOT NULL DEFAULT 0,
  `itemtype` smallint(5) UNSIGNED NOT NULL,
  `amount` smallint(5) UNSIGNED NOT NULL,
  `created` bigint(20) UNSIGNED NOT NULL,
  `anonymous` tinyint(4) NOT NULL DEFAULT 0,
  `price` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `myaac_account_actions`
--

CREATE TABLE `myaac_account_actions` (
  `account_id` int(11) NOT NULL,
  `ip` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ipv6` binary(16) NOT NULL DEFAULT '0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `date` int(11) NOT NULL DEFAULT 0,
  `action` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `myaac_account_actions`
--

INSERT INTO `myaac_account_actions` (`account_id`, `ip`, `ipv6`, `date`, `action`) VALUES
(2, 2130706433, 0x00000000000000000000000000000000, 1712013385, 'Account created.'),
(2, 2130706433, 0x00000000000000000000000000000000, 1712013471, 'Created character <b>Liu Knag</b>.');

-- --------------------------------------------------------

--
-- Estrutura da tabela `myaac_admin_menu`
--

CREATE TABLE `myaac_admin_menu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `page` varchar(255) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT 0,
  `flags` int(11) NOT NULL DEFAULT 0,
  `enabled` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `myaac_bugtracker`
--

CREATE TABLE `myaac_bugtracker` (
  `account` varchar(255) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `text` text NOT NULL,
  `id` int(11) NOT NULL DEFAULT 0,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `reply` int(11) NOT NULL DEFAULT 0,
  `who` int(11) NOT NULL DEFAULT 0,
  `uid` int(11) NOT NULL,
  `tag` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `myaac_changelog`
--

CREATE TABLE `myaac_changelog` (
  `id` int(11) NOT NULL,
  `body` varchar(500) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 - added, 2 - removed, 3 - changed, 4 - fixed',
  `where` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 - server, 2 - site',
  `date` int(11) NOT NULL DEFAULT 0,
  `player_id` int(11) NOT NULL DEFAULT 0,
  `hidden` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `myaac_changelog`
--

INSERT INTO `myaac_changelog` (`id`, `body`, `type`, `where`, `date`, `player_id`, `hidden`) VALUES
(1, 'MyAAC installed. (:', 3, 2, 1712013359, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `myaac_config`
--

CREATE TABLE `myaac_config` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `value` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `myaac_config`
--

INSERT INTO `myaac_config` (`id`, `name`, `value`) VALUES
(1, 'database_version', '33'),
(2, 'status_online', ''),
(3, 'status_players', '0'),
(4, 'status_playersMax', '0'),
(5, 'status_lastCheck', '0'),
(6, 'status_uptime', '0h 0m'),
(7, 'status_monsters', '0'),
(8, 'last_usage_report', '1710026231'),
(9, 'views_counter', '2');

-- --------------------------------------------------------

--
-- Estrutura da tabela `myaac_faq`
--

CREATE TABLE `myaac_faq` (
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL DEFAULT '',
  `answer` varchar(1020) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT 0,
  `hidden` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `myaac_forum`
--

CREATE TABLE `myaac_forum` (
  `id` int(11) NOT NULL,
  `first_post` int(11) NOT NULL DEFAULT 0,
  `last_post` int(11) NOT NULL DEFAULT 0,
  `section` int(3) NOT NULL DEFAULT 0,
  `replies` int(20) NOT NULL DEFAULT 0,
  `views` int(20) NOT NULL DEFAULT 0,
  `author_aid` int(20) NOT NULL DEFAULT 0,
  `author_guid` int(20) NOT NULL DEFAULT 0,
  `post_text` text NOT NULL,
  `post_topic` varchar(255) NOT NULL DEFAULT '',
  `post_smile` tinyint(1) NOT NULL DEFAULT 0,
  `post_html` tinyint(1) NOT NULL DEFAULT 0,
  `post_date` int(20) NOT NULL DEFAULT 0,
  `last_edit_aid` int(20) NOT NULL DEFAULT 0,
  `edit_date` int(20) NOT NULL DEFAULT 0,
  `post_ip` varchar(32) NOT NULL DEFAULT '0.0.0.0',
  `sticked` tinyint(1) NOT NULL DEFAULT 0,
  `closed` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `myaac_forum_boards`
--

CREATE TABLE `myaac_forum_boards` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT 0,
  `guild` int(11) NOT NULL DEFAULT 0,
  `access` int(11) NOT NULL DEFAULT 0,
  `closed` tinyint(1) NOT NULL DEFAULT 0,
  `hidden` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `myaac_forum_boards`
--

INSERT INTO `myaac_forum_boards` (`id`, `name`, `description`, `ordering`, `guild`, `access`, `closed`, `hidden`) VALUES
(1, 'News', 'News commenting', 0, 0, 0, 1, 0),
(2, 'Trade', 'Trade offers.', 1, 0, 0, 0, 0),
(3, 'Quests', 'Quest making.', 2, 0, 0, 0, 0),
(4, 'Pictures', 'Your pictures.', 3, 0, 0, 0, 0),
(5, 'Bug Report', 'Report bugs there.', 4, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `myaac_gallery`
--

CREATE TABLE `myaac_gallery` (
  `id` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `author` varchar(50) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT 0,
  `hidden` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `myaac_gallery`
--

INSERT INTO `myaac_gallery` (`id`, `comment`, `image`, `thumb`, `author`, `ordering`, `hidden`) VALUES
(1, 'Demon', 'images/gallery/demon.jpg', 'images/gallery/demon_thumb.gif', 'MyAAC', 1, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `myaac_menu`
--

CREATE TABLE `myaac_menu` (
  `id` int(11) NOT NULL,
  `template` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `blank` tinyint(1) NOT NULL DEFAULT 0,
  `color` varchar(6) NOT NULL DEFAULT '',
  `category` int(11) NOT NULL DEFAULT 1,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `enabled` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `myaac_menu`
--

INSERT INTO `myaac_menu` (`id`, `template`, `name`, `link`, `blank`, `color`, `category`, `ordering`, `enabled`) VALUES
(1, 'kathrine', 'Latest News', 'news', 0, '', 1, 0, 1),
(2, 'kathrine', 'News Archive', 'news/archive', 0, '', 1, 1, 1),
(3, 'kathrine', 'Changelog', 'changelog', 0, '', 1, 2, 1),
(4, 'kathrine', 'Account Management', 'account/manage', 0, '', 2, 0, 1),
(5, 'kathrine', 'Create Account', 'account/create', 0, '', 2, 1, 1),
(6, 'kathrine', 'Lost Account?', 'account/lost', 0, '', 2, 2, 1),
(7, 'kathrine', 'Server Rules', 'rules', 0, '', 2, 3, 1),
(8, 'kathrine', 'Downloads', 'downloads', 0, '', 5, 4, 1),
(9, 'kathrine', 'Report Bug', 'bugtracker', 0, '', 2, 5, 1),
(10, 'kathrine', 'Who is Online?', 'online', 0, '', 3, 0, 1),
(11, 'kathrine', 'Characters', 'characters', 0, '', 3, 1, 1),
(12, 'kathrine', 'Guilds', 'guilds', 0, '', 3, 2, 1),
(13, 'kathrine', 'Highscores', 'highscores', 0, '', 3, 3, 1),
(14, 'kathrine', 'Last Deaths', 'lastkills', 0, '', 3, 4, 1),
(15, 'kathrine', 'Houses', 'houses', 0, '', 3, 5, 1),
(16, 'kathrine', 'Bans', 'bans', 0, '', 3, 6, 1),
(17, 'kathrine', 'Forum', 'forum', 0, '', 3, 7, 1),
(18, 'kathrine', 'Team', 'team', 0, '', 3, 8, 1),
(19, 'kathrine', 'Monsters', 'creatures', 0, '', 5, 0, 1),
(20, 'kathrine', 'Spells', 'spells', 0, '', 5, 1, 1),
(21, 'kathrine', 'Server Info', 'serverInfo', 0, '', 5, 2, 1),
(22, 'kathrine', 'Commands', 'commands', 0, '', 5, 3, 1),
(23, 'kathrine', 'Gallery', 'gallery', 0, '', 5, 4, 1),
(24, 'kathrine', 'Experience Table', 'experienceTable', 0, '', 5, 5, 1),
(25, 'kathrine', 'FAQ', 'faq', 0, '', 5, 6, 1),
(26, 'kathrine', 'Buy Points', 'points', 0, '', 6, 0, 1),
(27, 'kathrine', 'Shop Offer', 'gifts', 0, '', 6, 1, 1),
(28, 'kathrine', 'Shop History', 'gifts/history', 0, '', 6, 2, 1),
(29, 'tibiacom', 'Latest News', 'news', 0, '', 1, 0, 1),
(30, 'tibiacom', 'News Archive', 'news/archive', 0, '', 1, 1, 1),
(31, 'tibiacom', 'Changelog', 'changelog', 0, '', 1, 2, 1),
(32, 'tibiacom', 'Account Management', 'account/manage', 0, '', 2, 0, 1),
(33, 'tibiacom', 'Create Account', 'account/create', 0, '', 2, 1, 1),
(34, 'tibiacom', 'Lost Account?', 'account/lost', 0, '', 2, 2, 1),
(35, 'tibiacom', 'Server Rules', 'rules', 0, '', 2, 3, 1),
(36, 'tibiacom', 'Downloads', 'downloads', 0, '', 2, 4, 1),
(37, 'tibiacom', 'Report Bug', 'bugtracker', 0, '', 2, 5, 1),
(38, 'tibiacom', 'Characters', 'characters', 0, '', 3, 0, 1),
(39, 'tibiacom', 'Who Is Online?', 'online', 0, '', 3, 1, 1),
(40, 'tibiacom', 'Highscores', 'highscores', 0, '', 3, 2, 1),
(41, 'tibiacom', 'Last Kills', 'lastkills', 0, '', 3, 3, 1),
(42, 'tibiacom', 'Houses', 'houses', 0, '', 3, 4, 1),
(43, 'tibiacom', 'Guilds', 'guilds', 0, '', 3, 5, 1),
(44, 'tibiacom', 'Polls', 'polls', 0, '', 3, 6, 1),
(45, 'tibiacom', 'Bans', 'bans', 0, '', 3, 7, 1),
(46, 'tibiacom', 'Support List', 'team', 0, '', 3, 8, 1),
(47, 'tibiacom', 'Forum', 'forum', 0, '', 4, 0, 1),
(48, 'tibiacom', 'Creatures', 'creatures', 0, '', 5, 0, 1),
(49, 'tibiacom', 'Spells', 'spells', 0, '', 5, 1, 1),
(50, 'tibiacom', 'Commands', 'commands', 0, '', 5, 2, 1),
(51, 'tibiacom', 'Exp Stages', 'experienceStages', 0, '', 5, 3, 1),
(52, 'tibiacom', 'Gallery', 'gallery', 0, '', 5, 4, 1),
(53, 'tibiacom', 'Server Info', 'serverInfo', 0, '', 5, 5, 1),
(54, 'tibiacom', 'Experience Table', 'experienceTable', 0, '', 5, 6, 1),
(55, 'tibiacom', 'Buy Points', 'points', 0, '', 6, 0, 1),
(56, 'tibiacom', 'Shop Offer', 'gifts', 0, '', 6, 1, 1),
(57, 'tibiacom', 'Shop History', 'gifts/history', 0, '', 6, 2, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `myaac_monsters`
--

CREATE TABLE `myaac_monsters` (
  `id` int(11) NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `mana` int(11) NOT NULL DEFAULT 0,
  `exp` int(11) NOT NULL,
  `health` int(11) NOT NULL,
  `speed_lvl` int(11) NOT NULL DEFAULT 1,
  `use_haste` tinyint(1) NOT NULL,
  `voices` text NOT NULL,
  `immunities` varchar(255) NOT NULL,
  `summonable` tinyint(1) NOT NULL,
  `convinceable` tinyint(1) NOT NULL,
  `race` varchar(255) NOT NULL,
  `loot` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `myaac_monsters`
--

INSERT INTO `myaac_monsters` (`id`, `hidden`, `name`, `mana`, `exp`, `health`, `speed_lvl`, `use_haste`, `voices`, `immunities`, `summonable`, `convinceable`, `race`, `loot`) VALUES
(1, 0, 'Guarda do Castelo', 0, 0, 10000, 1, 0, '[]', '[]', 0, 0, 'blood', '[]'),
(2, 0, 'Laravel', 0, 9999, 50000, 80, 1, '[]', '[\"lifedrain\",\"paralyze\",\"invisible\"]', 0, 0, 'fire', '[{\"id\":\"2160\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"9020\",\"count\":\"2\",\"chance\":\"3000\"},{\"id\":\"11421\",\"count\":\"1\",\"chance\":\"1000\"}]'),
(3, 0, 'Boss Tower', 670, 5000, 10000, 1, 0, '[\"Gaaahhh!\",\"Tssss!\"]', '[\"lifedrain\",\"paralyze\",\"drown\"]', 0, 1, 'blood', '[]'),
(4, 0, 'Drogorion', 670, 45000, 50000, 105, 0, '[\"Gaaahhh!\",\"Tssss!\"]', '[\"lifedrain\",\"paralyze\",\"drown\"]', 0, 1, 'blood', '[]'),
(5, 0, 'Amazon', 390, 60, 110, 1, 0, '[\"Yeeee ha!\",\"Your head shall be mine!\"]', '[]', 1, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"10\",\"chance\":\"23000\"},{\"id\":\"2229\",\"count\":\"2\",\"chance\":\"55500\"},{\"id\":\"2379\",\"count\":1,\"chance\":\"81000\"},{\"id\":\"2467\",\"count\":1,\"chance\":\"43000\"},{\"id\":\"2691\",\"count\":1,\"chance\":\"26000\"},{\"id\":\"2385\",\"count\":1,\"chance\":\"22000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2526\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2125\",\"count\":1,\"chance\":\"500\"}]'),
(6, 0, 'Valkyrie', 450, 85, 190, 1, 0, '[\"Another head for me!\",\"Head off!\",\"Your head will be mine!\",\"Stand still!\",\"One more head for me!\"]', '[]', 1, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"12\",\"chance\":\"20000\"},{\"id\":\"2666\",\"count\":\"3\",\"chance\":\"20000\"},{\"id\":\"2674\",\"count\":\"4\",\"chance\":\"10000\"},{\"id\":\"2229\",\"count\":\"2\",\"chance\":\"55500\"},{\"id\":\"2379\",\"count\":1,\"chance\":\"15000\"},{\"id\":\"2458\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"2464\",\"count\":1,\"chance\":\"8000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2389\",\"count\":\"3\",\"chance\":\"10000\"},{\"id\":\"3965\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2125\",\"count\":1,\"chance\":\"850\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"800\"},{\"id\":\"2200\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"7618\",\"count\":1,\"chance\":\"500\"}]'),
(7, 0, 'Carrion Worm', 380, 70, 145, 1, 0, '[]', '[]', 0, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"49\",\"chance\":\"20750\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"20000\"},{\"id\":\"2671\",\"count\":1,\"chance\":\"18000\"},{\"id\":\"3976\",\"count\":\"5\",\"chance\":\"50000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2398\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"2376\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2412\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2530\",\"count\":1,\"chance\":\"1000\"}]'),
(8, 0, 'Rotworm', 305, 40, 65, 1, 0, '[]', '[]', 0, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"88\",\"chance\":\"80750\"},{\"id\":\"3976\",\"count\":\"5\",\"chance\":\"50000\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"50000\"},{\"id\":\"2671\",\"count\":\"2\",\"chance\":\"18000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2376\",\"count\":1,\"chance\":\"30000\"},{\"id\":\"2398\",\"count\":1,\"chance\":\"80000\"},{\"id\":\"2480\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2530\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2412\",\"count\":1,\"chance\":\"5000\"}]'),
(9, 0, 'Kongra', 0, 115, 340, 1, 1, '[\"Hugah!\",\"Ungh! Ungh!\",\"Huaauaauaauaa!\"]', '[]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"40\",\"chance\":\"49000\"},{\"id\":\"2676\",\"count\":\"11\",\"chance\":\"5000\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2200\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"5883\",\"count\":1,\"chance\":\"1300\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2166\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2209\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"7618\",\"count\":1,\"chance\":\"9000\"}]'),
(10, 0, 'Merlkin', 0, 145, 235, 1, 0, '[\"Ugh! Ugh! Ugh!\",\"Holy banana!\",\"Chakka! Chakka!\"]', '[\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"62\",\"chance\":\"19500\"},{\"id\":\"2676\",\"count\":\"12\",\"chance\":\"5500\"},{\"id\":\"2675\",\"count\":\"5\",\"chance\":\"1700\"},{\"id\":\"2188\",\"count\":1,\"chance\":\"1750\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2162\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"7620\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"5883\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"3966\",\"count\":1,\"chance\":\"400\"}]'),
(11, 0, 'Sibang', 0, 105, 225, 1, 1, '[\"Eeeeek! Eeeeek\",\"Huh! Huh! Huh!\",\"Ahhuuaaa!\"]', '[\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"560000\"},{\"id\":\"2676\",\"count\":\"12\",\"chance\":\"6000\"},{\"id\":\"2678\",\"count\":\"5\",\"chance\":\"11500\"},{\"id\":\"2675\",\"count\":\"5\",\"chance\":\"11500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2682\",\"count\":1,\"chance\":\"10750\"},{\"id\":\"2458\",\"count\":1,\"chance\":\"4600\"},{\"id\":\"5883\",\"count\":1,\"chance\":\"1650\"}]'),
(12, 0, 'Crystal Spider', 0, 900, 1250, 60, 1, '[\"Screeech!\"]', '[\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"50\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"45\",\"chance\":\"100000\"},{\"id\":\"7364\",\"count\":\"7\",\"chance\":\"2500\"},{\"id\":\"2478\",\"count\":1,\"chance\":\"8600\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"6500\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2457\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7437\",\"count\":1,\"chance\":\"1100\"},{\"id\":\"5879\",\"count\":1,\"chance\":\"1100\"},{\"id\":\"7449\",\"count\":1,\"chance\":\"725\"},{\"id\":\"7589\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2477\",\"count\":1,\"chance\":\"200\"},{\"id\":\"7290\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2169\",\"count\":1,\"chance\":\"450\"},{\"id\":\"7902\",\"count\":1,\"chance\":\"300\"},{\"id\":\"2476\",\"count\":1,\"chance\":\"200\"},{\"id\":\"2171\",\"count\":1,\"chance\":\"250\"}]'),
(13, 0, 'Giant Spider', 0, 900, 1300, 30, 1, '[]', '[\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'venom', '[{\"id\":\"2478\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"2148\",\"count\":\"57\",\"chance\":\"23000\"},{\"id\":\"2148\",\"count\":\"28\",\"chance\":\"23000\"},{\"id\":\"2148\",\"count\":\"30\",\"chance\":\"23000\"},{\"id\":\"2477\",\"count\":1,\"chance\":\"600\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"8600\"},{\"id\":\"2545\",\"count\":\"12\",\"chance\":\"7500\"},{\"id\":\"5879\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2457\",\"count\":1,\"chance\":\"5300\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7588\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2169\",\"count\":1,\"chance\":\"1375\"},{\"id\":\"2476\",\"count\":1,\"chance\":\"500\"},{\"id\":\"7901\",\"count\":1,\"chance\":\"250\"},{\"id\":\"2171\",\"count\":1,\"chance\":\"400\"}]'),
(14, 0, 'Poison Spider', 270, 22, 26, 1, 0, '[]', '[]', 1, 1, 'venom', '[{\"id\":\"2148\",\"count\":\"4\",\"chance\":\"15500\"}]'),
(15, 0, 'Scorpion', 310, 45, 45, 1, 0, '[]', '[]', 1, 1, 'venom', '[]'),
(16, 0, 'Spider', 210, 12, 20, 1, 0, '[]', '[]', 1, 1, 'venom', '[{\"id\":\"2148\",\"count\":\"5\",\"chance\":\"20000\"}]'),
(17, 0, 'Tarantula', 485, 120, 225, 30, 1, '[]', '[\"outfit\",\"drunk\"]', 1, 1, 'venom', '[{\"id\":\"2478\",\"count\":1,\"chance\":\"3250\"},{\"id\":\"2148\",\"count\":\"40\",\"chance\":\"23000\"},{\"id\":\"2510\",\"count\":1,\"chance\":\"1800\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2457\",\"count\":1,\"chance\":\"1250\"},{\"id\":\"2169\",\"count\":1,\"chance\":\"200\"}]'),
(18, 0, 'Achad', 0, 70, 185, 1, 0, '[\"You won\'t pass me.\",\"I have travelled far to fight here.\"]', '[\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'blood', '[]'),
(19, 0, 'Axeitus Headbanger', 0, 140, 365, 1, 0, '[\"Hicks!\",\"Stand still! Both of you! hicks\",\"This victory will earn me a casket of beer.\"]', '[\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'blood', '[]'),
(20, 0, 'Bloodpaw', 0, 50, 100, 1, 0, '[]', '[\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'blood', '[]'),
(21, 0, 'Bovinus', 0, 60, 150, 1, 0, '[]', '[\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'blood', '[]'),
(22, 0, 'Colerian The Barbarian', 0, 90, 265, 1, 0, '[\"Flee, coward!\",\"You will lose!\",\"Yeehaawh\"]', '[\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'blood', '[]'),
(23, 0, 'Cursed Gladiator', 0, 215, 435, 1, 0, '[\"Death where are you?\"]', '[\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'undead', '[]'),
(24, 0, 'Frostfur', 0, 35, 65, 1, 0, '[]', '[\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'blood', '[]'),
(25, 0, 'Orcus the Cruel', 0, 280, 480, 5, 0, '[]', '[\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'blood', '[]'),
(26, 0, 'Rocky', 0, 190, 250, 1, 0, '[\"Another little gladiator!\",\"Come into my embrace.\"]', '[\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'undead', '[]'),
(27, 0, 'The Hairy One', 0, 115, 325, 10, 0, '[\"Hugah!\",\"Ungh! Ungh!\"]', '[\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'blood', '[]'),
(28, 0, 'Avalanche', 0, 305, 550, 1, 0, '[\"You will pay for imprisoning me here.\"]', '[\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'undead', '[]'),
(29, 0, 'Drasilla', 0, 700, 1320, 1, 0, '[\"FCHHHHHHHH!\",\"GROOOOAAAAAAAAR!\",\"DIRTY LITTLE HUMANS\",\"YOU CAN\'T KEEP ME HERE FOREVER\"]', '[\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'blood', '[]'),
(30, 0, 'Grimgor Guteater', 0, 670, 1115, 10, 0, '[\"Dont run, You\'re burning off precious fat.\"]', '[\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'blood', '[]'),
(31, 0, 'Kreebosh the Exile', 0, 350, 880, 25, 0, '[\"I bet you wish you weren\'t here.\"]', '[\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'blood', '[]'),
(32, 0, 'Slim', 0, 580, 1025, 1, 0, '[\"Zhroozzzzs.\"]', '[\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'undead', '[]'),
(33, 0, 'Spirit of Earth', 0, 800, 1285, 1, 0, '[\"Show your strengh ... or perish.\"]', '[\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'undead', '[]'),
(34, 0, 'Spirit of Fire', 0, 950, 2140, 1, 0, '[\"Feel the heat.\"]', '[\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'blood', '[]'),
(35, 0, 'Spirit of Water', 0, 850, 1517, 1, 0, '[\"Blubb\"]', '[\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'undead', '[]'),
(36, 0, 'The Dark Dancer', 0, 435, 855, 1, 0, '[\"I hope you like my voice!\"]', '[\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'blood', '[]'),
(37, 0, 'The Hag', 0, 510, 935, 1, 0, '[\"If you think I am to old to fight then you\'re wrong!\",\"I\'ve forgotten more things then you have ever learned!\",\"Let me teach you a few things youngster!\",\"I\'ll teach you respect for the old!\"]', '[\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'blood', '[]'),
(38, 0, 'Darakan the Executioner', 0, 1600, 3500, 1, 0, '[\"FIGHT LIKE A BARBARIAN!\",\"VICTORY IS MINE!\",\"I AM your father!\",\"To be the man you have to beat the man!\"]', '[\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'blood', '[]'),
(39, 0, 'Deathbringer', 0, 5100, 10000, 40, 0, '[\"YOU FOOLS WILL PAY!\",\"YOU ALL WILL DIE!!\",\"DEATH, DESTRUCTION!\",\"I will eat your soul!\"]', '[\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'undead', '[]'),
(40, 0, 'Fallen Mooh\'tah Master Ghar', 0, 4400, 8000, 1, 0, '[\"I will finish you!\",\"You are no match for a master of the Mooh\'Tha!\",\"I might be fallen but you will fall before me!\"]', '[\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'blood', '[]'),
(41, 0, 'Gnorre Chyllson', 0, 4000, 7100, 75, 0, '[\"I am like the merciless northwind.\",\"Snow will be your death shroud.\",\"Feel the wrath of father chyll!\"]', '[\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'blood', '[]'),
(42, 0, 'Norgle Glacierbeard', 0, 2100, 4300, 1, 0, '[\"I\'ll extinguish you warmbloods.\",\"REVENGE!\",\"Far too hot.\",\"DISGUSTING WARMBLOODS!\",\"Revenge is sweetest when served cold.\"]', '[\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'blood', '[]'),
(43, 0, 'Svoren the Mad', 0, 3000, 6300, 1, 0, '[\"NO mommy NO. Leave me alone!\",\"Not that tower again!\"]', '[\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'blood', '[]'),
(44, 0, 'The Masked Marauder', 0, 3500, 6800, 15, 0, '[\"Didn\'t you leave your house door open?\",\"Oops, your shoelaces are open!\"]', '[\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'blood', '[]'),
(45, 0, 'The Obliverator', 0, 6000, 9500, 30, 0, '[\"NO ONE WILL BEAT ME!\"]', '[\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'fire', '[]'),
(46, 0, 'The Pit Lord', 0, 2500, 4500, 25, 1, '[\"I\'LL GET YOU ALL!\",\"I won\'t let you escape!\",\"I\'ll crush you beneath my feet!\"]', '[\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'blood', '[]'),
(47, 0, 'Webster', 0, 1200, 1750, 35, 1, '[\"You are lost!\",\"Come my little morsel.\"]', '[\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'undead', '[]'),
(48, 0, 'Barbarian Bloodwalker', 590, 195, 305, 1, 1, '[\"YAAAHEEE!\",\"SLAUGHTER!\",\"CARNAGE!\",\"You can run but you can\'t hide\"]', '[]', 0, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"15\",\"chance\":\"20000\"},{\"id\":\"2671\",\"count\":1,\"chance\":\"14250\"},{\"id\":\"2044\",\"count\":1,\"chance\":\"12500\"},{\"id\":\"2381\",\"count\":1,\"chance\":\"10750\"},{\"id\":\"2458\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"2378\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"2464\",\"count\":1,\"chance\":\"5400\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"5911\",\"count\":1,\"chance\":\"250\"},{\"id\":\"7618\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"3962\",\"count\":1,\"chance\":\"500\"},{\"id\":\"7457\",\"count\":1,\"chance\":\"500\"},{\"id\":\"7290\",\"count\":1,\"chance\":\"300\"}]'),
(49, 0, 'Barbarian Brutetamer', 0, 90, 145, 25, 0, '[\"To me, creatures of the wild!\",\"My instincts tell me about your cowardice.\"]', '[\"lifedrain\",\"paralyze\",\"outfit\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"15\",\"chance\":\"48000\"},{\"id\":\"2671\",\"count\":\"3\",\"chance\":\"6300\"},{\"id\":\"3965\",\"count\":1,\"chance\":\"8650\"},{\"id\":\"2686\",\"count\":\"2\",\"chance\":\"8000\"},{\"id\":\"2464\",\"count\":1,\"chance\":\"8100\"},{\"id\":\"2401\",\"count\":1,\"chance\":\"5500\"},{\"id\":\"7343\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"1958\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"7620\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"7379\",\"count\":1,\"chance\":\"850\"},{\"id\":\"7457\",\"count\":1,\"chance\":\"650\"},{\"id\":\"7464\",\"count\":1,\"chance\":\"300\"},{\"id\":\"7463\",\"count\":1,\"chance\":\"300\"}]'),
(50, 0, 'Barbarian Headsplitter', 450, 85, 100, 25, 0, '[\"I will regain my honor with your blood!\",\"Surrender is not option!\",\"Its you or me!\"]', '[\"paralyze\"]', 0, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"30\",\"chance\":\"40000\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"61500\"},{\"id\":\"2403\",\"count\":1,\"chance\":\"15500\"},{\"id\":\"2460\",\"count\":1,\"chance\":\"16750\"},{\"id\":\"2483\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"2473\",\"count\":1,\"chance\":\"3850\"},{\"id\":\"2320\",\"count\":1,\"chance\":\"2600\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"5913\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"7618\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2168\",\"count\":1,\"chance\":\"750\"},{\"id\":\"7461\",\"count\":1,\"chance\":\"500\"},{\"id\":\"7449\",\"count\":1,\"chance\":\"650\"},{\"id\":\"7457\",\"count\":1,\"chance\":\"300\"}]'),
(51, 0, 'Barbarian Skullhunter', 450, 85, 135, 25, 0, '[\"You will become my trophy.\",\"Fight harder, coward.\",\"Show that you are a worthy opponent.\"]', '[\"drunk\",\"paralyze\"]', 0, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"30\",\"chance\":\"40000\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"47500\"},{\"id\":\"2460\",\"count\":1,\"chance\":\"17000\"},{\"id\":\"2403\",\"count\":1,\"chance\":\"19250\"},{\"id\":\"2473\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"2483\",\"count\":1,\"chance\":\"3850\"},{\"id\":\"2229\",\"count\":1,\"chance\":\"1300\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7449\",\"count\":1,\"chance\":\"450\"},{\"id\":\"5913\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2168\",\"count\":1,\"chance\":\"750\"},{\"id\":\"7462\",\"count\":1,\"chance\":\"400\"},{\"id\":\"7457\",\"count\":1,\"chance\":\"300\"}]'),
(52, 0, 'Bear', 300, 23, 80, 1, 0, '[\"grrrr\",\"groar\"]', '[]', 1, 1, 'blood', '[{\"id\":\"5896\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2671\",\"count\":\"3\",\"chance\":\"25000\"},{\"id\":\"2666\",\"count\":\"4\",\"chance\":\"46750\"},{\"id\":\"3976\",\"count\":\"3\",\"chance\":\"3000\"},{\"id\":\"5902\",\"count\":1,\"chance\":\"1700\"}]'),
(53, 0, 'Panda', 300, 23, 80, 10, 0, '[\"Grrrr\",\"Groar\"]', '[]', 1, 1, 'blood', '[{\"id\":\"2666\",\"count\":\"4\",\"chance\":\"17500\"},{\"id\":\"2671\",\"count\":\"2\",\"chance\":\"20000\"}]'),
(54, 0, 'Polar Bear', 315, 28, 85, 1, 0, '[\"Grrrrrr\",\"GROARRR!\"]', '[]', 1, 1, 'blood', '[{\"id\":\"2671\",\"count\":\"2\",\"chance\":\"24000\"},{\"id\":\"2666\",\"count\":\"4\",\"chance\":\"19750\"},{\"id\":\"5896\",\"count\":1,\"chance\":\"1000\"}]'),
(55, 0, 'Beholder', 0, 170, 260, 1, 0, '[\"Eye for eye!\",\"Here\'s looking at you!\",\"Let me take a look at you!\",\"You\'ve got the look!\"]', '[\"invisible\"]', 0, 0, 'venom', '[{\"id\":\"2148\",\"count\":\"60\",\"chance\":\"35000\"},{\"id\":\"2397\",\"count\":1,\"chance\":\"7250\"},{\"id\":\"2394\",\"count\":1,\"chance\":\"6000\"},{\"id\":\"2512\",\"count\":1,\"chance\":\"2750\"},{\"id\":\"2175\",\"count\":1,\"chance\":\"5650\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"90000\"},{\"id\":\"2509\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"2377\",\"count\":1,\"chance\":\"3800\"},{\"id\":\"5898\",\"count\":1,\"chance\":\"775\"},{\"id\":\"7620\",\"count\":1,\"chance\":\"750\"},{\"id\":\"2181\",\"count\":1,\"chance\":\"725\"},{\"id\":\"2518\",\"count\":1,\"chance\":\"250\"}]'),
(56, 0, 'Braindeath', 0, 895, 1225, 25, 0, '[\"You have disturbed my thoughts!\",\"Let me turn you into something more useful!\",\"Let me taste your brain!\",\"You will be punished!\"]', '[\"earth\",\"death\",\"invisible\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"35000\"},{\"id\":\"7364\",\"count\":\"4\",\"chance\":\"10000\"},{\"id\":\"2175\",\"count\":1,\"chance\":\"7500\"},{\"id\":\"2450\",\"count\":1,\"chance\":\"8000\"},{\"id\":\"2423\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"2509\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"80000\"},{\"id\":\"5898\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"7407\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2518\",\"count\":1,\"chance\":\"750\"},{\"id\":\"7452\",\"count\":1,\"chance\":\"950\"},{\"id\":\"3972\",\"count\":1,\"chance\":\"500\"}]'),
(57, 0, 'Elder Beholder', 0, 280, 1100, 25, 0, '[\"Let me take a look at you!\",\"Inferior creatures, bow before my power!\"]', '[\"lifedrain\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"60\",\"chance\":\"30000\"},{\"id\":\"2148\",\"count\":\"45\",\"chance\":\"30000\"},{\"id\":\"2397\",\"count\":1,\"chance\":\"12500\"},{\"id\":\"2394\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"2175\",\"count\":1,\"chance\":\"7500\"},{\"id\":\"2509\",\"count\":1,\"chance\":\"6000\"},{\"id\":\"2377\",\"count\":1,\"chance\":\"6000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"80000\"},{\"id\":\"7364\",\"count\":\"5\",\"chance\":\"10000\"},{\"id\":\"7589\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"5898\",\"count\":1,\"chance\":\"1250\"},{\"id\":\"2181\",\"count\":1,\"chance\":\"1250\"},{\"id\":\"2518\",\"count\":1,\"chance\":\"400\"},{\"id\":\"3972\",\"count\":1,\"chance\":\"400\"}]'),
(58, 0, 'Gazer', 0, 90, 120, 10, 1, '[\"Mommy!?\",\"Buuuuhaaaahhaaaaa!\",\"Me need mana!\"]', '[\"invisible\"]', 0, 0, 'venom', '[]'),
(59, 0, 'Bog Raider', 0, 800, 1300, 40, 1, '[\"Tchhh!\",\"Slurp!\"]', '[\"paralyze\",\"invisible\"]', 0, 0, 'venom', '[{\"id\":\"2148\",\"count\":\"65\",\"chance\":\"28000\"},{\"id\":\"2148\",\"count\":\"64\",\"chance\":\"28000\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"5500\"},{\"id\":\"2647\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"8473\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"8472\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"8872\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"8912\",\"count\":1,\"chance\":\"800\"},{\"id\":\"8873\",\"count\":1,\"chance\":\"300\"},{\"id\":\"8891\",\"count\":1,\"chance\":\"200\"}]'),
(60, 0, 'Carniphila', 0, 150, 255, 10, 0, '[]', '[\"invisible\"]', 0, 0, 'venom', '[{\"id\":\"2148\",\"count\":\"37\",\"chance\":\"43000\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"36500\"},{\"id\":\"2671\",\"count\":\"2\",\"chance\":\"20000\"},{\"id\":\"2802\",\"count\":1,\"chance\":\"8000\"},{\"id\":\"2804\",\"count\":1,\"chance\":\"8000\"},{\"id\":\"2747\",\"count\":1,\"chance\":\"7500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"90000\"},{\"id\":\"2792\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"7732\",\"count\":1,\"chance\":\"3000\"}]'),
(61, 0, 'Defiler', 0, 3700, 3650, 20, 0, '[\"Blubb\"]', '[\"paralyze\",\"invisible\"]', 0, 0, 'venom', '[{\"id\":\"6500\",\"count\":1,\"chance\":\"33000\"},{\"id\":\"2148\",\"count\":\"95\",\"chance\":\"20000\"},{\"id\":\"2148\",\"count\":\"95\",\"chance\":\"20000\"},{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"20000\"},{\"id\":\"5944\",\"count\":1,\"chance\":\"27800\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"90000\"},{\"id\":\"2151\",\"count\":1,\"chance\":\"5500\"},{\"id\":\"2152\",\"count\":\"4\",\"chance\":\"5000\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"6300\",\"count\":1,\"chance\":\"450\"}]'),
(62, 0, 'Haunted Treeling', 0, 310, 450, 20, 0, '[]', '[\"earth\"]', 0, 0, 'undead', '[{\"id\":\"2213\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2148\",\"count\":\"96\",\"chance\":\"35000\"},{\"id\":\"7618\",\"count\":1,\"chance\":\"7200\"},{\"id\":\"2790\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2788\",\"count\":1,\"chance\":\"8000\"},{\"id\":\"4860\",\"count\":1,\"chance\":\"50000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7588\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"3821\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2787\",\"count\":\"2\",\"chance\":\"2200\"},{\"id\":\"7443\",\"count\":1,\"chance\":\"300\"}]'),
(63, 0, 'Slime', 0, 160, 150, 1, 0, '[]', '[]', 0, 0, 'venom', '[]'),
(64, 0, 'Son of Verminor', 0, 5900, 8500, 1, 0, '[]', '[\"poison\"]', 0, 0, 'venom', '[]'),
(65, 0, 'Spit Nettle', 0, 20, 150, 1, 0, '[]', '[\"paralyze\",\"invisible\"]', 0, 0, 'venom', '[{\"id\":\"2148\",\"count\":\"5\",\"chance\":\"12500\"},{\"id\":\"2804\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2802\",\"count\":\"2\",\"chance\":\"7500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"90000\"},{\"id\":\"2802\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2802\",\"count\":1,\"chance\":\"2500\"}]'),
(66, 0, 'Chicken', 220, 0, 15, 1, 0, '[\"gokgoooook\",\"cluck cluck\"]', '[]', 1, 1, 'blood', '[{\"id\":\"3976\",\"count\":\"3\",\"chance\":\"22500\"},{\"id\":\"5890\",\"count\":\"1\",\"chance\":\"25000\"},{\"id\":\"2695\",\"count\":1,\"chance\":\"1700\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"3250\"}]'),
(67, 0, 'Flamingo', 250, 0, 25, 1, 0, '[]', '[]', 1, 1, 'blood', '[]'),
(68, 0, 'Parrot', 250, 0, 25, 10, 0, '[\"BR? PL? SWE?\",\"Screeech!\",\"Neeeewbiiieee!\",\"You advanshed, you advanshed!\",\"Hope you die and loooosh it!\",\"Hunterrr ish PK!\",\"Shhtop whining! Rrah\",\"I\'m heeerrre! Screeeech!\",\"Leeave orrr hunted!!\",\"Blesshhh my stake! Screeech!\",\"Tarrrrp?\",\"You are corrrrupt! Corrrrupt!\",\"You powerrrrrrabuserrrrr!\",\"You advanshed, you advanshed!\"]', '[]', 1, 1, 'blood', '[]'),
(69, 0, 'Penguin', 300, 1, 33, 1, 0, '[]', '[]', 1, 1, 'blood', '[{\"id\":\"2667\",\"count\":\"2\",\"chance\":\"5000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7159\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"7158\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2669\",\"count\":1,\"chance\":\"3000\"}]'),
(70, 0, 'Seagull', 250, 0, 25, 1, 0, '[]', '[]', 1, 0, 'blood', '[]'),
(71, 0, 'Terror Bird', 490, 150, 300, 30, 0, '[\"CRAAAHHH!\",\"Gruuuh Gruuuh.\",\"Carrah Carrah!\"]', '[]', 1, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"30\",\"chance\":\"22500\"},{\"id\":\"3976\",\"count\":\"3\",\"chance\":\"15000\"},{\"id\":\"2148\",\"count\":\"3\",\"chance\":\"11000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"3970\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"3970\",\"count\":1,\"chance\":\"750\"},{\"id\":\"3970\",\"count\":1,\"chance\":\"2500\"}]'),
(72, 0, 'Acid Blob', 0, 250, 250, 1, 0, '[]', '[\"death\",\"earth\"]', 0, 0, 'venom', '[{\"id\":\"9967\",\"count\":1,\"chance\":\"20000\"}]'),
(73, 0, 'Death Blob', 0, 300, 320, 5, 0, '[]', '[]', 0, 0, 'undead', '[{\"id\":\"9968\",\"count\":1,\"chance\":\"20000\"}]'),
(74, 0, 'Mercury Blob', 0, 180, 150, 1, 0, '[\"Crackle\"]', '[\"death\"]', 0, 0, 'undead', '[{\"id\":\"9966\",\"count\":1,\"chance\":\"20000\"}]'),
(75, 0, 'Annihilon', 0, 10000, 60000, 80, 1, '[\"Annihilation!\"]', '[\"lifedrain\",\"invisible\"]', 0, 0, 'fire', '[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"50\",\"chance\":\"100000\"},{\"id\":\"2520\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2520\",\"count\":1,\"chance\":\"7600\"},{\"id\":\"2165\",\"count\":1,\"chance\":\"10000\"}]'),
(76, 0, 'Apprentice Sheng', 0, 100, 95, 1, 0, '[\"I will protect the secrets of my master!\",\"This isle will become ours alone!\",\"Kaplar!\"]', '[\"energy\"]', 0, 0, 'blood', '[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2461\",\"count\":1,\"chance\":\"8000\"},{\"id\":\"2649\",\"count\":1,\"chance\":\"8000\"},{\"id\":\"5878\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2404\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2362\",\"count\":\"5\",\"chance\":\"20000\"},{\"id\":\"2817\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2311\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"7425\",\"count\":1,\"chance\":\"1000\"}]'),
(77, 0, 'Barbaria', 0, 355, 555, 30, 0, '[\"To me, creatures of the wild!\",\"My instincts tell me about your cowardice.\"]', '[\"lifedrain\",\"paralyze\",\"drunk\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"35\",\"chance\":\"48000\"},{\"id\":\"2464\",\"count\":1,\"chance\":\"11000\"},{\"id\":\"3965\",\"count\":1,\"chance\":\"12500\"},{\"id\":\"7343\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"25000\"},{\"id\":\"1958\",\"count\":1,\"chance\":\"15000\"}]'),
(78, 0, 'Big Boss Trolliver', 0, 105, 150, 1, 0, '[]', '[]', 0, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"57\",\"chance\":\"6000\"},{\"id\":\"2666\",\"count\":\"3\",\"chance\":\"1500\"},{\"id\":\"2389\",\"count\":\"2\",\"chance\":\"2000\"},{\"id\":\"2448\",\"count\":1,\"chance\":\"5000\"}]'),
(79, 0, 'Bones', 0, 3750, 9500, 40, 0, '[\"Your new name is breakfast.\",\"Keep that dog away!\",\"Out Fluffy! Out! Bad dog!\"]', '[\"drunk\",\"invisible\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"50000\"},{\"id\":\"5741\",\"count\":1,\"chance\":\"50000\"},{\"id\":\"6500\",\"count\":1,\"chance\":\"1538\"},{\"id\":\"6570\",\"count\":\"3\",\"chance\":\"5538\"},{\"id\":\"6571\",\"count\":1,\"chance\":\"1538\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"6300\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"5944\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"4851\",\"count\":1,\"chance\":\"800\"},{\"id\":\"2207\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"7430\",\"count\":1,\"chance\":\"50000\"},{\"id\":\"2413\",\"count\":1,\"chance\":\"4000\"}]'),
(80, 0, 'Brutus Bloodbeard', 0, 500, 1200, 10, 0, '[]', '[\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"6099\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"40\",\"chance\":\"100000\"},{\"id\":\"2476\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2320\",\"count\":1,\"chance\":\"100000\"}]'),
(81, 0, 'Countess Sorrow', 0, 5150, 7200, 15, 0, '[]', '[\"physical\",\"poison\",\"ice\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'undead', '[{\"id\":\"6536\",\"count\":1,\"chance\":\"100000\"}]'),
(82, 0, 'Deadeye Devious', 0, 500, 2000, 40, 0, '[\"Let\'s kill \'em\",\"Arrrgh!\",\"You\'ll never take me alive!\"]', '[\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"6102\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"65\",\"chance\":\"100000\"},{\"id\":\"2476\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2320\",\"count\":\"2\",\"chance\":\"100000\"},{\"id\":\"5926\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2666\",\"count\":1,\"chance\":\"100000\"}]'),
(83, 0, 'Demodras', 0, 4000, 4500, 5, 0, '[\"I WILL SET THE WORLD IN FIRE!\",\"I WILL PROTECT MY BROOD!\"]', '[\"paralyze\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2672\",\"count\":\"2\",\"chance\":\"20000\"},{\"id\":\"2033\",\"count\":1,\"chance\":\"1818\"},{\"id\":\"1976\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2413\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2498\",\"count\":1,\"chance\":\"588\"},{\"id\":\"2492\",\"count\":1,\"chance\":\"333\"},{\"id\":\"2547\",\"count\":\"10\",\"chance\":\"2222\"},{\"id\":\"2546\",\"count\":\"5\",\"chance\":\"2222\"},{\"id\":\"2796\",\"count\":\"1\",\"chance\":\"6666\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2392\",\"count\":1,\"chance\":\"1428\"},{\"id\":\"2528\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"5948\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"5882\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"5919\",\"count\":1,\"chance\":\"100000\"}]'),
(84, 0, 'Dharalion', 0, 380, 380, 10, 1, '[\"Feel my wrath!\",\"Noone will stop my ascension!\",\"My powers are divine!\"]', '[\"fire\",\"poison\",\"lifedrain\",\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"1949\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2578\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2401\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2642\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2682\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2802\",\"count\":\"1\",\"chance\":\"10000\"},{\"id\":\"2600\",\"count\":1,\"chance\":\"33333\"},{\"id\":\"2177\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"2689\",\"count\":\"3\",\"chance\":\"20000\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2652\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2544\",\"count\":\"10\",\"chance\":\"20000\"},{\"id\":\"2456\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2032\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2062\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"2125\",\"count\":1,\"chance\":\"1818\"},{\"id\":\"2154\",\"count\":1,\"chance\":\"1333\"}]'),
(85, 0, 'Dire Penguin', 0, 120, 173, 1, 0, '[]', '[\"lifedrain\",\"paralyze\",\"outfit\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"10\",\"chance\":\"18000\"},{\"id\":\"2667\",\"count\":\"4\",\"chance\":\"8000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7159\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"7158\",\"count\":1,\"chance\":\"8000\"},{\"id\":\"2434\",\"count\":1,\"chance\":\"500\"}]'),
(86, 0, 'Dracola', 0, 7750, 15850, 95, 0, '[\"DEATH CAN\'T STOP MY HUNGER!\"]', '[\"paralyze\",\"invisible\"]', 0, 0, 'undead', '[{\"id\":\"2152\",\"count\":\"8\",\"chance\":\"20000\"},{\"id\":\"6500\",\"count\":\"4\",\"chance\":\"1000\"},{\"id\":\"6546\",\"count\":1,\"chance\":\"100000\"}]'),
(87, 0, 'Fernfang', 0, 400, 400, 10, 1, '[\"You desecrated this place!\",\"I will cleanse this isle!\",\"Grrrrrrr\",\"Yoooohhuuuu!\"]', '[\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"1949\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2467\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2642\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2044\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2689\",\"count\":\"3\",\"chance\":\"20000\"},{\"id\":\"2401\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2166\",\"count\":1,\"chance\":\"1428\"}]'),
(88, 0, 'Ferumbras', 0, 12000, 35000, 50, 1, '[\"NOONE WILL STOP ME THIS TIME!\",\"THE POWER IS MINE!\"]', '[\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'venom', '[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"25\",\"chance\":\"100000\"},{\"id\":\"2393\",\"count\":1,\"chance\":\"16060\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"12050\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2678\",\"count\":\"3\",\"chance\":\"20000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2151\",\"count\":\"4\",\"chance\":\"12000\"},{\"id\":\"5903\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2171\",\"count\":1,\"chance\":\"30000\"},{\"id\":\"2415\",\"count\":1,\"chance\":\"6000\"}]'),
(89, 0, 'Fluffy', 0, 3550, 4500, 45, 0, '[\"Wooof!\"]', '[\"drunk\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"5944\",\"count\":1,\"chance\":\"5555\"},{\"id\":\"6570\",\"count\":\"4\",\"chance\":\"5538\"},{\"id\":\"6571\",\"count\":1,\"chance\":\"1538\"},{\"id\":\"2671\",\"count\":\"8\",\"chance\":\"50000\"},{\"id\":\"2230\",\"count\":1,\"chance\":\"25000\"},{\"id\":\"6500\",\"count\":1,\"chance\":\"7200\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2430\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"2383\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"6558\",\"count\":1,\"chance\":\"8888\"}]'),
(90, 0, 'Foreman Kneebiter', 0, 570, 445, 1, 0, '[]', '[\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"5880\",\"count\":\"2\",\"chance\":\"2500\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"90000\"},{\"id\":\"2513\",\"count\":1,\"chance\":\"6666\"}]'),
(91, 0, 'General Murius', 0, 300, 550, 10, 0, '[\"Feel the power of the Mooh\'Tah!\",\"You will get what you deserve!\",\"For the king!\"]', '[\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"30\",\"chance\":\"100000\"},{\"id\":\"2410\",\"count\":\"2\",\"chance\":\"50000\"},{\"id\":\"2419\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2510\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2667\",\"count\":\"1\",\"chance\":\"20000\"},{\"id\":\"2647\",\"count\":1,\"chance\":\"1818\"},{\"id\":\"2413\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"1988\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"2148\",\"count\":\"1\",\"chance\":\"2857\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2207\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"33333\"},{\"id\":\"2379\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2475\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2397\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2652\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2478\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"1818\"}]'),
(92, 0, 'Ghazbaran', 0, 15000, 60000, 90, 1, '[\"COME HERE AND DIE!\",\"COME AND GIVE ME SOME AMUSEMENT!\",\"IS THAT THE BEST YOU HAVE TO OFFER, TIBIANS?\",\"I AM GHAZBARAN OF THE TRIANGLE... AND I AM HERE TO CHALLENGE YOU ALL!\",\"FLAWLESS VICTORY!\"]', '[\"energy\",\"fire\",\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'undead', '[{\"id\":\"2160\",\"count\":\"12\",\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"18000\"},{\"id\":\"6300\",\"count\":1,\"chance\":\"12000\"},{\"id\":\"5943\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"2003\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7431\",\"count\":1,\"chance\":\"6000\"},{\"id\":\"2393\",\"count\":1,\"chance\":\"60000\"},{\"id\":\"2195\",\"count\":1,\"chance\":\"14033\"}]'),
(93, 0, 'Golgordan', 0, 10000, 40000, 65, 0, '[\"Latrivan your fool\"]', '[\"death\"]', 0, 0, 'fire', '[]'),
(94, 0, 'Grorlam', 0, 2400, 3000, 10, 1, '[]', '[\"paralyze\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"2483\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"1295\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"1294\",\"count\":\"5\",\"chance\":\"20000\"},{\"id\":\"2395\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2580\",\"count\":1,\"chance\":\"5000\"}]'),
(95, 0, 'Hairman The Huge', 0, 335, 600, 5, 1, '[\"Hugah!\",\"Ungh! Ungh!\",\"Huaauaauaauaa!\"]', '[\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"60\",\"chance\":\"50000\"},{\"id\":\"5883\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2676\",\"count\":\"2\",\"chance\":\"7500\"},{\"id\":\"2200\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2166\",\"count\":1,\"chance\":\"7500\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"5000\"}]'),
(96, 0, 'Hellgorak', 0, 10000, 40000, 70, 0, '[\"I\'ll sacrifice yours souls to seven!\",\"I\'m bad news for you mortals!\",\"No man can defeat me!\",\"Your puny skills are no match for me.\",\"I smell your fear.\",\"Delicious!\"]', '[\"lifedrain\",\"paralyze\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"80000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"70000\"},{\"id\":\"2160\",\"count\":\"3\",\"chance\":\"100000\"},{\"id\":\"2143\",\"count\":\"7\",\"chance\":\"3000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"1650\"},{\"id\":\"7590\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"83\",\"chance\":\"60000\"},{\"id\":\"7368\",\"count\":\"25\",\"chance\":\"100000\"}]'),
(97, 0, 'Koshei The Deathless', 0, 0, 2000, 85, 0, '[\"Your pain will be beyond imagination!\",\"You can\'t defeat me! I will ressurect and take your soul!\",\"Death is my ally!\",\"Welcome to my domain, visitor!\",\"You will be my toy on the other side!\",\"What a disgusting smell of life!\"]', '[\"death\",\"earth\",\"paralyze\",\"invisible\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2401\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2171\",\"count\":1,\"chance\":\"1666\"},{\"id\":\"7893\",\"count\":1,\"chance\":\"688\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2535\",\"count\":1,\"chance\":\"588\"},{\"id\":\"2165\",\"count\":1,\"chance\":\"888\"},{\"id\":\"2237\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2148\",\"count\":\"12\",\"chance\":\"80000\"},{\"id\":\"2175\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2179\",\"count\":1,\"chance\":\"900\"},{\"id\":\"3961\",\"count\":1,\"chance\":\"1000\"}]'),
(98, 0, 'Latrivan', 0, 10000, 40000, 60, 0, '[\"I might reward you for killing my brother ~ with a swift dead!\"]', '[\"fire\"]', 0, 0, 'fire', '[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"50\",\"chance\":\"100000\"},{\"id\":\"2152\",\"count\":\"6\",\"chance\":\"80000\"},{\"id\":\"2144\",\"count\":\"28\",\"chance\":\"7777\"},{\"id\":\"7440\",\"count\":1,\"chance\":\"17000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"2171\",\"count\":1,\"chance\":\"12222\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2151\",\"count\":\"13\",\"chance\":\"6500\"},{\"id\":\"2470\",\"count\":1,\"chance\":\"6555\"},{\"id\":\"2432\",\"count\":1,\"chance\":\"8200\"}]'),
(99, 0, 'Lethal Lissy', 0, 500, 1450, 10, 0, '[]', '[\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"6100\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"40\",\"chance\":\"100000\"},{\"id\":\"2476\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2320\",\"count\":\"1\",\"chance\":\"100000\"}]'),
(100, 0, 'Leviathan', 0, 5000, 6000, 269, 0, '[\"CHHHRRRR\",\"HISSSS\"]', '[\"ice\",\"paralyze\",\"invisible\",\"drown\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"40000\"},{\"id\":\"2152\",\"count\":\"6\",\"chance\":\"40000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"40000\"}]'),
(101, 0, 'Lord of the Elements', 0, 8000, 10000, 75, 0, '[]', '[\"holy\",\"earth\",\"physical\",\"fire\",\"death\",\"invisible\"]', 0, 0, 'undead', '[{\"id\":\"2152\",\"count\":\"7\",\"chance\":\"40000\"}]'),
(102, 0, 'Mad Technomancer', 0, 55, 1000, 1, 0, '[\"I\'m going to make them an offer they can\'t refuse.\",\"My masterplan cannot fail!\",\"Gentlemen, you can\'t fight here! This is the War Room!\"]', '[\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"7699\",\"count\":1,\"chance\":\"1000000\"}]'),
(103, 0, 'Madareth', 0, 10000, 55000, 80, 0, '[\"I am going to play with yourself!\"]', '[\"energy\",\"fire\",\"invisible\"]', 0, 0, 'fire', '[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"12650\"},{\"id\":\"2214\",\"count\":1,\"chance\":\"8000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2520\",\"count\":1,\"chance\":\"7650\"}]'),
(104, 0, 'Man in the Cave', 0, 555, 485, 1, 0, '[\"THE MONKS ARE MINE\",\"I will rope you up! All of you!\",\"You have been roped up!\",\"A MIC to rule them all!\"]', '[\"fire\",\"lifedrain\",\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"27\",\"chance\":\"100000\"},{\"id\":\"2120\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2120\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2120\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2691\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"5913\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7290\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"7463\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"7386\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"7458\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2173\",\"count\":1,\"chance\":\"500\"}]'),
(105, 0, 'Massacre', 0, 9800, 30000, 85, 1, '[]', '[\"energy\",\"fire\",\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"6540\",\"count\":1,\"chance\":\"100000\"}]'),
(106, 0, 'Minishabaal', 0, 4000, 3500, 240, 1, '[\"I had Princess Lumelia as breakfast!\",\"Naaa-Nana-Naaa-Naaa!\",\"My brother will come and get you for this!\",\"Get them Fluffy!\",\"He He He!\",\"Pftt, Ferumbras such an upstart!\",\"My dragon is not that old, it\'s just second hand!\",\"My other dragon is a red one!\",\"When I am big I want to become the ruthless eighth!\",\"WHERE\'S FLUFFY?\",\"Muahaha!\"]', '[\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"2548\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"2432\",\"count\":1,\"chance\":\"666\"},{\"id\":\"5944\",\"count\":1,\"chance\":\"909\"},{\"id\":\"2520\",\"count\":1,\"chance\":\"200\"},{\"id\":\"6500\",\"count\":\"2\",\"chance\":\"1000\"},{\"id\":\"2470\",\"count\":1,\"chance\":\"180\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"5944\",\"count\":1,\"chance\":\"909\"},{\"id\":\"2488\",\"count\":1,\"chance\":\"800\"},{\"id\":\"2515\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"2136\",\"count\":1,\"chance\":\"909\"},{\"id\":\"2542\",\"count\":1,\"chance\":\"500\"}]'),
(107, 0, 'Morgaroth', 0, 15000, 55000, 90, 1, '[\"I AM MORGAROTH, LORD OF THE TRIANGLE... AND YOU ARE LOST!\",\"MY SEED IS FEAR AND MY HARVEST ARE YOUR SOULS!\",\"THE TRIANGLE OF TERROR WILL RISE!\",\"ZATHROTH! LOOK AT THE DESTRUCTION I AM CAUSING IN YOUR NAME!\"]', '[\"paralyze\",\"invisible\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"50000\"},{\"id\":\"2143\",\"count\":\"5\",\"chance\":\"10000\"},{\"id\":\"2396\",\"count\":1,\"chance\":\"19429\"},{\"id\":\"2462\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2214\",\"count\":1,\"chance\":\"16000\"},{\"id\":\"2003\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2495\",\"count\":1,\"chance\":\"6000\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2393\",\"count\":1,\"chance\":\"60000\"},{\"id\":\"2195\",\"count\":1,\"chance\":\"16033\"},{\"id\":\"2421\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"2522\",\"count\":1,\"chance\":\"5600\"},{\"id\":\"2192\",\"count\":1,\"chance\":\"24000\"}]'),
(108, 0, 'Mr. Punish', 0, 5500, 12000, 125, 0, '[]', '[\"energy\",\"fire\",\"poison\",\"invisible\"]', 0, 0, 'undead', '[{\"id\":\"6537\",\"count\":1,\"chance\":\"100000\"}]'),
(109, 0, 'Munster', 250, 23, 58, 1, 0, '[\"Meeeeep!\"]', '[]', 1, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"16\",\"chance\":\"100000\"},{\"id\":\"2696\",\"count\":1,\"chance\":\"50000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2687\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"2650\",\"count\":1,\"chance\":\"50000\"},{\"id\":\"2449\",\"count\":1,\"chance\":\"5000\"}]'),
(110, 0, 'Necropharus', 0, 700, 750, 10, 0, '[\"You will rise as my servant!\",\"Praise to my master Urgith!\"]', '[\"poison\",\"lifedrain\",\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"40\",\"chance\":\"100000\"},{\"id\":\"2032\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"3969\",\"count\":1,\"chance\":\"150\"},{\"id\":\"2392\",\"count\":1,\"chance\":\"220\"},{\"id\":\"2804\",\"count\":\"2\",\"chance\":\"20000\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"5809\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2186\",\"count\":1,\"chance\":\"500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2483\",\"count\":\"1\",\"chance\":\"8500\"},{\"id\":\"2796\",\"count\":\"1\",\"chance\":\"22500\"},{\"id\":\"2231\",\"count\":\"1\",\"chance\":\"6000\"},{\"id\":\"2230\",\"count\":\"1\",\"chance\":\"30000\"},{\"id\":\"2449\",\"count\":\"1\",\"chance\":\"19900\"},{\"id\":\"2541\",\"count\":1,\"chance\":\"7500\"},{\"id\":\"2412\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2229\",\"count\":\"3\",\"chance\":\"20000\"},{\"id\":\"2747\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2436\",\"count\":1,\"chance\":\"833\"},{\"id\":\"2663\",\"count\":1,\"chance\":\"909\"},{\"id\":\"2195\",\"count\":1,\"chance\":\"666\"},{\"id\":\"2423\",\"count\":1,\"chance\":\"5000\"}]');
INSERT INTO `myaac_monsters` (`id`, `hidden`, `name`, `mana`, `exp`, `health`, `speed_lvl`, `use_haste`, `voices`, `immunities`, `summonable`, `convinceable`, `race`, `loot`) VALUES
(111, 0, 'Orshabaal', 0, 9999, 22500, 80, 1, '[\"PRAISED BE MY MASTERS, THE RUTHLESS SEVEN!\",\"YOU ARE DOOMED!\",\"ORSHABAAL IS BACK!\",\"Be prepared for the day my masters will come for you!\",\"SOULS FOR ORSHABAAL!\"]', '[\"lifedrain\",\"paralyze\",\"invisible\"]', 0, 0, 'fire', '[{\"id\":\"2142\",\"count\":\"1\",\"chance\":\"3500\"},{\"id\":\"2144\",\"count\":\"15\",\"chance\":\"15000\"},{\"id\":\"2195\",\"count\":\"1\",\"chance\":\"4000\"},{\"id\":\"2186\",\"count\":\"1\",\"chance\":\"3500\"},{\"id\":\"2192\",\"count\":\"1\",\"chance\":\"2500\"},{\"id\":\"2125\",\"count\":\"1\",\"chance\":\"1500\"},{\"id\":\"2124\",\"count\":\"1\",\"chance\":\"5500\"},{\"id\":\"2520\",\"count\":\"1\",\"chance\":\"15500\"},{\"id\":\"2462\",\"count\":\"1\",\"chance\":\"11000\"},{\"id\":\"2387\",\"count\":\"1\",\"chance\":\"20000\"},{\"id\":\"2434\",\"count\":\"1\",\"chance\":\"4500\"},{\"id\":\"2167\",\"count\":\"1\",\"chance\":\"13500\"},{\"id\":\"2432\",\"count\":\"1\",\"chance\":\"17000\"},{\"id\":\"2393\",\"count\":\"1\",\"chance\":\"12500\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"99900\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"88800\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"77700\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"66600\"},{\"id\":\"2179\",\"count\":\"1\",\"chance\":\"8000\"},{\"id\":\"2470\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"2033\",\"count\":\"1\",\"chance\":\"7500\"},{\"id\":\"2418\",\"count\":\"1\",\"chance\":\"4500\"},{\"id\":\"2182\",\"count\":\"1\",\"chance\":\"3500\"},{\"id\":\"2188\",\"count\":\"1\",\"chance\":\"2500\"},{\"id\":\"2396\",\"count\":\"1\",\"chance\":\"7500\"},{\"id\":\"2177\",\"count\":\"1\",\"chance\":\"1000\"},{\"id\":\"2162\",\"count\":\"1\",\"chance\":\"11500\"},{\"id\":\"2472\",\"count\":\"1\",\"chance\":\"3000\"},{\"id\":\"2514\",\"count\":\"1\",\"chance\":\"7500\"},{\"id\":\"2164\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"2178\",\"count\":\"1\",\"chance\":\"4000\"},{\"id\":\"2176\",\"count\":\"1\",\"chance\":\"12000\"},{\"id\":\"2171\",\"count\":\"1\",\"chance\":\"4500\"},{\"id\":\"2200\",\"count\":\"1\",\"chance\":\"4500\"},{\"id\":\"1982\",\"count\":\"1\",\"chance\":\"2600\"},{\"id\":\"2214\",\"count\":\"1\",\"chance\":\"13000\"},{\"id\":\"2170\",\"count\":\"1\",\"chance\":\"13000\"},{\"id\":\"2402\",\"count\":\"1\",\"chance\":\"15500\"},{\"id\":\"2436\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"2165\",\"count\":\"1\",\"chance\":\"9500\"},{\"id\":\"2197\",\"count\":\"1\",\"chance\":\"4000\"},{\"id\":\"2174\",\"count\":\"1\",\"chance\":\"2500\"},{\"id\":\"2151\",\"count\":\"7\",\"chance\":\"14000\"},{\"id\":\"2112\",\"count\":\"1\",\"chance\":\"14500\"},{\"id\":\"2421\",\"count\":\"1\",\"chance\":\"13500\"},{\"id\":\"2377\",\"count\":\"1\",\"chance\":\"20000\"},{\"id\":\"3955\",\"count\":\"1\",\"chance\":\"100\"},{\"id\":\"2185\",\"count\":\"1\",\"chance\":\"3500\"},{\"id\":\"2143\",\"count\":\"15\",\"chance\":\"12500\"}]'),
(112, 0, 'Ron the Ripper', 0, 500, 1500, 10, 0, '[]', '[]', 0, 0, 'blood', '[{\"id\":\"6101\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"50\",\"chance\":\"100000\"},{\"id\":\"2476\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2379\",\"count\":1,\"chance\":\"8500\"},{\"id\":\"2320\",\"count\":\"2\",\"chance\":\"100000\"}]'),
(113, 0, 'Rotworm Queen', 0, 300, 85, 1, 0, '[]', '[]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"47\",\"chance\":\"100000\"},{\"id\":\"8971\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"3976\",\"count\":\"45\",\"chance\":\"20000\"}]'),
(114, 0, 'The Abomination', 0, 25000, 38050, 60, 0, '[\"Blubb\"]', '[\"poison\",\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'venom', '[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2152\",\"count\":\"3\",\"chance\":\"10000\"},{\"id\":\"6500\",\"count\":\"1\",\"chance\":\"2857\"},{\"id\":\"5944\",\"count\":1,\"chance\":\"2500\"}]'),
(115, 0, 'The Count', 0, 1750, 4600, 75, 0, '[]', '[\"lifedrain\",\"death\",\"invisible\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"98\",\"chance\":\"40000\"},{\"id\":\"8752\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2391\",\"count\":1,\"chance\":\"2300\"}]'),
(116, 0, 'The Evil Eye', 0, 500, 1200, 10, 0, '[\"Inferior creatures, bow before my power!\"]', '[\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"45\",\"chance\":\"100000\"},{\"id\":\"2445\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2451\",\"count\":1,\"chance\":\"800\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"5898\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"80000\"},{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"80000\"},{\"id\":\"2423\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2391\",\"count\":1,\"chance\":\"1333\"}]'),
(117, 0, 'The Handmaiden', 0, 3850, 14500, 115, 1, '[]', '[\"energy\",\"fire\",\"ice\",\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"6539\",\"count\":1,\"chance\":\"35000\"}]'),
(118, 0, 'The Horned Fox', 0, 200, 265, 1, 0, '[\"You will never get me!\",\"I\'ll be back!\",\"Catch me, if you can!\",\"Help me, boys!\"]', '[\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"30\",\"chance\":\"100000\"},{\"id\":\"2410\",\"count\":\"2\",\"chance\":\"50000\"},{\"id\":\"2419\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2510\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2667\",\"count\":\"1\",\"chance\":\"20000\"},{\"id\":\"2647\",\"count\":1,\"chance\":\"1818\"},{\"id\":\"2413\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"5804\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2189\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"2207\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"33333\"},{\"id\":\"2379\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2475\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2397\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2652\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2478\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"1818\"}]'),
(119, 0, 'The Imperor', 0, 8000, 15000, 55, 1, '[\"Muahaha!\",\"He he he!\"]', '[\"fire\",\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'fire', '[{\"id\":\"2148\",\"count\":\"79\",\"chance\":\"100000\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"15000\"},{\"id\":\"6558\",\"count\":1,\"chance\":\"2222\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"18000\"},{\"id\":\"6534\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"6300\",\"count\":1,\"chance\":\"999\"},{\"id\":\"2465\",\"count\":1,\"chance\":\"6577\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2548\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"6529\",\"count\":\"5\",\"chance\":\"5000\"},{\"id\":\"2465\",\"count\":1,\"chance\":\"6577\"},{\"id\":\"2185\",\"count\":1,\"chance\":\"833\"},{\"id\":\"2464\",\"count\":1,\"chance\":\"7887\"},{\"id\":\"5944\",\"count\":1,\"chance\":\"5666\"},{\"id\":\"7899\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"7900\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"7891\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"6500\",\"count\":\"1\",\"chance\":\"7777\"},{\"id\":\"2165\",\"count\":1,\"chance\":\"4555\"}]'),
(120, 0, 'The Old Widow', 0, 2800, 3200, 10, 1, '[]', '[\"fire\",\"poison\",\"lifedrain\",\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"50\",\"chance\":\"100000\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2171\",\"count\":1,\"chance\":\"400\"},{\"id\":\"2459\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"5879\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2457\",\"count\":\"1\",\"chance\":\"10000\"},{\"id\":\"2148\",\"count\":\"40\",\"chance\":\"100000\"},{\"id\":\"2476\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2477\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2478\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2169\",\"count\":1,\"chance\":\"800\"}]'),
(121, 0, 'The Plasmother', 0, 8900, 16050, 45, 0, '[\"Blubb\"]', '[\"poison\",\"lifedrain\",\"paralyze\",\"invisible\"]', 0, 0, 'venom', '[{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"20000\"},{\"id\":\"2148\",\"count\":\"60\",\"chance\":\"20000\"},{\"id\":\"2148\",\"count\":\"45\",\"chance\":\"20000\"},{\"id\":\"2152\",\"count\":\"13\",\"chance\":\"25000\"},{\"id\":\"6500\",\"count\":1,\"chance\":\"45000\"},{\"id\":\"5944\",\"count\":1,\"chance\":\"35000\"},{\"id\":\"6535\",\"count\":1,\"chance\":\"100000\"}]'),
(122, 0, 'Thul', 0, 1800, 3000, 40, 0, '[\"Gaaahhh!\"]', '[]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"100000\"},{\"id\":\"5895\",\"count\":\"1\",\"chance\":\"100000\"}]'),
(123, 0, 'Tibia Bug', 250, 50, 270, 10, 0, '[\"My father was a year 2k bug.\",\"Psst, I\'ll make you rich.\",\"You are bugged ... by me!\"]', '[\"energy\",\"fire\",\"drunk\"]', 1, 1, 'venom', '[{\"id\":\"2148\",\"count\":\"11\",\"chance\":\"100000\"},{\"id\":\"6570\",\"count\":1,\"chance\":\"5538\"},{\"id\":\"6571\",\"count\":1,\"chance\":\"1538\"}]'),
(124, 0, 'Tiquandas Revenge', 0, 1755, 2000, 110, 0, '[]', '[\"invisible\"]', 0, 0, 'venom', '[{\"id\":\"2148\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2666\",\"count\":\"50\",\"chance\":\"33333\"},{\"id\":\"2671\",\"count\":\"8\",\"chance\":\"20000\"},{\"id\":\"7732\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"5015\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"}]'),
(125, 0, 'Undead Minion', 620, 550, 850, 5, 0, '[]', '[\"fire\",\"poison\",\"lifedrain\",\"drunk\"]', 0, 1, 'undead', '[{\"id\":\"2148\",\"count\":\"40\",\"chance\":\"100000\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2417\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2513\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"6570\",\"count\":1,\"chance\":\"5538\"},{\"id\":\"6571\",\"count\":1,\"chance\":\"1538\"},{\"id\":\"2515\",\"count\":1,\"chance\":\"5000\"}]'),
(126, 0, 'Ungreez', 10000, 5000, 8200, 55, 0, '[\"I\'ll teach you that even heros can die\",\"You wil die Begging like the others did\"]', '[\"energy\",\"fire\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"21000\"},{\"id\":\"2795\",\"count\":\"6\",\"chance\":\"10000\"},{\"id\":\"7590\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"20000\"}]'),
(127, 0, 'Ushuriel', 0, 10000, 50000, 65, 1, '[]', '[\"lifedrain\",\"paralyze\",\"invisible\"]', 0, 0, 'fire', '[{\"id\":\"6300\",\"count\":1,\"chance\":\"7777\"},{\"id\":\"2195\",\"count\":1,\"chance\":\"4444\"},{\"id\":\"2393\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2432\",\"count\":1,\"chance\":\"5555\"},{\"id\":\"2402\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2477\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2164\",\"count\":1,\"chance\":\"7300\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2462\",\"count\":1,\"chance\":\"9700\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"17000\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"2396\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2470\",\"count\":1,\"chance\":\"6500\"},{\"id\":\"2520\",\"count\":1,\"chance\":\"9999\"}]'),
(128, 0, 'Xenia', 450, 255, 290, 1, 0, '[\"Stand still!\",\"One more head for me!\",\"Head off!\"]', '[]', 1, 1, 'blood', '[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"2464\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2125\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2458\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2674\",\"count\":\"4\",\"chance\":\"10000\"},{\"id\":\"2420\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2666\",\"count\":\"3\",\"chance\":\"20000\"},{\"id\":\"2200\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"1333\"}]'),
(129, 0, 'Zugurosh', 0, 10000, 95000, 60, 0, '[\"You will run out of resources soon enough!!\",\"One little mistake and your all are mine!\",\"I sense your strength fading!\"]', '[\"death\",\"paralyze\",\"invisible\"]', 0, 0, 'fire', '[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"50\",\"chance\":\"100000\"},{\"id\":\"6300\",\"count\":1,\"chance\":\"7777\"},{\"id\":\"2195\",\"count\":1,\"chance\":\"4444\"},{\"id\":\"2393\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2432\",\"count\":1,\"chance\":\"5555\"},{\"id\":\"2402\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2477\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2151\",\"count\":\"11\",\"chance\":\"6000\"},{\"id\":\"2462\",\"count\":1,\"chance\":\"9700\"},{\"id\":\"2171\",\"count\":1,\"chance\":\"2333\"},{\"id\":\"2470\",\"count\":1,\"chance\":\"6500\"},{\"id\":\"2520\",\"count\":1,\"chance\":\"9999\"}]'),
(130, 0, 'Dog', 220, 0, 20, 1, 0, '[\"Wuff! Wuff!\"]', '[]', 1, 1, 'blood', '[]'),
(131, 0, 'Husky', 420, 0, 140, 1, 0, '[\"Yoooohuuuu!\",\"Grrrrrrr\",\"Ruff, ruff!\"]', '[]', 1, 1, 'blood', '[]'),
(132, 0, 'War Wolf', 0, 55, 140, 1, 0, '[\"Grrrrrrr\",\"Yoooohhuuuu!\"]', '[]', 0, 1, 'blood', '[{\"id\":\"2666\",\"count\":\"4\",\"chance\":\"25000\"},{\"id\":\"2671\",\"count\":\"2\",\"chance\":\"20000\"},{\"id\":\"5897\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"3976\",\"count\":1,\"chance\":\"250\"}]'),
(133, 0, 'Werewolf', 0, 1450, 1955, 50, 0, '[\"BLOOD!\",\"HRAAAAAAAAAARRRRRR!\"]', '[\"paralyze\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"35000\"},{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"35000\"},{\"id\":\"2148\",\"count\":\"45\",\"chance\":\"35000\"},{\"id\":\"2381\",\"count\":1,\"chance\":\"2700\"},{\"id\":\"2398\",\"count\":1,\"chance\":\"19000\"},{\"id\":\"2647\",\"count\":1,\"chance\":\"6500\"},{\"id\":\"2510\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2171\",\"count\":1,\"chance\":\"600\"},{\"id\":\"7439\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"7428\",\"count\":1,\"chance\":\"300\"},{\"id\":\"2438\",\"count\":1,\"chance\":\"600\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7383\",\"count\":1,\"chance\":\"420\"},{\"id\":\"9809\",\"count\":1,\"chance\":\"7800\"},{\"id\":\"2197\",\"count\":1,\"chance\":\"800\"},{\"id\":\"7588\",\"count\":1,\"chance\":\"5500\"},{\"id\":\"2169\",\"count\":1,\"chance\":\"700\"},{\"id\":\"2805\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"5897\",\"count\":1,\"chance\":\"5200\"},{\"id\":\"8473\",\"count\":1,\"chance\":\"2400\"},{\"id\":\"7419\",\"count\":1,\"chance\":\"200\"}]'),
(134, 0, 'Winter Wolf', 260, 20, 30, 1, 0, '[]', '[]', 1, 1, 'blood', '[{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"15000\"}]'),
(135, 0, 'Wolf', 255, 18, 25, 1, 0, '[]', '[]', 1, 1, 'blood', '[{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"25000\"},{\"id\":\"3976\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"5897\",\"count\":1,\"chance\":\"1500\"}]'),
(136, 0, 'Chakoya Toolshaper', 0, 40, 80, 25, 0, '[\"Chikuva!!\",\"Jinuma jamjam!\",\"Suvituka siq chuqua!\",\"Kiyosa sipaju!\"]', '[]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"29\",\"chance\":\"20000\"},{\"id\":\"2666\",\"count\":1,\"chance\":\"22500\"},{\"id\":\"2667\",\"count\":\"2\",\"chance\":\"10000\"},{\"id\":\"2398\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"2541\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7381\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"7441\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"7159\",\"count\":1,\"chance\":\"900\"},{\"id\":\"2669\",\"count\":1,\"chance\":\"700\"},{\"id\":\"7158\",\"count\":1,\"chance\":\"750\"}]'),
(137, 0, 'Chakoya Tribewarden', 305, 40, 68, 25, 0, '[\"Quisavu tukavi!\",\"Si siyoqua jamjam!\",\"Achuq! jinuma!\",\"Si ji jusipa!\"]', '[]', 0, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"30\",\"chance\":\"20000\"},{\"id\":\"2666\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2671\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2667\",\"count\":\"3\",\"chance\":\"10000\"},{\"id\":\"2398\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2541\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"7381\",\"count\":1,\"chance\":\"1750\"},{\"id\":\"7441\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"7158\",\"count\":1,\"chance\":\"900\"},{\"id\":\"7159\",\"count\":1,\"chance\":\"700\"},{\"id\":\"2669\",\"count\":1,\"chance\":\"750\"}]'),
(138, 0, 'Chakoya Windcaller', 305, 48, 84, 25, 0, '[\"Mupi! Si siyoqua jinuma!\",\"Siqsiq ji jusipa!\",\"Jagura taluka taqua!\",\"Quatu nguraka!\"]', '[]', 0, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"36\",\"chance\":\"20000\"},{\"id\":\"2667\",\"count\":\"4\",\"chance\":\"9000\"},{\"id\":\"2666\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2398\",\"count\":1,\"chance\":\"7500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2541\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"7441\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"7158\",\"count\":1,\"chance\":\"750\"},{\"id\":\"2669\",\"count\":1,\"chance\":\"700\"}]'),
(139, 0, 'Blood Crab', 505, 160, 290, 1, 0, '[]', '[]', 1, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"36\",\"chance\":\"17500\"},{\"id\":\"2667\",\"count\":1,\"chance\":\"27000\"},{\"id\":\"2478\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"2464\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2143\",\"count\":1,\"chance\":\"1000\"}]'),
(140, 0, 'Crab', 305, 30, 55, 1, 0, '[\"crab crab!\"]', '[]', 1, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"10\",\"chance\":\"47000\"},{\"id\":\"2667\",\"count\":1,\"chance\":\"20000\"}]'),
(141, 0, 'Ice Golem', 0, 295, 385, 1, 0, '[\"Chrr.\"]', '[\"paralyze\",\"invisible\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"53\",\"chance\":\"10000\"},{\"id\":\"7441\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"2144\",\"count\":1,\"chance\":\"2700\"},{\"id\":\"7588\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2396\",\"count\":1,\"chance\":\"550\"},{\"id\":\"7449\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2479\",\"count\":1,\"chance\":\"600\"},{\"id\":\"7290\",\"count\":1,\"chance\":\"350\"},{\"id\":\"2383\",\"count\":1,\"chance\":\"300\"},{\"id\":\"7902\",\"count\":1,\"chance\":\"250\"}]'),
(142, 0, 'Acolyte of the Cult', 0, 300, 390, 5, 0, '[\"Praise voodoo!\"]', '[\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"40\",\"chance\":\"20000\"},{\"id\":\"2394\",\"count\":1,\"chance\":\"6000\"},{\"id\":\"5810\",\"count\":1,\"chance\":\"850\"},{\"id\":\"2201\",\"count\":1,\"chance\":\"900\"},{\"id\":\"1962\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"6087\",\"count\":1,\"chance\":\"600\"},{\"id\":\"2168\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2181\",\"count\":1,\"chance\":\"400\"},{\"id\":\"2652\",\"count\":1,\"chance\":\"400\"},{\"id\":\"5801\",\"count\":1,\"chance\":\"100\"}]'),
(143, 0, 'Adept of the Cult', 0, 400, 430, 1, 0, '[]', '[\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"57\",\"chance\":\"20000\"},{\"id\":\"5810\",\"count\":1,\"chance\":\"850\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2423\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"1962\",\"count\":1,\"chance\":\"2750\"},{\"id\":\"2169\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2170\",\"count\":1,\"chance\":\"1250\"},{\"id\":\"6089\",\"count\":1,\"chance\":\"700\"},{\"id\":\"2183\",\"count\":1,\"chance\":\"750\"},{\"id\":\"7426\",\"count\":1,\"chance\":\"800\"},{\"id\":\"2655\",\"count\":1,\"chance\":\"500\"},{\"id\":\"5801\",\"count\":1,\"chance\":\"100\"},{\"id\":\"7424\",\"count\":1,\"chance\":\"50\"}]'),
(144, 0, 'Enlightened of the Cult', 0, 500, 700, 1, 0, '[]', '[\"paralyze\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"20000\"},{\"id\":\"2654\",\"count\":1,\"chance\":\"15000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2200\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"5810\",\"count\":1,\"chance\":\"800\"},{\"id\":\"6090\",\"count\":1,\"chance\":\"700\"},{\"id\":\"2167\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"7589\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2187\",\"count\":1,\"chance\":\"900\"},{\"id\":\"2436\",\"count\":1,\"chance\":\"750\"},{\"id\":\"2171\",\"count\":1,\"chance\":\"800\"},{\"id\":\"2114\",\"count\":1,\"chance\":\"100\"},{\"id\":\"5801\",\"count\":1,\"chance\":\"50\"},{\"id\":\"5669\",\"count\":1,\"chance\":\"100\"},{\"id\":\"7426\",\"count\":1,\"chance\":\"50\"}]'),
(145, 0, 'Novice of the Cult', 0, 100, 285, 1, 0, '[\"Fear us!\",\"You will not tell anyone what you have seen.\",\"Your curiosity will be punished!\"]', '[]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"30\",\"chance\":\"16500\"},{\"id\":\"2398\",\"count\":1,\"chance\":\"6000\"},{\"id\":\"2661\",\"count\":1,\"chance\":\"3250\"},{\"id\":\"2190\",\"count\":1,\"chance\":\"600\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"1962\",\"count\":1,\"chance\":\"500\"},{\"id\":\"5810\",\"count\":1,\"chance\":\"555\"},{\"id\":\"2213\",\"count\":1,\"chance\":\"450\"},{\"id\":\"6087\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2199\",\"count\":1,\"chance\":\"250\"}]'),
(146, 0, 'Dark Torturer', 0, 3500, 7350, 15, 0, '[\"You like it, don\'t you?\",\"IahaEhheAie!\"]', '[\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"50000\"},{\"id\":\"7368\",\"count\":\"2\",\"chance\":\"1500\"},{\"id\":\"7412\",\"count\":1,\"chance\":\"200\"},{\"id\":\"5480\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"6300\",\"count\":1,\"chance\":\"1650\"},{\"id\":\"6500\",\"count\":1,\"chance\":\"6500\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2671\",\"count\":\"8\",\"chance\":\"10500\"},{\"id\":\"5801\",\"count\":1,\"chance\":\"650\"},{\"id\":\"5022\",\"count\":\"2\",\"chance\":\"600\"},{\"id\":\"2152\",\"count\":\"3\",\"chance\":\"12500\"},{\"id\":\"2558\",\"count\":1,\"chance\":\"1700\"},{\"id\":\"5944\",\"count\":1,\"chance\":\"13000\"},{\"id\":\"2645\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"7388\",\"count\":1,\"chance\":\"600\"},{\"id\":\"2470\",\"count\":1,\"chance\":\"100\"},{\"id\":\"9971\",\"count\":1,\"chance\":\"300\"}]'),
(147, 0, 'Demon', 0, 6000, 8200, 30, 1, '[\"MUHAHAHAHA!\",\"I SMELL FEEEEEAAAR!\",\"CHAMEK ATH UTHUL ARAK!\",\"Your resistance is futile!\",\"Your soul will be mine!\"]', '[\"lifedrain\",\"paralyze\",\"invisible\"]', 0, 0, 'fire', '[{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"28000\"},{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"28000\"},{\"id\":\"2148\",\"count\":\"75\",\"chance\":\"28000\"},{\"id\":\"2148\",\"count\":\"65\",\"chance\":\"28000\"},{\"id\":\"7368\",\"count\":\"5\",\"chance\":\"3100\"},{\"id\":\"5954\",\"count\":1,\"chance\":\"1150\"},{\"id\":\"2520\",\"count\":1,\"chance\":\"750\"},{\"id\":\"2462\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"21000\"},{\"id\":\"2432\",\"count\":1,\"chance\":\"6000\"},{\"id\":\"2795\",\"count\":\"6\",\"chance\":\"12500\"},{\"id\":\"2393\",\"count\":1,\"chance\":\"1650\"},{\"id\":\"2179\",\"count\":1,\"chance\":\"700\"},{\"id\":\"2418\",\"count\":1,\"chance\":\"1650\"},{\"id\":\"7590\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"7590\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"7590\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2396\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"150\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"550\"},{\"id\":\"2176\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2152\",\"count\":\"3\",\"chance\":\"23750\"},{\"id\":\"1982\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2214\",\"count\":1,\"chance\":\"900\"},{\"id\":\"2165\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2151\",\"count\":1,\"chance\":\"3300\"},{\"id\":\"8473\",\"count\":1,\"chance\":\"12500\"},{\"id\":\"8473\",\"count\":1,\"chance\":\"12500\"},{\"id\":\"8473\",\"count\":1,\"chance\":\"12500\"},{\"id\":\"2171\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"2164\",\"count\":1,\"chance\":\"800\"},{\"id\":\"7382\",\"count\":1,\"chance\":\"950\"},{\"id\":\"2470\",\"count\":1,\"chance\":\"450\"},{\"id\":\"7393\",\"count\":1,\"chance\":\"50\"}]'),
(148, 0, 'Destroyer', 0, 2000, 3700, 25, 1, '[\"Destructiooooon!\",\"It\'s a good day to destroy!\"]', '[\"paralyze\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"37500\"},{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"37500\"},{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"37500\"},{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"37500\"},{\"id\":\"2231\",\"count\":1,\"chance\":\"8000\"},{\"id\":\"2666\",\"count\":\"6\",\"chance\":\"8000\"},{\"id\":\"7419\",\"count\":1,\"chance\":\"2300\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"9200\"},{\"id\":\"6500\",\"count\":1,\"chance\":\"24000\"},{\"id\":\"2125\",\"count\":1,\"chance\":\"2300\"},{\"id\":\"2152\",\"count\":\"3\",\"chance\":\"3500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"5944\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"2393\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"2300\"},{\"id\":\"2416\",\"count\":1,\"chance\":\"11500\"},{\"id\":\"2489\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"2546\",\"count\":\"12\",\"chance\":\"5250\"},{\"id\":\"2645\",\"count\":1,\"chance\":\"2300\"},{\"id\":\"2178\",\"count\":1,\"chance\":\"750\"},{\"id\":\"7427\",\"count\":1,\"chance\":\"700\"},{\"id\":\"5741\",\"count\":1,\"chance\":\"300\"},{\"id\":\"6300\",\"count\":1,\"chance\":\"400\"}]'),
(149, 0, 'Diabolic Imp', 0, 1950, 1950, 70, 1, '[\"Muahaha!\",\"He he he!\"]', '[\"paralyze\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"99\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"98\",\"chance\":\"50000\"},{\"id\":\"2548\",\"count\":1,\"chance\":\"50000\"},{\"id\":\"6558\",\"count\":1,\"chance\":\"25000\"},{\"id\":\"6558\",\"count\":1,\"chance\":\"25000\"},{\"id\":\"6500\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7900\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"6300\",\"count\":1,\"chance\":\"500\"},{\"id\":\"7899\",\"count\":1,\"chance\":\"900\"},{\"id\":\"2165\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2515\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2568\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2419\",\"count\":1,\"chance\":\"8000\"},{\"id\":\"5944\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2148\",\"count\":\"7\",\"chance\":\"600\"},{\"id\":\"2185\",\"count\":1,\"chance\":\"750\"}]'),
(150, 0, 'Fire Devil', 530, 145, 200, 1, 0, '[\"Hot, eh?\",\"Hell, oh hell!\"]', '[]', 1, 1, 'blood', '[{\"id\":\"2548\",\"count\":1,\"chance\":\"50000\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"12750\"},{\"id\":\"2568\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"2419\",\"count\":1,\"chance\":\"5300\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2515\",\"count\":1,\"chance\":\"700\"},{\"id\":\"2191\",\"count\":1,\"chance\":\"450\"},{\"id\":\"2185\",\"count\":1,\"chance\":\"400\"}]'),
(151, 0, 'Fury', 0, 4000, 4100, 120, 0, '[\"Ahhhhrrrr!\",\"Waaaaah!\",\"Carnage!\"]', '[\"paralyze\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"43000\"},{\"id\":\"2148\",\"count\":\"75\",\"chance\":\"43000\"},{\"id\":\"2148\",\"count\":\"65\",\"chance\":\"43000\"},{\"id\":\"6558\",\"count\":\"3\",\"chance\":\"25000\"},{\"id\":\"6500\",\"count\":1,\"chance\":\"22500\"},{\"id\":\"2470\",\"count\":1,\"chance\":\"450\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2666\",\"count\":1,\"chance\":\"25000\"},{\"id\":\"7456\",\"count\":1,\"chance\":\"1800\"},{\"id\":\"5022\",\"count\":\"3\",\"chance\":\"1300\"},{\"id\":\"2152\",\"count\":\"3\",\"chance\":\"2000\"},{\"id\":\"5911\",\"count\":1,\"chance\":\"3650\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"9813\",\"count\":1,\"chance\":\"11000\"},{\"id\":\"5944\",\"count\":1,\"chance\":\"21500\"},{\"id\":\"2645\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2181\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"7404\",\"count\":1,\"chance\":\"100\"},{\"id\":\"2487\",\"count\":1,\"chance\":\"500\"},{\"id\":\"5944\",\"count\":1,\"chance\":\"7368\"},{\"id\":\"2124\",\"count\":1,\"chance\":\"750\"}]'),
(152, 0, 'Gozzler', 800, 180, 240, 1, 1, '[\"Huhuhuhuuu!\",\"Let the fun begin!\",\"Yihahaha!\",\"I\'ll bite you! Nyehehehehe!\"]', '[\"invisible\"]', 1, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"22500\"},{\"id\":\"2378\",\"count\":1,\"chance\":\"3100\"},{\"id\":\"2015\",\"count\":1,\"chance\":\"8750\"},{\"id\":\"2423\",\"count\":1,\"chance\":\"900\"},{\"id\":\"2394\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2510\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2385\",\"count\":1,\"chance\":\"7250\"},{\"id\":\"2051\",\"count\":1,\"chance\":\"7500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2409\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2213\",\"count\":1,\"chance\":\"400\"}]'),
(153, 0, 'Hand of Cursed Fate', 0, 5000, 10500, 15, 1, '[]', '[\"paralyze\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"15000\"},{\"id\":\"2148\",\"count\":\"60\",\"chance\":\"15000\"},{\"id\":\"2152\",\"count\":\"5\",\"chance\":\"5000\"},{\"id\":\"2654\",\"count\":1,\"chance\":\"35000\"},{\"id\":\"2178\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2127\",\"count\":1,\"chance\":\"6000\"},{\"id\":\"6558\",\"count\":\"4\",\"chance\":\"7500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"6500\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2171\",\"count\":1,\"chance\":\"2350\"},{\"id\":\"2187\",\"count\":1,\"chance\":\"2900\"},{\"id\":\"2476\",\"count\":1,\"chance\":\"2200\"},{\"id\":\"2436\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"9971\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2487\",\"count\":1,\"chance\":\"750\"},{\"id\":\"5799\",\"count\":1,\"chance\":\"100\"},{\"id\":\"7414\",\"count\":1,\"chance\":\"100\"}]'),
(154, 0, 'Hellhound', 0, 6800, 7500, 45, 0, '[\"GROOOWL!\",\"GRRRRR!\"]', '[\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"25000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"25000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"25000\"},{\"id\":\"2148\",\"count\":\"75\",\"chance\":\"25000\"},{\"id\":\"2152\",\"count\":\"5\",\"chance\":\"5000\"},{\"id\":\"2671\",\"count\":\"6\",\"chance\":\"22500\"},{\"id\":\"2410\",\"count\":\"11\",\"chance\":\"9000\"},{\"id\":\"2144\",\"count\":\"4\",\"chance\":\"7000\"},{\"id\":\"2231\",\"count\":1,\"chance\":\"30000\"},{\"id\":\"2230\",\"count\":1,\"chance\":\"25000\"},{\"id\":\"6558\",\"count\":1,\"chance\":\"6500\"},{\"id\":\"6500\",\"count\":1,\"chance\":\"15000\"},{\"id\":\"9971\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"9808\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2393\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"5944\",\"count\":1,\"chance\":\"7500\"},{\"id\":\"2430\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2383\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"6553\",\"count\":1,\"chance\":\"400\"}]'),
(155, 0, 'Hellspawn', 0, 2550, 3500, 70, 0, '[\"Your fragile bones are like toothpicks to me.\",\"You little weasel will not live to see another day.\",\"I\'m just a messenger of what\'s yet to come.\"]', '[\"paralyze\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"44000\"},{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"44000\"},{\"id\":\"2148\",\"count\":\"60\",\"chance\":\"44000\"},{\"id\":\"7368\",\"count\":\"2\",\"chance\":\"7750\"},{\"id\":\"2413\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2231\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"2478\",\"count\":1,\"chance\":\"12000\"},{\"id\":\"6500\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"40500\"},{\"id\":\"2477\",\"count\":1,\"chance\":\"2750\"},{\"id\":\"2666\",\"count\":\"6\",\"chance\":\"7000\"},{\"id\":\"2394\",\"count\":1,\"chance\":\"11000\"},{\"id\":\"9809\",\"count\":1,\"chance\":\"1750\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"9809\",\"count\":1,\"chance\":\"1750\"},{\"id\":\"7452\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"8473\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2475\",\"count\":1,\"chance\":\"1900\"},{\"id\":\"7439\",\"count\":1,\"chance\":\"1100\"},{\"id\":\"9969\",\"count\":1,\"chance\":\"200\"},{\"id\":\"7421\",\"count\":1,\"chance\":\"200\"},{\"id\":\"9948\",\"count\":1,\"chance\":\"100\"}]'),
(156, 0, 'Juggernaut', 0, 8700, 20000, 30, 1, '[\"WAHHHH!\",\"RAAARRR!\",\"GRRRRRR!\"]', '[\"paralyze\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"22000\"},{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"22000\"},{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"22000\"},{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"22000\"},{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"22000\"},{\"id\":\"6558\",\"count\":1,\"chance\":\"13750\"},{\"id\":\"6558\",\"count\":1,\"chance\":\"13750\"},{\"id\":\"6558\",\"count\":1,\"chance\":\"13750\"},{\"id\":\"6558\",\"count\":1,\"chance\":\"13750\"},{\"id\":\"6500\",\"count\":1,\"chance\":\"45000\"},{\"id\":\"9971\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"7590\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"7500\"},{\"id\":\"2671\",\"count\":\"8\",\"chance\":\"10750\"},{\"id\":\"2152\",\"count\":\"5\",\"chance\":\"2400\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"9808\",\"count\":1,\"chance\":\"7500\"},{\"id\":\"5944\",\"count\":1,\"chance\":\"30000\"},{\"id\":\"7452\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"7365\",\"count\":1,\"chance\":\"7500\"},{\"id\":\"2220\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2228\",\"count\":1,\"chance\":\"12500\"},{\"id\":\"2434\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"2136\",\"count\":1,\"chance\":\"750\"},{\"id\":\"2470\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2466\",\"count\":1,\"chance\":\"650\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"450\"},{\"id\":\"8889\",\"count\":1,\"chance\":\"300\"},{\"id\":\"2452\",\"count\":1,\"chance\":\"250\"}]'),
(157, 0, 'Nightmare', 0, 2150, 2700, 25, 1, '[\"Close your eyes... I want to show you something!\",\"I will haunt you forever!\",\"I will make you scream!\",\"Pffffrrrrrrrrrrrr.\",\"Take a ride with me.\",\"Weeeheeheeeheee!\"]', '[\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"75\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"45\",\"chance\":\"50000\"},{\"id\":\"2532\",\"count\":1,\"chance\":\"800\"},{\"id\":\"2195\",\"count\":1,\"chance\":\"300\"},{\"id\":\"6558\",\"count\":\"2\",\"chance\":\"13500\"},{\"id\":\"6300\",\"count\":1,\"chance\":\"1429\"},{\"id\":\"6500\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"15000\"},{\"id\":\"2671\",\"count\":\"2\",\"chance\":\"15000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2477\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2666\",\"count\":\"4\",\"chance\":\"17500\"},{\"id\":\"5669\",\"count\":1,\"chance\":\"100\"},{\"id\":\"2152\",\"count\":\"4\",\"chance\":\"1000\"},{\"id\":\"2547\",\"count\":\"4\",\"chance\":\"7000\"},{\"id\":\"6526\",\"count\":1,\"chance\":\"500\"},{\"id\":\"5944\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2457\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2454\",\"count\":1,\"chance\":\"100\"}]'),
(158, 0, 'Nightmare Scion', 0, 1350, 1400, 60, 1, '[\"Weeeheeheee!\"]', '[\"earth\",\"death\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"74\",\"chance\":\"43000\"},{\"id\":\"2148\",\"count\":\"73\",\"chance\":\"43000\"},{\"id\":\"2491\",\"count\":1,\"chance\":\"800\"},{\"id\":\"9941\",\"count\":1,\"chance\":\"250\"},{\"id\":\"6300\",\"count\":1,\"chance\":\"250\"},{\"id\":\"7387\",\"count\":1,\"chance\":\"400\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"8871\",\"count\":1,\"chance\":\"230\"},{\"id\":\"2152\",\"count\":\"3\",\"chance\":\"800\"},{\"id\":\"2671\",\"count\":\"2\",\"chance\":\"20000\"},{\"id\":\"2666\",\"count\":\"4\",\"chance\":\"27500\"},{\"id\":\"6574\",\"count\":1,\"chance\":\"150\"},{\"id\":\"7451\",\"count\":1,\"chance\":\"170\"}]'),
(159, 0, 'Nightstalker', 0, 500, 700, 20, 1, '[\"The sunlight is so depressing.\",\"Come with me, my child.\",\"I\'ve been in the shadow under your bed last night.\",\"You never know what hides in the night.\",\"I remember your face - and I know where you sleep\"]', '[\"paralyze\",\"invisible\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"65\",\"chance\":\"31000\"},{\"id\":\"2148\",\"count\":\"45\",\"chance\":\"31000\"},{\"id\":\"9942\",\"count\":1,\"chance\":\"2200\"},{\"id\":\"2804\",\"count\":1,\"chance\":\"2250\"},{\"id\":\"7589\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2124\",\"count\":1,\"chance\":\"2125\"},{\"id\":\"2200\",\"count\":1,\"chance\":\"1975\"},{\"id\":\"2171\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"8870\",\"count\":1,\"chance\":\"900\"},{\"id\":\"7407\",\"count\":1,\"chance\":\"400\"},{\"id\":\"7427\",\"count\":1,\"chance\":\"300\"},{\"id\":\"2195\",\"count\":1,\"chance\":\"150\"}]'),
(160, 0, 'Plaguesmith', 0, 4500, 8250, 20, 1, '[\"You are looking a bit feverish today!\",\"Hachoo!\",\"Cough Cough!\"]', '[\"paralyze\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"75\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"85\",\"chance\":\"50000\"},{\"id\":\"2208\",\"count\":1,\"chance\":\"4750\"},{\"id\":\"2417\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2209\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"6500\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2237\",\"count\":1,\"chance\":\"60000\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2444\",\"count\":1,\"chance\":\"600\"},{\"id\":\"2477\",\"count\":1,\"chance\":\"6000\"},{\"id\":\"2235\",\"count\":1,\"chance\":\"50000\"},{\"id\":\"2394\",\"count\":1,\"chance\":\"27200\"},{\"id\":\"7365\",\"count\":\"3\",\"chance\":\"5250\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"5889\",\"count\":1,\"chance\":\"1250\"},{\"id\":\"5888\",\"count\":1,\"chance\":\"1250\"},{\"id\":\"5887\",\"count\":1,\"chance\":\"1250\"},{\"id\":\"2225\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2152\",\"count\":\"3\",\"chance\":\"5000\"},{\"id\":\"9808\",\"count\":1,\"chance\":\"7750\"},{\"id\":\"2134\",\"count\":1,\"chance\":\"1850\"},{\"id\":\"5944\",\"count\":1,\"chance\":\"11000\"},{\"id\":\"2645\",\"count\":1,\"chance\":\"1225\"},{\"id\":\"2509\",\"count\":1,\"chance\":\"21000\"},{\"id\":\"2377\",\"count\":1,\"chance\":\"21500\"},{\"id\":\"2391\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"3957\",\"count\":1,\"chance\":\"200\"},{\"id\":\"2127\",\"count\":1,\"chance\":\"200\"}]'),
(161, 0, 'Blue Djinn', 0, 215, 330, 1, 0, '[\"Simsalabim\",\"Feel the power of my magic, tiny mortal!\",\"Be careful what you wish for.\",\"Wishes can come true.\"]', '[\"paralyze\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"40000\"},{\"id\":\"2148\",\"count\":\"50\",\"chance\":\"40000\"},{\"id\":\"2684\",\"count\":1,\"chance\":\"9250\"},{\"id\":\"7378\",\"count\":\"2\",\"chance\":\"3500\"},{\"id\":\"2063\",\"count\":1,\"chance\":\"6500\"},{\"id\":\"1971\",\"count\":1,\"chance\":\"1750\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"5912\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"7620\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2745\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2663\",\"count\":1,\"chance\":\"350\"}]'),
(162, 0, 'Efreet', 0, 410, 550, 25, 0, '[\"I grant you a deathwish!\",\"Good wishes are for fairytales\"]', '[\"paralyze\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"75\",\"chance\":\"40000\"},{\"id\":\"2148\",\"count\":\"50\",\"chance\":\"40000\"},{\"id\":\"2673\",\"count\":\"12\",\"chance\":\"6000\"},{\"id\":\"7378\",\"count\":\"3\",\"chance\":\"3500\"},{\"id\":\"2442\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2063\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7732\",\"count\":\"2\",\"chance\":\"2000\"},{\"id\":\"1860\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"5910\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2187\",\"count\":1,\"chance\":\"900\"},{\"id\":\"2663\",\"count\":1,\"chance\":\"750\"},{\"id\":\"7900\",\"count\":1,\"chance\":\"100\"},{\"id\":\"7589\",\"count\":1,\"chance\":\"3500\"}]'),
(163, 0, 'Green Djinn', 0, 215, 330, 1, 0, '[\"I grant you a deathwish!\",\"Muhahahaha!\",\"I wish you a merry trip to hell!\",\"Good wishes are for fairytales\"]', '[\"paralyze\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"31000\"},{\"id\":\"2148\",\"count\":\"45\",\"chance\":\"31000\"},{\"id\":\"2696\",\"count\":1,\"chance\":\"27500\"},{\"id\":\"2747\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"7378\",\"count\":\"2\",\"chance\":\"2750\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2062\",\"count\":1,\"chance\":\"6750\"},{\"id\":\"1965\",\"count\":1,\"chance\":\"4250\"},{\"id\":\"7620\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"5910\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2663\",\"count\":1,\"chance\":\"350\"}]'),
(164, 0, 'Marid', 0, 410, 550, 1, 0, '[\"Simsalabim\",\"Feel the power of my magic, tiny mortal!\",\"Wishes can come true.\",\"Djinns will soon again be the greatest!\"]', '[\"paralyze\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"40000\"},{\"id\":\"2148\",\"count\":\"60\",\"chance\":\"40000\"},{\"id\":\"2677\",\"count\":\"25\",\"chance\":\"5000\"},{\"id\":\"7378\",\"count\":\"3\",\"chance\":\"3500\"},{\"id\":\"2442\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2063\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"1872\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"7589\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"5912\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2374\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"7732\",\"count\":1,\"chance\":\"100\"},{\"id\":\"2183\",\"count\":1,\"chance\":\"900\"},{\"id\":\"2663\",\"count\":1,\"chance\":\"750\"},{\"id\":\"7900\",\"count\":1,\"chance\":\"100\"}]'),
(165, 0, 'Dragon Lord', 0, 2100, 1900, 10, 0, '[\"ZCHHHHH\",\"YOU WILL BURN!\"]', '[\"paralyze\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"33750\"},{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"33750\"},{\"id\":\"2148\",\"count\":\"60\",\"chance\":\"33750\"},{\"id\":\"1976\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2672\",\"count\":\"5\",\"chance\":\"11500\"},{\"id\":\"7399\",\"count\":1,\"chance\":\"200\"},{\"id\":\"2167\",\"count\":1,\"chance\":\"5250\"},{\"id\":\"2392\",\"count\":1,\"chance\":\"750\"},{\"id\":\"2033\",\"count\":1,\"chance\":\"2650\"},{\"id\":\"2796\",\"count\":1,\"chance\":\"12000\"},{\"id\":\"2177\",\"count\":1,\"chance\":\"950\"},{\"id\":\"2547\",\"count\":\"7\",\"chance\":\"2500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"5948\",\"count\":1,\"chance\":\"750\"},{\"id\":\"5882\",\"count\":1,\"chance\":\"1750\"},{\"id\":\"2498\",\"count\":1,\"chance\":\"250\"},{\"id\":\"7378\",\"count\":\"3\",\"chance\":\"5500\"},{\"id\":\"2479\",\"count\":1,\"chance\":\"250\"},{\"id\":\"7588\",\"count\":1,\"chance\":\"950\"},{\"id\":\"2528\",\"count\":1,\"chance\":\"950\"},{\"id\":\"7402\",\"count\":1,\"chance\":\"150\"},{\"id\":\"2492\",\"count\":1,\"chance\":\"200\"}]'),
(166, 0, 'Dragon Lord Hatchling', 0, 645, 750, 1, 0, '[\"Fchu?\",\"Rooawwrr\"]', '[\"paralyze\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"33750\"},{\"id\":\"2148\",\"count\":\"75\",\"chance\":\"33750\"},{\"id\":\"2672\",\"count\":1,\"chance\":\"25000\"},{\"id\":\"7620\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2796\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7891\",\"count\":1,\"chance\":\"200\"}]'),
(167, 0, 'Dragon', 0, 700, 1000, 1, 0, '[\"GROOAAARRR\",\"FCHHHHH\"]', '[\"paralyze\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"37500\"},{\"id\":\"2148\",\"count\":\"50\",\"chance\":\"37500\"},{\"id\":\"2546\",\"count\":\"12\",\"chance\":\"4000\"},{\"id\":\"2672\",\"count\":\"3\",\"chance\":\"15500\"},{\"id\":\"2406\",\"count\":1,\"chance\":\"25000\"},{\"id\":\"2398\",\"count\":1,\"chance\":\"21500\"},{\"id\":\"2509\",\"count\":1,\"chance\":\"14000\"},{\"id\":\"2455\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2397\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2457\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2647\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2413\",\"count\":1,\"chance\":\"1950\"},{\"id\":\"7588\",\"count\":1,\"chance\":\"1750\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"2187\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"5920\",\"count\":1,\"chance\":\"850\"},{\"id\":\"2434\",\"count\":1,\"chance\":\"600\"},{\"id\":\"5877\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2516\",\"count\":1,\"chance\":\"400\"},{\"id\":\"2409\",\"count\":1,\"chance\":\"400\"},{\"id\":\"7430\",\"count\":1,\"chance\":\"250\"},{\"id\":\"2177\",\"count\":1,\"chance\":\"150\"}]'),
(168, 0, 'Dragon Hatchling', 0, 185, 380, 1, 0, '[\"Fchu?\",\"Rooawwrr\"]', '[\"paralyze\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"55\",\"chance\":\"37500\"},{\"id\":\"2672\",\"count\":1,\"chance\":\"25000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7618\",\"count\":1,\"chance\":\"5000\"}]'),
(169, 0, 'Frost Dragon', 0, 2300, 1800, 20, 0, '[\"YOU WILL FREEZE!\",\"ZCHHHHH!\",\"I am so cool\",\"Chill out!.\"]', '[\"lifedrain\",\"paralyze\",\"invisible\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"95\",\"chance\":\"23000\"},{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"23000\"},{\"id\":\"2148\",\"count\":\"85\",\"chance\":\"23000\"},{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"23000\"},{\"id\":\"2672\",\"count\":\"5\",\"chance\":\"11500\"},{\"id\":\"2547\",\"count\":\"6\",\"chance\":\"4100\"},{\"id\":\"2796\",\"count\":1,\"chance\":\"11000\"},{\"id\":\"1976\",\"count\":1,\"chance\":\"9500\"},{\"id\":\"7441\",\"count\":1,\"chance\":\"5500\"},{\"id\":\"2167\",\"count\":1,\"chance\":\"5500\"},{\"id\":\"2033\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7290\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2177\",\"count\":1,\"chance\":\"400\"},{\"id\":\"2492\",\"count\":1,\"chance\":\"300\"},{\"id\":\"2479\",\"count\":1,\"chance\":\"300\"},{\"id\":\"2498\",\"count\":1,\"chance\":\"300\"},{\"id\":\"2528\",\"count\":1,\"chance\":\"200\"},{\"id\":\"7402\",\"count\":1,\"chance\":\"100\"},{\"id\":\"2396\",\"count\":1,\"chance\":\"100\"}]'),
(170, 0, 'Frost Dragon Hatchling', 0, 745, 800, 1, 0, '[\"Rooawwrr\",\"Fchu?\"]', '[\"fire\",\"lifedrain\",\"ice\",\"earth\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"55\",\"chance\":\"33750\"},{\"id\":\"2672\",\"count\":1,\"chance\":\"25000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"8900\",\"count\":1,\"chance\":\"200\"},{\"id\":\"7618\",\"count\":1,\"chance\":\"5000\"}]');
INSERT INTO `myaac_monsters` (`id`, `hidden`, `name`, `mana`, `exp`, `health`, `speed_lvl`, `use_haste`, `voices`, `immunities`, `summonable`, `convinceable`, `race`, `loot`) VALUES
(171, 0, 'Undead Dragon', 0, 7200, 8350, 40, 0, '[\"FEEEED MY ETERNAL HUNGER!\",\"I SENSE LIFE\"]', '[\"paralyze\",\"invisible\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"35500\"},{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"35500\"},{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"35500\"},{\"id\":\"2148\",\"count\":\"60\",\"chance\":\"35500\"},{\"id\":\"2236\",\"count\":1,\"chance\":\"15000\"},{\"id\":\"2413\",\"count\":1,\"chance\":\"26750\"},{\"id\":\"6500\",\"count\":1,\"chance\":\"16750\"},{\"id\":\"2152\",\"count\":\"5\",\"chance\":\"31000\"},{\"id\":\"6300\",\"count\":1,\"chance\":\"6750\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2033\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"7365\",\"count\":\"10\",\"chance\":\"22000\"},{\"id\":\"2547\",\"count\":\"6\",\"chance\":\"3000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"45500\"},{\"id\":\"5944\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"9810\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"7430\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2476\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"2177\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"5925\",\"count\":1,\"chance\":\"1250\"},{\"id\":\"8910\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"9971\",\"count\":1,\"chance\":\"900\"},{\"id\":\"2498\",\"count\":1,\"chance\":\"750\"},{\"id\":\"2454\",\"count\":1,\"chance\":\"700\"},{\"id\":\"2492\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2466\",\"count\":1,\"chance\":\"650\"},{\"id\":\"5741\",\"count\":1,\"chance\":\"300\"},{\"id\":\"8885\",\"count\":1,\"chance\":\"200\"}]'),
(172, 0, 'Wyrm', 0, 1450, 1825, 40, 0, '[\"GRRR!\",\"GROOOOAAAAAAAAR!\"]', '[\"energy\",\"paralyze\",\"invisible\",\"lifedrain\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"30000\"},{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"30000\"},{\"id\":\"2148\",\"count\":\"60\",\"chance\":\"30000\"},{\"id\":\"2672\",\"count\":\"3\",\"chance\":\"15000\"},{\"id\":\"2546\",\"count\":\"10\",\"chance\":\"4750\"},{\"id\":\"7588\",\"count\":1,\"chance\":\"4750\"},{\"id\":\"2647\",\"count\":1,\"chance\":\"1750\"},{\"id\":\"8921\",\"count\":1,\"chance\":\"700\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"7589\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2455\",\"count\":1,\"chance\":\"15000\"},{\"id\":\"2457\",\"count\":1,\"chance\":\"7500\"},{\"id\":\"7889\",\"count\":1,\"chance\":\"650\"},{\"id\":\"8871\",\"count\":1,\"chance\":\"600\"},{\"id\":\"8920\",\"count\":1,\"chance\":\"550\"},{\"id\":\"8873\",\"count\":1,\"chance\":\"750\"},{\"id\":\"7430\",\"count\":1,\"chance\":\"300\"},{\"id\":\"8855\",\"count\":1,\"chance\":\"200\"}]'),
(173, 0, 'Dwarf Geomancer', 0, 245, 380, 1, 0, '[\"Hail Durin!\",\"Earth is the strongest element.\",\"Dust to dust.\"]', '[\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"35\",\"chance\":\"50000\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"40000\"},{\"id\":\"2787\",\"count\":1,\"chance\":\"60000\"},{\"id\":\"2643\",\"count\":1,\"chance\":\"47500\"},{\"id\":\"2673\",\"count\":\"7\",\"chance\":\"2000\"},{\"id\":\"2162\",\"count\":1,\"chance\":\"13000\"},{\"id\":\"2468\",\"count\":1,\"chance\":\"26000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2175\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2423\",\"count\":1,\"chance\":\"750\"},{\"id\":\"2213\",\"count\":1,\"chance\":\"600\"},{\"id\":\"5880\",\"count\":1,\"chance\":\"400\"},{\"id\":\"7886\",\"count\":1,\"chance\":\"300\"}]'),
(174, 0, 'Dwarf Guard', 650, 165, 245, 1, 0, '[\"Hail Durin!\"]', '[\"invisible\"]', 1, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"30\",\"chance\":\"20000\"},{\"id\":\"7618\",\"count\":1,\"chance\":\"350\"},{\"id\":\"5880\",\"count\":1,\"chance\":\"350\"},{\"id\":\"2643\",\"count\":1,\"chance\":\"40000\"},{\"id\":\"2457\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2513\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2417\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2787\",\"count\":\"3\",\"chance\":\"28500\"},{\"id\":\"2483\",\"count\":1,\"chance\":\"7500\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"450\"},{\"id\":\"2459\",\"count\":1,\"chance\":\"250\"},{\"id\":\"2208\",\"count\":1,\"chance\":\"100\"}]'),
(175, 0, 'Dwarf Soldier', 360, 70, 135, 1, 0, '[\"Hail Durin!\"]', '[]', 1, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"8\",\"chance\":\"12000\"},{\"id\":\"2148\",\"count\":\"7\",\"chance\":\"12000\"},{\"id\":\"2543\",\"count\":\"7\",\"chance\":\"20000\"},{\"id\":\"2787\",\"count\":\"3\",\"chance\":\"20000\"},{\"id\":\"2554\",\"count\":1,\"chance\":\"11250\"},{\"id\":\"2481\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2464\",\"count\":1,\"chance\":\"8500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7363\",\"count\":\"3\",\"chance\":\"1500\"},{\"id\":\"2378\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"2455\",\"count\":1,\"chance\":\"3400\"},{\"id\":\"2525\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2208\",\"count\":1,\"chance\":\"360\"},{\"id\":\"5880\",\"count\":1,\"chance\":\"300\"},{\"id\":\"2213\",\"count\":1,\"chance\":\"500\"}]'),
(176, 0, 'Dwarf', 320, 45, 90, 1, 0, '[\"Hail Durin!\"]', '[]', 1, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"8\",\"chance\":\"20000\"},{\"id\":\"2787\",\"count\":\"2\",\"chance\":\"20000\"},{\"id\":\"2388\",\"count\":1,\"chance\":\"25000\"},{\"id\":\"2386\",\"count\":1,\"chance\":\"15000\"},{\"id\":\"2649\",\"count\":1,\"chance\":\"14000\"},{\"id\":\"2530\",\"count\":1,\"chance\":\"12000\"},{\"id\":\"2597\",\"count\":1,\"chance\":\"12000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2484\",\"count\":1,\"chance\":\"7500\"},{\"id\":\"5880\",\"count\":1,\"chance\":\"250\"},{\"id\":\"2213\",\"count\":1,\"chance\":\"200\"}]'),
(177, 0, 'Dworc Fleshhunter', 0, 35, 85, 10, 0, '[\"Grak brrretz!\",\"Grow truk grrrrr.\",\"Prek tars, dekklep zurk.\"]', '[]', 0, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"15\",\"chance\":\"39000\"},{\"id\":\"2229\",\"count\":\"3\",\"chance\":\"3300\"},{\"id\":\"2568\",\"count\":1,\"chance\":\"9750\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"4750\"},{\"id\":\"2567\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"3967\",\"count\":1,\"chance\":\"500\"},{\"id\":\"3965\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2172\",\"count\":1,\"chance\":\"200\"},{\"id\":\"2411\",\"count\":1,\"chance\":\"1250\"},{\"id\":\"2541\",\"count\":1,\"chance\":\"1400\"},{\"id\":\"3964\",\"count\":1,\"chance\":\"250\"}]'),
(178, 0, 'Dworc Venomsniper', 0, 30, 80, 10, 0, '[\"grak brrretz!\",\"grow truk grrrrr.\",\"prek tars, dekklep zurk.\"]', '[]', 0, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"14\",\"chance\":\"35000\"},{\"id\":\"2229\",\"count\":\"3\",\"chance\":\"333\"},{\"id\":\"2467\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2545\",\"count\":\"3\",\"chance\":\"3333\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"6000\"},{\"id\":\"2399\",\"count\":\"2\",\"chance\":\"5100\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2411\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"3967\",\"count\":1,\"chance\":\"450\"},{\"id\":\"2172\",\"count\":1,\"chance\":\"200\"},{\"id\":\"3983\",\"count\":1,\"chance\":\"150\"},{\"id\":\"7732\",\"count\":1,\"chance\":\"250\"}]'),
(179, 0, 'Dworc Voodoomaster', 0, 50, 80, 10, 1, '[\"grak brrretz!\",\"grow truk grrrrr.\",\"prek tars, dekklep zurk.\"]', '[]', 0, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"35000\"},{\"id\":\"2229\",\"count\":\"3\",\"chance\":\"1000\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"2230\",\"count\":1,\"chance\":\"12500\"},{\"id\":\"2467\",\"count\":1,\"chance\":\"13000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2172\",\"count\":1,\"chance\":\"200\"},{\"id\":\"2411\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"3967\",\"count\":1,\"chance\":\"550\"},{\"id\":\"2174\",\"count\":1,\"chance\":\"350\"},{\"id\":\"7618\",\"count\":1,\"chance\":\"700\"},{\"id\":\"3955\",\"count\":1,\"chance\":\"100\"}]'),
(180, 0, 'Elephant', 500, 160, 320, 10, 0, '[\"Hooooot-Toooooot!\",\"Tooooot.\",\"Troooooot!\"]', '[]', 1, 1, 'blood', '[{\"id\":\"2671\",\"count\":\"4\",\"chance\":\"15000\"},{\"id\":\"2666\",\"count\":\"3\",\"chance\":\"30000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"3956\",\"count\":\"2\",\"chance\":\"3500\"},{\"id\":\"3973\",\"count\":1,\"chance\":\"200\"}]'),
(181, 0, 'Mammoth', 0, 110, 190, 1, 0, '[\"Troooooot!\",\"Hooooot-Toooooot!\",\"Tooooot.\"]', '[]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"16000\"},{\"id\":\"2671\",\"count\":\"3\",\"chance\":\"30000\"},{\"id\":\"2666\",\"count\":\"4\",\"chance\":\"15000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"3956\",\"count\":\"2\",\"chance\":\"750\"},{\"id\":\"7432\",\"count\":1,\"chance\":\"550\"},{\"id\":\"3973\",\"count\":1,\"chance\":\"200\"}]'),
(182, 0, 'Elf Arcanist', 0, 175, 220, 5, 0, '[\"Feel my wrath!\",\"For the Daughter of the Stars!\",\"I\'ll bring balance upon you!\",\"Tha\'shi Cenath!\",\"Vihil Ealuel!\"]', '[\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"49\",\"chance\":\"10000\"},{\"id\":\"2544\",\"count\":\"3\",\"chance\":\"3000\"},{\"id\":\"1949\",\"count\":1,\"chance\":\"31000\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"16000\"},{\"id\":\"2401\",\"count\":1,\"chance\":\"11500\"},{\"id\":\"2642\",\"count\":1,\"chance\":\"135000\"},{\"id\":\"2682\",\"count\":1,\"chance\":\"19000\"},{\"id\":\"2689\",\"count\":1,\"chance\":\"14000\"},{\"id\":\"2652\",\"count\":1,\"chance\":\"7250\"},{\"id\":\"2747\",\"count\":1,\"chance\":\"8250\"},{\"id\":\"2032\",\"count\":1,\"chance\":\"5250\"},{\"id\":\"2600\",\"count\":1,\"chance\":\"11750\"},{\"id\":\"2802\",\"count\":1,\"chance\":\"4250\"},{\"id\":\"2047\",\"count\":1,\"chance\":\"22000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2198\",\"count\":1,\"chance\":\"1666\"},{\"id\":\"5922\",\"count\":\"2\",\"chance\":\"1500\"},{\"id\":\"7589\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"7618\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"2189\",\"count\":1,\"chance\":\"400\"},{\"id\":\"2177\",\"count\":1,\"chance\":\"950\"},{\"id\":\"2154\",\"count\":1,\"chance\":\"375\"}]'),
(183, 0, 'Elf Scout', 360, 75, 160, 3, 0, '[\"Tha\'shi Ab\'Dendriel!\",\"Feel the sting of my arrows!\",\"Thy blood will quench the soil\'s thirst!\",\"Evicor guide my arrow.\",\"Your existence will end here!\"]', '[\"invisible\"]', 1, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"30\",\"chance\":\"31000\"},{\"id\":\"2544\",\"count\":\"15\",\"chance\":\"12500\"},{\"id\":\"2545\",\"count\":\"6\",\"chance\":\"7000\"},{\"id\":\"2681\",\"count\":1,\"chance\":\"17750\"},{\"id\":\"2031\",\"count\":1,\"chance\":\"14250\"},{\"id\":\"2484\",\"count\":1,\"chance\":\"19750\"},{\"id\":\"2642\",\"count\":1,\"chance\":\"9370\"},{\"id\":\"2397\",\"count\":1,\"chance\":\"6500\"},{\"id\":\"2482\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2456\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"5921\",\"count\":1,\"chance\":\"250\"},{\"id\":\"7438\",\"count\":1,\"chance\":\"50\"}]'),
(184, 0, 'Elf', 320, 42, 100, 1, 0, '[\"Ulathil beia Thratha!\",\"Bahaha aka!\",\"You are not welcome here.\",\"Flee as long as you can.\",\"Death to the defilers!\"]', '[\"invisible\"]', 1, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"30\",\"chance\":\"25000\"},{\"id\":\"2544\",\"count\":\"6\",\"chance\":\"2250\"},{\"id\":\"2674\",\"count\":\"2\",\"chance\":\"15000\"},{\"id\":\"2397\",\"count\":1,\"chance\":\"12000\"},{\"id\":\"2643\",\"count\":1,\"chance\":\"12500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2510\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"2484\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"2482\",\"count\":1,\"chance\":\"13500\"},{\"id\":\"5921\",\"count\":1,\"chance\":\"1000\"}]'),
(185, 0, 'Charged Energy Elemental', 0, 450, 500, 25, 0, '[]', '[\"energy\",\"invisible\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"25000\"},{\"id\":\"2148\",\"count\":\"44\",\"chance\":\"25000\"},{\"id\":\"7838\",\"count\":\"3\",\"chance\":\"3750\"},{\"id\":\"8303\",\"count\":1,\"chance\":\"3000\"}]'),
(186, 0, 'Energy Elemental', 0, 450, 500, 15, 0, '[]', '[\"ice\",\"fire\",\"energy\",\"invisible\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"42000\"},{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"42000\"},{\"id\":\"7638\",\"count\":\"10\",\"chance\":\"5500\"},{\"id\":\"2399\",\"count\":\"5\",\"chance\":\"5500\"},{\"id\":\"7620\",\"count\":1,\"chance\":\"12000\"},{\"id\":\"7589\",\"count\":1,\"chance\":\"9250\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7449\",\"count\":1,\"chance\":\"6375\"},{\"id\":\"2425\",\"count\":1,\"chance\":\"4200\"},{\"id\":\"2124\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2167\",\"count\":1,\"chance\":\"1150\"},{\"id\":\"2170\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"2515\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2189\",\"count\":1,\"chance\":\"500\"}]'),
(187, 0, 'Energy Overlord', 0, 2800, 4000, 35, 0, '[]', '[\"ice\",\"energy\",\"poison\",\"invisible\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"60\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"40\",\"chance\":\"50000\"},{\"id\":\"2152\",\"count\":\"3\",\"chance\":\"5000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"8306\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"8879\",\"count\":1,\"chance\":\"1000\"}]'),
(188, 0, 'Massive Energy Elemental', 0, 850, 1100, 40, 0, '[]', '[\"ice\",\"energy\",\"fire\",\"invisible\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"75\",\"chance\":\"85000\"},{\"id\":\"2148\",\"count\":\"50\",\"chance\":\"85000\"},{\"id\":\"7638\",\"count\":\"14\",\"chance\":\"3200\"},{\"id\":\"9809\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"7589\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"7590\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7889\",\"count\":1,\"chance\":\"1250\"},{\"id\":\"8901\",\"count\":1,\"chance\":\"800\"},{\"id\":\"8920\",\"count\":1,\"chance\":\"850\"},{\"id\":\"7763\",\"count\":1,\"chance\":\"900\"},{\"id\":\"7895\",\"count\":1,\"chance\":\"300\"}]'),
(189, 0, 'Overcharged Energy Elemental', 0, 1300, 1700, 40, 0, '[]', '[\"ice\",\"energy\",\"invisible\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"41000\"},{\"id\":\"2148\",\"count\":\"60\",\"chance\":\"41000\"},{\"id\":\"7439\",\"count\":1,\"chance\":\"1250\"},{\"id\":\"8303\",\"count\":1,\"chance\":\"20750\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"12000\"},{\"id\":\"2214\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"8920\",\"count\":1,\"chance\":\"650\"}]'),
(190, 0, 'Cat', 220, 0, 20, 1, 0, '[\"Mew!\",\"Meow!\",\"Meow meow!\"]', '[]', 1, 1, 'blood', '[]'),
(191, 0, 'Lion', 320, 30, 80, 1, 0, '[\"Groarrr!\"]', '[]', 1, 1, 'blood', '[{\"id\":\"2671\",\"count\":\"2\",\"chance\":\"18000\"},{\"id\":\"2666\",\"count\":\"4\",\"chance\":\"17000\"}]'),
(192, 0, 'Tiger', 420, 40, 75, 10, 1, '[]', '[]', 1, 1, 'blood', '[{\"id\":\"2671\",\"count\":\"4\",\"chance\":\"8500\"},{\"id\":\"2666\",\"count\":\"4\",\"chance\":\"16750\"}]'),
(193, 0, 'Azure Frog', 305, 20, 60, 5, 0, '[\"Ribbit, ribbit!\"]', '[]', 1, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"11\",\"chance\":\"23500\"},{\"id\":\"3976\",\"count\":1,\"chance\":\"10000\"}]'),
(194, 0, 'Coral Frog', 305, 20, 60, 5, 0, '[\"Ribbit!\"]', '[]', 1, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"11\",\"chance\":\"31500\"},{\"id\":\"3976\",\"count\":1,\"chance\":\"10000\"}]'),
(195, 0, 'Crimson Frog', 305, 20, 60, 5, 0, '[\"Ribbit!\"]', '[]', 1, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"11\",\"chance\":\"29000\"},{\"id\":\"3976\",\"count\":1,\"chance\":\"10000\"}]'),
(196, 0, 'Green Frog', 305, 0, 60, 5, 0, '[\"Ribbit!\",\"Ribbit! Ribbit!\"]', '[]', 1, 0, 'venom', '[]'),
(197, 0, 'Orchid Frog', 0, 20, 60, 5, 0, '[]', '[]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"11\",\"chance\":\"31500\"},{\"id\":\"3976\",\"count\":1,\"chance\":\"10000\"}]'),
(198, 0, 'Toad', 400, 60, 135, 10, 0, '[\"Ribbit, ribbit!\",\"Ribbit!\"]', '[]', 1, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"12\",\"chance\":\"41000\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"10500\"},{\"id\":\"2667\",\"count\":1,\"chance\":\"25000\"},{\"id\":\"2398\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"2382\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2391\",\"count\":1,\"chance\":\"250\"}]'),
(199, 0, 'Damaged Worker Golem', 0, 95, 260, 25, 0, '[\"Klonk klonk klonk\",\"Failure! Failire!\",\"Good morning citizen. How may I serve you?\",\"Target identified: Rat! Termination initiated!\"]', '[\"invisible\",\"paralyze\"]', 0, 0, 'energy', '[{\"id\":\"2148\",\"count\":\"86\",\"chance\":\"21000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"9808\",\"count\":1,\"chance\":\"13275\"},{\"id\":\"5880\",\"count\":1,\"chance\":\"650\"},{\"id\":\"2207\",\"count\":1,\"chance\":\"650\"},{\"id\":\"8309\",\"count\":\"3\",\"chance\":\"500\"}]'),
(200, 0, 'Earth Elemental', 0, 450, 650, 55, 0, '[]', '[\"paralyze\",\"invisible\",\"earth\",\"energy\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"37000\"},{\"id\":\"2148\",\"count\":\"49\",\"chance\":\"37000\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"7850\"},{\"id\":\"7850\",\"count\":\"30\",\"chance\":\"9200\"},{\"id\":\"2398\",\"count\":1,\"chance\":\"8500\"},{\"id\":\"2394\",\"count\":1,\"chance\":\"4250\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"9808\",\"count\":1,\"chance\":\"5600\"},{\"id\":\"1294\",\"count\":\"10\",\"chance\":\"4250\"},{\"id\":\"2509\",\"count\":1,\"chance\":\"8000\"},{\"id\":\"7589\",\"count\":1,\"chance\":\"2600\"}]'),
(201, 0, 'Earth Overlord', 0, 2800, 4000, 55, 0, '[]', '[\"paralyze\",\"invisible\",\"earth\",\"energy\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"40000\"},{\"id\":\"2148\",\"count\":\"78\",\"chance\":\"40000\"},{\"id\":\"2152\",\"count\":\"3\",\"chance\":\"5000\"},{\"id\":\"1294\",\"count\":\"15\",\"chance\":\"5000\"},{\"id\":\"8305\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7884\",\"count\":1,\"chance\":\"750\"},{\"id\":\"8880\",\"count\":1,\"chance\":\"300\"}]'),
(202, 0, 'Gargoyle', 0, 150, 450, 15, 0, '[\"Harrrr Harrrr!\",\"Stone sweet stone.\",\"Feel my claws, softskin.\",\"Chhhhhrrrrk!\",\"There is a stone in your shoe!\"]', '[\"lifedrain\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"30\",\"chance\":\"24000\"},{\"id\":\"2513\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"2671\",\"count\":1,\"chance\":\"17500\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"27500\"},{\"id\":\"2394\",\"count\":1,\"chance\":\"1750\"},{\"id\":\"2449\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2194\",\"count\":\"10\",\"chance\":\"8000\"},{\"id\":\"2457\",\"count\":1,\"chance\":\"6000\"},{\"id\":\"2448\",\"count\":1,\"chance\":\"5300\"},{\"id\":\"2489\",\"count\":1,\"chance\":\"750\"},{\"id\":\"2129\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2209\",\"count\":1,\"chance\":\"300\"}]'),
(203, 0, 'Jagged Earth Elemental', 0, 1300, 1500, 30, 0, '[\"Stomp STOMP\"]', '[\"paralyze\",\"invisible\",\"earth\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"27000\"},{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"27000\"},{\"id\":\"5880\",\"count\":\"2\",\"chance\":\"800\"},{\"id\":\"8298\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7732\",\"count\":1,\"chance\":\"1600\"},{\"id\":\"2244\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2245\",\"count\":1,\"chance\":\"18000\"}]'),
(204, 0, 'Massive Earth Elemental', 0, 850, 1330, 35, 0, '[]', '[\"paralyze\",\"invisible\",\"earth\",\"energy\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"32000\"},{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"32000\"},{\"id\":\"2148\",\"count\":\"51\",\"chance\":\"32000\"},{\"id\":\"2510\",\"count\":1,\"chance\":\"8750\"},{\"id\":\"2666\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"2200\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2436\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"9809\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"2213\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"2197\",\"count\":1,\"chance\":\"300\"},{\"id\":\"7887\",\"count\":1,\"chance\":\"250\"},{\"id\":\"7387\",\"count\":1,\"chance\":\"200\"}]'),
(205, 0, 'Medusa', 0, 4050, 4500, 10, 0, '[\"You will ssuch a fine ssstatue!\",\"There isss no chhhanccce of esscape\",\"Are you tired or why are you moving thhat sslow\"]', '[\"earth\",\"paralyze\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"46000\"},{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"46000\"},{\"id\":\"8473\",\"count\":1,\"chance\":\"6250\"},{\"id\":\"7590\",\"count\":1,\"chance\":\"6750\"},{\"id\":\"2476\",\"count\":1,\"chance\":\"2600\"},{\"id\":\"2152\",\"count\":\"2\",\"chance\":\"565000\"},{\"id\":\"2143\",\"count\":1,\"chance\":\"7750\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2536\",\"count\":1,\"chance\":\"2600\"},{\"id\":\"7590\",\"count\":1,\"chance\":\"6750\"},{\"id\":\"8473\",\"count\":1,\"chance\":\"6250\"},{\"id\":\"7887\",\"count\":1,\"chance\":\"3550\"},{\"id\":\"7884\",\"count\":1,\"chance\":\"550\"},{\"id\":\"7413\",\"count\":1,\"chance\":\"1300\"},{\"id\":\"10219\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"9810\",\"count\":1,\"chance\":\"650\"},{\"id\":\"7885\",\"count\":1,\"chance\":\"250\"}]'),
(206, 0, 'Muddy Earth Elemental', 0, 450, 650, 20, 0, '[]', '[\"paralyze\",\"invisible\",\"earth\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"24500\"},{\"id\":\"2148\",\"count\":\"47\",\"chance\":\"24500\"},{\"id\":\"1294\",\"count\":\"3\",\"chance\":\"40000\"},{\"id\":\"2244\",\"count\":1,\"chance\":\"22000\"},{\"id\":\"8298\",\"count\":1,\"chance\":\"3750\"}]'),
(207, 0, 'Stone Golem', 590, 280, 270, 1, 0, '[]', '[\"paralyze\"]', 1, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"15\",\"chance\":\"9000\"},{\"id\":\"1294\",\"count\":\"4\",\"chance\":\"8250\"},{\"id\":\"2509\",\"count\":1,\"chance\":\"9750\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"7250\"},{\"id\":\"2166\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2483\",\"count\":1,\"chance\":\"3250\"},{\"id\":\"2395\",\"count\":1,\"chance\":\"1100\"},{\"id\":\"5880\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2124\",\"count\":1,\"chance\":\"200\"}]'),
(208, 0, 'War Golem', 0, 2550, 4300, 30, 1, '[\"Azerus barada nikto!\",\"Klonk klonk klonk\",\"Engaging Enemy!\",\"Threat level processed.\",\"Charging weapon systems!\",\"Auto repair in progress.\",\"The battle is joined!\",\"Termination initialized!\",\"Rrrtttarrrttarrrtta\"]', '[\"invisible\",\"paralyze\"]', 0, 0, 'energy', '[{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"37500\"},{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"37500\"},{\"id\":\"8309\",\"count\":\"5\",\"chance\":\"9000\"},{\"id\":\"2377\",\"count\":1,\"chance\":\"5500\"},{\"id\":\"2510\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"2394\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"2513\",\"count\":1,\"chance\":\"6500\"},{\"id\":\"8473\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"7590\",\"count\":1,\"chance\":\"5500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"5880\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"7439\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2438\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"9808\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2209\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2213\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"9980\",\"count\":1,\"chance\":\"300\"},{\"id\":\"7893\",\"count\":1,\"chance\":\"400\"},{\"id\":\"2645\",\"count\":1,\"chance\":\"400\"},{\"id\":\"7403\",\"count\":1,\"chance\":\"250\"},{\"id\":\"7422\",\"count\":1,\"chance\":\"250\"},{\"id\":\"7428\",\"count\":1,\"chance\":\"300\"},{\"id\":\"2177\",\"count\":1,\"chance\":\"300\"}]'),
(209, 0, 'Worker Golem', 0, 1250, 1400, 25, 0, '[\"INTRUDER ALARM!\",\"klonk klonk klonk\",\"Rrrtttarrrttarrrtta\",\"Awaiting orders.\",\"Secret objective complete.\"]', '[\"invisible\",\"paralyze\"]', 0, 0, 'energy', '[{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"34000\"},{\"id\":\"2148\",\"count\":\"61\",\"chance\":\"34000\"},{\"id\":\"8309\",\"count\":\"5\",\"chance\":\"2000\"},{\"id\":\"5880\",\"count\":1,\"chance\":\"850\"},{\"id\":\"9690\",\"count\":\"2\",\"chance\":\"500\"},{\"id\":\"9809\",\"count\":1,\"chance\":\"4650\"},{\"id\":\"9812\",\"count\":1,\"chance\":\"2650\"},{\"id\":\"8472\",\"count\":1,\"chance\":\"1600\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"1900\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7439\",\"count\":1,\"chance\":\"1350\"},{\"id\":\"9976\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"7452\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2391\",\"count\":1,\"chance\":\"1550\"},{\"id\":\"2177\",\"count\":1,\"chance\":\"750\"},{\"id\":\"2164\",\"count\":1,\"chance\":\"650\"},{\"id\":\"7428\",\"count\":1,\"chance\":\"200\"},{\"id\":\"7590\",\"count\":1,\"chance\":\"1500\"}]'),
(210, 0, 'Ghost', 100, 120, 150, 1, 0, '[\"Huh!\",\"Shhhhhh\",\"Buuuuuh\"]', '[\"physical\",\"lifedrain\",\"paralyze\"]', 0, 0, 'undead', '[{\"id\":\"2642\",\"count\":1,\"chance\":\"23750\"},{\"id\":\"2394\",\"count\":1,\"chance\":\"17000\"},{\"id\":\"2404\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"2804\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2654\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"1962\",\"count\":1,\"chance\":\"3600\"},{\"id\":\"5909\",\"count\":1,\"chance\":\"1800\"},{\"id\":\"2532\",\"count\":1,\"chance\":\"1700\"},{\"id\":\"2165\",\"count\":1,\"chance\":\"500\"}]'),
(211, 0, 'Phantasm', 0, 3300, 3950, 30, 0, '[\"Oh my, you forgot to put your pants on!\",\"Weeheeheeheehee!\",\"Its nothing but a dream!\",\"Give in!\"]', '[\"paralyze\",\"invisible\"]', 0, 0, 'undead', '[]'),
(212, 0, 'Spectre', 0, 2100, 1350, 15, 0, '[\"Revenge ... is so ... sweet!\",\"Life...force! Feed me your... lifeforce!\"]', '[\"paralyze\",\"invisible\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"39000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"39000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"39000\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"25000\"},{\"id\":\"2152\",\"count\":\"7\",\"chance\":\"2000\"},{\"id\":\"2642\",\"count\":1,\"chance\":\"21000\"},{\"id\":\"5944\",\"count\":1,\"chance\":\"8000\"},{\"id\":\"2165\",\"count\":1,\"chance\":\"400\"},{\"id\":\"2189\",\"count\":1,\"chance\":\"9250\"},{\"id\":\"6500\",\"count\":1,\"chance\":\"6000\"},{\"id\":\"2071\",\"count\":1,\"chance\":\"11000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"25000\"},{\"id\":\"7383\",\"count\":1,\"chance\":\"950\"},{\"id\":\"2134\",\"count\":1,\"chance\":\"1100\"},{\"id\":\"5909\",\"count\":1,\"chance\":\"4250\"},{\"id\":\"6300\",\"count\":1,\"chance\":\"1100\"},{\"id\":\"7590\",\"count\":1,\"chance\":\"550\"},{\"id\":\"2134\",\"count\":1,\"chance\":\"200\"},{\"id\":\"2136\",\"count\":1,\"chance\":\"100\"}]'),
(213, 0, 'Wisp', 0, 0, 115, 1, 1, '[\"Crackle!\",\"Tsshh\"]', '[\"death\",\"paralyze\"]', 0, 0, 'undead', '[{\"id\":\"10521\",\"count\":1,\"chance\":\"200\"}]'),
(214, 0, 'Behemoth', 0, 2500, 4000, 30, 1, '[\"You\'re so little!\",\"Human flesh - delicious!\",\"Crush the intruders!\"]', '[\"paralyze\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"29500\"},{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"29500\"},{\"id\":\"2023\",\"count\":1,\"chance\":\"10500\"},{\"id\":\"7368\",\"count\":\"2\",\"chance\":\"7000\"},{\"id\":\"2231\",\"count\":1,\"chance\":\"7650\"},{\"id\":\"2416\",\"count\":1,\"chance\":\"15750\"},{\"id\":\"2489\",\"count\":1,\"chance\":\"2650\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2666\",\"count\":\"6\",\"chance\":\"6500\"},{\"id\":\"5893\",\"count\":1,\"chance\":\"1300\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2645\",\"count\":1,\"chance\":\"250\"},{\"id\":\"2377\",\"count\":1,\"chance\":\"3200\"},{\"id\":\"2393\",\"count\":1,\"chance\":\"900\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"925\"},{\"id\":\"2174\",\"count\":1,\"chance\":\"850\"},{\"id\":\"5930\",\"count\":1,\"chance\":\"350\"},{\"id\":\"2454\",\"count\":1,\"chance\":\"550\"},{\"id\":\"7396\",\"count\":1,\"chance\":\"100\"},{\"id\":\"2125\",\"count\":1,\"chance\":\"450\"},{\"id\":\"7413\",\"count\":1,\"chance\":\"150\"}]'),
(215, 0, 'Cyclops', 490, 150, 260, 1, 0, '[\"Il lorstok human!\",\"Toks utat.\",\"Human, uh whil dyh!\",\"Youh ah trak!\",\"Let da mashing begin!\"]', '[]', 1, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"33\",\"chance\":\"22500\"},{\"id\":\"2148\",\"count\":\"22\",\"chance\":\"22500\"},{\"id\":\"2671\",\"count\":\"4\",\"chance\":\"4500\"},{\"id\":\"7618\",\"count\":1,\"chance\":\"250\"},{\"id\":\"2666\",\"count\":\"3\",\"chance\":\"18333\"},{\"id\":\"2510\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2406\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2513\",\"count\":1,\"chance\":\"2300\"},{\"id\":\"2129\",\"count\":1,\"chance\":\"400\"},{\"id\":\"2381\",\"count\":1,\"chance\":\"800\"},{\"id\":\"2490\",\"count\":1,\"chance\":\"250\"},{\"id\":\"2209\",\"count\":1,\"chance\":\"100\"},{\"id\":\"7398\",\"count\":1,\"chance\":\"70\"}]'),
(216, 0, 'Cyclops Drone', 525, 200, 325, 1, 0, '[\"Fee! Fie! Foe! Fum!\",\"Luttl pest!\",\"Me makking you pulp!\",\"Humy tasy! Hum hum!\"]', '[]', 0, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"24\",\"chance\":\"32000\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"26750\"},{\"id\":\"2671\",\"count\":\"2\",\"chance\":\"11000\"},{\"id\":\"2406\",\"count\":1,\"chance\":\"8000\"},{\"id\":\"2510\",\"count\":1,\"chance\":\"1600\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2513\",\"count\":1,\"chance\":\"1300\"},{\"id\":\"2381\",\"count\":1,\"chance\":\"850\"},{\"id\":\"7398\",\"count\":1,\"chance\":\"150\"},{\"id\":\"2490\",\"count\":1,\"chance\":\"250\"},{\"id\":\"7588\",\"count\":1,\"chance\":\"600\"}]'),
(217, 0, 'Cyclops Smith', 695, 255, 435, 1, 0, '[\"Outis emoi g\' onoma.\",\"Whack da humy!\",\"Ai humy phary ty kaynon\"]', '[]', 0, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"69\",\"chance\":\"31000\"},{\"id\":\"2666\",\"count\":\"3\",\"chance\":\"12500\"},{\"id\":\"2671\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2513\",\"count\":1,\"chance\":\"8000\"},{\"id\":\"2417\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2510\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2378\",\"count\":1,\"chance\":\"3200\"},{\"id\":\"2442\",\"count\":1,\"chance\":\"1800\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"2490\",\"count\":1,\"chance\":\"200\"},{\"id\":\"7398\",\"count\":1,\"chance\":\"120\"},{\"id\":\"7588\",\"count\":1,\"chance\":\"450\"},{\"id\":\"2209\",\"count\":1,\"chance\":\"350\"},{\"id\":\"7452\",\"count\":1,\"chance\":\"250\"}]'),
(218, 0, 'Frost Giant', 490, 150, 270, 1, 0, '[\"Hmm Humansoup\",\"Stand still ya tasy snack!\",\"Joh Thun!\",\"Brore Smode!\",\"Horre Sjan Flan!\",\"Forle Bramma!\"]', '[]', 0, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"30\",\"chance\":\"100000\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"33333\"},{\"id\":\"2671\",\"count\":1,\"chance\":\"33333\"},{\"id\":\"2406\",\"count\":1,\"chance\":\"25000\"},{\"id\":\"7441\",\"count\":1,\"chance\":\"3444\"},{\"id\":\"2510\",\"count\":1,\"chance\":\"5333\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2513\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2381\",\"count\":1,\"chance\":\"1955\"},{\"id\":\"7460\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2490\",\"count\":1,\"chance\":\"2777\"},{\"id\":\"2129\",\"count\":1,\"chance\":\"1666\"},{\"id\":\"7618\",\"count\":1,\"chance\":\"1666\"},{\"id\":\"7290\",\"count\":1,\"chance\":\"1666\"},{\"id\":\"2209\",\"count\":1,\"chance\":\"2055\"}]'),
(219, 0, 'Frost Giantess', 490, 150, 275, 1, 0, '[\"Ymirs Mjalle!\",\"No run so much, must stay fat!\",\"Horre, Sjan Flan!\",\"Damned fast food.\",\"Come kiss the cook!\"]', '[]', 0, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"40\",\"chance\":\"100000\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"33333\"},{\"id\":\"2671\",\"count\":\"2\",\"chance\":\"33333\"},{\"id\":\"2406\",\"count\":1,\"chance\":\"25000\"},{\"id\":\"2510\",\"count\":1,\"chance\":\"5333\"},{\"id\":\"7441\",\"count\":1,\"chance\":\"3444\"},{\"id\":\"2513\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"7460\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"1294\",\"count\":\"3\",\"chance\":\"2500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2129\",\"count\":1,\"chance\":\"1955\"},{\"id\":\"2209\",\"count\":1,\"chance\":\"2055\"},{\"id\":\"2381\",\"count\":1,\"chance\":\"1955\"},{\"id\":\"2490\",\"count\":1,\"chance\":\"2777\"},{\"id\":\"7290\",\"count\":1,\"chance\":\"4444\"},{\"id\":\"7620\",\"count\":1,\"chance\":\"2777\"}]'),
(220, 0, 'Yeti', 0, 460, 950, 25, 0, '[\"Yooodelaaahooohooo!\",\"Yooodelaaaheeeheee!\"]', '[\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"60\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"40\",\"chance\":\"100000\"},{\"id\":\"2666\",\"count\":\"4\",\"chance\":\"33333\"},{\"id\":\"2671\",\"count\":\"5\",\"chance\":\"10000\"},{\"id\":\"2111\",\"count\":\"22\",\"chance\":\"10000\"},{\"id\":\"2644\",\"count\":1,\"chance\":\"1333\"}]'),
(221, 0, 'Goblin', 290, 25, 50, 1, 0, '[\"Me have him!\",\"Zig Zag! Gobo attack!\",\"Help! Goblinkiller!\",\"Bugga! Bugga!\",\"Me green, me mean!\"]', '[]', 1, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"9\",\"chance\":\"28750\"},{\"id\":\"2230\",\"count\":1,\"chance\":\"13750\"},{\"id\":\"2449\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2379\",\"count\":1,\"chance\":\"16000\"},{\"id\":\"2667\",\"count\":1,\"chance\":\"13750\"},{\"id\":\"2467\",\"count\":1,\"chance\":\"6750\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2461\",\"count\":1,\"chance\":\"12570\"},{\"id\":\"2235\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"2406\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2559\",\"count\":1,\"chance\":\"7750\"}]'),
(222, 0, 'Goblin Assassin', 360, 52, 75, 1, 0, '[\"Goblin Powahhh!\"]', '[]', 1, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"9\",\"chance\":\"30000\"},{\"id\":\"2667\",\"count\":1,\"chance\":\"13750\"},{\"id\":\"2449\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2406\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2230\",\"count\":1,\"chance\":\"15000\"},{\"id\":\"2379\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2467\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2559\",\"count\":1,\"chance\":\"8750\"},{\"id\":\"1294\",\"count\":\"4\",\"chance\":\"9000\"},{\"id\":\"2235\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"2461\",\"count\":1,\"chance\":\"13000\"}]'),
(223, 0, 'Goblin Leader', 290, 50, 75, 1, 0, '[\"Go go, Gobo attack !!\",\"Me the greenest and the meanest!\",\"Me have power to crush you!\",\"Goblinkiller! Catch him !!\"]', '[]', 1, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2230\",\"count\":1,\"chance\":\"15000\"},{\"id\":\"2461\",\"count\":1,\"chance\":\"16000\"},{\"id\":\"2467\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"2379\",\"count\":1,\"chance\":\"17500\"},{\"id\":\"2667\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2235\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2559\",\"count\":1,\"chance\":\"10500\"},{\"id\":\"2406\",\"count\":1,\"chance\":\"12500\"},{\"id\":\"2449\",\"count\":1,\"chance\":\"6000\"}]'),
(224, 0, 'Goblin Scavenger', 310, 37, 60, 1, 0, '[\"Shiny, Shiny!\",\"You mean!\",\"All mine!\",\"Uhh!\"]', '[]', 1, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"9\",\"chance\":\"31500\"},{\"id\":\"2379\",\"count\":1,\"chance\":\"22500\"},{\"id\":\"2230\",\"count\":1,\"chance\":\"15000\"},{\"id\":\"2559\",\"count\":1,\"chance\":\"14250\"},{\"id\":\"2667\",\"count\":1,\"chance\":\"12500\"},{\"id\":\"2461\",\"count\":1,\"chance\":\"12500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2235\",\"count\":1,\"chance\":\"6000\"},{\"id\":\"2406\",\"count\":1,\"chance\":\"8200\"},{\"id\":\"2467\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2449\",\"count\":1,\"chance\":\"8000\"}]'),
(225, 0, 'Grynch Clan Goblin', 0, 4, 80, 325, 1, '[\"T\'was not me hand in your pocket!\",\"Look! Cool stuff in house. Let\'s get it!\",\"Uhh! Nobody home!\",\"Me just borrowed it!\",\"Me no steal! Me found it!\",\"Me had it for five minutes. It\'s family heirloom now!\",\"Nice human won\'t hurt little, good goblin?\",\"Gimmegimme!\",\"Invite me in you lovely house plx!\",\"Other Goblin stole it!\",\"All presents mine!\",\"Me got ugly ones purse\",\"Free itans plz!\",\"Not me! Not me!\",\"Guys, help me here! Guys? Guys???\",\"That only much dust in me pocket! Honest!\",\"Can me have your stuff?\",\"Halp, Big dumb one is after me!\",\"Uh, So many shiny things!\",\"Utani hur hur hur!\",\"Mee? Stealing? Never!!!\",\"Oh what fun it is to steal a one-horse open sleigh!\",\"Must have it! Must have it!\",\"Where me put me lockpick?\",\"Catch me if you can!\"]', '[\"fire\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"22\",\"chance\":\"22500\"},{\"id\":\"6497\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"2111\",\"count\":\"5\",\"chance\":\"7000\"},{\"id\":\"6277\",\"count\":\"3\",\"chance\":\"7000\"},{\"id\":\"2675\",\"count\":\"3\",\"chance\":\"7000\"},{\"id\":\"2687\",\"count\":\"5\",\"chance\":\"7000\"},{\"id\":\"2679\",\"count\":\"4\",\"chance\":\"7000\"},{\"id\":\"2674\",\"count\":\"3\",\"chance\":\"700\"},{\"id\":\"2695\",\"count\":\"2\",\"chance\":\"5000\"},{\"id\":\"2688\",\"count\":\"3\",\"chance\":\"5000\"},{\"id\":\"6394\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2072\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2163\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"1852\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"1988\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2172\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"1949\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"6501\",\"count\":\"2\",\"chance\":\"4000\"},{\"id\":\"2661\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"5890\",\"count\":\"5\",\"chance\":\"4000\"},{\"id\":\"5894\",\"count\":\"3\",\"chance\":\"4000\"},{\"id\":\"5902\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"4873\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"7909\",\"count\":\"5\",\"chance\":\"3500\"},{\"id\":\"7910\",\"count\":\"100\",\"chance\":\"3500\"},{\"id\":\"6393\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"6091\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2551\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2114\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"5792\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2560\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"1686\",\"count\":1,\"chance\":\"750\"},{\"id\":\"1687\",\"count\":1,\"chance\":\"750\"},{\"id\":\"1688\",\"count\":1,\"chance\":\"750\"},{\"id\":\"1689\",\"count\":1,\"chance\":\"750\"},{\"id\":\"2102\",\"count\":1,\"chance\":\"500\"},{\"id\":\"4839\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2159\",\"count\":\"2\",\"chance\":\"500\"},{\"id\":\"5022\",\"count\":\"2\",\"chance\":\"500\"},{\"id\":\"2160\",\"count\":1,\"chance\":\"250\"},{\"id\":\"7731\",\"count\":1,\"chance\":\"250\"},{\"id\":\"2534\",\"count\":1,\"chance\":\"250\"}]'),
(226, 0, 'Ice Overlord', 0, 1950, 2800, 85, 0, '[]', '[\"fire\",\"lifedrain\",\"paralyze\",\"invisible\",\"drown\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"60\",\"chance\":\"27500\"},{\"id\":\"2148\",\"count\":\"50\",\"chance\":\"27500\"},{\"id\":\"2152\",\"count\":\"3\",\"chance\":\"45750\"},{\"id\":\"8878\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"8300\",\"count\":1,\"chance\":\"100000\"}]'),
(227, 0, 'Massive Water Elemental', 0, 800, 1250, 140, 0, '[]', '[\"paralyze\",\"invisible\",\"drown\"]', 0, 0, 'undead', '[]'),
(228, 0, 'Roaring Water Elemental', 0, 1300, 1750, 85, 0, '[]', '[\"fire\",\"lifedrain\",\"paralyze\",\"invisible\",\"drown\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"27000\"},{\"id\":\"2148\",\"count\":\"87\",\"chance\":\"27000\"},{\"id\":\"7839\",\"count\":\"2\",\"chance\":\"1000\"},{\"id\":\"8911\",\"count\":1,\"chance\":\"750\"}]'),
(229, 0, 'Slick Water Elemental', 0, 450, 550, 30, 0, '[\"Blubb\",\"Splipsh Splash\"]', '[\"ice\",\"drown\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"22500\"},{\"id\":\"2148\",\"count\":\"60\",\"chance\":\"22500\"},{\"id\":\"7839\",\"count\":\"3\",\"chance\":\"2575\"},{\"id\":\"8302\",\"count\":1,\"chance\":\"6000\"}]'),
(230, 0, 'Water Elemental', 0, 450, 550, 115, 0, '[]', '[\"paralyze\",\"invisible\",\"drown\"]', 0, 0, 'undead', '[]'),
(231, 0, 'Ancient Scarab', 0, 720, 1000, 55, 1, '[]', '[\"paralyze\",\"invisible\"]', 0, 0, 'venom', '[{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"27000\"},{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"27000\"},{\"id\":\"2148\",\"count\":\"60\",\"chance\":\"27000\"},{\"id\":\"2162\",\"count\":1,\"chance\":\"13800\"},{\"id\":\"2159\",\"count\":\"4\",\"chance\":\"555\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"13800\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2142\",\"count\":1,\"chance\":\"1700\"},{\"id\":\"2135\",\"count\":1,\"chance\":\"750\"},{\"id\":\"7589\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2440\",\"count\":1,\"chance\":\"300\"},{\"id\":\"2540\",\"count\":1,\"chance\":\"500\"},{\"id\":\"7903\",\"count\":1,\"chance\":\"350\"}]'),
(232, 0, 'Nutterfly', 0, 0, 2, 40, 0, '[]', '[\"poison\",\"paralyze\",\"drunk\"]', 0, 0, 'venom', '[]'),
(233, 0, 'Bug', 250, 18, 29, 10, 0, '[]', '[]', 1, 1, 'venom', '[{\"id\":\"2148\",\"count\":\"6\",\"chance\":\"21000\"},{\"id\":\"2679\",\"count\":\"3\",\"chance\":\"6600\"}]'),
(234, 0, 'Centipede', 335, 30, 70, 1, 0, '[]', '[]', 1, 1, 'venom', '[{\"id\":\"2148\",\"count\":\"17\",\"chance\":\"38500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2398\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"2376\",\"count\":1,\"chance\":\"4000\"}]'),
(235, 0, 'Cockroach', 0, 0, 1, 1, 0, '[]', '[\"poison\"]', 0, 0, 'venom', '[{\"id\":\"8710\",\"count\":1,\"chance\":\"100000\"}]'),
(236, 0, 'Larva', 355, 40, 70, 1, 0, '[]', '[\"paralyze\"]', 1, 1, 'venom', '[{\"id\":\"2148\",\"count\":\"15\",\"chance\":\"35000\"},{\"id\":\"2666\",\"count\":\"1\",\"chance\":\"33000\"}]'),
(237, 0, 'Butterfly', 0, 0, 2, 40, 0, '[]', '[\"poison\",\"paralyze\",\"drunk\"]', 0, 0, 'venom', '[]'),
(238, 0, 'Scarab', 395, 120, 320, 1, 1, '[]', '[\"paralyze\"]', 1, 1, 'venom', '[{\"id\":\"2148\",\"count\":\"55\",\"chance\":\"26000\"},{\"id\":\"2544\",\"count\":\"3\",\"chance\":\"4000\"},{\"id\":\"2439\",\"count\":1,\"chance\":\"500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2442\",\"count\":1,\"chance\":\"375\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"27500\"},{\"id\":\"2159\",\"count\":\"2\",\"chance\":\"900\"}]'),
(239, 0, 'Wasp', 280, 25, 35, 120, 0, '[\"Bssssss\"]', '[]', 1, 1, 'venom', '[{\"id\":\"5902\",\"count\":1,\"chance\":\"3000\"}]'),
(240, 0, 'Lizard Sentinel', 0, 110, 265, 10, 0, '[\"Tssss!\"]', '[\"invisible\"]', 0, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"60\",\"chance\":\"25000\"},{\"id\":\"2389\",\"count\":\"3\",\"chance\":\"12000\"},{\"id\":\"2464\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2483\",\"count\":1,\"chance\":\"8800\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"3965\",\"count\":1,\"chance\":\"6000\"},{\"id\":\"5881\",\"count\":1,\"chance\":\"650\"},{\"id\":\"2425\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"3974\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"5876\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"7618\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2381\",\"count\":1,\"chance\":\"2000\"}]'),
(241, 0, 'Lizard Snakecharmer', 0, 210, 325, 1, 0, '[\"I ssssmell warm blood!\",\"Shhhhhhhh\"]', '[\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"31500\"},{\"id\":\"2654\",\"count\":1,\"chance\":\"13000\"},{\"id\":\"2817\",\"count\":1,\"chance\":\"40000\"},{\"id\":\"2237\",\"count\":1,\"chance\":\"22500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"5876\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2182\",\"count\":1,\"chance\":\"1250\"},{\"id\":\"2177\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"5881\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2181\",\"count\":1,\"chance\":\"250\"},{\"id\":\"7620\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2168\",\"count\":1,\"chance\":\"200\"},{\"id\":\"3971\",\"count\":1,\"chance\":\"100\"}]'),
(242, 0, 'Lizard Templar', 0, 115, 410, 1, 0, '[\"Hissss!\"]', '[]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"60\",\"chance\":\"29500\"},{\"id\":\"2406\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"2457\",\"count\":1,\"chance\":\"5500\"},{\"id\":\"2376\",\"count\":1,\"chance\":\"6000\"},{\"id\":\"2394\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"5876\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"3963\",\"count\":1,\"chance\":\"750\"},{\"id\":\"7618\",\"count\":1,\"chance\":\"800\"},{\"id\":\"5881\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"3975\",\"count\":1,\"chance\":\"500\"}]'),
(243, 0, 'Wyvern', 0, 515, 795, 1, 0, '[\"Shriiiek\"]', '[\"drunk\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"75\",\"chance\":\"21500\"},{\"id\":\"2672\",\"count\":\"3\",\"chance\":\"22500\"},{\"id\":\"2547\",\"count\":\"2\",\"chance\":\"3000\"},{\"id\":\"7588\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2187\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"7408\",\"count\":1,\"chance\":\"750\"},{\"id\":\"1976\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2127\",\"count\":1,\"chance\":\"300\"}]'),
(244, 0, 'Minotaur Archer', 390, 65, 100, 1, 0, '[\"Ruan Wihmpy!\",\"Kaplar!\"]', '[]', 1, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"28\",\"chance\":\"18000\"},{\"id\":\"2543\",\"count\":\"23\",\"chance\":\"26500\"},{\"id\":\"7363\",\"count\":\"4\",\"chance\":\"10000\"},{\"id\":\"2458\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2455\",\"count\":1,\"chance\":\"9500\"},{\"id\":\"2666\",\"count\":1,\"chance\":\"9500\"},{\"id\":\"2649\",\"count\":1,\"chance\":\"5500\"},{\"id\":\"2461\",\"count\":1,\"chance\":\"4700\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2465\",\"count\":1,\"chance\":\"2750\"},{\"id\":\"5878\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2481\",\"count\":1,\"chance\":\"700\"},{\"id\":\"2483\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2464\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"2648\",\"count\":1,\"chance\":\"7500\"},{\"id\":\"2513\",\"count\":1,\"chance\":\"300\"}]'),
(245, 0, 'Minotaur Guard', 550, 160, 185, 1, 0, '[\"Kirll Karrrl!\",\"Kaplar!\"]', '[]', 1, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"32500\"},{\"id\":\"2649\",\"count\":1,\"chance\":\"14000\"},{\"id\":\"2388\",\"count\":1,\"chance\":\"11750\"},{\"id\":\"2666\",\"count\":1,\"chance\":\"11500\"},{\"id\":\"2580\",\"count\":1,\"chance\":\"5750\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2465\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"2464\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2513\",\"count\":1,\"chance\":\"2150\"},{\"id\":\"5878\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2648\",\"count\":1,\"chance\":\"600\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"500\"},{\"id\":\"7618\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2458\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"7588\",\"count\":1,\"chance\":\"150\"},{\"id\":\"7401\",\"count\":1,\"chance\":\"100\"}]'),
(246, 0, 'Minotaur Mage', 0, 150, 155, 1, 0, '[\"Learrn tha secrret uf deathhh!\",\"Kaplar!\"]', '[\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"40\",\"chance\":\"37000\"},{\"id\":\"2684\",\"count\":\"8\",\"chance\":\"7150\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2817\",\"count\":1,\"chance\":\"17500\"},{\"id\":\"2649\",\"count\":1,\"chance\":\"13500\"},{\"id\":\"2403\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2461\",\"count\":1,\"chance\":\"8000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2817\",\"count\":1,\"chance\":\"17500\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2465\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"5878\",\"count\":1,\"chance\":\"3250\"},{\"id\":\"2404\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2648\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"7425\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2189\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"7620\",\"count\":1,\"chance\":\"750\"}]');
INSERT INTO `myaac_monsters` (`id`, `hidden`, `name`, `mana`, `exp`, `health`, `speed_lvl`, `use_haste`, `voices`, `immunities`, `summonable`, `convinceable`, `race`, `loot`) VALUES
(247, 0, 'Minotaur', 330, 50, 100, 1, 0, '[\"Kaplar!\"]', '[]', 1, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"28\",\"chance\":\"17500\"},{\"id\":\"2510\",\"count\":1,\"chance\":\"17750\"},{\"id\":\"2649\",\"count\":1,\"chance\":\"15000\"},{\"id\":\"2398\",\"count\":1,\"chance\":\"8500\"},{\"id\":\"2376\",\"count\":1,\"chance\":\"9500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2464\",\"count\":1,\"chance\":\"9200\"},{\"id\":\"2666\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"2460\",\"count\":1,\"chance\":\"7250\"},{\"id\":\"2458\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"2386\",\"count\":1,\"chance\":\"3950\"},{\"id\":\"2554\",\"count\":1,\"chance\":\"2400\"},{\"id\":\"5878\",\"count\":1,\"chance\":\"850\"},{\"id\":\"2172\",\"count\":1,\"chance\":\"250\"}]'),
(248, 0, 'Badger', 200, 5, 20, 1, 0, '[]', '[]', 1, 1, 'blood', '[{\"id\":\"3976\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2671\",\"count\":1,\"chance\":\"20000\"}]'),
(249, 0, 'Bat', 250, 10, 30, 1, 0, '[]', '[]', 1, 1, 'blood', '[{\"id\":\"5894\",\"count\":1,\"chance\":\"1500\"}]'),
(250, 0, 'Deer', 260, 0, 25, 1, 0, '[]', '[]', 1, 1, 'blood', '[{\"id\":\"2666\",\"count\":\"4\",\"chance\":\"20000\"},{\"id\":\"2671\",\"count\":\"2\",\"chance\":\"20000\"}]'),
(251, 0, 'Hacker', 0, 45, 430, 15, 1, '[\"Feel the wrath of me dos attack!\",\"You\'re next!\",\"Gimme free gold!\",\"Me sooo smart!\",\"Me have a cheating link for you!\",\"Me is GM!\",\"Gimme your password!\",\"Me just need the code!\",\"Me not stink!\",\"Me other char is highlevel!\"]', '[\"energy\",\"fire\",\"poison\",\"drunk\"]', 0, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"12\",\"chance\":\"100000\"},{\"id\":\"2671\",\"count\":1,\"chance\":\"50000\"},{\"id\":\"6570\",\"count\":1,\"chance\":\"5538\"},{\"id\":\"6571\",\"count\":1,\"chance\":\"1538\"},{\"id\":\"2044\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2381\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2386\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2391\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2378\",\"count\":1,\"chance\":\"5000\"}]'),
(252, 0, 'The Halloween Hare', 0, 0, 2000, 1, 0, '[]', '[]', 0, 0, 'blood', '[]'),
(253, 0, 'Hyaena', 275, 20, 60, 1, 0, '[]', '[]', 1, 1, 'blood', '[{\"id\":\"3976\",\"count\":\"4\",\"chance\":\"24375\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"21000\"}]'),
(254, 0, 'Pig', 255, 0, 25, 1, 0, '[]', '[]', 1, 1, 'blood', '[{\"id\":\"2666\",\"count\":\"4\",\"chance\":\"20000\"}]'),
(255, 0, 'Rabbit', 220, 0, 15, 1, 0, '[]', '[]', 1, 1, 'blood', '[{\"id\":\"2684\",\"count\":\"2\",\"chance\":\"9000\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"20000\"}]'),
(256, 0, 'Silver Rabbit', 220, 0, 15, 1, 0, '[]', '[]', 1, 1, 'blood', '[{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"25000\"},{\"id\":\"2684\",\"count\":1,\"chance\":\"12500\"}]'),
(257, 0, 'Skunk', 200, 3, 20, 1, 0, '[]', '[]', 1, 1, 'blood', '[{\"id\":\"3976\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2666\",\"count\":1,\"chance\":\"1000\"}]'),
(258, 0, 'Squirrel', 220, 0, 20, 135, 0, '[\"Chchch\"]', '[]', 1, 1, 'blood', '[{\"id\":\"7909\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"7910\",\"count\":1,\"chance\":\"2500\"}]'),
(259, 0, 'Dark Monk', 0, 145, 190, 1, 1, '[\"You are no match to us!\",\"This is where your path will end!\",\"Your end has come!\"]', '[\"invisible\"]', 0, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"5\",\"chance\":\"34000\"},{\"id\":\"2193\",\"count\":1,\"chance\":\"1400\"},{\"id\":\"2689\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2015\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2044\",\"count\":1,\"chance\":\"11750\"},{\"id\":\"2467\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2177\",\"count\":1,\"chance\":\"2750\"},{\"id\":\"7620\",\"count\":1,\"chance\":\"700\"},{\"id\":\"2166\",\"count\":1,\"chance\":\"500\"},{\"id\":\"1949\",\"count\":1,\"chance\":\"18000\"},{\"id\":\"2401\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2642\",\"count\":1,\"chance\":\"8250\"}]'),
(260, 0, 'Monk', 600, 200, 240, 1, 1, '[\"Repent Heretic!\",\"A prayer to the almighty one!\",\"I will punish the sinners!\"]', '[\"invisible\"]', 1, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"24000\"},{\"id\":\"2689\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"1949\",\"count\":1,\"chance\":\"18000\"},{\"id\":\"2044\",\"count\":1,\"chance\":\"12000\"},{\"id\":\"2015\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2642\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2467\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2401\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2177\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2193\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2166\",\"count\":1,\"chance\":\"700\"}]'),
(261, 0, 'Trainer', 0, 0, 1000000, 1, 0, '[]', '[]', 0, 0, 'blood', '[]'),
(262, 0, 'Mutated Bat', 0, 615, 900, 13, 0, '[]', '[\"death\",\"earth\",\"drown\",\"invisible\",\"drunk\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"60\",\"chance\":\"43500\"},{\"id\":\"2148\",\"count\":\"51\",\"chance\":\"43500\"},{\"id\":\"5894\",\"count\":\"2\",\"chance\":\"4000\"},{\"id\":\"2513\",\"count\":1,\"chance\":\"7300\"},{\"id\":\"2144\",\"count\":\"3\",\"chance\":\"1000\"},{\"id\":\"2529\",\"count\":1,\"chance\":\"7300\"},{\"id\":\"2167\",\"count\":1,\"chance\":\"900\"},{\"id\":\"2800\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2800\",\"count\":1,\"chance\":\"7400\"},{\"id\":\"2800\",\"count\":1,\"chance\":\"7950\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2800\",\"count\":1,\"chance\":\"9900\"},{\"id\":\"2800\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2800\",\"count\":1,\"chance\":\"5200\"},{\"id\":\"7386\",\"count\":1,\"chance\":\"100\"},{\"id\":\"10016\",\"count\":1,\"chance\":\"100\"}]'),
(263, 0, 'Mutated Human', 0, 150, 240, 13, 0, '[\"Take that creature off my back!! I can fell it!\",\"HEEEEEEEELP!\",\"You will be the next infected one... GRAAAAAAAAARRR!\",\"Science... is a curse.\",\"Run as fast as you can.\",\"Oh by the gods! What is this... aaaaaargh!\"]', '[\"death\",\"earth\",\"paralyze\",\"lifedrain\",\"drunk\",\"drown\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"27000\"},{\"id\":\"2148\",\"count\":\"50\",\"chance\":\"27000\"},{\"id\":\"3976\",\"count\":\"3\",\"chance\":\"44000\"},{\"id\":\"2226\",\"count\":1,\"chance\":\"11000\"},{\"id\":\"2696\",\"count\":1,\"chance\":\"6500\"},{\"id\":\"2406\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2484\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2161\",\"count\":1,\"chance\":\"4600\"},{\"id\":\"2460\",\"count\":1,\"chance\":\"6825\"},{\"id\":\"2483\",\"count\":1,\"chance\":\"5900\"},{\"id\":\"2376\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"9808\",\"count\":1,\"chance\":\"2250\"},{\"id\":\"7910\",\"count\":1,\"chance\":\"600\"},{\"id\":\"2801\",\"count\":1,\"chance\":\"350\"},{\"id\":\"2170\",\"count\":1,\"chance\":\"100\"}]'),
(264, 0, 'Mutated Rat', 0, 450, 550, 13, 0, '[\"Grrrrrrrrrrrrrr!\",\"Fcccccchhhhhh\"]', '[\"death\",\"earth\",\"paralyze\",\"lifedrain\",\"drunk\",\"drown\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"65\",\"chance\":\"23000\"},{\"id\":\"2148\",\"count\":\"65\",\"chance\":\"23000\"},{\"id\":\"2320\",\"count\":1,\"chance\":\"18500\"},{\"id\":\"2235\",\"count\":1,\"chance\":\"11500\"},{\"id\":\"2799\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"2796\",\"count\":1,\"chance\":\"1300\"},{\"id\":\"2510\",\"count\":1,\"chance\":\"5500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2381\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2165\",\"count\":1,\"chance\":\"700\"},{\"id\":\"8900\",\"count\":1,\"chance\":\"325\"},{\"id\":\"7618\",\"count\":1,\"chance\":\"800\"},{\"id\":\"2528\",\"count\":1,\"chance\":\"150\"}]'),
(265, 0, 'Mutated Tiger', 0, 750, 1100, 13, 0, '[\"GRAAARRRRRR\",\"CHHHHHHHHHHH\"]', '[\"paralyze\",\"drunk\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"96\",\"chance\":\"20000\"},{\"id\":\"2671\",\"count\":\"2\",\"chance\":\"22500\"},{\"id\":\"2666\",\"count\":\"4\",\"chance\":\"15000\"},{\"id\":\"2509\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2168\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"7588\",\"count\":1,\"chance\":\"900\"},{\"id\":\"2515\",\"count\":1,\"chance\":\"500\"},{\"id\":\"7454\",\"count\":1,\"chance\":\"300\"},{\"id\":\"7436\",\"count\":1,\"chance\":\"200\"}]'),
(266, 0, 'Necromancer', 0, 580, 580, 1, 0, '[\"Your corpse will be mine!\",\"Taste the sweetness of death!\"]', '[\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"60\",\"chance\":\"8250\"},{\"id\":\"2148\",\"count\":\"30\",\"chance\":\"8250\"},{\"id\":\"2545\",\"count\":\"5\",\"chance\":\"4000\"},{\"id\":\"2406\",\"count\":1,\"chance\":\"14000\"},{\"id\":\"2483\",\"count\":1,\"chance\":\"10500\"},{\"id\":\"2796\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2423\",\"count\":1,\"chance\":\"1700\"},{\"id\":\"7589\",\"count\":1,\"chance\":\"1250\"},{\"id\":\"2663\",\"count\":1,\"chance\":\"375\"},{\"id\":\"2436\",\"count\":1,\"chance\":\"125\"},{\"id\":\"7456\",\"count\":1,\"chance\":\"50\"},{\"id\":\"8901\",\"count\":1,\"chance\":\"125\"},{\"id\":\"2195\",\"count\":1,\"chance\":\"275\"}]'),
(267, 0, 'Priestess', 0, 420, 390, 1, 0, '[\"Your energy is mine.\",\"Now, your life has come to an end, hahahha!\",\"Throw the soul on the altar!\"]', '[\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2529\",\"count\":1,\"chance\":\"500\"},{\"id\":\"1977\",\"count\":1,\"chance\":\"7150\"},{\"id\":\"2032\",\"count\":1,\"chance\":\"23200\"},{\"id\":\"2423\",\"count\":1,\"chance\":\"1700\"},{\"id\":\"2192\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"2125\",\"count\":1,\"chance\":\"400\"},{\"id\":\"2379\",\"count\":1,\"chance\":\"22750\"},{\"id\":\"2760\",\"count\":1,\"chance\":\"14250\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2183\",\"count\":1,\"chance\":\"1100\"},{\"id\":\"7620\",\"count\":1,\"chance\":\"1300\"},{\"id\":\"2803\",\"count\":1,\"chance\":\"6500\"},{\"id\":\"2674\",\"count\":\"2\",\"chance\":\"5000\"},{\"id\":\"2802\",\"count\":1,\"chance\":\"12500\"},{\"id\":\"2151\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2791\",\"count\":1,\"chance\":\"2600\"},{\"id\":\"2070\",\"count\":1,\"chance\":\"1800\"},{\"id\":\"2114\",\"count\":1,\"chance\":\"200\"}]'),
(268, 0, 'Orc Berserker', 590, 195, 210, 15, 1, '[\"KRAK ORRRRRRK!\"]', '[]', 1, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"15\",\"chance\":\"26000\"},{\"id\":\"2671\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2458\",\"count\":1,\"chance\":\"13500\"},{\"id\":\"2464\",\"count\":1,\"chance\":\"12500\"},{\"id\":\"2044\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2381\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"2378\",\"count\":1,\"chance\":\"5500\"},{\"id\":\"3965\",\"count\":\"2\",\"chance\":\"5000\"}]'),
(269, 0, 'Orc Leader', 640, 270, 450, 5, 0, '[\"Ulderek futgyr human!\"]', '[]', 1, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"35\",\"chance\":\"17000\"},{\"id\":\"2667\",\"count\":1,\"chance\":\"29000\"},{\"id\":\"2379\",\"count\":1,\"chance\":\"26500\"},{\"id\":\"2410\",\"count\":\"4\",\"chance\":\"6250\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"12500\"},{\"id\":\"2419\",\"count\":1,\"chance\":\"6700\"},{\"id\":\"1988\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2478\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"1250\"},{\"id\":\"7378\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2207\",\"count\":1,\"chance\":\"750\"},{\"id\":\"2647\",\"count\":1,\"chance\":\"800\"},{\"id\":\"2413\",\"count\":1,\"chance\":\"750\"},{\"id\":\"7618\",\"count\":1,\"chance\":\"400\"},{\"id\":\"2475\",\"count\":1,\"chance\":\"200\"}]'),
(270, 0, 'Orc Rider', 0, 110, 180, 60, 1, '[\"Grrrrrrr\",\"Orc arga Huummmak!\"]', '[]', 0, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"10\",\"chance\":\"16000\"},{\"id\":\"2666\",\"count\":\"3\",\"chance\":\"18000\"},{\"id\":\"2428\",\"count\":1,\"chance\":\"26250\"},{\"id\":\"1988\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2129\",\"count\":1,\"chance\":\"10500\"},{\"id\":\"2482\",\"count\":1,\"chance\":\"11000\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"2513\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2483\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2425\",\"count\":1,\"chance\":\"1000\"}]'),
(271, 0, 'Orc Shaman', 0, 110, 115, 1, 0, '[\"Huumans stinkk!\"]', '[\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"5\",\"chance\":\"61000\"},{\"id\":\"2686\",\"count\":\"2\",\"chance\":\"10000\"},{\"id\":\"2458\",\"count\":1,\"chance\":\"9500\"},{\"id\":\"2464\",\"count\":1,\"chance\":\"8000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2389\",\"count\":1,\"chance\":\"6350\"},{\"id\":\"1958\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"2188\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2401\",\"count\":1,\"chance\":\"3000\"}]'),
(272, 0, 'Orc Spearman', 310, 38, 105, 1, 0, '[\"Ugaar!\"]', '[]', 1, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"11\",\"chance\":\"22500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2420\",\"count\":1,\"chance\":\"17250\"},{\"id\":\"2666\",\"count\":1,\"chance\":\"30000\"},{\"id\":\"2389\",\"count\":1,\"chance\":\"12000\"},{\"id\":\"2482\",\"count\":1,\"chance\":\"12000\"},{\"id\":\"2468\",\"count\":1,\"chance\":\"12000\"},{\"id\":\"2220\",\"count\":1,\"chance\":\"7000\"}]'),
(273, 0, 'Orc Warlord', 0, 670, 950, 35, 0, '[\"Ranat Ulderek!\",\"Orc buta bana!\",\"Ikem rambo zambo!\",\"Futchi maruk buta!\"]', '[\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"50\",\"chance\":\"15000\"},{\"id\":\"2399\",\"count\":\"22\",\"chance\":\"4000\"},{\"id\":\"2667\",\"count\":\"2\",\"chance\":\"12500\"},{\"id\":\"2419\",\"count\":1,\"chance\":\"29500\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"9000\"},{\"id\":\"2428\",\"count\":1,\"chance\":\"17650\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"6000\"},{\"id\":\"2200\",\"count\":1,\"chance\":\"7500\"},{\"id\":\"2647\",\"count\":1,\"chance\":\"6000\"},{\"id\":\"3965\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2478\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"2465\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"2490\",\"count\":1,\"chance\":\"6500\"},{\"id\":\"2377\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2434\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2497\",\"count\":1,\"chance\":\"750\"},{\"id\":\"2165\",\"count\":1,\"chance\":\"900\"},{\"id\":\"7618\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"7395\",\"count\":1,\"chance\":\"100\"},{\"id\":\"2179\",\"count\":1,\"chance\":\"100\"},{\"id\":\"7891\",\"count\":1,\"chance\":\"100\"}]'),
(274, 0, 'Orc Warrior', 360, 50, 125, 1, 0, '[\"Grow truk grrrr.\",\"Trak grrrr brik.\",\"Alk!\"]', '[]', 1, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"15\",\"chance\":\"30000\"},{\"id\":\"2385\",\"count\":1,\"chance\":\"51850\"},{\"id\":\"2512\",\"count\":1,\"chance\":\"23333\"},{\"id\":\"2666\",\"count\":1,\"chance\":\"16000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2464\",\"count\":1,\"chance\":\"10750\"},{\"id\":\"2007\",\"count\":1,\"chance\":\"9750\"},{\"id\":\"2530\",\"count\":1,\"chance\":\"400\"},{\"id\":\"2448\",\"count\":1,\"chance\":\"400\"},{\"id\":\"2411\",\"count\":1,\"chance\":\"400\"}]'),
(275, 0, 'Orc', 300, 25, 70, 1, 0, '[\"Grak brrretz!\",\"Grow truk grrrrr.\",\"Prek tars, dekklep zurk.\"]', '[]', 1, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"15\",\"chance\":\"17500\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"22500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2484\",\"count\":1,\"chance\":\"15000\"},{\"id\":\"2482\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2526\",\"count\":1,\"chance\":\"1600\"},{\"id\":\"2385\",\"count\":1,\"chance\":\"17500\"},{\"id\":\"2386\",\"count\":1,\"chance\":\"18000\"}]'),
(276, 0, 'Assassin', 450, 105, 175, 2, 0, '[\"Die!\",\"Feel the hand of death!\",\"You are on my deathlist!\"]', '[\"invisible\"]', 0, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"30\",\"chance\":\"35000\"},{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"5000\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"22500\"},{\"id\":\"2148\",\"count\":\"14\",\"chance\":\"2750\"},{\"id\":\"7366\",\"count\":1,\"chance\":\"15500\"},{\"id\":\"2403\",\"count\":1,\"chance\":\"7500\"},{\"id\":\"2404\",\"count\":1,\"chance\":\"4750\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"22500\"},{\"id\":\"2457\",\"count\":1,\"chance\":\"4350\"},{\"id\":\"2510\",\"count\":1,\"chance\":\"1600\"},{\"id\":\"3968\",\"count\":1,\"chance\":\"400\"},{\"id\":\"2513\",\"count\":1,\"chance\":\"400\"},{\"id\":\"3969\",\"count\":1,\"chance\":\"100\"}]'),
(277, 0, 'Bandit', 450, 65, 245, 1, 0, '[\"Your money or your life!\",\"Hand me your purse!\"]', '[]', 1, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"28\",\"chance\":\"16000\"},{\"id\":\"2386\",\"count\":1,\"chance\":\"48000\"},{\"id\":\"2511\",\"count\":1,\"chance\":\"33700\"},{\"id\":\"2649\",\"count\":1,\"chance\":\"26000\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"9000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2398\",\"count\":1,\"chance\":\"11500\"},{\"id\":\"2458\",\"count\":1,\"chance\":\"8250\"},{\"id\":\"2465\",\"count\":1,\"chance\":\"2200\"},{\"id\":\"2509\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2459\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2391\",\"count\":1,\"chance\":\"750\"}]'),
(278, 0, 'Black Knight', 0, 1600, 1800, 115, 0, '[\"MINE!\",\"No prisoners!\",\"NO MERCY!\",\"By Bolg\'s Blood!\",\"You\'re no match for me!\"]', '[\"paralyze\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"16500\"},{\"id\":\"2148\",\"count\":\"44\",\"chance\":\"16500\"},{\"id\":\"2389\",\"count\":\"3\",\"chance\":\"12000\"},{\"id\":\"2691\",\"count\":\"2\",\"chance\":\"15000\"},{\"id\":\"2478\",\"count\":1,\"chance\":\"17500\"},{\"id\":\"2120\",\"count\":1,\"chance\":\"16500\"},{\"id\":\"2381\",\"count\":1,\"chance\":\"14500\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"7777\"},{\"id\":\"2457\",\"count\":1,\"chance\":\"7777\"},{\"id\":\"2377\",\"count\":1,\"chance\":\"5800\"},{\"id\":\"2475\",\"count\":1,\"chance\":\"6800\"},{\"id\":\"2417\",\"count\":1,\"chance\":\"3900\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2430\",\"count\":1,\"chance\":\"3900\"},{\"id\":\"2476\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2489\",\"count\":1,\"chance\":\"1428\"},{\"id\":\"2490\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2477\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2133\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2414\",\"count\":1,\"chance\":\"500\"},{\"id\":\"7895\",\"count\":1,\"chance\":\"375\"},{\"id\":\"2114\",\"count\":1,\"chance\":\"250\"},{\"id\":\"2195\",\"count\":1,\"chance\":\"200\"}]'),
(279, 0, 'Crazed Beggar', 300, 35, 100, 1, 0, '[\"Hehehe!\",\"Raahhh!\",\"You are one of THEM! Die!\",\"Wanna buy roses??\"]', '[]', 1, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"9\",\"chance\":\"50000\"},{\"id\":\"2237\",\"count\":1,\"chance\":\"55000\"},{\"id\":\"2690\",\"count\":1,\"chance\":\"22500\"},{\"id\":\"2666\",\"count\":1,\"chance\":\"12000\"},{\"id\":\"2567\",\"count\":1,\"chance\":\"9750\"},{\"id\":\"2556\",\"count\":1,\"chance\":\"6500\"},{\"id\":\"2570\",\"count\":1,\"chance\":\"4850\"},{\"id\":\"2744\",\"count\":1,\"chance\":\"4800\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"1681\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"5553\",\"count\":1,\"chance\":\"850\"},{\"id\":\"2802\",\"count\":1,\"chance\":\"800\"},{\"id\":\"9808\",\"count\":1,\"chance\":\"750\"},{\"id\":\"2213\",\"count\":1,\"chance\":\"200\"},{\"id\":\"2072\",\"count\":1,\"chance\":\"7500\"}]'),
(280, 0, 'Gang Member', 420, 70, 295, 1, 0, '[\"This is our territory!\",\"Help me guys!\",\"I don\'t like the way you look!\",\"You\'re wearing the wrong colours!\"]', '[]', 1, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"23\",\"chance\":\"22500\"},{\"id\":\"2666\",\"count\":1,\"chance\":\"20450\"},{\"id\":\"2389\",\"count\":1,\"chance\":\"20500\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"2649\",\"count\":1,\"chance\":\"2270\"},{\"id\":\"2468\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"1980\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2689\",\"count\":1,\"chance\":\"7500\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"2209\",\"count\":1,\"chance\":\"1000\"}]'),
(281, 0, 'Gladiator', 470, 90, 185, 1, 1, '[\"You are no match for me!\",\"Feel my prowess\",\"Fight!\",\"Take this!\"]', '[]', 0, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"31750\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"10000\"},{\"id\":\"2510\",\"count\":1,\"chance\":\"9500\"},{\"id\":\"2376\",\"count\":1,\"chance\":\"9500\"},{\"id\":\"2398\",\"count\":1,\"chance\":\"9500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2465\",\"count\":1,\"chance\":\"4750\"},{\"id\":\"2458\",\"count\":1,\"chance\":\"2400\"},{\"id\":\"2509\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"8872\",\"count\":1,\"chance\":\"750\"},{\"id\":\"2459\",\"count\":1,\"chance\":\"900\"}]'),
(282, 0, 'Hero', 0, 1200, 1400, 24, 0, '[\"Let\'s have a fight!\",\"Welcome to my battleground.\",\"Have you seen princess Lumelia?\",\"I will sing a tune at your grave.\"]', '[\"paralyze\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"55\",\"chance\":\"42500\"},{\"id\":\"2148\",\"count\":\"45\",\"chance\":\"42500\"},{\"id\":\"2544\",\"count\":\"15\",\"chance\":\"21000\"},{\"id\":\"2120\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"1949\",\"count\":1,\"chance\":\"50000\"},{\"id\":\"2071\",\"count\":1,\"chance\":\"25000\"},{\"id\":\"2652\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"2456\",\"count\":1,\"chance\":\"12500\"},{\"id\":\"2661\",\"count\":1,\"chance\":\"9750\"},{\"id\":\"2666\",\"count\":\"3\",\"chance\":\"17500\"},{\"id\":\"2681\",\"count\":1,\"chance\":\"17500\"},{\"id\":\"2744\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2121\",\"count\":1,\"chance\":\"6775\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2377\",\"count\":1,\"chance\":\"7550\"},{\"id\":\"7364\",\"count\":\"6\",\"chance\":\"2000\"},{\"id\":\"2391\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"5911\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2487\",\"count\":1,\"chance\":\"900\"},{\"id\":\"2519\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2491\",\"count\":1,\"chance\":\"1250\"},{\"id\":\"2392\",\"count\":1,\"chance\":\"750\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"875\"},{\"id\":\"2114\",\"count\":1,\"chance\":\"200\"},{\"id\":\"2164\",\"count\":1,\"chance\":\"175\"},{\"id\":\"2488\",\"count\":1,\"chance\":\"400\"}]'),
(283, 0, 'Hunter', 0, 150, 150, 1, 0, '[\"Guess who we\'re hunting, haha!\",\"Guess who we are hunting!\",\"Bullseye!\",\"You\'ll make a nice trophy!\"]', '[]', 0, 0, 'blood', '[{\"id\":\"2545\",\"count\":\"2\",\"chance\":\"12500\"},{\"id\":\"2544\",\"count\":\"24\",\"chance\":\"9000\"},{\"id\":\"2675\",\"count\":\"2\",\"chance\":\"22500\"},{\"id\":\"2690\",\"count\":\"2\",\"chance\":\"7975\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2465\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"2461\",\"count\":1,\"chance\":\"12500\"},{\"id\":\"2649\",\"count\":1,\"chance\":\"11750\"},{\"id\":\"2456\",\"count\":1,\"chance\":\"30000\"},{\"id\":\"2460\",\"count\":1,\"chance\":\"8750\"},{\"id\":\"2201\",\"count\":1,\"chance\":\"900\"},{\"id\":\"2546\",\"count\":\"3\",\"chance\":\"2000\"},{\"id\":\"7394\",\"count\":1,\"chance\":\"300\"},{\"id\":\"7400\",\"count\":1,\"chance\":\"300\"},{\"id\":\"5875\",\"count\":1,\"chance\":\"250\"}]'),
(284, 0, 'Nomad', 420, 60, 160, 1, 0, '[\"We are the true sons of the desert!\",\"I will leave your remains to the vultures!\",\"We are swift as the wind of the desert!\"]', '[]', 1, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"51\",\"chance\":\"16250\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"22500\"},{\"id\":\"2386\",\"count\":1,\"chance\":\"28000\"},{\"id\":\"2511\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2649\",\"count\":1,\"chance\":\"13750\"},{\"id\":\"2398\",\"count\":1,\"chance\":\"12500\"},{\"id\":\"2458\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2465\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2509\",\"count\":1,\"chance\":\"750\"},{\"id\":\"2459\",\"count\":1,\"chance\":\"450\"}]'),
(285, 0, 'Poacher', 530, 70, 90, 1, 0, '[\"You will not live to tell anyone!\",\"You are my game today!\",\"Look what has stepped into my trap!\"]', '[]', 0, 1, 'blood', '[{\"id\":\"2649\",\"count\":1,\"chance\":\"40000\"},{\"id\":\"2461\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2690\",\"count\":\"2\",\"chance\":\"20000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2456\",\"count\":1,\"chance\":\"6000\"},{\"id\":\"2544\",\"count\":\"17\",\"chance\":\"23500\"},{\"id\":\"2545\",\"count\":\"3\",\"chance\":\"10000\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"15000\"},{\"id\":\"2578\",\"count\":1,\"chance\":\"3000\"}]'),
(286, 0, 'Primitive', 0, 45, 200, 40, 0, '[\"We don\'t need a future!\",\"I\'ll rook you all!\",\"They thought they\'d beaten us!\",\"You are history!\",\"There can only be one world!\",\"Valor who?\",\"Die noob!\",\"There are no dragons!\",\"I\'ll quit forever! Again ...\",\"You all are noobs!\",\"Beware of the cyclops!\",\"Just had a disconnect.\",\"Magic is only good for girls!\",\"We\'ll be back!\"]', '[\"energy\",\"fire\",\"drunk\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"10\",\"chance\":\"12500\"},{\"id\":\"2526\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"2482\",\"count\":1,\"chance\":\"9500\"},{\"id\":\"2484\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"2386\",\"count\":1,\"chance\":\"12250\"},{\"id\":\"2385\",\"count\":1,\"chance\":\"10250\"},{\"id\":\"6570\",\"count\":1,\"chance\":\"500\"},{\"id\":\"6571\",\"count\":1,\"chance\":\"500\"}]'),
(287, 0, 'Smuggler', 390, 48, 130, 1, 0, '[\"I will silence you forever!\",\"You saw something you shouldn\'t!\"]', '[]', 1, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"10\",\"chance\":\"43000\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"50000\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"22500\"},{\"id\":\"2649\",\"count\":1,\"chance\":\"17650\"},{\"id\":\"2403\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2671\",\"count\":\"2\",\"chance\":\"6000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2406\",\"count\":1,\"chance\":\"8000\"},{\"id\":\"2461\",\"count\":1,\"chance\":\"7850\"},{\"id\":\"2404\",\"count\":1,\"chance\":\"4400\"},{\"id\":\"2376\",\"count\":1,\"chance\":\"5650\"},{\"id\":\"7397\",\"count\":1,\"chance\":\"500\"}]'),
(288, 0, 'Stalker', 0, 90, 150, 1, 0, '[]', '[\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"8\",\"chance\":\"5000\"},{\"id\":\"2410\",\"count\":\"2\",\"chance\":\"3000\"},{\"id\":\"2649\",\"count\":1,\"chance\":\"9500\"},{\"id\":\"2478\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"6000\"},{\"id\":\"1988\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2412\",\"count\":1,\"chance\":\"5500\"},{\"id\":\"2425\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2165\",\"count\":1,\"chance\":\"300\"}]'),
(289, 0, 'Wild Warrior', 420, 55, 120, 1, 1, '[\"An enemy!\",\"Gimme your money!\"]', '[]', 1, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"30\",\"chance\":\"16750\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"20000\"},{\"id\":\"2649\",\"count\":1,\"chance\":\"27500\"},{\"id\":\"2110\",\"count\":1,\"chance\":\"2650\"},{\"id\":\"2465\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2509\",\"count\":1,\"chance\":\"2650\"},{\"id\":\"2386\",\"count\":1,\"chance\":\"23750\"},{\"id\":\"2458\",\"count\":1,\"chance\":\"2650\"},{\"id\":\"2511\",\"count\":1,\"chance\":\"17000\"},{\"id\":\"2459\",\"count\":1,\"chance\":\"250\"},{\"id\":\"2391\",\"count\":1,\"chance\":\"100\"}]'),
(290, 0, 'Ashmunrah', 0, 3100, 5000, 50, 0, '[\"No mortal or undead will steal my secrets!\",\"Ahhhh all those long years.\"]', '[\"lifedrain\",\"paralyze\",\"invisible\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"60\",\"chance\":\"50000\"},{\"id\":\"2134\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7590\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2164\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2487\",\"count\":1,\"chance\":\"80000\"},{\"id\":\"2140\",\"count\":1,\"chance\":\"400\"}]'),
(291, 0, 'Dipthrah', 0, 2900, 4200, 50, 0, '[\"Come closer to learn the final lesson.\",\"You can\'t escape death forever.\"]', '[\"invisible\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"50000\"},{\"id\":\"7590\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"2167\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2178\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2193\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2436\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2446\",\"count\":1,\"chance\":\"300\"},{\"id\":\"2354\",\"count\":1,\"chance\":\"100000\"}]'),
(292, 0, 'Mahrdis', 0, 3050, 3900, 60, 0, '[\"Ashes to ashes!\",\"Fire, Fire!\",\"The eternal flame demands its due!\",\"This is why I\'m hot.\",\"May my flames engulf you!\"]', '[\"invisible\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"64\",\"chance\":\"50000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2168\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2432\",\"count\":1,\"chance\":\"750\"},{\"id\":\"2141\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2539\",\"count\":1,\"chance\":\"300\"},{\"id\":\"2353\",\"count\":1,\"chance\":\"100000\"}]'),
(293, 0, 'Morguthis', 0, 3000, 4800, 50, 1, '[\"Vengeance!\",\"You will make a fine trophy.\",\"Come and fight me, cowards!\",\"I am the supreme warrior!\",\"Let me hear the music of battle.\",\"Anotherone to bite the dust!\"]', '[\"paralyze\",\"invisible\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"73\",\"chance\":\"50000\"},{\"id\":\"2197\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"2430\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"2144\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2136\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2443\",\"count\":1,\"chance\":\"300\"},{\"id\":\"7368\",\"count\":\"3\",\"chance\":\"500\"},{\"id\":\"2645\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2350\",\"count\":1,\"chance\":\"100000\"}]'),
(294, 0, 'Omruc', 0, 2950, 4300, 75, 0, '[\"Now chhhou shhhee me ... Now chhhou don\'t!!\",\"Chhhhou are marked ashhh my prey.\",\"Psssst, I am over chhhere.\"]', '[\"paralyze\",\"invisible\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"50000\"},{\"id\":\"2443\",\"count\":\"2\",\"chance\":\"10000\"},{\"id\":\"2544\",\"count\":\"21\",\"chance\":\"10000\"},{\"id\":\"2545\",\"count\":\"20\",\"chance\":\"10000\"},{\"id\":\"2546\",\"count\":\"15\",\"chance\":\"10000\"},{\"id\":\"7365\",\"count\":\"2\",\"chance\":\"10000\"},{\"id\":\"2547\",\"count\":\"3\",\"chance\":\"10000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"2165\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2195\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2444\",\"count\":1,\"chance\":\"300\"},{\"id\":\"2352\",\"count\":1,\"chance\":\"100000\"}]'),
(295, 0, 'Rahemos', 0, 3100, 3700, 50, 0, '[\"It\'s a kind of magic.\",\"Abrah Kadabrah!\",\"Nothing hidden in my wrappings.\",\"It\'s not a trick, it\'s Rahemos.\",\"Meet my friend from hell.\",\"I will make you believe in magic.\"]', '[\"paralyze\",\"invisible\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"60\",\"chance\":\"50000\"},{\"id\":\"2214\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"7590\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2662\",\"count\":1,\"chance\":\"300\"},{\"id\":\"2176\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2185\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2447\",\"count\":1,\"chance\":\"200\"},{\"id\":\"2348\",\"count\":1,\"chance\":\"100000\"}]'),
(296, 0, 'Thalas', 0, 2950, 4100, 50, 0, '[\"You will become a feast for my maggots.\"]', '[\"invisible\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"50000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2411\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"2169\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"2165\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2409\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2451\",\"count\":1,\"chance\":\"200\"},{\"id\":\"2351\",\"count\":1,\"chance\":\"100000\"}]'),
(297, 0, 'Vashresamun', 0, 2950, 4000, 60, 1, '[\"Come my maidens, we have visitors!\",\"Are you enjoying my music?\",\"If music is the food of death, drop dead.\"]', '[\"invisible\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"65\",\"chance\":\"50000\"},{\"id\":\"2143\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"2072\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"7691\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2074\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2445\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2139\",\"count\":1,\"chance\":\"300\"},{\"id\":\"2349\",\"count\":1,\"chance\":\"100000\"}]'),
(298, 0, 'Pirate Buccaneer', 595, 250, 425, 5, 0, '[\"Give up!\",\"Hiyaa\",\"Plundeeeeer!\"]', '[\"invisible\"]', 1, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"59\",\"chance\":\"26500\"},{\"id\":\"2410\",\"count\":\"6\",\"chance\":\"4000\"},{\"id\":\"2385\",\"count\":1,\"chance\":\"10750\"},{\"id\":\"2238\",\"count\":1,\"chance\":\"9750\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"8800\"},{\"id\":\"2376\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2513\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"5091\",\"count\":1,\"chance\":\"1100\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"6095\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"950\"},{\"id\":\"6126\",\"count\":1,\"chance\":\"600\"},{\"id\":\"6098\",\"count\":1,\"chance\":\"600\"},{\"id\":\"7588\",\"count\":1,\"chance\":\"500\"},{\"id\":\"6097\",\"count\":1,\"chance\":\"600\"},{\"id\":\"5926\",\"count\":1,\"chance\":\"500\"},{\"id\":\"5792\",\"count\":1,\"chance\":\"50\"}]'),
(299, 0, 'Pirate Corsair', 775, 350, 675, 5, 0, '[\"Give up!\",\"Hiyaa!\",\"Plundeeeeer!\"]', '[\"invisible\"]', 0, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"74\",\"chance\":\"40000\"},{\"id\":\"2489\",\"count\":1,\"chance\":\"3650\"},{\"id\":\"2385\",\"count\":1,\"chance\":\"14500\"},{\"id\":\"2376\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2521\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2399\",\"count\":\"12\",\"chance\":\"6000\"},{\"id\":\"5091\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"5926\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"6097\",\"count\":1,\"chance\":\"600\"},{\"id\":\"6126\",\"count\":1,\"chance\":\"600\"},{\"id\":\"6098\",\"count\":1,\"chance\":\"600\"},{\"id\":\"7588\",\"count\":1,\"chance\":\"500\"},{\"id\":\"5813\",\"count\":1,\"chance\":\"800\"},{\"id\":\"6096\",\"count\":1,\"chance\":\"750\"},{\"id\":\"5462\",\"count\":1,\"chance\":\"250\"},{\"id\":\"2114\",\"count\":1,\"chance\":\"100\"}]'),
(300, 0, 'Pirate Cutthroat', 495, 175, 325, 5, 0, '[\"Give up!\",\"Hiyaa!\",\"Plundeeeeer!\"]', '[\"invisible\"]', 0, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"48\",\"chance\":\"15000\"},{\"id\":\"2376\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2483\",\"count\":1,\"chance\":\"2600\"},{\"id\":\"2509\",\"count\":1,\"chance\":\"3300\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"6126\",\"count\":1,\"chance\":\"600\"},{\"id\":\"6097\",\"count\":1,\"chance\":\"600\"},{\"id\":\"6098\",\"count\":1,\"chance\":\"600\"},{\"id\":\"5792\",\"count\":1,\"chance\":\"50\"},{\"id\":\"5918\",\"count\":1,\"chance\":\"1250\"},{\"id\":\"5553\",\"count\":1,\"chance\":\"120\"},{\"id\":\"5710\",\"count\":1,\"chance\":\"200\"},{\"id\":\"5091\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"5927\",\"count\":1,\"chance\":\"1000\"}]'),
(301, 0, 'Pirate Ghost', 0, 250, 275, 5, 0, '[\"Yooh Ho Hooh Ho!\",\"Hell is waiting for You!\",\"It\'s alive!\",\"The curse! Aww the curse!\",\"You will not get my treasure!\"]', '[\"paralyze\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"69\",\"chance\":\"18000\"},{\"id\":\"2237\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"2236\",\"count\":1,\"chance\":\"6000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2165\",\"count\":1,\"chance\":\"800\"},{\"id\":\"1951\",\"count\":1,\"chance\":\"1250\"},{\"id\":\"2383\",\"count\":1,\"chance\":\"600\"},{\"id\":\"2655\",\"count\":1,\"chance\":\"400\"}]'),
(302, 0, 'Pirate Marauder', 490, 125, 210, 5, 0, '[\"Plundeeeeer!\",\"Give up!\",\"Hiyaa!\"]', '[\"invisible\"]', 0, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"60\",\"chance\":\"20000\"},{\"id\":\"2376\",\"count\":1,\"chance\":\"9750\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"9250\"},{\"id\":\"2389\",\"count\":\"2\",\"chance\":\"4000\"},{\"id\":\"2510\",\"count\":1,\"chance\":\"4800\"},{\"id\":\"2464\",\"count\":1,\"chance\":\"2750\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"5091\",\"count\":1,\"chance\":\"1125\"},{\"id\":\"5917\",\"count\":1,\"chance\":\"1100\"},{\"id\":\"6126\",\"count\":1,\"chance\":\"600\"},{\"id\":\"6097\",\"count\":1,\"chance\":\"600\"},{\"id\":\"6098\",\"count\":1,\"chance\":\"600\"},{\"id\":\"5553\",\"count\":1,\"chance\":\"100\"},{\"id\":\"5928\",\"count\":1,\"chance\":\"200\"},{\"id\":\"5792\",\"count\":1,\"chance\":\"50\"},{\"id\":\"5927\",\"count\":1,\"chance\":\"500\"}]'),
(303, 0, 'Pirate Skeleton', 0, 85, 190, 5, 0, '[]', '[]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"35\",\"chance\":\"23000\"},{\"id\":\"2231\",\"count\":1,\"chance\":\"11500\"},{\"id\":\"2230\",\"count\":1,\"chance\":\"6000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2406\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"2376\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"2449\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"2229\",\"count\":\"2\",\"chance\":\"2000\"}]'),
(304, 0, 'Blazing Fire Elemental', 0, 580, 580, 1, 0, '[]', '[\"fire\"]', 0, 0, 'fire', '[{\"id\":\"2148\",\"count\":\"40\",\"chance\":\"10000\"},{\"id\":\"7840\",\"count\":\"4\",\"chance\":\"5000\"},{\"id\":\"8299\",\"count\":1,\"chance\":\"2500\"}]'),
(305, 0, 'Blistering Fire Elemental', 0, 1300, 1500, 5, 0, '[]', '[\"fire\"]', 0, 0, 'fire', '[{\"id\":\"2148\",\"count\":\"65\",\"chance\":\"12500\"},{\"id\":\"2148\",\"count\":\"60\",\"chance\":\"12500\"},{\"id\":\"8299\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"8921\",\"count\":1,\"chance\":\"1250\"}]'),
(306, 0, 'Fire Elemental', 690, 220, 280, 1, 0, '[]', '[\"paralyze\",\"invisible\"]', 1, 1, 'fire', '[]'),
(307, 0, 'Fire Overlord', 0, 2800, 4000, 40, 0, '[]', '[\"fire\",\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'fire', '[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"10000\"},{\"id\":\"2152\",\"count\":\"3\",\"chance\":\"1000\"},{\"id\":\"8877\",\"count\":1,\"chance\":\"900\"},{\"id\":\"7899\",\"count\":1,\"chance\":\"1250\"},{\"id\":\"8304\",\"count\":1,\"chance\":\"100000\"}]'),
(308, 0, 'Hellfire Fighter', 0, 3900, 3800, 20, 0, '[]', '[\"paralyze\",\"invisible\"]', 0, 0, 'fire', '[{\"id\":\"2148\",\"count\":\"85\",\"chance\":\"61000\"},{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"61000\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"52000\"},{\"id\":\"2239\",\"count\":1,\"chance\":\"47000\"},{\"id\":\"6500\",\"count\":1,\"chance\":\"14500\"},{\"id\":\"2392\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7894\",\"count\":1,\"chance\":\"850\"},{\"id\":\"7899\",\"count\":1,\"chance\":\"1300\"},{\"id\":\"5022\",\"count\":\"2\",\"chance\":\"4000\"},{\"id\":\"2152\",\"count\":1,\"chance\":\"850\"},{\"id\":\"5944\",\"count\":1,\"chance\":\"14850\"},{\"id\":\"2187\",\"count\":1,\"chance\":\"8000\"},{\"id\":\"2432\",\"count\":1,\"chance\":\"800\"},{\"id\":\"2136\",\"count\":1,\"chance\":\"300\"}]'),
(309, 0, 'Massive Fire Elemental', 0, 950, 1800, 20, 0, '[]', '[\"fire\",\"lifedrain\",\"paralyze\",\"invisible\"]', 0, 0, 'fire', '[]'),
(310, 0, 'Quara Constrictor', 670, 250, 450, 150, 0, '[\"Gaaahhh!\",\"Gluh! Gluh!\",\"Tssss!\",\"Boohaa!\"]', '[\"lifedrain\",\"paralyze\",\"drown\"]', 0, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"48\",\"chance\":\"34000\"},{\"id\":\"2148\",\"count\":\"45\",\"chance\":\"34000\"},{\"id\":\"2406\",\"count\":1,\"chance\":\"7200\"},{\"id\":\"2465\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2460\",\"count\":1,\"chance\":\"7500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2397\",\"count\":1,\"chance\":\"4600\"},{\"id\":\"2670\",\"count\":\"5\",\"chance\":\"1000\"},{\"id\":\"5895\",\"count\":1,\"chance\":\"2000\"}]'),
(311, 0, 'Quara Constrictor Scout', 670, 250, 450, 35, 0, '[]', '[\"fire\",\"ice\"]', 0, 1, 'undead', '[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"34000\"},{\"id\":\"2397\",\"count\":1,\"chance\":\"4600\"},{\"id\":\"2460\",\"count\":1,\"chance\":\"7500\"},{\"id\":\"2465\",\"count\":1,\"chance\":\"7500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"5895\",\"count\":1,\"chance\":\"2000\"}]'),
(312, 0, 'Quara Hydromancer', 0, 800, 1100, 150, 0, '[\"Qua hah tsh!\",\"Teech tsha tshul!\",\"Quara tsha Fach!\",\"Tssssha Quara!\",\"Blubber.\",\"Blup.\"]', '[\"lifedrain\",\"paralyze\",\"invisible\",\"drown\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"50\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"40\",\"chance\":\"100000\"},{\"id\":\"2401\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"2240\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2670\",\"count\":\"5\",\"chance\":\"20000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2143\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"2144\",\"count\":1,\"chance\":\"1429\"},{\"id\":\"2189\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"2214\",\"count\":1,\"chance\":\"1538\"},{\"id\":\"5895\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"7590\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"2476\",\"count\":1,\"chance\":\"500\"}]'),
(313, 0, 'Quara Hydromancer Scout', 0, 800, 1100, 30, 0, '[\"Qua hah tsh!\"]', '[\"ice\",\"fire\",\"lifedrain\",\"paralyze\",\"invisible\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"50\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"30\",\"chance\":\"100000\"},{\"id\":\"2240\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2401\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2144\",\"count\":1,\"chance\":\"1429\"},{\"id\":\"2143\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"2189\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"2214\",\"count\":1,\"chance\":\"1538\"},{\"id\":\"5895\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2476\",\"count\":1,\"chance\":\"500\"}]'),
(314, 0, 'Quara Mantassin', 480, 400, 800, 150, 0, '[\"Zuerk Pachak!\",\"Shrrrr\"]', '[\"lifedrain\",\"drown\"]', 0, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"27000\"},{\"id\":\"2148\",\"count\":\"60\",\"chance\":\"27000\"},{\"id\":\"2377\",\"count\":1,\"chance\":\"12950\"},{\"id\":\"2229\",\"count\":1,\"chance\":\"11800\"},{\"id\":\"2654\",\"count\":1,\"chance\":\"8750\"},{\"id\":\"2670\",\"count\":\"5\",\"chance\":\"1300\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2381\",\"count\":1,\"chance\":\"4800\"},{\"id\":\"5895\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"2165\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2479\",\"count\":1,\"chance\":\"300\"}]'),
(315, 0, 'Quara Mantassin Scout', 480, 100, 220, 25, 0, '[\"Zuerk Pachak!\",\"Shrrrr\"]', '[\"ice\",\"fire\",\"lifedrain\",\"paralyze\",\"invisible\"]', 0, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"29\",\"chance\":\"27000\"},{\"id\":\"2229\",\"count\":1,\"chance\":\"11800\"},{\"id\":\"2464\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2654\",\"count\":1,\"chance\":\"8750\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2377\",\"count\":1,\"chance\":\"12950\"},{\"id\":\"5895\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"2165\",\"count\":1,\"chance\":\"2000\"}]'),
(316, 0, 'Quara Pincher', 0, 1200, 1800, 160, 0, '[\"Clank clank!\",\"Clap!\",\"Crrrk! Crrrk!\"]', '[\"lifedrain\",\"invisible\",\"drown\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"65\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"55\",\"chance\":\"100000\"},{\"id\":\"2398\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2394\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2381\",\"count\":1,\"chance\":\"2222\"},{\"id\":\"2670\",\"count\":\"5\",\"chance\":\"20000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"5895\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2475\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"7897\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"2487\",\"count\":1,\"chance\":\"500\"}]'),
(317, 0, 'Quara Pincher Scout', 0, 600, 775, 15, 0, '[\"Clank clank!\",\"Clap!\"]', '[\"fire\",\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"49\",\"chance\":\"100000\"},{\"id\":\"2398\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2394\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2381\",\"count\":1,\"chance\":\"2222\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2177\",\"count\":1,\"chance\":\"1538\"},{\"id\":\"5895\",\"count\":1,\"chance\":\"2000\"}]'),
(318, 0, 'Quara Predator', 0, 1600, 2200, 150, 1, '[\"Rrrah!\",\"Rraaar!\"]', '[\"lifedrain\",\"invisible\",\"drown\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"60\",\"chance\":\"100000\"},{\"id\":\"7378\",\"count\":\"7\",\"chance\":\"100000\"},{\"id\":\"2226\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2473\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2670\",\"count\":\"5\",\"chance\":\"20000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"5895\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"5741\",\"count\":1,\"chance\":\"956\"},{\"id\":\"7368\",\"count\":\"2\",\"chance\":\"956\"},{\"id\":\"7383\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"7897\",\"count\":1,\"chance\":\"800\"}]'),
(319, 0, 'Quara Predator Scout', 0, 400, 890, 35, 0, '[\"Gnarrr!\"]', '[\"ice\",\"fire\",\"lifedrain\",\"paralyze\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"37\",\"chance\":\"100000\"},{\"id\":\"2226\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2473\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2483\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2177\",\"count\":1,\"chance\":\"1429\"},{\"id\":\"5895\",\"count\":1,\"chance\":\"2000\"}]'),
(320, 0, 'Cave Rat', 250, 10, 30, 1, 0, '[\"Meeeeep!\",\"Meep!\"]', '[]', 1, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"3\",\"chance\":\"43000\"},{\"id\":\"3976\",\"count\":\"3\",\"chance\":\"35000\"},{\"id\":\"2696\",\"count\":1,\"chance\":\"32000\"},{\"id\":\"2687\",\"count\":1,\"chance\":\"1000\"}]'),
(321, 0, 'Rat', 200, 5, 20, 1, 0, '[\"Meep!\"]', '[]', 1, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"5\",\"chance\":\"35000\"},{\"id\":\"3976\",\"count\":\"3\",\"chance\":\"35000\"},{\"id\":\"2696\",\"count\":1,\"chance\":\"36750\"},{\"id\":\"2687\",\"count\":\"2\",\"chance\":\"750\"}]'),
(322, 0, 'Crocodile', 350, 40, 105, 10, 0, '[]', '[]', 1, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"15\",\"chance\":\"17500\"},{\"id\":\"2467\",\"count\":1,\"chance\":\"7450\"},{\"id\":\"2671\",\"count\":\"2\",\"chance\":\"15000\"},{\"id\":\"2666\",\"count\":\"4\",\"chance\":\"20000\"},{\"id\":\"2649\",\"count\":1,\"chance\":\"8250\"},{\"id\":\"3982\",\"count\":1,\"chance\":\"400\"}]');
INSERT INTO `myaac_monsters` (`id`, `hidden`, `name`, `mana`, `exp`, `health`, `speed_lvl`, `use_haste`, `voices`, `immunities`, `summonable`, `convinceable`, `race`, `loot`) VALUES
(323, 0, 'Hydra', 0, 2100, 2350, 20, 0, '[\"FCHHHHH\",\"HISSSS\"]', '[\"lifedrain\",\"paralyze\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"24000\"},{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"24000\"},{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"24000\"},{\"id\":\"2666\",\"count\":\"4\",\"chance\":\"37500\"},{\"id\":\"2671\",\"count\":\"4\",\"chance\":\"25000\"},{\"id\":\"7589\",\"count\":1,\"chance\":\"200\"},{\"id\":\"2177\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2197\",\"count\":1,\"chance\":\"900\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"4850\",\"count\":1,\"chance\":\"600\"},{\"id\":\"2214\",\"count\":1,\"chance\":\"1050\"},{\"id\":\"2475\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2476\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"2536\",\"count\":1,\"chance\":\"200\"},{\"id\":\"2498\",\"count\":1,\"chance\":\"200\"},{\"id\":\"2195\",\"count\":1,\"chance\":\"120\"}]'),
(324, 0, 'Rift Worm', 0, 1195, 2800, 1, 0, '[]', '[\"invisible\"]', 0, 0, 'blood', '[]'),
(325, 0, 'Rift Scythe', 0, 2000, 3600, 75, 0, '[]', '[\"lifedrain\",\"paralyze\",\"invisible\"]', 0, 0, 'undead', '[]'),
(326, 0, 'Rift Brood', 0, 1600, 3000, 40, 0, '[]', '[\"ice\",\"fire\",\"invisible\"]', 0, 0, 'energy', '[]'),
(327, 0, 'Cobra', 275, 30, 65, 1, 0, '[\"Zzzzzz\",\"Fsssss\"]', '[\"drunk\"]', 1, 1, 'blood', '[]'),
(328, 0, 'Sea Serpent', 390, 2300, 3200, 219, 0, '[\"CHHHRRRR\",\"HISSSS\"]', '[\"ice\",\"paralyze\",\"invisible\",\"drown\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"31000\"},{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"31000\"},{\"id\":\"2148\",\"count\":\"75\",\"chance\":\"31000\"},{\"id\":\"2672\",\"count\":\"3\",\"chance\":\"35000\"},{\"id\":\"2473\",\"count\":1,\"chance\":\"26000\"},{\"id\":\"2376\",\"count\":1,\"chance\":\"16000\"},{\"id\":\"2647\",\"count\":1,\"chance\":\"11350\"},{\"id\":\"7588\",\"count\":1,\"chance\":\"5500\"},{\"id\":\"7589\",\"count\":1,\"chance\":\"3850\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2409\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"7590\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"8870\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"2214\",\"count\":1,\"chance\":\"1100\"},{\"id\":\"8911\",\"count\":1,\"chance\":\"1100\"},{\"id\":\"7888\",\"count\":1,\"chance\":\"800\"},{\"id\":\"2165\",\"count\":1,\"chance\":\"400\"},{\"id\":\"7896\",\"count\":1,\"chance\":\"350\"},{\"id\":\"8871\",\"count\":1,\"chance\":\"350\"},{\"id\":\"8884\",\"count\":1,\"chance\":\"200\"},{\"id\":\"8878\",\"count\":1,\"chance\":\"50\"}]'),
(329, 0, 'Serpent Spawn', 0, 2350, 3000, 10, 1, '[\"Sssssouls for the one\",\"HISSSS\",\"Tsssse one will risssse again\",\"I bring your deathhh, mortalssss\"]', '[\"paralyze\",\"invisible\"]', 0, 0, 'venom', '[{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"40500\"},{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"40500\"},{\"id\":\"2148\",\"count\":\"69\",\"chance\":\"40500\"},{\"id\":\"1976\",\"count\":1,\"chance\":\"8888\"},{\"id\":\"3971\",\"count\":1,\"chance\":\"2200\"},{\"id\":\"2487\",\"count\":1,\"chance\":\"600\"},{\"id\":\"2167\",\"count\":1,\"chance\":\"6250\"},{\"id\":\"2033\",\"count\":1,\"chance\":\"2870\"},{\"id\":\"7590\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2796\",\"count\":1,\"chance\":\"18200\"},{\"id\":\"2177\",\"count\":1,\"chance\":\"650\"},{\"id\":\"2168\",\"count\":1,\"chance\":\"5750\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7386\",\"count\":1,\"chance\":\"2070\"},{\"id\":\"7456\",\"count\":1,\"chance\":\"750\"},{\"id\":\"2148\",\"count\":\"3\",\"chance\":\"1000\"},{\"id\":\"2547\",\"count\":1,\"chance\":\"6500\"},{\"id\":\"2498\",\"count\":1,\"chance\":\"100\"},{\"id\":\"2182\",\"count\":1,\"chance\":\"880\"},{\"id\":\"8902\",\"count\":1,\"chance\":\"130\"},{\"id\":\"2479\",\"count\":1,\"chance\":\"670\"},{\"id\":\"8880\",\"count\":1,\"chance\":\"100\"},{\"id\":\"2528\",\"count\":1,\"chance\":\"830\"},{\"id\":\"2475\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2473\",\"count\":1,\"chance\":\"15400\"}]'),
(330, 0, 'Snake', 205, 10, 15, 1, 0, '[\"Zzzzzzt\"]', '[]', 1, 1, 'blood', '[]'),
(331, 0, 'Young Sea Serpent', 390, 1000, 1050, 65, 0, '[\"CHHHRRRR\",\"HISSSS\"]', '[\"ice\",\"paralyze\",\"invisible\",\"drown\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"65\",\"chance\":\"31000\"},{\"id\":\"2148\",\"count\":\"55\",\"chance\":\"31000\"},{\"id\":\"2148\",\"count\":\"45\",\"chance\":\"31000\"},{\"id\":\"2666\",\"count\":\"4\",\"chance\":\"20000\"},{\"id\":\"2165\",\"count\":1,\"chance\":\"750\"},{\"id\":\"7589\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2489\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"9808\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2672\",\"count\":\"2\",\"chance\":\"16000\"},{\"id\":\"9808\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2394\",\"count\":1,\"chance\":\"8000\"},{\"id\":\"2177\",\"count\":1,\"chance\":\"800\"},{\"id\":\"2417\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2378\",\"count\":1,\"chance\":\"3000\"}]'),
(332, 0, 'Black Sheep', 250, 0, 20, 1, 0, '[\"Maeh\"]', '[]', 1, 1, 'blood', '[{\"id\":\"2666\",\"count\":\"4\",\"chance\":\"22500\"}]'),
(333, 0, 'Sheep', 250, 0, 20, 1, 0, '[\"Maeh\"]', '[]', 1, 1, 'blood', '[{\"id\":\"2666\",\"count\":\"4\",\"chance\":\"22500\"}]'),
(334, 0, 'Mimic', 0, 0, 30, 1, 0, '[]', '[]', 0, 0, 'blood', '[]'),
(335, 0, 'Betrayed Wraith', 0, 3500, 4200, 45, 1, '[\"Rrrah!\",\"Gnarr!\",\"Tcharrr!\"]', '[\"lifedrain\",\"paralyze\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"41000\"},{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"41000\"},{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"41000\"},{\"id\":\"2148\",\"count\":\"62\",\"chance\":\"41000\"},{\"id\":\"6558\",\"count\":1,\"chance\":\"36250\"},{\"id\":\"2226\",\"count\":1,\"chance\":\"12500\"},{\"id\":\"7364\",\"count\":\"5\",\"chance\":\"5000\"},{\"id\":\"5944\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2383\",\"count\":1,\"chance\":\"8750\"},{\"id\":\"2178\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7590\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"6300\",\"count\":1,\"chance\":\"900\"},{\"id\":\"7416\",\"count\":1,\"chance\":\"750\"},{\"id\":\"2173\",\"count\":1,\"chance\":\"100\"},{\"id\":\"5799\",\"count\":1,\"chance\":\"50\"},{\"id\":\"5741\",\"count\":1,\"chance\":\"1250\"},{\"id\":\"6500\",\"count\":1,\"chance\":\"7500\"},{\"id\":\"5022\",\"count\":\"2\",\"chance\":\"9000\"},{\"id\":\"2394\",\"count\":1,\"chance\":\"16250\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"27500\"},{\"id\":\"2417\",\"count\":1,\"chance\":\"3750\"},{\"id\":\"2152\",\"count\":\"4\",\"chance\":\"4100\"}]'),
(336, 0, 'Bonebeast', 0, 580, 515, 1, 0, '[\"Cccchhhhhhhhh!\",\"Knooorrrrr!\"]', '[\"lifedrain\",\"paralyze\",\"invisible\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"55\",\"chance\":\"15000\"},{\"id\":\"2148\",\"count\":\"35\",\"chance\":\"15000\"},{\"id\":\"2231\",\"count\":1,\"chance\":\"11000\"},{\"id\":\"2230\",\"count\":1,\"chance\":\"47750\"},{\"id\":\"2449\",\"count\":1,\"chance\":\"3250\"},{\"id\":\"2541\",\"count\":1,\"chance\":\"2600\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2796\",\"count\":1,\"chance\":\"1750\"},{\"id\":\"5925\",\"count\":1,\"chance\":\"900\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"5650\"},{\"id\":\"7618\",\"count\":1,\"chance\":\"900\"},{\"id\":\"2229\",\"count\":1,\"chance\":\"21000\"}]'),
(337, 0, 'Demon Skeleton', 620, 240, 400, 5, 0, '[]', '[\"paralyze\"]', 1, 1, 'undead', '[{\"id\":\"2148\",\"count\":\"50\",\"chance\":\"18500\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"52750\"},{\"id\":\"2399\",\"count\":\"3\",\"chance\":\"3000\"},{\"id\":\"2417\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2459\",\"count\":1,\"chance\":\"2650\"},{\"id\":\"2513\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2194\",\"count\":1,\"chance\":\"400\"},{\"id\":\"7620\",\"count\":1,\"chance\":\"900\"},{\"id\":\"2178\",\"count\":1,\"chance\":\"250\"},{\"id\":\"2515\",\"count\":1,\"chance\":\"50\"}]'),
(338, 0, 'Dreadbeast', 800, 580, 515, 1, 0, '[]', '[\"poison\",\"paralyze\"]', 0, 1, 'undead', '[]'),
(339, 0, 'Lost Soul', 0, 4000, 5800, 15, 1, '[\"Forgive Meeeee!\",\"Mouuuurn meeee!\"]', '[\"paralyze\",\"invisible\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"40000\"},{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"40000\"},{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"40000\"},{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"40000\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"25250\"},{\"id\":\"2230\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"6500\",\"count\":1,\"chance\":\"7500\"},{\"id\":\"7590\",\"count\":1,\"chance\":\"7500\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2152\",\"count\":\"3\",\"chance\":\"4500\"},{\"id\":\"2227\",\"count\":\"2\",\"chance\":\"25000\"},{\"id\":\"9808\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"2483\",\"count\":1,\"chance\":\"10500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"9808\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"5806\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"2457\",\"count\":1,\"chance\":\"10500\"},{\"id\":\"2133\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"5944\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"2197\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"7413\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"6300\",\"count\":1,\"chance\":\"750\"},{\"id\":\"6526\",\"count\":1,\"chance\":\"900\"},{\"id\":\"5801\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2436\",\"count\":1,\"chance\":\"650\"},{\"id\":\"2173\",\"count\":1,\"chance\":\"50\"},{\"id\":\"8903\",\"count\":1,\"chance\":\"100\"}]'),
(340, 0, 'Skeleton', 300, 35, 50, 1, 0, '[]', '[]', 1, 1, 'undead', '[{\"id\":\"2148\",\"count\":\"10\",\"chance\":\"24500\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"25000\"},{\"id\":\"2230\",\"count\":1,\"chance\":\"49750\"},{\"id\":\"2388\",\"count\":1,\"chance\":\"23750\"},{\"id\":\"2398\",\"count\":1,\"chance\":\"19500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2511\",\"count\":1,\"chance\":\"13250\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"25000\"},{\"id\":\"2473\",\"count\":1,\"chance\":\"8250\"},{\"id\":\"2376\",\"count\":1,\"chance\":\"1500\"}]'),
(341, 0, 'Skeleton Warrior', 350, 65, 45, 1, 0, '[]', '[\"death\"]', 1, 1, 'undead', '[{\"id\":\"2148\",\"count\":\"15\",\"chance\":\"24500\"},{\"id\":\"2230\",\"count\":1,\"chance\":\"50000\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"25000\"},{\"id\":\"2376\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2398\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2511\",\"count\":1,\"chance\":\"15000\"},{\"id\":\"2787\",\"count\":\"3\",\"chance\":\"5000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2789\",\"count\":1,\"chance\":\"7500\"}]'),
(342, 0, 'Undead Gladiator', 0, 800, 1000, 25, 0, '[\"Let\'s battle it out in a duel!\",\"Bring it!\",\"I\'ll fight here in eternity and beyond.\",\"I will not give up!\",\"Another foolish adventurer who tries to beat me.\"]', '[\"invisible\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"387500\"},{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"387500\"},{\"id\":\"8872\",\"count\":1,\"chance\":\"11000\"},{\"id\":\"2465\",\"count\":1,\"chance\":\"11000\"},{\"id\":\"2478\",\"count\":1,\"chance\":\"15500\"},{\"id\":\"3965\",\"count\":1,\"chance\":\"6700\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"15000\"},{\"id\":\"2419\",\"count\":1,\"chance\":\"6750\"},{\"id\":\"2399\",\"count\":\"18\",\"chance\":\"12000\"},{\"id\":\"2647\",\"count\":1,\"chance\":\"4444\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2200\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2377\",\"count\":1,\"chance\":\"1875\"},{\"id\":\"2165\",\"count\":1,\"chance\":\"1650\"},{\"id\":\"2490\",\"count\":1,\"chance\":\"1750\"},{\"id\":\"2497\",\"count\":1,\"chance\":\"800\"},{\"id\":\"7618\",\"count\":1,\"chance\":\"750\"},{\"id\":\"2430\",\"count\":1,\"chance\":\"900\"},{\"id\":\"3962\",\"count\":1,\"chance\":\"500\"},{\"id\":\"5885\",\"count\":1,\"chance\":\"400\"},{\"id\":\"7389\",\"count\":1,\"chance\":\"200\"},{\"id\":\"7454\",\"count\":1,\"chance\":\"300\"}]'),
(343, 0, 'Dark Apprentice', 0, 100, 225, 1, 0, '[\"Outch!\",\"Oops, I did it again.\",\"From the spirits that I called Sir, deliver me!\",\"I must dispose of my masters enemies!\"]', '[\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"50\",\"chance\":\"33500\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"4125\"},{\"id\":\"7620\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"4125\"},{\"id\":\"6079\",\"count\":1,\"chance\":\"10500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"4125\"},{\"id\":\"2191\",\"count\":1,\"chance\":\"2200\"},{\"id\":\"7620\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"7618\",\"count\":1,\"chance\":\"3400\"},{\"id\":\"2188\",\"count\":1,\"chance\":\"100\"}]'),
(344, 0, 'Dark Magician', 0, 185, 325, 1, 0, '[\"Feel the power of my runes!\",\"Killing you is getting expensive!\",\"My secrets are mine alone!\"]', '[\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"25500\"},{\"id\":\"7620\",\"count\":1,\"chance\":\"12500\"},{\"id\":\"7618\",\"count\":1,\"chance\":\"13000\"},{\"id\":\"7588\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"9250\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7589\",\"count\":1,\"chance\":\"2750\"},{\"id\":\"7761\",\"count\":1,\"chance\":\"650\"},{\"id\":\"2188\",\"count\":1,\"chance\":\"200\"}]'),
(345, 0, 'Ice Witch', 0, 580, 650, 1, 0, '[\"So you think you are cool?\",\"I hope it is not too cold for you! HeHeHe.\",\"Freeze!\"]', '[\"paralyze\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"6300\"},{\"id\":\"7441\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2796\",\"count\":1,\"chance\":\"1550\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7387\",\"count\":1,\"chance\":\"225\"},{\"id\":\"7449\",\"count\":1,\"chance\":\"660\"},{\"id\":\"7290\",\"count\":1,\"chance\":\"225\"},{\"id\":\"2423\",\"count\":1,\"chance\":\"3250\"},{\"id\":\"7589\",\"count\":1,\"chance\":\"2650\"},{\"id\":\"2663\",\"count\":1,\"chance\":\"750\"},{\"id\":\"7896\",\"count\":1,\"chance\":\"300\"},{\"id\":\"7459\",\"count\":1,\"chance\":\"100\"}]'),
(346, 0, 'Infernalist', 0, 4000, 3650, 20, 0, '[\"Nothing will remain but your scorched bones!\",\"Some like it hot!\",\"It\'s cooking time!\",\"Feel the heat of battle!\"]', '[\"energy\",\"fire\",\"paralyze\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"36500\"},{\"id\":\"2148\",\"count\":\"45\",\"chance\":\"36500\"},{\"id\":\"7590\",\"count\":1,\"chance\":\"21000\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"21500\"},{\"id\":\"8840\",\"count\":\"5\",\"chance\":\"5500\"},{\"id\":\"2436\",\"count\":1,\"chance\":\"6100\"},{\"id\":\"7760\",\"count\":1,\"chance\":\"5050\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"5911\",\"count\":1,\"chance\":\"2300\"},{\"id\":\"2167\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"8902\",\"count\":1,\"chance\":\"500\"},{\"id\":\"5904\",\"count\":1,\"chance\":\"350\"},{\"id\":\"1986\",\"count\":1,\"chance\":\"50\"},{\"id\":\"9971\",\"count\":1,\"chance\":\"250\"},{\"id\":\"9969\",\"count\":1,\"chance\":\"250\"},{\"id\":\"7410\",\"count\":1,\"chance\":\"150\"},{\"id\":\"7891\",\"count\":1,\"chance\":\"100\"},{\"id\":\"9980\",\"count\":1,\"chance\":\"100\"},{\"id\":\"2114\",\"count\":1,\"chance\":\"150\"}]'),
(347, 0, 'Mad Scientist', 0, 205, 325, 1, 0, '[\"Die in the name of Science!\",\"You will regret interrupting my studies!\",\"Let me test this!\",\"I will study your corpse!\"]', '[\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"17500\"},{\"id\":\"2148\",\"count\":\"50\",\"chance\":\"17500\"},{\"id\":\"7620\",\"count\":1,\"chance\":\"18000\"},{\"id\":\"7618\",\"count\":1,\"chance\":\"23500\"},{\"id\":\"2787\",\"count\":\"3\",\"chance\":\"5000\"},{\"id\":\"2308\",\"count\":1,\"chance\":\"7750\"},{\"id\":\"2177\",\"count\":1,\"chance\":\"2700\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2162\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"7762\",\"count\":1,\"chance\":\"700\"},{\"id\":\"6324\",\"count\":1,\"chance\":\"350\"},{\"id\":\"2687\",\"count\":\"5\",\"chance\":\"500\"},{\"id\":\"2190\",\"count\":1,\"chance\":\"200\"},{\"id\":\"7440\",\"count\":1,\"chance\":\"1500\"}]'),
(348, 0, 'Warlock', 0, 4000, 3500, 1, 0, '[\"Learn the secret of our magic! YOUR death!\",\"Even a rat is a better mage than you.\",\"We don\'t like intruders!\"]', '[\"paralyze\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"36500\"},{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"3t6500\"},{\"id\":\"2679\",\"count\":\"5\",\"chance\":\"55000\"},{\"id\":\"2689\",\"count\":1,\"chance\":\"22500\"},{\"id\":\"2047\",\"count\":1,\"chance\":\"15000\"},{\"id\":\"2124\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"2792\",\"count\":\"5\",\"chance\":\"5000\"},{\"id\":\"2167\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2600\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2178\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2411\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2436\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2151\",\"count\":1,\"chance\":\"5500\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"12500\"},{\"id\":\"7590\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"7368\",\"count\":\"4\",\"chance\":\"1200\"},{\"id\":\"1986\",\"count\":1,\"chance\":\"800\"},{\"id\":\"2197\",\"count\":1,\"chance\":\"750\"},{\"id\":\"7898\",\"count\":1,\"chance\":\"450\"},{\"id\":\"7895\",\"count\":1,\"chance\":\"450\"},{\"id\":\"2466\",\"count\":1,\"chance\":\"375\"},{\"id\":\"2114\",\"count\":1,\"chance\":\"100\"}]'),
(349, 0, 'Witch', 0, 120, 300, 1, 0, '[\"Horax pokti! Hihihihi!\",\"Herba budinia ex!\"]', '[\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"10\",\"chance\":\"13000\"},{\"id\":\"2687\",\"count\":\"8\",\"chance\":\"15750\"},{\"id\":\"2643\",\"count\":1,\"chance\":\"67000\"},{\"id\":\"2696\",\"count\":1,\"chance\":\"58750\"},{\"id\":\"2405\",\"count\":1,\"chance\":\"52500\"},{\"id\":\"2654\",\"count\":1,\"chance\":\"48500\"},{\"id\":\"2324\",\"count\":1,\"chance\":\"29000\"},{\"id\":\"2651\",\"count\":1,\"chance\":\"19500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2129\",\"count\":1,\"chance\":\"15500\"},{\"id\":\"2800\",\"count\":1,\"chance\":\"10500\"},{\"id\":\"2199\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2402\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2185\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2801\",\"count\":1,\"chance\":\"300\"}]'),
(350, 0, 'Thornback Tortoise', 490, 150, 300, 1, 0, '[]', '[]', 0, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"30\",\"chance\":\"28500\"},{\"id\":\"5678\",\"count\":\"3\",\"chance\":\"1000\"},{\"id\":\"2667\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"2671\",\"count\":\"2\",\"chance\":\"4500\"},{\"id\":\"1987\",\"count\":1,\"chance\":100000},{\"id\":\"7618\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2789\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2787\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2391\",\"count\":1,\"chance\":\"800\"}]'),
(351, 0, 'Tortoise', 445, 90, 150, 1, 0, '[]', '[]', 0, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"30\",\"chance\":\"30000\"},{\"id\":\"2671\",\"count\":\"2\",\"chance\":\"4000\"},{\"id\":\"2510\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"2667\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"5678\",\"count\":\"3\",\"chance\":\"1000\"},{\"id\":\"6131\",\"count\":1,\"chance\":\"450\"},{\"id\":\"5899\",\"count\":1,\"chance\":\"1300\"},{\"id\":\"2417\",\"count\":1,\"chance\":\"450\"}]'),
(352, 0, 'Deathslicer', 0, 320, 2000, 1, 0, '[]', '[\"physical\",\"energy\",\"fire\",\"poison\",\"ice\",\"holy\",\"death\",\"lifedrain\",\"manadrain\",\"paralyze\",\"drunk\",\"outfit\",\"invisible\"]', 0, 0, 'undead', '[]'),
(353, 0, 'Eye of the Seven', 0, 0, 1, 1, 0, '[]', '[\"physical\",\"energy\",\"fire\",\"poison\",\"ice\",\"holy\",\"death\",\"lifedrain\",\"manadrain\",\"paralyze\",\"drunk\",\"outfit\"]', 0, 0, 'venom', '[]'),
(354, 0, 'Flamethrower', 0, 0, 9950, 1, 0, '[]', '[\"physical\",\"energy\",\"fire\",\"poison\",\"ice\",\"holy\",\"death\",\"lifedrain\",\"manadrain\",\"paralyze\",\"drunk\",\"outfit\",\"invisible\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"}]'),
(355, 0, 'Lavahole', 0, 0, 100, 1, 0, '[]', '[\"physical\",\"energy\",\"fire\",\"poison\",\"ice\",\"holy\",\"death\",\"lifedrain\",\"manadrain\",\"paralyze\",\"drunk\",\"outfit\",\"invisible\"]', 0, 0, 'undead', '[]'),
(356, 0, 'Magicthrower', 0, 0, 9950, 1, 0, '[]', '[\"physical\",\"energy\",\"fire\",\"poison\",\"ice\",\"holy\",\"death\",\"lifedrain\",\"manadrain\",\"paralyze\",\"drunk\",\"outfit\",\"invisible\"]', 0, 0, 'undead', '[]'),
(357, 0, 'Plaguethrower', 0, 0, 9950, 1, 0, '[]', '[\"physical\",\"energy\",\"fire\",\"poison\",\"ice\",\"holy\",\"death\",\"lifedrain\",\"manadrain\",\"paralyze\",\"drunk\",\"outfit\",\"invisible\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"}]'),
(358, 0, 'Shredderthrower', 0, 0, 9950, 1, 0, '[]', '[\"physical\",\"energy\",\"fire\",\"poison\",\"ice\",\"holy\",\"death\",\"lifedrain\",\"manadrain\",\"paralyze\",\"drunk\",\"outfit\",\"invisible\"]', 0, 0, 'undead', '[]'),
(359, 0, 'Frost Troll', 300, 23, 55, 1, 0, '[\"Brrrr\",\"Broar!\"]', '[]', 1, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"12\",\"chance\":\"26250\"},{\"id\":\"2667\",\"count\":1,\"chance\":\"15000\"},{\"id\":\"2382\",\"count\":1,\"chance\":\"8000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2384\",\"count\":1,\"chance\":\"17000\"},{\"id\":\"2389\",\"count\":1,\"chance\":\"21500\"},{\"id\":\"2512\",\"count\":1,\"chance\":\"16750\"},{\"id\":\"2651\",\"count\":1,\"chance\":\"10500\"},{\"id\":\"2245\",\"count\":1,\"chance\":\"8000\"}]'),
(360, 0, 'Island Troll', 290, 20, 50, 1, 0, '[\"Hmmm, turtles\",\"Hmmm, dogs\",\"Hmmm, wormds\",\"Groar\",\"Gruntz!\"]', '[]', 1, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"10\",\"chance\":\"35000\"},{\"id\":\"5901\",\"count\":1,\"chance\":\"15000\"},{\"id\":\"2389\",\"count\":1,\"chance\":\"23000\"},{\"id\":\"2380\",\"count\":1,\"chance\":\"17000\"},{\"id\":\"2512\",\"count\":1,\"chance\":\"15000\"},{\"id\":\"2666\",\"count\":1,\"chance\":\"15000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"5901\",\"count\":1,\"chance\":\"15000\"},{\"id\":\"2643\",\"count\":1,\"chance\":\"11500\"},{\"id\":\"2461\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2120\",\"count\":1,\"chance\":\"7250\"},{\"id\":\"2448\",\"count\":1,\"chance\":\"6000\"},{\"id\":\"2170\",\"count\":1,\"chance\":\"50\"},{\"id\":\"7963\",\"count\":1,\"chance\":\"150\"}]'),
(361, 0, 'Swamp Troll', 320, 65, 55, 1, 0, '[\"Grrrr\",\"Groar!\",\"Me strong! Me ate spinach!\"]', '[]', 1, 1, 'venom', '[{\"id\":\"2148\",\"count\":\"5\",\"chance\":\"31500\"},{\"id\":\"2667\",\"count\":1,\"chance\":\"63500\"},{\"id\":\"2379\",\"count\":1,\"chance\":\"27500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"15750\"},{\"id\":\"2389\",\"count\":1,\"chance\":\"14700\"},{\"id\":\"2643\",\"count\":1,\"chance\":\"9500\"},{\"id\":\"2580\",\"count\":1,\"chance\":\"150\"}]'),
(362, 0, 'Troll', 290, 20, 50, 1, 0, '[\"Grrrr\",\"Groar\",\"Gruntz!\",\"Hmmm, bugs.\",\"Hmmm, dogs.\"]', '[]', 1, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"12\",\"chance\":\"26750\"},{\"id\":\"2380\",\"count\":1,\"chance\":\"18750\"},{\"id\":\"2643\",\"count\":1,\"chance\":\"8750\"},{\"id\":\"2461\",\"count\":1,\"chance\":\"9750\"},{\"id\":\"2666\",\"count\":1,\"chance\":\"11750\"},{\"id\":\"2120\",\"count\":1,\"chance\":\"8750\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2389\",\"count\":1,\"chance\":\"12000\"},{\"id\":\"2512\",\"count\":1,\"chance\":\"15000\"},{\"id\":\"2448\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"2170\",\"count\":1,\"chance\":\"50\"}]'),
(363, 0, 'Troll Champion', 340, 30, 75, 1, 0, '[\"Meee maity!\",\"Grrrr\",\"Whaaaz up!?\",\"Gruntz!\"]', '[]', 1, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"12\",\"chance\":\"24250\"},{\"id\":\"2544\",\"count\":\"5\",\"chance\":\"2000\"},{\"id\":\"2643\",\"count\":1,\"chance\":\"15250\"},{\"id\":\"2666\",\"count\":1,\"chance\":\"11500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2389\",\"count\":1,\"chance\":\"27000\"},{\"id\":\"2448\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2512\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2380\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2461\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2120\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"2170\",\"count\":1,\"chance\":\"100\"}]'),
(364, 0, 'Banshee', 0, 900, 1000, 1, 0, '[\"Are you ready to rock?\",\"That\'s what I call easy listening!\",\"Let the music play!\",\"I will mourn your death!\",\"IIIIEEEeeeeeehhhHHHHH!\",\"Dance for me your dance of death!\",\"Feel my gentle kiss of death.\"]', '[\"lifedrain\",\"paralyze\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"60\",\"chance\":\"11250\"},{\"id\":\"2148\",\"count\":\"40\",\"chance\":\"11250\"},{\"id\":\"2144\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2047\",\"count\":1,\"chance\":\"70000\"},{\"id\":\"2237\",\"count\":1,\"chance\":\"19000\"},{\"id\":\"2177\",\"count\":1,\"chance\":\"50\"},{\"id\":\"2071\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"2560\",\"count\":1,\"chance\":\"7250\"},{\"id\":\"2411\",\"count\":1,\"chance\":\"1600\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2655\",\"count\":1,\"chance\":\"800\"},{\"id\":\"2214\",\"count\":1,\"chance\":\"860\"},{\"id\":\"2170\",\"count\":1,\"chance\":\"8300\"},{\"id\":\"2134\",\"count\":1,\"chance\":\"1750\"},{\"id\":\"2657\",\"count\":1,\"chance\":\"60000\"},{\"id\":\"2197\",\"count\":1,\"chance\":\"1100\"},{\"id\":\"7589\",\"count\":1,\"chance\":\"650\"},{\"id\":\"2175\",\"count\":1,\"chance\":\"900\"},{\"id\":\"2143\",\"count\":1,\"chance\":\"410\"},{\"id\":\"7884\",\"count\":1,\"chance\":\"240\"},{\"id\":\"2121\",\"count\":1,\"chance\":\"410\"},{\"id\":\"2124\",\"count\":1,\"chance\":\"100\"}]'),
(365, 0, 'Crypt Shambler', 0, 195, 330, 1, 0, '[\"Uhhhhhhh!\",\"Aaaaahhhh!\",\"Hoooohhh!\",\"Chhhhhhh!\"]', '[\"lifedrain\",\"paralyze\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"35\",\"chance\":\"18000\"},{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"18000\"},{\"id\":\"2230\",\"count\":1,\"chance\":\"50000\"},{\"id\":\"2541\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"2450\",\"count\":1,\"chance\":\"900\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2459\",\"count\":1,\"chance\":\"1700\"},{\"id\":\"2227\",\"count\":1,\"chance\":\"21500\"},{\"id\":\"2399\",\"count\":\"3\",\"chance\":\"700\"},{\"id\":\"2459\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"}]'),
(366, 0, 'Ghoul', 450, 85, 100, 1, 0, '[]', '[\"lifedrain\",\"paralyze\",\"invisible\"]', 1, 1, 'blood', '[{\"id\":\"2148\",\"count\":\"30\",\"chance\":\"34750\"},{\"id\":\"2460\",\"count\":1,\"chance\":\"19250\"},{\"id\":\"5913\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2403\",\"count\":1,\"chance\":\"15250\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2168\",\"count\":1,\"chance\":\"200\"},{\"id\":\"2483\",\"count\":1,\"chance\":\"2900\"},{\"id\":\"2229\",\"count\":\"2\",\"chance\":\"1500\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"57850\"},{\"id\":\"2473\",\"count\":1,\"chance\":\"5800\"},{\"id\":\"3976\",\"count\":\"6\",\"chance\":\"47500\"}]'),
(367, 0, 'Grim Reaper', 0, 5500, 4100, 90, 0, '[\"Death!\",\"Come a little closer!\",\"The end is near!\"]', '[\"paralyze\",\"invisible\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"43750\"},{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"43750\"},{\"id\":\"2148\",\"count\":\"75\",\"chance\":\"43750\"},{\"id\":\"6500\",\"count\":1,\"chance\":\"10500\"},{\"id\":\"8473\",\"count\":1,\"chance\":\"9500\"},{\"id\":\"2152\",\"count\":\"4\",\"chance\":\"3500\"},{\"id\":\"6558\",\"count\":1,\"chance\":\"37000\"},{\"id\":\"2162\",\"count\":1,\"chance\":\"8150\"},{\"id\":\"7590\",\"count\":1,\"chance\":\"7850\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2521\",\"count\":1,\"chance\":\"3100\"},{\"id\":\"2550\",\"count\":1,\"chance\":\"9500\"},{\"id\":\"8910\",\"count\":1,\"chance\":\"700\"},{\"id\":\"7896\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"9810\",\"count\":1,\"chance\":\"2250\"},{\"id\":\"7418\",\"count\":1,\"chance\":\"450\"},{\"id\":\"5022\",\"count\":\"4\",\"chance\":\"1500\"},{\"id\":\"8889\",\"count\":1,\"chance\":\"560\"},{\"id\":\"6300\",\"count\":1,\"chance\":\"280\"}]'),
(368, 0, 'Lich', 0, 900, 880, 50, 0, '[\"Doomed be the living!\",\"You will endure agony beyond thy death!\",\"Death awaits all!\",\"Thy living flesh offends me!\",\"Death and Decay!\"]', '[\"paralyze\",\"invisible\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"225000\"},{\"id\":\"2148\",\"count\":\"50\",\"chance\":\"225000\"},{\"id\":\"2401\",\"count\":1,\"chance\":\"15000\"},{\"id\":\"2175\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2144\",\"count\":1,\"chance\":\"6500\"},{\"id\":\"2143\",\"count\":1,\"chance\":\"5500\"},{\"id\":\"2237\",\"count\":1,\"chance\":\"45000\"},{\"id\":\"2479\",\"count\":1,\"chance\":\"6000\"},{\"id\":\"2178\",\"count\":1,\"chance\":\"5500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7589\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2171\",\"count\":1,\"chance\":\"300\"},{\"id\":\"2214\",\"count\":1,\"chance\":\"750\"},{\"id\":\"7893\",\"count\":1,\"chance\":\"600\"},{\"id\":\"2535\",\"count\":1,\"chance\":\"100\"}]'),
(369, 0, 'Mummy', 0, 150, 240, 1, 0, '[\"I will ssswallow your sssoul!\",\"Mort ulhegh dakh visss.\",\"Flesssh to dussst!\",\"I will tassste life again!\",\"Ahkahra exura belil mort!\",\"Yohag Sssetham!\"]', '[\"lifedrain\",\"paralyze\",\"invisible\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"46\",\"chance\":\"15000\"},{\"id\":\"2148\",\"count\":\"45\",\"chance\":\"15000\"},{\"id\":\"3976\",\"count\":\"3\",\"chance\":\"50000\"},{\"id\":\"2162\",\"count\":1,\"chance\":\"15750\"},{\"id\":\"2406\",\"count\":1,\"chance\":\"8350\"},{\"id\":\"2134\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2161\",\"count\":1,\"chance\":\"4650\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2124\",\"count\":1,\"chance\":\"2222\"},{\"id\":\"2411\",\"count\":1,\"chance\":\"1900\"},{\"id\":\"2144\",\"count\":1,\"chance\":\"1270\"},{\"id\":\"2170\",\"count\":1,\"chance\":\"110\"},{\"id\":\"5914\",\"count\":1,\"chance\":\"250\"},{\"id\":\"2529\",\"count\":1,\"chance\":\"110\"}]'),
(370, 0, 'Vampire', 0, 305, 450, 1, 1, '[\"BLOOD!\",\"Let me kiss your neck.\",\"I smell warm blood.\",\"I call you, my bats! Come!\"]', '[\"lifedrain\",\"paralyze\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"6111\"},{\"id\":\"2144\",\"count\":1,\"chance\":\"1620\"},{\"id\":\"2032\",\"count\":1,\"chance\":\"10300\"},{\"id\":\"2172\",\"count\":1,\"chance\":\"50\"},{\"id\":\"2127\",\"count\":1,\"chance\":\"140\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2747\",\"count\":1,\"chance\":\"17500\"},{\"id\":\"2396\",\"count\":1,\"chance\":\"300\"},{\"id\":\"2412\",\"count\":1,\"chance\":\"15000\"},{\"id\":\"2649\",\"count\":1,\"chance\":\"7850\"},{\"id\":\"2229\",\"count\":1,\"chance\":\"11500\"},{\"id\":\"2383\",\"count\":1,\"chance\":\"1222\"},{\"id\":\"2479\",\"count\":1,\"chance\":\"140\"},{\"id\":\"7588\",\"count\":1,\"chance\":\"150\"},{\"id\":\"2534\",\"count\":1,\"chance\":\"300\"}]'),
(371, 0, 'Vampire Bride', 0, 1050, 1200, 1, 0, '[\"Kneel before your Mistress!\",\"Dead is the new alive.\",\"Come, let me kiss you, darling. Oh wait, I meant kill.\",\"Enjoy the pain - I know you love it.\"]', '[\"death\",\"invisible\"]', 0, 0, 'blood', '[{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"41000\"},{\"id\":\"2148\",\"count\":\"50\",\"chance\":\"41000\"},{\"id\":\"2195\",\"count\":1,\"chance\":\"200\"},{\"id\":\"2127\",\"count\":1,\"chance\":\"900\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"8873\",\"count\":1,\"chance\":\"1250\"},{\"id\":\"2186\",\"count\":1,\"chance\":\"4900\"},{\"id\":\"5670\",\"count\":1,\"chance\":\"110\"},{\"id\":\"2152\",\"count\":\"4\",\"chance\":\"2500\"},{\"id\":\"9809\",\"count\":1,\"chance\":\"950\"},{\"id\":\"7589\",\"count\":1,\"chance\":\"9750\"},{\"id\":\"7588\",\"count\":1,\"chance\":\"4800\"},{\"id\":\"9837\",\"count\":1,\"chance\":\"925\"}]'),
(372, 0, 'Zombie', 0, 280, 500, 1, 0, '[\"Mst.... klll....\",\"Whrrrr... ssss.... mmm.... grrrrl\",\"Dnnnt... cmmm... clsrrr....\",\"Httt.... hmnnsss...\"]', '[\"death\",\"energy\",\"ice\",\"earth\",\"lifedrain\",\"paralyze\"]', 0, 0, 'undead', '[{\"id\":\"2148\",\"count\":\"64\",\"chance\":\"24000\"},{\"id\":\"2227\",\"count\":1,\"chance\":\"45000\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"46250\"},{\"id\":\"2460\",\"count\":1,\"chance\":\"8700\"},{\"id\":\"2457\",\"count\":1,\"chance\":\"8700\"},{\"id\":\"2398\",\"count\":1,\"chance\":\"7250\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"9808\",\"count\":1,\"chance\":\"7250\"},{\"id\":\"2381\",\"count\":1,\"chance\":\"2900\"},{\"id\":\"2381\",\"count\":1,\"chance\":\"4350\"},{\"id\":\"2205\",\"count\":1,\"chance\":\"2900\"},{\"id\":\"7620\",\"count\":1,\"chance\":\"1450\"},{\"id\":\"2657\",\"count\":1,\"chance\":\"900\"}]');

-- --------------------------------------------------------

--
-- Estrutura da tabela `myaac_news`
--

CREATE TABLE `myaac_news` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `body` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 - news, 2 - ticker, 3 - article',
  `date` int(11) NOT NULL DEFAULT 0,
  `category` tinyint(1) NOT NULL DEFAULT 0,
  `player_id` int(11) NOT NULL DEFAULT 0,
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_date` int(11) NOT NULL DEFAULT 0,
  `comments` varchar(50) NOT NULL DEFAULT '',
  `article_text` varchar(300) NOT NULL DEFAULT '',
  `article_image` varchar(100) NOT NULL DEFAULT '',
  `hidden` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `myaac_news`
--

INSERT INTO `myaac_news` (`id`, `title`, `body`, `type`, `date`, `category`, `player_id`, `last_modified_by`, `last_modified_date`, `comments`, `article_text`, `article_image`, `hidden`) VALUES
(1, 'Hello!', 'MyAAC is just READY to use!', 1, 1712013386, 2, 1, 0, 0, 'https://my-aac.org', '', '', 0),
(2, 'Hello tickets!', 'https://my-aac.org', 2, 1712013386, 4, 1, 0, 0, '', '', '', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `myaac_news_categories`
--

CREATE TABLE `myaac_news_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(50) NOT NULL DEFAULT '',
  `icon_id` int(2) NOT NULL DEFAULT 0,
  `hidden` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `myaac_news_categories`
--

INSERT INTO `myaac_news_categories` (`id`, `name`, `description`, `icon_id`, `hidden`) VALUES
(1, '', '', 0, 0),
(2, '', '', 1, 0),
(3, '', '', 2, 0),
(4, '', '', 3, 0),
(5, '', '', 4, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `myaac_notepad`
--

CREATE TABLE `myaac_notepad` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `myaac_pages`
--

CREATE TABLE `myaac_pages` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `title` varchar(30) NOT NULL,
  `body` text NOT NULL,
  `date` int(11) NOT NULL DEFAULT 0,
  `player_id` int(11) NOT NULL DEFAULT 0,
  `php` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 - plain html, 1 - php',
  `enable_tinymce` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 - enabled, 0 - disabled',
  `access` tinyint(2) NOT NULL DEFAULT 0,
  `hidden` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `myaac_pages`
--

INSERT INTO `myaac_pages` (`id`, `name`, `title`, `body`, `date`, `player_id`, `php`, `enable_tinymce`, `access`, `hidden`) VALUES
(1, 'downloads', 'Downloads', '<p>&nbsp;</p>\n<p>&nbsp;</p>\n<div style=\"text-align: center;\">We\'re using official Tibia Client <strong>{{ config.client / 100 }}</strong><br />\n<p>Download Tibia Client <strong>{{ config.client / 100 }}</strong>&nbsp;for Windows <a href=\"https://drive.google.com/drive/folders/0B2-sMQkWYzhGSFhGVlY2WGk5czQ\" target=\"_blank\" rel=\"noopener\">HERE</a>.</p>\n<h2>IP Changer:</h2>\n<a href=\"https://static.otland.net/ipchanger.exe\" target=\"_blank\" rel=\"noopener\">HERE</a></div>', 0, 1, 0, 1, 1, 0),
(2, 'commands', 'Commands', '<table style=\"border-collapse: collapse; width: 87.8471%; height: 57px;\" border=\"1\">\n<tbody>\n<tr style=\"height: 18px;\">\n<td style=\"width: 33.3333%; background-color: #505050; height: 18px;\"><span style=\"color: #ffffff;\"><strong>Words</strong></span></td>\n<td style=\"width: 33.3333%; background-color: #505050; height: 18px;\"><span style=\"color: #ffffff;\"><strong>Description</strong></span></td>\n</tr>\n<tr style=\"height: 18px; background-color: #f1e0c6;\">\n<td style=\"width: 33.3333%; height: 18px;\"><em>!example</em></td>\n<td style=\"width: 33.3333%; height: 18px;\">This is just an example</td>\n</tr>\n<tr style=\"height: 18px; background-color: #d4c0a1;\">\n<td style=\"width: 33.3333%; height: 18px;\"><em>!buyhouse</em></td>\n<td style=\"width: 33.3333%; height: 18px;\">Buy house you are looking at</td>\n</tr>\n<tr style=\"height: 18px; background-color: #f1e0c6;\">\n<td style=\"width: 33.3333%; height: 18px;\"><em>!aol</em></td>\n<td style=\"width: 33.3333%; height: 18px;\">Buy AoL</td>\n</tr>\n</tbody>\n</table>', 0, 1, 0, 1, 1, 0),
(3, 'rules_on_the_page', 'Rules', '1. Names\na) Names which contain insulting (e.g. \"Bastard\"), racist (e.g. \"Nigger\"), extremely right-wing (e.g. \"Hitler\"), sexist (e.g. \"Bitch\") or offensive (e.g. \"Copkiller\") language.\nb) Names containing parts of sentences (e.g. \"Mike returns\"), nonsensical combinations of letters (e.g. \"Fgfshdsfg\") or invalid formattings (e.g. \"Thegreatknight\").\nc) Names that obviously do not describe a person (e.g. \"Christmastree\", \"Matrix\"), names of real life celebrities (e.g. \"Britney Spears\"), names that refer to real countries (e.g. \"Swedish Druid\"), names which were created to fake other players\' identities (e.g. \"Arieswer\" instead of \"Arieswar\") or official positions (e.g. \"System Admin\").\n\n2. Cheating\na) Exploiting obvious errors of the game (\"bugs\"), for instance to duplicate items. If you find an error you must report it to CipSoft immediately.\nb) Intentional abuse of weaknesses in the gameplay, for example arranging objects or players in a way that other players cannot move them.\nc) Using tools to automatically perform or repeat certain actions without any interaction by the player (\"macros\").\nd) Manipulating the client program or using additional software to play the game.\ne) Trying to steal other players\' account data (\"hacking\").\nf) Playing on more than one account at the same time (\"multi-clienting\").\ng) Offering account data to other players or accepting other players\' account data (\"account-trading/sharing\").\n\n3. Gamemasters\na) Threatening a gamemaster because of his or her actions or position as a gamemaster.\nb) Pretending to be a gamemaster or to have influence on the decisions of a gamemaster.\nc) Intentionally giving wrong or misleading information to a gamemaster concerning his or her investigations or making false reports about rule violations.\n\n4. Player Killing\na) Excessive killing of characters who are not marked with a \"skull\" on worlds which are not PvP-enforced. Please note that killing marked characters is not a reason for a banishment.\n\nA violation of the Tibia Rules may lead to temporary banishment of characters and accounts. In severe cases removal or modification of character skills, attributes and belongings, as well as the permanent removal of accounts without any compensation may be considered. The sanction is based on the seriousness of the rule violation and the previous record of the player. It is determined by the gamemaster imposing the banishment.\n\nThese rules may be changed at any time. All changes will be announced on the official website.', 0, 1, 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `myaac_spells`
--

CREATE TABLE `myaac_spells` (
  `id` int(11) NOT NULL,
  `spell` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL,
  `words` varchar(255) NOT NULL DEFAULT '',
  `category` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 - attack, 2 - healing, 3 - summon, 4 - supply, 5 - support',
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 - instant, 2 - conjure, 3 - rune',
  `level` int(11) NOT NULL DEFAULT 0,
  `maglevel` int(11) NOT NULL DEFAULT 0,
  `mana` int(11) NOT NULL DEFAULT 0,
  `soul` tinyint(3) NOT NULL DEFAULT 0,
  `conjure_id` int(11) NOT NULL DEFAULT 0,
  `conjure_count` tinyint(3) NOT NULL DEFAULT 0,
  `reagent` int(11) NOT NULL DEFAULT 0,
  `item_id` int(11) NOT NULL DEFAULT 0,
  `premium` tinyint(1) NOT NULL DEFAULT 0,
  `vocations` varchar(100) NOT NULL DEFAULT '',
  `hidden` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `myaac_spells`
--

INSERT INTO `myaac_spells` (`id`, `spell`, `name`, `words`, `category`, `type`, `level`, `maglevel`, `mana`, `soul`, `conjure_id`, `conjure_count`, `reagent`, `item_id`, `premium`, `vocations`, `hidden`) VALUES
(1, '', 'Exura Sio Party', 'utura sio party', 0, 1, 0, 0, 200, 0, 0, 0, 0, 0, 0, '[2,6,10]', 0),
(2, '', 'Utato Fire', 'utato fire', 0, 1, 0, 0, 90, 0, 0, 0, 0, 0, 0, '[1,5,9]', 0),
(3, '', 'Berserk', 'exori', 0, 1, 0, 0, 115, 0, 0, 0, 0, 0, 0, '[4,8,12]', 0),
(4, '', 'Death Strike', 'exori mort', 0, 1, 0, 0, 20, 0, 0, 0, 0, 0, 0, '[1,5,9]', 0),
(5, '', 'Divine Caldera', 'exevo mas san', 0, 1, 0, 0, 160, 0, 0, 0, 0, 0, 0, '[3,7,11]', 0),
(6, '', 'Divine Missile', 'exori san', 0, 1, 0, 0, 20, 0, 0, 0, 0, 0, 0, '[3,7,11]', 0),
(7, '', 'Energy Beam', 'exevo vis lux', 0, 1, 0, 0, 40, 0, 0, 0, 0, 0, 0, '[1,5,9]', 0),
(8, '', 'Energy Strike', 'exori vis', 0, 1, 0, 0, 20, 0, 0, 0, 0, 0, 0, '[1,2,5,9,6,10]', 0),
(9, '', 'Energy Wave', 'exevo vis hur', 0, 1, 0, 0, 170, 0, 0, 0, 0, 0, 0, '[1,5,9]', 0),
(10, '', 'Eternal Winter', 'exevo gran mas frigo', 0, 1, 0, 0, 1050, 0, 0, 0, 0, 0, 0, '[2,6,10]', 0),
(11, '', 'Ethereal Spear', 'exori con', 0, 1, 0, 0, 25, 0, 0, 0, 0, 0, 0, '[3,7,11]', 0),
(12, '', 'Fierce Berserk', 'exori gran', 0, 1, 0, 0, 340, 0, 0, 0, 0, 0, 0, '[4,8,12]', 0),
(13, '', 'Fire Wave', 'exevo flam hur', 0, 1, 0, 0, 25, 0, 0, 0, 0, 0, 0, '[1,5,9]', 0),
(14, '', 'Flame Strike', 'exori flam', 0, 1, 0, 0, 20, 0, 0, 0, 0, 0, 0, '[1,2,5,9,6,10]', 0),
(15, '', 'Great Energy Beam', 'exevo gran vis lux', 0, 1, 0, 0, 110, 0, 0, 0, 0, 0, 0, '[1,5,9]', 0),
(16, '', 'Groundshaker', 'exori mas', 0, 1, 0, 0, 160, 0, 0, 0, 0, 0, 0, '[4,8,12]', 0),
(17, '', 'Hell\'s Core', 'exevo gran mas flam', 0, 1, 0, 0, 1100, 0, 0, 0, 0, 0, 0, '[1,5,9]', 0),
(18, '', 'Ice Strike', 'exori frigo', 0, 1, 0, 0, 20, 0, 0, 0, 0, 0, 0, '[1,5,9,2,6,10]', 0),
(19, '', 'Ice Wave', 'exevo frigo hur', 0, 1, 0, 0, 25, 0, 0, 0, 0, 0, 0, '[2,6,10]', 0),
(20, '', 'Rage of the Skies', 'exevo gran mas vis', 0, 1, 0, 0, 600, 0, 0, 0, 0, 0, 0, '[1,5,9]', 0),
(21, '', 'Terra Strike', 'exori tera', 0, 1, 0, 0, 20, 0, 0, 0, 0, 0, 0, '[1,5,9,2,6,10]', 0),
(22, '', 'Terra Wave', 'exevo tera hur', 0, 1, 0, 0, 210, 0, 0, 0, 0, 0, 0, '[2,6,10]', 0),
(23, '', 'Whirlwind Throw', 'exori hur', 0, 1, 0, 0, 40, 0, 0, 0, 0, 0, 0, '[4,8,12]', 0),
(24, '', 'Wrath of Nature', 'exevo gran mas tera', 0, 1, 0, 0, 700, 0, 0, 0, 0, 0, 0, '[2,6,10]', 0),
(25, '', 'Cure Poison', 'exana pox', 0, 1, 0, 0, 50, 0, 0, 0, 0, 0, 0, '[1,2,3,4,5,9,6,10,7,11,8,12]', 0),
(26, '', 'Cure Flame', 'exana flam', 0, 1, 0, 0, 50, 0, 0, 0, 0, 0, 0, '[1,2,3,4,5,9,6,10,7,11,8,12]', 0),
(27, '', 'Cure Curse', 'exana mort', 0, 1, 0, 0, 50, 0, 0, 0, 0, 0, 0, '[1,2,3,4,5,9,6,10,7,11,8,12]', 0),
(28, '', 'Cure Electrification', 'exana vis', 0, 1, 0, 0, 50, 0, 0, 0, 0, 0, 0, '[1,2,3,4,5,9,6,10,7,11,8,12]', 0),
(29, '', 'Divine Healing', 'exura san', 0, 1, 0, 0, 160, 0, 0, 0, 0, 0, 0, '[3,7,11]', 0),
(30, '', 'Heal Friend', 'exura sio', 0, 1, 0, 0, 140, 0, 0, 0, 0, 0, 0, '[2,6,10]', 0),
(31, '', 'Intense Healing', 'exura gran', 0, 1, 0, 0, 70, 0, 0, 0, 0, 0, 0, '[1,2,3,5,9,6,10,7,11]', 0),
(32, '', 'Light Healing', 'exura', 0, 1, 0, 0, 20, 0, 0, 0, 0, 0, 0, '[1,2,3,5,9,6,10,7,11]', 0),
(33, '', 'Mass Healing', 'exura gran mas res', 0, 1, 0, 0, 150, 0, 0, 0, 0, 0, 0, '[2,6,10]', 0),
(34, '', 'Ultimate Healing', 'exura vita', 0, 1, 0, 0, 160, 0, 0, 0, 0, 0, 0, '[1,2,5,9,6,10]', 0),
(35, '', 'Blood Rage', 'utito tempo', 0, 1, 0, 0, 290, 0, 0, 0, 0, 0, 0, '[4,8,12]', 0),
(36, '', 'Cancel Invisibility', 'exana ina', 0, 1, 0, 0, 200, 0, 0, 0, 0, 0, 0, '[3,7,11]', 0),
(37, '', 'Challenge', 'exeta res', 0, 1, 0, 0, 30, 0, 0, 0, 0, 0, 0, '[4,8,12]', 0),
(38, '', 'Charge', 'utani tempo hur', 0, 1, 0, 0, 100, 0, 0, 0, 0, 0, 0, '[4,8,12]', 0),
(39, '', 'Creature Illusion', 'utevo res ina', 0, 1, 0, 0, 100, 0, 0, 0, 0, 0, 0, '[1,2,5,9,6,10]', 0),
(40, '', 'Find Person', 'exiva', 0, 1, 0, 0, 20, 0, 0, 0, 0, 0, 0, '[1,2,3,4,5,9,6,10,7,11,8,12]', 0),
(41, '', 'Food', 'exevo pan', 0, 1, 0, 0, 120, 1, 0, 0, 0, 0, 0, '[2,6,10]', 0),
(42, '', 'Great Light', 'utevo gran lux', 0, 1, 0, 0, 60, 0, 0, 0, 0, 0, 0, '[1,2,3,4,5,9,6,10,7,11,8,12]', 0),
(43, '', 'Haste', 'utani hur', 0, 1, 0, 0, 60, 0, 0, 0, 0, 0, 0, '[1,2,3,4,5,9,6,10,7,11,8,12]', 0),
(44, '', 'Invisibility', 'utana vid', 0, 1, 0, 0, 440, 0, 0, 0, 0, 0, 0, '[1,2,5,9,6,10]', 0),
(45, '', 'Levitate', 'exani hur', 0, 1, 0, 0, 50, 0, 0, 0, 0, 0, 0, '[1,2,3,4,5,9,6,10,7,11,8,12]', 0),
(46, '', 'Light', 'utevo lux', 0, 1, 0, 0, 20, 0, 0, 0, 0, 0, 0, '[1,2,3,4,5,9,6,10,7,11,8,12]', 0),
(47, '', 'Magic Rope', 'exani tera', 0, 1, 0, 0, 20, 0, 0, 0, 0, 0, 0, '[1,2,3,4,5,9,6,10,7,11,8,12]', 0),
(48, '', 'Magic Shield', 'utamo vita', 0, 1, 0, 0, 50, 0, 0, 0, 0, 0, 0, '[1,2,5,9,6,10]', 0),
(49, '', 'Protector', 'utamo tempo', 0, 1, 0, 0, 200, 0, 0, 0, 0, 0, 0, '[4,8,12]', 0),
(50, '', 'Sharpshooter', 'utito tempo san', 0, 1, 0, 0, 450, 0, 0, 0, 0, 0, 0, '[3,7,11]', 0),
(51, '', 'Strong Haste', 'utani gran hur', 0, 1, 0, 0, 100, 0, 0, 0, 0, 0, 0, '[1,2,5,9,6,10]', 0),
(52, '', 'Summon Creature', 'utevo res', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '[1,2,5,9,6,10]', 0),
(53, '', 'Swift Foot', 'utamo tempo san', 0, 1, 0, 0, 400, 0, 0, 0, 0, 0, 0, '[3,7,11]', 0),
(54, '', 'Ultimate Light', 'utevo vis lux', 0, 1, 0, 0, 140, 0, 0, 0, 0, 0, 0, '[1,2,5,9,6,10]', 0),
(55, '', 'Enchant Party', 'utori mas sio', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '[1,5,9]', 0),
(56, '', 'Heal Party', 'utura mas sio', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '[2,6,10]', 0),
(57, '', 'Protect Party', 'utamo mas sio', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '[3,7,11]', 0),
(58, '', 'Train Party', 'utito mas sio', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '[4,8,12]', 0),
(59, '', 'Animate Dead Rune', 'adana mort', 0, 1, 0, 0, 600, 5, 0, 0, 0, 0, 0, '[1,2,5,9,6,10]', 0),
(60, '', 'Arrow Call', 'exevo infir con', 0, 1, 0, 0, 10, 1, 0, 0, 0, 0, 0, '[3,7,11]', 0),
(61, '', 'Avalanche Rune', 'adori mas frigo', 0, 1, 0, 0, 530, 3, 0, 0, 0, 0, 0, '[2,6,10]', 0),
(62, '', 'Blank Rune', 'adori blank', 0, 1, 0, 0, 50, 1, 0, 0, 0, 0, 0, '[2,6,10,3,7,11,1,5,9]', 0),
(63, '', 'Chameleon Rune', 'adevo ina', 0, 1, 0, 0, 600, 2, 0, 0, 0, 0, 0, '[2,6,10]', 0),
(64, '', 'Conjure Arrow', 'exevo con', 0, 1, 0, 0, 100, 1, 0, 0, 0, 0, 0, '[3,7,11]', 0),
(65, '', 'Conjure Bolt', 'exevo con mort', 0, 1, 0, 0, 140, 2, 0, 0, 0, 0, 0, '[3,7,11]', 0),
(66, '', 'Conjure Explosive Arrow', 'exevo con flam', 0, 1, 0, 0, 290, 3, 0, 0, 0, 0, 0, '[3,7,11]', 0),
(67, '', 'Conjure Piercing Bolt', 'exevo con grav', 0, 1, 0, 0, 180, 3, 0, 0, 0, 0, 0, '[3,7,11]', 0),
(68, '', 'Conjure Poisoned Arrow', 'exevo con pox', 0, 1, 0, 0, 130, 2, 0, 0, 0, 0, 0, '[3,7,11]', 0),
(69, '', 'Conjure Power Bolt', 'exevo con vis', 0, 1, 0, 0, 700, 4, 0, 0, 0, 0, 0, '[7,11]', 0),
(70, '', 'Conjure Sniper Arrow', 'exevo con hur', 0, 1, 0, 0, 160, 3, 0, 0, 0, 0, 0, '[3,7,11]', 0),
(71, '', 'Convince Creature Rune', 'adeta sio', 0, 1, 0, 0, 200, 3, 0, 0, 0, 0, 0, '[2,6,10]', 0),
(72, '', 'Cure Poison Rune', 'adana pox', 0, 1, 0, 0, 200, 1, 0, 0, 0, 0, 0, '[2,6,10]', 0),
(73, '', 'Destroy Field Rune', 'adito grav', 0, 1, 0, 0, 120, 2, 0, 0, 0, 0, 0, '[1,2,3,5,9,6,10,7,11]', 0),
(74, '', 'Disintegrate Rune', 'adito tera', 0, 1, 0, 0, 200, 3, 0, 0, 0, 0, 0, '[1,2,3,5,9,6,10,7,11]', 0),
(75, '', 'Energy Bomb Rune', 'adevo mas vis', 0, 1, 0, 0, 880, 5, 0, 0, 0, 0, 0, '[1,5,9]', 0),
(76, '', 'Energy Field Rune', 'adevo grav vis', 0, 1, 0, 0, 320, 2, 0, 0, 0, 0, 0, '[1,2,5,9,6,10]', 0),
(77, '', 'Energy Wall Rune', 'adevo mas grav vis', 0, 1, 0, 0, 1000, 5, 0, 0, 0, 0, 0, '[1,2,5,9,6,10]', 0),
(78, '', 'Explosion Rune', 'adevo mas hur', 0, 1, 0, 0, 570, 4, 0, 0, 0, 0, 0, '[1,2,5,9,6,10]', 0),
(79, '', 'Fire Field Rune', 'adevo grav flam', 0, 1, 0, 0, 240, 1, 0, 0, 0, 0, 0, '[1,2,5,9,6,10]', 0),
(80, '', 'Fire Bomb Rune', 'adevo mas flam', 0, 1, 0, 0, 600, 4, 0, 0, 0, 0, 0, '[1,2,5,9,6,10]', 0),
(81, '', 'Fire Wall Rune', 'adevo mas grav flam', 0, 1, 0, 0, 780, 4, 0, 0, 0, 0, 0, '[1,2,5,9,6,10]', 0),
(82, '', 'Fireball Rune', 'adori flam', 0, 1, 0, 0, 460, 3, 0, 0, 0, 0, 0, '[1,5,9]', 0),
(83, '', 'Great Fireball Rune', 'adori mas flam', 0, 1, 0, 0, 530, 3, 0, 0, 0, 0, 0, '[1,5,9]', 0),
(84, '', 'Heavy Magic Missile Rune', 'adori vis', 0, 1, 0, 0, 350, 2, 0, 0, 0, 0, 0, '[1,5,9,2,6,10]', 0),
(85, '', 'Holy Missile Rune', 'adori san', 0, 1, 0, 0, 300, 3, 0, 0, 0, 0, 0, '[3,7,11]', 0),
(86, '', 'Icicle Rune', 'adori frigo', 0, 1, 0, 0, 460, 3, 0, 0, 0, 0, 0, '[2,6,10]', 0),
(87, '', 'Intense Healing Rune', 'adura gran', 0, 1, 0, 0, 120, 2, 0, 0, 0, 0, 0, '[2,6,10]', 0),
(88, '', 'Magic Wall Rune', 'adevo grav tera', 0, 1, 0, 0, 750, 5, 0, 0, 0, 0, 0, '[1,5,9]', 0),
(89, '', 'Paralyze Rune', 'adana ani', 0, 1, 0, 0, 1400, 3, 0, 0, 0, 0, 0, '[2,6,10]', 0),
(90, '', 'Poison Bomb Rune', 'adevo mas pox', 0, 1, 0, 0, 520, 2, 0, 0, 0, 0, 0, '[2,6,10]', 0),
(91, '', 'Poison Field Rune', 'adevo grav pox', 0, 1, 0, 0, 200, 1, 0, 0, 0, 0, 0, '[1,2,5,9,6,10]', 0),
(92, '', 'Poison Wall Rune', 'adevo mas grav pox', 0, 1, 0, 0, 640, 3, 0, 0, 0, 0, 0, '[1,2,5,9,6,10]', 0),
(93, '', 'Practice Magic Missile Rune', 'adori dis min vis', 0, 1, 0, 0, 5, 0, 0, 0, 0, 0, 0, '[0]', 0),
(94, '', 'Soulfire Rune', 'adevo res flam', 0, 1, 0, 0, 420, 3, 0, 0, 0, 0, 0, '[1,2,5,9,6,10]', 0),
(95, '', 'Stalagmite Rune', 'adori tera', 0, 1, 0, 0, 350, 2, 0, 0, 0, 0, 0, '[1,5,9,2,6,10]', 0),
(96, '', 'Stone Shower Rune', 'adori mas tera', 0, 1, 0, 0, 430, 3, 0, 0, 0, 0, 0, '[2,6,10]', 0),
(97, '', 'Sudden Death Rune', 'adori gran mort', 0, 1, 0, 0, 985, 5, 0, 0, 0, 0, 0, '[1,5,9]', 0),
(98, '', 'Thunderstorm Rune', 'adori mas vis', 0, 1, 0, 0, 430, 3, 0, 0, 0, 0, 0, '[1,5,9]', 0),
(99, '', 'Ultimate Healing Rune', 'adura vita', 0, 1, 0, 0, 400, 3, 0, 0, 0, 0, 0, '[2,6,10]', 0),
(100, '', 'Wild Growth Rune', 'adevo grav vita', 0, 1, 0, 0, 600, 5, 0, 0, 0, 0, 0, '[2,6,10]', 0),
(101, '', 'House Door List', 'aleta grav', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '[]', 0),
(102, '', 'House Guest List', 'aleta sio', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '[]', 0),
(103, '', 'House Kick', 'alana sio', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '[]', 0),
(104, '', 'House Subowner List', 'aleta som', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '[]', 0),
(105, '', 'Thunder Death Rune Rune', '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 2263, 0, '[1,2,5,9,6,10]', 0),
(106, '', 'Thunder Mana Rune Rune', '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 2272, 0, '[1,2,5,9,6,10]', 0),
(107, '', 'Avalanche Rune Rune', '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 2274, 0, '[]', 0),
(108, '', 'Energy Bomb Rune Rune', '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 2262, 0, '[]', 0),
(109, '', 'Energy Field Rune Rune', '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 2277, 0, '[]', 0),
(110, '', 'Energy Wall Rune Rune', '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 2279, 0, '[]', 0),
(111, '', 'Explosion Rune Rune', '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 2313, 0, '[]', 0),
(112, '', 'Fire Bomb Rune Rune', '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 2305, 0, '[]', 0),
(113, '', 'Fire Field Rune Rune', '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 2301, 0, '[]', 0),
(114, '', 'Fire Wall Rune Rune', '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 2303, 0, '[]', 0),
(115, '', 'Fireball Rune Rune', '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 2302, 0, '[]', 0),
(116, '', 'Great Fireball Rune Rune', '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 2304, 0, '[]', 0),
(117, '', 'Heavy Magic Missile Rune Rune', '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 2311, 0, '[]', 0),
(118, '', 'Holy Missile Rune Rune', '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 2295, 0, '[3,7]', 0),
(119, '', 'Icicle Rune Rune', '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 2271, 0, '[]', 0),
(120, '', 'Magic Wall Rune Rune', '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 2293, 0, '[]', 0),
(121, '', 'Poison Bomb Rune Rune', '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 2286, 0, '[]', 0),
(122, '', 'Poison Field Rune Rune', '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 2285, 0, '[]', 0),
(123, '', 'Poison Wall Rune Rune', '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 2289, 0, '[]', 0),
(124, '', 'Soulfire Rune Rune', '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 2308, 0, '[]', 0),
(125, '', 'Stalagmite Rune Rune', '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 2292, 0, '[]', 0),
(126, '', 'Stone Shower Rune Rune', '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 2288, 0, '[]', 0),
(127, '', 'Sudden Death Rune Rune', '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 2268, 0, '[]', 0),
(128, '', 'Thunderstorm Rune Rune', '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 2315, 0, '[]', 0),
(129, '', 'Cure Poison Rune Rune', '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 2266, 0, '[]', 0),
(130, '', 'Intense Healing Rune Rune', '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 2265, 0, '[]', 0),
(131, '', 'Ultimate Healing Rune Rune', '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 2273, 0, '[]', 0),
(132, '', 'Animate Dead Rune Rune', '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 2316, 0, '[]', 0),
(133, '', 'Convince Creature Rune Rune', '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 2290, 0, '[]', 0),
(134, '', 'Chameleon Rune Rune', '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 2291, 0, '[]', 0),
(135, '', 'Disintegrate Rune Rune', '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 2310, 0, '[]', 0),
(136, '', 'Destroy Field Rune Rune', '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 2261, 0, '[]', 0),
(137, '', 'Wild Growth Rune Rune', '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 2269, 0, '[2,6,10]', 0),
(138, '', 'Paralyze Rune Rune', '', 0, 3, 0, 0, 1400, 0, 0, 0, 0, 2278, 0, '[2,6,10]', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `myaac_videos`
--

CREATE TABLE `myaac_videos` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `youtube_id` varchar(20) NOT NULL,
  `author` varchar(50) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT 0,
  `hidden` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `myaac_visitors`
--

CREATE TABLE `myaac_visitors` (
  `ip` varchar(45) NOT NULL,
  `lastvisit` int(11) NOT NULL DEFAULT 0,
  `page` varchar(2048) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `myaac_weapons`
--

CREATE TABLE `myaac_weapons` (
  `id` int(11) NOT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `maglevel` int(11) NOT NULL DEFAULT 0,
  `vocations` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `myaac_weapons`
--

INSERT INTO `myaac_weapons` (`id`, `level`, `maglevel`, `vocations`) VALUES
(1294, 0, 0, '[]'),
(2111, 0, 0, '[]'),
(2181, 26, 0, '{\"2\":true}'),
(2182, 7, 0, '{\"2\":true}'),
(2183, 33, 0, '{\"2\":true}'),
(2184, 0, 0, '{\"2\":true,\"1\":true}'),
(2185, 19, 0, '{\"2\":true}'),
(2186, 13, 0, '{\"2\":true}'),
(2187, 33, 0, '{\"1\":true}'),
(2188, 19, 0, '{\"1\":true}'),
(2189, 26, 0, '{\"1\":true}'),
(2190, 7, 0, '{\"1\":true}'),
(2191, 13, 0, '{\"1\":true}'),
(2377, 20, 0, '{\"4\":true}'),
(2378, 0, 0, '{\"4\":true}'),
(2381, 25, 0, '[]'),
(2387, 25, 0, '{\"4\":true}'),
(2389, 0, 0, '[]'),
(2390, 140, 0, '{\"4\":true}'),
(2391, 50, 0, '{\"4\":true}'),
(2392, 30, 0, '[]'),
(2393, 55, 0, '{\"4\":true}'),
(2396, 0, 0, '[]'),
(2399, 0, 0, '[]'),
(2400, 80, 0, '[]'),
(2407, 30, 0, '[]'),
(2408, 120, 0, '{\"4\":true}'),
(2410, 0, 0, '[]'),
(2413, 0, 0, '{\"4\":true}'),
(2414, 60, 0, '[]'),
(2415, 95, 0, '{\"4\":true}'),
(2421, 85, 0, '[]'),
(2423, 20, 0, '[]'),
(2424, 45, 0, '[]'),
(2425, 20, 0, '[]'),
(2426, 25, 0, '[]'),
(2427, 55, 0, '[]'),
(2429, 20, 0, '[]'),
(2430, 25, 0, '[]'),
(2431, 90, 0, '[]'),
(2432, 35, 0, '[]'),
(2434, 25, 0, '[]'),
(2435, 20, 0, '[]'),
(2436, 30, 0, '[]'),
(2438, 30, 0, '[]'),
(2440, 25, 0, '{\"4\":true}'),
(2443, 70, 0, '{\"4\":true}'),
(2444, 65, 0, '{\"4\":true}'),
(2445, 35, 0, '[]'),
(2446, 45, 0, '[]'),
(2447, 50, 0, '{\"4\":true}'),
(2451, 35, 0, '[]'),
(2452, 70, 0, '{\"4\":true}'),
(2453, 75, 0, '[]'),
(2454, 65, 0, '{\"4\":true}'),
(2543, 0, 0, '[]'),
(2544, 0, 0, '[]'),
(2545, 0, 0, '[]'),
(2546, 0, 0, '[]'),
(2547, 55, 0, '[]'),
(3961, 40, 0, '[]'),
(3962, 30, 0, '[]'),
(3965, 20, 0, '[]'),
(5803, 75, 0, '{\"3\":true}'),
(6528, 75, 0, '{\"4\":true}'),
(6529, 110, 0, '[]'),
(6553, 75, 0, '{\"4\":true}'),
(7363, 30, 0, '[]'),
(7364, 20, 0, '[]'),
(7365, 40, 0, '[]'),
(7366, 0, 0, '[]'),
(7367, 0, 0, '{\"3\":true}'),
(7368, 80, 0, '[]'),
(7378, 25, 0, '[]'),
(7379, 25, 0, '[]'),
(7380, 35, 0, '{\"4\":true}'),
(7381, 20, 0, '[]'),
(7382, 60, 0, '{\"4\":true}'),
(7383, 50, 0, '[]'),
(7384, 60, 0, '[]'),
(7385, 20, 0, '[]'),
(7386, 40, 0, '{\"4\":true}'),
(7387, 25, 0, '[]'),
(7388, 55, 0, '[]'),
(7389, 60, 0, '[]'),
(7390, 75, 0, '[]'),
(7391, 50, 0, '{\"4\":true}'),
(7392, 35, 0, '[]'),
(7402, 45, 0, '{\"4\":true}'),
(7403, 65, 0, '{\"4\":true}'),
(7404, 40, 0, '[]'),
(7405, 70, 0, '{\"4\":true}'),
(7406, 35, 0, '{\"4\":true}'),
(7407, 30, 0, '{\"4\":true}'),
(7408, 25, 0, '[]'),
(7409, 50, 0, '[]'),
(7410, 55, 0, '[]'),
(7411, 50, 0, '[]'),
(7412, 45, 0, '[]'),
(7413, 40, 0, '{\"4\":true}'),
(7414, 60, 0, '{\"4\":true}'),
(7415, 60, 0, '[]'),
(7416, 55, 0, '[]'),
(7417, 65, 0, '[]'),
(7418, 70, 0, '[]'),
(7419, 40, 0, '[]'),
(7420, 70, 0, '[]'),
(7421, 65, 0, '[]'),
(7422, 75, 0, '[]'),
(7423, 85, 0, '{\"4\":true}'),
(7424, 30, 0, '[]'),
(7425, 20, 0, '[]'),
(7426, 40, 0, '[]'),
(7427, 45, 0, '[]'),
(7428, 55, 0, '{\"4\":true}'),
(7429, 75, 0, '[]'),
(7430, 30, 0, '[]'),
(7431, 80, 0, '[]'),
(7432, 20, 0, '[]'),
(7433, 65, 0, '[]'),
(7434, 75, 0, '[]'),
(7435, 85, 0, '[]'),
(7436, 45, 0, '{\"4\":true}'),
(7437, 30, 0, '[]'),
(7449, 25, 0, '{\"4\":true}'),
(7450, 120, 0, '{\"4\":true}'),
(7451, 35, 0, '[]'),
(7452, 30, 0, '{\"4\":true}'),
(7453, 85, 0, '{\"4\":true}'),
(7454, 30, 0, '{\"4\":true}'),
(7455, 80, 0, '[]'),
(7456, 35, 0, '[]'),
(7744, 0, 0, '[]'),
(7745, 50, 0, '[]'),
(7746, 60, 0, '[]'),
(7747, 35, 0, '{\"4\":true}'),
(7748, 45, 0, '{\"4\":true}'),
(7749, 20, 0, '[]'),
(7750, 25, 0, '[]'),
(7751, 60, 0, '[]'),
(7752, 35, 0, '{\"4\":true}'),
(7753, 65, 0, '{\"4\":true}'),
(7754, 20, 0, '[]'),
(7755, 35, 0, '[]'),
(7756, 60, 0, '[]'),
(7757, 35, 0, '[]'),
(7758, 50, 0, '{\"4\":true}'),
(7763, 0, 0, '[]'),
(7764, 50, 0, '[]'),
(7765, 60, 0, '[]'),
(7766, 35, 0, '{\"4\":true}'),
(7767, 45, 0, '{\"4\":true}'),
(7768, 20, 0, '[]'),
(7769, 25, 0, '[]'),
(7770, 60, 0, '[]'),
(7771, 35, 0, '{\"4\":true}'),
(7772, 65, 0, '{\"4\":true}'),
(7773, 20, 0, '[]'),
(7774, 35, 0, '[]'),
(7775, 60, 0, '[]'),
(7776, 35, 0, '[]'),
(7777, 50, 0, '{\"4\":true}'),
(7838, 20, 0, '[]'),
(7839, 20, 0, '[]'),
(7840, 20, 0, '[]'),
(7850, 20, 0, '[]'),
(7854, 0, 0, '[]'),
(7855, 50, 0, '[]'),
(7856, 60, 0, '[]'),
(7857, 35, 0, '{\"4\":true}'),
(7858, 45, 0, '{\"4\":true}'),
(7859, 20, 0, '[]'),
(7860, 25, 0, '[]'),
(7861, 60, 0, '[]'),
(7862, 35, 0, '{\"4\":true}'),
(7863, 65, 0, '{\"4\":true}'),
(7864, 20, 0, '[]'),
(7865, 35, 0, '[]'),
(7866, 60, 0, '[]'),
(7867, 35, 0, '[]'),
(7868, 50, 0, '{\"4\":true}'),
(7869, 0, 0, '[]'),
(7870, 50, 0, '[]'),
(7871, 60, 0, '[]'),
(7872, 0, 0, '{\"4\":true}'),
(7873, 45, 0, '{\"4\":true}'),
(7874, 20, 0, '[]'),
(7875, 25, 0, '[]'),
(7876, 60, 0, '[]'),
(7877, 35, 0, '{\"4\":true}'),
(7878, 0, 0, '{\"4\":true}'),
(7879, 0, 0, '{\"2\":true,\"1\":true}'),
(7880, 35, 0, '[]'),
(7881, 60, 0, '[]'),
(7882, 0, 0, '{\"4\":true}'),
(7883, 50, 0, '{\"4\":true}'),
(8849, 45, 0, '{\"3\":true}'),
(8850, 60, 0, '{\"3\":true}'),
(8851, 130, 0, '{\"3\":true}'),
(8852, 100, 0, '{\"3\":true}'),
(8853, 80, 0, '{\"3\":true}'),
(8854, 80, 0, '{\"3\":true}'),
(8855, 50, 0, '{\"3\":true}'),
(8856, 60, 0, '{\"3\":true}'),
(8857, 40, 0, '{\"3\":true}'),
(8858, 0, 0, '{\"3\":true}'),
(8910, 42, 0, '{\"2\":true}'),
(8911, 22, 0, '{\"2\":true}'),
(8912, 37, 0, '{\"2\":true}'),
(8920, 37, 0, '{\"1\":true}'),
(8921, 22, 0, '{\"1\":true}'),
(8922, 42, 0, '{\"1\":true}'),
(8924, 110, 0, '[]'),
(8925, 130, 0, '[]'),
(8926, 120, 0, '{\"4\":true}'),
(8927, 120, 0, '[]'),
(8928, 100, 0, '[]'),
(8929, 100, 0, '{\"4\":true}'),
(8930, 100, 0, '[]'),
(8931, 120, 0, '[]'),
(8932, 100, 0, '{\"4\":true}'),
(11305, 60, 0, '[]'),
(11306, 50, 0, '{\"4\":true}'),
(11307, 55, 0, '[]'),
(11308, 55, 0, '{\"4\":true}'),
(11309, 20, 0, '{\"4\":true}'),
(11323, 25, 0, '[]');

-- --------------------------------------------------------

--
-- Estrutura da tabela `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL DEFAULT 1,
  `account_id` int(11) NOT NULL DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 1,
  `vocation` int(11) NOT NULL DEFAULT 0,
  `health` int(11) NOT NULL DEFAULT 150,
  `healthmax` int(11) NOT NULL DEFAULT 150,
  `experience` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `lookbody` int(11) NOT NULL DEFAULT 0,
  `lookfeet` int(11) NOT NULL DEFAULT 0,
  `lookhead` int(11) NOT NULL DEFAULT 0,
  `looklegs` int(11) NOT NULL DEFAULT 0,
  `looktype` int(11) NOT NULL DEFAULT 136,
  `lookaddons` int(11) NOT NULL DEFAULT 0,
  `direction` tinyint(3) UNSIGNED NOT NULL DEFAULT 2,
  `maglevel` int(11) NOT NULL DEFAULT 0,
  `mana` int(11) NOT NULL DEFAULT 0,
  `manamax` int(11) NOT NULL DEFAULT 0,
  `manaspent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `soul` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `town_id` int(11) NOT NULL DEFAULT 1,
  `posx` int(11) NOT NULL DEFAULT 0,
  `posy` int(11) NOT NULL DEFAULT 0,
  `posz` int(11) NOT NULL DEFAULT 0,
  `conditions` blob DEFAULT NULL,
  `cap` int(11) NOT NULL DEFAULT 400,
  `sex` int(11) NOT NULL DEFAULT 0,
  `lastlogin` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `lastip` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `save` tinyint(4) NOT NULL DEFAULT 1,
  `skull` tinyint(4) NOT NULL DEFAULT 0,
  `skulltime` bigint(20) NOT NULL DEFAULT 0,
  `lastlogout` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `blessings` tinyint(4) NOT NULL DEFAULT 0,
  `onlinetime` bigint(20) NOT NULL DEFAULT 0,
  `deletion` bigint(20) NOT NULL DEFAULT 0,
  `balance` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `stamina` smallint(5) UNSIGNED NOT NULL DEFAULT 2520,
  `skill_fist` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `skill_fist_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_club` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `skill_club_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_sword` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `skill_sword_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_axe` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `skill_axe_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_dist` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `skill_dist_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_shielding` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `skill_shielding_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_fishing` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `skill_fishing_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `created` int(11) NOT NULL DEFAULT 0,
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  `comment` text NOT NULL,
  `autoloot` blob DEFAULT NULL,
  `online_time` int(11) DEFAULT 0,
  `marriage_status` tinyint(1) NOT NULL DEFAULT 0,
  `marriage_spouse` int(11) NOT NULL DEFAULT -1,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `description` varchar(255) NOT NULL DEFAULT '',
  `create_ip` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `create_date` int(11) NOT NULL DEFAULT 0,
  `hide_char` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `players`
--

INSERT INTO `players` (`id`, `name`, `group_id`, `account_id`, `level`, `vocation`, `health`, `healthmax`, `experience`, `lookbody`, `lookfeet`, `lookhead`, `looklegs`, `looktype`, `lookaddons`, `direction`, `maglevel`, `mana`, `manamax`, `manaspent`, `soul`, `town_id`, `posx`, `posy`, `posz`, `conditions`, `cap`, `sex`, `lastlogin`, `lastip`, `save`, `skull`, `skulltime`, `lastlogout`, `blessings`, `onlinetime`, `deletion`, `balance`, `stamina`, `skill_fist`, `skill_fist_tries`, `skill_club`, `skill_club_tries`, `skill_sword`, `skill_sword_tries`, `skill_axe`, `skill_axe_tries`, `skill_dist`, `skill_dist_tries`, `skill_shielding`, `skill_shielding_tries`, `skill_fishing`, `skill_fishing_tries`, `created`, `hidden`, `comment`, `autoloot`, `online_time`, `marriage_status`, `marriage_spouse`, `deleted`, `description`, `create_ip`, `create_date`, `hide_char`) VALUES
(2, 'Rook Sample', 1, 2, 1, 0, 150, 150, 0, 118, 114, 38, 57, 130, 0, 2, 0, 0, 0, 0, 100, 1, 1000, 1000, 7, '', 400, 1, 1712013386, 2130706433, 1, 0, 0, 1712013386, 0, 0, 0, 0, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 1712013386, 1, '', NULL, 0, 0, -1, 0, '', 0, 0, 0),
(3, 'Sorcerer Sample', 1, 2, 8, 1, 185, 185, 4200, 118, 114, 38, 57, 130, 0, 2, 0, 90, 90, 0, 100, 1, 1000, 1000, 7, '', 470, 1, 1712013386, 2130706433, 1, 0, 0, 1712013386, 0, 0, 0, 0, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 1712013386, 1, '', NULL, 0, 0, -1, 0, '', 0, 0, 0),
(4, 'Druid Sample', 1, 2, 8, 2, 185, 185, 4200, 118, 114, 38, 57, 130, 0, 2, 0, 90, 90, 0, 100, 1, 1000, 1000, 7, '', 470, 1, 1712013386, 2130706433, 1, 0, 0, 1712013386, 0, 0, 0, 0, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 1712013386, 1, '', NULL, 0, 0, -1, 0, '', 0, 0, 0),
(5, 'Paladin Sample', 1, 2, 8, 3, 185, 185, 4200, 118, 114, 38, 57, 129, 0, 2, 0, 90, 90, 0, 100, 1, 1000, 1000, 7, '', 470, 1, 1712013386, 2130706433, 1, 0, 0, 1712013386, 0, 0, 0, 0, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 1712013386, 1, '', NULL, 0, 0, -1, 0, '', 0, 0, 0),
(6, 'Knight Sample', 1, 2, 8, 4, 185, 185, 4200, 118, 114, 38, 57, 131, 0, 2, 0, 90, 90, 0, 100, 1, 1000, 1000, 7, '', 470, 1, 1712013386, 2130706433, 1, 0, 0, 1712013386, 0, 0, 0, 0, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 1712013386, 1, '', NULL, 0, 0, -1, 0, '', 0, 0, 0),
(8, 'Account Manager', 1, 3, 8, 0, 185, 185, 4200, 44, 98, 15, 76, 128, 0, 2, 0, 35, 35, 0, 100, 1, 991, 1210, 7, '', 420, 0, 1712015501, 16777343, 1, 0, 0, 1712015505, 31, 4, 0, 0, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, 0, '', '', 0, 0, -1, 0, '', 0, 0, 0),
(9, '[ADM] Vortex Eternal', 5, 3, 8, 1, 185, 185, 4200, 118, 114, 38, 57, 75, 0, 2, 0, 90, 90, 0, 100, 2, 728, 1379, 7, '', 470, 1, 1712015967, 16777343, 1, 0, 0, 1712015977, 31, 99, 0, 0, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, 0, '', '', 0, 0, -1, 0, '', 2130706433, 1712015530, 0);

--
-- Acionadores `players`
--
DELIMITER $$
CREATE TRIGGER `ondelete_players` BEFORE DELETE ON `players` FOR EACH ROW BEGIN
    UPDATE `houses` SET `owner` = 0 WHERE `owner` = OLD.`id`;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `players_online`
--

CREATE TABLE `players_online` (
  `player_id` int(11) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `players_online`
--

INSERT INTO `players_online` (`player_id`) VALUES
(9);

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_deaths`
--

CREATE TABLE `player_deaths` (
  `player_id` int(11) NOT NULL,
  `time` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 1,
  `killed_by` varchar(255) NOT NULL,
  `is_player` tinyint(4) NOT NULL DEFAULT 1,
  `mostdamage_by` varchar(100) NOT NULL,
  `mostdamage_is_player` tinyint(4) NOT NULL DEFAULT 0,
  `unjustified` tinyint(4) NOT NULL DEFAULT 0,
  `mostdamage_unjustified` tinyint(4) NOT NULL DEFAULT 0,
  `bless` int(11) NOT NULL DEFAULT 0,
  `aol` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_depotitems`
--

CREATE TABLE `player_depotitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL COMMENT 'any given range eg 0-100 will be reserved for depot lockers and all > 100 will be then normal items inside depots',
  `pid` int(11) NOT NULL DEFAULT 0,
  `itemtype` smallint(5) UNSIGNED NOT NULL,
  `count` smallint(6) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_depotlockeritems`
--

CREATE TABLE `player_depotlockeritems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL COMMENT 'any given range eg 0-100 will be reserved for depot lockers and all > 100 will be then normal items inside depots',
  `pid` int(11) NOT NULL DEFAULT 0,
  `itemtype` smallint(6) NOT NULL,
  `count` smallint(6) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_inboxitems`
--

CREATE TABLE `player_inboxitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT 0,
  `itemtype` smallint(5) UNSIGNED NOT NULL,
  `count` smallint(6) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_items`
--

CREATE TABLE `player_items` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `pid` int(11) NOT NULL DEFAULT 0,
  `sid` int(11) NOT NULL DEFAULT 0,
  `itemtype` smallint(5) UNSIGNED NOT NULL,
  `count` smallint(6) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `player_items`
--

INSERT INTO `player_items` (`player_id`, `pid`, `sid`, `itemtype`, `count`, `attributes`) VALUES
(9, 1, 101, 2457, 1, ''),
(9, 2, 102, 2173, 1, 0x160100),
(9, 3, 103, 1988, 1, ''),
(9, 4, 104, 2463, 1, ''),
(9, 5, 105, 2516, 1, ''),
(9, 7, 106, 2647, 1, ''),
(9, 8, 107, 2195, 1, ''),
(9, 9, 108, 2124, 1, ''),
(9, 103, 109, 2120, 1, ''),
(9, 103, 110, 2554, 1, ''),
(9, 103, 111, 7618, 1, 0x0f01),
(9, 103, 112, 7620, 1, 0x0f01),
(9, 103, 113, 2160, 5, 0x0f05),
(9, 103, 114, 2789, 50, 0x0f32);

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_misc`
--

CREATE TABLE `player_misc` (
  `player_id` int(11) NOT NULL,
  `info` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `player_misc`
--

INSERT INTO `player_misc` (`player_id`, `info`) VALUES
(8, 0x7b7d),
(10, 0x7b7d),
(7, 0x7b7d),
(9, 0x7b7d);

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_namelocks`
--

CREATE TABLE `player_namelocks` (
  `player_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `namelocked_at` bigint(20) NOT NULL,
  `namelocked_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_spells`
--

CREATE TABLE `player_spells` (
  `player_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_storage`
--

CREATE TABLE `player_storage` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `key` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `value` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `player_storage`
--

INSERT INTO `player_storage` (`player_id`, `key`, `value`) VALUES
(8, 48900, 0),
(8, 48901, 0),
(8, 81056, 0),
(8, 81057, 1),
(8, 891642, 0),
(9, 48900, 0),
(9, 48901, 0),
(9, 81056, 0),
(9, 81057, 1),
(9, 891642, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_storeinboxitems`
--

CREATE TABLE `player_storeinboxitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT 0,
  `itemtype` smallint(5) UNSIGNED NOT NULL,
  `count` smallint(6) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `server_config`
--

CREATE TABLE `server_config` (
  `config` varchar(50) NOT NULL,
  `value` varchar(256) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `server_config`
--

INSERT INTO `server_config` (`config`, `value`) VALUES
('db_version', '38'),
('motd_hash', '97d3dfb974176f27f7533eed1a1ef05b30ef39f3'),
('motd_num', '2'),
('players_record', '1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `snake_game`
--

CREATE TABLE `snake_game` (
  `id` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `points` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `snowballwar`
--

CREATE TABLE `snowballwar` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `score` int(11) NOT NULL,
  `data` varchar(255) NOT NULL,
  `hora` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tile_store`
--

CREATE TABLE `tile_store` (
  `house_id` int(11) NOT NULL,
  `data` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tile_store`
--

INSERT INTO `tile_store` (`house_id`, `data`) VALUES
(1, 0xea03c6040701000000d52300),
(1, 0xe803cb040701000000851e00),
(1, 0xe903cb040701000000861e00),
(2, 0xdf03cb040701000000851e00),
(2, 0xe203c6040701000000d52300),
(2, 0xe003cb040701000000861e00),
(3, 0xd903c6040701000000d52300),
(3, 0xda03cb040701000000851e00),
(3, 0xdb03cb040701000000861e00),
(4, 0xcd03cb040701000000851e00),
(4, 0xce03cb040701000000861e00),
(4, 0xd003c6040701000000d52300),
(5, 0xbf03c9040701000000680600),
(5, 0xc003c6040701000000d52300),
(5, 0xc203c7040701000000851e00),
(5, 0xc303c7040701000000861e00),
(5, 0xc103c8040701000000d32300),
(6, 0xb403c6040701000000d52300),
(6, 0xb603c7040701000000851e00),
(6, 0xb703c7040701000000861e00),
(6, 0xb303c9040701000000680600),
(6, 0xb503c8040701000000d32300),
(14, 0xbd03ca040601000000831e00),
(14, 0xbd03cb040601000000841e00),
(14, 0xc203c9040601000000d32300),
(15, 0xb203c7040601000000851e00),
(15, 0xb303c7040601000000861e00),
(15, 0xb603c9040601000000d32300),
(16, 0xa503c6040701000000d52300),
(16, 0xa203ca040701000000831e00),
(16, 0xa203cb040701000000841e00),
(17, 0xa203bf040701000000d32300),
(17, 0xa503bf040701000000d32300),
(17, 0xa003c1040701000000851e00),
(17, 0xa103c1040701000000861e00),
(18, 0xa003b3040701000000851e00),
(18, 0xa103b3040701000000861e00),
(18, 0xa103b5040701000000d52300),
(18, 0xa503b6040701000000d32300),
(19, 0xa003ab040701000000831e00),
(19, 0xa003ac040701000000841e00),
(19, 0xa503ad040701000000d32300),
(20, 0xab03af040701000000831e00),
(20, 0xae03ac040701000000d52300),
(20, 0xab03b0040701000000841e00),
(21, 0xa103a0040701000000851e00),
(21, 0xa203a0040701000000861e00),
(21, 0xa203a3040701000000d52300),
(21, 0xa603a4040701000000d32300),
(22, 0xaf03a0040701000000831e00),
(22, 0xaf03a1040701000000841e00),
(22, 0xb103a5040701000000d52300),
(23, 0xa10398040701000000851e00),
(23, 0xa20398040701000000861e00),
(23, 0xa6039a040701000000d32300),
(24, 0xab038a040601000000831e00),
(24, 0xab038b040601000000841e00),
(24, 0xad038a040601000000831e00),
(24, 0xad038b040601000000841e00),
(24, 0xae038a040601000000831e00),
(24, 0xae038b040601000000841e00),
(24, 0xa6038d040701000000831e00),
(24, 0xa6038e040701000000841e00),
(24, 0xa9038f040701000000d32300),
(24, 0xae038e040601000000d52300),
(24, 0xb0038a040601000000831e00),
(24, 0xb0038b040601000000841e00),
(24, 0xb2038f040701000000d32300),
(24, 0xb5038d040701000000831e00),
(24, 0xb5038e040701000000841e00),
(24, 0xae0396040701000000d52300),
(25, 0xbc038c040701000000d52300),
(25, 0xb90391040701000000831e00),
(25, 0xb90392040701000000841e00),
(26, 0xc20393040701000000851e00),
(26, 0xc30393040701000000861e00),
(26, 0xc80393040701000000851e00),
(26, 0xc90393040701000000861e00),
(26, 0xc60396040701000000d52300),
(26, 0xc60399040701000000d52300),
(27, 0xb90396040701000000831e00),
(27, 0xb90397040701000000841e00),
(27, 0xbc039c040701000000d52300),
(28, 0xcf038f040701000000831e00),
(28, 0xd2038f040701000000831e00),
(28, 0xcf0390040701000000841e00),
(28, 0xd20390040701000000841e00),
(28, 0xd30395040701000000d52300),
(29, 0xc20389040701000000831e00),
(29, 0xc2038a040701000000841e00),
(29, 0xc50389040701000000831e00),
(29, 0xc5038a040701000000841e00),
(29, 0xc4038c040701000000d52300),
(29, 0xca038d040701000000d32300),
(30, 0xcd0387040701000000831e00),
(30, 0xcd0388040701000000841e00),
(30, 0xd0038b040701000000d52300),
(31, 0xd60387040701000000831e00),
(31, 0xd60388040701000000841e00),
(31, 0xd9038b040701000000d52300),
(32, 0xdf0387040701000000831e00),
(32, 0xdf0388040701000000841e00),
(32, 0xe2038b040701000000d52300),
(33, 0xdc038f040701000000831e00),
(33, 0xe2038f040701000000831e00),
(33, 0xdc0390040701000000841e00),
(33, 0xdf0395040701000000d52300),
(33, 0xe20390040701000000841e00),
(34, 0xe80392040701000000d52300),
(34, 0xef0392040701000000d52300),
(34, 0xe603950406010000008b1e00),
(34, 0xe603960406010000008c1e00),
(34, 0xea03950406010000008b1e00),
(34, 0xea03960406010000008c1e00),
(34, 0xeb0397040701000000d52300),
(34, 0xec03950406010000008b1e00),
(34, 0xec03960406010000008c1e00),
(34, 0xf003950406010000008b1e00),
(34, 0xf003960406010000008c1e00),
(35, 0xf90394040701000000831e00),
(35, 0xf90395040701000000841e00),
(35, 0xf80398040701000000d52300),
(36, 0x010494040701000000831e00),
(36, 0x010495040701000000841e00),
(36, 0x000498040701000000d52300),
(37, 0x090494040701000000831e00),
(37, 0x090495040701000000841e00),
(37, 0x080498040701000000d52300),
(38, 0x070488040701000000851e00),
(38, 0x080488040701000000861e00),
(38, 0x090488040701000000851e00),
(38, 0x0a0488040701000000861e00),
(38, 0x09048c040701000000d52300),
(38, 0x0b0490040701000000d52300),
(39, 0x0a049d040701000000831e00),
(39, 0x0a049e040701000000841e00),
(39, 0x0f04a0040701000000d32300),
(40, 0x06049d040701000000831e00),
(40, 0x06049e040701000000841e00),
(40, 0x0104a0040701000000d32300),
(41, 0xf9039d040701000000831e00),
(41, 0xf9039e040701000000841e00),
(41, 0xfe039e040701000000d32300),
(42, 0xf903a1040701000000831e00),
(42, 0xf903a2040701000000841e00),
(42, 0xfe03a2040701000000d32300),
(43, 0xf1039e040701000000d32300),
(43, 0xf6039d040701000000831e00),
(43, 0xf6039e040701000000841e00),
(44, 0xf103a2040701000000d32300),
(44, 0xf603a1040701000000831e00),
(44, 0xf603a2040701000000841e00),
(45, 0xe5039a040701000000831e00),
(45, 0xe5039b040701000000841e00),
(45, 0xe8039f040701000000d52300),
(46, 0xe903a3040701000000851e00),
(46, 0xea03a3040701000000861e00),
(46, 0xe603a5040701000000d52300),
(46, 0xe903a8040701000000d52300),
(49, 0xf803ab040701000000851e00),
(49, 0xf903ab040701000000861e00),
(49, 0xf903b0040701000000d52300),
(50, 0x0104b0040701000000851e00),
(50, 0x0204b0040701000000861e00),
(50, 0x0404b6040701000000d52300),
(51, 0x0604a7040701000000831e00),
(51, 0x0004aa040701000000d32300),
(51, 0x0604a8040701000000841e00),
(52, 0x0904a7040701000000831e00),
(52, 0x0904a8040701000000841e00),
(52, 0x0f04aa040701000000d32300),
(53, 0x0e04b0040701000000831e00),
(53, 0x0e04b1040701000000841e00),
(53, 0x0c04b6040701000000d52300),
(54, 0x0104b0040601000000831e00),
(54, 0x0104b1040601000000841e00),
(54, 0x0404b6040601000000d52300),
(55, 0x0e04bb040701000000831e00),
(55, 0x0704bd040701000000d32300),
(55, 0x0e04bc040701000000841e00),
(56, 0x0704c2040701000000d32300),
(56, 0x0e04c0040701000000831e00),
(56, 0x0e04c1040701000000841e00),
(57, 0xfd03c0040701000000831e00),
(57, 0xfd03c1040701000000841e00),
(57, 0x0304c2040701000000d32300),
(58, 0xfd03bb040701000000831e00),
(58, 0xfd03bc040701000000841e00),
(58, 0x0304bd040701000000d32300),
(59, 0xf403b7040701000000831e00),
(59, 0xf403b8040701000000841e00),
(59, 0xf403bb040701000000d32300),
(59, 0xf703b9040701000000d52300),
(60, 0xf403c2040701000000d32300),
(60, 0xf803c3040701000000851e00),
(60, 0xf903c3040701000000861e00),
(62, 0xd603a7040601000000851e00),
(62, 0xd703a7040601000000861e00),
(62, 0xde03a7040601000000d52300),
(63, 0xd603a3040701000000831e00),
(63, 0xde03a3040701000000831e00),
(63, 0xd603a4040701000000841e00),
(63, 0xda03a7040701000000d52300),
(63, 0xde03a4040701000000841e00),
(64, 0xd7039a040701000000851e00),
(64, 0xd8039a040701000000861e00),
(64, 0xda039f040701000000d52300),
(65, 0xcd039d040701000000851e00),
(65, 0xce039d040701000000861e00),
(65, 0xd1039f040701000000d32300),
(66, 0xcd03a5040701000000d52300),
(66, 0xca03a9040701000000851e00),
(66, 0xcb03a9040701000000861e00),
(68, 0xc303ad040601000000831e00),
(68, 0xc303ae040601000000841e00),
(68, 0xc103ac040701000000d52300),
(69, 0xba03ad040601000000831e00),
(69, 0xba03ae040601000000841e00),
(69, 0xb803ac040701000000d52300),
(70, 0xb603a0040701000000831e00),
(70, 0xb603a1040701000000841e00),
(70, 0xb903a5040701000000d52300),
(71, 0xc003a0040701000000831e00),
(71, 0xc003a1040701000000841e00),
(71, 0xc303a5040701000000d52300),
(72, 0xaf03a0040601000000831e00),
(72, 0xaf03a1040601000000841e00),
(72, 0xb103a5040601000000d52300),
(73, 0xb603a0040601000000851e00),
(73, 0xb703a0040601000000861e00),
(73, 0xb903a5040601000000d52300),
(74, 0xc003a0040601000000851e00),
(74, 0xc103a0040601000000861e00),
(74, 0xc303a5040601000000d52300),
(75, 0xab03b4040601000000851e00),
(75, 0xac03b4040601000000861e00),
(75, 0xad03b6040601000000d32300),
(76, 0xb003b6040601000000d32300),
(76, 0xb103b4040601000000851e00),
(76, 0xb203b4040601000000861e00),
(77, 0xab03b9040601000000851e00),
(77, 0xac03b9040601000000861e00),
(77, 0xad03bb040601000000d32300),
(78, 0xb003bb040601000000d32300),
(78, 0xb103b9040601000000851e00),
(78, 0xb203b9040601000000861e00),
(79, 0xab03b9040701000000851e00),
(79, 0xac03b9040701000000861e00),
(79, 0xad03bb040701000000d32300),
(80, 0xab03b4040701000000851e00),
(80, 0xac03b4040701000000861e00),
(80, 0xad03b6040701000000d32300),
(81, 0xb003b6040701000000d32300),
(81, 0xb103b4040701000000851e00),
(81, 0xb203b4040701000000861e00),
(82, 0xb003bb040701000000d32300),
(82, 0xb103b9040701000000851e00),
(82, 0xb203b9040701000000861e00),
(84, 0xcf038f040601000000851e00),
(84, 0xd0038f040601000000861e00),
(84, 0xd10395040601000000d52300),
(85, 0xd4038f040601000000851e00),
(85, 0xd5038f040601000000861e00),
(85, 0xd60395040601000000d52300),
(86, 0xf803ab040601000000851e00),
(86, 0xf903ab040601000000861e00),
(86, 0xf903b0040601000000d52300),
(87, 0xf403b7040601000000851e00),
(87, 0xf503b7040601000000861e00),
(87, 0xf703ba040601000000d52300),
(87, 0xf703be040601000000d52300),
(88, 0xfd03bb040601000000851e00),
(88, 0xfe03bb040601000000861e00),
(88, 0x0004c2040601000000d52300),
(89, 0x0804bb040601000000851e00),
(89, 0x0904bb040601000000861e00),
(89, 0x0a04bb040601000000851e00),
(89, 0x0b04bb040601000000861e00),
(89, 0x0a04be040601000000d52300),
(89, 0x0b04c2040601000000d52300),
(90, 0xa103a0040601000000851e00),
(90, 0xa203a0040601000000861e00),
(90, 0xa303a6040601000000d52300),
(91, 0xa10398040601000000831e00),
(91, 0xa10399040601000000841e00),
(91, 0xa4039a040601000000d32300),
(97, 0xc90270050601000000f71a00),
(97, 0xc80273050701000000ee1a00),
(97, 0xc90270050701000000f71a00),
(97, 0xc90272050701000000f71a00),
(97, 0xcb0273050701000000711b00),
(97, 0xce0270050601000000721b00),
(97, 0xcc0271050701000000831e00),
(97, 0xcc0272050701000000841e00),
(97, 0xcd0271050701000000871e00),
(97, 0xcd0272050701000000881e00),
(97, 0xcd0273050701000000711b00),
(97, 0xce0270050701000000721b00),
(97, 0xce0272050701000000721b00),
(98, 0xd70276050601000000f71a00),
(98, 0xd40276050701000000f71a00),
(98, 0xd40277050701000000721b00),
(98, 0xd70275050701000000f71a00),
(98, 0xdb0276050601000000721b00),
(98, 0xd90277050701000000871e00),
(98, 0xda0277050701000000871e00),
(98, 0xdb0275050701000000f71a00),
(98, 0xdb0276050701000000721b00),
(98, 0xd60279050701000000711b00),
(98, 0xd90278050701000000881e00),
(98, 0xd90279050701000000711b00),
(98, 0xda0278050701000000881e00),
(99, 0xd6027e050601000000f71a00),
(99, 0xd4027d050701000000f71a00),
(99, 0xd4027e050701000000721b00),
(99, 0xd7027e050701000000871e00),
(99, 0xd7027f050701000000881e00),
(99, 0xd9027d050601000000721b00),
(99, 0xd9027f050601000000721b00),
(99, 0xd8027e050701000000871e00),
(99, 0xd8027f050701000000881e00),
(99, 0xd9027d050701000000721b00),
(99, 0xd9027f050701000000721b00),
(99, 0xd60280050701000000711b00),
(99, 0xd80280050601000000711b00),
(99, 0xd80280050701000000711b00),
(100, 0xca027b050701000000f71a00),
(100, 0xcc0279050701000000ee1a00),
(100, 0xce027b050701000000721b00),
(100, 0xc7027f050601000000721b00),
(100, 0xca027f050601000000f71a00),
(100, 0xc8027e050701000000871e00),
(100, 0xc8027f050701000000881e00),
(100, 0xc9027e050701000000871e00),
(100, 0xc9027f050701000000881e00),
(100, 0xcc027c050601000000ee1a00),
(100, 0xce027f050601000000721b00),
(100, 0xcc027c050701000000ee1a00),
(100, 0xce027f050701000000721b00),
(100, 0xc90280050601000000711b00),
(100, 0xc90280050701000000711b00),
(100, 0xcb0280050701000000711b00),
(100, 0xcd0280050601000000711b00),
(100, 0xcd0280050701000000711b00),
(101, 0xbc0279050701000000ee1a00),
(101, 0xbf027a050701000000871e00),
(101, 0xbf027b050701000000881e00),
(101, 0xbb027c050701000000ee1a00),
(101, 0xbc027f050701000000711b00),
(101, 0xbe027f050701000000711b00),
(101, 0xbf027d050701000000871e00),
(101, 0xbf027e050701000000881e00),
(101, 0xc0027b050701000000721b00),
(101, 0xc0027d050701000000721b00),
(102, 0xb30279050701000000711b00),
(102, 0xb40279050701000000ee1a00),
(102, 0xb3027c050701000000ee1a00),
(102, 0xb3027f050701000000711b00),
(102, 0xb4027e050701000000f71a00),
(102, 0xb5027f050701000000711b00),
(102, 0xb6027d050701000000871e00),
(102, 0xb6027e050701000000881e00),
(102, 0xb7027e050701000000721b00),
(103, 0xaf0279050701000000ee1a00),
(103, 0xad027d050701000000871e00),
(103, 0xad027e050701000000881e00),
(103, 0xae027d050701000000871e00),
(103, 0xae027e050701000000881e00),
(103, 0xae027f050701000000711b00),
(103, 0xb0027b050701000000ee1a00),
(103, 0xb0027f050701000000711b00),
(104, 0xad026e050701000000871e00),
(104, 0xad026f050701000000881e00),
(104, 0xb0026f050701000000f71a00),
(104, 0xae0270050701000000ee1a00),
(104, 0xae0273050701000000711b00),
(104, 0xaf0273050701000000ee1a00),
(104, 0xb00272050701000000721b00),
(105, 0x9f0275050701000000871e00),
(105, 0x9f0276050701000000881e00),
(105, 0xa20273050701000000f71a00),
(105, 0xa00274050701000000ee1a00),
(105, 0xa10277050701000000711b00),
(105, 0xa40277050701000000711b00),
(105, 0xa50274050701000000f71a00),
(105, 0xa50275050701000000721b00),
(106, 0x9f026c050701000000871e00),
(106, 0x9f026d050701000000881e00),
(106, 0xa0026b050701000000ee1a00),
(106, 0xa2026a050701000000f71a00),
(106, 0xa5026b050701000000f71a00),
(106, 0xa1026e050701000000711b00),
(106, 0xa4026e050701000000711b00),
(106, 0xa5026c050701000000721b00),
(107, 0xad0263050701000000871e00),
(107, 0xae0263050701000000871e00),
(107, 0xae0265050601000000711b00),
(107, 0xad0264050701000000881e00),
(107, 0xae0264050701000000881e00),
(107, 0xae0265050701000000711b00),
(107, 0xb20262050601000000721b00),
(107, 0xb00263050701000000f71a00),
(107, 0xb30260050701000000ee1a00),
(107, 0xb40262050701000000721b00),
(107, 0xb10265050601000000711b00),
(107, 0xb20264050601000000721b00),
(107, 0xb20265050701000000711b00),
(107, 0xb40264050701000000721b00),
(108, 0xbe0262050601000000ee1a00),
(108, 0xbe0262050701000000ee1a00),
(108, 0xbb0265050601000000711b00),
(108, 0xbb0265050701000000711b00),
(108, 0xbe0265050601000000711b00),
(108, 0xbf0264050601000000721b00),
(108, 0xbc0264050701000000f71a00),
(108, 0xbe0265050701000000711b00),
(108, 0xbf0264050701000000721b00),
(109, 0xd00262050701000000871e00),
(109, 0xd00263050701000000881e00),
(109, 0xd30263050701000000f71a00),
(109, 0xd10264050701000000ee1a00),
(109, 0xd10267050701000000711b00),
(109, 0xd20267050701000000ee1a00),
(109, 0xd30266050701000000721b00),
(110, 0xcd0257050601000000711b00),
(110, 0xce0257050601000000ee1a00),
(110, 0xcd0257050701000000ee1a00),
(110, 0xcd025a050701000000711b00),
(110, 0xce025a050701000000ee1a00),
(110, 0xd00256050601000000f71a00),
(110, 0xd00256050701000000f71a00),
(110, 0xd20257050701000000ee1a00),
(110, 0xd30255050701000000871e00),
(110, 0xd30256050701000000881e00),
(110, 0xd40256050701000000741b00),
(111, 0x9e0255050701000000fe0e00),
(111, 0x9f0255050701000000ff0e00),
(111, 0xa002560507010000003c1900),
(111, 0xa202540507010000003d1900),
(111, 0xa20255050701000000db0d00),
(112, 0x9e024d050701000000fe0e00),
(112, 0x9f024d050701000000ff0e00),
(112, 0xa2024e0507010000003d1900),
(112, 0xa2024f050701000000db0d00),
(112, 0xa002500507010000003c1900),
(113, 0xaa0244050701000000fc0e00),
(113, 0xaa0245050701000000fd0e00),
(113, 0xab02450507010000003d1900),
(113, 0xa80248050701000000d20d00),
(114, 0xaf0248050701000000d20d00),
(114, 0xb10244050701000000fc0e00),
(114, 0xb10245050701000000fd0e00),
(114, 0xb202450507010000003d1900),
(115, 0xae0244050601000000fe0e00),
(115, 0xaf0244050601000000ff0e00),
(115, 0xaf0247050601000000d20d00),
(115, 0xb202460506010000003b1900),
(116, 0xa70244050601000000fe0e00),
(116, 0xa80244050601000000ff0e00),
(116, 0xa80247050601000000d20d00),
(116, 0xab02460506010000003b1900),
(117, 0x9e024d050601000000fe0e00),
(117, 0x9f024d050601000000ff0e00),
(117, 0xa1024e050601000000db0d00),
(118, 0x9e0255050601000000fe0e00),
(118, 0x9f0255050601000000ff0e00),
(118, 0xa10254050601000000db0d00),
(119, 0xd0041d050601000000d70400),
(120, 0xdd041d050601000000d70400),
(121, 0xe0041a050601000000d70400),
(122, 0xcc041a050601000000d70400),
(123, 0xd504070506010000008d1e00),
(123, 0xd604070506010000008e1e00),
(123, 0xd4040c050601000000d50400),
(124, 0xcf040d0506010000008d1e00),
(124, 0xd20409050601000000d50400),
(124, 0xd0040d0506010000008e1e00),
(125, 0xdd040b0505010000008b1e00),
(125, 0xdf040b0505010000008b1e00),
(125, 0xdd040c0505010000008c1e00),
(125, 0xde040f050501000000d70400),
(125, 0xdf040c0505010000008c1e00),
(125, 0xe0040d050501000000371900),
(125, 0xdd0411050601000000361900),
(125, 0xde0411050601000000d70400),
(126, 0xe1040e050601000000de0600),
(126, 0xe1040f050601000000df0600),
(126, 0xe4040f050601000000371900),
(126, 0xe20411050601000000d70400),
(126, 0xe30411050601000000361900),
(127, 0xe9040b0506010000008b1e00),
(127, 0xe9040c0506010000008c1e00),
(127, 0xeb0411050601000000d70400),
(128, 0xef040b050601000000de0600),
(128, 0xef040c050601000000df0600),
(128, 0xf10411050601000000d70400),
(129, 0xea040f050501000000d50400),
(129, 0xed040d0505010000008b1e00),
(129, 0xed040e0505010000008c1e00),
(129, 0xef040d0505010000008b1e00),
(129, 0xef040e0505010000008c1e00),
(130, 0xb7041f050601000000371900),
(130, 0xb8041c050601000000361900),
(130, 0xb8041f050601000000dc0600),
(130, 0xb9041c050601000000d70400),
(130, 0xb9041f050601000000dd0600),
(131, 0xbd041d0506010000008d1e00),
(131, 0xbd041f0506010000008d1e00),
(131, 0xbe041d0506010000008e1e00),
(131, 0xbe041f0506010000008e1e00),
(131, 0xc0041c050601000000d70400),
(132, 0xc1041a050601000000d50400),
(132, 0xc20418050601000000dc0600),
(132, 0xc30418050601000000dd0600),
(133, 0xc00419050501000000d70400),
(133, 0xc1041a050501000000de0600),
(133, 0xc1041b050501000000df0600),
(134, 0xd104090505010000008b1e00),
(134, 0xd1040a0505010000008c1e00),
(134, 0xd3040c050501000000d70400),
(135, 0xb50402050401000000d50400),
(135, 0xb80402050501000000411900),
(135, 0xb20404050401000000891e00),
(135, 0xb304040504010000008a1e00),
(135, 0xb30405050501000000401900),
(135, 0xb50404050501000000d50400),
(136, 0xb4040b050401000000891e00),
(136, 0xb5040b0504010000008a1e00),
(136, 0xb6040a050401000000d50400),
(136, 0xb50408050501000000d70400),
(137, 0xc30400050301000000871e00),
(137, 0xc30401050301000000881e00),
(137, 0xc40401050301000000411900),
(137, 0xc40400050401000000d50400),
(137, 0xc50403050401000000411900),
(137, 0xc20404050401000000401900),
(138, 0xcb04f60403010000008b1e00),
(138, 0xcb04f70403010000008c1e00),
(138, 0xc904f9040401000000401900),
(138, 0xcb04f8040401000000d70400),
(139, 0xe104fe040601000000361900),
(139, 0xe204fe040601000000d70400),
(139, 0xe304ff0406010000008b1e00),
(139, 0xe20400050501000000d50400),
(139, 0xe20401050601000000361900),
(139, 0xe304000506010000008c1e00),
(139, 0xe40400050601000000371900),
(140, 0xe704ff040601000000d50400),
(140, 0xea04fe040601000000de0600),
(140, 0xea04ff040601000000df0600),
(140, 0xea0401050601000000361900),
(141, 0xe804fe040501000000de0600),
(141, 0xe804ff040501000000df0600),
(141, 0xeb04fe040501000000d50400),
(141, 0xeb0400050501000000371900),
(142, 0xe804f2040501000000871e00),
(142, 0xe804f3040501000000881e00),
(142, 0xeb04f2040501000000871e00),
(142, 0xeb04f3040501000000881e00),
(142, 0xea04f8040501000000d70400),
(143, 0xf404f8040501000000d50400),
(143, 0xf604fa040501000000361900),
(143, 0xf804f8040501000000de0600),
(143, 0xf804f9040501000000df0600),
(143, 0xf904f8040501000000371900),
(144, 0xea04f3040401000000d70400),
(144, 0xe804f40404010000008b1e00),
(144, 0xe804f50404010000008c1e00),
(144, 0xec04f5040401000000371900),
(145, 0xd804ed040601000000361900),
(145, 0xd804ee040601000000de0600),
(145, 0xd804ef040601000000df0600),
(145, 0xda04ed040601000000d70400),
(145, 0xdc04ef040601000000371900),
(146, 0xd504f2040601000000d70400),
(146, 0xd704f2040601000000361900),
(146, 0xd804f3040601000000de0600),
(146, 0xd704f5040601000000361900),
(146, 0xd804f4040601000000df0600),
(147, 0xea04f1040601000000d70400),
(147, 0xec04f1040601000000361900),
(147, 0xec04f2040601000000871e00),
(147, 0xec04f3040601000000881e00),
(148, 0xdf04f2040601000000d70400),
(148, 0xdc04f5040601000000891e00),
(148, 0xdc04f7040601000000891e00),
(148, 0xdd04f50406010000008a1e00),
(148, 0xdd04f70406010000008a1e00),
(149, 0xde04f7040701000000de0600),
(149, 0xde04f8040701000000df0600),
(149, 0xe104f9040701000000d50400),
(150, 0xde04f2040701000000de0600),
(150, 0xde04f3040701000000df0600),
(150, 0xe104f4040701000000d50400),
(151, 0xde04ee040701000000de0600),
(151, 0xde04ef040701000000df0600),
(151, 0xe104ef040701000000d50400),
(152, 0xe604ef040701000000d50400),
(152, 0xe904ee040701000000de0600),
(152, 0xe904ef040701000000df0600),
(153, 0xe904f2040701000000de0600),
(153, 0xe904f3040701000000df0600),
(153, 0xe604f4040701000000d50400),
(154, 0xe904f7040701000000de0600),
(154, 0xe604f9040701000000d50400),
(154, 0xe904f8040701000000df0600),
(155, 0xa80422050701000000dc0600),
(155, 0xa90422050701000000dd0600),
(155, 0xac0424050701000000d50400),
(156, 0x0105d5040701000000dc0600),
(156, 0x0205d5040701000000dd0600),
(156, 0x0205d7040701000000d20400),
(157, 0xfc04cd040701000000dc0600),
(157, 0xfd04cd040701000000dd0600),
(157, 0xfc04d4040701000000d70400),
(158, 0x0305ce040701000000de0600),
(158, 0x0305cf040701000000df0600),
(158, 0x0805d3040701000000d20400),
(159, 0xfd041f050701000000cf0400),
(159, 0xfe041d050701000000de0600),
(159, 0xfe041e050701000000df0600),
(160, 0xeb041b050601000000de0600),
(160, 0xe7041d050601000000d50400),
(160, 0xeb041c050601000000df0600),
(161, 0xe00427050601000000d70400),
(162, 0xcc0427050601000000d70400),
(163, 0xe80387040701000000831e00),
(163, 0xe80388040701000000841e00),
(163, 0xeb038b040701000000d52300),
(164, 0xe10387050701000000d50400),
(164, 0xe20384050701000000dc0600),
(164, 0xe30384050701000000dd0600),
(165, 0xe90384050701000000dc0600),
(165, 0xea0384050701000000dd0600),
(165, 0xeb0387050701000000d50400),
(165, 0xe90388050701000000de0600),
(165, 0xe90389050701000000df0600),
(165, 0xea0388050701000000de0600),
(165, 0xea0389050701000000df0600),
(165, 0xed038a050701000000d70400),
(166, 0xe5037c050701000000d70400),
(166, 0xe20381050701000000de0600),
(166, 0xe20382050701000000df0600),
(166, 0xe50380050701000000d70400),
(166, 0xe70381050701000000de0600),
(166, 0xe70382050701000000df0600),
(167, 0xec037c050701000000d70400),
(167, 0xea0380050701000000d70400),
(167, 0xeb0381050701000000de0600),
(167, 0xeb0382050701000000df0600),
(167, 0xed0380050701000000d70400),
(167, 0xee0381050701000000de0600),
(167, 0xee0382050701000000df0600),
(168, 0xfc037a050701000000d70400),
(168, 0xfd0378050701000000dc0600),
(168, 0xfd0379050701000000dc0600),
(168, 0xfe0378050701000000dd0600),
(168, 0xfe0379050701000000dd0600),
(168, 0xfb037e050701000000d70400),
(169, 0xf8036e050701000000d50400),
(169, 0xfc036c050701000000de0600),
(169, 0xfc036d050701000000df0600),
(170, 0xfc035f050701000000de0600),
(170, 0xf80361050701000000d50400),
(170, 0xfc0360050701000000df0600),
(171, 0xdf0350050701000000de0600),
(171, 0xdf0351050701000000df0600),
(171, 0xdf0352050701000000de0600),
(171, 0xdf0353050701000000df0600),
(171, 0xe30354050701000000d70400),
(172, 0xe4034d050701000000de0600),
(172, 0xe4034e050701000000df0600),
(172, 0xe8034d050701000000d50400),
(173, 0xde034d050701000000d50400),
(173, 0xe1034b050701000000dc0600),
(173, 0xe2034b050701000000dd0600),
(174, 0xd1034d050701000000de0600),
(174, 0xd1034e050701000000df0600),
(174, 0xd5034d050701000000d50400),
(175, 0xcc0350050701000000de0600),
(175, 0xcc0351050701000000df0600),
(175, 0xcc0352050701000000de0600),
(175, 0xcc0353050701000000df0600),
(175, 0xd00354050701000000d70400),
(176, 0xce034b050701000000dc0600),
(176, 0xcf034b050701000000dd0600),
(176, 0xcb034d050701000000d50400),
(177, 0xbe034d050701000000de0600),
(177, 0xbe034e050701000000df0600),
(177, 0xc2034d050701000000d50400),
(178, 0xbe0359050701000000de0600),
(178, 0xbe035a050701000000df0600),
(178, 0xc20359050701000000d50400),
(179, 0xc20365050701000000dc0600),
(179, 0xc20366050701000000dc0600),
(179, 0xc30365050701000000dd0600),
(179, 0xc30366050701000000dd0600),
(179, 0xc10369050701000000d70400),
(180, 0xc00365050601000000de0600),
(180, 0xc00366050601000000df0600),
(180, 0xc30366050601000000d50400),
(181, 0xb2037e050701000000dc0600),
(181, 0xb3037e050701000000dd0600),
(181, 0xad0380050701000000d50400),
(181, 0xaf0383050701000000d70400),
(181, 0xb00380050701000000d50400),
(181, 0xb20381050701000000de0600),
(181, 0xb20382050701000000df0600),
(181, 0xb30381050701000000de0600),
(181, 0xb30382050701000000df0600),
(182, 0xae0388050701000000de0600),
(182, 0xae0389050701000000df0600),
(182, 0xaf0388050701000000de0600),
(182, 0xaf0389050701000000df0600),
(182, 0xb00385050701000000d50400),
(182, 0xb00387050701000000d50400),
(183, 0xa80384050701000000dc0600),
(183, 0xa90384050701000000dd0600),
(183, 0xad0385050701000000d50400),
(183, 0xa80388050701000000de0600),
(183, 0xa80389050701000000df0600),
(184, 0xaa0383050601000000dc0600),
(184, 0xab0383050601000000dd0600),
(184, 0xac0381050601000000d50400),
(185, 0xaa0385050601000000dc0600),
(185, 0xab0385050601000000dd0600),
(185, 0xac0387050601000000d50400),
(186, 0xaf0381050601000000d50400),
(186, 0xb00383050601000000dc0600),
(186, 0xb10383050601000000dd0600),
(187, 0xaf0387050601000000d50400),
(187, 0xb00385050601000000dc0600),
(187, 0xb10385050601000000dd0600),
(188, 0xac0382050501000000de0600),
(188, 0xac0383050501000000df0600),
(188, 0xb00384050501000000d50400),
(189, 0xe60384050601000000dc0600),
(189, 0xe70384050601000000dd0600),
(189, 0xe60388050601000000d70400),
(190, 0xe90384050601000000de0600),
(190, 0xe90385050601000000df0600),
(190, 0xed0386050601000000d50400),
(191, 0xe30381050601000000d50400),
(191, 0xe60382050601000000dc0600),
(191, 0xe70382050601000000dd0600),
(192, 0xe9037f050601000000de0600),
(192, 0xe90380050601000000df0600),
(192, 0xed0381050601000000d50400),
(193, 0xe80380050501000000d70400),
(193, 0xe60384050501000000de0600),
(193, 0xe60385050501000000df0600),
(193, 0xea0384050501000000de0600),
(193, 0xea0385050501000000df0600),
(194, 0xfb037a050601000000de0600),
(194, 0xfb037b050601000000df0600),
(194, 0xfe037b050601000000d50400),
(195, 0xe6036b050701000000660600),
(195, 0xe4036e050701000000de0600),
(195, 0xe4036f050701000000df0600),
(196, 0xec036b050701000000660600),
(196, 0xee036e050701000000de0600),
(196, 0xee036f050701000000df0600),
(197, 0xe4035f050701000000de0600),
(197, 0xe40360050701000000df0600),
(197, 0xe60363050701000000660600),
(198, 0xee035f050701000000de0600),
(198, 0xec0363050701000000660600),
(198, 0xee0360050701000000df0600),
(199, 0x2c0337040701000000831e00),
(199, 0x260338040701000000f41a00),
(199, 0x2c0338040701000000841e00),
(199, 0x2c033a040701000000831e00),
(199, 0x2c033b040701000000841e00),
(199, 0x2b033c040701000000711b00),
(200, 0x160337040701000000831e00),
(200, 0x1e0337040701000000f41a00),
(200, 0x160338040701000000841e00),
(200, 0x160339040701000000831e00),
(200, 0x16033a040701000000841e00),
(200, 0x18033b040701000000711b00),
(200, 0x1c033b040701000000ee1a00),
(200, 0x1d033b040701000000711b00),
(201, 0x300335040701000000871e00),
(201, 0x300336040701000000881e00),
(201, 0x330336040701000000f41a00),
(201, 0x330338040701000000721b00),
(202, 0x3c0336040701000000721b00),
(202, 0x370338040701000000f41a00),
(202, 0x3c033a040601000000721b00),
(203, 0x3c0346040701000000f71a00),
(203, 0x3f0344040701000000871e00),
(203, 0x3f0345040701000000881e00),
(203, 0x3f0347040701000000871e00),
(203, 0x3f0348040701000000881e00),
(203, 0x400345040601000000721b00),
(203, 0x400347040601000000721b00),
(204, 0x460347040701000000f41a00),
(204, 0x470348040601000000871e00),
(204, 0x470349040601000000881e00),
(204, 0x4b034a040601000000891e00),
(204, 0x4c034a0406010000008a1e00),
(204, 0x4f0348040601000000871e00),
(204, 0x4f0349040601000000881e00),
(204, 0x500344040701000000eb1a00),
(205, 0x3f034e040701000000871e00),
(205, 0x3f034f040701000000881e00),
(205, 0x42034c040701000000ee1a00),
(205, 0x45034d040601000000871e00),
(205, 0x45034e040601000000881e00),
(206, 0x48033d040701000000eb1a00),
(206, 0x49033d040701000000711b00),
(207, 0x2e0350040701000000eb1a00),
(208, 0x080342040701000000eb1a00),
(208, 0x090346040701000000831e00),
(208, 0x090347040701000000841e00),
(208, 0x0a0344040701000000721b00),
(208, 0x0a0347040701000000721b00),
(208, 0x090348040601000000711b00),
(209, 0x020339040701000000721b00),
(209, 0x00033f040701000000711b00),
(209, 0x02033c040701000000f41a00),
(210, 0x07032f040701000000721b00),
(210, 0x070330040701000000f41a00),
(210, 0x070331040701000000721b00),
(210, 0x0b0333040701000000711b00),
(211, 0x14032d040701000000eb1a00),
(211, 0x15032d040701000000711b00),
(211, 0x160332040701000000721b00),
(212, 0x1f0330040701000000f41a00),
(213, 0x0d0326040701000000711b00),
(213, 0x0f0326040701000000eb1a00),
(213, 0x110326040701000000711b00),
(214, 0x1e0322040701000000721b00),
(214, 0x180325040701000000711b00),
(214, 0x1a0325040701000000eb1a00),
(214, 0x1e0324040701000000721b00),
(215, 0x2e031f040601000000831e00),
(215, 0x2e031f040701000000831e00),
(215, 0x270322040701000000f41a00),
(215, 0x2e0320040601000000841e00),
(215, 0x2e0320040701000000841e00),
(215, 0x2f0321040701000000721b00),
(215, 0x2f0323040701000000721b00),
(215, 0x2b0326040701000000711b00),
(215, 0x2e0324040601000000831e00),
(215, 0x2e0325040601000000841e00),
(216, 0x0c031c040701000000f41a00),
(216, 0x12031c040601000000721b00),
(216, 0x12031c040701000000f41a00),
(217, 0x20030f040701000000721b00),
(217, 0x1a0313040701000000711b00),
(217, 0x1e0314040701000000eb1a00),
(218, 0x2a0317040701000000f41a00),
(219, 0x2c0317040701000000f41a00),
(220, 0x320316040701000000831e00),
(220, 0x320317040701000000841e00),
(220, 0x390319040701000000f41a00),
(221, 0x3e0316040701000000831e00),
(221, 0x3e0317040701000000841e00),
(221, 0x410314040701000000eb1a00),
(221, 0x440316040601000000741b00),
(222, 0x3e030e040701000000eb1a00),
(223, 0x2c030d040701000000eb1a00),
(224, 0x350420050701000000a61400),
(225, 0x170427050701000000a41400),
(225, 0x1b0425050701000000a41400),
(225, 0x1c0425050601000000a61400),
(226, 0x19042f050701000000a41400),
(227, 0x1c043a050701000000a61400),
(228, 0x22043a050701000000a61400),
(229, 0x190457050401000000c30400),
(230, 0x2f044e050601000000a41400),
(230, 0x32044d050601000000a41400),
(230, 0x36044e050501000000a41400),
(231, 0x49044d050701000000a61400),
(231, 0x52044b050601000000a61400),
(232, 0x3b042e050701000000a61400),
(232, 0x3d042c050601000000491900),
(232, 0x3d042d050701000000a41400),
(232, 0x3f042e050701000000a41400),
(233, 0x0c0420050701000000a61400),
(233, 0x0d0423050701000000a41400),
(234, 0xfe0333050701000000a41400),
(234, 0xfa0335050701000000dc0600),
(234, 0xfb0335050701000000dd0600),
(235, 0x0b0432050701000000a41400),
(235, 0x100436050701000000a61400),
(236, 0x5c045b050701000000a41400),
(237, 0xec0404040701000000a21400),
(238, 0xec040b040701000000a21400),
(239, 0xe904080406010000009f1400),
(239, 0xec040b040601000000491900),
(240, 0xe904060406010000009f1400),
(240, 0xec0404040601000000471900),
(241, 0x1205f5030601000000481900),
(241, 0x1305f50307010000009f1400),
(241, 0x1405f5030601000000461900),
(242, 0x0705260407010000009f1400),
(243, 0x0d05260407010000009f1400),
(244, 0x090523040601000000a11400),
(244, 0x070526040601000000461900),
(244, 0x080526040601000000461900),
(245, 0x0b0523040601000000a11400),
(245, 0x0d0526040601000000461900),
(245, 0x0e0526040601000000481900),
(246, 0xfe0423040501000000491900),
(246, 0xfe0423040601000000471900),
(246, 0xf804260406010000009f1400),
(246, 0xfe0425040501000000471900),
(246, 0xfc04260406010000009f1400),
(246, 0xfe0425040601000000471900),
(247, 0xf6042a040701000000a61400),
(248, 0xeb0421040701000000a41400),
(249, 0x0d0517040701000000a01400),
(249, 0x0e051a0406010000009f1400),
(249, 0x0f0518040601000000a31400),
(249, 0x0f0518040701000000a41400),
(249, 0x12051b040601000000481900),
(249, 0x130519040601000000491900),
(249, 0x13051a040601000000471900),
(250, 0x2e03e4040701000000da0600),
(250, 0x2e03e5040701000000db0600),
(250, 0x2f03e7040701000000261900),
(250, 0x3103e7040701000000bc0400),
(250, 0x3203e5040701000000111400),
(251, 0x2c03de040701000000261900),
(251, 0x2c03df040701000000e00600),
(251, 0x2d03df040701000000e10600),
(251, 0x2b03e1040701000000271900),
(251, 0x2c03e2040701000000e00600),
(251, 0x2d03e2040701000000e10600),
(251, 0x3203e2040701000000111400),
(251, 0x3303e1040701000000271900),
(252, 0x2e03e3040601000000da0600),
(252, 0x2d03e5040601000000271900),
(252, 0x2e03e4040601000000db0600),
(252, 0x3003e7040601000000261900),
(252, 0x3203e4040601000000111400),
(252, 0x3303e6040601000000271900),
(253, 0x2c03df040601000000da0600),
(253, 0x2f03de040601000000261900),
(253, 0x2b03e1040601000000271900),
(253, 0x2c03e0040601000000db0600),
(253, 0x3203e1040601000000111400),
(253, 0x3303e0040601000000271900),
(254, 0x3803e5040701000000481900),
(254, 0x3b03e60407010000009e1400),
(254, 0x3d03e6040701000000dc0600),
(254, 0x3e03e6040701000000dd0600),
(254, 0x3f03e7040701000000491900),
(254, 0x3603e8040701000000491900),
(254, 0x3803eb040701000000481900),
(254, 0x3b03eb040701000000481900),
(254, 0x3c03e8040701000000a11400),
(255, 0x3803e5040601000000261900),
(255, 0x3903e5040601000000bc0400),
(255, 0x3603e8040601000000271900),
(255, 0x3703e9040601000000da0600),
(255, 0x3703ea040601000000db0600),
(255, 0x3903eb040601000000261900),
(255, 0x3b03e9040601000000da0600),
(255, 0x3b03ea040601000000db0600),
(255, 0x3c03e9040601000000271900),
(256, 0x4603df040701000000261900),
(256, 0x4203e2040701000000271900),
(256, 0x4703e2040701000000141400),
(256, 0x4403e4040701000000dc0600),
(256, 0x4503e4040701000000dd0600),
(257, 0x4c03df040701000000481900),
(257, 0x4a03e3040701000000a41400),
(257, 0x4b03e0040701000000dc0600),
(257, 0x4c03e0040701000000dd0600),
(257, 0x4e03e3040701000000491900),
(258, 0x4e03d5040701000000de0600),
(258, 0x4e03d6040701000000df0600),
(258, 0x4f03d7040701000000491900),
(258, 0x4c03d9040701000000481900),
(258, 0x4d03d90407010000009e1400),
(259, 0x4303d1040701000000271900),
(259, 0x4303d2040701000000151400),
(259, 0x4903d1040701000000da0600),
(259, 0x4903d2040701000000db0600),
(259, 0x4903d3040701000000261900),
(259, 0x4603d4040701000000c50400),
(260, 0x4603cf040601000000dc0600),
(260, 0x4703cf040601000000dd0600),
(260, 0x4303d2040601000000271900),
(260, 0x4603d3040601000000bc0400),
(260, 0x4903d3040601000000261900),
(260, 0x4a03d2040601000000271900),
(261, 0x4903e2040601000000a41400),
(261, 0x4d03e2040601000000491900),
(261, 0x4d03e3040601000000a11400),
(261, 0x4a03e4040601000000dc0600),
(261, 0x4b03e4040601000000dd0600),
(262, 0x4503e7040601000000271900),
(262, 0x4703e5040601000000bc0400),
(262, 0x4a03e7040601000000271900),
(262, 0x4803e8040601000000dc0600),
(262, 0x4903e8040601000000dd0600),
(262, 0x4903e9040601000000261900),
(263, 0x8d03a7040701000000461900),
(263, 0x8b03a9040701000000471900),
(263, 0x8c03a8040701000000de0600),
(263, 0x8c03a9040701000000df0600),
(263, 0x8d03ab040701000000461900),
(263, 0x9003a9040701000000a41400),
(264, 0x8b03a3040701000000471900),
(264, 0x8c03a2040701000000dc0600),
(264, 0x8d03a1040701000000461900),
(264, 0x8d03a2040701000000dd0600),
(264, 0x8d03a5040701000000461900),
(264, 0x9003a3040701000000a41400),
(265, 0x8d039b040701000000461900),
(265, 0x8b039d040701000000471900),
(265, 0x8c039c040701000000de0600),
(265, 0x8c039d040701000000df0600),
(265, 0x8d039f040701000000461900),
(265, 0x90039d040701000000a41400),
(266, 0x97039d040701000000a41400),
(266, 0x99039c040701000000dc0600),
(266, 0x9a039c040701000000dd0600),
(267, 0x9703a3040701000000a41400),
(267, 0x9a03a2040701000000de0600),
(267, 0x9a03a3040701000000df0600),
(268, 0xc101470505010000008b1e00),
(268, 0xc401450505010000008d1e00),
(268, 0xc501450505010000008e1e00),
(268, 0xc801450505010000008d1e00),
(268, 0xc901450505010000008e1e00),
(268, 0xcc01470505010000008b1e00),
(268, 0xc101480505010000008c1e00),
(268, 0xcc01480505010000008c1e00),
(268, 0xc3014e0505010000008d1500),
(268, 0xc3014e0506010000008d1500),
(268, 0xca014e0505010000008d1500),
(268, 0xca014e0506010000008d1500),
(268, 0xc701500506010000008d1500),
(269, 0xc4015b0505010000008b1500),
(269, 0xc4015b0506010000008b1500),
(269, 0xc7015a0506010000008d1500),
(269, 0xc9015b0505010000008b1500),
(269, 0xc9015b0506010000008b1500),
(269, 0xc101600505010000008b1e00),
(269, 0xc101610505010000008c1e00),
(269, 0xcc01600505010000008b1e00),
(269, 0xcc01610505010000008c1e00),
(269, 0xc101640505010000008b1e00),
(269, 0xc101650505010000008c1e00),
(269, 0xcc01640505010000008b1e00),
(269, 0xcc01650505010000008c1e00),
(270, 0xc7016f0506010000008d1500),
(270, 0xc201720504010000008b1e00),
(270, 0xc201730504010000008c1e00),
(270, 0xc401700504010000008d1e00),
(270, 0xc501700504010000008e1e00),
(270, 0xc801700504010000008d1e00),
(270, 0xc901700504010000008e1e00),
(271, 0xd6016f0506010000008d1500),
(271, 0xd101720504010000008b1e00),
(271, 0xd101730504010000008c1e00),
(271, 0xd301700504010000008d1e00),
(271, 0xd401700504010000008e1e00),
(271, 0xd701700504010000008d1e00),
(271, 0xd801700504010000008e1e00),
(272, 0xe5016f0506010000008d1500),
(272, 0xe001720504010000008b1e00),
(272, 0xe001730504010000008c1e00),
(272, 0xe201700504010000008d1e00),
(272, 0xe301700504010000008e1e00),
(272, 0xe601700504010000008d1e00),
(272, 0xe701700504010000008e1e00),
(273, 0xf0016f0505010000008d1e00),
(273, 0xf1016f0505010000008e1e00),
(273, 0xf3016f0505010000008d1e00),
(273, 0xf4016f0505010000008e1e00),
(273, 0xf6016f0505010000008d1e00),
(273, 0xf7016f0505010000008e1e00),
(273, 0xf4016e0506010000008d1500),
(273, 0xed01730505010000008b1e00),
(273, 0xed01740505010000008c1e00),
(273, 0xfa01730505010000008b1e00),
(273, 0xfa01740505010000008c1e00),
(274, 0xf701630506010000008b1500),
(274, 0x0002600506010000008b1e00),
(274, 0x0002610506010000008c1e00),
(275, 0xf701560506010000008b1500),
(275, 0x0002530506010000008b1e00),
(275, 0x0002540506010000008c1e00),
(276, 0xf701450506010000008b1500),
(276, 0x0002420506010000008b1e00),
(276, 0x0002430506010000008c1e00),
(277, 0xe9012d0506010000008b1e00),
(277, 0xe9012e0506010000008c1e00),
(277, 0xea012c0506010000008d1e00),
(277, 0xeb012c0506010000008e1e00),
(277, 0xf0012e0505010000008b1500),
(277, 0xf0012e0506010000008b1500),
(277, 0xf1012c0506010000008b1e00),
(277, 0xf1012d0506010000008c1e00),
(277, 0xf6012e0505010000008b1500),
(277, 0xf5012c0506010000008b1e00),
(277, 0xf5012d0506010000008c1e00),
(277, 0xf6012e0506010000008b1500),
(277, 0xfa012c0506010000008d1e00),
(277, 0xfb012c0506010000008e1e00),
(277, 0xfc012d0506010000008b1e00),
(277, 0xfc012e0506010000008c1e00),
(277, 0xf301320506010000008d1500),
(277, 0xf001350505010000008b1500),
(277, 0xf001350506010000008b1500),
(277, 0xf601350505010000008b1500),
(277, 0xf601350506010000008b1500),
(277, 0xf301390506010000008d1500),
(278, 0xdc01290505010000008d1e00),
(278, 0xdd01290505010000008e1e00),
(278, 0xde01290505010000008d1e00),
(278, 0xdf01290505010000008e1e00),
(278, 0xdc012c0506010000008d1500),
(278, 0xdc01310506010000008d1500),
(279, 0xcc01230505010000008d1e00),
(279, 0xcd01230505010000008e1e00),
(279, 0xcf01230505010000008d1e00),
(279, 0xce012c0505010000008d1500),
(279, 0xce012f0506010000008b1500),
(279, 0xd001230505010000008e1e00),
(279, 0xcc01310506010000008d1500),
(280, 0xb601380504010000008d1e00),
(280, 0xb701380504010000008e1e00),
(280, 0xb4013a0505010000008b1e00),
(280, 0xb4013b0505010000008c1e00),
(280, 0xb601380505010000008d1e00),
(280, 0xb701380505010000008e1e00),
(280, 0xb4013c0504010000008b1e00),
(280, 0xb4013d0504010000008c1e00),
(280, 0xb4013e0505010000008b1e00),
(280, 0xb4013f0505010000008c1e00),
(280, 0xbf013d0504010000008b1500),
(280, 0xbf013d0505010000008b1500),
(280, 0xc0013d0506010000008b1500),
(280, 0xcb013d0506010000008b1500),
(280, 0xb601410504010000008d1e00),
(280, 0xb701410504010000008e1e00),
(280, 0xb601410505010000008d1e00),
(280, 0xb701410505010000008e1e00),
(281, 0xe701450506010000008b1500),
(281, 0xf001420506010000008b1e00),
(281, 0xf001430506010000008c1e00),
(282, 0xe701560506010000008b1500),
(282, 0xf001530506010000008b1e00),
(282, 0xf001540506010000008c1e00),
(283, 0xe701630506010000008b1500),
(283, 0xf001600506010000008b1e00),
(283, 0xf001610506010000008c1e00),
(284, 0xce017c0506010000008d1500),
(284, 0xd2017f0506010000008b1e00),
(284, 0xce01860506010000008d1500),
(284, 0xd201800506010000008c1e00),
(285, 0xde017c0506010000008d1500),
(285, 0xe2017f0506010000008b1e00),
(285, 0xde01860506010000008d1500),
(285, 0xe201800506010000008c1e00),
(286, 0xb501450507010000008b1e00),
(286, 0xb501460507010000008c1e00),
(286, 0xbb01480507010000008b1500),
(287, 0xc701450507010000008b1e00),
(287, 0xc701460507010000008c1e00),
(287, 0xc101480507010000008b1500),
(288, 0xb5013b0507010000008b1e00),
(288, 0xb5013c0507010000008c1e00),
(288, 0xbb013e0507010000008b1500),
(289, 0xc7013b0507010000008b1e00),
(289, 0xc1013e0507010000008b1500),
(289, 0xc7013c0507010000008c1e00),
(290, 0xd701400507010000008b1500),
(290, 0xda01420507010000008d1500),
(290, 0xdd01400507010000008b1500),
(290, 0xd301470507010000008b1e00),
(290, 0xd401470507010000008b1e00),
(290, 0xd301480507010000008c1e00),
(290, 0xd401480507010000008c1e00),
(290, 0xe001470507010000008b1e00),
(290, 0xe101470507010000008b1e00),
(290, 0xe001480507010000008c1e00),
(290, 0xe101480507010000008c1e00),
(291, 0xd301360507010000008d1e00),
(291, 0xd401360507010000008e1e00),
(291, 0xd701360507010000008d1e00),
(291, 0xd801360507010000008e1e00),
(291, 0xd601390507010000008d1500),
(291, 0xdc01390507010000008b1500),
(292, 0xd3012d0507010000008b1e00),
(292, 0xd3012e0507010000008c1e00),
(292, 0xd301320507010000008b1e00),
(292, 0xd301330507010000008c1e00),
(292, 0xdc01300507010000008b1500),
(293, 0xe6014a0507010000008b1500),
(293, 0xf201430507010000008b1e00),
(293, 0xf501430507010000008b1e00),
(293, 0xf201440507010000008c1e00),
(293, 0xf401460507010000008d1500),
(293, 0xf501440507010000008c1e00),
(293, 0xf2014f0507010000008b1e00),
(293, 0xf4014d0507010000008d1500),
(293, 0xf5014f0507010000008b1e00),
(293, 0xf201500507010000008c1e00),
(293, 0xf501500507010000008c1e00),
(294, 0xe7015d0507010000008b1500),
(295, 0xe701630508010000008b1e00),
(295, 0xe701650507010000008b1500),
(295, 0xe701640508010000008c1e00),
(296, 0xe7016b0508010000008b1e00),
(296, 0xe7016d0507010000008b1500),
(296, 0xe7016c0508010000008c1e00),
(297, 0xcb016c0507010000008b1500),
(297, 0xd401630507010000008b1500),
(297, 0xdc01680507010000008d1e00),
(297, 0xdc016b0507010000008d1e00),
(297, 0xdd01680507010000008e1e00),
(297, 0xdd016b0507010000008e1e00),
(297, 0xde01680507010000008d1e00),
(297, 0xde016b0507010000008d1e00),
(297, 0xdf01680507010000008e1e00),
(297, 0xdf016b0507010000008e1e00),
(297, 0xd0016c0507010000008b1500),
(297, 0xce01710507010000008d1500),
(298, 0xb403de040601000000711b00),
(298, 0xb403de040701000000711b00),
(298, 0xb803df040601000000871e00),
(298, 0xba03de040601000000711b00),
(298, 0xbb03df040601000000871e00),
(298, 0xb903de040701000000711b00),
(298, 0xb203e0040601000000721b00),
(298, 0xb203e0040701000000721b00),
(298, 0xb703e2040601000000f71a00),
(298, 0xb603e0040701000000f71a00),
(298, 0xb803e0040601000000881e00),
(298, 0xbb03e0040601000000881e00),
(298, 0xbc03e2040601000000871e00),
(298, 0xbc03e3040601000000881e00),
(298, 0xbd03e3040701000000f71a00),
(298, 0xb203e4040601000000721b00),
(298, 0xb403e6040601000000711b00),
(298, 0xb403e6040701000000711b00),
(298, 0xb903e6040601000000711b00),
(298, 0xba03e6040601000000ee1a00),
(298, 0xbb03e5040601000000891e00),
(298, 0xbb03e6040601000000711b00),
(298, 0xbc03e50406010000008a1e00),
(298, 0xbd03e4040601000000721b00),
(298, 0xbd03e4040701000000721b00),
(298, 0xb703e8040701000000721b00),
(298, 0xba03e9040701000000ee1a00),
(298, 0xbd03e8040701000000721b00);

-- --------------------------------------------------------

--
-- Estrutura da tabela `towns`
--

CREATE TABLE `towns` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `posx` int(11) NOT NULL DEFAULT 0,
  `posy` int(11) NOT NULL DEFAULT 0,
  `posz` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `towns`
--

INSERT INTO `towns` (`id`, `name`, `posx`, `posy`, `posz`) VALUES
(1, 'Thunder City', 991, 1210, 7),
(2, 'Jamila Island', 725, 1388, 7),
(3, 'Akravi', 980, 1413, 8),
(4, 'Al Arar', 1071, 1296, 7),
(5, 'Bhark', 1238, 1307, 3),
(6, 'Wintermere', 815, 1089, 7),
(7, 'Shadow Wood', 1312, 1011, 6),
(8, 'Premia', 474, 1364, 7);

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_forum`
--

CREATE TABLE `z_forum` (
  `id` int(11) NOT NULL,
  `first_post` int(11) NOT NULL DEFAULT 0,
  `last_post` int(11) NOT NULL DEFAULT 0,
  `section` int(3) NOT NULL DEFAULT 0,
  `replies` int(20) NOT NULL DEFAULT 0,
  `views` int(20) NOT NULL DEFAULT 0,
  `author_aid` int(20) NOT NULL DEFAULT 0,
  `author_guid` int(20) NOT NULL DEFAULT 0,
  `post_text` text NOT NULL,
  `post_topic` varchar(255) NOT NULL,
  `post_smile` tinyint(1) NOT NULL DEFAULT 0,
  `post_date` int(20) NOT NULL DEFAULT 0,
  `last_edit_aid` int(20) NOT NULL DEFAULT 0,
  `edit_date` int(20) NOT NULL DEFAULT 0,
  `post_ip` varchar(15) NOT NULL DEFAULT '0.0.0.0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_ots_comunication`
--

CREATE TABLE `z_ots_comunication` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `param1` varchar(255) NOT NULL,
  `param2` varchar(255) NOT NULL,
  `param3` varchar(255) NOT NULL,
  `param4` varchar(255) NOT NULL,
  `param5` varchar(255) NOT NULL,
  `param6` varchar(255) NOT NULL,
  `param7` varchar(255) NOT NULL,
  `delete_it` int(2) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_polls`
--

CREATE TABLE `z_polls` (
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `end` int(11) NOT NULL DEFAULT 0,
  `start` int(11) NOT NULL DEFAULT 0,
  `answers` int(11) NOT NULL DEFAULT 0,
  `votes_all` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_polls_answers`
--

CREATE TABLE `z_polls_answers` (
  `poll_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `votes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shop_history_item`
--

CREATE TABLE `z_shop_history_item` (
  `id` int(11) NOT NULL,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT 0,
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  `offer_id` varchar(255) NOT NULL DEFAULT '',
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT 0,
  `trans_real` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shop_offer`
--

CREATE TABLE `z_shop_offer` (
  `id` int(11) NOT NULL,
  `points` int(11) NOT NULL DEFAULT 0,
  `itemid1` int(11) NOT NULL DEFAULT 0,
  `count1` int(11) NOT NULL DEFAULT 0,
  `itemid2` int(11) NOT NULL DEFAULT 0,
  `count2` int(11) NOT NULL DEFAULT 0,
  `offer_type` varchar(255) DEFAULT NULL,
  `offer_description` text NOT NULL,
  `offer_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices para tabela `account_bans`
--
ALTER TABLE `account_bans`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `banned_by` (`banned_by`);

--
-- Índices para tabela `account_ban_history`
--
ALTER TABLE `account_ban_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `banned_by` (`banned_by`);

--
-- Índices para tabela `account_storage`
--
ALTER TABLE `account_storage`
  ADD PRIMARY KEY (`account_id`,`key`);

--
-- Índices para tabela `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD UNIQUE KEY `account_player_index` (`account_id`,`player_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices para tabela `coinbase_payments`
--
ALTER TABLE `coinbase_payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coinbase_payments_UN` (`code`),
  ADD KEY `coinbase_payments_account_id_IDX` (`account_id`);

--
-- Índices para tabela `guilds`
--
ALTER TABLE `guilds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `ownerid` (`ownerid`);

--
-- Índices para tabela `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warid` (`warid`);

--
-- Índices para tabela `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD PRIMARY KEY (`player_id`,`guild_id`),
  ADD KEY `guild_id` (`guild_id`);

--
-- Índices para tabela `guild_membership`
--
ALTER TABLE `guild_membership`
  ADD PRIMARY KEY (`player_id`),
  ADD KEY `guild_id` (`guild_id`),
  ADD KEY `rank_id` (`rank_id`);

--
-- Índices para tabela `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guild_id` (`guild_id`);

--
-- Índices para tabela `guild_wars`
--
ALTER TABLE `guild_wars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guild1` (`guild1`),
  ADD KEY `guild2` (`guild2`);

--
-- Índices para tabela `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner` (`owner`),
  ADD KEY `town_id` (`town_id`);

--
-- Índices para tabela `house_lists`
--
ALTER TABLE `house_lists`
  ADD KEY `house_id` (`house_id`);

--
-- Índices para tabela `ip_bans`
--
ALTER TABLE `ip_bans`
  ADD PRIMARY KEY (`ip`),
  ADD KEY `banned_by` (`banned_by`);

--
-- Índices para tabela `market_history`
--
ALTER TABLE `market_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`,`sale`);

--
-- Índices para tabela `market_offers`
--
ALTER TABLE `market_offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale` (`sale`,`itemtype`),
  ADD KEY `created` (`created`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices para tabela `myaac_account_actions`
--
ALTER TABLE `myaac_account_actions`
  ADD KEY `account_id` (`account_id`);

--
-- Índices para tabela `myaac_admin_menu`
--
ALTER TABLE `myaac_admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `myaac_bugtracker`
--
ALTER TABLE `myaac_bugtracker`
  ADD PRIMARY KEY (`uid`);

--
-- Índices para tabela `myaac_changelog`
--
ALTER TABLE `myaac_changelog`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `myaac_config`
--
ALTER TABLE `myaac_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices para tabela `myaac_faq`
--
ALTER TABLE `myaac_faq`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `myaac_forum`
--
ALTER TABLE `myaac_forum`
  ADD PRIMARY KEY (`id`),
  ADD KEY `section` (`section`);

--
-- Índices para tabela `myaac_forum_boards`
--
ALTER TABLE `myaac_forum_boards`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `myaac_gallery`
--
ALTER TABLE `myaac_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `myaac_menu`
--
ALTER TABLE `myaac_menu`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `myaac_monsters`
--
ALTER TABLE `myaac_monsters`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `myaac_news`
--
ALTER TABLE `myaac_news`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `myaac_news_categories`
--
ALTER TABLE `myaac_news_categories`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `myaac_notepad`
--
ALTER TABLE `myaac_notepad`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `myaac_pages`
--
ALTER TABLE `myaac_pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices para tabela `myaac_spells`
--
ALTER TABLE `myaac_spells`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices para tabela `myaac_videos`
--
ALTER TABLE `myaac_videos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `myaac_visitors`
--
ALTER TABLE `myaac_visitors`
  ADD UNIQUE KEY `ip` (`ip`);

--
-- Índices para tabela `myaac_weapons`
--
ALTER TABLE `myaac_weapons`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `vocation` (`vocation`);

--
-- Índices para tabela `players_online`
--
ALTER TABLE `players_online`
  ADD PRIMARY KEY (`player_id`);

--
-- Índices para tabela `player_deaths`
--
ALTER TABLE `player_deaths`
  ADD KEY `player_id` (`player_id`),
  ADD KEY `killed_by` (`killed_by`),
  ADD KEY `mostdamage_by` (`mostdamage_by`);

--
-- Índices para tabela `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`);

--
-- Índices para tabela `player_depotlockeritems`
--
ALTER TABLE `player_depotlockeritems`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`);

--
-- Índices para tabela `player_inboxitems`
--
ALTER TABLE `player_inboxitems`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`);

--
-- Índices para tabela `player_items`
--
ALTER TABLE `player_items`
  ADD KEY `player_id` (`player_id`),
  ADD KEY `sid` (`sid`);

--
-- Índices para tabela `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD PRIMARY KEY (`player_id`),
  ADD KEY `namelocked_by` (`namelocked_by`);

--
-- Índices para tabela `player_spells`
--
ALTER TABLE `player_spells`
  ADD KEY `player_id` (`player_id`);

--
-- Índices para tabela `player_storage`
--
ALTER TABLE `player_storage`
  ADD PRIMARY KEY (`player_id`,`key`);

--
-- Índices para tabela `player_storeinboxitems`
--
ALTER TABLE `player_storeinboxitems`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`);

--
-- Índices para tabela `server_config`
--
ALTER TABLE `server_config`
  ADD PRIMARY KEY (`config`);

--
-- Índices para tabela `snake_game`
--
ALTER TABLE `snake_game`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tile_store`
--
ALTER TABLE `tile_store`
  ADD KEY `house_id` (`house_id`);

--
-- Índices para tabela `towns`
--
ALTER TABLE `towns`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices para tabela `z_forum`
--
ALTER TABLE `z_forum`
  ADD PRIMARY KEY (`id`),
  ADD KEY `section` (`section`);

--
-- Índices para tabela `z_polls`
--
ALTER TABLE `z_polls`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `z_shop_history_item`
--
ALTER TABLE `z_shop_history_item`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `z_shop_offer`
--
ALTER TABLE `z_shop_offer`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `account_ban_history`
--
ALTER TABLE `account_ban_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `coinbase_payments`
--
ALTER TABLE `coinbase_payments`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `guilds`
--
ALTER TABLE `guilds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `guild_ranks`
--
ALTER TABLE `guild_ranks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `guild_wars`
--
ALTER TABLE `guild_wars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `houses`
--
ALTER TABLE `houses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=299;

--
-- AUTO_INCREMENT de tabela `market_history`
--
ALTER TABLE `market_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `market_offers`
--
ALTER TABLE `market_offers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `myaac_admin_menu`
--
ALTER TABLE `myaac_admin_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `myaac_bugtracker`
--
ALTER TABLE `myaac_bugtracker`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `myaac_changelog`
--
ALTER TABLE `myaac_changelog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `myaac_config`
--
ALTER TABLE `myaac_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `myaac_faq`
--
ALTER TABLE `myaac_faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `myaac_forum`
--
ALTER TABLE `myaac_forum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `myaac_forum_boards`
--
ALTER TABLE `myaac_forum_boards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `myaac_gallery`
--
ALTER TABLE `myaac_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `myaac_menu`
--
ALTER TABLE `myaac_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT de tabela `myaac_monsters`
--
ALTER TABLE `myaac_monsters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=373;

--
-- AUTO_INCREMENT de tabela `myaac_news`
--
ALTER TABLE `myaac_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `myaac_news_categories`
--
ALTER TABLE `myaac_news_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `myaac_notepad`
--
ALTER TABLE `myaac_notepad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `myaac_pages`
--
ALTER TABLE `myaac_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `myaac_spells`
--
ALTER TABLE `myaac_spells`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT de tabela `myaac_videos`
--
ALTER TABLE `myaac_videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `snake_game`
--
ALTER TABLE `snake_game`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `towns`
--
ALTER TABLE `towns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `z_forum`
--
ALTER TABLE `z_forum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `z_polls`
--
ALTER TABLE `z_polls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `z_shop_history_item`
--
ALTER TABLE `z_shop_history_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `z_shop_offer`
--
ALTER TABLE `z_shop_offer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `account_bans`
--
ALTER TABLE `account_bans`
  ADD CONSTRAINT `account_bans_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_bans_ibfk_2` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `account_ban_history`
--
ALTER TABLE `account_ban_history`
  ADD CONSTRAINT `account_ban_history_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_ban_history_ibfk_2` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `account_storage`
--
ALTER TABLE `account_storage`
  ADD CONSTRAINT `account_storage_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD CONSTRAINT `account_viplist_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `account_viplist_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `guilds`
--
ALTER TABLE `guilds`
  ADD CONSTRAINT `guilds_ibfk_1` FOREIGN KEY (`ownerid`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
  ADD CONSTRAINT `guildwar_kills_ibfk_1` FOREIGN KEY (`warid`) REFERENCES `guild_wars` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD CONSTRAINT `guild_invites_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_invites_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `guild_membership`
--
ALTER TABLE `guild_membership`
  ADD CONSTRAINT `guild_membership_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `guild_membership_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `guild_membership_ibfk_3` FOREIGN KEY (`rank_id`) REFERENCES `guild_ranks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD CONSTRAINT `guild_ranks_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `house_lists`
--
ALTER TABLE `house_lists`
  ADD CONSTRAINT `house_lists_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `ip_bans`
--
ALTER TABLE `ip_bans`
  ADD CONSTRAINT `ip_bans_ibfk_1` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `market_history`
--
ALTER TABLE `market_history`
  ADD CONSTRAINT `market_history_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `market_offers`
--
ALTER TABLE `market_offers`
  ADD CONSTRAINT `market_offers_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_deaths`
--
ALTER TABLE `player_deaths`
  ADD CONSTRAINT `player_deaths_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD CONSTRAINT `player_depotitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_depotlockeritems`
--
ALTER TABLE `player_depotlockeritems`
  ADD CONSTRAINT `player_depotlockeritems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_inboxitems`
--
ALTER TABLE `player_inboxitems`
  ADD CONSTRAINT `player_inboxitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_items`
--
ALTER TABLE `player_items`
  ADD CONSTRAINT `player_items_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD CONSTRAINT `player_namelocks_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `player_namelocks_ibfk_2` FOREIGN KEY (`namelocked_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `player_spells`
--
ALTER TABLE `player_spells`
  ADD CONSTRAINT `player_spells_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_storage`
--
ALTER TABLE `player_storage`
  ADD CONSTRAINT `player_storage_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_storeinboxitems`
--
ALTER TABLE `player_storeinboxitems`
  ADD CONSTRAINT `player_storeinboxitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `tile_store`
--
ALTER TABLE `tile_store`
  ADD CONSTRAINT `tile_store_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
