-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 24, 2024 at 08:54 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `about`
--

CREATE TABLE `about` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text NOT NULL,
  `subject` text NOT NULL,
  `subject2` text DEFAULT NULL,
  `subject3` text DEFAULT NULL,
  `subject4` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `about`
--

INSERT INTO `about` (`id`, `title`, `subject`, `subject2`, `subject3`, `subject4`, `created_at`, `updated_at`) VALUES
(1, 'This Company helps you in many fields like(AI,Machine Learning,Computer Vision)', 'We also provide face detection programming', 'Advanced AI Systems\n', 'Face Anti-Spoofing', 'We make it possible to get GPU-class machine vision performance on commoditized hardware such as ubiquitous CPUs, mCPUs, embedded systems, and compute-constrained devices.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('a@f.com|127.0.0.1', 'i:1;', 1719161184),
('a@f.com|127.0.0.1:timer', 'i:1719161184;', 1719161184),
('eslam@gmail.com|127.0.0.1', 'i:2;', 1719312622),
('eslam@gmail.com|127.0.0.1:timer', 'i:1719312622;', 1719312622),
('hossameslam79@gmail.com111|127.0.0.1', 'i:1;', 1719161210),
('hossameslam79@gmail.com111|127.0.0.1:timer', 'i:1719161210;', 1719161210);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `content`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'post comment', 1, '2024-05-22 06:19:12', '2024-05-22 06:19:12'),
(2, 'another comment', 1, '2024-05-22 06:47:34', '2024-05-22 06:47:34');

-- --------------------------------------------------------

--
-- Table structure for table `contactus`
--

CREATE TABLE `contactus` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contactus`
--

INSERT INTO `contactus` (`id`, `name`, `email`, `subject`, `message`, `created_at`) VALUES
(1, '123', 'hossameslam791@gmail.com', 'a', '1', '2024-05-14 10:14:52');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_05_09_123237_news', 2),
(5, '2024_05_13_115638_subscription', 3),
(6, '2024_05_22_111333_create_comments_table', 4),
(7, '2024_05_23_132324_about', 5),
(8, '2024_05_25_100452_financial', 6),
(9, '2024_05_25_112711_financial', 7),
(10, '2024_05_25_120801_financial', 8),
(11, '2024_05_25_121048_subscription', 8),
(12, '2024_05_25_121842_financial', 9),
(13, '2024_05_25_121845_subscription', 9),
(14, '2024_05_25_124811_financial', 10),
(15, '2024_05_25_124806_subscription', 11),
(16, '2024_05_25_134517_subscription', 12),
(17, '2024_05_25_201707_subscription', 13),
(18, '2024_05_28_082224_services', 14),
(19, '2024_06_11_111028_myplans', 15),
(20, '2024_06_13_151418_create_personal_access_tokens_table', 16),
(21, '2024_06_22_151527_create_visitors_table', 17),
(25, '2024_06_27_133413_create_notifications_table', 18);

-- --------------------------------------------------------

--
-- Table structure for table `myplans`
--

CREATE TABLE `myplans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscription_id` bigint(20) UNSIGNED NOT NULL,
  `package_id` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `package_name` varchar(255) NOT NULL,
  `duration` varchar(255) NOT NULL,
  `property2` varchar(255) NOT NULL,
  `property3` varchar(255) NOT NULL,
  `property4` varchar(255) NOT NULL,
  `from_date` timestamp NULL DEFAULT NULL,
  `to_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `myplans`
--

