-- phpMyAdmin SQL Dump
-- version 3.3.7deb7
-- http://www.phpmyadmin.net
--
-- Počítač: localhost
-- Vygenerováno: Sobota 06. července 2013, 17:07
-- Verze MySQL: 5.5.31
-- Verze PHP: 5.3.26-1~dotdeb.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databáze: `c3lsff`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `actuality`
--

CREATE TABLE IF NOT EXISTS `actuality` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `image` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=2 ;

--
-- Vypisuji data pro tabulku `actuality`
--

INSERT INTO `actuality` (`id`, `is_active`, `image`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 1, '', '2013-06-28 17:11:17', '2013-06-28 17:11:17', 34, 34);

-- --------------------------------------------------------

--
-- Struktura tabulky `actuality_lang`
--

CREATE TABLE IF NOT EXISTS `actuality_lang` (
  `actuality_id` bigint(20) unsigned NOT NULL,
  `lang` varchar(2) CHARACTER SET utf8 COLLATE utf8_czech_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_czech_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8 COLLATE utf8_czech_ci NOT NULL,
  `perex` text CHARACTER SET utf8 COLLATE utf8_czech_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_czech_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`actuality_id`,`lang`),
  UNIQUE KEY `lang` (`lang`,`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Vypisuji data pro tabulku `actuality_lang`
--

INSERT INTO `actuality_lang` (`actuality_id`, `lang`, `title`, `slug`, `perex`, `content`, `created_at`, `updated_at`) VALUES
(1, 'cs', 'Testovaci novinka', 'testovaci-novinka', 'Testovaci novinka', '<p>Testovaci novinka&nbsp;<span style="color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans; font-size: 11px; line-height: 14px; text-align: justify; ">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend&nbsp;</span>Testovaci novinka&nbsp;<span style="color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans; font-size: 11px; line-height: 14px; text-align: justify; ">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend</span>Testovaci novinka&nbsp;<span style="color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans; font-size: 11px; line-height: 14px; text-align: justify; ">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend</span>Testovaci novinka&nbsp;<span style="color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans; font-size: 11px; line-height: 14px; text-align: justify; ">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend</span>Testovaci novinka&nbsp;<span style="color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans; font-size: 11px; line-height: 14px; text-align: justify; ">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend</span>Testovaci novinka&nbsp;<span style="color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans; font-size: 11px; line-height: 14px; text-align: justify; ">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend</span></p>\r\n', '2013-06-21 14:22:19', '2013-06-28 17:11:17'),
(1, 'de', 'Testovaci novinka', 'testovaci-novinka', 'Testovaci novinka', '<p>Testovaci novinka</p>\r\n', '2013-06-21 14:22:19', '2013-06-28 17:11:17'),
(1, 'en', 'Testovaci novinka', 'testovaci-novinka', 'Testovaci novinka', '<p>Testovaci novinka</p>\r\n', '2013-06-21 14:22:19', '2013-06-28 17:11:17');

-- --------------------------------------------------------

--
-- Struktura tabulky `advertisement`
--

CREATE TABLE IF NOT EXISTS `advertisement` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `print_id` bigint(20) unsigned NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `published_from` datetime NOT NULL,
  `published_to` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `print_id_2` (`print_id`,`category_id`,`slug`),
  KEY `print_id` (`print_id`),
  KEY `category_id` (`category_id`),
  KEY `created_by` (`created_by`),
  KEY `published_from` (`published_from`,`published_to`),
  KEY `is_active` (`is_active`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Vypisuji data pro tabulku `advertisement`
--

INSERT INTO `advertisement` (`id`, `print_id`, `category_id`, `created_by`, `title`, `slug`, `content`, `is_active`, `published_from`, `published_to`, `created_at`, `updated_at`) VALUES
(6, 1, 2, 34, 'GoPay platební brána', 'gopay-platebn-brna', 'asdf', 1, '2013-04-28 16:22:01', NULL, '2013-04-28 16:22:13', '2013-04-28 16:25:09');

-- --------------------------------------------------------

--
-- Struktura tabulky `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `order` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `order` (`order`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Vypisuji data pro tabulku `category`
--

INSERT INTO `category` (`id`, `name`, `slug`, `order`, `created_at`, `updated_at`, `is_active`) VALUES
(2, 'Auto, moto', 'auto-moto', 0, '2013-04-28 11:13:01', '2013-04-28 11:58:05', 1),
(3, 'Nemovitosti, reality', 'nemovitosti-reality', 0, '2013-04-28 11:13:39', '2013-04-28 11:13:39', 1),
(4, 'Mobily', 'mobily', 0, '2013-04-28 11:13:52', '2013-04-28 11:13:52', 1),
(5, 'PC, notebooky', 'pc-notebooky', 0, '2013-04-28 11:14:16', '2013-04-28 11:14:16', 1),
(6, 'Audio, video, TV, foto', 'audio-video-tv-foto', 0, '2013-04-28 11:15:01', '2013-04-28 11:15:01', 1),
(7, 'Elektro, bílé zboží', 'elektro-bile-zbozi', 0, '2013-04-28 11:15:22', '2013-04-28 11:15:22', 1),
(8, 'Práce, brigády', 'prace-brigady', 0, '2013-04-28 11:15:45', '2013-04-28 11:15:45', 1),
(9, 'Sport, hobby', 'sport-hobby', 0, '2013-04-28 11:15:58', '2013-04-28 11:15:58', 1),
(10, 'Služby', 'sluzby', 0, '2013-04-28 11:16:13', '2013-04-28 11:16:13', 1),
(11, 'Finance', 'finance', 0, '2013-04-28 11:16:25', '2013-04-28 11:16:25', 1),
(12, 'Obchodní spolupráce', 'obchodni-spoluprace', 0, '2013-04-28 11:16:41', '2013-04-28 11:16:41', 1),
(13, 'Děti, škola', 'deti-skola', 0, '2013-04-28 11:16:54', '2013-04-28 11:16:54', 1),
(14, 'Zvířata', 'zvirata', 0, '2013-04-28 11:17:08', '2013-04-28 11:17:08', 1),
(15, 'Zahrada', 'zahrada', 0, '2013-04-28 11:17:36', '2013-04-28 11:17:36', 1),
(16, 'Nábytek, bydlení', 'nabytek-bydleni', 0, '2013-04-28 11:17:53', '2013-04-28 11:17:53', 1),
(17, 'Stroje, nástroje, nářadí', 'stroje-nastroje-naradi', 0, '2013-04-28 11:18:12', '2013-04-28 11:18:12', 1),
(18, 'Oděvy, boty, doplňky', 'odevy-boty-doplnky', 0, '2013-04-28 11:18:31', '2013-04-28 11:18:31', 1),
(19, 'Drogerie', 'drogerie', 0, '2013-04-28 11:18:42', '2013-04-28 11:18:42', 1);

-- --------------------------------------------------------

--
-- Struktura tabulky `gallery`
--

CREATE TABLE IF NOT EXISTS `gallery` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `order` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Vypisuji data pro tabulku `gallery`
--

INSERT INTO `gallery` (`id`, `name`, `order`, `created_at`, `updated_at`, `is_active`) VALUES
(1, 'Testovaci fotogalerie', 0, '2013-07-05 21:51:13', '2013-07-05 21:51:13', 1),
(2, 'Testovaci fotogalerie', 0, '2013-07-05 21:51:29', '2013-07-06 01:30:06', 1),
(3, 'treti galerie', 0, '2013-07-06 02:39:46', '2013-07-06 02:39:46', 1);

-- --------------------------------------------------------

--
-- Struktura tabulky `lang`
--

CREATE TABLE IF NOT EXISTS `lang` (
  `id` char(2) NOT NULL,
  `name` varchar(20) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `lang`
--

INSERT INTO `lang` (`id`, `name`, `is_default`) VALUES
('cs', 'Čeština', 1),
('en', 'English', 0);

-- --------------------------------------------------------

--
-- Struktura tabulky `print`
--

CREATE TABLE IF NOT EXISTS `print` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `order` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `order` (`order`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Vypisuji data pro tabulku `print`
--

INSERT INTO `print` (`id`, `name`, `slug`, `order`, `created_at`, `updated_at`, `is_active`) VALUES
(1, 'MF Dnes', 'mf-dnes', 0, '2013-04-28 11:36:42', '2013-04-28 11:36:42', 1),
(2, 'Nymbursko', 'nymbursko', 1, '2013-05-21 07:58:47', '2013-05-21 07:58:47', 1);

-- --------------------------------------------------------

--
-- Struktura tabulky `staticPage`
--

CREATE TABLE IF NOT EXISTS `staticPage` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `order` bigint(20) unsigned NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `display_url` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  KEY `parent_id` (`parent_id`),
  KEY `order` (`order`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=95 ;

--
-- Vypisuji data pro tabulku `staticPage`
--

INSERT INTO `staticPage` (`id`, `parent_id`, `order`, `is_active`, `display_url`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(28, NULL, 1000, 1, 1, '2013-06-18 04:00:34', '2013-06-18 04:00:34', 34, 34),
(29, NULL, 1000, 1, 0, '2013-06-18 15:56:16', '2013-06-18 15:56:16', 34, 34),
(30, NULL, 1000, 1, 1, '2013-07-04 14:41:57', '2013-07-04 14:41:57', 34, 34),
(31, NULL, 1000, 1, 1, '2013-06-18 03:38:44', '2013-06-18 03:38:44', 34, 34),
(32, NULL, 1000, 1, 1, '2013-06-25 00:52:33', '2013-06-25 00:52:33', 34, 34),
(72, 29, 1000, 1, 1, '2013-07-04 14:41:00', '2013-07-04 14:41:00', 34, 34),
(75, 29, 1000, 1, 1, '2013-06-24 23:43:06', '2013-06-24 23:43:06', 34, 34),
(76, 29, 1000, 1, 1, '2013-06-25 00:22:45', '2013-06-25 00:22:45', 34, 34),
(77, 29, 1000, 1, 1, '2013-06-25 00:32:36', '2013-06-25 00:32:36', 34, 34),
(78, NULL, 1000, 1, 1, '2013-06-18 19:01:13', '2013-06-18 19:01:13', 34, 34),
(79, 31, 1000, 1, 1, '2013-06-18 19:02:55', '2013-06-18 19:02:55', 34, 34),
(80, 31, 1000, 1, 1, '2013-06-18 19:03:25', '2013-06-18 19:03:25', 34, 34),
(81, NULL, 1000, 1, 1, '2013-06-25 21:50:24', '2013-06-25 21:50:24', 34, 34),
(82, NULL, 1000, 1, 1, '2013-06-25 21:49:33', '2013-06-25 21:49:33', 34, 34),
(83, NULL, 1000, 1, 0, '2013-06-25 21:51:39', '2013-06-25 21:51:39', 34, 34),
(84, 83, 1000, 1, 0, '2013-06-26 20:26:48', '2013-06-26 20:26:48', 34, 34),
(85, 83, 1000, 1, 0, '2013-06-25 22:07:14', '2013-06-25 22:07:14', 34, 34),
(86, 83, 1000, 1, 0, '2013-06-25 22:07:48', '2013-06-25 22:07:48', 34, 34),
(87, NULL, 1000, 1, 0, '2013-06-25 22:08:58', '2013-06-25 22:08:58', 34, 34),
(88, NULL, 1000, 1, 0, '2013-06-25 22:09:29', '2013-06-25 22:09:29', 34, 34),
(89, NULL, 1000, 1, 0, '2013-06-25 22:10:44', '2013-06-25 22:10:44', 34, 34),
(90, 89, 1000, 1, 0, '2013-07-04 14:43:09', '2013-07-04 14:43:09', 34, 34),
(91, 89, 1000, 1, 0, '2013-07-04 14:43:27', '2013-07-04 14:43:27', 34, 34),
(92, NULL, 1000, 1, 0, '2013-06-26 14:57:36', '2013-06-26 14:57:36', 34, 34),
(93, NULL, 1000, 1, 0, '2013-06-26 15:02:37', '2013-06-26 15:02:37', 34, 34),
(94, NULL, 1000, 1, 0, '2013-07-04 14:45:39', '2013-07-04 14:45:39', 34, 34);

-- --------------------------------------------------------

--
-- Struktura tabulky `staticPage_lang`
--

CREATE TABLE IF NOT EXISTS `staticPage_lang` (
  `staticPage_id` bigint(20) unsigned NOT NULL,
  `lang` char(2) NOT NULL,
  `title` varchar(200) NOT NULL,
  `keywords` text,
  `description` text,
  `slug` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `is_in_menu` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`staticPage_id`,`lang`),
  UNIQUE KEY `slug` (`slug`,`lang`),
  KEY `lang` (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `staticPage_lang`
--

INSERT INTO `staticPage_lang` (`staticPage_id`, `lang`, `title`, `keywords`, `description`, `slug`, `content`, `is_in_menu`) VALUES
(28, 'cs', 'Home', 'homepage', 'homepage', 'hp-cs', '<div class="box left">\r\n<div class="item"><img alt="ilu1" src="/img/ilu-1.png" />\r\n<h2>Titulek aktuality</h2>\r\n\r\n<p>Lorem Ipsum je demonstrativn&iacute; v&yacute;plňov&yacute; text použ&iacute;van&yacute; v tiskařsk&eacute;m.</p>\r\n</div>\r\n\r\n<div class="item"><img alt="ilu1" src="/img/ilu-2.png" />\r\n<h2>Titulek aktuality</h2>\r\n\r\n<p>Lorem Ipsum je demonstrativn&iacute; v&yacute;plňov&yacute; text použ&iacute;van&yacute; v tiskařsk&eacute;m.</p>\r\n</div>\r\n\r\n<div class="item"><img alt="ilu1" src="/img/ilu-3.png" />\r\n<h2>Titulek aktuality</h2>\r\n\r\n<p>Lorem Ipsum je demonstrativn&iacute; v&yacute;plňov&yacute; text použ&iacute;van&yacute; v tiskařsk&eacute;m.</p>\r\n</div>\r\n\r\n<div class="item"><img alt="ilu1" src="/img/ilu-4.png" />\r\n<h2>Titulek aktuality</h2>\r\n\r\n<p>Lorem Ipsum je demonstrativn&iacute; v&yacute;plňov&yacute; text použ&iacute;van&yacute; v tiskařsk&eacute;m.</p>\r\n</div>\r\n</div>\r\n<!-- /.left -->\r\n\r\n<div class="box right">\r\n<div class="item"><img alt="ilu1" src="/img/ilu-9.png" />\r\n<h2>Titulek aktuality</h2>\r\n\r\n<p>Lorem Ipsum je demonstrativn&iacute; v&yacute;plňov&yacute; text použ&iacute;van&yacute; v tiskařsk&eacute;m.</p>\r\n</div>\r\n\r\n<div class="item"><img alt="ilu1" src="/img/ilu-6.png" />\r\n<h2>Titulek aktuality</h2>\r\n\r\n<p>Lorem Ipsum je demonstrativn&iacute; v&yacute;plňov&yacute; text použ&iacute;van&yacute; v tiskařsk&eacute;m.</p>\r\n</div>\r\n\r\n<div class="item"><img alt="ilu1" src="/img/ilu-7.png" />\r\n<h2>Titulek aktuality</h2>\r\n\r\n<p>Lorem Ipsum je demonstrativn&iacute; v&yacute;plňov&yacute; text použ&iacute;van&yacute; v tiskařsk&eacute;m.</p>\r\n</div>\r\n\r\n<div class="item"><img alt="ilu1" src="/img/ilu-8.png" />\r\n<h2>Titulek aktuality</h2>\r\n\r\n<p>Lorem Ipsum je demonstrativn&iacute; v&yacute;plňov&yacute; text použ&iacute;van&yacute; v tiskařsk&eacute;m.</p>\r\n</div>\r\n</div>\r\n<!-- /.right -->\r\n\r\n<div id="paginator">\r\n<p>Aktuality strana: <a href="#">1</a>,<a href="#">2</a>,<a href="#">3</a>,<a href="#">4</a>,<a href="#">5</a></p>\r\n</div>\r\n<!-- /#paginator -->', 0),
(28, 'de', 'Home', 'homepage', 'homepage', 'hp-de', '<div class="box left">\r\n<div class="item"><img alt="ilu1" src="/img/ilu-1.png" />\r\n<h2>Titulek aktuality</h2>\r\n\r\n<p>Lorem Ipsum je demonstrativn&iacute; v&yacute;plňov&yacute; text použ&iacute;van&yacute; v tiskařsk&eacute;m.</p>\r\n</div>\r\n\r\n<div class="item"><img alt="ilu1" src="/img/ilu-2.png" />\r\n<h2>Titulek aktuality</h2>\r\n\r\n<p>Lorem Ipsum je demonstrativn&iacute; v&yacute;plňov&yacute; text použ&iacute;van&yacute; v tiskařsk&eacute;m.</p>\r\n</div>\r\n\r\n<div class="item"><img alt="ilu1" src="/img/ilu-3.png" />\r\n<h2>Titulek aktuality</h2>\r\n\r\n<p>Lorem Ipsum je demonstrativn&iacute; v&yacute;plňov&yacute; text použ&iacute;van&yacute; v tiskařsk&eacute;m.</p>\r\n</div>\r\n\r\n<div class="item"><img alt="ilu1" src="/img/ilu-4.png" />\r\n<h2>Titulek aktuality</h2>\r\n\r\n<p>Lorem Ipsum je demonstrativn&iacute; v&yacute;plňov&yacute; text použ&iacute;van&yacute; v tiskařsk&eacute;m.</p>\r\n</div>\r\n</div>\r\n<!-- /.left -->\r\n\r\n<div class="box right">\r\n<div class="item"><img alt="ilu1" src="/img/ilu-9.png" />\r\n<h2>Titulek aktuality</h2>\r\n\r\n<p>Lorem Ipsum je demonstrativn&iacute; v&yacute;plňov&yacute; text použ&iacute;van&yacute; v tiskařsk&eacute;m.</p>\r\n</div>\r\n\r\n<div class="item"><img alt="ilu1" src="/img/ilu-6.png" />\r\n<h2>Titulek aktuality</h2>\r\n\r\n<p>Lorem Ipsum je demonstrativn&iacute; v&yacute;plňov&yacute; text použ&iacute;van&yacute; v tiskařsk&eacute;m.</p>\r\n</div>\r\n\r\n<div class="item"><img alt="ilu1" src="/img/ilu-7.png" />\r\n<h2>Titulek aktuality</h2>\r\n\r\n<p>Lorem Ipsum je demonstrativn&iacute; v&yacute;plňov&yacute; text použ&iacute;van&yacute; v tiskařsk&eacute;m.</p>\r\n</div>\r\n\r\n<div class="item"><img alt="ilu1" src="/img/ilu-8.png" />\r\n<h2>Titulek aktuality</h2>\r\n\r\n<p>Lorem Ipsum je demonstrativn&iacute; v&yacute;plňov&yacute; text použ&iacute;van&yacute; v tiskařsk&eacute;m.</p>\r\n</div>\r\n</div>\r\n<!-- /.right -->\r\n\r\n<div id="paginator">\r\n<p>Aktuality strana: <a href="#">1</a>,<a href="#">2</a>,<a href="#">3</a>,<a href="#">4</a>,<a href="#">5</a></p>\r\n</div>\r\n<!-- /#paginator -->', 0),
(28, 'en', 'Home', 'homepage', 'homepage', 'hp-en', '<div class="box left">\r\n<div class="item"><img alt="ilu1" src="/img/ilu-1.png" />\r\n<h2>Titulek aktuality</h2>\r\n\r\n<p>Lorem Ipsum je demonstrativn&iacute; v&yacute;plňov&yacute; text použ&iacute;van&yacute; v tiskařsk&eacute;m.</p>\r\n</div>\r\n\r\n<div class="item"><img alt="ilu1" src="/img/ilu-2.png" />\r\n<h2>Titulek aktuality</h2>\r\n\r\n<p>Lorem Ipsum je demonstrativn&iacute; v&yacute;plňov&yacute; text použ&iacute;van&yacute; v tiskařsk&eacute;m.</p>\r\n</div>\r\n\r\n<div class="item"><img alt="ilu1" src="/img/ilu-3.png" />\r\n<h2>Titulek aktuality</h2>\r\n\r\n<p>Lorem Ipsum je demonstrativn&iacute; v&yacute;plňov&yacute; text použ&iacute;van&yacute; v tiskařsk&eacute;m.</p>\r\n</div>\r\n\r\n<div class="item"><img alt="ilu1" src="/img/ilu-4.png" />\r\n<h2>Titulek aktuality</h2>\r\n\r\n<p>Lorem Ipsum je demonstrativn&iacute; v&yacute;plňov&yacute; text použ&iacute;van&yacute; v tiskařsk&eacute;m.</p>\r\n</div>\r\n</div>\r\n<!-- /.left -->\r\n\r\n<div class="box right">\r\n<div class="item"><img alt="ilu1" src="/img/ilu-9.png" />\r\n<h2>Titulek aktuality</h2>\r\n\r\n<p>Lorem Ipsum je demonstrativn&iacute; v&yacute;plňov&yacute; text použ&iacute;van&yacute; v tiskařsk&eacute;m.</p>\r\n</div>\r\n\r\n<div class="item"><img alt="ilu1" src="/img/ilu-6.png" />\r\n<h2>Titulek aktuality</h2>\r\n\r\n<p>Lorem Ipsum je demonstrativn&iacute; v&yacute;plňov&yacute; text použ&iacute;van&yacute; v tiskařsk&eacute;m.</p>\r\n</div>\r\n\r\n<div class="item"><img alt="ilu1" src="/img/ilu-7.png" />\r\n<h2>Titulek aktuality</h2>\r\n\r\n<p>Lorem Ipsum je demonstrativn&iacute; v&yacute;plňov&yacute; text použ&iacute;van&yacute; v tiskařsk&eacute;m.</p>\r\n</div>\r\n\r\n<div class="item"><img alt="ilu1" src="/img/ilu-8.png" />\r\n<h2>Titulek aktuality</h2>\r\n\r\n<p>Lorem Ipsum je demonstrativn&iacute; v&yacute;plňov&yacute; text použ&iacute;van&yacute; v tiskařsk&eacute;m.</p>\r\n</div>\r\n</div>\r\n<!-- /.right -->\r\n\r\n<div id="paginator">\r\n<p>Aktuality strana: <a href="#">1</a>,<a href="#">2</a>,<a href="#">3</a>,<a href="#">4</a>,<a href="#">5</a></p>\r\n</div>\r\n<!-- /#paginator -->', 0),
(29, 'cs', 'Festival', 'o nas', 'o nas', 'festival', '<h1>Co je Lorem Ipsum?</h1>\r\n\r\n<p><img alt="ilu" src="/img/ilu-big.jpg" /></p>\r\n', 1),
(29, 'de', 'Festival', 'festival', 'festival', 'festival', '<h1>Co je Lorem Ipsum?</h1>\r\n\r\n<p><img alt="ilu" src="/img/ilu-big.jpg" /></p>\r\n', 1),
(29, 'en', 'Festival', 'o nas', 'o nas', 'festival', '<h1>Co je Lorem Ipsum?</h1>\r\n\r\n<p><img alt="ilu" src="/img/ilu-big.jpg" /></p>\r\n', 1),
(30, 'cs', 'Partneři', '', '', 'partnei', '<table border="0" cellpadding="0" cellspacing="30" style="width: 524px; ">\r\n	<tbody>\r\n		<tr>\r\n			<td style="text-align: center; vertical-align: middle; ">\r\n			<h1>Hlavn&iacute; partneři</h1>\r\n			</td>\r\n			<td style="text-align: center; vertical-align: middle; ">&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td style="text-align: center; vertical-align: middle; "><a href="http://eagri.cz/public/web/mze/" target="_blank"><img alt="" src="/upload/images/MZ_CR_logo.png" style="width: 250px; height: 108px; " /></a></td>\r\n			<td style="text-align: center; vertical-align: middle; "><a href="http://www.agrocr.cz" target="_blank"><img alt="" src="/upload/images/AK_CR_logo.png" style="width: 250px; height: 66px; " /></a></td>\r\n		</tr>\r\n		<tr>\r\n			<td style="text-align: center; vertical-align: middle; "><a href="http://www.cas.cz" target="_blank"><img alt="" src="/upload/images/AV_CR_logo.png" style="width: 144px; height: 97px; " /></a></td>\r\n			<td style="text-align: center; vertical-align: middle; "><a href="http://www2.dupont.com/Czech_Republic_Country_Site/cs_CZ/index.html" target="_blank"><img alt="" src="/upload/images/DuPont_Logo.png" style="width: 180px; height: 70px; " /></a></td>\r\n		</tr>\r\n		<tr>\r\n			<td style="text-align: center; vertical-align: middle; "><a href="http://www.asz.cz/cs/intranet/" target="_blank"><img alt="" src="/upload/images/ASZ_CR_logo.png" style="width: 178px; height: 120px; " /></a></td>\r\n			<td style="text-align: center; vertical-align: middle; "><a href="http://www.praha6.cz" target="_blank"><img alt="" src="/upload/images/Praha6_logo.png" style="width: 120px; height: 120px; " /></a></td>\r\n		</tr>\r\n		<tr>\r\n			<td style="text-align: center; vertical-align: middle; "><a href="http://www.prerost-svorc.cz" target="_blank"><img alt="" src="/upload/images/Skoda_PaS_logo.png" style="width: 250px; height: 23px; " /></a></td>\r\n			<td style="text-align: center; vertical-align: middle; "><a href="http://www.syngenta.com/country/cz/cz/Pages/home.aspx" target="_blank"><img alt="" src="/upload/images/syngenta_logo.png" style="width: 151px; height: 50px; " /></a></td>\r\n		</tr>\r\n		<tr>\r\n			<td style="text-align: center; vertical-align: middle; ">\r\n			<h1>Partneři</h1>\r\n			</td>\r\n			<td style="text-align: center; vertical-align: middle; ">&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td style="text-align: center; vertical-align: middle; "><a href="http://www.uochb.cz/web/structure/31.html" target="_blank"><img alt="" src="/upload/images/UACHB_logo.png" style="width: 250px; height: 82px; " /></a></td>\r\n			<td style="text-align: center; vertical-align: middle; "><a href="http://www.zemelod.cz/cz/zemelod.html" target="_blank"><img alt="" src="/upload/images/Zemlod_logo.png" style="width: 250px; height: 105px; " /></a></td>\r\n		</tr>\r\n		<tr>\r\n			<td style="text-align: center; vertical-align: middle; "><a href="http://www.arkokapsle.cz" target="_blank"><img alt="" src="/upload/images/Arkokapsle_logo.png" style="width: 250px; height: 49px; " /></a></td>\r\n			<td style="text-align: center; vertical-align: middle; "><a href="http://www.arkokapsle.cz" target="_blank"><img alt="" src="/upload/images/Expharma_logo.png" style="width: 250px; height: 62px; " /></a></td>\r\n		</tr>\r\n		<tr>\r\n			<td style="text-align: center; vertical-align: middle; "><a href="http://www.rostlinolekari.cz" target="_blank"><img alt="" src="/upload/images/Rostli_CS_logo.png" style="width: 120px; height: 120px; " /></a></td>\r\n			<td style="text-align: center; vertical-align: middle; "><a href="http://www.prokopyto.cz" target="_blank"><img alt="" src="/upload/images/Pro_kopyto_logo.png" style="width: 200px; height: 120px; " /></a></td>\r\n		</tr>\r\n		<tr>\r\n			<td style="text-align: center; vertical-align: middle; ">\r\n			<h1>Medi&aacute;ln&iacute; partneři</h1>\r\n			</td>\r\n			<td style="text-align: center; vertical-align: middle; ">&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td style="text-align: center; vertical-align: middle; "><a href="http://www.osel.cz" target="_blank"><img alt="" src="/upload/images/Osel_logo.png" style="width: 145px; height: 66px; " /></a></td>\r\n			<td style="text-align: center; vertical-align: middle; "><a href="http://www.agromanual.cz" target="_blank"><img alt="" src="/upload/images/Agroaman_logo.png" style="width: 250px; height: 66px; " /></a></td>\r\n		</tr>\r\n		<tr>\r\n			<td style="text-align: center; vertical-align: middle; "><a href="http://ekofutura.cz" target="_blank"><img alt="" src="/upload/images/Ekofutura_logo.png" style="width: 140px; height: 140px; " /></a></td>\r\n			<td style="text-align: center; vertical-align: middle; "><a href="http://www.rozhlas.cz/leonardo/portal/" target="_blank"><img alt="" src="/upload/images/Leonardo_logo.png" style="width: 211px; height: 120px; " /></a></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n', 1),
(30, 'de', 'Partneři', '', '', 'partnei', '<p>&nbsp;</p>\r\n', 1),
(30, 'en', 'Partneři', '', '', 'partnei', '<p>&nbsp;</p>\r\n', 1),
(31, 'cs', 'Historie', 'doplňky', 'doplňky', 'historie', '<p>&nbsp;</p>\r\n', 1),
(31, 'de', 'Historie', 'doplňky', 'doplňky', 'historie', '<p>&nbsp;</p>\r\n', 1),
(31, 'en', 'Historie', 'doplňky', 'doplňky', 'historie', '<p>&nbsp;</p>\r\n', 1),
(32, 'cs', 'Kontakty', 'fotogalerie', 'fotogalerie', 'kontakty', '<h1>Kontakty</h1>\r\n\r\n<h2>Festivalov&aacute; produkce</h2>\r\n\r\n<p><strong>Harvest Films o.s.</strong><br />\r\nKe statkům 79<br />\r\n252 65 Tursko<br />\r\nČesk&aacute; republika<br />\r\n+420 774 909 905</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Vedouc&iacute; festivalov&eacute; produkce</h2>\r\n\r\n<p><strong>Ing. &Scaron;těp&aacute;n Alexander</strong></p>\r\n\r\n<p>+420 774 444 425</p>\r\n\r\n<p>program@lsff.cz</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Akvizice filmů</h2>\r\n\r\n<p><strong>Ing. Petr Civi&scaron;</strong></p>\r\n\r\n<p>program@lsff.cz</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Tiskov&eacute; oddělen&iacute;</h2>\r\n\r\n<p><strong>Mgr. Adam Carda</strong></p>\r\n\r\n<p>+420 607 728 894</p>\r\n\r\n<p>press@lsff.cz</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Technick&aacute; podpora</h2>\r\n\r\n<p><strong>Ivo Javůrek</strong></p>\r\n\r\n<p>program@lsff.cz</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Koordin&aacute;tor projektu za Harvest Films</h2>\r\n\r\n<p><strong>Ing. Petr Alexander, CSc.</strong></p>\r\n\r\n<p>+420 774 909 905</p>\r\n\r\n<p>alex@lssf.cz</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Koordin&aacute;tor projektu za ČZU</h2>\r\n\r\n<p><strong>doc. Ing. Petr Heřm&aacute;nek, Ph.D.</strong></p>\r\n\r\n<p>+420 224 383 126</p>\r\n\r\n<p>hermanek@tf.czu.cz</p>\r\n', 1),
(32, 'de', 'Kontakty', 'fotogalerie', 'fotogalerie', 'kontakty', '<p>&nbsp;</p>\r\n', 1),
(32, 'en', 'Kontakty', 'fotogalerie', 'fotogalerie', 'kontakty', '<p>&nbsp;</p>\r\n', 1),
(72, 'cs', 'O festivalu', 'o festivalu', 'o festivalu', 'o-festivalu', '<h1>O festivalu</h1>\r\n\r\n<p>LIFE SCIENCE FILM FESTIVAL vznikl v roce 2010, z iniciativy současn&yacute;ch a b&yacute;val&yacute;ch studentů ČZU v Praze, reaguj&iacute;c&iacute; na deficit v prezentaci audiovizu&aacute;ln&iacute;ch děl s t&eacute;matikou př&iacute;rodn&iacute;ch a zemědělsk&yacute;ch věd.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>C&iacute;lem festivalu je předev&scaron;&iacute;m:</h2>\r\n\r\n<ul>\r\n	<li>Tuto mezeru vyplnit a každoročn&iacute; fiestou oslavit sklizeň nov&yacute;ch n&aacute;padů, ře&scaron;en&iacute;, inspirac&iacute; a nov&yacute;ch horizontů.</li>\r\n	<li>Využit&iacute; audiovizu&aacute;ln&iacute;ho materi&aacute;lu pro z&aacute;bavnou formu vzděl&aacute;v&aacute;n&iacute; a popularizaci vědy.</li>\r\n	<li>Vytvořit novou nestrannou diskusn&iacute; platformu, kter&aacute; by pomohla nej&scaron;ir&scaron;&iacute;mu okruhu div&aacute;ku z&iacute;skat aktu&aacute;ln&iacute; vědeck&eacute; informace.</li>\r\n</ul>\r\n\r\n<h2>Jak?</h2>\r\n\r\n<ul>\r\n	<li>Každoročně soustředit nejnověj&scaron;&iacute; filmy t&yacute;kaj&iacute;c&iacute; se zemědělsk&yacute;ch věd,udržiteln&eacute;ho rozvoje, poznatků z praxe, ale i z&aacute;kladn&iacute;ho a aplikovan&eacute;ho v&yacute;zkumu u &nbsp;n&aacute;s i ze zahranič&iacute;.</li>\r\n	<li>Konfrontovat tvůrce, odborn&iacute;ky, budouc&iacute; odborn&iacute;ky, div&aacute;ky a vytvořit m&iacute;sto &nbsp;pro diskuzi a živ&yacute; akademick&yacute; dialog.</li>\r\n	<li>Prezentac&iacute; jednotliv&yacute;ch fakult, kateder, vědeck&yacute;ch programů, v&yacute;zkumn&yacute;ch projektů, doktorandsk&yacute;ch prac&iacute;, priv&aacute;tn&iacute;ho, st&aacute;tn&iacute;ho sektoru a samozřejmě &nbsp;studentsk&yacute;ch projektů.</li>\r\n	<li>Nemal&yacute;m př&aacute;n&iacute;m je tak&eacute; obr&aacute;tit pozornost, jak amat&eacute;rsk&yacute;ch, tak profesion&aacute;ln&iacute;ch filmařů směrem k problematice př&iacute;rodn&iacute;ch a zejm&eacute;na zemědělsk&yacute;ch věd.</li>\r\n</ul>\r\n', 0),
(72, 'de', 'O festivalu', 'o festivalu', 'o festivalu', 'o-festivalu', '<p>o festivalu</p>\r\n', 0),
(72, 'en', 'O festivalu', 'o festivalu', 'o festivalu', 'o-festivalu', '<p>o festivalu</p>\r\n', 0),
(75, 'cs', 'Status', '', '', 'status', '<h1>Statut</h1>\r\n\r\n<h2>LIFE SCIENCES FILM FESTIVAL 2013</h2>\r\n\r\n<h2>Mezin&aacute;rodn&iacute; festival dokument&aacute;rn&iacute;ch filmů s tematikou př&iacute;rodn&iacute;ch&nbsp;a zemědělsk&yacute;ch věd a trvale udržiteln&eacute;ho rozvoje</h2>\r\n\r\n<h2>I. Z&aacute;kladn&iacute; ustanoven&iacute;</h2>\r\n\r\n<ol>\r\n	<li>Mezin&aacute;rodn&iacute; LIFE SCIENCES FILM FESTIVAL (d&aacute;le jen &bdquo;LSFF&ldquo;) je festivalem dokument&aacute;rn&iacute;ho filmu při Česk&eacute; zemědělsk&eacute; univerzitě v Praze (d&aacute;le jen &bdquo;ČZU&ldquo;).</li>\r\n	<li>C&iacute;lem LSFF je uv&eacute;st a ocenit nejnověj&scaron;&iacute; sn&iacute;mky z oblasti př&iacute;rodn&iacute;ch a zejm&eacute;na zemědělsk&yacute;ch věd i techniky a současně prezentovat možnosti jejich využit&iacute; ve vzděl&aacute;v&aacute;n&iacute; a dal&scaron;&iacute;mu povzn&aacute;&scaron;en&iacute; dobr&eacute;ho jm&eacute;na ČZU.</li>\r\n	<li>Těži&scaron;těm festivalu je mezin&aacute;rodn&iacute; soutěž filmů, předn&aacute;&scaron;ky, diskuse s odborn&iacute;ky a dal&scaron;&iacute; doprovodn&eacute; akce.</li>\r\n	<li>Program festivalu tvoř&iacute;:</li>\r\n	<li>mezin&aacute;rodn&iacute; soutěž filmů, informativn&iacute; prom&iacute;t&aacute;n&iacute; filmů nezařazen&yacute;ch do soutěže, odborn&eacute; semin&aacute;ře, besedy s odborn&iacute;ky a dal&scaron;&iacute; doprovodn&eacute; akce.</li>\r\n	<li>Ofici&aacute;ln&iacute;m jazykem LSFF je če&scaron;tina a angličtina.</li>\r\n	<li>Vyhla&scaron;ovatelem a organiz&aacute;torem LSFF je Česk&aacute; zemědělsk&aacute; univerzita v Praze (se s&iacute;dlem Kam&yacute;ck&aacute; 129, 165 21 Praha 6 &ndash; Suchdol) a občansk&eacute; sdružen&iacute; Harvest Films (se s&iacute;dlem Ke statkům 79, 252 65, Tursko).</li>\r\n	<li>3. ročn&iacute;k LSFL se uskutečn&iacute; ve dnech 14. - 18. ř&iacute;jna 2013 v prostor&aacute;ch Česk&eacute; zemědělsk&eacute; univerzity v Praze. Současně se uskutečňuje zejm&eacute;na v Praze doprovodn&yacute; program a mohou prob&iacute;hat dal&scaron;&iacute; prezentace a projekce na &uacute;zem&iacute; Česk&eacute; republiky i v zahranič&iacute;.</li>\r\n</ol>\r\n\r\n<h2>II. Přihl&aacute;&scaron;en&iacute; filmů</h2>\r\n\r\n<ol>\r\n	<li>Sn&iacute;mky mohou přihl&aacute;sit opr&aacute;vněn&eacute; osoby (filmov&yacute; tvůrci, producenti, distributoři apod.)</li>\r\n	<li>Do mezin&aacute;rodn&iacute; soutěže mohou b&yacute;t přihl&aacute;&scaron;eny filmy, televizn&iacute; filmy a videoprogramy (d&aacute;le jen &bdquo;filmy&ldquo;) natočen&eacute; po 1. lednu 2010</li>\r\n	<li>Organiz&aacute;tor preferuje DVD v nejvy&scaron;&scaron;&iacute; kvalitě a bez ochrany proti kop&iacute;rov&aacute;n&iacute;. V př&iacute;padě cizojazyčn&eacute;ho filmu mus&iacute; b&yacute;t DVD v anglick&eacute; verzi (tj. anglicky mluven&eacute; filmy, anglicky dabovan&eacute; filmy, filmy v origin&aacute;ln&iacute; verzi s anglick&yacute;mi titulky.</li>\r\n	<li>Podepsan&eacute; přihl&aacute;&scaron;ky filmů mus&iacute; b&yacute;t doručeny na adresu občansk&eacute;ho sdružen&iacute; Harvest films (Ke statkům 79, 252 65, Tursko) nejpozději do 31. 7. 2013. &nbsp;K přihl&aacute;&scaron;ce,kterou přihla&scaron;ovatel obdrž&iacute; e-mailem po vyplněn&iacute; a odesl&aacute;n&iacute; elektronick&eacute;ho formul&aacute;ře na www.lsff.cz, mus&iacute; b&yacute;t přiloženy dvě kopie přihl&aacute;&scaron;en&eacute;ho sn&iacute;mku, &uacute;pln&aacute; koment&aacute;řov&aacute; listina v česk&eacute;m nebo anglick&eacute;m jazyce a dal&scaron;&iacute; propagačn&iacute;ch materi&aacute;lů v elektronick&eacute; podobě (fotografie, synopse).</li>\r\n	<li>Přihl&aacute;&scaron;en&iacute; filmu na LSFF zahrnuje poskytnut&iacute; uk&aacute;zky z filmu na DVD, nebo souhlas, aby takov&eacute; uk&aacute;zky, kter&eacute; usnadn&iacute; propagaci filmu, festival s&aacute;m na sv&eacute; n&aacute;klady poř&iacute;dil. Jejich rozsah nepřekroč&iacute; d&eacute;lku 3 minuty. &Uacute;častn&iacute;k t&iacute;mto souhlas&iacute; s použit&iacute;m těchto uk&aacute;zek v česk&yacute;ch nebo zahraničn&iacute;ch televiz&iacute;ch a na internetu.</li>\r\n	<li>Sn&iacute;mky, kter&eacute; nesplňuj&iacute; body 1-5 nebude v&yacute;běrov&aacute; komise posuzovat.</li>\r\n	<li>Za v&yacute;lohy spojen&eacute; se zasl&aacute;n&iacute;m sn&iacute;mků a propagačn&iacute;ch materi&aacute;lů zodpov&iacute;d&aacute; přihla&scaron;ovatel.</li>\r\n</ol>\r\n\r\n<h2>III. Podm&iacute;nky &uacute;časti v mezin&aacute;rodn&iacute; soutěži</h2>\r\n\r\n<ol>\r\n	<li>O přijet&iacute; sn&iacute;mku do kategorie mezin&aacute;rodn&iacute; soutěž nebo kategorie informativn&iacute; prom&iacute;t&aacute;n&iacute;, rozhoduje v&yacute;běrov&aacute; komise festivalu, kterou jmenuje předseda občansk&eacute;ho sdružen&iacute; Harvest films. V&yacute;běrov&aacute; komise rozhoduje o v&yacute;běru filmů do mezin&aacute;rodn&iacute; soutěže 31. srpna 2013 a bez zbytečn&eacute;ho odkladu vyrozum&iacute; přihla&scaron;ovatele.</li>\r\n	<li>Komise m&aacute; pr&aacute;vo odm&iacute;tnout film, kter&yacute; svou technickou kvalitou nebo obsahem neodpov&iacute;d&aacute; statutu a zaměřen&iacute; festivalu.</li>\r\n	<li>Filmy zařazen&eacute; do mezin&aacute;rodn&iacute; soutěže posoud&iacute; odborn&aacute; porota. Soutěžn&iacute; filmy hodnot&iacute; tak&eacute; studentsk&aacute; porota. Členy odborn&eacute; i studentsk&eacute; poroty jmenuje o.s. Harvest films, po dohodě s ČZU. Ceny jsou udělov&aacute;ny přihla&scaron;ovatelům.</li>\r\n	<li>Odborn&aacute; porota může udělit n&aacute;sleduj&iacute;c&iacute; ceny:<br />\r\n	&bull; Velk&aacute; cena LSFF 2013 s finančn&iacute; odměnou 3000 euro. Finančn&iacute; odměna patř&iacute; režis&eacute;rovi filmu.<br />\r\n	&bull; Cena Fakulty agrobiologie, potravinov&yacute;ch a př&iacute;rodn&iacute;ch zdrojů<br />\r\n	&bull; Cena Provozně ekonomick&eacute; fakulty<br />\r\n	&bull; Cena Technick&eacute; fakulty<br />\r\n	&bull; Cena Fakulty lesnick&eacute; a dřevařsk&eacute;<br />\r\n	&bull; Cena Fakulty životn&iacute;ho prostřed&iacute;<br />\r\n	&bull; Cena Fakulty tropů a subtropů</li>\r\n	<li>Odborn&aacute; porota může doporučit udělen&iacute; n&aacute;sleduj&iacute;c&iacute;ch cen:<br />\r\n	&bull; Cena starosty Městsk&eacute; č&aacute;sti Praha 6<br />\r\n	&bull; Cena ministra zemědělstv&iacute;</li>\r\n	<li>Studentsk&aacute; porota může udělit Cenu studentů.</li>\r\n</ol>\r\n\r\n<h2>IV. Akreditace</h2>\r\n\r\n<ol>\r\n	<li>Akreditaci osobn&iacute; &uacute;časti je možno zaslat do 1. ř&iacute;jna 2013 elektronicky na adresu program@lsff.cz. D&aacute;le je možn&aacute; osobn&iacute; akreditace v m&iacute;stě kon&aacute;n&iacute; festivalu.</li>\r\n	<li>Akreditovan&iacute; &uacute;častn&iacute;ci obdrž&iacute; zdarma informačn&iacute; materi&aacute;ly a maj&iacute; voln&yacute; vstup na filmov&eacute; a doprovodn&eacute; akce festivalu.</li>\r\n	<li>N&aacute;klady spojen&eacute; s pobytem si hrad&iacute; každ&yacute; &uacute;častn&iacute;k s&aacute;m.</li>\r\n	<li>Organiz&aacute;tor zajist&iacute; a hrad&iacute; ubytov&aacute;n&iacute; a přepravu v ČR pro oceněn&eacute; autory či jejich z&aacute;stupce, lektory semin&aacute;řů, &uacute;činkuj&iacute;c&iacute; doprovodn&yacute;ch programů a členy odborn&eacute; poroty.</li>\r\n</ol>\r\n\r\n<h2>V. Z&aacute;věrečn&aacute; ustanoven&iacute;</h2>\r\n\r\n<ol>\r\n	<li>Přihla&scaron;ovatel souhlas&iacute;, že jeho film bude z dodan&eacute;ho nosiče přeps&aacute;n pro &uacute;čely překladu, titulkov&aacute;n&iacute; a projekce na DVD nebo na harddisk organiz&aacute;tora. Filmy vybran&eacute; do soutěže a do informativn&iacute; sekce budou opatřeny česk&yacute;mi nebo anglick&yacute;mi titulky nebo překladov&yacute;m koment&aacute;řem. Přihla&scaron;ovatel souhlas&iacute;, aby jeho film byl na festivalu prezentov&aacute;n v t&eacute;to &uacute;pravě. V př&iacute;padě nesouhlasu může b&yacute;t film zařazen pouze do nesoutěžn&iacute; sekce k prom&iacute;t&aacute;n&iacute; na př&aacute;n&iacute;.</li>\r\n	<li>Přihla&scaron;ovatel podpisem přihl&aacute;&scaron;ky prohla&scaron;uje, že film či materi&aacute;l použit&yacute; ve filmu, neporu&scaron;uje pr&aacute;vo průmyslov&eacute;ho vlastnictv&iacute;, autorsk&eacute;ho pr&aacute;va a pr&aacute;va na ochranu osobnosti.</li>\r\n	<li>Podpisem přihl&aacute;&scaron;ky přihla&scaron;ovatel prohla&scaron;uje, že vůči organiz&aacute;torovi LSFF, kter&yacute;m je občansk&eacute; sdružen&iacute; Harvest Film a Česk&aacute; zemědělsk&aacute; univerzita v Praze, nebudou v souvislosti s užit&iacute;m filmu v průběhu festivalu dle Statutu LSFF 2013 uplatněny opr&aacute;vněn&eacute; n&aacute;roky majitelů autorsk&yacute;ch pr&aacute;v a pr&aacute;v souvisej&iacute;c&iacute;ch s pr&aacute;vem autorsk&yacute;m.</li>\r\n	<li>Přihl&aacute;&scaron;en&iacute;m filmu poskytuje přihla&scaron;ovatel organiz&aacute;torovi LSFF 2013 n&iacute;že uveden&aacute; opr&aacute;vněn&iacute;. Nebude-li p&iacute;semně dohodnuto jinak, uděluje t&iacute;mto organiz&aacute;torovi LSFF 2013 nev&yacute;hradn&iacute; licenci k užit&iacute; filmu, resp. kter&eacute;koliv jeho č&aacute;sti, v souvislosti s festivalem, zejm. jeho projekci v r&aacute;mci festivalu. Z&aacute;roveň t&iacute;mto přihla&scaron;ovatel uděluje v rozsahu poskytnut&eacute; licence n&aacute;sleduj&iacute;c&iacute; svolen&iacute;:<br />\r\n	&bull; opatřit film jinou jazykovou verz&iacute;<br />\r\n	&bull; už&iacute;t film či uk&aacute;zky z filmu pro &uacute;čely propagace filmu a tohoto festivalu<br />\r\n	&bull; opatřit film logem tohoto festivalu</li>\r\n	<li>Archivace přihl&aacute;&scaron;en&yacute;ch filmů<br />\r\n	&bull; Kopie přihl&aacute;&scaron;en&yacute;ch filmů s titulky nebo koment&aacute;řem (na nosič&iacute;ch DVD) a origin&aacute;ly oceněn&yacute;ch filmů zůst&aacute;vaj&iacute; trvale v archivu o.s. Harvest Films při ČZU a nebudou užity ke komerčn&iacute;m &uacute;čelům. Origin&aacute;ly neoceněn&yacute;ch filmů se po festivalu vracej&iacute; přihla&scaron;ovatelům pouze na vyž&aacute;d&aacute;n&iacute;.<br />\r\n	&bull; Po ukončen&iacute; festivalu mohou b&yacute;t přihl&aacute;&scaron;en&eacute; filmy ve verz&iacute;ch s překladov&yacute;mi titulky nebo koment&aacute;řem prom&iacute;t&aacute;ny na nekomerčn&iacute;ch filmov&yacute;ch přehl&iacute;dk&aacute;ch &bdquo;Ozvěny LSFF&ldquo;.</li>\r\n	<li>Organiz&aacute;toři nenesou odpovědnost za opotřeben&iacute; zaslan&yacute;ch origin&aacute;lů.</li>\r\n	<li>Doručen&iacute;m přihl&aacute;&scaron;ky k &uacute;časti na adresu organiz&aacute;tora d&aacute;v&aacute; přihla&scaron;ovatel za majitele distribučn&iacute;ch a autorsk&yacute;ch pr&aacute;v v&yacute;slovn&yacute; a &uacute;pln&yacute; souhlas k bez&uacute;platn&eacute;mu užit&iacute; filmu ve smyslu tohoto statutu.</li>\r\n	<li>Česk&yacute; text statutu plat&iacute; jako z&aacute;vazn&yacute;. Pr&aacute;vn&iacute; vztahy mezi přihla&scaron;ovateli, &uacute;častn&iacute;ky festivalu, jeho vyhla&scaron;ovatelem a organizac&iacute; pověřenou v&yacute;konem k zaji&scaron;těn&iacute; festivalu se ř&iacute;d&iacute; podle z&aacute;konů Česk&eacute; republiky.</li>\r\n	<li>&Uacute;čast na festivalu předpokl&aacute;d&aacute; souhlas s t&iacute;mto statutem.</li>\r\n</ol>\r\n\r\n<h2>Důležit&aacute; data</h2>\r\n\r\n<p>přihl&aacute;&scaron;ky sn&iacute;mků: <strong>do 31. 7. 2013</strong></p>\r\n\r\n<p>přihl&aacute;&scaron;ky k osobn&iacute; &uacute;časti:&nbsp;<strong>do 1. 10. 2013</strong></p>\r\n', 0),
(75, 'de', 'Status', '', '', 'status', '<p>&nbsp;</p>\r\n', 0),
(75, 'en', 'Status', '', '', 'status', '<p>&nbsp;</p>\r\n', 0),
(76, 'cs', 'Místo konání', '', '', 'misto-konani', '<h1>M&iacute;sto kon&aacute;n&iacute;</h1>\r\n\r\n<h2>Česk&aacute; zemědělsk&aacute; univerzita v Praze</h2>\r\n\r\n<p>Kam&yacute;ck&aacute; 129</p>\r\n\r\n<p>Praha 6 - Suchdol, 165 21</p>\r\n\r\n<p>www.czu.cz</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Prom&iacute;tac&iacute; m&iacute;sta</h2>\r\n\r\n<p>Provozně ekonomick&aacute; fakulta (PEF)<br />\r\nFakulta agrobiologie, potravinov&yacute;ch a př&iacute;rodn&iacute;ch zdrojů (FAPPZ)<br />\r\nTechnick&aacute; fakulta (TF)<br />\r\nFakulta životn&iacute;ho prostřed&iacute; (FŽP)<br />\r\nFakulta lesnick&aacute; a dřevařsk&aacute; (FLD)<br />\r\nInstitut tropů s a subtropů - v budově Studijn&iacute;ho a informačn&iacute;ho centra (SIC)</p>\r\n\r\n<p>Kruhov&aacute; hala ČZU - Akreditačn&iacute; a informačn&iacute; centrum LSFF</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><iframe frameborder="0" height="350" marginheight="0" marginwidth="0" scrolling="no" src="https://maps.google.com/maps/ms?ll=50.130167,14.374377&amp;spn=0.008322,0.022005&amp;t=h&amp;z=17&amp;msa=0&amp;msid=213452824737616609481.0004dfed83bc73c315502" width="425"></iframe><br />\r\n<small>Zobrazit m&iacute;sto <a href="https://maps.google.com/maps/ms?ll=50.130167,14.374377&amp;spn=0.008322,0.022005&amp;t=h&amp;z=17&amp;msa=0&amp;msid=213452824737616609481.0004dfed83bc73c315502&amp;source=embed" style="color:#0000FF;text-align:left">Česk&aacute; zemědělsk&aacute; univerzita v Praze</a> na vět&scaron;&iacute; mapě</small></p>\r\n', 0),
(76, 'de', 'Místo konání', '', '', 'msto-konn', '<p>&nbsp;</p>\r\n', 0),
(76, 'en', 'Místo konání', '', '', 'msto-konn', '<p>&nbsp;</p>\r\n', 0),
(77, 'cs', 'Podpořte festival', '', '', 'podporte-festival', '<h1>Prostor pro prezentaci partnerů</h1>\r\n\r\n<p>Projekt nab&iacute;z&iacute; sponzorům a partnerům možnosti prezentace studentům, pedagogům i &scaron;irok&eacute; veřejnosti. Současně je možn&eacute; prezentovat partnera c&iacute;leně, vybran&yacute;m c&iacute;lov&yacute;m skupin&aacute;m, dle dal&scaron;&iacute; dohody.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Nab&iacute;dka gener&aacute;ln&iacute;ho partnerstv&iacute;</h2>\r\n\r\n<h2>Plněn&iacute; projektu</h2>\r\n\r\n<ol>\r\n	<li>Prom&iacute;tnut&iacute; loga partnera v &uacute;vodn&iacute; sekvenci před projekc&iacute; každ&eacute;ho filmu.</li>\r\n	<li>Pojmenov&aacute;n&iacute; jedn&eacute; z udělovan&yacute;ch cen LSFF 2012 - jm&eacute;no partnera na ve&scaron;ker&eacute; PR komunikaci, na so&scaron;ce a diplomu, na web str&aacute;nk&aacute;ch, atd.</li>\r\n	<li>Citov&aacute;n&iacute; partnera 2x v průběhu slavnostn&iacute;ho večera. Z&aacute;stupce partnera před&aacute;v&aacute; cenu na slavnostn&iacute;m večeru vyhl&aacute;&scaron;en&iacute; cen LSFF, přenos ČT.</li>\r\n	<li>Um&iacute;stěn&iacute; loga partnera s označen&iacute;m &quot;gener&aacute;ln&iacute; partner&quot; (nebo partneři) ve spotu vys&iacute;lan&eacute;m jako upout&aacute;vka na slavnostn&iacute; vyhl&aacute;&scaron;en&iacute; cen LSFF.</li>\r\n	<li>Um&iacute;stěn&iacute; loga partnera o min. velikosti 1x1 metr v z&aacute;běru kamer při slavnostn&iacute;m vyhl&aacute;&scaron;en&iacute; v&iacute;tězn&yacute;ch filmů.</li>\r\n	<li>6 ks VIP vstupenek pro z&aacute;stupce partnera na slavnostn&iacute; vyhl&aacute;&scaron;en&iacute; v&iacute;tězn&yacute;ch filmů a n&aacute;sledn&yacute; raut.</li>\r\n	<li>Um&iacute;stěn&iacute; loga partnera o min. velikosti 1x1 metr v z&aacute;běru kamer na tiskov&eacute; konferenci k vyhl&aacute;&scaron;en&iacute; v&yacute;sledků filmov&eacute; soutěže LSFF.</li>\r\n	<li>Um&iacute;stěn&iacute; loga partnera na s označen&iacute;m &quot;gener&aacute;ln&iacute; partner&quot; (nebo partneři) na tituln&iacute; str&aacute;nce webu LSFF, s prolinkem na web partnera.</li>\r\n	<li>Um&iacute;stěn&iacute; loga partnera na akreditačn&iacute;ch kart&aacute;ch a materi&aacute;lech a na dal&scaron;&iacute;ch tiskovin&aacute;ch LSFF.</li>\r\n	<li>Um&iacute;stěn&iacute; loga partnera s označen&iacute;m &quot;gener&aacute;ln&iacute; partner&quot; (nebo partneři) při celost&aacute;tn&iacute; reklamn&iacute; kampani v celost&aacute;tn&iacute;m tisku a elektronick&yacute;ch medi&iacute;ch - minim&aacute;lně desetkr&aacute;t.</li>\r\n	<li>Odvys&iacute;l&aacute;n&iacute; sponzorsk&yacute;ch vzkazů (s uveden&iacute;m jm&eacute;na partnera jako gener&aacute;ln&iacute;ho partnera projektu) v celost&aacute;tn&iacute; s&iacute;ti r&aacute;di&iacute;.</li>\r\n	<li>Prezentace produktů a semin&aacute;ře.</li>\r\n</ol>\r\n\r\n<p>Projekt nab&iacute;z&iacute; i n&aacute;sledn&eacute; možnosti prezentace partnera, zejm&eacute;na ve spojen&iacute; se vzděl&aacute;vac&iacute;mi filmy a videomateri&aacute;ly, kter&eacute; budou směřovat do &nbsp;vzděl&aacute;vac&iacute; kask&aacute;dy v r&aacute;mci cel&eacute; ČR.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Kontakt:</h2>\r\n\r\n<p>Koordin&aacute;tor projektu<br />\r\nIng. Petr Alexander, CSc.<br />\r\n+420 774 909 905</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ol>\r\n</ol>\r\n', 0),
(77, 'de', 'Podpořte festival', '', '', 'podpote-festival', '<p>&nbsp;</p>\r\n', 0),
(77, 'en', 'Podpořte festival', '', '', 'podpote-festival', '<p>&nbsp;</p>\r\n', 0),
(78, 'cs', 'Napsali o nás', '', '', 'napsali-o-nas', '<p>&nbsp;</p>\r\n', 0),
(78, 'de', 'Napsali o nás', '', '', 'napsali-o-ns', '<p>&nbsp;</p>\r\n', 0),
(78, 'en', 'Napsali o nás', '', '', 'napsali-o-ns', '<p>&nbsp;</p>\r\n', 0),
(79, 'cs', 'LSFF 2011', '', '', 'lsff-2011', '<p>&nbsp;</p>\r\n', 0),
(79, 'de', 'LSFF 2011', '', '', 'lsff-2011', '<p>&nbsp;</p>\r\n', 0),
(79, 'en', 'LSFF 2011', '', '', 'lsff-2011', '<p>&nbsp;</p>\r\n', 0),
(80, 'cs', 'LSFF 2012', '', '', 'lsff-2012', '<p>&nbsp;</p>\r\n', 0),
(80, 'de', 'LSFF 2012', '', '', 'lsff-2012', '<p>&nbsp;</p>\r\n', 0),
(80, 'en', 'LSFF 2012', '', '', 'lsff-2012', '<p>&nbsp;</p>\r\n', 0),
(81, 'cs', 'Program', '', '', 'program', '<p>&nbsp;</p>\r\n', 0),
(81, 'de', 'Program', '', '', 'program', '<p>&nbsp;</p>\r\n', 0),
(81, 'en', 'Program', '', '', 'program', '<p>&nbsp;</p>\r\n', 0),
(82, 'cs', 'Katalog filmu', '', '', 'katalog-filmu', '<p>&nbsp;</p>\r\n', 0),
(82, 'de', 'Katalog filmu', '', '', 'katalog-filmu', '<p>&nbsp;</p>\r\n', 0),
(82, 'en', 'Katalog filmu', '', '', 'katalog-filmu', '<p>&nbsp;</p>\r\n', 0),
(83, 'cs', 'Pro návštěvníky', '', '', 'pro-nvtvnky', '<p>&nbsp;</p>\r\n', 0),
(83, 'de', 'Pro návštěvníky', '', '', 'pro-nvtvnky', '<p>&nbsp;</p>\r\n', 0),
(83, 'en', 'Pro návštěvníky', '', '', 'pro-nvtvnky', '<p>&nbsp;</p>\r\n', 0),
(84, 'cs', 'Akreditace', '', '', 'akreditace', '<h1>Akreditace</h1>\r\n\r\n<h2>Akreditačn&iacute; a informačn&iacute; centrum LSFF</h2>\r\n\r\n<p>Ponděl&iacute; &ndash; Čtvrtek: 13:00 &ndash; 20:00</p>\r\n\r\n<h3><img alt="" src="/upload/images/IMG_9192.jpg" style="width: 524px; height: 354px; " /></h3>\r\n\r\n<h3>Kruhov&aacute; Hala ČZU</h3>\r\n\r\n<p>V&scaron;ichni n&aacute;v&scaron;těvn&iacute;ci maj&iacute; vstup na festival zdarma. N&aacute;v&scaron;těvn&iacute;ci se mohou akreditovat v Akreditačn&iacute;m a informačn&iacute;m centru LSFF v Kruhov&eacute; hale ČZU od ponděl&iacute; 15. ř&iacute;jna 2012. Akreditovan&iacute; &uacute;častn&iacute;ci obdrž&iacute; zdarma informačn&iacute; materi&aacute;ly a maj&iacute; voln&yacute; vstup na filmov&eacute; a doprovodn&eacute; akce festivalu. Ubytov&aacute;n&iacute; si každ&yacute; &uacute;častn&iacute;k hrad&iacute; s&aacute;m.</p>\r\n\r\n<h3><img alt="" src="/upload/images/IMG_9271.jpg" style="width: 524px; height: 350px; " /></h3>\r\n\r\n<h3>Infost&aacute;nek LSFF před menzou ČZU</h3>\r\n\r\n<p>&nbsp;</p>\r\n', 0),
(84, 'de', 'Akreditace', '', '', 'akreditace', '<p>&nbsp;</p>\r\n', 0),
(84, 'en', 'Akreditace', '', '', 'akreditace', '<p>&nbsp;</p>\r\n', 0),
(85, 'cs', 'Individuální projekce', '', '', 'individuln-projekce', '<p>&nbsp;</p>\r\n', 0),
(85, 'de', 'Individuální projekce', '', '', 'individuln-projekce', '<p>&nbsp;</p>\r\n', 0),
(85, 'en', 'Individuální projekce', '', '', 'individuln-projekce', '<p>&nbsp;</p>\r\n', 0),
(86, 'cs', 'Ke stažení', '', '', 'ke-staen', '<p>&nbsp;</p>\r\n', 0),
(86, 'de', 'Ke stažení', '', '', 'ke-staen', '<p>&nbsp;</p>\r\n', 0),
(86, 'en', 'Ke stažení', '', '', 'ke-staen', '<p>&nbsp;</p>\r\n', 0),
(87, 'cs', 'Pro média', '', '', 'pro-mdia', '<p>&nbsp;</p>\r\n', 0),
(87, 'de', 'Pro média', '', '', 'pro-mdia', '<p>&nbsp;</p>\r\n', 0),
(87, 'en', 'Pro média', '', '', 'pro-mdia', '<p>&nbsp;</p>\r\n', 0),
(88, 'cs', 'Festivalník', '', '', 'festivalnk', '<p>&nbsp;</p>\r\n', 0),
(88, 'de', 'Festivalník', '', '', 'festivalnk', '<p>&nbsp;</p>\r\n', 0),
(88, 'en', 'Festivalník', '', '', 'festivalnk', '<p>&nbsp;</p>\r\n', 0),
(89, 'cs', 'Multimédia', '', '', 'multimdia', '<p>&nbsp;</p>\r\n', 0),
(89, 'de', 'Multimédia', '', '', 'multimdia', '<p>&nbsp;</p>\r\n', 0),
(89, 'en', 'Multimédia', '', '', 'multimdia', '<p>&nbsp;</p>\r\n', 0),
(90, 'cs', 'Fotogalerie', '', '', 'fotogalerie', '<p>&nbsp;</p>\r\n', 0),
(90, 'de', 'Fotogalerie', '', '', 'fotogalerie', '<p>&nbsp;</p>\r\n', 0),
(90, 'en', 'Fotogalerie', '', '', 'fotogalerie', '<p>&nbsp;</p>\r\n', 0),
(91, 'cs', 'Videogalerie', '', '', 'videogalerie', '<p><iframe allowfullscreen="" frameborder="0" height="200" src="https://www.youtube.com/embed/pzQ2uV0tdpo?feature=player_detailpage" width="300"></iframe></p>\r\n\r\n<p><iframe allowfullscreen="" allowfullscreens="" frameborder="0" height="360" mozallowfullscreen="" src="http://www.youtube.com/embed/NgsfMmnz2jM" webkitallowfullscreen="" width="440"></iframe><iframe allowfullscreen="" frameborder="0" height="300" mozallowfullscreen="" src="http://player.vimeo.com/video/48649748" webkitallowfullscreen="" width="400"></iframe></p>\r\n', 0),
(91, 'de', 'Videogalerie', '', '', 'videogalerie', '<p>&nbsp;</p>\r\n', 0),
(91, 'en', 'Videogalerie', '', '', 'videogalerie', '<p>&nbsp;</p>\r\n', 0),
(92, 'cs', 'Harvest point', '', '', 'harvest-point', '<p>&nbsp;</p>\r\n', 0),
(92, 'de', 'Harvest point', '', '', 'harvest-point', '<p>&nbsp;</p>\r\n', 0),
(92, 'en', 'Harvest point', '', '', 'harvest-point', '<p>&nbsp;</p>\r\n', 0),
(93, 'cs', 'Informace', '', '', 'informace', '<p>&nbsp;</p>\r\n', 0),
(93, 'de', 'Information', '', '', 'information', '<p>&nbsp;</p>\r\n', 0),
(93, 'en', 'Information', '', '', 'information', '<p>&nbsp;</p>\r\n', 0),
(94, 'cs', 'Doporučujeme', '', '', 'doporuujeme', '<p>&nbsp;</p>\r\n', 0),
(94, 'de', 'Doporučujeme', '', '', 'doporuujeme', '<p>&nbsp;</p>\r\n', 0),
(94, 'en', 'Doporučujeme', '', '', 'doporuujeme', '<p>&nbsp;</p>\r\n', 0);

-- --------------------------------------------------------

--
-- Struktura tabulky `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `user` varchar(60) NOT NULL,
  `password` varchar(40) NOT NULL,
  `role` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'paranoid mode',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user`),
  KEY `is_deleted` (`is_deleted`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=40 ;

--
-- Vypisuji data pro tabulku `user`
--

INSERT INTO `user` (`id`, `name`, `user`, `password`, `role`, `created_at`, `updated_at`, `is_deleted`) VALUES
(1, 'Vladimir Polak', 'perun', '0bbb7dd9c8d56dcbb830a9cf0bb9856ca1f27b5b', 'admin', '2013-04-26 18:29:09', '2013-04-26 18:29:09', 0),
(33, 'Testovací editor', 'editor', 'a1991481a06f5faf58c5ce864884acadd57d330d', 'editor', '2013-04-26 18:36:42', '2013-04-26 18:36:42', 0),
(34, 'Testovací admin', 'admin', '9e4f8ba09769bff3230b47182500660513902edc', 'admin', '2013-04-26 18:37:35', '2013-04-26 18:37:35', 0),
(36, 'inzert', 'inzert', '82646709b281eee4593f05fe4f985848967f12eb', 'admin', '2013-05-17 11:32:11', '2013-05-17 11:32:11', 1),
(37, 'Tomáš Vlasák', 'tomas.vlasak', 'c6b007371de8d58b9b57555265f9ddcf25dba478', 'editor', '2013-05-21 08:11:28', '2013-05-21 08:11:28', 1),
(38, 'Karolína Erbenová', 'karolina.erbenova', '9b3478fce745fb731419abcee91c7a7c9ece1bfe', 'editor', '2013-05-21 08:12:06', '2013-05-21 08:12:06', 1),
(39, 'Eva Táborská', 'eva.taborska', 'c08a2d3dab66ba3b9f9a83f100abf88169f6afbe', 'editor', '2013-05-21 08:12:31', '2013-05-21 08:12:31', 1);

-- --------------------------------------------------------

--
-- Struktura tabulky `videogallery`
--

CREATE TABLE IF NOT EXISTS `videogallery` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `image` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_active` (`is_active`,`created_by`,`updated_by`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci COMMENT='videogalerie' AUTO_INCREMENT=4 ;

--
-- Vypisuji data pro tabulku `videogallery`
--

INSERT INTO `videogallery` (`id`, `url`, `title`, `is_active`, `image`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'http://www.youtube.com/embed/NgsfMmnz2jM', 'Video 1aa', 1, '/videogalleryImages/redirect.jpg', '2013-06-25 23:52:56', '2013-07-05 21:17:03', NULL, NULL),
(2, 'http://www.youtube.com/embed/NgsfMmnz2jM', '', 1, '/videogalleryImages/01index.jpg', '2013-06-25 23:53:29', '2013-06-25 23:53:29', NULL, NULL),
(3, 'http://player.vimeo.com/video/48649748', '', 1, '/videogalleryImages/01index.jpg', '2013-06-25 23:54:47', '2013-06-25 23:54:47', NULL, NULL);

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `actuality_lang`
--
ALTER TABLE `actuality_lang`
  ADD CONSTRAINT `actuality_lang_ibfk_1` FOREIGN KEY (`actuality_id`) REFERENCES `actuality` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Omezení pro tabulku `advertisement`
--
ALTER TABLE `advertisement`
  ADD CONSTRAINT `advertisement_ibfk_1` FOREIGN KEY (`print_id`) REFERENCES `print` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `advertisement_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `advertisement_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Omezení pro tabulku `staticPage`
--
ALTER TABLE `staticPage`
  ADD CONSTRAINT `staticPage_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `staticPage_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Omezení pro tabulku `staticPage_lang`
--
ALTER TABLE `staticPage_lang`
  ADD CONSTRAINT `staticPage_lang_ibfk_1` FOREIGN KEY (`staticPage_id`) REFERENCES `staticPage` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
