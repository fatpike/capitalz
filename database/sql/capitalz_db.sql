-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 14, 2020 at 07:06 PM
-- Server version: 5.7.26
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+01:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `capitalz_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
CREATE TABLE IF NOT EXISTS `job`
(
    `job_id`     int(7)       NOT NULL AUTO_INCREMENT,
    `company_id` int(7)       NOT NULL,
    `title`      varchar(75)  NOT NULL,
    `tag`        varchar(100) NOT NULL,
    `desc`       text         NOT NULL,
    `date_start` date         NOT NULL,
    `date_end`   date         NOT NULL,
    `work_hours` varchar(20)  NOT NULL,
    `work_sal`   varchar(20)  NOT NULL,
    PRIMARY KEY (`job_id`, `company_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- --------------------------------------------------------

--
-- Table structure for table `profile_co`
--

DROP TABLE IF EXISTS `profile_co`;
CREATE TABLE IF NOT EXISTS `profile_co`
(
    `profile_id`   int(7)       NOT NULL AUTO_INCREMENT,
    `user_id`      int(7)       NOT NULL,
    `company_name` varchar(255) NOT NULL,
    `state`        varchar(45)  NOT NULL,
    `city`         varchar(45)  NOT NULL,
    `address`      varchar(100) NOT NULL,
    `postal`       varchar(6)   NOT NULL,
    `about`        text         NOT NULL,
    `website`      varchar(255) NOT NULL,
    `pro_img`      varchar(255) DEFAULT NULL,
    PRIMARY KEY (`profile_id`, `user_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- --------------------------------------------------------

--
-- Table structure for table `profile_se`
--

DROP TABLE IF EXISTS `profile_se`;
CREATE TABLE IF NOT EXISTS `profile_se`
(
    `profile_id`  int(7)             NOT NULL AUTO_INCREMENT,
    `user_id`     int(7)             NOT NULL,
    `firstname`   varchar(50)        NOT NULL,
    `infix`       varchar(15)        NOT NULL,
    `lastname`    varchar(50)        NOT NULL,
    `birthday`    date               NOT NULL,
    `gender`      enum ('m','f','o') NOT NULL,
    `nationality` varchar(50)        NOT NULL,
    `about`       text               NOT NULL,
    `cv_file`     varchar(255) DEFAULT NULL,
    `pro_img`     varchar(255) DEFAULT NULL,
    PRIMARY KEY (`profile_id`, `user_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user`
(
    `user_id`   int(7)         NOT NULL AUTO_INCREMENT,
    `email`     varbinary(271) NOT NULL,
    `password`  varchar(255)   NOT NULL,
    `number`    varchar(20)    NOT NULL,
    `user_role` int(7)         NOT NULL,
    `code`      int(7) DEFAULT NULL,
    PRIMARY KEY (`user_id`),
    UNIQUE KEY `email_UNIQUE` (`email`),
    UNIQUE KEY `number_UNIQUE` (`number`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

INSERT INTO `user` (`user_id`, `email`, `password`, `number`, `user_role`, `code`)
VALUES (1, 'admin@mail.nl', '$2a$07$1tinr2hhyuBdTDC3ZyARSepsXiDZNGABuyz1dPDCqzGJK.mHz/u5u', 'NL-09876543-B21', 0, null),
       (2, 'bedrijf@mail.nl', '$2a$07$SuDcoE3k72g9Azgjz9i2GeM0fGPJHdtfTZFxSid0EV/2tNzxbmoIe', 'NL-13579246-B80', 1, null),
       (3, 'zzp@mail.nl', '$2a$07$LVj3fDfTw7KelOjZgdbbdukF1vhT3IJpXlFLPRUY2FBuKtLHn6CJ.', 'NL-12345678-B90', 2, null);
-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE IF NOT EXISTS `user_role`
(
    `role_id`    int(7)      NOT NULL AUTO_INCREMENT,
    `role_title` varchar(50) NOT NULL,
    PRIMARY KEY (`role_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8;

INSERT INTO `user_role` (`role_id`, `role_title`)
VALUES (0, 'admin'),
       (1, 'company'),
       (2, 'selfemployed');

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