INSERT INTO `myplans` (`id`, `subscription_id`, `package_id`, `user_id`, `package_name`, `duration`, `property2`, `property3`, `property4`, `from_date`, `to_date`, `created_at`, `updated_at`) VALUES
(33, 62, 3, 1, 'Large', '6 months', 'prop2', 'prop3', 'prop4', '2024-06-25 09:42:36', '2025-03-25 09:42:36', '2024-06-25 06:42:36', '2024-09-24 16:51:24'),
(46, 75, 2, 25, 'Medium', '3 months', 'prop2', 'prop3', 'prop4', '2024-06-29 13:55:28', '2024-09-29 13:55:28', '2024-06-29 10:55:28', '2024-07-01 09:57:27'),
(47, 76, 2, 53, 'Medium', '3 months', 'prop2', 'prop3', 'prop4', '2024-06-29 18:21:31', '2024-09-29 18:21:31', '2024-06-29 15:21:31', '2024-06-29 15:21:31'),
(49, 78, 3, 25, 'Large', '6 months', 'prop2', 'prop3', 'prop4', '2024-07-01 11:05:35', '2025-01-01 11:05:35', '2024-07-01 08:05:35', '2024-07-01 08:05:35'),
(56, 85, 2, 59, 'Medium', '3 months', 'prop2', 'prop3', 'prop4', '2024-09-24 16:46:16', '2025-03-24 16:46:16', '2024-09-24 13:46:16', '2024-09-24 13:46:28');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` varchar(255) NOT NULL,
  `photo` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `body`, `photo`, `created_at`, `updated_at`) VALUES
(3, 'new1', 'hello', 'assets/img/news/new1.jpg', '2024-05-11 07:20:22', '2024-06-05 10:30:32'),
(4, 'new2', 'welcome', 'assets/img/news/new2.png', '2024-05-22 05:11:05', '2024-06-05 10:30:33');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('04a4cc9d-e61f-4da2-ab64-7ba0edc6a557', 'App\\Notifications\\NewUserMakePayment', 'App\\Models\\User', 1, '{\"user_id\":85,\"type\":\"NewUserMakePayment\",\"data\":{\"name\":null,\"email\":null}}', NULL, '2024-09-24 13:46:28', '2024-09-24 13:46:28'),
('09b7f133-dab9-48b2-b63d-07e3819fa4cf', 'App\\Notifications\\NewUserMakePayment', 'App\\Models\\User', 1, '{\"user_id\":62,\"type\":\"NewUserMakePayment\",\"data\":{\"name\":null,\"email\":null}}', NULL, '2024-09-24 16:51:24', '2024-09-24 16:51:24'),
('0d9e4b5c-c74c-4958-9f9e-ae8233077858', 'App\\Notifications\\NewUserMakePayment', 'App\\Models\\User', 1, '{\"user_id\":86,\"type\":\"NewUserMakePayment\",\"data\":{\"name\":null,\"email\":null}}', NULL, '2024-09-24 13:26:57', '2024-09-24 13:26:57'),
('28b9f1cf-1d03-40c8-aa3a-bdafef93c72c', 'App\\Notifications\\NewUserRegistered', 'App\\Models\\User', 1, '{\"user_id\":59,\"type\":\"NewUserRegistered\",\"data\":{\"name\":\"eslam\",\"email\":\"hossameslam123456@gmail.com\"}}', NULL, '2024-09-24 10:05:53', '2024-09-24 10:05:53'),
('2d502f3a-e7f5-4271-ad5e-3f2d3ef14e9b', 'App\\Notifications\\NewUserMakePayment', 'App\\Models\\User', 22, '{\"user_id\":83,\"type\":\"NewUserMakePayment\",\"data\":{\"name\":null,\"email\":null}}', NULL, '2024-09-24 10:06:27', '2024-09-24 10:06:27'),
('2ebcf9c9-7634-4dba-b3e7-5a79644bdbcf', 'App\\Notifications\\NewUserMakePayment', 'App\\Models\\User', 22, '{\"user_id\":84,\"type\":\"NewUserMakePayment\",\"data\":{\"name\":null,\"email\":null}}', NULL, '2024-09-24 13:34:45', '2024-09-24 13:34:45'),
('2f2eaffc-d425-45cd-a003-512d1a57a0dc', 'App\\Notifications\\NewUserMakePayment', 'App\\Models\\User', 1, '{\"user_id\":83,\"type\":\"NewUserMakePayment\",\"data\":{\"name\":null,\"email\":null}}', NULL, '2024-09-24 10:06:27', '2024-09-24 10:06:27'),
('3a9280aa-4eac-4b19-bbdb-0eb94c0356ae', 'App\\Notifications\\NewUserMakePayment', 'App\\Models\\User', 22, '{\"user_id\":85,\"type\":\"NewUserMakePayment\",\"data\":{\"name\":null,\"email\":null}}', NULL, '2024-09-24 13:46:28', '2024-09-24 13:46:28'),
('44a99d2d-4c90-4bcc-952c-d73ee1776f19', 'App\\Notifications\\NewUserMakePayment', 'App\\Models\\User', 22, '{\"user_id\":83,\"type\":\"NewUserMakePayment\",\"data\":{\"name\":null,\"email\":null}}', NULL, '2024-09-24 11:30:03', '2024-09-24 11:30:03'),
('538a5834-747c-4d3d-8de7-0112a075d25a', 'App\\Notifications\\NewUserMakePayment', 'App\\Models\\User', 22, '{\"user_id\":84,\"type\":\"NewUserMakePayment\",\"data\":{\"name\":null,\"email\":null}}', NULL, '2024-09-24 13:30:48', '2024-09-24 13:30:48'),
('5b6566e9-8381-4f18-951a-da4c741de568', 'App\\Notifications\\NewUserMakePayment', 'App\\Models\\User', 1, '{\"user_id\":83,\"type\":\"NewUserMakePayment\",\"data\":{\"name\":null,\"email\":null}}', NULL, '2024-09-24 11:29:45', '2024-09-24 11:29:45'),
('62add70c-a437-4dbf-be32-8498427cbac9', 'App\\Notifications\\NewUserMakePayment', 'App\\Models\\User', 22, '{\"user_id\":82,\"type\":\"NewUserMakePayment\",\"data\":{\"name\":null,\"email\":null}}', NULL, '2024-08-14 10:30:33', '2024-08-14 10:30:33'),
('62e5aefb-81ab-4b5d-98e5-766fca1e4bdc', 'App\\Notifications\\NewUserMakePayment', 'App\\Models\\User', 1, '{\"user_id\":83,\"type\":\"NewUserMakePayment\",\"data\":{\"name\":null,\"email\":null}}', NULL, '2024-09-24 11:29:13', '2024-09-24 11:29:13'),
('79e83668-4434-43f4-a7eb-e2c3b6ee4418', 'App\\Notifications\\NewUserMakePayment', 'App\\Models\\User', 1, '{\"user_id\":83,\"type\":\"NewUserMakePayment\",\"data\":{\"name\":null,\"email\":null}}', NULL, '2024-09-24 11:28:26', '2024-09-24 11:28:26'),
('842f3d8b-6cf4-4ede-ae76-1195a3b12a95', 'App\\Notifications\\NewUserRegistered', 'App\\Models\\User', 22, '{\"user_id\":59,\"type\":\"NewUserRegistered\",\"data\":{\"name\":\"eslam\",\"email\":\"hossameslam123456@gmail.com\"}}', NULL, '2024-09-24 10:05:53', '2024-09-24 10:05:53'),
('97cbef49-ba83-4378-8634-d9fd6552c9be', 'App\\Notifications\\NewUserMakePayment', 'App\\Models\\User', 1, '{\"user_id\":83,\"type\":\"NewUserMakePayment\",\"data\":{\"name\":null,\"email\":null}}', NULL, '2024-09-24 11:30:03', '2024-09-24 11:30:03'),
('9ff609d2-d480-4b8c-b701-b7d2bc441897', 'App\\Notifications\\NewUserMakePayment', 'App\\Models\\User', 1, '{\"user_id\":84,\"type\":\"NewUserMakePayment\",\"data\":{\"name\":null,\"email\":null}}', NULL, '2024-09-24 13:45:56', '2024-09-24 13:45:56'),
('a3ce04a6-897b-440a-8418-b8d58d5c355f', 'App\\Notifications\\NewUserMakePayment', 'App\\Models\\User', 1, '{\"user_id\":82,\"type\":\"NewUserMakePayment\",\"data\":{\"name\":null,\"email\":null}}', NULL, '2024-08-14 10:30:33', '2024-08-14 10:30:33'),
('a635a673-90f0-448c-aea2-3e6433f88633', 'App\\Notifications\\NewUserMakePayment', 'App\\Models\\User', 1, '{\"user_id\":84,\"type\":\"NewUserMakePayment\",\"data\":{\"name\":null,\"email\":null}}', NULL, '2024-09-24 13:30:29', '2024-09-24 13:30:29'),
('a96c6259-83c3-4805-a1a1-266bd7a3526b', 'App\\Notifications\\NewUserMakePayment', 'App\\Models\\User', 1, '{\"user_id\":85,\"type\":\"NewUserMakePayment\",\"data\":{\"name\":null,\"email\":null}}', NULL, '2024-09-24 13:46:16', '2024-09-24 13:46:16'),
('aa111135-25d4-40df-9882-bf22d86b12d2', 'App\\Notifications\\NewUserMakePayment', 'App\\Models\\User', 22, '{\"user_id\":84,\"type\":\"NewUserMakePayment\",\"data\":{\"name\":null,\"email\":null}}', NULL, '2024-09-24 13:35:51', '2024-09-24 13:35:51'),
('ace7ca05-c6b9-4974-9f55-65e6c6bed668', 'App\\Notifications\\NewUserMakePayment', 'App\\Models\\User', 22, '{\"user_id\":84,\"type\":\"NewUserMakePayment\",\"data\":{\"name\":null,\"email\":null}}', NULL, '2024-09-24 13:30:29', '2024-09-24 13:30:29'),
('bcd7c12e-358d-4688-b15d-dc5103b00244', 'App\\Notifications\\NewUserMakePayment', 'App\\Models\\User', 22, '{\"user_id\":86,\"type\":\"NewUserMakePayment\",\"data\":{\"name\":null,\"email\":null}}', NULL, '2024-09-24 13:26:57', '2024-09-24 13:26:57'),
('c1098c95-1c08-40a7-a79c-2d1444917e23', 'App\\Notifications\\NewUserMakePayment', 'App\\Models\\User', 22, '{\"user_id\":87,\"type\":\"NewUserMakePayment\",\"data\":{\"name\":null,\"email\":null}}', NULL, '2024-09-24 13:27:34', '2024-09-24 13:27:34'),
('cc89a39f-56ef-4659-9391-083d22a6a4d1', 'App\\Notifications\\NewUserMakePayment', 'App\\Models\\User', 22, '{\"user_id\":84,\"type\":\"NewUserMakePayment\",\"data\":{\"name\":null,\"email\":null}}', NULL, '2024-09-24 13:45:56', '2024-09-24 13:45:56'),
('cf58b3f7-0f07-4aa7-a6ac-ed7e2fc5155d', 'App\\Notifications\\NewUserRegistered', 'App\\Models\\User', 1, '{\"user_id\":58,\"type\":\"NewUserRegistered\",\"data\":{\"name\":\"cams\",\"email\":\"12@gmail.com\"}}', NULL, '2024-08-14 10:32:30', '2024-08-14 10:32:30'),
('d0eff4c0-3843-4e40-9a4f-97ba27c7327f', 'App\\Notifications\\NewUserMakePayment', 'App\\Models\\User', 1, '{\"user_id\":84,\"type\":\"NewUserMakePayment\",\"data\":{\"name\":null,\"email\":null}}', NULL, '2024-09-24 13:34:45', '2024-09-24 13:34:45'),
('d1cc6ad9-8a0e-4d80-87ca-4e8f4b1df97a', 'App\\Notifications\\NewUserMakePayment', 'App\\Models\\User', 22, '{\"user_id\":62,\"type\":\"NewUserMakePayment\",\"data\":{\"name\":null,\"email\":null}}', NULL, '2024-09-24 16:51:24', '2024-09-24 16:51:24'),
('d500b2a3-8fb0-4670-a4e0-48395c5b5bff', 'App\\Notifications\\NewUserMakePayment', 'App\\Models\\User', 22, '{\"user_id\":83,\"type\":\"NewUserMakePayment\",\"data\":{\"name\":null,\"email\":null}}', NULL, '2024-09-24 11:28:26', '2024-09-24 11:28:26'),
('da79f387-be16-43a3-8013-c06be969136d', 'App\\Notifications\\NewUserMakePayment', 'App\\Models\\User', 22, '{\"user_id\":83,\"type\":\"NewUserMakePayment\",\"data\":{\"name\":null,\"email\":null}}', NULL, '2024-09-24 11:29:13', '2024-09-24 11:29:13'),
('dfc6e617-67e6-4701-beb5-11c8b31ab7bd', 'App\\Notifications\\NewUserRegistered', 'App\\Models\\User', 22, '{\"user_id\":58,\"type\":\"NewUserRegistered\",\"data\":{\"name\":\"cams\",\"email\":\"12@gmail.com\"}}', NULL, '2024-08-14 10:32:30', '2024-08-14 10:32:30'),
('f1a8c6b4-0d0b-42c1-97ec-ba0163879df6', 'App\\Notifications\\NewUserMakePayment', 'App\\Models\\User', 1, '{\"user_id\":84,\"type\":\"NewUserMakePayment\",\"data\":{\"name\":null,\"email\":null}}', NULL, '2024-09-24 13:30:48', '2024-09-24 13:30:48'),
('f3470d88-d072-426b-b885-737dfbbc66a3', 'App\\Notifications\\NewUserMakePayment', 'App\\Models\\User', 22, '{\"user_id\":85,\"type\":\"NewUserMakePayment\",\"data\":{\"name\":null,\"email\":null}}', NULL, '2024-09-24 13:46:16', '2024-09-24 13:46:16'),
('f690c2f9-2f79-4763-aea8-8c8c874a1591', 'App\\Notifications\\NewUserMakePayment', 'App\\Models\\User', 1, '{\"user_id\":87,\"type\":\"NewUserMakePayment\",\"data\":{\"name\":null,\"email\":null}}', NULL, '2024-09-24 13:27:34', '2024-09-24 13:27:34'),
('fa4f357b-a09d-4587-9e1a-e2a1f0191f66', 'App\\Notifications\\NewUserMakePayment', 'App\\Models\\User', 22, '{\"user_id\":83,\"type\":\"NewUserMakePayment\",\"data\":{\"name\":null,\"email\":null}}', NULL, '2024-09-24 11:29:45', '2024-09-24 11:29:45'),
('fed08f33-9c96-4725-878c-1c3056e2cbae', 'App\\Notifications\\NewUserMakePayment', 'App\\Models\\User', 1, '{\"user_id\":84,\"type\":\"NewUserMakePayment\",\"data\":{\"name\":null,\"email\":null}}', NULL, '2024-09-24 13:35:51', '2024-09-24 13:35:51');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `duration` varchar(45) NOT NULL,
  `price` float NOT NULL,
  `description` text NOT NULL,
  `property2` text DEFAULT NULL,
  `property3` text DEFAULT NULL,
  `property4` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `duration`, `price`, `description`, `property2`, `property3`, `property4`, `created_at`, `updated_at`) VALUES
(1, 'Small', '1 month', 30, 'it is for 1 months', 'prop2', 'prop3', 'prop4', '2024-06-26 17:02:45', '2024-06-26 14:02:45'),
(2, 'Medium', '3 months', 60, 'it is for 3 months', 'prop2', 'prop3', 'prop4', '2024-06-08 09:58:46', '2024-06-08 06:58:46'),
(3, 'Large', '6 months', 90, 'it is for 6 months', 'prop2', 'prop3', 'prop4', '2024-06-08 09:58:47', '2024-06-08 06:58:47');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('hossameslam791@gmail.com', '$2y$12$9NhvbsBBn96zaH1PyG.VVeInnNcy6NuDnm8./GS0K/WrX6vxZ5Q92', '2024-05-07 07:31:37');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_id` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `package_id`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 1, 1, '2024-06-24 07:06:24', '2024-06-24 07:06:24'),
(3, 2, 1, '2024-06-24 07:06:40', '2024-06-24 07:06:40'),
(4, 2, 1, '2024-06-25 06:42:36', '2024-06-25 06:42:36'),
(5, 1, 1, '2024-06-26 05:42:56', '2024-06-26 05:42:56'),
(6, 3, 1, '2024-06-27 08:41:06', '2024-06-27 08:41:06'),
(7, 3, 1, '2024-06-27 08:42:27', '2024-06-27 08:42:27'),
(8, 3, 1, '2024-06-27 08:46:16', '2024-06-27 08:46:16'),
(9, 1, 1, '2024-06-29 06:02:15', '2024-06-29 06:02:15'),
(10, 1, 1, '2024-06-29 06:03:12', '2024-06-29 06:03:12'),
(11, 1, 1, '2024-06-29 06:04:14', '2024-06-29 06:04:14'),
(12, 1, 1, '2024-06-29 06:05:50', '2024-06-29 06:05:50'),
(13, 1, 1, '2024-06-29 06:06:45', '2024-06-29 06:06:45'),
(14, 1, 1, '2024-06-29 06:08:28', '2024-06-29 06:08:28'),
(15, 1, 1, '2024-06-29 06:09:15', '2024-06-29 06:09:15'),
(16, 2, 25, '2024-06-29 10:55:28', '2024-06-29 10:55:28'),
(17, 2, 53, '2024-06-29 15:21:31', '2024-06-29 15:21:31'),
(18, 1, 25, '2024-07-01 04:45:52', '2024-07-01 04:45:52'),
(19, 3, 25, '2024-07-01 08:05:35', '2024-07-01 08:05:35'),
(20, 1, 1, '2024-08-14 10:23:40', '2024-08-14 10:23:40'),
(21, 1, 1, '2024-08-14 10:27:26', '2024-08-14 10:27:26'),
(22, 1, 1, '2024-08-14 10:29:08', '2024-08-14 10:29:08'),
(23, 1, 1, '2024-08-14 10:30:33', '2024-08-14 10:30:33'),
(24, 1, 59, '2024-09-24 10:06:27', '2024-09-24 10:06:27'),
(25, 2, 59, '2024-09-24 11:21:08', '2024-09-24 11:21:08'),
(26, 2, 59, '2024-09-24 11:21:10', '2024-09-24 11:21:10'),
(27, 2, 59, '2024-09-24 11:28:26', '2024-09-24 11:28:26'),
(28, 2, 59, '2024-09-24 11:29:13', '2024-09-24 11:29:13'),
(29, 2, 59, '2024-09-24 11:29:45', '2024-09-24 11:29:45'),
(30, 2, 59, '2024-09-24 11:30:03', '2024-09-24 11:30:03'),
(31, 2, 59, '2024-09-24 11:31:36', '2024-09-24 11:31:36'),
(32, 2, 59, '2024-09-24 11:34:24', '2024-09-24 11:34:24'),
(33, 2, 59, '2024-09-24 11:35:25', '2024-09-24 11:35:25'),
(34, 2, 59, '2024-09-24 13:26:57', '2024-09-24 13:26:57'),
(35, 2, 59, '2024-09-24 13:27:34', '2024-09-24 13:27:34'),
(36, 2, 59, '2024-09-24 13:30:29', '2024-09-24 13:30:29'),
(37, 2, 59, '2024-09-24 13:30:48', '2024-09-24 13:30:48'),
(38, 2, 59, '2024-09-24 13:33:42', '2024-09-24 13:33:42'),
(39, 2, 59, '2024-09-24 13:34:45', '2024-09-24 13:34:45'),
(40, 2, 59, '2024-09-24 13:35:51', '2024-09-24 13:35:51'),
(41, 2, 59, '2024-09-24 13:39:04', '2024-09-24 13:39:04'),
(42, 2, 59, '2024-09-24 13:41:52', '2024-09-24 13:41:52'),
(43, 2, 59, '2024-09-24 13:44:15', '2024-09-24 13:44:15'),
(44, 2, 59, '2024-09-24 13:45:56', '2024-09-24 13:45:56'),
(45, 2, 59, '2024-09-24 13:46:16', '2024-09-24 13:46:16'),
(46, 2, 59, '2024-09-24 13:46:28', '2024-09-24 13:46:28'),
(47, 3, 1, '2024-09-24 16:51:24', '2024-09-24 16:51:24');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 25, 'API Token', '823840a4bb91262444026a568a034de22bcc215241e42a0460fdf1951da5b607', '[\"*\"]', NULL, NULL, '2024-06-13 10:14:45', '2024-06-13 10:14:45'),
(2, 'App\\Models\\User', 25, 'API Token', 'cf135ff730c0d91e4460106adecd8d1f5fce2991811f1c12d7def61ab7424dd8', '[\"*\"]', NULL, NULL, '2024-06-13 10:15:52', '2024-06-13 10:15:52'),
(3, 'App\\Models\\User', 25, 'API Token', '8c6bed71c3d617f6ef98e9a7a921e7382a9b696151191325b44413b3a42f44d3', '[\"*\"]', NULL, NULL, '2024-06-13 10:16:01', '2024-06-13 10:16:01'),
(4, 'App\\Models\\User', 25, 'API Token', '6cf157f3c5412b4cfdae70fc0a30268b6f280212a7bd8f2f0c8df5d269cb9ea6', '[\"*\"]', NULL, NULL, '2024-06-13 10:19:24', '2024-06-13 10:19:24'),
(5, 'App\\Models\\User', 25, 'API Token', '609257cd8f39442217d1e6319fd7adee1ec2d838fc8b156f7b607b3114193f0d', '[\"*\"]', NULL, NULL, '2024-06-13 10:21:10', '2024-06-13 10:21:10'),
(6, 'App\\Models\\User', 25, 'API Token', '0f503eba9b8a45e79452c8330649a484cb13f8d3465cdaf8d7e9491d1906b5c2', '[\"*\"]', NULL, NULL, '2024-06-13 14:25:58', '2024-06-13 14:25:58'),
(7, 'App\\Models\\User', 25, 'API Token', 'fcae8155ae967c70c7a14bdb55995c8acb00240bd9f0856cdc17d961fca3e2bf', '[\"*\"]', NULL, NULL, '2024-06-13 15:11:31', '2024-06-13 15:11:31'),
(8, 'App\\Models\\User', 25, 'API Token', '83e53ff7ced8470cdda1a304bc056a31287790c910e40610ed6dfe8165a04bad', '[\"*\"]', NULL, NULL, '2024-06-13 15:12:31', '2024-06-13 15:12:31'),
(9, 'App\\Models\\User', 25, 'API Token', '7f04b42ffea7115c49c9e109d516445e28a208a49ca2c6f0fefff99814e3581c', '[\"*\"]', NULL, NULL, '2024-06-13 15:12:47', '2024-06-13 15:12:47'),
(10, 'App\\Models\\User', 25, 'API Token', '83adc1ace15a3f7ba7a1e891621b8a25d7310cf93733a385816eaa543fe2f8dd', '[\"*\"]', NULL, NULL, '2024-06-13 15:13:27', '2024-06-13 15:13:27'),
(11, 'App\\Models\\User', 25, 'API Token', 'feb1f1c64d9c3121e89b8acdd54b08a985f97c05cafaff0c7c0659dd3b0f21ec', '[\"*\"]', NULL, NULL, '2024-06-13 15:15:55', '2024-06-13 15:15:55'),
(12, 'App\\Models\\User', 25, 'API Token', '5189de02ac7cc9f2cd3b8ddb99b10182e1eabde19f1535d1850684b0fb22c7ae', '[\"*\"]', NULL, NULL, '2024-06-13 15:16:26', '2024-06-13 15:16:26'),
(13, 'App\\Models\\User', 25, 'API Token', '309de67916176f690a6ffb753156bc961c2a0ccc2da21e27783a0e0f4f83315b', '[\"*\"]', NULL, NULL, '2024-06-13 15:16:48', '2024-06-13 15:16:48'),
(14, 'App\\Models\\User', 25, 'API Token', '224036870eb434cb45ec66ad883037a25c44e3b51edb6cb66f972eb3c3eaa3de', '[\"*\"]', NULL, NULL, '2024-06-13 15:24:59', '2024-06-13 15:24:59'),
(15, 'App\\Models\\User', 25, 'API Token', 'd07270f4c6d3813d44a2c4e9df727a98543e5175c651d3869df95771d041654b', '[\"*\"]', NULL, NULL, '2024-06-13 15:31:16', '2024-06-13 15:31:16'),
(16, 'App\\Models\\User', 25, 'API Token', '9ecdfdfa0206f912b196f4024d5bdd20a8b5dc8cdf76c3d1efd78b51da23a7df', '[\"*\"]', NULL, NULL, '2024-06-13 15:45:25', '2024-06-13 15:45:25'),
(17, 'App\\Models\\User', 25, 'API Token', '330ebff1095aef04dc5a2c76d4f176ac0076723fa77c7768b7b8d0e9ae3fc9da', '[\"*\"]', NULL, NULL, '2024-06-13 15:45:52', '2024-06-13 15:45:52'),
(18, 'App\\Models\\User', 25, 'API Token', 'e83533107eb89189de080a33d8a62779c7b52777133c5783f1b8297e3db87573', '[\"*\"]', NULL, NULL, '2024-06-13 15:46:08', '2024-06-13 15:46:08'),
(19, 'App\\Models\\User', 25, 'API Token', '09fd21441110928944fabe07315ee517ae654faeb360614f9bc89fbc53feaaab', '[\"*\"]', NULL, NULL, '2024-06-13 15:52:07', '2024-06-13 15:52:07'),
(20, 'App\\Models\\User', 25, 'API Token', 'e7824c7b73c1fc15496770ea63c12e4aa5300a82600d7bcd849aad2759f1b8e5', '[\"*\"]', NULL, NULL, '2024-06-13 15:52:19', '2024-06-13 15:52:19'),
(21, 'App\\Models\\User', 25, 'API Token', 'c56f9eeb703ff0b07ceef20fcdc668e213a5f0b6b017d7587e5ca5e7bf528504', '[\"*\"]', NULL, NULL, '2024-06-13 15:59:06', '2024-06-13 15:59:06'),
(24, 'App\\Models\\User', 28, 'API Token', '1fb81aea6d5a028c724c63e9dad30dd7d1c9c45f66d937acbc5b60b821f7d832', '[\"*\"]', NULL, NULL, '2024-06-17 06:29:31', '2024-06-17 06:29:31'),
(25, 'App\\Models\\User', 28, 'API Token', '9beafb342a0590e216b5389101f8fbcc41548182fb00ecdf3e41a24375f4207a', '[\"*\"]', NULL, NULL, '2024-06-17 06:30:01', '2024-06-17 06:30:01'),
(26, 'App\\Models\\User', 28, 'API Token', '8610df3834bdf944fc2b9f0112bcdcc99551775609d8ceed6c543b58186e7824', '[\"*\"]', NULL, NULL, '2024-06-17 06:30:18', '2024-06-17 06:30:18'),
(27, 'App\\Models\\User', 28, 'API Token', '977bb8e751fe940b49c158ed524c1dc6ba79cd5c56c156e5c3bac9900749f288', '[\"*\"]', NULL, NULL, '2024-06-17 06:30:47', '2024-06-17 06:30:47'),
(31, 'App\\Models\\User', 25, 'API Token', 'a71d9c05c66cc89942a7d60f51d3a6695f2e9644cb53c3cabf53766073a2661c', '[\"*\"]', NULL, NULL, '2024-06-17 08:30:44', '2024-06-17 08:30:44'),
(33, 'App\\Models\\User', 1, 'API Token', '91a5de308259f5d09f904d777176644825c47ba1ba9d436478b968e3ead6e762', '[\"*\"]', NULL, NULL, '2024-06-24 04:25:43', '2024-06-24 04:25:43'),
(34, 'App\\Models\\User', 1, 'API Token', '43f763f4092bb1653176f60870f7718edf4de47c32d4077b7f52974e3ff6416e', '[\"*\"]', NULL, NULL, '2024-06-24 04:25:47', '2024-06-24 04:25:47'),
(35, 'App\\Models\\User', 1, 'API Token', '9f5635daf5a0b2ed3e9b50fe8227f23c2b430fd8ff73ea7e902dcf261b743ed3', '[\"*\"]', NULL, NULL, '2024-06-24 04:27:22', '2024-06-24 04:27:22'),
(37, 'App\\Models\\User', 1, 'API Token', '993c9f3c5612736533fc737f1aee222f7c26e79c05a941c49ea5f03f64f0bc01', '[\"*\"]', NULL, NULL, '2024-06-24 05:38:43', '2024-06-24 05:38:43'),
(38, 'App\\Models\\User', 1, 'API Token', '5bd7b5edb4ceb6c1e3c7fabffa046c6ed6408397f5c003c0edc104f23c8e49f7', '[\"*\"]', NULL, NULL, '2024-06-25 06:42:47', '2024-06-25 06:42:47'),
(39, 'App\\Models\\User', 1, 'API Token', '9e6c3b88a414bc077e23a61151ae8e02b66bb748eceb3b335c15a303b1c6b1a3', '[\"*\"]', NULL, NULL, '2024-06-25 06:43:00', '2024-06-25 06:43:00'),
(40, 'App\\Models\\User', 1, 'API Token', '813ba58ed5ca1a071f901f481280a14e5ba95d3d969091e8478ee6f108903fb1', '[\"*\"]', NULL, NULL, '2024-06-25 09:55:49', '2024-06-25 09:55:49'),
(41, 'App\\Models\\User', 1, 'API Token', '1c964f20b54158100dc32fa8c3609473cac3c4eb4192e97eae6ad778c2741910', '[\"*\"]', NULL, NULL, '2024-06-25 09:56:04', '2024-06-25 09:56:04'),
(42, 'App\\Models\\User', 1, 'API Token', '5743a945281098b5622731471bf218a58e20485539528c55bcf84a10a3049a50', '[\"*\"]', NULL, NULL, '2024-06-25 09:56:37', '2024-06-25 09:56:37'),
(43, 'App\\Models\\User', 1, 'API Token', '2a60d0151855dae3be6de95d5e1bccc88a5e032b824007b759d66160eae0abf1', '[\"*\"]', NULL, NULL, '2024-06-25 09:59:05', '2024-06-25 09:59:05'),
(44, 'App\\Models\\User', 1, 'API Token', '16f77848d1289b0a96dcac2327382ef21088ea3fe06c2e716a15057bb14dd040', '[\"*\"]', NULL, NULL, '2024-06-25 09:59:27', '2024-06-25 09:59:27'),
(45, 'App\\Models\\User', 1, 'API Token', '620550fc34d0cc3770e36a195cf2110aa779787ea63998d4e335604bfbfed689', '[\"*\"]', NULL, NULL, '2024-06-25 10:03:30', '2024-06-25 10:03:30'),
(46, 'App\\Models\\User', 1, 'API Token', '15fdc3c680ae610505f17bb7a11992e68b18018a4274ec6236a18d119b09725c', '[\"*\"]', NULL, NULL, '2024-06-25 10:04:21', '2024-06-25 10:04:21'),
(47, 'App\\Models\\User', 1, 'API Token', 'a2af233af174f65c8b61f72b5612bf1b65ff9f53c87edb8c7a83e43fb4586127', '[\"*\"]', NULL, NULL, '2024-06-25 10:09:24', '2024-06-25 10:09:24'),
(49, 'App\\Models\\User', 1, 'API Token', 'bf1d6cbb7e5e9d2935e71a7a930b9fb738019a72e6e424d1db169c3770dc865c', '[\"*\"]', NULL, NULL, '2024-06-26 05:44:26', '2024-06-26 05:44:26'),
(50, 'App\\Models\\User', 1, 'API Token', 'f2ad5e17ee63a788e8985b1923fd2e0ee62ed728848409904b068fac1862d9cd', '[\"*\"]', NULL, NULL, '2024-06-26 05:44:46', '2024-06-26 05:44:46'),
(52, 'App\\Models\\User', 25, 'API Token', '80c3bfde17097918c4e4dc288cb065c828a652cc80536bee4cb15720f33e5811', '[\"*\"]', NULL, NULL, '2024-07-01 09:47:14', '2024-07-01 09:47:14'),
(53, 'App\\Models\\User', 25, 'API Token', 'da8549b538981bc00c54d1000b33243cb7da5e36255146c1e6089512ea7b2697', '[\"*\"]', NULL, NULL, '2024-07-01 09:53:56', '2024-07-01 09:53:56'),
(54, 'App\\Models\\User', 25, 'API Token', '69698dd948b63b7b6c1e699f26b26d3cb4475234ae4cd60fbcd2b4b271992f06', '[\"*\"]', NULL, NULL, '2024-07-01 09:54:31', '2024-07-01 09:54:31'),
(55, 'App\\Models\\User', 25, 'API Token', '1ab6f3a6f84f4fa563a976e4dd3d1d32faa1d90880614d3720d942e434fdc201', '[\"*\"]', NULL, NULL, '2024-07-01 09:56:16', '2024-07-01 09:56:16'),
(56, 'App\\Models\\User', 25, 'API Token', '087843d3fc770f58c1f3a2a9b0e5a7d2d677f5e7029588e04b6a121aa7dadb63', '[\"*\"]', NULL, NULL, '2024-07-01 09:56:27', '2024-07-01 09:56:27'),
(57, 'App\\Models\\User', 25, 'API Token', 'a5e0cad4f9c0a9d8135d210b7a2ac6a8837f6fc0db8ed597aee32b56e8fe805c', '[\"*\"]', NULL, NULL, '2024-07-01 09:56:37', '2024-07-01 09:56:37'),
(58, 'App\\Models\\User', 25, 'API Token', '3af4adb092c26a00b1461a7241ba4aba79488ddcac557cdd1668b2ba645a959c', '[\"*\"]', NULL, NULL, '2024-07-01 09:57:20', '2024-07-01 09:57:20'),
(59, 'App\\Models\\User', 25, 'API Token', '2ec4eccf15e7e78d1dae4ca36e2d9e428b48e6b15abff4a611f09b9e68e4accb', '[\"*\"]', NULL, NULL, '2024-07-01 09:57:24', '2024-07-01 09:57:24'),
(60, 'App\\Models\\User', 25, 'API Token', 'e6a39b1f4b3804fc74585f3dee71b417a0e7d4d629fcd2d905191e96d8843e2d', '[\"*\"]', NULL, NULL, '2024-07-01 09:57:27', '2024-07-01 09:57:27'),
(61, 'App\\Models\\User', 1, 'API Token', '5076df67fe17a87b897bdf60bdf41d48eb70c7c50558d2cfe53dc03274b885fc', '[\"*\"]', NULL, NULL, '2024-07-21 07:48:09', '2024-07-21 07:48:09'),
(62, 'App\\Models\\User', 1, 'API Token', '9037ff0f81e11ebdd35b7ab75ec0d557e75b95c8481cf8ba6ef08d8d70ce4fc9', '[\"*\"]', NULL, NULL, '2024-07-21 07:48:11', '2024-07-21 07:48:11'),
(63, 'App\\Models\\User', 1, 'API Token', '8ef6c91346ba059770668ef685bd8c7bfeaae8a54369f8bcd85277d4810809b8', '[\"*\"]', NULL, NULL, '2024-07-30 09:34:04', '2024-07-30 09:34:04'),
(64, 'App\\Models\\User', 1, 'API Token', 'd2f74567fa05d006a8336630f974cfe7fa935067c90b2991925ecabdb22e9070', '[\"*\"]', NULL, NULL, '2024-07-30 09:34:06', '2024-07-30 09:34:06'),
(65, 'App\\Models\\User', 1, 'API Token', '9b18342d88644ea044103a776f622001763c660aac7e5a6330f111bd0235ff3e', '[\"*\"]', NULL, NULL, '2024-07-30 09:38:40', '2024-07-30 09:38:40'),
(66, 'App\\Models\\User', 1, 'API Token', 'f8e25f94911fabdb7f47cfad21d23caf3a84fc158a11a9034597403f7df4a9e7', '[\"*\"]', NULL, NULL, '2024-07-30 09:38:42', '2024-07-30 09:38:42'),
(67, 'App\\Models\\User', 1, 'API Token', '9303305cb18db5f1c9d550a004e4dd0b32077846def844dcde1e4278338bb05a', '[\"*\"]', NULL, NULL, '2024-07-30 09:38:45', '2024-07-30 09:38:45'),
(68, 'App\\Models\\User', 1, 'API Token', 'd65abb03980e6681c9466d816a4e7b42edc396cb6e8a799d1648b549377ff300', '[\"*\"]', NULL, NULL, '2024-07-30 09:38:46', '2024-07-30 09:38:46'),
(69, 'App\\Models\\User', 1, 'API Token', 'a70eeb96f2147277096e90954a6dadee1a546ba33ee1f2e73b6f94d8da992173', '[\"*\"]', NULL, NULL, '2024-07-30 09:38:59', '2024-07-30 09:38:59'),
(70, 'App\\Models\\User', 1, 'API Token', '4e1b93ffbfec238c464f3c30d50b89a96052ba6f702eac6bb70f2583d9d2b148', '[\"*\"]', NULL, NULL, '2024-07-30 09:39:01', '2024-07-30 09:39:01'),
(71, 'App\\Models\\User', 1, 'API Token', '782d58c7ca64ae8e96d09c21844e8615a95925d5bc0ae4ab3278057e358f3e5c', '[\"*\"]', NULL, NULL, '2024-07-30 09:43:32', '2024-07-30 09:43:32'),
(72, 'App\\Models\\User', 1, 'API Token', 'd59217480a91123db2426b4db34bbbcd9e0b80312d83863710d5e58d0dae5d9e', '[\"*\"]', NULL, NULL, '2024-07-30 09:43:33', '2024-07-30 09:43:33'),
(73, 'App\\Models\\User', 1, 'API Token', '1a334759a1280cbcc484117f5f9831c87d4bec71fa5a79915861e4d4264f1b26', '[\"*\"]', NULL, NULL, '2024-07-30 09:43:37', '2024-07-30 09:43:37'),
(74, 'App\\Models\\User', 1, 'API Token', '69aa69b061b0df3360e67b76e670c314565f8fd40d648527a8489bf7e1ccdcd6', '[\"*\"]', NULL, NULL, '2024-07-30 09:43:44', '2024-07-30 09:43:44'),
(75, 'App\\Models\\User', 1, 'API Token', '6f01cc0fa3576ecb22e03c7e2e4dce449726f31f59dc1dffc0f311031deae1a1', '[\"*\"]', NULL, NULL, '2024-07-30 10:22:52', '2024-07-30 10:22:52'),
(76, 'App\\Models\\User', 1, 'API Token', '5efa0f82ef2b1c60f941d22e81410fb2f516b60f6725b291b07fd109696e5d14', '[\"*\"]', NULL, NULL, '2024-07-30 10:22:52', '2024-07-30 10:22:52'),
(77, 'App\\Models\\User', 1, 'API Token', '4be0bff72fde96a20983b444c4eabff206cb7494f50c5f6c95f9fa654ab6293b', '[\"*\"]', NULL, NULL, '2024-07-30 10:22:54', '2024-07-30 10:22:54'),
(78, 'App\\Models\\User', 1, 'API Token', '712586d3654d5beff3942b05e311981e62556f409b66e7429b7ec5b1a2776302', '[\"*\"]', NULL, NULL, '2024-07-30 10:27:48', '2024-07-30 10:27:48'),
(79, 'App\\Models\\User', 1, 'API Token', 'a9c35d5ce86d8be771330b7b60eb07bd7e75fa4717231bb328bc41415e8df198', '[\"*\"]', NULL, NULL, '2024-07-30 10:27:55', '2024-07-30 10:27:55'),
(80, 'App\\Models\\User', 1, 'API Token', 'da82433c592e7732de365d6f4b58dd433686eb25329eb4ff32572c3e156dac9d', '[\"*\"]', NULL, NULL, '2024-07-30 10:28:46', '2024-07-30 10:28:46'),
(81, 'App\\Models\\User', 1, 'API Token', '2ab0ced9f9c2f76f589657b3981ff5da039a8d4d7afeb52c815d437998d66dac', '[\"*\"]', NULL, NULL, '2024-07-30 10:28:48', '2024-07-30 10:28:48'),
(82, 'App\\Models\\User', 1, 'API Token', '5e5d82ce3c469efcf8e9135b416bfedd047b6b65166ba48efc59794f49ae6c66', '[\"*\"]', NULL, NULL, '2024-07-30 10:29:38', '2024-07-30 10:29:38'),
(83, 'App\\Models\\User', 1, 'API Token', 'af4a467aafe084776b35981d2be82397ceb95584f9e08479d1dc36b72bd17244', '[\"*\"]', NULL, NULL, '2024-07-30 10:29:40', '2024-07-30 10:29:40'),
(84, 'App\\Models\\User', 1, 'API Token', 'f32439a4f9f40b3f84a336a580cc9ee34933bf742eb7baf69b55b4ac37162245', '[\"*\"]', NULL, NULL, '2024-07-30 10:30:33', '2024-07-30 10:30:33'),
(85, 'App\\Models\\User', 1, 'API Token', '6839e0068a12e066b2ef911a79e2ea7e9333fe50e6b8b41d7d22b819f96c2166', '[\"*\"]', NULL, NULL, '2024-07-30 10:30:35', '2024-07-30 10:30:35'),
(86, 'App\\Models\\User', 1, 'API Token', '3ccc0ce9f292448eab92fff4f4f88572bfbe742b104bcc07588fd40dea9ed30b', '[\"*\"]', NULL, NULL, '2024-07-30 10:30:41', '2024-07-30 10:30:41'),
(87, 'App\\Models\\User', 1, 'API Token', '8abff15885ee9cd2d50774fb0a10fba19b6ec6c8c035101b629d1d17360bbf5e', '[\"*\"]', NULL, NULL, '2024-07-30 10:30:45', '2024-07-30 10:30:45'),
(88, 'App\\Models\\User', 1, 'API Token', '51920307b1e0685a70b37a59b8a03a5db444498dec28430fabf3ded94c8c5068', '[\"*\"]', NULL, NULL, '2024-07-30 10:32:39', '2024-07-30 10:32:39'),
(89, 'App\\Models\\User', 1, 'API Token', 'fd6516bd22a39608c6c737136997f038939ecdbd6e81fb8cbae9a0bcd3ccb13c', '[\"*\"]', NULL, NULL, '2024-07-30 10:32:40', '2024-07-30 10:32:40'),
(90, 'App\\Models\\User', 1, 'API Token', '9b3e3e001bf30cfb136beb5798f82f51ab5a7af1d905fd497d09e34b8efeb9c6', '[\"*\"]', NULL, NULL, '2024-07-30 10:32:46', '2024-07-30 10:32:46'),
(91, 'App\\Models\\User', 1, 'API Token', '327e85cc399c75d128d244f5ced901902ae7adc85041e0d51aae15bb1e387550', '[\"*\"]', NULL, NULL, '2024-07-30 10:32:47', '2024-07-30 10:32:47'),
(92, 'App\\Models\\User', 1, 'API Token', 'c75f641155476f7ee98ca388c4ca5c5b85c24ab69af394cca8a1f5efc7a47982', '[\"*\"]', NULL, NULL, '2024-07-30 10:33:13', '2024-07-30 10:33:13'),
(93, 'App\\Models\\User', 1, 'API Token', 'bfdeb934cb77e6899905d0ca3a7210bf4a9a6f3934bc3fbaa9d8ec00fbe3c57a', '[\"*\"]', NULL, NULL, '2024-07-30 10:33:15', '2024-07-30 10:33:15'),
(94, 'App\\Models\\User', 1, 'API Token', 'd64c27f2a265b918fcd97f66a87cc52746e2ac90fee07d37ba5fce1410a0a6a7', '[\"*\"]', NULL, NULL, '2024-07-30 10:33:18', '2024-07-30 10:33:18'),
(95, 'App\\Models\\User', 1, 'API Token', '242379ec58c96c9baf7d609c518b80e512e195a07156c66601ce1d626b2fdff3', '[\"*\"]', NULL, NULL, '2024-07-30 10:33:21', '2024-07-30 10:33:21'),
(96, 'App\\Models\\User', 1, 'API Token', '824f9c3ab3a34678d6d50656f9576da406986e5b6d485abaf0807b3840f6b8f1', '[\"*\"]', NULL, NULL, '2024-07-30 10:34:12', '2024-07-30 10:34:12'),
(97, 'App\\Models\\User', 1, 'API Token', '7d0cebca8ecb70d8164b3111aebb9ca34b0e5df78b1449527613df61e37ca052', '[\"*\"]', NULL, NULL, '2024-07-30 10:34:14', '2024-07-30 10:34:14'),
(98, 'App\\Models\\User', 1, 'API Token', '3d888bba9bf5a066467b636235746949deeeb3415bb48d399c6dd029bcb879e4', '[\"*\"]', NULL, NULL, '2024-07-30 10:35:02', '2024-07-30 10:35:02'),
(99, 'App\\Models\\User', 1, 'API Token', 'ff953aef99ae5f2544edb667ae7fcca71fc4d02a8daf331b3988f87c8031bc2c', '[\"*\"]', NULL, NULL, '2024-07-30 10:35:04', '2024-07-30 10:35:04'),
(100, 'App\\Models\\User', 1, 'API Token', '8b4a7b225727a7a71cedc8a2c5d8a341c563f381bf04e50baab24d78c15c3024', '[\"*\"]', NULL, NULL, '2024-07-30 10:35:17', '2024-07-30 10:35:17'),
(101, 'App\\Models\\User', 1, 'API Token', 'bb0284dc5fc48963f40047147e69aae9e326a706b4a49284dbd7ac24d196ebe5', '[\"*\"]', NULL, NULL, '2024-07-30 10:35:20', '2024-07-30 10:35:20'),
(102, 'App\\Models\\User', 1, 'API Token', 'ac5b07662cba84ec8b0566de3d9bf11a1221016a43ca683f82a6c294f8232935', '[\"*\"]', NULL, NULL, '2024-07-30 10:35:54', '2024-07-30 10:35:54'),
(103, 'App\\Models\\User', 1, 'API Token', '6f3054011dfba84f91104536af5a9eafca14acdd860df484e105ba2ed202100e', '[\"*\"]', NULL, NULL, '2024-07-30 10:35:56', '2024-07-30 10:35:56'),
(104, 'App\\Models\\User', 1, 'API Token', 'b5e00a19ae23b7cf25c03a12720fe502522d211ac59aba50f59e2e4ab02dba42', '[\"*\"]', NULL, NULL, '2024-07-30 10:35:59', '2024-07-30 10:35:59'),
(105, 'App\\Models\\User', 1, 'API Token', '26fc3d5d4106df9ae460e113342155c63d4d6918b2add844f780dafa35556699', '[\"*\"]', NULL, NULL, '2024-07-30 10:36:02', '2024-07-30 10:36:02'),
(106, 'App\\Models\\User', 1, 'API Token', '510c18b10c15918d21e5e693c7199ab177bd7b2ddfbee5e3607210b5af326857', '[\"*\"]', NULL, NULL, '2024-07-30 10:36:28', '2024-07-30 10:36:28'),
(107, 'App\\Models\\User', 1, 'API Token', '5bd42e93cae9902ff0cb6f247ae37ce3de5c03a3ff7efbf69acf306b85e34471', '[\"*\"]', NULL, NULL, '2024-07-30 10:36:30', '2024-07-30 10:36:30'),
(108, 'App\\Models\\User', 1, 'API Token', '25341764ee3840d72fe1898d10fb32a98a5b45ac8284ed01e76ab4ac8f4d0b44', '[\"*\"]', NULL, NULL, '2024-07-30 10:36:52', '2024-07-30 10:36:52'),
(109, 'App\\Models\\User', 1, 'API Token', '0dd8fec9a5afd82e91ec50dc827b71203099088337431424b3760074358d2aab', '[\"*\"]', NULL, NULL, '2024-07-30 10:36:54', '2024-07-30 10:36:54'),
(110, 'App\\Models\\User', 1, 'API Token', 'caec9a020916f0e5a07f824cf5118139c4f6250b7338018f1d0309ab7aec995d', '[\"*\"]', NULL, NULL, '2024-07-30 10:36:57', '2024-07-30 10:36:57'),
(111, 'App\\Models\\User', 1, 'API Token', 'e7fd3185373b63e2998e97e198d0a831d391b405339fd05061de2a66f2e65171', '[\"*\"]', NULL, NULL, '2024-07-30 10:36:59', '2024-07-30 10:36:59'),
(112, 'App\\Models\\User', 1, 'API Token', 'b3f0a5a03caaf639f46c943d8c70490d5864f2e6562fa428081b8a0515d0bd0f', '[\"*\"]', NULL, NULL, '2024-07-30 10:37:35', '2024-07-30 10:37:35'),
(113, 'App\\Models\\User', 1, 'API Token', '911b4f4c05e2d54cc0f6d8775e4940073762fc8f94b4c1f67c767acf7eae2d35', '[\"*\"]', NULL, NULL, '2024-07-30 10:37:37', '2024-07-30 10:37:37'),
(114, 'App\\Models\\User', 1, 'API Token', '2f68f559b138a361989c8be36a8430ea011cc7a028047b4c6189bafbad3eeb72', '[\"*\"]', NULL, NULL, '2024-07-30 10:37:44', '2024-07-30 10:37:44'),
(115, 'App\\Models\\User', 1, 'API Token', 'e24d5c5f49b6c1c857206a91789d2c072656ae9e69f3978e34e5ba0454dd5ff1', '[\"*\"]', NULL, NULL, '2024-07-30 10:37:46', '2024-07-30 10:37:46'),
(116, 'App\\Models\\User', 1, 'API Token', 'e8d5c0d8b1c0b385d9a978ca1afe5ab7c1f15c77b1e5452f7a508bddbb478fc1', '[\"*\"]', NULL, NULL, '2024-07-30 10:39:19', '2024-07-30 10:39:19'),
(117, 'App\\Models\\User', 1, 'API Token', '5063e033be186f5817919aae80f4fcae4275aa5b660192d50f353c1732391610', '[\"*\"]', NULL, NULL, '2024-07-30 10:39:21', '2024-07-30 10:39:21'),
(118, 'App\\Models\\User', 1, 'API Token', 'e7739f72b1ea319247abd6b55bb2675ef5c128e5b73c8bcb71fce73b2d77c228', '[\"*\"]', NULL, NULL, '2024-07-30 10:39:26', '2024-07-30 10:39:26'),
(119, 'App\\Models\\User', 1, 'API Token', '830ae18ad2b12ce348128e81224997b68bc02c184604c04f69a062b2457d024d', '[\"*\"]', NULL, NULL, '2024-07-30 10:39:28', '2024-07-30 10:39:28'),
(120, 'App\\Models\\User', 1, 'API Token', 'cb80fae852dbc262a1376d4ee9f938ef81a09a62623ef8629dfd36b181a5d397', '[\"*\"]', NULL, NULL, '2024-07-30 10:39:57', '2024-07-30 10:39:57'),
(121, 'App\\Models\\User', 1, 'API Token', '0cc6ab3feab056a5499d814b9b311e912498a659f530c07a67049aa385f67403', '[\"*\"]', NULL, NULL, '2024-07-30 10:39:59', '2024-07-30 10:39:59'),
(122, 'App\\Models\\User', 1, 'API Token', 'a04cdc57957c37c1f63d7d04301e70ce380b0e2cfcafc208d5f999d31a37a430', '[\"*\"]', NULL, NULL, '2024-07-30 10:40:04', '2024-07-30 10:40:04'),
(123, 'App\\Models\\User', 1, 'API Token', 'c4be87213d920e52fefba97240056d8e620233d757a57339cb649c834688ec40', '[\"*\"]', NULL, NULL, '2024-07-30 10:40:06', '2024-07-30 10:40:06'),
(124, 'App\\Models\\User', 1, 'API Token', '105b965c047cc3c64cc46f68b3f7eceadfa6700751c0b45ce60d5ed84cd32dc9', '[\"*\"]', NULL, NULL, '2024-07-30 10:40:09', '2024-07-30 10:40:09'),
(125, 'App\\Models\\User', 1, 'API Token', '6e96d6b96df1e475f965535327185c003ef4e4c6f6852d1ca1651c50337362ea', '[\"*\"]', NULL, NULL, '2024-07-30 10:40:11', '2024-07-30 10:40:11'),
(126, 'App\\Models\\User', 1, 'API Token', '024ac86a1750a1ae330bac815907b55338b7291090f05946d1d1b0ce5a3914c6', '[\"*\"]', NULL, NULL, '2024-07-30 10:40:48', '2024-07-30 10:40:48'),
(127, 'App\\Models\\User', 1, 'API Token', 'fd6e2b0189ac54baca0095451f3a83206fbb3519af2699a9b802c3855c27ec0d', '[\"*\"]', NULL, NULL, '2024-07-30 10:40:50', '2024-07-30 10:40:50'),
(128, 'App\\Models\\User', 1, 'API Token', 'e1d4ba501355e6f4c51b2e245e77cf3f4681bcc09d5a4bbf338bdceac815a750', '[\"*\"]', NULL, NULL, '2024-07-30 10:42:35', '2024-07-30 10:42:35'),
(129, 'App\\Models\\User', 1, 'API Token', 'e668ddafee39653189484302e5bc2c3d5376be3d876b47cdd95a525d8d8abeb8', '[\"*\"]', NULL, NULL, '2024-07-30 10:42:37', '2024-07-30 10:42:37'),
(130, 'App\\Models\\User', 1, 'API Token', '7fe080b69344eafd0b6c7c6f05ecda166239f145add8a008551c9aab04a32f76', '[\"*\"]', NULL, NULL, '2024-07-30 10:43:10', '2024-07-30 10:43:10'),
(131, 'App\\Models\\User', 1, 'API Token', 'f0267f80b7c7d90be269929bc6648e4b6f8969c1f6a6777471482c0dfe30c4fb', '[\"*\"]', NULL, NULL, '2024-07-30 10:43:16', '2024-07-30 10:43:16'),
(132, 'App\\Models\\User', 1, 'API Token', '75d83b0068b7034b4394c29af26b2d02bd9100ca0c93f6331d26b03fc4363a6e', '[\"*\"]', NULL, NULL, '2024-07-30 10:43:22', '2024-07-30 10:43:22'),
(133, 'App\\Models\\User', 1, 'API Token', 'cd66c391c863560daac4b0c93b010f683f782062ef0d6437d8ed8008adbc725d', '[\"*\"]', NULL, NULL, '2024-07-30 10:43:42', '2024-07-30 10:43:42'),
(134, 'App\\Models\\User', 1, 'API Token', '729a464f994c1e73080645e571d273dfe23108c09b0f8e62201b4a2591e36da9', '[\"*\"]', NULL, NULL, '2024-07-30 10:45:31', '2024-07-30 10:45:31'),
(135, 'App\\Models\\User', 1, 'API Token', '6901f1fc175c3f1a2389e2691d1668c40aeaf811e36b0f824c4f8ec75f737c98', '[\"*\"]', NULL, NULL, '2024-08-02 16:57:51', '2024-08-02 16:57:51'),
(136, 'App\\Models\\User', 1, 'API Token', '8959a1bbb687abfae1cadf4eb8ab2ae9226fc6c4322ecfc18e291673cc5e106c', '[\"*\"]', NULL, NULL, '2024-08-02 16:57:53', '2024-08-02 16:57:53'),
(137, 'App\\Models\\User', 1, 'API Token', '1f6132c71d93a19d955ea98034b96c76acd8c2c09626b7f3d773aaef14a3b7d4', '[\"*\"]', NULL, NULL, '2024-08-02 16:58:04', '2024-08-02 16:58:04'),
(138, 'App\\Models\\User', 1, 'API Token', '1322edc5e5d9991f1fa1cc681893a32b9fd8ad61eea895eda8282c0f1d2ff9e6', '[\"*\"]', NULL, NULL, '2024-08-02 16:58:06', '2024-08-02 16:58:06'),
(139, 'App\\Models\\User', 1, 'API Token', 'ea05a1087beb3135f77a354aa78188be00357bd80f242ca1ed97293e2367b1e8', '[\"*\"]', NULL, NULL, '2024-08-02 17:05:41', '2024-08-02 17:05:41'),
(140, 'App\\Models\\User', 1, 'API Token', '203f4aa6a3e8a34387157faaf3e65c91ee20be0110ad66d59f4240f63cb54771', '[\"*\"]', NULL, NULL, '2024-08-02 17:05:43', '2024-08-02 17:05:43'),
(141, 'App\\Models\\User', 1, 'API Token', '0d3750a37bcdc2c489a47d6d4aaebd13b12e887cbbc19c7cd6a5fcbb661f86fb', '[\"*\"]', NULL, NULL, '2024-08-02 17:06:04', '2024-08-02 17:06:04'),
(142, 'App\\Models\\User', 1, 'API Token', '355815b3f4dc63941cd5b4b724d8d624ce24155e3e191b789b4486d3c9f748a0', '[\"*\"]', NULL, NULL, '2024-08-02 17:06:06', '2024-08-02 17:06:06'),
(143, 'App\\Models\\User', 1, 'API Token', 'd0274776f2e75f6d91ae0aab01973dabe2060ec6348b5530e4c3a7950d268eb5', '[\"*\"]', NULL, NULL, '2024-08-02 17:07:10', '2024-08-02 17:07:10'),
(144, 'App\\Models\\User', 1, 'API Token', '61d37cd8d38a1506ce70f7757fb9fb36c6be9cf4965ef6395a70ab6275dd8cd8', '[\"*\"]', NULL, NULL, '2024-08-02 17:07:12', '2024-08-02 17:07:12'),
(145, 'App\\Models\\User', 1, 'API Token', 'eb1b419660f8e4cf27715e3c998b51b5645d67eaf3b9559675ab4c818ab96ba3', '[\"*\"]', NULL, NULL, '2024-08-02 17:09:15', '2024-08-02 17:09:15'),
(146, 'App\\Models\\User', 1, 'API Token', '8304e21c3704b4c8b4af7dc88463275cd4954d6da1198c0fe8e5cf1333d79a34', '[\"*\"]', NULL, NULL, '2024-08-02 17:09:18', '2024-08-02 17:09:18'),
(147, 'App\\Models\\User', 1, 'API Token', 'd5b58515713eee0a6d049fc4352f6076952ea57dae36ba66e62843873033883a', '[\"*\"]', NULL, NULL, '2024-08-02 17:09:25', '2024-08-02 17:09:25'),
(148, 'App\\Models\\User', 1, 'API Token', '5659c8392ab4430c56ff99b9b5eab43ef8e902d586b5f77099cf88c6ec4afe11', '[\"*\"]', NULL, NULL, '2024-08-02 17:09:26', '2024-08-02 17:09:26'),
(149, 'App\\Models\\User', 1, 'API Token', 'f666a81d6beb5e2b622a15d2a9b4240a73aa06d3a916c57c15fa2b368deb5af5', '[\"*\"]', NULL, NULL, '2024-08-02 17:10:31', '2024-08-02 17:10:31'),
(150, 'App\\Models\\User', 1, 'API Token', '0b1f99576a3b1868852ef82c6e07ca18947e4812b3eb96d2ed71cc164bb47d08', '[\"*\"]', NULL, NULL, '2024-08-02 17:10:33', '2024-08-02 17:10:33'),
(151, 'App\\Models\\User', 1, 'API Token', '993d27489bb46a44e572cda50ce7eac9a3b6ab0424d905b0407677bd4511841d', '[\"*\"]', NULL, NULL, '2024-08-02 17:10:37', '2024-08-02 17:10:37'),
(152, 'App\\Models\\User', 1, 'API Token', '2d81d017af9976af9c1c2e48e05c42dc3685de8be93ff95683698faa417e2774', '[\"*\"]', NULL, NULL, '2024-08-02 17:10:40', '2024-08-02 17:10:40'),
(153, 'App\\Models\\User', 1, 'API Token', '656b15af494179cbd98502771f6d276b9a8611d574229f1cddefded07353131b', '[\"*\"]', NULL, NULL, '2024-08-02 17:10:44', '2024-08-02 17:10:44'),
(154, 'App\\Models\\User', 1, 'API Token', 'fdd8f7a0dfbcfb9d8fa22bd4ae8f37d39a307283f7e8dd7cf5586783ceb92ece', '[\"*\"]', NULL, NULL, '2024-08-02 17:10:52', '2024-08-02 17:10:52'),
(155, 'App\\Models\\User', 1, 'API Token', '68376612644100e8a968765dd3c2d01daf74ddc78e9b49d95dd56578c5daecfe', '[\"*\"]', NULL, NULL, '2024-08-02 17:10:54', '2024-08-02 17:10:54'),
(156, 'App\\Models\\User', 1, 'API Token', '2b57e2e13b11ea82eb16f458589c04aa56b6e3c64738b1f261b2ba342fa4aabb', '[\"*\"]', NULL, NULL, '2024-08-02 17:10:56', '2024-08-02 17:10:56'),
(157, 'App\\Models\\User', 1, 'API Token', 'f630b0c66547bed0cdb68a42e227e8f129c98d8a7765b7c48887c48cb744e3aa', '[\"*\"]', NULL, NULL, '2024-08-02 17:10:57', '2024-08-02 17:10:57'),
(158, 'App\\Models\\User', 1, 'API Token', '7e3debd42ae4e2b383ccad76889fd969fe07ba515798851f6a9f0db1cdfcce4e', '[\"*\"]', NULL, NULL, '2024-08-02 17:11:25', '2024-08-02 17:11:25'),
(159, 'App\\Models\\User', 1, 'API Token', 'f3b3a70884a55bc975dbd2720fad8ef8aa1b83b7eae6359f2ab7aab1ac101e39', '[\"*\"]', NULL, NULL, '2024-08-02 17:11:27', '2024-08-02 17:11:27'),
(160, 'App\\Models\\User', 1, 'API Token', '5c09f9415ff39baaaeb837cb7347fb965c4251635cc19a158291e168ac5c1a6f', '[\"*\"]', NULL, NULL, '2024-08-02 17:13:09', '2024-08-02 17:13:09'),
(161, 'App\\Models\\User', 1, 'API Token', '0d34ef87bfc5364db5422b5150503f9192c322815b7c5a7a7d72e0e6418184f8', '[\"*\"]', NULL, NULL, '2024-08-02 17:13:11', '2024-08-02 17:13:11'),
(162, 'App\\Models\\User', 1, 'API Token', 'ddb25a8d91b6fbf42f486835cdf531c579fd02cd02518dd2a1302eb021267d90', '[\"*\"]', NULL, NULL, '2024-08-02 17:13:30', '2024-08-02 17:13:30'),
(163, 'App\\Models\\User', 1, 'API Token', '221b9c7e89ea5ebf99d24af7c2b070ca2f1365866926e5f00ff0cf59f1e632bc', '[\"*\"]', NULL, NULL, '2024-08-02 17:13:32', '2024-08-02 17:13:32'),
(164, 'App\\Models\\User', 1, 'API Token', '7db0b69d1a95b82f40df8adc1688b2f8080dfe28e1228dcc03d97ef2e3d6a742', '[\"*\"]', NULL, NULL, '2024-08-02 17:13:38', '2024-08-02 17:13:38'),
(165, 'App\\Models\\User', 1, 'API Token', 'ee8b3ffb1ff7177125e8870304d7043d40aff551ec61563b83391160637556af', '[\"*\"]', NULL, NULL, '2024-08-02 17:13:41', '2024-08-02 17:13:41'),
(166, 'App\\Models\\User', 1, 'API Token', 'c32dcd43a1ead7992e948d6ebc52707988845336cfe5891088aa13bf933059e2', '[\"*\"]', NULL, NULL, '2024-08-02 17:14:59', '2024-08-02 17:14:59'),
(167, 'App\\Models\\User', 1, 'API Token', '5e089ee28eb8bba626a880660472d3ff3ecf0480bb101a2266e368c585932a8c', '[\"*\"]', NULL, NULL, '2024-08-02 17:15:01', '2024-08-02 17:15:01'),
(168, 'App\\Models\\User', 1, 'API Token', 'cda1243f599ace5d588d6c57fa1c3a47271a8d320c5ed2cef2b7f1ced5996765', '[\"*\"]', NULL, NULL, '2024-08-02 17:15:03', '2024-08-02 17:15:03'),
(169, 'App\\Models\\User', 1, 'API Token', '0a56d2a88276d89572f7922c0c631ff39769ae75c3990e2ccb96615b0f8e426b', '[\"*\"]', NULL, NULL, '2024-08-02 17:15:04', '2024-08-02 17:15:04'),
(170, 'App\\Models\\User', 1, 'API Token', 'c598c4d6da43d6d72a5536add45dd3407bb37b7c0db8657bb028d5d4e0447d11', '[\"*\"]', NULL, NULL, '2024-08-02 17:15:08', '2024-08-02 17:15:08'),
(171, 'App\\Models\\User', 1, 'API Token', 'cfed70f3cd060d9f6947d7fb0858e887d8970dad76a78405b3d9795fac779b87', '[\"*\"]', NULL, NULL, '2024-08-02 17:15:11', '2024-08-02 17:15:11'),
(172, 'App\\Models\\User', 1, 'API Token', '8fdce988d9569e2fe94e2b9c5414da865bf85f25ebcd5a10e4a991fb846a5073', '[\"*\"]', NULL, NULL, '2024-08-02 17:17:46', '2024-08-02 17:17:46'),
(173, 'App\\Models\\User', 1, 'API Token', '5f372ac84d9d284ab59e6b43429a41323c2c2da61d15c4da9298da1471bba2ac', '[\"*\"]', NULL, NULL, '2024-08-02 17:17:48', '2024-08-02 17:17:48'),
(174, 'App\\Models\\User', 1, 'API Token', 'bba18bca29c33f82f324168f188d94431ccb31065787da144b39807e11b480fc', '[\"*\"]', NULL, NULL, '2024-08-02 17:17:50', '2024-08-02 17:17:50'),
(175, 'App\\Models\\User', 1, 'API Token', 'a5f4d8faad71f456d8d23d487a8dd91fdb1dfede49db95d9c95ff2de625442f0', '[\"*\"]', NULL, NULL, '2024-08-02 17:17:52', '2024-08-02 17:17:52'),
(176, 'App\\Models\\User', 1, 'API Token', 'dec1df011400a512cc26bf646259d54cf5ca621d55d5fcfe81500c9592405a87', '[\"*\"]', NULL, NULL, '2024-08-02 17:20:24', '2024-08-02 17:20:24'),
(177, 'App\\Models\\User', 1, 'API Token', 'b44aa71573404ba24ca2eaf85ae023b8439c9ed23f9cb0a78fcbe8a15a314abd', '[\"*\"]', NULL, NULL, '2024-08-02 17:20:26', '2024-08-02 17:20:26'),
(178, 'App\\Models\\User', 1, 'API Token', 'a14d9ca9f2f35e69ccf7b8739cc00a8742aba08f56bb2bd2370f9ccfed181a40', '[\"*\"]', NULL, NULL, '2024-08-02 17:20:27', '2024-08-02 17:20:27'),
(179, 'App\\Models\\User', 1, 'API Token', '1e3edd270fb4894d6e8f0bde9dcbcf61efeb66f4223579cd82c2f7521452497f', '[\"*\"]', NULL, NULL, '2024-08-02 17:20:29', '2024-08-02 17:20:29'),
(180, 'App\\Models\\User', 1, 'API Token', '1f77bd5b1f235586aaf5481d4b559beb8825d0ae89e06c827a06f03a3699a94e', '[\"*\"]', NULL, NULL, '2024-08-02 17:21:04', '2024-08-02 17:21:04'),
(181, 'App\\Models\\User', 1, 'API Token', 'fe60000723d225723f99cb37876a45311160e0418fa967aa45d3db55d78eaf30', '[\"*\"]', NULL, NULL, '2024-08-02 17:21:05', '2024-08-02 17:21:05'),
(182, 'App\\Models\\User', 1, 'API Token', 'cd8c84b9cc785150c494916cdb983a79716c965abb5346c86f7c4a40cc9d1e44', '[\"*\"]', NULL, NULL, '2024-08-02 17:24:06', '2024-08-02 17:24:06'),
(183, 'App\\Models\\User', 1, 'API Token', '3eaf1baddf96161da55fe7318b1ece97219429bf8ba5b1f3486e9b116a7cb68a', '[\"*\"]', NULL, NULL, '2024-08-02 17:24:08', '2024-08-02 17:24:08'),
(184, 'App\\Models\\User', 1, 'API Token', '73670c73f575e3297615bef9159021757da9882ab2184982ce8305fb43fc037d', '[\"*\"]', NULL, NULL, '2024-08-02 17:24:08', '2024-08-02 17:24:08'),
(185, 'App\\Models\\User', 1, 'API Token', '0b3b498a4dab3b675ec8d8311b88b883adce8d2876781723c70dcc960f0a6dea', '[\"*\"]', NULL, NULL, '2024-08-02 17:24:10', '2024-08-02 17:24:10'),
(186, 'App\\Models\\User', 1, 'API Token', '47b63673f7c3c2ee902b5554d16066806adfb6939e3d6afdfa947a6984e2ccaf', '[\"*\"]', NULL, NULL, '2024-08-02 17:24:50', '2024-08-02 17:24:50'),
(187, 'App\\Models\\User', 1, 'API Token', 'fed2dc61b52f20cf680da8eb10459eb543018f512368139181ff262bd7f5d61e', '[\"*\"]', NULL, NULL, '2024-08-02 17:24:52', '2024-08-02 17:24:52'),
(188, 'App\\Models\\User', 1, 'API Token', '5a6af263696e0b77a661efb274525756cd67f9c8c57822955231b41d8e55b9e3', '[\"*\"]', NULL, NULL, '2024-08-02 17:24:55', '2024-08-02 17:24:55'),
(189, 'App\\Models\\User', 1, 'API Token', '17fd992c524f8aa1a1fa920ad27344268ccf5ddf032d102a679b953f4b0da3f6', '[\"*\"]', NULL, NULL, '2024-08-02 17:24:56', '2024-08-02 17:24:56'),
(190, 'App\\Models\\User', 1, 'API Token', '487a3da279c6f972873a7ecb69f14fa9726a798ee26a493789eb473c942d3b8c', '[\"*\"]', NULL, NULL, '2024-08-02 17:25:48', '2024-08-02 17:25:48'),
(191, 'App\\Models\\User', 1, 'API Token', '08b75434796d4fd1b06e071b251d7195d6c2e08ea7809dcbc48638b3e77ce304', '[\"*\"]', NULL, NULL, '2024-08-02 17:25:49', '2024-08-02 17:25:49'),
(192, 'App\\Models\\User', 1, 'API Token', '1a44d0e30305f108b32df0832f461f313bcf339b55a8d5b1ff03efb1747a7326', '[\"*\"]', NULL, NULL, '2024-08-02 17:25:50', '2024-08-02 17:25:50'),
(193, 'App\\Models\\User', 1, 'API Token', '9034bcfc306b197cc0e7313119cab12f69b1876387638943549b640bc8505ab9', '[\"*\"]', NULL, NULL, '2024-08-02 17:25:50', '2024-08-02 17:25:50'),
(194, 'App\\Models\\User', 1, 'API Token', 'd517000056728565d291e1305377e9a18ab258726f11e6c9ad18db31ad530752', '[\"*\"]', NULL, NULL, '2024-08-02 17:25:53', '2024-08-02 17:25:53'),
(195, 'App\\Models\\User', 1, 'API Token', 'b9c8de4e89c27dc0a93fe0a7529a90f9d98f629326c8661cccc63b334485a200', '[\"*\"]', NULL, NULL, '2024-08-02 17:25:54', '2024-08-02 17:25:54'),
(196, 'App\\Models\\User', 1, 'API Token', 'ff9f8c330c578af68228beec36cdf83774a9b469215309a35deb25164796221e', '[\"*\"]', NULL, NULL, '2024-08-02 17:26:20', '2024-08-02 17:26:20'),
(197, 'App\\Models\\User', 1, 'API Token', 'af5874ace9dc7008b9e68556246f3b44ddf41bdd19f0e45ef1498a494938885e', '[\"*\"]', NULL, NULL, '2024-08-02 17:26:22', '2024-08-02 17:26:22'),
(198, 'App\\Models\\User', 1, 'API Token', 'bafc89056aa1aea2c5a886fc628c1ccf90d68333cd38d01845ad2d6ebda7f398', '[\"*\"]', NULL, NULL, '2024-08-02 17:26:26', '2024-08-02 17:26:26'),
(199, 'App\\Models\\User', 1, 'API Token', 'bb046b772330487a010f53597388c402de61c4cd2a64c7f5878247b419613186', '[\"*\"]', NULL, NULL, '2024-08-02 17:26:32', '2024-08-02 17:26:32'),
(200, 'App\\Models\\User', 1, 'API Token', '05947acea5e8457371e0d24b2bd7dd76f21ed50e0ec74cb4f579f893d7df20e0', '[\"*\"]', NULL, NULL, '2024-08-02 17:26:33', '2024-08-02 17:26:33'),
(201, 'App\\Models\\User', 1, 'API Token', 'cf3715d4d1a642e6ead3b9f625d614479c063a4379e392782510a3ec5a12c80a', '[\"*\"]', NULL, NULL, '2024-08-02 17:26:40', '2024-08-02 17:26:40'),
(202, 'App\\Models\\User', 1, 'API Token', '655fcaf4664788b62e31fc453cf4e35c99e805da07969743d0e8c291d0dd293a', '[\"*\"]', NULL, NULL, '2024-08-02 17:26:40', '2024-08-02 17:26:40'),
(203, 'App\\Models\\User', 1, 'API Token', '1a9f55a4b3a6dfb01ecabfd10e68dd92c30d530dc9986b28aa3773a84ea97e0d', '[\"*\"]', NULL, NULL, '2024-08-02 17:26:41', '2024-08-02 17:26:41'),
(204, 'App\\Models\\User', 1, 'API Token', '13d0996554dca8f852089b5559b99d716d5b30833f7971585fe2af91d1d8ff96', '[\"*\"]', NULL, NULL, '2024-08-02 17:26:41', '2024-08-02 17:26:41'),
(205, 'App\\Models\\User', 1, 'API Token', '9fd8569f75c9681a344c412fb50232344c517be64c827ee03a1cd1952b0ee2cf', '[\"*\"]', NULL, NULL, '2024-08-02 17:26:42', '2024-08-02 17:26:42'),
(206, 'App\\Models\\User', 1, 'API Token', 'b3a7bccd8b384ec3fa19cb71e5eac5d24eccd72389f06b9ddbcaebe984e6a058', '[\"*\"]', NULL, NULL, '2024-08-02 17:26:42', '2024-08-02 17:26:42'),
(207, 'App\\Models\\User', 1, 'API Token', 'd5e4f7d959ecff0ae7bc6e97bb1ae5d2ab897d28a53af96481816b23b01c8df9', '[\"*\"]', NULL, NULL, '2024-08-02 17:26:43', '2024-08-02 17:26:43'),
(208, 'App\\Models\\User', 1, 'API Token', 'ec3bdadb26b7483c16b6a4ed3fea8fe8e3ac15db4e50417bd333b17a9d77a160', '[\"*\"]', NULL, NULL, '2024-08-02 17:26:44', '2024-08-02 17:26:44'),
(209, 'App\\Models\\User', 1, 'API Token', '220d30e8d67271f2efb696327ca0830dcc0e8b89fca4acdfa9454f65895e21f7', '[\"*\"]', NULL, NULL, '2024-08-02 17:29:27', '2024-08-02 17:29:27'),
(210, 'App\\Models\\User', 1, 'API Token', 'bfd7926a7bfe5465006a7c8d162284415dfb87b5438d4ff806cca32b9cd41889', '[\"*\"]', NULL, NULL, '2024-08-02 17:29:28', '2024-08-02 17:29:28'),
(211, 'App\\Models\\User', 1, 'API Token', 'aab29ee0e225a6016936881908e30756934a9529f06fd56cdcdb640f7b0ec56b', '[\"*\"]', NULL, NULL, '2024-08-02 17:29:56', '2024-08-02 17:29:56'),
(212, 'App\\Models\\User', 1, 'API Token', 'eab604b5a4cdf6f4e863ad61d1cf77c9857049908ec18653c4e65ad2668a4e05', '[\"*\"]', NULL, NULL, '2024-08-02 17:29:56', '2024-08-02 17:29:56'),
(213, 'App\\Models\\User', 1, 'API Token', 'eabb4627ee9eb4257614f54f22b55e4b9ac5ffa70341f0190b42f517af14943b', '[\"*\"]', NULL, NULL, '2024-08-02 17:30:40', '2024-08-02 17:30:40'),
(214, 'App\\Models\\User', 1, 'API Token', '48f5ac5a866afcdb85e8a97f39c84f5b3524f4aa34734cff2a309fc5ac9dc2e3', '[\"*\"]', NULL, NULL, '2024-08-02 17:30:41', '2024-08-02 17:30:41'),
(215, 'App\\Models\\User', 1, 'API Token', '4f589ece8cd5dfc33c7e5011dc2fabe9850cdace1ebe3573e77e3d31cbaa1dce', '[\"*\"]', NULL, NULL, '2024-08-02 17:30:41', '2024-08-02 17:30:41'),
(216, 'App\\Models\\User', 1, 'API Token', '903bcaced26d5f38f820ab3d6aa58f25778c445e1e94d02875a30088865fa86a', '[\"*\"]', NULL, NULL, '2024-08-02 17:30:42', '2024-08-02 17:30:42'),
(217, 'App\\Models\\User', 1, 'API Token', '2da5422285eec95cf5cc37e6d887a62b2fc161fa2f0dc1ec19d369e28cdd7294', '[\"*\"]', NULL, NULL, '2024-08-02 17:30:43', '2024-08-02 17:30:43'),
(218, 'App\\Models\\User', 1, 'API Token', '81bca18349e048304cd0beaca45f7b9de86069ef0d4203795e0c1bac47c70f5e', '[\"*\"]', NULL, NULL, '2024-08-02 17:30:43', '2024-08-02 17:30:43'),
(219, 'App\\Models\\User', 1, 'API Token', '919542ec4b998da837db020f5fcd70da179126c1836c02d0c92db4e20c48dc54', '[\"*\"]', NULL, NULL, '2024-08-02 17:30:44', '2024-08-02 17:30:44'),
(220, 'App\\Models\\User', 1, 'API Token', '1dfe926814b2af40e790aa2ab68c2d7d5c54f5819fa2c9e6d68a324619c47b30', '[\"*\"]', NULL, NULL, '2024-08-02 17:30:44', '2024-08-02 17:30:44'),
(221, 'App\\Models\\User', 1, 'API Token', 'bf0ce8e2a2c3cb9cb6e7cf9002dda8a8ca8235e0cde27ad7810ee5e4146f59bd', '[\"*\"]', NULL, NULL, '2024-08-02 17:37:02', '2024-08-02 17:37:02'),
(222, 'App\\Models\\User', 1, 'API Token', '9c4f0ce702b63e697e99e916512a24f1df24ab54937df27827d16de94bbbe34f', '[\"*\"]', NULL, NULL, '2024-08-02 17:38:54', '2024-08-02 17:38:54'),
(223, 'App\\Models\\User', 1, 'API Token', '706dd66b2296d921a891a2b110971386026669132e1b627f7ba71cbeb0a16427', '[\"*\"]', NULL, NULL, '2024-08-02 17:38:56', '2024-08-02 17:38:56'),
(224, 'App\\Models\\User', 1, 'API Token', '62222f78b3125a452b6ceabbd001a18ca14182aafc195de46ed9661fdf4ce878', '[\"*\"]', NULL, NULL, '2024-08-02 17:39:01', '2024-08-02 17:39:01'),
(225, 'App\\Models\\User', 1, 'API Token', 'a34b7010317424eb886e56c31cce49e950d0242eaff21441dba8bb048242f943', '[\"*\"]', NULL, NULL, '2024-08-02 17:39:03', '2024-08-02 17:39:03'),
(226, 'App\\Models\\User', 1, 'API Token', '921d994b41310d0ec330229b48a88487d7e0eb90107f24d2f8446bab1622aee6', '[\"*\"]', NULL, NULL, '2024-08-02 17:39:05', '2024-08-02 17:39:05'),
(227, 'App\\Models\\User', 1, 'API Token', '7584079597ce0984f9706d01d4446a0248df2b49ec97004b6f6d92b6b3530862', '[\"*\"]', NULL, NULL, '2024-08-02 17:39:07', '2024-08-02 17:39:07'),
(228, 'App\\Models\\User', 1, 'API Token', 'c4f344f77ce496f7454e6da8bf3fc3610be58c4f4c32befdf7009e1a167aa872', '[\"*\"]', NULL, NULL, '2024-08-02 17:40:04', '2024-08-02 17:40:04'),
(229, 'App\\Models\\User', 1, 'API Token', 'f54cc54ce23bfe09bf2b9dab0fbbbe7be895907d6ccaccfe5d32c35ab2209d36', '[\"*\"]', NULL, NULL, '2024-08-02 17:40:06', '2024-08-02 17:40:06'),
(230, 'App\\Models\\User', 1, 'API Token', '0b7c12d80e578a9bf2edce787c5f8d8e55b0fc5dbb378b0cb9bd70b2fac15faf', '[\"*\"]', NULL, NULL, '2024-08-02 17:40:08', '2024-08-02 17:40:08'),
(231, 'App\\Models\\User', 1, 'API Token', 'aa7230f90c18b23b8f00461f9cecfeb4cd67693c326aa38bd7460ae963e4ba28', '[\"*\"]', NULL, NULL, '2024-08-02 17:40:10', '2024-08-02 17:40:10'),
(232, 'App\\Models\\User', 1, 'API Token', 'da7adf3e5e4398e84d20f5c4a16e9da2f7a611d144f4c2ce821b03f693ce18b4', '[\"*\"]', NULL, NULL, '2024-08-02 17:40:12', '2024-08-02 17:40:12'),
(233, 'App\\Models\\User', 1, 'API Token', '5cd1286a4d97ebba2f6c4127fc7ca4d8970efc950a94b0589791714cb28434f7', '[\"*\"]', NULL, NULL, '2024-08-02 17:40:14', '2024-08-02 17:40:14'),
(234, 'App\\Models\\User', 1, 'API Token', 'c4996de8361a24f6dbdf7582d4fb01d2eb03379e532ffb64a4cbbb767a4b0140', '[\"*\"]', NULL, NULL, '2024-08-02 17:40:16', '2024-08-02 17:40:16'),
(235, 'App\\Models\\User', 1, 'API Token', '09a83cc429cefc86cadf5d19f0342ad8ed7f21632b1e4eb9c1fff7e35b0017b9', '[\"*\"]', NULL, NULL, '2024-08-02 17:40:16', '2024-08-02 17:40:16'),
(236, 'App\\Models\\User', 1, 'API Token', 'e03432a0ecd3e90c4595383f92014fabcc63e095fd9d1d3d4b1d15aaff0a6e10', '[\"*\"]', NULL, NULL, '2024-08-02 17:40:18', '2024-08-02 17:40:18'),
(237, 'App\\Models\\User', 1, 'API Token', '9ba8bd096d39d65a2cc9404cbe710cfc1aab288d0073122ae2277599e278071c', '[\"*\"]', NULL, NULL, '2024-08-02 17:40:20', '2024-08-02 17:40:20'),
(238, 'App\\Models\\User', 1, 'API Token', '95c5a87f5ca728888890327ddd247ebc0b7d9cda5c55ce45c7c5462a1660c9d0', '[\"*\"]', NULL, NULL, '2024-08-02 17:40:22', '2024-08-02 17:40:22'),
(239, 'App\\Models\\User', 1, 'API Token', 'c7df4924546e1cb979e46a323c63b76df38cb3921058fb91b69353f47844d688', '[\"*\"]', NULL, NULL, '2024-08-02 17:40:24', '2024-08-02 17:40:24'),
(240, 'App\\Models\\User', 1, 'API Token', 'c20e28e085e47e84ba6e91e0acb5459892f4a316064c1c624b0bfad977545ddb', '[\"*\"]', NULL, NULL, '2024-08-02 17:40:25', '2024-08-02 17:40:25'),
(241, 'App\\Models\\User', 1, 'API Token', '20cf6aa717100a0fa87d79e54297a0c535e72afb60e3c53678985e4bf04cbc2c', '[\"*\"]', NULL, NULL, '2024-08-02 17:40:27', '2024-08-02 17:40:27'),
(242, 'App\\Models\\User', 1, 'API Token', '5f664a16ff014bf86f7f070f54f66da47685adbd1077dfff0e8acbcb295c530d', '[\"*\"]', NULL, NULL, '2024-08-02 17:40:29', '2024-08-02 17:40:29'),
(243, 'App\\Models\\User', 1, 'API Token', 'a918858b6af8c0635d071478c64906ebb267c4df127a5f4eb33953206aee8f09', '[\"*\"]', NULL, NULL, '2024-08-02 17:40:30', '2024-08-02 17:40:30'),
(244, 'App\\Models\\User', 1, 'API Token', '8bf833ef70c0bd9052fa3fdd6a49f975796cf18108e6c1d6e40b93ca205e709d', '[\"*\"]', NULL, NULL, '2024-08-02 17:40:32', '2024-08-02 17:40:32'),
(245, 'App\\Models\\User', 1, 'API Token', '72db6197c35205b4f7734e65e3bd0f8dd14d142a016f40fd097886ca5bb1456e', '[\"*\"]', NULL, NULL, '2024-08-02 17:40:33', '2024-08-02 17:40:33'),
(246, 'App\\Models\\User', 1, 'API Token', '3b48d9c3f72bb492e0febd147517ac6ead59c973e45d6941dee0f5e1ba907309', '[\"*\"]', NULL, NULL, '2024-08-02 17:40:34', '2024-08-02 17:40:34'),
(247, 'App\\Models\\User', 1, 'API Token', '81298a1caa6bf6d5dfe5b18ac1a848b4c73bf2a1091700272abe6dfee479153e', '[\"*\"]', NULL, NULL, '2024-08-02 17:40:35', '2024-08-02 17:40:35'),
(248, 'App\\Models\\User', 1, 'API Token', '8ed15cddb2fd609b2da793c54b73586b07b602c55102a8df08d1329eafb7df61', '[\"*\"]', NULL, NULL, '2024-08-02 17:40:37', '2024-08-02 17:40:37'),
(249, 'App\\Models\\User', 1, 'API Token', 'f73e479a8bff67bc314909f943a8680ec652a0701ef546d2d8d61fec584297ec', '[\"*\"]', NULL, NULL, '2024-08-02 17:40:41', '2024-08-02 17:40:41'),
(250, 'App\\Models\\User', 1, 'API Token', 'cec72874bba151f5871283508c4ab27b9f5f0871e9385e5265951b0b4a46afe2', '[\"*\"]', NULL, NULL, '2024-08-02 17:40:43', '2024-08-02 17:40:43'),
(251, 'App\\Models\\User', 1, 'API Token', '398588a797ca69600236fa87cbfc0bc1fd1b75e69c0f338bc474687c19fe991f', '[\"*\"]', NULL, NULL, '2024-08-02 17:40:44', '2024-08-02 17:40:44'),
(252, 'App\\Models\\User', 1, 'API Token', '7a4f4e04f3b6f76e23efc51f0d851241d639a33105a372935d9e0264d411ba33', '[\"*\"]', NULL, NULL, '2024-08-02 17:40:46', '2024-08-02 17:40:46'),
(253, 'App\\Models\\User', 1, 'API Token', '1f7227fe530279fb5028a6bead5dc76ee6379cc2e27ef93f526d228ddb7c64c6', '[\"*\"]', NULL, NULL, '2024-08-02 17:40:47', '2024-08-02 17:40:47'),
(254, 'App\\Models\\User', 1, 'API Token', '7e842cfdcd6aab89660f8eba0149ac1c500b1434010b6aec5f526f46b2aa5534', '[\"*\"]', NULL, NULL, '2024-08-02 17:40:48', '2024-08-02 17:40:48'),
(255, 'App\\Models\\User', 1, 'API Token', 'b8617cc1f8953953459b282a9d8aef261b8ff3491f33b0428a5fbe6b8c997dfe', '[\"*\"]', NULL, NULL, '2024-08-13 18:02:16', '2024-08-13 18:02:16'),
(256, 'App\\Models\\User', 1, 'API Token', 'f0ccf553933f91e378cdc92bc45dd059ee235fb979e2ad325164e4418099df7e', '[\"*\"]', NULL, NULL, '2024-08-13 18:02:18', '2024-08-13 18:02:18'),
(257, 'App\\Models\\User', 1, 'API Token', '4e4d5e7fa15a74afaa6b4eac0b3231c0cbed22efc747d33380711a99b09be2a9', '[\"*\"]', NULL, NULL, '2024-08-13 18:03:36', '2024-08-13 18:03:36'),
(258, 'App\\Models\\User', 59, 'API Token', '38300d08905953ef434750e08ec04d6987e2a77d9fb8edd116b7b08264f2bbd4', '[\"*\"]', NULL, NULL, '2024-09-24 10:06:40', '2024-09-24 10:06:40'),
(259, 'App\\Models\\User', 59, 'API Token', '8cdcbbb7a5569b43612d018945cac86a8a81bfcb637e909ac07fca41f06c7512', '[\"*\"]', NULL, NULL, '2024-09-24 10:06:42', '2024-09-24 10:06:42'),
(260, 'App\\Models\\User', 59, 'API Token', '0fb8682dbfcee1a91a5fb21b853b3d6aa3668540a5a0891118d258a2824dc983', '[\"*\"]', NULL, NULL, '2024-09-24 10:09:32', '2024-09-24 10:09:32'),
(261, 'App\\Models\\User', 59, 'API Token', '0ff671ff6a6963209d523576f0a5dba4dd3596f4359514122bf111b0e083b6a7', '[\"*\"]', NULL, NULL, '2024-09-24 10:10:34', '2024-09-24 10:10:34'),
(262, 'App\\Models\\User', 59, 'API Token', 'e8f782c530e58ffa4019e98a82e22d7f4b93c0fe24c2d2066ed7545fea2684a2', '[\"*\"]', NULL, NULL, '2024-09-24 10:10:36', '2024-09-24 10:10:36');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service` text NOT NULL,
  `photo` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `service`, `photo`, `created_at`, `updated_at`) VALUES
(1, 'antispoofing', 'assets/img/services/antispoofing.png', '2024-05-29 05:10:45', '2024-05-29 05:10:45'),
(2, 'face comparison', 'assets/img/services/face comparison.svg', '2024-05-29 05:11:24', '2024-05-29 05:11:24'),
(3, 'face detection', 'assets/img/services/face detection.svg', '2024-05-29 05:11:49', '2024-05-29 05:11:49'),
(4, 'Face Search', 'assets/img/services/Face Search.svg', '2024-05-29 05:18:34', '2024-05-29 05:18:34'),
(5, 'pos', 'assets/img/services/pos.svg', '2024-05-29 05:12:19', '2024-05-29 05:12:19'),
(6, 'Advanced AI', 'assets/img/services/Advanced AI.svg', '2024-05-29 05:16:41', '2024-05-29 05:16:41'),
(9, 'Human Resources', 'assets/img/services/Human Resources.svg', '2024-06-27 03:48:34', '2024-06-27 03:48:34');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('rqERinN16wy3qf0cMp1NGnugk7gKuSwiWgfFAm7J', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiTU54WXBndXlkMFFJZnVBWFBCVDhXN0QxQnpqOXNwR01HZ0ZqbG9NeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9teXBsYW5zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1727204043);

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_date` datetime DEFAULT NULL,
  `to_date` datetime DEFAULT NULL,
  `package_id` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `from_date`, `to_date`, `package_id`, `user_id`, `created_at`, `updated_at`) VALUES
