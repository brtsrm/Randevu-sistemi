/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : randevu

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 26/01/2021 21:23:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for appointments
-- ----------------------------
DROP TABLE IF EXISTS `appointments`;
CREATE TABLE `appointments`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fullName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `workingHour` int(11) NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notification_type` int(11) NOT NULL DEFAULT 0 COMMENT '0 Sms - 1 Email',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `isStatu` tinyint(1) NULL DEFAULT 0 COMMENT '0 Yeni, 1 Onaylı, 2 İptal',
  `isSend` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of appointments
-- ----------------------------
INSERT INTO `appointments` VALUES (18, 'cem', '541-420-03-14', 'doqtor9101@gmail.com', '2021-01-08', 30, 'asdsad', 1, '2021-01-08 09:43:12', '2021-01-08 09:49:03', 1, 0);
INSERT INTO `appointments` VALUES (19, 'bebe', '121-212-12-12', 'dsad@gmail.com', '2021-01-22', 30, 'dsad', 1, '2021-01-08 10:01:01', '2021-01-08 10:01:01', 0, 0);
INSERT INTO `appointments` VALUES (20, 'berat sarmış', '514-141-41-41', 'doqtor9101@gmail.com', '2021-01-10', 32, 'dsadsa', 1, '2021-01-10 14:34:01', '2021-01-10 14:34:01', 0, 0);

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (11, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (12, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (13, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (14, '2021_01_02_101831_create_working_hours_table', 1);
INSERT INTO `migrations` VALUES (15, '2021_01_02_101931_create_appointments_table', 1);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'berat', 'doqtor9101@gmail.com', NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for working_hours
-- ----------------------------
DROP TABLE IF EXISTS `working_hours`;
CREATE TABLE `working_hours`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `day` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `hours` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '10 - 11 Saat Belirleme',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `isActive` int(11) NOT NULL DEFAULT 0 COMMENT '1 - aktif 0 - pasif',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of working_hours
-- ----------------------------
INSERT INTO `working_hours` VALUES (25, 'Monday', '10.00 - 11.00', '2021-01-08 09:37:53', '2021-01-08 09:37:53', 0);
INSERT INTO `working_hours` VALUES (26, 'Monday', '11.00 - 12.00', '2021-01-08 09:37:53', '2021-01-08 09:37:53', 0);
INSERT INTO `working_hours` VALUES (27, 'Tuesday', '11.00 - 12.00', '2021-01-08 09:37:53', '2021-01-08 09:37:53', 0);
INSERT INTO `working_hours` VALUES (28, 'Wednesday', '11.00 - 12.00', '2021-01-08 09:37:53', '2021-01-08 09:37:53', 0);
INSERT INTO `working_hours` VALUES (29, 'Thursday', '11.00 - 12.00', '2021-01-08 09:37:53', '2021-01-08 09:37:53', 0);
INSERT INTO `working_hours` VALUES (30, 'Friday', '11.00 - 12.00', '2021-01-08 09:37:53', '2021-01-08 09:37:53', 0);
INSERT INTO `working_hours` VALUES (31, 'Saturday', '11.00 - 12.00', '2021-01-08 09:37:53', '2021-01-08 09:37:53', 0);
INSERT INTO `working_hours` VALUES (32, 'Sunday', '11.00 - 12.00', '2021-01-08 09:37:53', '2021-01-08 09:37:53', 0);

SET FOREIGN_KEY_CHECKS = 1;
