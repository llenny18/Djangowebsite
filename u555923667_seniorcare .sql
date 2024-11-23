-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 21, 2024 at 03:42 PM
-- Server version: 10.11.9-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u555923667_seniorcare`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `activity_id` int(11) NOT NULL,
  `activity_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `time` time DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `created_by` enum('Admin','HealthWorker') NOT NULL DEFAULT 'Admin',
  `creator_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity`
--

INSERT INTO `activity` (`activity_id`, `activity_name`, `description`, `date`, `time`, `location`, `created_by`, `creator_id`, `created_at`) VALUES
(3, 'Activity 3', 'Description 3', '2024-09-10 02:00:00', '10:00:00', 'Location 3', 'HealthWorker', 2, '2024-09-01 00:00:00'),
(4, 'Activity 4', 'Description 4', '2024-09-11 03:00:00', '11:00:00', 'Location 4', 'Admin', 1, '2024-09-01 01:00:00'),
(5, 'Activity 5', 'Description 5', '2024-09-12 04:00:00', '12:00:00', 'Location 5', 'HealthWorker', 2, '2024-09-01 02:00:00'),
(6, 'Activity 6', 'Description 6', '2024-09-13 05:00:00', '13:00:00', 'Location 6', 'Admin', 1, '2024-09-01 03:00:00'),
(7, 'Activity 7', 'Description 7', '2024-09-14 06:00:00', '14:00:00', 'Location 7', 'HealthWorker', 2, '2024-09-01 04:00:00'),
(8, 'Activity 8', 'Description 8', '2024-09-15 07:00:00', '15:00:00', 'Location 8', 'Admin', 1, '2024-09-01 05:00:00'),
(9, 'Activity 9', 'Description 9', '2024-09-16 08:00:00', '16:00:00', 'Location 9', 'HealthWorker', 2, '2024-09-01 06:00:00'),
(10, 'Activity 10', 'Description 10', '2024-09-17 09:00:00', '17:00:00', 'Location 10', 'Admin', 1, '2024-09-01 07:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `security_code` int(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password`, `email`, `phone`, `security_code`, `created_at`) VALUES
(46882260, 'admin_user', 'adminpass', 'adminemail@email.com', '32094823987', 660016, '2024-08-04 04:15:20'),
(97557510, 'admin_tin', 'tintin', 'admin_tin@gmail.com', '09123456789', 123, '2024-10-25 01:17:26');

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

CREATE TABLE `announcement` (
  `announcement_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `date_posted` timestamp NULL DEFAULT current_timestamp(),
  `posted_by` enum('Admin','HealthWorker') DEFAULT NULL,
  `poster_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `announcement`
--

INSERT INTO `announcement` (`announcement_id`, `title`, `description`, `date_posted`, `posted_by`, `poster_id`, `created_at`) VALUES
(1, 'Health Checkup Day', 'We are inviting all senior citizens to join our free health checkup event this coming Saturday at the barangay hall from 8 AM to 12 PM. Health professionals will be available to check your blood pressure, sugar levels, and overall well-being. Let’s stay healthy together!', '2024-10-18 00:00:00', 'Admin', 1, '2024-08-04 04:15:09'),
(2, 'Exercise for Seniors: Morning Zumba', 'Join us for weekly Zumba classes every Monday and Wednesday at 6 AM. Our sessions are designed specifically for senior citizens, ensuring a fun, light, and safe way to keep active. Classes will be held at the barangay plaza.', '2024-10-18 00:00:00', 'Admin', 1, '2024-08-04 07:29:46'),
(3, 'Financial Assistance Distribution', 'The distribution of the Senior Citizens’ financial assistance will be on October 25, 2024, at the barangay office. Please bring your senior citizen ID and a valid ID for verification. Assistance will be given from 9 AM to 3 PM.', '2024-10-18 00:00:00', 'Admin', 1, '2024-08-05 00:00:00'),
(4, 'Senior Citizen General Assembly', 'We are holding a General Assembly for all senior citizens on November 3, 2024, at 9 AM in the barangay hall. This is an opportunity to discuss upcoming programs, benefits, and concerns related to your welfare. Please mark your calendars!', '2024-10-18 00:00:00', 'Admin', 2, '2024-08-06 01:00:00'),
(5, 'Flu Vaccination Program', 'Flu vaccines will be available for free to all senior citizens at the barangay health center on October 30, 2024, from 8 AM to 1 PM. Make sure to get vaccinated and protect yourself this flu season.', '2024-10-18 00:00:00', 'Admin', 1, '2024-08-07 02:00:00'),
(6, 'Barangay Christmas Party for Seniors', 'We are excited to announce our annual Christmas Party for Senior Citizens! It will be held on December 10, 2024, at the barangay hall starting at 3 PM. Enjoy games, food, and prizes. Let’s celebrate the holiday season together!', '2024-10-18 00:00:00', 'Admin', 2, '2024-08-08 03:00:00'),
(7, 'Educational Seminar: Digital Literacy for Seniors', 'Learn how to use your smartphone and basic online services at our Digital Literacy Seminar for Seniors. It will be held on November 15, 2024, at 2 PM in the barangay hall. Discover the joys of technology in an easy and friendly way!', '2024-10-18 00:00:00', 'Admin', 1, '2024-08-09 04:00:00'),
(8, 'Barangay Clean-Up Drive Participation', 'We encourage all senior citizens to join our barangay clean-up drive on October 28, 2024, starting at 7 AM. Let’s help keep our community clean and safe. All participants will receive a token of appreciation for their efforts.', '2024-10-18 00:00:00', 'Admin', 2, '2024-08-10 05:00:00'),
(9, 'Monthly Senior Citizen Feeding Program', 'Our feeding program for senior citizens continues every last Friday of the month. This month’s feeding will be on October 27, 2024, at 11 AM in the barangay hall. Join us for a healthy meal prepared just for you.', '2024-10-18 00:00:00', 'Admin', 1, '2024-08-11 06:00:00'),
(10, 'Emergency Preparedness Seminar for Seniors', 'Be prepared for any emergency! Attend our Emergency Preparedness Seminar on November 8, 2024, at 10 AM in the barangay hall. Learn basic survival tips and what to do in case of natural disasters such as earthquakes or floods.', '2024-10-18 00:00:00', 'Admin', 2, '2024-08-12 07:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appointment_id` int(11) NOT NULL,
  `senior_id` int(11) NOT NULL,
  `worker_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `status` enum('Scheduled','Completed','Cancelled') NOT NULL DEFAULT 'Scheduled',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointment_id`, `senior_id`, `worker_id`, `date`, `time`, `status`, `created_at`) VALUES
(1, 1, 2, '2024-08-30', '20:59:00', 'Scheduled', '2024-08-14 12:59:57'),
(2, 1, 2, '2024-08-01', '21:35:00', 'Completed', '2024-08-14 05:32:45'),
(3, 1, 2, '2024-08-02', '21:38:00', 'Cancelled', '2024-08-14 05:33:46'),
(4, 2, 3, '2024-09-01', '10:00:00', 'Scheduled', '2024-08-15 02:00:00'),
(5, 3, 4, '2024-09-02', '11:00:00', 'Scheduled', '2024-08-15 03:00:00'),
(6, 4, 5, '2024-09-03', '12:00:00', 'Completed', '2024-08-15 04:00:00'),
(7, 5, 6, '2024-09-04', '13:00:00', 'Cancelled', '2024-08-15 05:00:00'),
(8, 6, 7, '2024-09-05', '14:00:00', 'Scheduled', '2024-08-15 06:00:00'),
(9, 7, 8, '2024-09-06', '15:00:00', 'Completed', '2024-08-15 07:00:00'),
(10, 8, 9, '2024-09-07', '16:00:00', 'Cancelled', '2024-08-15 08:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(10, 'Group 10'),
(2, 'Group 2'),
(3, 'Group 3'),
(4, 'Group 4'),
(5, 'Group 5'),
(6, 'Group 6'),
(7, 'Group 7'),
(8, 'Group 8'),
(9, 'Group 9');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add senior citizen', 6, 'add_seniorcitizen'),
(22, 'Can change senior citizen', 6, 'change_seniorcitizen'),
(23, 'Can delete senior citizen', 6, 'delete_seniorcitizen'),
(24, 'Can view senior citizen', 6, 'view_seniorcitizen'),
(25, 'Can add session', 7, 'add_session'),
(26, 'Can change session', 7, 'change_session'),
(27, 'Can delete session', 7, 'delete_session'),
(28, 'Can view session', 7, 'view_session'),
(29, 'Can add activity', 8, 'add_activity'),
(30, 'Can change activity', 8, 'change_activity'),
(31, 'Can delete activity', 8, 'delete_activity'),
(32, 'Can view activity', 8, 'view_activity'),
(33, 'Can add admin', 9, 'add_admin'),
(34, 'Can change admin', 9, 'change_admin'),
(35, 'Can delete admin', 9, 'delete_admin'),
(36, 'Can view admin', 9, 'view_admin'),
(37, 'Can add announcement', 10, 'add_announcement'),
(38, 'Can change announcement', 10, 'change_announcement'),
(39, 'Can delete announcement', 10, 'delete_announcement'),
(40, 'Can view announcement', 10, 'view_announcement'),
(41, 'Can add health worker', 11, 'add_healthworker'),
(42, 'Can change health worker', 11, 'change_healthworker'),
(43, 'Can delete health worker', 11, 'delete_healthworker'),
(44, 'Can view health worker', 11, 'view_healthworker'),
(45, 'Can add predictive analytics', 12, 'add_predictiveanalytics'),
(46, 'Can change predictive analytics', 12, 'change_predictiveanalytics'),
(47, 'Can delete predictive analytics', 12, 'delete_predictiveanalytics'),
(48, 'Can view predictive analytics', 12, 'view_predictiveanalytics'),
(49, 'Can add profile', 13, 'add_profile'),
(50, 'Can change profile', 13, 'change_profile'),
(51, 'Can delete profile', 13, 'delete_profile'),
(52, 'Can view profile', 13, 'view_profile'),
(53, 'Can add sms notification', 14, 'add_smsnotification'),
(54, 'Can change sms notification', 14, 'change_smsnotification'),
(55, 'Can delete sms notification', 14, 'delete_smsnotification'),
(56, 'Can view sms notification', 14, 'view_smsnotification'),
(57, 'Can add appointment', 15, 'add_appointment'),
(58, 'Can change appointment', 15, 'change_appointment'),
(59, 'Can delete appointment', 15, 'delete_appointment'),
(60, 'Can view appointment', 15, 'view_appointment');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$720000$DPod9ZtEWaTUStLfrzdjhW$8Lup80vyo6fKWUMxNn/LtE0jq72FqiutFb3JrFcQlec=', '2024-08-04 07:24:24.142406', 1, 'admin1', '', '', 'adminemail@email.com', 1, 1, '2024-08-04 07:24:02.197572'),
(2, 'pbkdf2_sha256$720000$DPod9ZtEWaTUStLfrzdjhW$8Lup80vyo6fKWUMxNn/LtE0jq72FqiutFb3JrFcQlec=', '2024-08-05 07:24:24.142406', 1, 'user2', 'First2', 'Last2', 'user2@email.com', 1, 1, '2024-08-05 07:24:24.142406'),
(3, 'pbkdf2_sha256$720000$DPod9ZtEWaTUStLfrzdjhW$8Lup80vyo6fKWUMxNn/LtE0jq72FqiutFb3JrFcQlec=', '2024-08-06 07:24:24.142406', 1, 'user3', 'First3', 'Last3', 'user3@email.com', 1, 1, '2024-08-06 07:24:24.142406'),
(4, 'pbkdf2_sha256$720000$DPod9ZtEWaTUStLfrzdjhW$8Lup80vyo6fKWUMxNn/LtE0jq72FqiutFb3JrFcQlec=', '2024-08-07 07:24:24.142406', 1, 'user4', 'First4', 'Last4', 'user4@email.com', 1, 1, '2024-08-07 07:24:24.142406'),
(5, 'pbkdf2_sha256$720000$DPod9ZtEWaTUStLfrzdjhW$8Lup80vyo6fKWUMxNn/LtE0jq72FqiutFb3JrFcQlec=', '2024-08-08 07:24:24.142406', 1, 'user5', 'First5', 'Last5', 'user5@email.com', 1, 1, '2024-08-08 07:24:24.142406'),
(6, 'pbkdf2_sha256$720000$DPod9ZtEWaTUStLfrzdjhW$8Lup80vyo6fKWUMxNn/LtE0jq72FqiutFb3JrFcQlec=', '2024-08-09 07:24:24.142406', 1, 'user6', 'First6', 'Last6', 'user6@email.com', 1, 1, '2024-08-09 07:24:24.142406'),
(7, 'pbkdf2_sha256$720000$DPod9ZtEWaTUStLfrzdjhW$8Lup80vyo6fKWUMxNn/LtE0jq72FqiutFb3JrFcQlec=', '2024-08-10 07:24:24.142406', 1, 'user7', 'First7', 'Last7', 'user7@email.com', 1, 1, '2024-08-10 07:24:24.142406'),
(8, 'pbkdf2_sha256$720000$DPod9ZtEWaTUStLfrzdjhW$8Lup80vyo6fKWUMxNn/LtE0jq72FqiutFb3JrFcQlec=', '2024-08-11 07:24:24.142406', 1, 'user8', 'First8', 'Last8', 'user8@email.com', 1, 1, '2024-08-11 07:24:24.142406'),
(9, 'pbkdf2_sha256$720000$DPod9ZtEWaTUStLfrzdjhW$8Lup80vyo6fKWUMxNn/LtE0jq72FqiutFb3JrFcQlec=', '2024-08-12 07:24:24.142406', 1, 'user9', 'First9', 'Last9', 'user9@email.com', 1, 1, '2024-08-12 07:24:24.142406'),
(10, 'pbkdf2_sha256$720000$DPod9ZtEWaTUStLfrzdjhW$8Lup80vyo6fKWUMxNn/LtE0jq72FqiutFb3JrFcQlec=', '2024-08-13 07:24:24.142406', 1, 'user10', 'First10', 'Last10', 'user10@email.com', 1, 1, '2024-08-13 07:24:24.142406');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user_user_permissions`
--

INSERT INTO `auth_user_user_permissions` (`id`, `user_id`, `permission_id`) VALUES
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `dataprofiling`
--

CREATE TABLE `dataprofiling` (
  `id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `age` int(11) NOT NULL,
  `lifestyle_diet` tinyint(1) DEFAULT 0,
  `lifestyle_exercise` tinyint(1) DEFAULT 0,
  `lifestyle_others` varchar(255) DEFAULT NULL,
  `medical_history_past_illness` text DEFAULT NULL,
  `medical_history_treatments` text DEFAULT NULL,
  `medical_history_ongoing_medications` text DEFAULT NULL,
  `medical_history_checkups` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dataprofiling`
--

INSERT INTO `dataprofiling` (`id`, `address`, `gender`, `age`, `lifestyle_diet`, `lifestyle_exercise`, `lifestyle_others`, `medical_history_past_illness`, `medical_history_treatments`, `medical_history_ongoing_medications`, `medical_history_checkups`, `created_at`) VALUES
(1, '123 Elm Street', 'Male', 70, 1, 1, 'Walking', 'Hypertension, Diabetes', 'Insulin, Beta-blockers', 'Metformin, Lisinopril', 'Monthly', '2024-07-08 00:00:00'),
(2, '456 Oak Avenue', 'Female', 72, 0, 1, 'Yoga', 'Arthritis', 'Physical Therapy', 'Ibuprofen', 'Quarterly', '2024-09-02 00:00:00'),
(3, '789 Pine Road', 'Male', 75, 1, 0, 'Gardening', 'COPD', 'Inhalers', 'Albuterol', 'Annually', '2024-09-03 00:00:00'),
(4, '101 Maple Lane', 'Female', 69, 1, 1, 'Swimming', 'Heart Disease', 'Statins, Aspirin', 'Atorvastatin, Aspirin', 'Biannually', '2024-09-04 00:00:00'),
(5, '202 Cedar Street', 'Male', 74, 0, 0, 'None', 'Diabetes', 'Insulin', 'Metformin', 'Monthly', '2024-09-05 00:00:00'),
(6, '303 Birch Boulevard', 'Female', 71, 1, 1, 'Dancing', 'Hypertension', 'ACE inhibitors', 'Lisinopril', 'Quarterly', '2024-09-06 00:00:00'),
(7, '404 Spruce Court', 'Male', 77, 0, 0, 'None', 'Cancer', 'Chemotherapy', 'Tamoxifen', 'Annually', '2024-09-07 00:00:00'),
(8, '505 Walnut Way', 'Female', 73, 1, 0, 'Meditation', 'Osteoporosis', 'Calcium supplements', 'Calcium, Vitamin D', 'Biannually', '2024-09-08 00:00:00'),
(9, '606 Redwood Drive', 'Male', 76, 0, 1, 'Cycling', 'Parkinson\'s', 'Dopaminergic drugs', 'Levodopa', 'Monthly', '2024-09-09 00:00:00'),
(10, '707 Chestnut Circle', 'Female', 70, 1, 0, 'Walking', 'Depression', 'Antidepressants', 'Sertraline', 'Quarterly', '2024-09-10 00:00:00'),
(11, '808 Cypress Avenue', 'Male', 72, 1, 1, 'Running', 'Glaucoma', 'Eye drops', 'Latanoprost', 'Annually', '2024-09-11 00:00:00'),
(12, '909 Magnolia Road', 'Female', 68, 0, 1, 'Tai Chi', 'Kidney Disease', 'Dialysis', 'None', 'Biannually', '2024-09-12 00:00:00'),
(13, '1010 Sequoia Street', 'Male', 74, 1, 0, 'Weightlifting', 'Arthritis', 'NSAIDs', 'Ibuprofen', 'Monthly', '2024-09-13 00:00:00'),
(14, '1111 Redwood Avenue', 'Female', 75, 1, 1, 'Pilates', 'Hearing Loss', 'Hearing Aids', 'None', 'Quarterly', '2024-09-14 00:00:00'),
(15, '1212 Fir Lane', 'Male', 73, 0, 0, 'None', 'Stroke', 'Rehabilitation Therapy', 'None', 'Annually', '2024-09-15 00:00:00'),
(16, '1313 Spruce Street', 'Female', 69, 1, 1, 'Hiking', 'Alzheimer\'s', 'Cognitive therapy', 'Donepezil', 'Monthly', '2024-09-16 00:00:00'),
(17, '1414 Maple Avenue', 'Male', 71, 0, 0, 'None', 'Hypertension', 'Diuretics', 'Furosemide', 'Biannually', '2024-09-17 00:00:00'),
(18, '1515 Elm Road', 'Female', 76, 1, 1, 'Aerobics', 'Cancer', 'Radiation therapy', 'None', 'Quarterly', '2024-09-18 00:00:00'),
(19, '1616 Oak Street', 'Male', 75, 1, 0, 'Yoga', 'Heart Disease', 'Beta-blockers', 'Atenolol', 'Annually', '2024-09-19 00:00:00'),
(20, '1717 Cedar Avenue', 'Female', 70, 0, 1, 'Zumba', 'Dementia', 'Memory therapy', 'None', 'Monthly', '2024-09-20 00:00:00');

-- --------------------------------------------------------

--
-- Stand-in structure for view `dataprofiling_view`
-- (See below for the actual view)
--
CREATE TABLE `dataprofiling_view` (
`id` int(11)
,`address` varchar(255)
,`gender` enum('Male','Female')
,`age` int(11)
,`lifestyle_diet` tinyint(1)
,`lifestyle_exercise` tinyint(1)
,`lifestyle_others` varchar(255)
,`medical_history_past_illness` text
,`medical_history_treatments` text
,`medical_history_ongoing_medications` text
,`medical_history_checkups` text
,`created_at` timestamp
,`created_date` varchar(10)
,`created_week` varchar(64)
,`created_month` varchar(64)
,`created_year` varchar(4)
,`created_week_number` int(3)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `disease_count`
-- (See below for the actual view)
--
CREATE TABLE `disease_count` (
`id` bigint(21)
,`category_disease` varchar(284)
,`count` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(8, 'seniorapp', 'activity'),
(9, 'seniorapp', 'admin'),
(10, 'seniorapp', 'announcement'),
(15, 'seniorapp', 'appointment'),
(11, 'seniorapp', 'healthworker'),
(12, 'seniorapp', 'predictiveanalytics'),
(13, 'seniorapp', 'profile'),
(6, 'seniorapp', 'seniorcitizen'),
(14, 'seniorapp', 'smsnotification'),
(7, 'sessions', 'session'),
(0, 'seniorapp', 'dataprofiling'),
(0, 'seniorapp', 'summarycounts'),
(0, 'seniorapp', 'weeklysmssent'),
(0, 'seniorapp', 'dataprofilingview'),
(0, 'seniorapp', 'predictiveanalyticsview'),
(0, 'seniorapp', 'useractivitylog'),
(0, 'seniorapp', 'userlogs');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-08-04 03:05:57.211296'),
(2, 'auth', '0001_initial', '2024-08-04 03:05:58.451274'),
(3, 'admin', '0001_initial', '2024-08-04 03:05:58.717607'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-08-04 03:05:58.733366'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-08-04 03:05:58.749003'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-08-04 03:05:58.874285'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-08-04 03:05:58.983988'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-08-04 03:05:59.031141'),
(9, 'auth', '0004_alter_user_username_opts', '2024-08-04 03:05:59.046758'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-08-04 03:05:59.140835'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-08-04 03:05:59.140835'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-08-04 03:05:59.156440'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-08-04 03:05:59.172061'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-08-04 03:05:59.213113'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-08-04 03:05:59.250642'),
(16, 'auth', '0011_update_proxy_permissions', '2024-08-04 03:05:59.266336'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-08-04 03:05:59.328966'),
(18, 'seniorapp', '0001_initial', '2024-08-04 03:09:03.741439'),
(19, 'seniorapp', '0002_alter_seniorcitizen_options', '2024-08-04 03:09:03.753294'),
(20, 'sessions', '0001_initial', '2024-08-04 03:11:44.832230'),
(21, 'seniorapp', '0003_activity_admin_announcement_healthworker_and_more', '2024-08-14 13:51:36.746656'),
(22, 'seniorapp', '0004_appointment', '2024-08-16 08:31:14.554623'),
(0, 'seniorapp', '0005_dataprofiling_summarycounts_weeklysmssent', '2024-09-26 14:37:23.057227'),
(0, 'seniorapp', '0006_dataprofilingview_predictiveanalyticsview', '2024-10-02 11:10:05.454096'),
(0, 'seniorapp', '0007_useractivitylog_userlogs_alter_admin_table_and_more', '2024-10-02 11:10:05.463777');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('56erqu6y49ffg3q4udzrwrttw4j5yk0f', '.eJyrViotTi2Kz0xRsjLUgbDzEnNTlayUElNyM_PiQSJKUImSygKQhCNIQqkWAFGEFB4:1sgHP0:F5Wuqhn3RMi3HWOeBiqiEieH8b9hXR7kK1jTpbKdwbo', '2024-09-03 05:27:30.564095'),
('5g23ndai5bl3hix8c8gp4iht9cxwdfkb', '.eJyrViotTi2Kz0xRsjLUgbDzEnNTlayUElNyM_PiQSJKUImSygKQhCNIQqkWAFGEFB4:1sqBoK:ice1EoeKvABzqA5YINVO0CgOnT1gr8RAHUC8maXOwGU', '2024-09-30 13:30:36.974287'),
('tfmq9klwuuu6bimlmxcd703zj7qwqux7', '.eJyrViotTi2Kz0xRsjLUgbDzEnNTlayUElNyM_PiQSJKUImSygKQhCNIQqkWAFGEFB4:1slL33:nL-jqmK_5iLM0LieO3CXwc-hXBuQMFkERR1kILWdaow', '2024-09-17 04:21:45.672110'),
('1fs5doknehqf4zcq1j3ubh3lx4setw79', '.eJyrViotTi2Kz0xRsjLUgbDzEnNTlayUyvOLslOLDJWgoiWVBSBRj9TEnJKMcLCcUi0An5gVqQ:1su8Um:4BwLwwqM9s-Nlu1oSl-xxtTf9o2UV3rUPIQYQShr87c', '2024-10-11 10:46:44.393998'),
('4a8g97i4xbk2whdz67t72ussgbm2d7uj', '.eJyrViotTi2Kz0xRsjLUgbDzEnNTlayUElNyM_PiQSJKUImSygKQhCNIQqkWAFGEFB4:1suC6t:Osjv9ab8vpjVgoUTihvJy6m21Ro73wsTB1rF58yky4w', '2024-10-11 14:38:19.925326'),
('o48tfgmbvy93vr13evkqpcogc626gl1p', '.eJyrViotTi2Kz0xRsjLUgbDzEnNTlayUElNyM_PiQSJKUImSygKQhCNIQqkWAFGEFB4:1suVet:aR1EP5cT9nvMN8E6Jg2xDkxnblaBaA2aYDpv5o1isQQ', '2024-10-12 11:30:43.078056'),
('iagp4wlueo4cjbatepjvxgcfbmqzb14y', '.eJyrViotTi2Kz0xRsjLUgbDzEnNTlayUElNyM_PiQSJKUImSygKQhCNIQqkWAFGEFB4:1swIzI:3x2VccEUDQYuNjStp0znCNCdTfkqAVXZ5CRJ8Zp74Hw', '2024-10-03 13:23:12.686762'),
('673tix282fl43174s80fm39j7sp2jcib', '.eJyrViotTi2Kz0xRsjLUgbDzEnNTlayUElNyM_PiQSJKUImSygKQhCNIQqkWAFGEFB4:1swUD7:fgbs3FfpK6EqwZwpsHCfUCkZ-6WWyFViU4bGLOv1gTk', '2024-10-04 01:22:13.568660'),
('nbpz4kg45v5lzvrxhmlqd0v76lbfnhkt', '.eJyrViotTi2Kz0xRsjLUgbDzEnNTlayUyvOLslOLDJWgoiWVBSBRj9TEnJKMcLCcUi0An5gVqQ:1swyAN:J9yHwhBpmroEPFdIMNA-0L645GHpW0eTYU1jLYBYJy4', '2024-10-05 09:21:23.797310'),
('3zr4so2u33oae7ibjziwkv1ek0dhgrt7', '.eJyrViotTi2Kz0xRsjLUgbDzEnNTlayUyvOLslOLDJWgoiWVBSBRj9TEnJKMcLCcUi0An5gVqQ:1swyAt:8wNHN9tOSeutxHYnmf2OuxwwVQNZSfC2LBsPdHVYGOY', '2024-10-05 09:21:55.715432'),
('a5h2ji6an2x2lafnavhavoruk9tuolal', '.eJyrViotTi2Kz0xRsjLUgbDzEnNTlayUElNyM_PiQSJKUImSygKQhCNIQqkWAFGEFB4:1szWON:TjFFLujOurTGiMYD9M-I5fIpsmBVLWjcurmrABdkPSo', '2024-10-12 08:48:23.070287'),
('bivwxzy1xccukzkc07djwv45gzyjfo2e', '.eJyrViotTi2Kz0xRsjLUgbDzEnNTlayUElNyM_PiQSJKUImSygKQhCNIQqkWAFGEFB4:1szXRD:t-ZN2wQfdy5YNTfkJPNQckWDjvzgEKRo5S9eqHx7S40', '2024-10-12 09:55:23.145427'),
('35n5kwk0fxzctlzeg3b98nzjam78q0f4', '.eJyrViotTi2Kz0xRsjLUgbDzEnNTlayUElNyM_PiQSJKUImSygKQhCNIQqkWAFGEFB4:1szXl7:oFTq_jrk1n7nMehYZ0TRXxHKvFDTUBUey7gt7DSL240', '2024-10-12 10:15:57.871850'),
('pw54dk8h98ckh5d5xf5nx7rqlrh34pkb', '.eJyrViotTi2Kz0xRsjLUgbDzEnNTlayUElNyM_PiQSJKUImSygKQhCNIQqkWAFGEFB4:1szcuT:84wf0K2cQOevWdy1aaQhVCLo3bq6XBkRLG9eLHPQmKU', '2024-10-12 15:45:57.905286'),
('7ykro3nmvynbpko9mw8uho3mh9rahnw4', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1t03kN:XTp0SI5RrGsz5-uhcRSU9W7bIfT-ScO5kAjGRrllFnU', '2024-10-13 20:25:19.808496'),
('zdy1ukdx6jn69aig2od6ux7ni87k5tiq', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1t16lb:9z1FWrcnGRpTirz5MM1mIp0Fas3eAmwUV4BbMmaJnes', '2024-10-16 17:50:55.506009'),
('sqpswgpbhm8ujg5injsnomo481zsqp57', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1t1hpS:hd9zAaLT_5M2KurjXoL1BQw17S2FetbYeOggiZC8iCw', '2024-10-18 09:25:22.603252'),
('ubv4303ihkzllq60vkty5ffaxw57d60e', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1t3yZr:xg8pUZG-I4Q98uLN3kL0Ymb3UOJ-RbXEEQC82bEM4Ps', '2024-10-24 15:42:39.828879'),
('yblbeb0nmu2nkztpr2zzklzyc7tv3r3p', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1t4dDB:G2xCLi5Z3x-mML_q4zkkONJjv4akFIjvWxDQ43IDmzA', '2024-10-26 11:05:57.185282'),
('3qhbdyc13mkpqw3ogsqdw5exfgxurd3a', '.eJyrViotTi2Kz0xRsrK0MDcwMDYz1IEI5SXmpipZKSVnlCZnK0HFSioLQGIeqYk5JRnh-UXZqUVKtQDayRZd:1t4xkL:6clvheX_Xxy8Iss77p2jT946Ng8uo0RD2sXCksaWKsE', '2024-10-27 09:01:33.866386'),
('iieimhgesrrarjhwgdn1nymjijhha3d8', '.eJyrViotTi2Kz0xRsjI2MTY0MbKw0IEI5SXmpipZKZXnF2WnFhkqQUVLKgtAoh6piTklGeFgOaVaAAnSFxk:1t5KT4:i1TuRAnOW9DjPSoQhaM-0cMVWarhSF8rASWI5acO6UM', '2024-10-28 09:17:14.211744'),
('kxp3dogv2ffq6zxvubab1dnkwl0bz4nj', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1t5NSH:nJUeRQwapUyJSZDr40oee_AxW7zQv6DslAsV8GMxEzM', '2024-10-28 12:28:37.100687'),
('ir2ufhrumj9bkxgtsg66dsczg7e1ow2f', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1t5OE5:swHFJcrQiiabL9MBE4AFIdqjHnS66OYwwJBNPOTmU_4', '2024-10-28 13:18:01.392133'),
('r67knij6chvolcokg2bim3dwa6ds87yc', '.eJyrViotTi2Kz0xRsjI2MTY0MbKw0IEI5SXmpipZKZXnF2WnFhkqQUVLKgtAoh6piTklGeFgOaVaAAnSFxk:1t5OLm:9a8PdUr8D15El9eYyu7DLpGvqUvBJEFZo-XSejlWm14', '2024-10-28 13:25:58.250209'),
('1ia0px9w6957zs574uekfh3euot6s6zz', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1t5iBO:0oXYKppTkxn4NV4UQpla58aexZg_XSP4Y6l-7YeXmNc', '2024-10-29 10:36:34.993734'),
('fb9fmk3j8omqmi4dwvwg4o7t3tyrgu3m', '.eJyrViotTi2Kz0xRsjI2MTY0MbKw0IEI5SXmpipZKZXnF2WnFhkqQUVLKgtAoh6piTklGeFgOaVaAAnSFxk:1t5iQb:zsLfm3KRdmiP0U8e7rYjJq3mH5C32QmIrQSwkn-hhl0', '2024-10-29 10:52:17.377705'),
('gexzyxxn0jq4xc7phpuipg1y893s8cic', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1t5nkQ:85wQayeGXcVzfmKXO13lA8MDXSxSOBNb7-UOWS-VzLo', '2024-10-29 16:33:06.204111'),
('h79ffuq05t9uadhmdmu30v1tevo3x2g8', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1t5zLg:y4_l81vsuvtnrxq6wiaTPlryycLxMzyxSZAA4mHA1VE', '2024-10-30 04:56:20.445993'),
('xjgb5x35ub6rfvvkn4lbs6ygaylz2m5l', '.eJyrViotTi2Kz0xRsjI2MTY0MbKw0IEI5SXmpipZKZXnF2WnFhkqQUVLKgtAoh6piTklGeFgOaVaAAnSFxk:1t615L:XXWfcpZU7p03g-4RNMujLMYvxlo0WFY7BN0wo_hMWZQ', '2024-10-30 06:47:35.684157'),
('tdwjh2mxpxh7fv7w3lkyujfwhg1og8wo', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1t62iX:bPfj_YNylKVlLICicJfK7loDBnUlrIOpnIRXXRksmsI', '2024-10-30 08:32:09.485101'),
('o10r2ksoks5692zz5q2y8jdtte6v82xr', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1t64FL:S56fD-JI9Nb11XliheZO29eaQBPlToAQJOuPlY30SrE', '2024-10-30 10:10:07.050315'),
('72x2459sryeei7xd59cubb2cfj3dr9dx', '.eJyrViotTi2Kz0xRsrI0NzU1NzU00IEI5SXmpipZKSWm5GbmxZdk5ilBxUsqC0DijiBxpVoAnyMVIA:1t64Hs:18X-oDKLhwfx34DxwgwsupPZKSDmqZ-pB0BTdSjI5TA', '2024-10-30 10:12:44.726213'),
('rlgnn9szpw50lhpjpvmlwa1kfyc6ex3r', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1t66dX:a3mNptnR-1ZTn79YQGY4FBBxuKAeiDNtl1R3bc5abtc', '2024-10-30 12:43:15.124999'),
('km5vxqjiw3566djmmobx4s0b57nprzzb', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1t683G:vLaztywembTf98PGSC5UkIkN3Uds0N4bBUd1YC-ySCg', '2024-10-30 14:13:54.596540'),
('gs9peby0c9jz679n8xnzivuapqraiinn', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1t6A8O:xDIIPhIxDXQj3QQJO8vWRdn983r8hQGcllbRS2MO6dM', '2024-10-30 16:27:20.715692'),
('mcb76jgw9rgkk5lmwq0boeynnokmlsgl', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1t6KDO:u6HWa8fuN1HTPBnF2rqk_EA3n33_t5tLG-QSC8zvqU8', '2024-10-31 03:13:10.849032'),
('bb9d4d43q2787a225od67xh5hd8jr6g8', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1t6Nm1:utnXAr5vPocAHUJ-IUzg24W7q_hvxjnz0o9JkKcRX6M', '2024-10-31 07:01:09.980682'),
('yy3ioxehl436ymr1bofu11tyhu4l0rry', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1t6PX3:Pl8Mf-kUD3_8C1ShVVnfpw7e7e0GsulYKuYorBLk5js', '2024-10-31 08:53:49.832433'),
('wdtyiqghkngzbvyoirqg2zv6g9oangdl', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1t6R0O:a9D1imbWsbgnKbm2qMEPcHJ9UezrBSusAvcrn6aXcOg', '2024-10-31 10:28:12.184853'),
('73h1rsuok41hxsh6vsd3k6sjpvab5yb4', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1t6W5X:PzhoLL3IUAzsxp2zYWvA4bW3fLY-9Wp_6qEkRRPUHDY', '2024-10-31 15:53:51.514996'),
('kff4s7os9d0ks1jzbr0g6bf32uuks3hl', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1t6WS2:Sg5e6ttcIoyyCWRwUHm-scklaBVPlC9hX5fEee17jc8', '2024-10-31 16:17:06.654506'),
('2ltefx59z697oqgmco8viydypacymoyv', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1t6X5b:Z7kdYA0RawUhJs5_io6qd9nKFe7BpHQmGMYbvCKuamY', '2024-10-31 16:57:59.331115'),
('irf2s9dwh17rfvb5zev36frozawktyob', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1t6X6A:tSmp758IDCLkUsLpI3QjALNzn6TwE9Hd16Z4-Ocfx78', '2024-10-31 16:58:34.000815'),
('3pjik2lds6m2g48e5obzkg4g0uqvzmeo', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1t7sum:W0tOgjthEjO4UrjwYZOZC305R5Hf51kohMqp8PXUSXc', '2024-11-04 10:28:24.247431'),
('quqaq3s887xmij2nq1b1xmym406tpl3k', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1t8Ikl:O_jmym9Hryh70W9CtVjiod9I-J-JtVRzBi6eMGdydZE', '2024-11-05 14:03:47.028834'),
('da15ecv4uuttsioejq421in9wfleejlm', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1t8Wcv:EvlOyMPEIQuEKUq1h1kODisxAkmfEorJmhpbMuW3vRk', '2024-11-06 04:52:37.727073'),
('mgu30rvtaccxl8jrn4avpadmbimkbwdv', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1t8fIu:TNoJedt1ak3-7yn6ST0I2IJBwTdMviEVMsAgZEfP1rA', '2024-11-06 14:08:32.230666'),
('4mgz94w3o3wo8q86v2yhf7jn2a78nc6j', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1t8yWm:WQBG44XYUK8kItkK63v25BJ_b62uJYeHguHkW7Q6B6g', '2024-11-07 10:40:08.421455'),
('64whelgev9pm73dnz8kxvkv8nylb94n3', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1t9HOR:tEdYFeGDANYbv0pXI_kUg74gV2tN-Ybl7kZMl4d8oDo', '2024-11-08 06:48:47.836938'),
('6tty3i84ima9g3yr11rle5tkbj9zo83n', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1t9MNs:M49UCJ6mFOfbjpLSNM9oQHUIpWju8JJIpjzNfsup1f4', '2024-11-08 12:08:32.243146'),
('jw4cwbqigqw7lm0bn3pgddghcmhc811u', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1tAsMf:pug9geSji1JrQ1h_cO6Fl92ZSJ38NzvYbTpV2Tm4KB0', '2024-11-12 16:29:33.263754'),
('vtloavl9d6qcgbl1lg8drgkx69rxhhk8', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1tB8Y4:_t4quOCufXUlInBFeSIsKI8UaKLkp8TacX2L_SmZuxI', '2024-11-13 09:46:24.274048'),
('1p7m3ajt6jl2objrjx0n85zqukjj0azc', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1tB8Yf:_ECk_5u8ec94o1AcM_ObiyaSq9TdRZOagVeyYV8r8oc', '2024-11-13 09:47:01.300895'),
('88w5mqbotznw5sxpzsrg2cjac4g39gwl', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1tB8kH:B35yees9-JMf-uGtYoVqEEAPreXOxxwUlv0-xZ4hz_k', '2024-11-13 09:59:01.494004'),
('4vjaa6q0y8mo3fpc68wyo1ub4ub4s7qj', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1tBAFn:NSqwZDDoDo_IkBFQ8-ZwM0cXhbg7wH-9juvXmMumft4', '2024-11-13 11:35:39.315464'),
('eu2fq8st2xhlsskxlx5g325c3lxcupem', 'eyJzZWN1cml0eV9jb2RlIjoxNTkzNDN9:1tBeOS:kwqcymNL5mnLyoCRSn9A7g2u2lacT8DUecee4oUdZNU', '2024-11-14 19:46:36.936261'),
('mtis925p7sr7hzy0vtl66ba81azc2irp', '.eJyrViotTi2Kz0xRsjI2MTY0MbKw0IEI5SXmpipZKZXnF2WnFhkqQUVLKgtAoh6piTklGeFgOaVaAAnSFxk:1tBl9w:-fS6H9LPqjOxHjBpdHPtaspKqOjGfTxx8KAaXS2s4JE', '2024-11-15 03:00:04.826435'),
('z6pps4eies0l7zi460fndmm02kcc7xrc', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1tBplC:fKzJ15tB1bBMNTwCh2Xhw6UdOLkijotUfMskVfMnVTk', '2024-11-15 07:54:50.837844'),
('xuiu6t8ji6y6xc6k8uzcx2c4gnq7vgff', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1tBspV:yP2G0pUzxWfS4uYbQ-uf5sqK2jP02ispM3JC3D48hvQ', '2024-11-15 11:11:29.233721'),
('4mvamqh6gy7e665hyigr0fkw2q13jsj6', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1tBw7B:Kp3MrkUEGpHXh3AotSxDztn13osCPln-szouhByREnk', '2024-11-15 14:41:57.952954'),
('ciy8foe361wvugj5m7bwlfmye7mugxx8', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1tBwV1:C9ZPNtnSCemH-VS4NJGeJGijs1-UsZ9GIH30cABgC9k', '2024-11-15 15:06:35.455044'),
('mdtjj1j856lri0zltjay6sv0q1arh6zk', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1tBwV1:C9ZPNtnSCemH-VS4NJGeJGijs1-UsZ9GIH30cABgC9k', '2024-11-15 15:06:35.516380'),
('40agqiiybqilqqkxdhojfinvy2kq8lr6', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1tBwbs:b4XEi5mRNQZLoks6zuaYVWG4W26gwP17CV8TytdNRVg', '2024-11-15 15:13:40.574586'),
('mhjrbgjnwqu6fdkubcujxk0u7qe045t2', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1tBwqj:sAFzMbIlvLfOudQ61NIc1DnQKrKmvSyS5sBlmWNZCYA', '2024-11-15 15:29:01.110557'),
('hodmr0ohh5fspqq57jdeq4p6s96i3k7v', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1tCGrm:OPuTzrepdyBCImris5Tyg-Aq5Br6jfyP-BLz1PmjeUs', '2024-11-16 12:51:26.438101'),
('awvdbfm6y9kxk9och2ay1r5bfjm3trv6', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1tDZJH:oitkdG8_ZEjocxGL7ovwAyOPeblIbGE1uCBwW72O1Nw', '2024-11-20 02:45:11.235607'),
('2pzxsgvz55ka5mnjp9lzbpkb6z26rdwp', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1tDajk:p2XoBmQEqBXbEvAfXxTUvTxICaa-mtJHik2quwqCaZw', '2024-11-20 04:16:36.091388'),
('j5rn4v9dkq2ao2722a7xrw5s61q59kv9', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1tE97T:_XKtBEik9o8S-cTxcH7BHpdSNIe0vF73mOcC_EG3lAs', '2024-11-21 16:59:23.567308'),
('dqhb7lm8r67lkspxqwmc8a9dy9i3ifvf', '.eJyrViotTi2Kz0xRsjIxs7AwMjIz0IEI5SXmpipZKSWm5GbmxYNElKASJZUFIAlHkIRSLQC2vBWR:1tE9In:DOslBUG3xUNrPC1juG0f6qP0I1UxaDzO2UtfNLStLwg', '2024-11-21 17:11:05.446906');

-- --------------------------------------------------------

--
-- Table structure for table `healthworker`
--

CREATE TABLE `healthworker` (
  `worker_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `security_code` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `healthworker`
--

INSERT INTO `healthworker` (`worker_id`, `username`, `password`, `email`, `phone`, `security_code`, `created_at`) VALUES
(27329118, 'worker16', 'password16', 'worker16@example.com', '555-5360', 674573, '2024-09-16 00:00:00'),
(28091818, 'worker14', 'password14', 'worker14@example.com', '555-1328', 494847, '2024-09-14 00:00:00'),
(34314288, 'worker1', 'password1', 'worker1@example.com', '555-1234', 941195, '2024-09-01 00:00:00'),
(38058362, 'worker8', 'password8', 'worker8@example.com', '555-9202', 606686, '2024-09-08 00:00:00'),
(47379393, 'worker13', 'password13', 'worker13@example.com', '555-9307', 400805, '2024-09-13 00:00:00'),
(78320914, 'worker15', 'password15', 'worker15@example.com', '555-3349', 271823, '2024-09-15 00:00:00'),
(81235123, 'worker5', 'password5', 'worker5@example.com', '555-3141', 441442, '2024-09-05 00:00:00'),
(86426904, 'worker18', 'password18', 'worker18@example.com', '555-9402', 263256, '2024-09-18 00:00:00'),
(88481145, 'worker6', 'password6', 'worker6@example.com', '555-5161', 928560, '2024-09-06 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `health_report`
--

CREATE TABLE `health_report` (
  `report_id` int(11) NOT NULL,
  `senior_id` int(11) NOT NULL,
  `worker_id` int(11) NOT NULL,
  `report_data` text NOT NULL,
  `date_created` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `health_report`
--

INSERT INTO `health_report` (`report_id`, `senior_id`, `worker_id`, `report_data`, `date_created`, `created_at`) VALUES
(1, 1, 1, 'Health report data 1', '2024-09-01', '2024-09-01 00:00:00'),
(2, 2, 2, 'Health report data 2', '2024-09-02', '2024-09-02 00:00:00'),
(3, 3, 3, 'Health report data 3', '2024-09-03', '2024-09-03 00:00:00'),
(4, 4, 4, 'Health report data 4', '2024-09-04', '2024-09-04 00:00:00'),
(5, 5, 5, 'Health report data 5', '2024-09-05', '2024-09-05 00:00:00'),
(6, 6, 6, 'Health report data 6', '2024-09-06', '2024-09-06 00:00:00'),
(7, 7, 7, 'Health report data 7', '2024-09-07', '2024-09-07 00:00:00'),
(8, 8, 8, 'Health report data 8', '2024-09-08', '2024-09-08 00:00:00'),
(9, 9, 9, 'Health report data 9', '2024-09-09', '2024-09-09 00:00:00'),
(10, 10, 10, 'Health report data 10', '2024-09-10', '2024-09-10 00:00:00'),
(11, 11, 11, 'Health report data 11', '2024-09-11', '2024-09-11 00:00:00'),
(12, 12, 12, 'Health report data 12', '2024-09-12', '2024-09-12 00:00:00'),
(13, 13, 13, 'Health report data 13', '2024-09-13', '2024-09-13 00:00:00'),
(14, 14, 14, 'Health report data 14', '2024-09-14', '2024-09-14 00:00:00'),
(15, 15, 15, 'Health report data 15', '2024-09-15', '2024-09-15 00:00:00'),
(16, 16, 16, 'Health report data 16', '2024-09-16', '2024-09-16 00:00:00'),
(17, 17, 17, 'Health report data 17', '2024-09-17', '2024-09-17 00:00:00'),
(18, 18, 18, 'Health report data 18', '2024-09-18', '2024-09-18 00:00:00'),
(19, 19, 19, 'Health report data 19', '2024-09-19', '2024-09-19 00:00:00'),
(20, 20, 20, 'Health report data 20', '2024-09-20', '2024-09-20 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `predicted_diseases`
--

CREATE TABLE `predicted_diseases` (
  `id` int(11) NOT NULL,
  `citizen_id` varchar(100) NOT NULL,
  `disease_name` varchar(255) NOT NULL,
  `score` float DEFAULT 1,
  `prediction_rank` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `predicted_diseases`
--

INSERT INTO `predicted_diseases` (`id`, `citizen_id`, `disease_name`, `score`, `prediction_rank`, `created_at`) VALUES
(20655, '727', 'Chronic kidney disease', 0.791147, 1, '2024-10-29 15:09:33'),
(20656, '728', 'Hypertension', 0.931161, 1, '2024-10-29 15:09:33'),
(20657, '729', 'Alzheimer\'s disease', 0.71843, 1, '2024-10-29 15:09:33'),
(20658, '730', 'Alzheimer\'s disease', 0.938911, 1, '2024-10-29 15:09:33'),
(20659, '731', 'Asthma', 0.700551, 1, '2024-10-29 15:09:33'),
(20660, '732', 'Chronic kidney disease', 0.784369, 1, '2024-10-29 15:09:33'),
(20661, '733', 'Parkinson\'s disease', 0.995791, 1, '2024-10-29 15:09:33'),
(20662, '734', 'Anemia', 0.714972, 1, '2024-10-29 15:09:33'),
(20663, '735', 'Alzheimer\'s disease', 0.89245, 1, '2024-10-29 15:09:33'),
(20665, '737', 'Celiac disease', 0.901629, 1, '2024-10-29 15:09:33'),
(20666, '738', 'Parkinson\'s disease', 0.763989, 1, '2024-10-29 15:09:33'),
(20667, '739', 'Asthma', 0.886895, 1, '2024-10-29 15:09:33'),
(20668, '740', 'Anemia', 0.731347, 1, '2024-10-29 15:09:33'),
(20669, '741', 'Cancer', 0.95349, 1, '2024-10-29 15:09:33'),
(20670, '742', 'Respiratory infections', 0.801991, 1, '2024-10-29 15:09:33'),
(20671, '743', 'Type 2 Diabetes mellitus', 0.70832, 1, '2024-10-29 15:09:33'),
(20672, '744', 'Cancer', 0.721055, 1, '2024-10-29 15:09:33'),
(20673, '745', 'Type 1 Diabetes mellitus', 0.858468, 1, '2024-10-29 15:09:33'),
(20674, '746', 'Osteoporosis', 0.774931, 1, '2024-10-29 15:09:33'),
(20675, '747', 'Chronic kidney disease', 0.846979, 1, '2024-10-29 15:09:33'),
(20676, '748', 'Prostate cancer', 0.726868, 1, '2024-10-29 15:09:33'),
(20677, '749', 'Alzheimer\'s disease', 0.990619, 1, '2024-10-29 15:09:33'),
(20678, '750', 'Parkinson\'s disease', 0.901759, 1, '2024-10-29 15:09:33'),
(20679, '751', 'Type 2 Diabetes mellitus', 0.764329, 1, '2024-10-29 15:09:33'),
(20680, '752', 'Cancer', 0.841976, 1, '2024-10-29 15:09:33'),
(20681, '753', 'Stroke', 0.853981, 1, '2024-10-29 15:09:33'),
(20682, '754', 'Celiac disease', 0.975935, 1, '2024-10-29 15:09:33'),
(20683, '755', 'Prostate cancer', 0.709889, 1, '2024-10-29 15:09:33'),
(20684, '756', 'Anxiety', 0.876585, 1, '2024-10-29 15:09:33'),
(20685, '757', 'Respiratory infections', 0.802946, 1, '2024-10-29 15:09:33'),
(20686, '758', 'Stroke', 0.77577, 1, '2024-10-29 15:09:33'),
(20687, '759', 'Depression', 0.772045, 1, '2024-10-29 15:09:33'),
(20688, '760', 'Alzheimer\'s disease', 0.789102, 1, '2024-10-29 15:09:33'),
(20689, '761', 'Anemia', 0.779641, 1, '2024-10-29 15:09:33'),
(20690, '762', 'Asthma', 0.700058, 1, '2024-10-29 15:09:33'),
(20691, '763', 'Type 1 Diabetes mellitus', 0.829972, 1, '2024-10-29 15:09:33'),
(20692, '764', 'Obesity', 0.995735, 1, '2024-10-29 15:09:33'),
(20693, '765', 'Osteoporosis', 0.758289, 1, '2024-10-29 15:09:33'),
(20694, '766', 'Osteoporosis', 0.861194, 1, '2024-10-29 15:09:33'),
(20695, '767', 'Cancer', 0.950115, 1, '2024-10-29 15:09:33'),
(20696, '768', 'Osteoporosis', 0.800751, 1, '2024-10-29 15:09:33'),
(20697, '769', 'Cancer', 0.707054, 1, '2024-10-29 15:09:33'),
(20698, '770', 'Type 1 Diabetes mellitus', 0.918408, 1, '2024-10-29 15:09:33'),
(20699, '771', 'Anemia', 0.815787, 1, '2024-10-29 15:09:33'),
(20700, '772', 'Anemia', 0.756427, 1, '2024-10-29 15:09:33'),
(20701, '773', 'Heart disease', 0.928535, 1, '2024-10-29 15:09:33'),
(20702, '774', 'Celiac disease', 0.903902, 1, '2024-10-29 15:09:33'),
(20703, '775', 'Chronic kidney disease', 0.868266, 1, '2024-10-29 15:09:33'),
(20704, '776', 'Alzheimer\'s disease', 0.791375, 1, '2024-10-29 15:09:34'),
(20705, '777', 'Stroke', 0.709456, 1, '2024-10-29 15:09:34');

-- --------------------------------------------------------

--
-- Table structure for table `predictiveanalytics`
--

CREATE TABLE `predictiveanalytics` (
  `analytics_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `results` text DEFAULT NULL,
  `created_by` enum('Admin','HealthWorker') DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `predictiveanalytics`
--

INSERT INTO `predictiveanalytics` (`analytics_id`, `description`, `results`, `created_by`, `creator_id`, `created_at`) VALUES
(58, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.50\n\nConfusion Matrix:\n[[1 0]\n [2 1]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       0.33      1.00      0.50         1\n           1       1.00      0.33      0.50         3\n\n    accuracy                           0.50         4\n   macro avg       0.67      0.67      0.50         4\nweighted avg       0.83      0.50      0.50         4\n\n\nOverall Predictions Summary:\nClass 0: 3 occurrences, Class 1: 1 occurrences', 'Admin', 1, '2024-10-28 09:19:41'),
(59, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.25\n\nConfusion Matrix:\n[[0 1]\n [2 1]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       0.00      0.00      0.00         1\n           1       0.50      0.33      0.40         3\n\n    accuracy                           0.25         4\n   macro avg       0.25      0.17      0.20         4\nweighted avg       0.38      0.25      0.30         4\n\n\nOverall Predictions Summary:\nClass 1: 2 occurrences, Class 0: 2 occurrences', 'Admin', 1, '2024-10-28 10:23:03'),
(60, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.25\n\nConfusion Matrix:\n[[1 0]\n [3 0]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       0.25      1.00      0.40         1\n           1       0.00      0.00      0.00         3\n\n    accuracy                           0.25         4\n   macro avg       0.12      0.50      0.20         4\nweighted avg       0.06      0.25      0.10         4\n\n\nOverall Predictions Summary:\nClass 0: 4 occurrences', 'Admin', 1, '2024-10-28 11:23:11'),
(61, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.50\n\nConfusion Matrix:\n[[1 1]\n [1 1]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       0.50      0.50      0.50         2\n           1       0.50      0.50      0.50         2\n\n    accuracy                           0.50         4\n   macro avg       0.50      0.50      0.50         4\nweighted avg       0.50      0.50      0.50         4\n\n\nOverall Predictions Summary:\nClass 0: 2 occurrences, Class 1: 2 occurrences', 'Admin', 1, '2024-10-28 13:09:49'),
(62, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.75\n\nConfusion Matrix:\n[[2 1]\n [0 1]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       1.00      0.67      0.80         3\n           1       0.50      1.00      0.67         1\n\n    accuracy                           0.75         4\n   macro avg       0.75      0.83      0.73         4\nweighted avg       0.88      0.75      0.77         4\n\n\nOverall Predictions Summary:\nClass 1: 2 occurrences, Class 0: 2 occurrences', 'Admin', 1, '2024-10-29 09:01:00'),
(63, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.50\n\nConfusion Matrix:\n[[1 0]\n [2 1]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       0.33      1.00      0.50         1\n           1       1.00      0.33      0.50         3\n\n    accuracy                           0.50         4\n   macro avg       0.67      0.67      0.50         4\nweighted avg       0.83      0.50      0.50         4\n\n\nOverall Predictions Summary:\nClass 0: 3 occurrences, Class 1: 1 occurrences', 'Admin', 1, '2024-10-29 14:23:28'),
(64, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.75\n\nConfusion Matrix:\n[[0 1]\n [0 3]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       0.00      0.00      0.00         1\n           1       0.75      1.00      0.86         3\n\n    accuracy                           0.75         4\n   macro avg       0.38      0.50      0.43         4\nweighted avg       0.56      0.75      0.64         4\n\n\nOverall Predictions Summary:\nClass 1: 4 occurrences', 'Admin', 1, '2024-10-30 03:09:56'),
(65, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.25\n\nConfusion Matrix:\n[[0 1]\n [2 1]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       0.00      0.00      0.00         1\n           1       0.50      0.33      0.40         3\n\n    accuracy                           0.25         4\n   macro avg       0.25      0.17      0.20         4\nweighted avg       0.38      0.25      0.30         4\n\n\nOverall Predictions Summary:\nClass 0: 2 occurrences, Class 1: 2 occurrences', 'Admin', 1, '2024-10-30 05:12:54'),
(66, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.75\n\nConfusion Matrix:\n[[2 1]\n [0 1]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       1.00      0.67      0.80         3\n           1       0.50      1.00      0.67         1\n\n    accuracy                           0.75         4\n   macro avg       0.75      0.83      0.73         4\nweighted avg       0.88      0.75      0.77         4\n\n\nOverall Predictions Summary:\nClass 1: 2 occurrences, Class 0: 2 occurrences', 'Admin', 1, '2024-10-30 07:02:09'),
(67, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.50\n\nConfusion Matrix:\n[[1 2]\n [0 1]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       1.00      0.33      0.50         3\n           1       0.33      1.00      0.50         1\n\n    accuracy                           0.50         4\n   macro avg       0.67      0.67      0.50         4\nweighted avg       0.83      0.50      0.50         4\n\n\nOverall Predictions Summary:\nClass 1: 3 occurrences, Class 0: 1 occurrences', 'Admin', 1, '2024-10-30 08:39:32'),
(68, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.50\n\nConfusion Matrix:\n[[2 1]\n [1 0]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       0.67      0.67      0.67         3\n           1       0.00      0.00      0.00         1\n\n    accuracy                           0.50         4\n   macro avg       0.33      0.33      0.33         4\nweighted avg       0.50      0.50      0.50         4\n\n\nOverall Predictions Summary:\nClass 0: 3 occurrences, Class 1: 1 occurrences', 'Admin', 1, '2024-10-30 09:44:24'),
(69, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.25\n\nConfusion Matrix:\n[[0 3]\n [0 1]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       0.00      0.00      0.00         3\n           1       0.25      1.00      0.40         1\n\n    accuracy                           0.25         4\n   macro avg       0.12      0.50      0.20         4\nweighted avg       0.06      0.25      0.10         4\n\n\nOverall Predictions Summary:\nClass 1: 4 occurrences', 'Admin', 1, '2024-10-30 11:11:47'),
(70, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.50\n\nConfusion Matrix:\n[[1 2]\n [0 1]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       1.00      0.33      0.50         3\n           1       0.33      1.00      0.50         1\n\n    accuracy                           0.50         4\n   macro avg       0.67      0.67      0.50         4\nweighted avg       0.83      0.50      0.50         4\n\n\nOverall Predictions Summary:\nClass 1: 3 occurrences, Class 0: 1 occurrences', 'Admin', 1, '2024-10-30 12:42:41'),
(71, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.75\n\nConfusion Matrix:\n[[3 0]\n [1 0]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       0.75      1.00      0.86         3\n           1       0.00      0.00      0.00         1\n\n    accuracy                           0.75         4\n   macro avg       0.38      0.50      0.43         4\nweighted avg       0.56      0.75      0.64         4\n\n\nOverall Predictions Summary:\nClass 0: 4 occurrences', 'Admin', 1, '2024-10-30 14:57:21'),
(72, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.25\n\nConfusion Matrix:\n[[0 3]\n [0 1]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       0.00      0.00      0.00         3\n           1       0.25      1.00      0.40         1\n\n    accuracy                           0.25         4\n   macro avg       0.12      0.50      0.20         4\nweighted avg       0.06      0.25      0.10         4\n\n\nOverall Predictions Summary:\nClass 1: 4 occurrences', 'Admin', 1, '2024-10-31 01:43:11'),
(73, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.50\n\nConfusion Matrix:\n[[0 2]\n [0 2]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       0.00      0.00      0.00         2\n           1       0.50      1.00      0.67         2\n\n    accuracy                           0.50         4\n   macro avg       0.25      0.50      0.33         4\nweighted avg       0.25      0.50      0.33         4\n\n\nOverall Predictions Summary:\nClass 1: 4 occurrences', 'Admin', 1, '2024-10-31 05:31:10'),
(74, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.25\n\nConfusion Matrix:\n[[1 2]\n [1 0]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       0.50      0.33      0.40         3\n           1       0.00      0.00      0.00         1\n\n    accuracy                           0.25         4\n   macro avg       0.25      0.17      0.20         4\nweighted avg       0.38      0.25      0.30         4\n\n\nOverall Predictions Summary:\nClass 0: 2 occurrences, Class 1: 2 occurrences', 'Admin', 1, '2024-10-31 07:23:35'),
(75, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.75\n\nConfusion Matrix:\n[[0 0]\n [1 3]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       0.00      0.00      0.00         0\n           1       1.00      0.75      0.86         4\n\n    accuracy                           0.75         4\n   macro avg       0.50      0.38      0.43         4\nweighted avg       1.00      0.75      0.86         4\n\n\nOverall Predictions Summary:\nClass 1: 3 occurrences, Class 0: 1 occurrences', 'Admin', 1, '2024-10-31 08:42:11'),
(76, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.50\n\nConfusion Matrix:\n[[2 0]\n [2 0]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       0.50      1.00      0.67         2\n           1       0.00      0.00      0.00         2\n\n    accuracy                           0.50         4\n   macro avg       0.25      0.50      0.33         4\nweighted avg       0.25      0.50      0.33         4\n\n\nOverall Predictions Summary:\nClass 0: 4 occurrences', 'Admin', 1, '2024-10-31 14:23:52'),
(77, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.50\n\nConfusion Matrix:\n[[1 2]\n [0 1]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       1.00      0.33      0.50         3\n           1       0.33      1.00      0.50         1\n\n    accuracy                           0.50         4\n   macro avg       0.67      0.67      0.50         4\nweighted avg       0.83      0.50      0.50         4\n\n\nOverall Predictions Summary:\nClass 1: 3 occurrences, Class 0: 1 occurrences', 'Admin', 1, '2024-10-31 15:27:16'),
(78, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.75\n\nConfusion Matrix:\n[[3 0]\n [1 0]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       0.75      1.00      0.86         3\n           1       0.00      0.00      0.00         1\n\n    accuracy                           0.75         4\n   macro avg       0.38      0.50      0.43         4\nweighted avg       0.56      0.75      0.64         4\n\n\nOverall Predictions Summary:\nClass 0: 4 occurrences', 'Admin', 1, '2024-11-02 13:22:41'),
(79, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.50\n\nConfusion Matrix:\n[[1 2]\n [0 1]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       1.00      0.33      0.50         3\n           1       0.33      1.00      0.50         1\n\n    accuracy                           0.50         4\n   macro avg       0.67      0.67      0.50         4\nweighted avg       0.83      0.50      0.50         4\n\n\nOverall Predictions Summary:\nClass 1: 3 occurrences, Class 0: 1 occurrences', 'Admin', 1, '2024-11-04 08:58:25'),
(80, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.50\n\nConfusion Matrix:\n[[2 1]\n [1 0]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       0.67      0.67      0.67         3\n           1       0.00      0.00      0.00         1\n\n    accuracy                           0.50         4\n   macro avg       0.33      0.33      0.33         4\nweighted avg       0.50      0.50      0.50         4\n\n\nOverall Predictions Summary:\nClass 0: 3 occurrences, Class 1: 1 occurrences', 'Admin', 1, '2024-11-05 12:33:47'),
(81, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.25\n\nConfusion Matrix:\n[[0 3]\n [0 1]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       0.00      0.00      0.00         3\n           1       0.25      1.00      0.40         1\n\n    accuracy                           0.25         4\n   macro avg       0.12      0.50      0.20         4\nweighted avg       0.06      0.25      0.10         4\n\n\nOverall Predictions Summary:\nClass 1: 4 occurrences', 'Admin', 1, '2024-11-06 03:22:38'),
(82, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.50\n\nConfusion Matrix:\n[[1 0]\n [2 1]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       0.33      1.00      0.50         1\n           1       1.00      0.33      0.50         3\n\n    accuracy                           0.50         4\n   macro avg       0.67      0.67      0.50         4\nweighted avg       0.83      0.50      0.50         4\n\n\nOverall Predictions Summary:\nClass 0: 3 occurrences, Class 1: 1 occurrences', 'Admin', 1, '2024-11-06 12:38:32'),
(83, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.25\n\nConfusion Matrix:\n[[1 0]\n [3 0]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       0.25      1.00      0.40         1\n           1       0.00      0.00      0.00         3\n\n    accuracy                           0.25         4\n   macro avg       0.12      0.50      0.20         4\nweighted avg       0.06      0.25      0.10         4\n\n\nOverall Predictions Summary:\nClass 0: 4 occurrences', 'Admin', 1, '2024-11-07 09:10:09'),
(84, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.50\n\nConfusion Matrix:\n[[2 0]\n [2 0]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       0.50      1.00      0.67         2\n           1       0.00      0.00      0.00         2\n\n    accuracy                           0.50         4\n   macro avg       0.25      0.50      0.33         4\nweighted avg       0.25      0.50      0.33         4\n\n\nOverall Predictions Summary:\nClass 0: 4 occurrences', 'Admin', 1, '2024-11-08 05:18:49'),
(85, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.75\n\nConfusion Matrix:\n[[3 0]\n [1 0]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       0.75      1.00      0.86         3\n           1       0.00      0.00      0.00         1\n\n    accuracy                           0.75         4\n   macro avg       0.38      0.50      0.43         4\nweighted avg       0.56      0.75      0.64         4\n\n\nOverall Predictions Summary:\nClass 0: 4 occurrences', 'Admin', 1, '2024-11-08 09:49:46'),
(86, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.00\n\nConfusion Matrix:\n[[0 4]\n [0 0]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       0.00      0.00      0.00       4.0\n           1       0.00      0.00      0.00       0.0\n\n    accuracy                           0.00       4.0\n   macro avg       0.00      0.00      0.00       4.0\nweighted avg       0.00      0.00      0.00       4.0\n\n\nOverall Predictions Summary:\nClass 1: 4 occurrences', 'Admin', 1, '2024-11-12 14:59:24'),
(87, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.25\n\nConfusion Matrix:\n[[1 2]\n [1 0]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       0.50      0.33      0.40         3\n           1       0.00      0.00      0.00         1\n\n    accuracy                           0.25         4\n   macro avg       0.25      0.17      0.20         4\nweighted avg       0.38      0.25      0.30         4\n\n\nOverall Predictions Summary:\nClass 0: 2 occurrences, Class 1: 2 occurrences', 'Admin', 1, '2024-11-13 08:16:25'),
(88, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.75\n\nConfusion Matrix:\n[[3 0]\n [1 0]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       0.75      1.00      0.86         3\n           1       0.00      0.00      0.00         1\n\n    accuracy                           0.75         4\n   macro avg       0.38      0.50      0.43         4\nweighted avg       0.56      0.75      0.64         4\n\n\nOverall Predictions Summary:\nClass 0: 4 occurrences', 'Admin', 1, '2024-11-13 09:52:40'),
(89, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.75\n\nConfusion Matrix:\n[[3 0]\n [1 0]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       0.75      1.00      0.86         3\n           1       0.00      0.00      0.00         1\n\n    accuracy                           0.75         4\n   macro avg       0.38      0.50      0.43         4\nweighted avg       0.56      0.75      0.64         4\n\n\nOverall Predictions Summary:\nClass 0: 4 occurrences', 'Admin', 1, '2024-11-14 07:01:38'),
(90, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.50\n\nConfusion Matrix:\n[[0 1]\n [1 2]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       0.00      0.00      0.00         1\n           1       0.67      0.67      0.67         3\n\n    accuracy                           0.50         4\n   macro avg       0.33      0.33      0.33         4\nweighted avg       0.50      0.50      0.50         4\n\n\nOverall Predictions Summary:\nClass 1: 3 occurrences, Class 0: 1 occurrences', 'Admin', 1, '2024-11-14 17:06:05'),
(91, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.75\n\nConfusion Matrix:\n[[2 1]\n [0 1]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       1.00      0.67      0.80         3\n           1       0.50      1.00      0.67         1\n\n    accuracy                           0.75         4\n   macro avg       0.75      0.83      0.73         4\nweighted avg       0.88      0.75      0.77         4\n\n\nOverall Predictions Summary:\nClass 0: 2 occurrences, Class 1: 2 occurrences', 'Admin', 1, '2024-11-15 01:19:05'),
(92, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.75\n\nConfusion Matrix:\n[[1 1]\n [0 2]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       1.00      0.50      0.67         2\n           1       0.67      1.00      0.80         2\n\n    accuracy                           0.75         4\n   macro avg       0.83      0.75      0.73         4\nweighted avg       0.83      0.75      0.73         4\n\n\nOverall Predictions Summary:\nClass 1: 3 occurrences, Class 0: 1 occurrences', 'Admin', 1, '2024-11-15 06:24:51'),
(93, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.75\n\nConfusion Matrix:\n[[2 0]\n [1 1]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       0.67      1.00      0.80         2\n           1       1.00      0.50      0.67         2\n\n    accuracy                           0.75         4\n   macro avg       0.83      0.75      0.73         4\nweighted avg       0.83      0.75      0.73         4\n\n\nOverall Predictions Summary:\nClass 0: 3 occurrences, Class 1: 1 occurrences', 'Admin', 1, '2024-11-15 09:41:29'),
(94, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.75\n\nConfusion Matrix:\n[[2 1]\n [0 1]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       1.00      0.67      0.80         3\n           1       0.50      1.00      0.67         1\n\n    accuracy                           0.75         4\n   macro avg       0.75      0.83      0.73         4\nweighted avg       0.88      0.75      0.77         4\n\n\nOverall Predictions Summary:\nClass 0: 2 occurrences, Class 1: 2 occurrences', 'Admin', 1, '2024-11-15 13:12:01'),
(95, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.75\n\nConfusion Matrix:\n[[0 1]\n [0 3]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       0.00      0.00      0.00         1\n           1       0.75      1.00      0.86         3\n\n    accuracy                           0.75         4\n   macro avg       0.38      0.50      0.43         4\nweighted avg       0.56      0.75      0.64         4\n\n\nOverall Predictions Summary:\nClass 1: 4 occurrences', 'Admin', 1, '2024-11-15 14:13:02'),
(96, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.50\n\nConfusion Matrix:\n[[1 0]\n [2 1]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       0.33      1.00      0.50         1\n           1       1.00      0.33      0.50         3\n\n    accuracy                           0.50         4\n   macro avg       0.67      0.67      0.50         4\nweighted avg       0.83      0.50      0.50         4\n\n\nOverall Predictions Summary:\nClass 0: 3 occurrences, Class 1: 1 occurrences', 'Admin', 1, '2024-11-16 11:21:27'),
(97, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.25\n\nConfusion Matrix:\n[[1 1]\n [2 0]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       0.33      0.50      0.40         2\n           1       0.00      0.00      0.00         2\n\n    accuracy                           0.25         4\n   macro avg       0.17      0.25      0.20         4\nweighted avg       0.17      0.25      0.20         4\n\n\nOverall Predictions Summary:\nClass 0: 3 occurrences, Class 1: 1 occurrences', 'Admin', 1, '2024-11-20 01:15:12'),
(98, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 1.00\n\nConfusion Matrix:\n[[1 0]\n [0 3]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       1.00      1.00      1.00         1\n           1       1.00      1.00      1.00         3\n\n    accuracy                           1.00         4\n   macro avg       1.00      1.00      1.00         4\nweighted avg       1.00      1.00      1.00         4\n\n\nOverall Predictions Summary:\nClass 1: 3 occurrences, Class 0: 1 occurrences', 'Admin', 1, '2024-11-20 02:46:28'),
(99, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.75\n\nConfusion Matrix:\n[[2 1]\n [0 1]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       1.00      0.67      0.80         3\n           1       0.50      1.00      0.67         1\n\n    accuracy                           0.75         4\n   macro avg       0.75      0.83      0.73         4\nweighted avg       0.88      0.75      0.77         4\n\n\nOverall Predictions Summary:\nClass 0: 2 occurrences, Class 1: 2 occurrences', 'Admin', 1, '2024-11-20 03:55:50'),
(100, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.75\n\nConfusion Matrix:\n[[0 1]\n [0 3]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       0.00      0.00      0.00         1\n           1       0.75      1.00      0.86         3\n\n    accuracy                           0.75         4\n   macro avg       0.38      0.50      0.43         4\nweighted avg       0.56      0.75      0.64         4\n\n\nOverall Predictions Summary:\nClass 1: 4 occurrences', 'Admin', 1, '2024-11-20 05:41:40'),
(101, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.50\n\nConfusion Matrix:\n[[2 2]\n [0 0]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       1.00      0.50      0.67         4\n           1       0.00      0.00      0.00         0\n\n    accuracy                           0.50         4\n   macro avg       0.50      0.25      0.33         4\nweighted avg       1.00      0.50      0.67         4\n\n\nOverall Predictions Summary:\nClass 1: 2 occurrences, Class 0: 2 occurrences', 'Admin', 1, '2024-11-20 07:42:49'),
(102, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.50\n\nConfusion Matrix:\n[[1 2]\n [0 1]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       1.00      0.33      0.50         3\n           1       0.33      1.00      0.50         1\n\n    accuracy                           0.50         4\n   macro avg       0.67      0.67      0.50         4\nweighted avg       0.83      0.50      0.50         4\n\n\nOverall Predictions Summary:\nClass 1: 3 occurrences, Class 0: 1 occurrences', 'Admin', 1, '2024-11-21 01:14:22'),
(103, 'Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\nConclusion: The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights into the performance of the model. The overall predictions summary indicates the distribution of predicted classes.', 'Accuracy: 0.50\n\nConfusion Matrix:\n[[0 2]\n [0 2]]\n\nClassification Report:\n              precision    recall  f1-score   support\n\n           0       0.00      0.00      0.00         2\n           1       0.50      1.00      0.67         2\n\n    accuracy                           0.50         4\n   macro avg       0.25      0.50      0.33         4\nweighted avg       0.25      0.50      0.33         4\n\n\nOverall Predictions Summary:\nClass 1: 4 occurrences', 'Admin', 1, '2024-11-21 15:19:46');

-- --------------------------------------------------------

--
-- Stand-in structure for view `predictiveanalytics_view`
-- (See below for the actual view)
--
CREATE TABLE `predictiveanalytics_view` (
`analytics_id` int(11)
,`description` text
,`results` text
,`created_by` enum('Admin','HealthWorker')
,`creator_id` int(11)
,`created_at` timestamp
,`created_date` varchar(10)
,`created_week` varchar(64)
,`created_month` varchar(64)
,`created_year` varchar(4)
,`created_week_number` int(3)
);

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `profile_id` int(11) NOT NULL,
  `user_type` enum('Admin','HealthWorker') NOT NULL,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seniorcitizen`
--

CREATE TABLE `seniorcitizen` (
  `citizen_id` int(15) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `health_condition` varchar(100) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `checkups` varchar(355) NOT NULL,
  `lifestyle` varchar(455) NOT NULL,
  `medication` varchar(455) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seniorcitizen`
--

INSERT INTO `seniorcitizen` (`citizen_id`, `first_name`, `last_name`, `date_of_birth`, `health_condition`, `gender`, `address`, `phone`, `checkups`, `lifestyle`, `medication`, `created_at`) VALUES
(727, 'Camel', 'Gonnely', '1939-11-14', 'Dental issues, Cavities', 'Female', '46 Butterfield Way', '9704369765', 'Scheduled', 'Pain management exercises, Avoids heavy lifting', 'Levothyroxine', '2024-10-29 15:04:09'),
(728, 'NerO', 'Jesty', '1952-11-14', 'Stroke, Cerebrovascular accident', 'Male', '68 Cherokee Circle', '6766388988', 'Scheduled', 'Low-fat diet, Avoids fried foods', 'NSAIDs', '2024-10-29 15:04:09'),
(729, 'Denny', 'Loughlin', '1948-11-14', 'Mental health disorders, Bipolar disorder', 'Female', '0426 Sloan Plaza', '2773397600', 'Walk-in', 'Regular exercise, Balanced diet', 'Levothyroxine', '2024-10-29 15:04:09'),
(732, 'Ibrahim', 'Blinder', '1957-11-14', 'Liver disease, Cirrhosis', 'Male', '62579 Hanover Plaza', '4335844430', 'Scheduled', 'No smoking, Regular exercise', 'NSAIDs', '2024-10-29 15:04:09'),
(733, 'Everett', 'Doerffer', '1956-11-14', 'Genetic disorders, Cystic fibrosis', 'Male', '4 Bobwhite Place', '5826587898', 'Walk-in', 'Low-fat diet, Regular eye checkups', 'Stimulants, Behavioral therapy', '2024-10-29 15:04:09'),
(734, 'Rubin', 'Moorcroft', '1942-11-14', 'Pancreatitis, Acute pancreatitis', 'Male', '446 Dakota Terrace', '3373219111', 'Walk-in', 'Uses air purifier, Avoids allergens', 'ACE inhibitors', '2024-10-29 15:04:09'),
(735, 'Frans', 'Curthoys', '1938-11-14', 'Thyroid disorder, Hypothyroidism', 'Male', '64016 Village Road', '2338427296', 'Scheduled', 'Low-acid diet, Avoids late meals', 'Levothyroxine', '2024-10-29 15:04:09'),
(737, 'Kaylyn', 'McGuiney', '1952-11-14', 'Hypertension, Diabetes', 'Female', '93 Stuart Park', '2353439523', 'Scheduled', 'Good dental hygiene, Avoids sugary foods', 'Stimulants, Behavioral therapy', '2024-10-29 15:04:09'),
(738, 'Colas', 'Bridgland', '1950-11-14', 'Autoimmune diseases, Rheumatoid arthritis', 'Female', '216 Ronald Regan Avenue', '2929879201', 'Scheduled', 'No smoking, Regular exercise', 'Proton pump inhibitors', '2024-10-29 15:04:09'),
(739, 'Carolina', 'Baylis', '1962-11-14', 'Gallbladder disease, Gallstones', 'Female', '9 Bartelt Point', '8602043013', 'Scheduled', 'Pain management exercises, Avoids heavy lifting', 'Proton pump inhibitors', '2024-10-29 15:04:09'),
(740, 'Diahann', 'Grasha', '1936-11-14', 'Nutritional deficiencies, Vitamin D deficiency', 'Female', '49222 Karstens Pass', '3394613121', 'Scheduled', 'Regular exercise, Balanced diet', 'Antihistamines, Nasal sprays', '2024-10-29 15:04:09'),
(741, 'Iolande', 'Gribbell', '1948-11-14', 'Postpartum conditions, Postpartum depression', 'Male', '62436 South Trail', '3519131631', 'Scheduled', 'Non-smoking, Uses inhaler as needed', 'Antispasmodics, Fiber supplements', '2024-10-29 15:04:09'),
(742, 'Mohandas', 'Loram', '1937-11-14', 'Pancreatitis, Acute pancreatitis', 'Female', '75 Westport Crossing', '7632136875', 'Walk-in', 'Regular exercise, Balanced diet', 'Antidepressants, Anxiolytics', '2024-10-29 15:04:09'),
(743, 'Jeannine', 'Jorczyk', '1937-11-14', 'Liver failure, Acute liver failure', 'Female', '6 Waubesa Plaza', '3537963047', 'Scheduled', 'High-fiber diet, Low-fat meals', 'Statins, Beta blockers', '2024-10-29 15:04:09'),
(744, 'Ilyse', 'Mulhall', '1940-11-14', 'Alzheimers disease, AD', 'Female', '30068 Eliot Circle', '1730386907', 'Scheduled', 'High-fiber diet, Low-fat meals', 'Pain relievers, Calcium supplements', '2024-10-29 15:04:09'),
(745, 'Dewitt', 'Buggy', '1955-11-14', 'Sleep apnea, Snoring', 'Male', '205 Ramsey Point', '1202635934', 'Scheduled', 'Uses air purifier, Avoids allergens', 'Statins, Beta blockers', '2024-10-29 15:04:09'),
(746, 'Michell', 'Louche', '1961-11-14', 'Liver disease, Cirrhosis', 'Female', '335 Lakewood Gardens Trail', '6317417260', 'Walk-in', 'Pain management exercises, Avoids heavy lifting', 'CPAP machine', '2024-10-29 15:04:09'),
(747, 'Whitman', 'Purnell', '1946-11-14', 'Dental issues, Cavities', 'Female', '2488 Elka Point', '9557162385', 'Walk-in', 'Safe practices, Regular exercise', 'NSAIDs', '2024-10-29 15:04:09'),
(748, 'Kiersten', 'Browncey', '1941-11-14', 'Stroke, Cerebrovascular accident', 'Female', '9502 Schurz Crossing', '2234821000', 'Scheduled', 'No smoking, Regular exercise', 'Antispasmodics, Fiber supplements', '2024-10-29 15:04:09'),
(749, 'Perren', 'Peploe', '1935-11-14', 'Substance abuse, Alcoholism', 'Male', '352 Rutledge Street', '6279398941', 'Scheduled', 'No smoking, Regular exercise', 'Antispasmodics, Fiber supplements', '2024-10-29 15:04:09'),
(750, 'Georgia', 'Newbury', '1946-11-14', 'Mental health stigma, Depression stigma', 'Female', '9 6th Crossing', '8082045664', 'Walk-in', 'Pain management exercises, Avoids heavy lifting', 'Antidepressants, Anxiolytics', '2024-10-29 15:04:09'),
(751, 'Naomi', 'Cockling', '1962-11-14', 'Skin conditions, Eczema', 'Female', '62697 High Crossing Street', '8687139171', 'Walk-in', 'Non-smoking, Uses inhaler as needed', 'Sleep aids, Pain relievers', '2024-10-29 15:04:09'),
(752, 'Hetty', 'Levane', '1949-11-14', 'ADHD, ADD', 'Female', '263 Carey Drive', '9430456029', 'Walk-in', 'Therapy sessions, Meditation', 'Proton pump inhibitors', '2024-10-29 15:04:09'),
(753, 'Christos', 'Baine', '1951-11-14', 'Chronic pain, Fibromyalgia', 'Male', '3692 Homewood Parkway', '1197543545', 'Scheduled', 'Therapy sessions, Meditation', 'Antispasmodics, Fiber supplements', '2024-10-29 15:04:09'),
(754, 'Cathyleen', 'Cowope', '1943-11-14', 'Sleep apnea, Snoring', 'Male', '9 Hermina Alley', '6843753399', 'Walk-in', 'Low-acid diet, Avoids late meals', 'Stimulants, Behavioral therapy', '2024-10-29 15:04:09'),
(755, 'Lisabeth', 'Swanne', '1960-11-14', 'ADHD, ADD', 'Male', '6644 Luster Center', '9093195059', 'Walk-in', 'Uses air purifier, Avoids allergens', 'Eye drops', '2024-10-29 15:04:09'),
(756, 'Carline', 'Drabble', '1945-11-14', 'Thyroid disorders, Hyperthyroidism', 'Male', '8 Goodland Place', '5958007065', 'Scheduled', 'Gentle exercises, Balanced diet', 'Steroid creams, Antihistamines', '2024-10-29 15:04:09'),
(757, 'Fey', 'Todman', '1940-11-14', 'Autoimmune diseases, Rheumatoid arthritis', 'Male', '694 Northland Place', '1751257373', 'Walk-in', 'Pain management exercises, Avoids heavy lifting', 'Liver-support medications', '2024-10-29 15:04:09'),
(758, 'Shellie', 'dArcy', '1961-11-14', 'Thyroid disorders, Hyperthyroidism', 'Female', '56 Talmadge Terrace', '8945566773', 'Walk-in', 'Uses air purifier, Avoids allergens', 'Levothyroxine', '2024-10-29 15:04:09'),
(759, 'Dinnie', 'Motten', '1959-11-14', 'Mental health stigma, Depression stigma', 'Female', '1469 Dapin Junction', '1726432807', 'Walk-in', 'Gentle exercises, Balanced diet', 'Statins, Beta blockers', '2024-10-29 15:04:09'),
(760, 'Cherice', 'Gribben', '1947-11-14', 'Chronic obstructive pulmonary disease, COPD', 'Female', '69113 Stuart Street', '3129849885', 'Scheduled', 'No smoking, Regular exercise', 'Sleep aids, Pain relievers', '2024-10-29 15:04:09'),
(761, 'Loutitia', 'Yurchishin', '1953-11-14', 'Hypertension, Diabetes', 'Female', '87754 Lunder Lane', '7272440058', 'Walk-in', 'No smoking, Regular exercise', 'Antihistamines, Nasal sprays', '2024-10-29 15:04:09'),
(762, 'Brady', 'Gemnett', '1959-11-14', 'Endocrine disorders, Diabetes insipidus', 'Male', '7950 Dexter Junction', '1590766258', 'Scheduled', 'Therapy sessions, Meditation', 'Statins, Beta blockers', '2024-10-29 15:04:09'),
(763, 'Bentley', 'Mohring', '1945-11-14', 'Pediatric conditions, Asthma in children', 'Female', '15294 Elmside Center', '3520575390', 'Scheduled', 'Therapy sessions, Meditation', 'Antihistamines, Nasal sprays', '2024-10-29 15:04:09'),
(765, 'Godart', 'Mattocks', '1962-11-14', 'Depression, Anxiety', 'Female', '2 Sherman Court', '1081452307', 'Scheduled', 'Avoids caffeine, Sleeps early', 'Stimulants, Behavioral therapy', '2024-10-29 15:04:09'),
(766, 'Nike', 'Loosmore', '1937-11-14', 'Genetic disorders, Cystic fibrosis', 'Male', '19 Gina Trail', '4925591269', 'Walk-in', 'Pain management exercises, Avoids heavy lifting', 'Levothyroxine', '2024-10-29 15:04:09'),
(767, 'Nye', 'Rubinowicz', '1954-11-14', 'Infectious diseases, Tuberculosis', 'Male', '5 Bluejay Avenue', '5566772516', 'Scheduled', 'Regular exercise, Low-sodium diet', 'NSAIDs', '2024-10-29 15:04:09'),
(768, 'Gwendolin', 'Holyard', '1963-11-14', 'Kidney disease, Chronic kidney disease (CKD)', 'Male', '4763 Mockingbird Circle', '6585242247', 'Scheduled', 'Moisturizes daily, Avoids allergens', 'Sleep aids, Pain relievers', '2024-10-29 15:04:09'),
(770, 'Rena', 'Tours', '1948-11-14', 'ADHD, ADD', 'Female', '947 Chive Crossing', '1305528622', 'Walk-in', 'Regular exercise, Balanced diet', 'Pain relievers, Calcium supplements', '2024-10-29 15:04:09'),
(771, 'Peadar', 'Farbrother', '1954-11-14', 'Kidney disease, Chronic kidney disease (CKD)', 'Female', '6 Northwestern Plaza', '6165364250', 'Scheduled', 'Pain management exercises, Avoids heavy lifting', 'Antihistamines, Nasal sprays', '2024-10-29 15:04:09'),
(772, 'Felipa', 'Elvish', '1961-11-14', 'Geriatric conditions, Dementia', 'Male', '5470 Cambridge Road', '5545008536', 'Walk-in', 'High-fiber diet, Low-fat meals', 'Antihypertensives, Insulin', '2024-10-29 15:04:09'),
(773, 'Kellby', 'Smithson', '1950-11-14', 'Genetic disorders, Cystic fibrosis', 'Female', '4 Schmedeman Terrace', '7411045192', 'Walk-in', 'High-fiber diet, Low-fat meals', 'Pain relievers, Calcium supplements', '2024-10-29 15:04:09'),
(774, 'Kathryne', 'Livezey', '1962-11-14', 'Multiple sclerosis, MS', 'Female', '0882 Anderson Alley', '9859560241', 'Walk-in', 'Low-acid diet, Avoids late meals', 'Inhalers as prescribed', '2024-10-29 15:04:09'),
(775, 'Jacinda', 'Stroband', '1963-11-14', 'Eye conditions, Glaucoma', 'Female', '24 Pleasure Park', '1583305088', 'Scheduled', 'Pain management exercises, Avoids heavy lifting', 'Statins, Beta blockers', '2024-10-29 15:04:09'),
(776, 'Thain', 'Bohl', '1937-11-14', 'Irritable bowel syndrome (IBS)', 'Male', '7236 Leroy Park', '2334983232', 'Scheduled', 'Regular exercise, Balanced diet', 'Statins, Beta blockers', '2024-10-29 15:04:09'),
(777, 'Ryley', 'Wakeling', '1950-11-14', 'Irritable bowel syndrome (IBS)', 'Male', '7559 Tennyson Alley', '5266645106', 'Scheduled', 'No smoking, Regular exercise', 'NSAIDs', '2024-10-29 15:04:09');

-- --------------------------------------------------------

--
-- Stand-in structure for view `seniorcitizen_view`
-- (See below for the actual view)
--
CREATE TABLE `seniorcitizen_view` (
`id` int(15)
,`first_name` varchar(50)
,`last_name` varchar(50)
,`date_of_birth` date
,`age` int(9)
,`health_condition` varchar(100)
,`gender` varchar(10)
,`address` varchar(100)
,`phone` varchar(15)
,`medication` varchar(455)
,`lifestyle` varchar(455)
,`checkups` varchar(355)
,`created_at` timestamp
,`created_date` varchar(10)
,`created_week` varchar(64)
,`created_month` varchar(64)
,`created_year` varchar(4)
,`created_week_number` int(3)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `seniorcitizen_with_age`
-- (See below for the actual view)
--
CREATE TABLE `seniorcitizen_with_age` (
`citizen_id` int(15)
,`first_name` varchar(50)
,`last_name` varchar(50)
,`date_of_birth` date
,`health_condition` varchar(100)
,`gender` varchar(10)
,`address` varchar(100)
,`phone` varchar(15)
,`checkups` varchar(355)
,`lifestyle` varchar(455)
,`medication` varchar(455)
,`created_at` timestamp
,`age` int(9)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `senior_citizen_disease_view`
-- (See below for the actual view)
--
CREATE TABLE `senior_citizen_disease_view` (
`citizen_id` int(15)
,`first_name` varchar(50)
,`last_name` varchar(50)
,`date_of_birth` date
,`health_condition` varchar(100)
,`gender` varchar(10)
,`address` varchar(100)
,`phone` varchar(15)
,`medication` varchar(455)
,`lifestyle` varchar(455)
,`checkups` varchar(355)
,`disease_name` varchar(255)
,`score` float
,`prediction_rank` int(11)
,`disease_prediction_date` timestamp
);

-- --------------------------------------------------------

--
-- Table structure for table `smsnotification`
--

CREATE TABLE `smsnotification` (
  `sms_id` int(11) NOT NULL,
  `recipient_phone` varchar(15) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `sent_by` enum('Admin','HealthWorker') DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `sent_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `smsnotification`
--

INSERT INTO `smsnotification` (`sms_id`, `recipient_phone`, `message`, `sent_by`, `sender_id`, `sent_at`) VALUES
(1, 'tryname', 'You have a chekup', 'Admin', 1, '2024-08-04 05:13:24'),
(12, '639270398546', 'Good day, seniors! Join us for a free Health Seminar on November 5 at 9 AM in the barangay hall. Learn tips on healthy living and preventive care. Don\'t miss it!', 'Admin', 46882260, '2024-10-28 07:50:53'),
(13, '639214358550', 'try send', 'Admin', 46882260, '2024-10-28 10:36:38'),
(14, '639201211972', 'try send', 'Admin', 46882260, '2024-10-28 10:36:38'),
(16, '09291501251', 'Today is your checkup', 'Admin', 46882260, '2024-11-08 05:57:56');

-- --------------------------------------------------------

--
-- Stand-in structure for view `summary_counts`
-- (See below for the actual view)
--
CREATE TABLE `summary_counts` (
`id` int(1)
,`profile_count` bigint(21)
,`activity_count` bigint(21)
,`healthworker_count` bigint(21)
,`smsnotification_count` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `svm_analytics`
-- (See below for the actual view)
--
CREATE TABLE `svm_analytics` (
`id` bigint(21)
,`disease_name` varchar(255)
,`average_score` double
,`prediction_count` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `top_checkups`
-- (See below for the actual view)
--
CREATE TABLE `top_checkups` (
`id` bigint(21)
,`checkups` varchar(355)
,`checkup_count` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `top_health_conditions`
-- (See below for the actual view)
--
CREATE TABLE `top_health_conditions` (
`id` bigint(21)
,`health_condition` varchar(100)
,`condition_count` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `top_predicted_diseases`
-- (See below for the actual view)
--
CREATE TABLE `top_predicted_diseases` (
`id` bigint(21)
,`disease_name` varchar(255)
,`disease_count` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `top_treatments`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`u555923667_seniorciticare`@`127.0.0.1` SQL SECURITY DEFINER VIEW `top_treatments`  AS SELECT row_number()  ( order by count(`u555923667_seniorcare`.`seniorcitizen`.`treatments`) desc) AS `over` FROM `seniorcitizen` GROUP BY `u555923667_seniorcare`.`seniorcitizen`.`treatments` ORDER BY count(`u555923667_seniorcare`.`seniorcitizen`.`treatments`) DESC LIMIT 0, 10 ;
-- Error reading data for table u555923667_seniorcare.top_treatments: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `u555923667_seniorcare`.`top_treatments`' at line 1

-- --------------------------------------------------------

--
-- Stand-in structure for view `user_activity_log`
-- (See below for the actual view)
--
CREATE TABLE `user_activity_log` (
`Logs` int(11)
,`username` varchar(50)
,`email` varchar(100)
,`user_type` varchar(255)
,`login_time` datetime
,`logout_time` datetime
);

-- --------------------------------------------------------

--
-- Table structure for table `user_logs`
--

CREATE TABLE `user_logs` (
  `Logs` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_type` varchar(255) NOT NULL,
  `login_time` datetime DEFAULT NULL,
  `logout_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_logs`
--

INSERT INTO `user_logs` (`Logs`, `user_id`, `user_type`, `login_time`, `logout_time`) VALUES
(341, 12564825, 'HealthWorker', '2024-10-28 14:56:36', '2024-10-28 15:54:20'),
(342, 46882260, 'Admin', '2024-10-28 15:44:27', '2024-10-28 19:33:53'),
(343, 34314288, 'HealthWorker', '2024-10-28 15:47:14', NULL),
(356, 98700359, 'HealthWorker', '2024-10-28 18:42:52', '2024-10-28 18:43:06'),
(361, 46882260, 'Admin', '2024-10-28 19:40:36', '2024-10-28 19:40:55'),
(362, 46882260, 'Admin', '2024-10-28 19:48:01', NULL),
(363, 34314288, 'HealthWorker', '2024-10-28 19:55:58', NULL),
(364, 46882260, 'Admin', '2024-10-28 20:00:34', '2024-10-28 21:09:54'),
(365, 46882260, 'Admin', '2024-10-28 21:12:23', '2024-10-28 22:13:52'),
(366, 46882260, 'Admin', '2024-10-29 17:06:34', NULL),
(367, 46882260, 'Admin', '2024-10-29 17:09:35', '2024-10-29 17:22:07'),
(368, 34314288, 'HealthWorker', '2024-10-29 17:22:17', NULL),
(369, 46882260, 'Admin', '2024-10-29 22:23:24', '2024-10-29 22:55:23'),
(370, 46882260, 'Admin', '2024-10-29 23:03:06', NULL),
(371, 46882260, 'Admin', '2024-10-29 23:09:40', '2024-10-29 23:09:59'),
(372, 46882260, 'Admin', '2024-10-30 11:09:55', NULL),
(373, 46882260, 'Admin', '2024-10-30 11:11:03', '2024-10-30 11:17:05'),
(374, 46882260, 'Admin', '2024-10-30 11:17:22', '2024-10-30 11:17:49'),
(375, 97557510, 'Admin', '2024-10-30 11:18:00', '2024-10-30 11:18:25'),
(376, 97557510, 'Admin', '2024-10-30 11:19:01', '2024-10-30 11:19:30'),
(377, 46882260, 'Admin', '2024-10-30 11:26:20', '2024-10-30 12:40:53'),
(378, 46882260, 'Admin', '2024-10-30 13:12:54', '2024-10-30 13:17:25'),
(379, 34314288, 'HealthWorker', '2024-10-30 13:17:35', NULL),
(380, 46882260, 'Admin', '2024-10-30 15:02:09', NULL),
(381, 46882260, 'Admin', '2024-10-30 16:40:07', NULL),
(382, 97557510, 'Admin', '2024-10-30 16:42:44', NULL),
(383, 46882260, 'Admin', '2024-10-30 19:13:15', NULL),
(384, 46882260, 'Admin', '2024-10-30 20:43:54', NULL),
(385, 46882260, 'Admin', '2024-10-30 22:57:20', NULL),
(386, 46882260, 'Admin', '2024-10-31 09:43:10', NULL),
(387, 46882260, 'Admin', '2024-10-31 13:31:09', NULL),
(388, 46882260, 'Admin', '2024-10-31 15:23:49', NULL),
(389, 46882260, 'Admin', '2024-10-31 16:58:12', NULL),
(390, 46882260, 'Admin', '2024-10-31 22:23:51', NULL),
(391, 46882260, 'Admin', '2024-10-31 22:47:06', NULL),
(392, 46882260, 'Admin', '2024-10-31 23:27:16', '2024-10-31 23:27:50'),
(393, 46882260, 'Admin', '2024-10-31 23:27:59', NULL),
(394, 46882260, 'Admin', '2024-10-31 23:28:33', NULL),
(395, 46882260, 'Admin', '2024-11-04 16:58:24', NULL),
(396, 46882260, 'Admin', '2024-11-05 20:33:47', NULL),
(397, 46882260, 'Admin', '2024-11-06 11:22:37', NULL),
(398, 46882260, 'Admin', '2024-11-06 20:38:32', NULL),
(399, 46882260, 'Admin', '2024-11-07 17:10:08', NULL),
(400, 46882260, 'Admin', '2024-11-08 13:18:47', NULL),
(401, 46882260, 'Admin', '2024-11-08 17:49:45', '2024-11-08 18:38:28'),
(402, 46882260, 'Admin', '2024-11-08 18:38:32', NULL),
(403, 46882260, 'Admin', '2024-11-12 22:59:23', NULL),
(404, 46882260, 'Admin', '2024-11-12 22:59:33', NULL),
(405, 46882260, 'Admin', '2024-11-13 16:16:24', NULL),
(406, 46882260, 'Admin', '2024-11-13 16:17:01', NULL),
(407, 46882260, 'Admin', '2024-11-13 16:29:01', NULL),
(408, 46882260, 'Admin', '2024-11-13 18:05:38', NULL),
(409, 46882260, 'Admin', '2024-11-14 15:04:00', '2024-11-14 16:07:30'),
(410, 46882260, 'Admin', '2024-11-15 01:06:02', '2024-11-15 01:45:41'),
(411, 46882260, 'Admin', '2024-11-15 09:19:05', '2024-11-15 09:29:57'),
(412, 34314288, 'HealthWorker', '2024-11-15 09:30:04', NULL),
(413, 46882260, 'Admin', '2024-11-15 14:24:50', NULL),
(414, 46882260, 'Admin', '2024-11-15 17:41:29', NULL),
(415, 46882260, 'Admin', '2024-11-15 21:11:59', NULL),
(416, 46882260, 'Admin', '2024-11-15 21:36:35', NULL),
(417, 46882260, 'Admin', '2024-11-15 21:36:35', NULL),
(418, 46882260, 'Admin', '2024-11-15 21:43:40', NULL),
(419, 46882260, 'Admin', '2024-11-15 21:59:01', NULL),
(420, 46882260, 'Admin', '2024-11-16 19:21:26', NULL),
(421, 46882260, 'Admin', '2024-11-20 09:15:11', NULL),
(422, 46882260, 'Admin', '2024-11-20 10:46:36', NULL),
(423, 46882260, 'Admin', '2024-11-20 12:23:51', '2024-11-20 12:23:57'),
(424, 46882260, 'Admin', '2024-11-20 12:30:31', '2024-11-20 12:30:42'),
(425, 46882260, 'Admin', '2024-11-20 12:45:17', '2024-11-20 12:46:32'),
(426, 46882260, 'Admin', '2024-11-20 13:41:40', '2024-11-20 13:41:44'),
(427, 46882260, 'Admin', '2024-11-20 13:41:48', '2024-11-20 13:42:02'),
(428, 46882260, 'Admin', '2024-11-20 13:42:15', '2024-11-20 13:42:18'),
(429, 46882260, 'Admin', '2024-11-20 15:42:49', '2024-11-20 15:43:04'),
(430, 46882260, 'Admin', '2024-11-21 09:14:22', '2024-11-21 09:16:56'),
(431, 46882260, 'Admin', '2024-11-21 09:17:57', '2024-11-21 09:18:20'),
(432, 46882260, 'Admin', '2024-11-21 09:18:26', '2024-11-21 09:18:38'),
(433, 46882260, 'Admin', '2024-11-21 23:19:42', '2024-11-21 23:22:52'),
(434, 46882260, 'Admin', '2024-11-21 23:23:33', '2024-11-21 23:26:05'),
(435, 46882260, 'Admin', '2024-11-21 23:29:23', NULL),
(436, 46882260, 'Admin', '2024-11-21 23:41:05', NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `weekly_sms_sent`
-- (See below for the actual view)
--
CREATE TABLE `weekly_sms_sent` (
`id` int(3)
,`week` int(3)
,`sms_sent_count` bigint(21)
);

-- --------------------------------------------------------

--
-- Structure for view `dataprofiling_view`
--
DROP TABLE IF EXISTS `dataprofiling_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u555923667_seniorciticare`@`127.0.0.1` SQL SECURITY DEFINER VIEW `dataprofiling_view`  AS SELECT `dataprofiling`.`id` AS `id`, `dataprofiling`.`address` AS `address`, `dataprofiling`.`gender` AS `gender`, `dataprofiling`.`age` AS `age`, `dataprofiling`.`lifestyle_diet` AS `lifestyle_diet`, `dataprofiling`.`lifestyle_exercise` AS `lifestyle_exercise`, `dataprofiling`.`lifestyle_others` AS `lifestyle_others`, `dataprofiling`.`medical_history_past_illness` AS `medical_history_past_illness`, `dataprofiling`.`medical_history_treatments` AS `medical_history_treatments`, `dataprofiling`.`medical_history_ongoing_medications` AS `medical_history_ongoing_medications`, `dataprofiling`.`medical_history_checkups` AS `medical_history_checkups`, `dataprofiling`.`created_at` AS `created_at`, date_format(`dataprofiling`.`created_at`,'%Y-%m-%d') AS `created_date`, date_format(`dataprofiling`.`created_at`,'%W') AS `created_week`, date_format(`dataprofiling`.`created_at`,'%M') AS `created_month`, date_format(`dataprofiling`.`created_at`,'%Y') AS `created_year`, week(`dataprofiling`.`created_at`,1) AS `created_week_number` FROM `dataprofiling` ;

-- --------------------------------------------------------

--
-- Structure for view `disease_count`
--
DROP TABLE IF EXISTS `disease_count`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u555923667_seniorciticare`@`127.0.0.1` SQL SECURITY DEFINER VIEW `disease_count`  AS SELECT row_number()  ( order by `subquery`.`count` desc) AS `over` FROM (select concat(case when `predicted_diseases`.`disease_name` in ('Heart failure','Stroke','Myocardial infarction','Arrhythmia','Atrial fibrillation','Peripheral artery disease','Deep vein thrombosis','Pulmonary embolism','Coronary artery disease','Aortic aneurysm','Thromboembolism','Ventricular tachycardia','Ventricular fibrillation') then 'High-Risk Diagnosis' when `predicted_diseases`.`disease_name` in ('Parkinson\'s disease','Dementia','Respiratory infections','Multiple sclerosis','Osteoarthritis','Amyotrophic lateral sclerosis','Spinal muscular atrophy','Rheumatoid arthritis','Ankylosing spondylitis','Scleroderma','Spondylitis','Spinal stenosis') then 'Decline in Physical Health' when `predicted_diseases`.`disease_name` in ('Diabetes mellitus','Hypertension','Alzheimer\'s disease','Type 2 Diabetes mellitus','Asthma','Coronary artery disease','Bone fractures','Hyperlipidemia','Chronic kidney disease','Chronic obstructive pulmonary disease','Chronic bronchitis','Osteoporosis') then 'Need for Medical Checkups' when `predicted_diseases`.`disease_name` in ('Chronic obstructive pulmonary disease','Chronic bronchitis','Heart disease','Prostate cancer','Cancer','Breast cancer','Pulmonary fibrosis','Emphysema','Cystic fibrosis','Bronchiectasis') then 'Chronic Disease Progression' when `predicted_diseases`.`disease_name` in ('Pneumonia','Depression','Obesity','Anxiety','Anxiety disorders','Bipolar disorder','Schizophrenia','Substance use disorder','Tuberculosis') then 'Risk of Hospitalization' else 'Risk of Hospitalization' end,': ',`predicted_diseases`.`disease_name`) AS `category_disease`,count(0) AS `count` from `predicted_diseases` group by `predicted_diseases`.`disease_name`) AS `subquery` ORDER BY `subquery`.`count` DESC LIMIT 0, 10 ;

-- --------------------------------------------------------

--
-- Structure for view `predictiveanalytics_view`
--
DROP TABLE IF EXISTS `predictiveanalytics_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u555923667_seniorciticare`@`127.0.0.1` SQL SECURITY DEFINER VIEW `predictiveanalytics_view`  AS SELECT `predictiveanalytics`.`analytics_id` AS `analytics_id`, `predictiveanalytics`.`description` AS `description`, `predictiveanalytics`.`results` AS `results`, `predictiveanalytics`.`created_by` AS `created_by`, `predictiveanalytics`.`creator_id` AS `creator_id`, `predictiveanalytics`.`created_at` AS `created_at`, date_format(`predictiveanalytics`.`created_at`,'%Y-%m-%d') AS `created_date`, date_format(`predictiveanalytics`.`created_at`,'%W') AS `created_week`, date_format(`predictiveanalytics`.`created_at`,'%M') AS `created_month`, date_format(`predictiveanalytics`.`created_at`,'%Y') AS `created_year`, week(`predictiveanalytics`.`created_at`,1) AS `created_week_number` FROM `predictiveanalytics` ;

-- --------------------------------------------------------

--
-- Structure for view `seniorcitizen_view`
--
DROP TABLE IF EXISTS `seniorcitizen_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u555923667_seniorciticare`@`127.0.0.1` SQL SECURITY DEFINER VIEW `seniorcitizen_view`  AS SELECT `seniorcitizen`.`citizen_id` AS `id`, `seniorcitizen`.`first_name` AS `first_name`, `seniorcitizen`.`last_name` AS `last_name`, `seniorcitizen`.`date_of_birth` AS `date_of_birth`, floor((to_days(curdate()) - to_days(`seniorcitizen`.`date_of_birth`)) / 365) AS `age`, `seniorcitizen`.`health_condition` AS `health_condition`, `seniorcitizen`.`gender` AS `gender`, `seniorcitizen`.`address` AS `address`, `seniorcitizen`.`phone` AS `phone`, `seniorcitizen`.`medication` AS `medication`, `seniorcitizen`.`lifestyle` AS `lifestyle`, `seniorcitizen`.`checkups` AS `checkups`, `seniorcitizen`.`created_at` AS `created_at`, date_format(`seniorcitizen`.`created_at`,'%Y-%m-%d') AS `created_date`, date_format(`seniorcitizen`.`created_at`,'%W') AS `created_week`, date_format(`seniorcitizen`.`created_at`,'%M') AS `created_month`, date_format(`seniorcitizen`.`created_at`,'%Y') AS `created_year`, week(`seniorcitizen`.`created_at`,1) AS `created_week_number` FROM `seniorcitizen` ;

-- --------------------------------------------------------

--
-- Structure for view `seniorcitizen_with_age`
--
DROP TABLE IF EXISTS `seniorcitizen_with_age`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u555923667_seniorciticare`@`127.0.0.1` SQL SECURITY DEFINER VIEW `seniorcitizen_with_age`  AS SELECT `seniorcitizen`.`citizen_id` AS `citizen_id`, `seniorcitizen`.`first_name` AS `first_name`, `seniorcitizen`.`last_name` AS `last_name`, `seniorcitizen`.`date_of_birth` AS `date_of_birth`, `seniorcitizen`.`health_condition` AS `health_condition`, `seniorcitizen`.`gender` AS `gender`, `seniorcitizen`.`address` AS `address`, `seniorcitizen`.`phone` AS `phone`, `seniorcitizen`.`checkups` AS `checkups`, `seniorcitizen`.`lifestyle` AS `lifestyle`, `seniorcitizen`.`medication` AS `medication`, `seniorcitizen`.`created_at` AS `created_at`, floor((to_days(curdate()) - to_days(`seniorcitizen`.`date_of_birth`)) / 365) AS `age` FROM `seniorcitizen` ;

-- --------------------------------------------------------

--
-- Structure for view `senior_citizen_disease_view`
--
DROP TABLE IF EXISTS `senior_citizen_disease_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u555923667_seniorciticare`@`127.0.0.1` SQL SECURITY DEFINER VIEW `senior_citizen_disease_view`  AS SELECT `sc`.`citizen_id` AS `citizen_id`, `sc`.`first_name` AS `first_name`, `sc`.`last_name` AS `last_name`, `sc`.`date_of_birth` AS `date_of_birth`, `sc`.`health_condition` AS `health_condition`, `sc`.`gender` AS `gender`, `sc`.`address` AS `address`, `sc`.`phone` AS `phone`, `sc`.`medication` AS `medication`, `sc`.`lifestyle` AS `lifestyle`, `sc`.`checkups` AS `checkups`, `pd`.`disease_name` AS `disease_name`, `pd`.`score` AS `score`, `pd`.`prediction_rank` AS `prediction_rank`, `pd`.`created_at` AS `disease_prediction_date` FROM (`seniorcitizen` `sc` left join `predicted_diseases` `pd` on(`sc`.`citizen_id` = `pd`.`citizen_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `summary_counts`
--
DROP TABLE IF EXISTS `summary_counts`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u555923667_seniorciticare`@`127.0.0.1` SQL SECURITY DEFINER VIEW `summary_counts`  AS SELECT 1 AS `id`, (select count(0) from `seniorcitizen`) AS `profile_count`, (select count(0) from `admin`) AS `activity_count`, (select count(0) from `healthworker`) AS `healthworker_count`, (select count(0) from `smsnotification`) AS `smsnotification_count` ;

-- --------------------------------------------------------

--
-- Structure for view `svm_analytics`
--
DROP TABLE IF EXISTS `svm_analytics`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u555923667_seniorciticare`@`127.0.0.1` SQL SECURITY DEFINER VIEW `svm_analytics`  AS SELECT row_number()  ( order by count(0) desc) AS `over` FROM `predicted_diseases` GROUP BY `predicted_diseases`.`disease_name` ORDER BY count(0) DESC ;

-- --------------------------------------------------------

--
-- Structure for view `top_checkups`
--
DROP TABLE IF EXISTS `top_checkups`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u555923667_seniorciticare`@`127.0.0.1` SQL SECURITY DEFINER VIEW `top_checkups`  AS SELECT row_number()  ( order by count(`seniorcitizen`.`checkups`) desc) AS `over` FROM `seniorcitizen` GROUP BY `seniorcitizen`.`checkups` ORDER BY count(`seniorcitizen`.`checkups`) DESC LIMIT 0, 3 ;

-- --------------------------------------------------------

--
-- Structure for view `top_health_conditions`
--
DROP TABLE IF EXISTS `top_health_conditions`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u555923667_seniorciticare`@`127.0.0.1` SQL SECURITY DEFINER VIEW `top_health_conditions`  AS SELECT row_number()  ( order by count(`seniorcitizen`.`health_condition`) desc) AS `over` FROM `seniorcitizen` GROUP BY `seniorcitizen`.`health_condition` ORDER BY count(`seniorcitizen`.`health_condition`) DESC LIMIT 0, 5 ;

-- --------------------------------------------------------

--
-- Structure for view `top_predicted_diseases`
--
DROP TABLE IF EXISTS `top_predicted_diseases`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u555923667_seniorciticare`@`127.0.0.1` SQL SECURITY DEFINER VIEW `top_predicted_diseases`  AS SELECT row_number()  ( order by count(`predicted_diseases`.`disease_name`) desc) AS `over` FROM `predicted_diseases` GROUP BY `predicted_diseases`.`disease_name` ORDER BY count(`predicted_diseases`.`disease_name`) DESC LIMIT 0, 5 ;

-- --------------------------------------------------------

--
-- Structure for view `user_activity_log`
--
DROP TABLE IF EXISTS `user_activity_log`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u555923667_seniorciticare`@`127.0.0.1` SQL SECURITY DEFINER VIEW `user_activity_log`  AS SELECT `ul`.`Logs` AS `Logs`, CASE WHEN `ul`.`user_type` = 'Admin' THEN `a`.`username` WHEN `ul`.`user_type` = 'HealthWorker' THEN `hw`.`username` ELSE 'Unknown' END AS `username`, CASE WHEN `ul`.`user_type` = 'Admin' THEN `a`.`email` WHEN `ul`.`user_type` = 'HealthWorker' THEN `hw`.`email` ELSE 'Unknown' END AS `email`, `ul`.`user_type` AS `user_type`, `ul`.`login_time` AS `login_time`, `ul`.`logout_time` AS `logout_time` FROM ((`user_logs` `ul` left join `admin` `a` on(`ul`.`user_id` = `a`.`admin_id` and `ul`.`user_type` = 'Admin')) left join `healthworker` `hw` on(`ul`.`user_id` = `hw`.`worker_id` and `ul`.`user_type` = 'HealthWorker')) ;

-- --------------------------------------------------------

--
-- Structure for view `weekly_sms_sent`
--
DROP TABLE IF EXISTS `weekly_sms_sent`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u555923667_seniorciticare`@`127.0.0.1` SQL SECURITY DEFINER VIEW `weekly_sms_sent`  AS SELECT `weekly_counts`.`week_num` AS `id`, `weekly_counts`.`week_num` AS `week`, coalesce(`weekly_counts`.`sms_sent_count`,0) AS `sms_sent_count` FROM (select `weeks`.`week_num` AS `week_num`,count(`s`.`sms_id`) AS `sms_sent_count` from ((select week('2024-01-01' + interval `weeks_generated`.`week_seq` week,3) AS `week_num` from (select 0 AS `week_seq` union all select 1 AS `1` union all select 2 AS `2` union all select 3 AS `3` union all select 4 AS `4` union all select 5 AS `5` union all select 6 AS `6` union all select 7 AS `7` union all select 8 AS `8` union all select 9 AS `9` union all select 10 AS `10` union all select 11 AS `11` union all select 12 AS `12` union all select 13 AS `13` union all select 14 AS `14` union all select 15 AS `15` union all select 16 AS `16` union all select 17 AS `17` union all select 18 AS `18` union all select 19 AS `19` union all select 20 AS `20` union all select 21 AS `21` union all select 22 AS `22` union all select 23 AS `23` union all select 24 AS `24` union all select 25 AS `25` union all select 26 AS `26` union all select 27 AS `27` union all select 28 AS `28` union all select 29 AS `29` union all select 30 AS `30` union all select 31 AS `31` union all select 32 AS `32` union all select 33 AS `33` union all select 34 AS `34` union all select 35 AS `35` union all select 36 AS `36` union all select 37 AS `37` union all select 38 AS `38` union all select 39 AS `39` union all select 40 AS `40` union all select 41 AS `41` union all select 42 AS `42` union all select 43 AS `43` union all select 44 AS `44` union all select 45 AS `45` union all select 46 AS `46` union all select 47 AS `47` union all select 48 AS `48` union all select 49 AS `49` union all select 50 AS `50` union all select 51 AS `51`) `weeks_generated` where '2024-01-01' + interval `weeks_generated`.`week_seq` week <= curdate() group by week('2024-01-01' + interval `weeks_generated`.`week_seq` week,3)) `weeks` left join `smsnotification` `s` on(week(`s`.`sent_at`,1) = `weeks`.`week_num` and `s`.`sent_at` <= curdate())) group by `weeks`.`week_num` order by `weeks`.`week_num`) AS `weekly_counts` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`activity_id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`announcement_id`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointment_id`);

--
-- Indexes for table `dataprofiling`
--
ALTER TABLE `dataprofiling`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `healthworker`
--
ALTER TABLE `healthworker`
  ADD PRIMARY KEY (`worker_id`);

--
-- Indexes for table `health_report`
--
ALTER TABLE `health_report`
  ADD PRIMARY KEY (`report_id`);

--
-- Indexes for table `predicted_diseases`
--
ALTER TABLE `predicted_diseases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `predictiveanalytics`
--
ALTER TABLE `predictiveanalytics`
  ADD PRIMARY KEY (`analytics_id`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`profile_id`);

--
-- Indexes for table `seniorcitizen`
--
ALTER TABLE `seniorcitizen`
  ADD PRIMARY KEY (`citizen_id`);

--
-- Indexes for table `smsnotification`
--
ALTER TABLE `smsnotification`
  ADD PRIMARY KEY (`sms_id`);

--
-- Indexes for table `user_logs`
--
ALTER TABLE `user_logs`
  ADD PRIMARY KEY (`Logs`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97557511;

--
-- AUTO_INCREMENT for table `announcement`
--
ALTER TABLE `announcement`
  MODIFY `announcement_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `dataprofiling`
--
ALTER TABLE `dataprofiling`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `healthworker`
--
ALTER TABLE `healthworker`
  MODIFY `worker_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98700362;

--
-- AUTO_INCREMENT for table `health_report`
--
ALTER TABLE `health_report`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `predicted_diseases`
--
ALTER TABLE `predicted_diseases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24773;

--
-- AUTO_INCREMENT for table `predictiveanalytics`
--
ALTER TABLE `predictiveanalytics`
  MODIFY `analytics_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `seniorcitizen`
--
ALTER TABLE `seniorcitizen`
  MODIFY `citizen_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91491743;

--
-- AUTO_INCREMENT for table `smsnotification`
--
ALTER TABLE `smsnotification`
  MODIFY `sms_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user_logs`
--
ALTER TABLE `user_logs`
  MODIFY `Logs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=437;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