(62, '2024-09-24 21:51:24', '2025-03-24 21:51:24', 3, 1, '2024-06-25 06:42:36', '2024-09-24 16:51:24'),
(75, '2024-06-29 18:55:28', '2024-09-29 18:55:28', 2, 25, '2024-06-29 10:55:28', '2024-06-29 10:55:28'),
(76, '2024-06-29 23:21:31', '2024-09-29 23:21:31', 2, 53, '2024-06-29 15:21:31', '2024-06-29 15:21:31'),
(78, '2024-07-01 16:05:35', '2025-01-01 16:05:35', 3, 25, '2024-07-01 08:05:35', '2024-07-01 08:05:35'),
(85, '2024-09-24 18:46:28', '2024-12-24 18:46:28', 2, 59, '2024-09-24 11:35:25', '2024-09-24 13:46:28'),
(86, '2024-09-24 18:26:57', '2024-12-24 18:26:57', 2, 59, '2024-09-24 13:26:57', '2024-09-24 13:26:57'),
(87, '2024-09-24 18:27:34', '2024-12-24 18:27:34', 2, 59, '2024-09-24 13:27:34', '2024-09-24 13:27:34');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_as` varchar(45) DEFAULT NULL,
  `photo` text DEFAULT NULL,
  `status` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role_as`, `photo`, `status`) VALUES
(1, 'Eslam', 'hossameslam791@gmail.com', NULL, '$2y$12$M0H7WwXrmxqi9gpQFUqltelHuOdjoJgy372E/H5fuNj3bW73jIiBu', NULL, '2024-05-06 06:26:11', '2024-08-14 10:32:38', 'admin', 'assets/img/profile_photos/hossameslam791@gmail.com.jfif', 'online'),
(5, 'mohamed', 'b@f.com', NULL, '$2y$12$4eNoyDQ3R5mQ2GdrWuzBBuV9TJKbI0Y9EinvN98qe8HIgYCtgbCq.', NULL, '2024-05-08 06:30:05', '2024-06-23 11:46:44', 'null', 'assets/img/profile_photos/123@gmail.com.jpg', ''),
(22, 'eslam', 'hossameslam792@gmail.com', NULL, '$2y$12$aptNC/kKaXohmrinlUGNE.qUFZAKS2zkpfrRfWROTGHamKfdMbipq', NULL, '2024-06-02 08:53:15', '2024-07-01 04:25:17', 'admin', 'assets/img/profile_photos/123@gmail.com.jpg', 'offline'),
(23, 'Eslam', 'hossameslam798@gmail.com', NULL, '$2y$12$wjTx7kEKucl/tza0QlmgrOjVOK.7zTv/RwDU3dhljwtWgErnUcvIq', NULL, '2024-06-03 05:23:43', '2024-06-03 05:23:43', NULL, 'assets/img/profile_photos/123@gmail.com.jpg', NULL),
(25, 'mohsen', '123@gmail.com', NULL, '$2y$12$9AUrFmhWtWtV69wUTyIROuWZ3YHQiHJbE5d4N8cO70uJ4sEltVS4C', 'NSUBikQwwoelJmWt3G0a4ewv6rjoeoovjPQWW5sHkZ2PuYkDSOAoNuTqZUIi', '2024-06-09 10:04:55', '2024-07-01 04:29:10', NULL, 'assets/img/profile_photos/123@gmail.com.jpg', 'online'),
(26, 'MOHAMED', '12345@gmail.com', NULL, '$2y$12$F5a7LGphyDjoETCPq2Z9yO65xaa1kumCG0Entxn729PKDScI5z7TO', NULL, '2024-06-09 10:09:58', '2024-06-09 10:09:58', NULL, 'assets/img/profile_photos/123@gmail.com.jpg', NULL),
(27, '123456', '1155@gmail.com', NULL, '$2y$12$KK.Kx5XeBq69qgq9rTfm7ec8NS.WVOdd3WnEMurwLfv6kBRjWlqFe', NULL, '2024-06-11 07:16:47', '2024-06-11 07:16:47', NULL, 'assets/img/profile_photos/123@gmail.com.jpg', NULL),
(53, 'eslam', '123456787@gmail.com', NULL, '$2y$12$lrXBd7RmTGGVzQzaloFPvOh/OUjrAnyiR0ieYBwMJspoAeXjR4GTW', NULL, '2024-06-29 15:07:26', '2024-06-29 15:07:26', NULL, 'assets/img/profile_photos/default.jpg', NULL),
(57, 'Eslam Embaby', 'hossameslam7912@gmail.com', NULL, '$2y$12$4iqhIDxF0Vf0VJFWap/gG.Pk/YK/XvHeB0.N.nO.z/qsu9W9.brm6', NULL, '2024-08-14 10:20:05', '2024-08-14 10:20:05', NULL, 'assets/img/profile_photos/default.jpg', NULL),
(58, 'cams', '12@gmail.com', NULL, '$2y$12$P8okyuv2WKsHAf7/HaBO9.XS.HsmpxhqkFGDnxP7on2DWsR09tgQu', NULL, '2024-08-14 10:32:30', '2024-08-14 10:32:30', NULL, 'assets/img/profile_photos/default.jpg', NULL),
(59, 'eslam', 'hossameslam123456@gmail.com', NULL, '$2y$12$inGa2QMhH5L/He9795SB6.R3yMIoMmbvay4AVf8Uzrtq8XHyjQWli', NULL, '2024-09-24 10:05:53', '2024-09-24 10:05:53', NULL, 'assets/img/profile_photos/default.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE `visitors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `visitors`
--

INSERT INTO `visitors` (`id`, `ip_address`, `created_at`, `updated_at`) VALUES
(1, '127.0.0.1', '2024-06-22 10:33:01', '2024-06-22 10:33:01'),
(2, '127.0.0.1', '2024-06-22 10:33:03', '2024-06-22 10:33:03'),
(3, '127.0.0.1', '2024-06-22 10:33:03', '2024-06-22 10:33:03'),
(4, '127.0.0.1', '2024-06-22 10:33:05', '2024-06-22 10:33:05'),
(5, '127.0.0.1', '2024-06-22 10:33:06', '2024-06-22 10:33:06'),
(6, '127.0.0.1', '2024-06-22 10:33:07', '2024-06-22 10:33:07'),
(7, '127.0.0.1', '2024-06-22 10:33:07', '2024-06-22 10:33:07'),
(8, '127.0.0.1', '2024-06-22 10:33:08', '2024-06-22 10:33:08'),
(9, '127.0.0.1', '2024-06-22 10:33:09', '2024-06-22 10:33:09'),
(10, '127.0.0.1', '2024-06-22 10:33:09', '2024-06-22 10:33:09'),
(11, '127.0.0.1', '2024-06-22 10:33:10', '2024-06-22 10:33:10'),
(12, '127.0.0.1', '2024-06-22 10:33:13', '2024-06-22 10:33:13'),
(13, '127.0.0.1', '2024-06-22 10:33:15', '2024-06-22 10:33:15'),
(14, '127.0.0.1', '2024-06-22 10:33:16', '2024-06-22 10:33:16'),
(15, '127.0.0.1', '2024-06-22 10:33:17', '2024-06-22 10:33:17'),
(16, '127.0.0.1', '2024-06-22 10:33:17', '2024-06-22 10:33:17'),
(17, '127.0.0.1', '2024-06-22 10:33:18', '2024-06-22 10:33:18'),
(18, '127.0.0.1', '2024-06-22 10:33:19', '2024-06-22 10:33:19'),
(19, '127.0.0.1', '2024-06-22 10:33:19', '2024-06-22 10:33:19'),
(20, '127.0.0.1', '2024-06-22 10:33:20', '2024-06-22 10:33:20'),
(21, '127.0.0.1', '2024-06-22 10:33:21', '2024-06-22 10:33:21'),
(22, '127.0.0.1', '2024-06-22 10:33:44', '2024-06-22 10:33:44'),
(23, '127.0.0.1', '2024-06-22 10:33:46', '2024-06-22 10:33:46'),
(24, '127.0.0.1', '2024-06-22 10:33:46', '2024-06-22 10:33:46'),
(25, '127.0.0.1', '2024-06-22 10:33:48', '2024-06-22 10:33:48'),
(26, '127.0.0.1', '2024-06-22 10:33:48', '2024-06-22 10:33:48'),
(27, '127.0.0.1', '2024-06-22 10:33:49', '2024-06-22 10:33:49'),
(28, '127.0.0.1', '2024-06-22 10:33:50', '2024-06-22 10:33:50'),
(29, '127.0.0.1', '2024-06-22 10:33:50', '2024-06-22 10:33:50'),
(30, '127.0.0.1', '2024-06-22 10:33:51', '2024-06-22 10:33:51'),
(31, '127.0.0.1', '2024-06-22 10:33:52', '2024-06-22 10:33:52'),
(32, '127.0.0.1', '2024-06-22 10:33:53', '2024-06-22 10:33:53'),
(33, '127.0.0.1', '2024-06-22 10:33:57', '2024-06-22 10:33:57'),
(34, '127.0.0.1', '2024-06-22 10:33:59', '2024-06-22 10:33:59'),
(35, '127.0.0.1', '2024-06-22 10:33:59', '2024-06-22 10:33:59'),
(36, '127.0.0.1', '2024-06-22 10:34:01', '2024-06-22 10:34:01'),
(37, '127.0.0.1', '2024-06-22 10:34:01', '2024-06-22 10:34:01'),
(38, '127.0.0.1', '2024-06-22 10:34:02', '2024-06-22 10:34:02'),
(39, '127.0.0.1', '2024-06-22 10:34:03', '2024-06-22 10:34:03'),
(40, '127.0.0.1', '2024-06-22 10:34:03', '2024-06-22 10:34:03'),
(41, '127.0.0.1', '2024-06-22 10:34:04', '2024-06-22 10:34:04'),
(42, '127.0.0.1', '2024-06-22 10:34:04', '2024-06-22 10:34:04'),
(43, '127.0.0.1', '2024-06-22 10:40:18', '2024-06-22 10:40:18'),
(44, '127.0.0.1', '2024-06-22 10:40:36', '2024-06-22 10:40:36'),
(45, '127.0.0.1', '2024-06-22 10:57:30', '2024-06-22 10:57:30'),
(46, '127.0.0.1', '2024-06-22 11:53:28', '2024-06-22 11:53:28'),
(47, '127.0.0.1', '2024-06-22 12:01:55', '2024-06-22 12:01:55'),
(48, '127.0.0.1', '2024-06-22 12:04:30', '2024-06-22 12:04:30'),
(49, '127.0.0.1', '2024-06-22 12:04:38', '2024-06-22 12:04:38'),
(50, '127.0.0.1', '2024-06-22 12:04:50', '2024-06-22 12:04:50'),
(51, '127.0.0.1', '2024-06-22 12:05:38', '2024-06-22 12:05:38'),
(52, '127.0.0.1', '2024-06-22 12:06:06', '2024-06-22 12:06:06'),
(53, '127.0.0.1', '2024-06-22 12:08:01', '2024-06-22 12:08:01'),
(54, '127.0.0.1', '2024-06-22 12:08:14', '2024-06-22 12:08:14'),
(55, '127.0.0.1', '2024-06-22 12:16:01', '2024-06-22 12:16:01'),
(56, '127.0.0.1', '2024-06-22 12:16:41', '2024-06-22 12:16:41'),
(57, '127.0.0.1', '2024-06-22 12:17:04', '2024-06-22 12:17:04'),
(58, '127.0.0.1', '2024-06-22 12:19:23', '2024-06-22 12:19:23'),
(59, '127.0.0.1', '2024-06-22 12:19:27', '2024-06-22 12:19:27'),
(60, '127.0.0.1', '2024-06-22 12:23:07', '2024-06-22 12:23:07'),
(61, '127.0.0.1', '2024-06-22 12:23:52', '2024-06-22 12:23:52'),
(62, '127.0.0.1', '2024-06-23 05:19:35', '2024-06-23 05:19:35'),
(63, '127.0.0.1', '2024-06-23 05:51:12', '2024-06-23 05:51:12'),
(64, '127.0.0.1', '2024-06-23 06:28:36', '2024-06-23 06:28:36'),
(65, '127.0.0.1', '2024-06-23 11:43:50', '2024-06-23 11:43:50'),
(66, '127.0.0.1', '2024-06-23 11:44:02', '2024-06-23 11:44:02'),
(67, '127.0.0.1', '2024-06-23 11:44:18', '2024-06-23 11:44:18'),
(68, '127.0.0.1', '2024-06-23 11:44:25', '2024-06-23 11:44:25'),
(69, '127.0.0.1', '2024-06-23 11:44:52', '2024-06-23 11:44:52'),
(70, '127.0.0.1', '2024-06-23 11:45:12', '2024-06-23 11:45:12'),
(71, '127.0.0.1', '2024-06-23 11:46:45', '2024-06-23 11:46:45'),
(72, '127.0.0.1', '2024-06-23 11:47:15', '2024-06-23 11:47:15'),
(73, '127.0.0.1', '2024-06-23 11:47:29', '2024-06-23 11:47:29'),
(74, '127.0.0.1', '2024-06-23 11:49:44', '2024-06-23 11:49:44'),
(75, '127.0.0.1', '2024-06-23 11:49:55', '2024-06-23 11:49:55'),
(76, '127.0.0.1', '2024-06-24 04:17:25', '2024-06-24 04:17:25'),
(77, '127.0.0.1', '2024-06-24 04:17:40', '2024-06-24 04:17:40'),
(78, '127.0.0.1', '2024-06-24 04:19:41', '2024-06-24 04:19:41'),
(79, '127.0.0.1', '2024-06-24 04:21:04', '2024-06-24 04:21:04'),
(80, '127.0.0.1', '2024-06-24 04:26:17', '2024-06-24 04:26:17'),
(81, '127.0.0.1', '2024-06-24 04:27:28', '2024-06-24 04:27:28'),
(82, '127.0.0.1', '2024-06-24 04:41:53', '2024-06-24 04:41:53'),
(83, '127.0.0.1', '2024-06-24 04:47:51', '2024-06-24 04:47:51'),
(84, '127.0.0.1', '2024-06-24 04:48:16', '2024-06-24 04:48:16'),
(85, '127.0.0.1', '2024-06-24 04:49:11', '2024-06-24 04:49:11'),
(86, '127.0.0.1', '2024-06-24 04:49:27', '2024-06-24 04:49:27'),
(87, '127.0.0.1', '2024-06-24 04:50:13', '2024-06-24 04:50:13'),
(88, '127.0.0.1', '2024-06-24 04:51:43', '2024-06-24 04:51:43'),
(89, '127.0.0.1', '2024-06-24 04:56:28', '2024-06-24 04:56:28'),
(90, '127.0.0.1', '2024-06-24 05:00:01', '2024-06-24 05:00:01'),
(91, '127.0.0.1', '2024-06-24 05:09:20', '2024-06-24 05:09:20'),
(92, '127.0.0.1', '2024-06-24 05:34:23', '2024-06-24 05:34:23'),
(93, '127.0.0.1', '2024-06-24 05:34:54', '2024-06-24 05:34:54'),
(94, '127.0.0.1', '2024-06-24 05:36:14', '2024-06-24 05:36:14'),
(95, '127.0.0.1', '2024-06-24 06:08:27', '2024-06-24 06:08:27'),
(96, '127.0.0.1', '2024-06-24 06:10:07', '2024-06-24 06:10:07'),
(97, '127.0.0.1', '2024-06-24 06:10:30', '2024-06-24 06:10:30'),
(98, '127.0.0.1', '2024-06-24 06:12:37', '2024-06-24 06:12:37'),
(99, '127.0.0.1', '2024-06-24 06:13:16', '2024-06-24 06:13:16'),
(100, '127.0.0.1', '2024-06-24 06:18:33', '2024-06-24 06:18:33'),
(101, '127.0.0.1', '2024-06-24 06:19:19', '2024-06-24 06:19:19'),
(102, '127.0.0.1', '2024-06-24 06:20:14', '2024-06-24 06:20:14'),
(103, '127.0.0.1', '2024-06-24 07:04:58', '2024-06-24 07:04:58'),
(104, '127.0.0.1', '2024-06-24 07:05:55', '2024-06-24 07:05:55'),
(105, '127.0.0.1', '2024-06-25 05:47:44', '2024-06-25 05:47:44'),
(106, '127.0.0.1', '2024-06-25 05:49:38', '2024-06-25 05:49:38'),
(107, '127.0.0.1', '2024-06-25 06:27:26', '2024-06-25 06:27:26'),
(108, '127.0.0.1', '2024-06-25 06:27:34', '2024-06-25 06:27:34'),
(109, '127.0.0.1', '2024-06-25 06:42:01', '2024-06-25 06:42:01'),
(110, '127.0.0.1', '2024-06-25 08:44:09', '2024-06-25 08:44:09'),
(111, '127.0.0.1', '2024-06-25 08:45:03', '2024-06-25 08:45:03'),
(112, '127.0.0.1', '2024-06-25 08:45:52', '2024-06-25 08:45:52'),
(113, '127.0.0.1', '2024-06-25 12:29:10', '2024-06-25 12:29:10'),
(114, '127.0.0.1', '2024-06-26 05:41:51', '2024-06-26 05:41:51'),
(115, '127.0.0.1', '2024-06-26 05:45:38', '2024-06-26 05:45:38'),
(116, '127.0.0.1', '2024-06-26 05:49:01', '2024-06-26 05:49:01'),
(117, '127.0.0.1', '2024-06-26 05:51:55', '2024-06-26 05:51:55'),
(118, '127.0.0.1', '2024-06-26 05:59:29', '2024-06-26 05:59:29'),
(119, '127.0.0.1', '2024-06-26 07:27:00', '2024-06-26 07:27:00'),
(120, '127.0.0.1', '2024-06-26 07:27:34', '2024-06-26 07:27:34'),
(121, '127.0.0.1', '2024-06-26 07:43:13', '2024-06-26 07:43:13'),
(122, '127.0.0.1', '2024-06-26 07:43:23', '2024-06-26 07:43:23'),
(123, '127.0.0.1', '2024-06-26 10:41:27', '2024-06-26 10:41:27'),
(124, '127.0.0.1', '2024-06-26 15:44:51', '2024-06-26 15:44:51'),
(125, '127.0.0.1', '2024-06-27 08:36:39', '2024-06-27 08:36:39'),
(126, '127.0.0.1', '2024-06-27 08:36:52', '2024-06-27 08:36:52'),
(127, '127.0.0.1', '2024-06-27 10:01:48', '2024-06-27 10:01:48'),
(128, '127.0.0.1', '2024-06-27 10:05:59', '2024-06-27 10:05:59'),
(129, '127.0.0.1', '2024-06-29 05:41:19', '2024-06-29 05:41:19'),
(130, '127.0.0.1', '2024-06-29 05:41:33', '2024-06-29 05:41:33'),
(131, '127.0.0.1', '2024-06-29 05:45:44', '2024-06-29 05:45:44'),
(132, '127.0.0.1', '2024-06-29 06:01:36', '2024-06-29 06:01:36'),
(133, '127.0.0.1', '2024-06-29 06:22:06', '2024-06-29 06:22:06'),
(134, '127.0.0.1', '2024-06-29 06:23:55', '2024-06-29 06:23:55'),
(135, '127.0.0.1', '2024-06-29 07:31:37', '2024-06-29 07:31:37'),
(136, '127.0.0.1', '2024-06-29 07:31:49', '2024-06-29 07:31:49'),
(137, '127.0.0.1', '2024-06-29 07:50:19', '2024-06-29 07:50:19'),
(138, '127.0.0.1', '2024-06-29 09:22:28', '2024-06-29 09:22:28'),
(139, '127.0.0.1', '2024-06-29 09:24:15', '2024-06-29 09:24:15'),
(140, '127.0.0.1', '2024-06-29 09:24:53', '2024-06-29 09:24:53'),
(141, '127.0.0.1', '2024-06-29 10:42:56', '2024-06-29 10:42:56'),
(142, '127.0.0.1', '2024-06-29 10:43:07', '2024-06-29 10:43:07'),
(143, '127.0.0.1', '2024-06-29 10:43:12', '2024-06-29 10:43:12'),
(144, '127.0.0.1', '2024-06-29 10:43:34', '2024-06-29 10:43:34'),
(145, '127.0.0.1', '2024-06-29 10:44:44', '2024-06-29 10:44:44'),
(146, '127.0.0.1', '2024-06-29 12:32:35', '2024-06-29 12:32:35'),
(147, '127.0.0.1', '2024-06-29 15:02:33', '2024-06-29 15:02:33'),
(148, '127.0.0.1', '2024-06-29 15:05:18', '2024-06-29 15:05:18'),
(149, '127.0.0.1', '2024-06-29 15:07:35', '2024-06-29 15:07:35'),
(150, '127.0.0.1', '2024-06-30 07:16:45', '2024-06-30 07:16:45'),
(151, '127.0.0.1', '2024-06-30 07:17:27', '2024-06-30 07:17:27'),
(152, '127.0.0.1', '2024-07-01 04:11:17', '2024-07-01 04:11:17'),
(153, '127.0.0.1', '2024-07-01 04:11:30', '2024-07-01 04:11:30'),
(154, '127.0.0.1', '2024-07-01 04:15:17', '2024-07-01 04:15:17'),
(155, '127.0.0.1', '2024-07-01 04:24:00', '2024-07-01 04:24:00'),
(156, '127.0.0.1', '2024-07-01 04:24:12', '2024-07-01 04:24:12'),
(157, '127.0.0.1', '2024-07-01 04:25:18', '2024-07-01 04:25:18'),
(158, '127.0.0.1', '2024-07-01 04:25:42', '2024-07-01 04:25:42'),
(159, '127.0.0.1', '2024-07-01 04:25:47', '2024-07-01 04:25:47'),
(160, '127.0.0.1', '2024-07-01 04:25:50', '2024-07-01 04:25:50'),
(161, '127.0.0.1', '2024-07-01 04:25:56', '2024-07-01 04:25:56'),
(162, '127.0.0.1', '2024-07-01 04:26:37', '2024-07-01 04:26:37'),
(163, '127.0.0.1', '2024-07-01 04:27:45', '2024-07-01 04:27:45'),
(164, '127.0.0.1', '2024-07-01 04:28:15', '2024-07-01 04:28:15'),
(165, '127.0.0.1', '2024-07-01 04:29:13', '2024-07-01 04:29:13'),
(166, '127.0.0.1', '2024-07-01 04:29:28', '2024-07-01 04:29:28'),
(167, '127.0.0.1', '2024-07-01 04:30:02', '2024-07-01 04:30:02'),
(168, '127.0.0.1', '2024-07-01 04:30:36', '2024-07-01 04:30:36'),
(169, '127.0.0.1', '2024-07-01 04:30:50', '2024-07-01 04:30:50'),
(170, '127.0.0.1', '2024-07-01 04:35:27', '2024-07-01 04:35:27'),
(171, '127.0.0.1', '2024-07-01 04:35:38', '2024-07-01 04:35:38'),
(172, '127.0.0.1', '2024-07-01 04:41:02', '2024-07-01 04:41:02'),
(173, '127.0.0.1', '2024-07-01 04:45:25', '2024-07-01 04:45:25'),
(174, '127.0.0.1', '2024-07-01 08:05:04', '2024-07-01 08:05:04'),
(175, '127.0.0.1', '2024-07-01 09:58:02', '2024-07-01 09:58:02'),
(176, '127.0.0.1', '2024-07-19 13:25:03', '2024-07-19 13:25:03'),
(177, '127.0.0.1', '2024-07-19 13:25:04', '2024-07-19 13:25:04'),
(178, '127.0.0.1', '2024-07-21 06:59:21', '2024-07-21 06:59:21'),
(179, '127.0.0.1', '2024-07-21 06:59:25', '2024-07-21 06:59:25'),
(180, '127.0.0.1', '2024-07-21 07:12:12', '2024-07-21 07:12:12'),
(181, '127.0.0.1', '2024-07-21 07:12:13', '2024-07-21 07:12:13'),
(182, '127.0.0.1', '2024-07-21 07:18:58', '2024-07-21 07:18:58'),
(183, '127.0.0.1', '2024-07-21 07:19:00', '2024-07-21 07:19:00'),
(184, '127.0.0.1', '2024-07-21 07:47:27', '2024-07-21 07:47:27'),
(185, '127.0.0.1', '2024-07-21 07:47:29', '2024-07-21 07:47:29'),
(186, '127.0.0.1', '2024-07-21 07:47:33', '2024-07-21 07:47:33'),
(187, '127.0.0.1', '2024-07-21 07:47:34', '2024-07-21 07:47:34'),
(188, '127.0.0.1', '2024-07-22 09:28:45', '2024-07-22 09:28:45'),
(189, '127.0.0.1', '2024-07-22 09:28:47', '2024-07-22 09:28:47'),
(190, '127.0.0.1', '2024-07-23 13:43:48', '2024-07-23 13:43:48'),
(191, '127.0.0.1', '2024-07-23 13:43:50', '2024-07-23 13:43:50'),
(192, '127.0.0.1', '2024-07-24 08:45:29', '2024-07-24 08:45:29'),
(193, '127.0.0.1', '2024-07-24 08:45:37', '2024-07-24 08:45:37'),
(194, '127.0.0.1', '2024-07-24 08:45:39', '2024-07-24 08:45:39'),
(195, '127.0.0.1', '2024-07-24 12:34:29', '2024-07-24 12:34:29'),
(196, '127.0.0.1', '2024-07-24 13:12:34', '2024-07-24 13:12:34'),
(197, '127.0.0.1', '2024-07-24 13:12:37', '2024-07-24 13:12:37'),
(198, '127.0.0.1', '2024-07-24 20:42:26', '2024-07-24 20:42:26'),
(199, '127.0.0.1', '2024-07-24 20:42:32', '2024-07-24 20:42:32'),
(200, '127.0.0.1', '2024-07-24 20:42:34', '2024-07-24 20:42:34'),
(201, '127.0.0.1', '2024-07-24 20:52:33', '2024-07-24 20:52:33'),
(202, '127.0.0.1', '2024-07-24 20:52:34', '2024-07-24 20:52:34'),
(203, '127.0.0.1', '2024-07-29 07:51:24', '2024-07-29 07:51:24'),
(204, '127.0.0.1', '2024-07-29 07:51:26', '2024-07-29 07:51:26'),
(205, '127.0.0.1', '2024-07-29 07:52:27', '2024-07-29 07:52:27'),
(206, '127.0.0.1', '2024-07-29 07:52:29', '2024-07-29 07:52:29'),
(207, '127.0.0.1', '2024-07-29 07:57:28', '2024-07-29 07:57:28'),
(208, '127.0.0.1', '2024-07-29 07:57:30', '2024-07-29 07:57:30'),
(209, '127.0.0.1', '2024-07-30 09:12:37', '2024-07-30 09:12:37'),
(210, '127.0.0.1', '2024-07-30 09:12:42', '2024-07-30 09:12:42'),
(211, '127.0.0.1', '2024-07-30 09:33:35', '2024-07-30 09:33:35'),
(212, '127.0.0.1', '2024-07-30 09:33:37', '2024-07-30 09:33:37'),
(213, '127.0.0.1', '2024-07-30 09:33:54', '2024-07-30 09:33:54'),
(214, '127.0.0.1', '2024-07-30 09:33:55', '2024-07-30 09:33:55'),
(215, '127.0.0.1', '2024-07-30 10:27:56', '2024-07-30 10:27:56'),
(216, '127.0.0.1', '2024-07-30 10:27:57', '2024-07-30 10:27:57'),
(217, '127.0.0.1', '2024-07-30 10:27:59', '2024-07-30 10:27:59'),
(218, '127.0.0.1', '2024-07-30 10:39:42', '2024-07-30 10:39:42'),
(219, '127.0.0.1', '2024-07-30 10:39:44', '2024-07-30 10:39:44'),
(220, '127.0.0.1', '2024-07-30 10:39:51', '2024-07-30 10:39:51'),
(221, '127.0.0.1', '2024-07-30 10:39:52', '2024-07-30 10:39:52'),
(222, '127.0.0.1', '2024-07-30 10:43:28', '2024-07-30 10:43:28'),
(223, '127.0.0.1', '2024-07-31 11:23:16', '2024-07-31 11:23:16'),
(224, '127.0.0.1', '2024-07-31 11:23:21', '2024-07-31 11:23:21'),
(225, '127.0.0.1', '2024-07-31 16:43:41', '2024-07-31 16:43:41'),
(226, '127.0.0.1', '2024-07-31 16:43:44', '2024-07-31 16:43:44'),
(227, '127.0.0.1', '2024-08-02 16:57:06', '2024-08-02 16:57:06'),
(228, '127.0.0.1', '2024-08-02 16:57:09', '2024-08-02 16:57:09'),
(229, '127.0.0.1', '2024-08-02 16:57:37', '2024-08-02 16:57:37'),
(230, '127.0.0.1', '2024-08-02 16:57:39', '2024-08-02 16:57:39'),
(231, '127.0.0.1', '2024-08-02 17:20:13', '2024-08-02 17:20:13'),
(232, '127.0.0.1', '2024-08-02 17:20:15', '2024-08-02 17:20:15'),
(233, '127.0.0.1', '2024-08-13 18:01:38', '2024-08-13 18:01:38'),
(234, '127.0.0.1', '2024-08-13 18:01:40', '2024-08-13 18:01:40'),
(235, '127.0.0.1', '2024-08-13 18:02:04', '2024-08-13 18:02:04'),
(236, '127.0.0.1', '2024-08-13 18:02:05', '2024-08-13 18:02:05'),
(237, '127.0.0.1', '2024-08-14 10:08:56', '2024-08-14 10:08:56'),
(238, '127.0.0.1', '2024-08-14 10:08:58', '2024-08-14 10:08:58'),
(239, '127.0.0.1', '2024-08-14 10:10:10', '2024-08-14 10:10:10'),
(240, '127.0.0.1', '2024-08-14 10:14:48', '2024-08-14 10:14:48'),
(241, '127.0.0.1', '2024-08-14 10:14:48', '2024-08-14 10:14:48'),
(242, '127.0.0.1', '2024-08-14 10:14:50', '2024-08-14 10:14:50'),
(243, '127.0.0.1', '2024-08-14 10:17:58', '2024-08-14 10:17:58'),
(244, '127.0.0.1', '2024-08-14 10:23:15', '2024-08-14 10:23:15'),
(245, '127.0.0.1', '2024-08-14 10:23:17', '2024-08-14 10:23:17'),
(246, '127.0.0.1', '2024-08-14 10:27:04', '2024-08-14 10:27:04'),
(247, '127.0.0.1', '2024-08-14 10:27:06', '2024-08-14 10:27:06'),
(248, '127.0.0.1', '2024-08-14 10:32:08', '2024-08-14 10:32:08'),
(249, '127.0.0.1', '2024-08-14 10:32:12', '2024-08-14 10:32:12'),
(250, '127.0.0.1', '2024-08-14 10:32:30', '2024-08-14 10:32:30'),
(251, '127.0.0.1', '2024-08-14 10:36:08', '2024-08-14 10:36:08'),
(252, '127.0.0.1', '2024-08-14 10:36:10', '2024-08-14 10:36:10'),
(253, '127.0.0.1', '2024-08-14 11:45:59', '2024-08-14 11:45:59'),
(254, '127.0.0.1', '2024-08-14 11:46:01', '2024-08-14 11:46:01'),
(255, '127.0.0.1', '2024-09-24 10:03:13', '2024-09-24 10:03:13'),
(256, '127.0.0.1', '2024-09-24 10:03:15', '2024-09-24 10:03:15'),
(257, '127.0.0.1', '2024-09-24 10:05:54', '2024-09-24 10:05:54'),
(258, '127.0.0.1', '2024-09-24 10:05:55', '2024-09-24 10:05:55'),
(259, '127.0.0.1', '2024-09-24 10:06:05', '2024-09-24 10:06:05'),
(260, '127.0.0.1', '2024-09-24 10:06:07', '2024-09-24 10:06:07'),
(261, '127.0.0.1', '2024-09-24 10:33:09', '2024-09-24 10:33:09'),
(262, '127.0.0.1', '2024-09-24 10:33:11', '2024-09-24 10:33:11'),
(263, '127.0.0.1', '2024-09-24 10:33:15', '2024-09-24 10:33:15'),
(264, '127.0.0.1', '2024-09-24 10:33:17', '2024-09-24 10:33:17'),
(265, '127.0.0.1', '2024-09-24 11:18:35', '2024-09-24 11:18:35'),
(266, '127.0.0.1', '2024-09-24 11:18:37', '2024-09-24 11:18:37'),
(267, '127.0.0.1', '2024-09-24 16:50:34', '2024-09-24 16:50:34'),
(268, '127.0.0.1', '2024-09-24 16:50:36', '2024-09-24 16:50:36'),
(269, '127.0.0.1', '2024-09-24 16:51:39', '2024-09-24 16:51:39'),
(270, '127.0.0.1', '2024-09-24 16:51:41', '2024-09-24 16:51:41'),
(271, '127.0.0.1', '2024-09-24 16:52:25', '2024-09-24 16:52:25'),
(272, '127.0.0.1', '2024-09-24 16:52:26', '2024-09-24 16:52:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about`
--
ALTER TABLE `about`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_foreign` (`user_id`);

--
-- Indexes for table `contactus`
--
ALTER TABLE `contactus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `myplans`
--
ALTER TABLE `myplans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `myplans_package_id_foreign` (`package_id`),
  ADD KEY `myplans_user_id_foreign` (`user_id`),
  ADD KEY `myplans_subscription_id_foreign` (`subscription_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_id` (`package_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about`
--
ALTER TABLE `about`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contactus`
--
ALTER TABLE `contactus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `myplans`
--
ALTER TABLE `myplans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=263;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=273;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `myplans`
--
ALTER TABLE `myplans`
  ADD CONSTRAINT `myplans_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `myplans_subscription_id_foreign` FOREIGN KEY (`subscription_id`) REFERENCES `subscriptions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `myplans_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD CONSTRAINT `subscriptions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `subscriptions_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
