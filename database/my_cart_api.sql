-- Adminer 4.7.6 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `avatars`;
CREATE TABLE `avatars` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `avatars` (`id`, `avatar`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1,	'Samsung',	'2022-06-23 13:15:07',	'2022-06-23 13:15:07',	NULL),
(2,	'LG',	'2022-06-24 10:56:26',	'2022-06-24 10:56:26',	NULL);

DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `qty` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_user_id_foreign` (`user_id`),
  KEY `carts_product_id_foreign` (`product_id`),
  CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `carts` (`id`, `session_id`, `user_id`, `product_id`, `qty`, `created_at`, `updated_at`) VALUES
(24,	NULL,	1,	4,	5,	'2022-06-24 09:51:15',	'2022-06-24 11:26:53');

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `categories` (`id`, `category`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1,	'Washing Machine',	'2022-06-23 13:14:56',	'2022-06-23 13:14:56',	NULL),
(2,	'TV',	'2022-06-24 10:55:09',	'2022-06-24 10:55:09',	NULL);

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1,	'2014_10_12_000000_create_users_table',	1),
(2,	'2014_10_12_100000_create_password_resets_table',	1),
(3,	'2019_08_19_000000_create_failed_jobs_table',	1),
(4,	'2019_12_14_000001_create_personal_access_tokens_table',	1),
(5,	'2022_06_23_135346_create_categories_table',	1),
(6,	'2022_06_23_135356_create_avatars_table',	1),
(7,	'2022_06_23_135916_create_products_table',	1),
(10,	'2022_06_23_140054_create_carts_table',	2),
(11,	'2022_06_24_161103_alter_add_admin_coulmn_into_users_table',	3);

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1,	'App\\Models\\User',	1,	'auth_token',	'b6671bc05a869d2b9765492590e4c952a7f10ec477124a9d3d7e224336a5159e',	'[\"*\"]',	'2022-06-24 11:03:37',	'2022-06-23 13:14:05',	'2022-06-24 11:03:37'),
(2,	'App\\Models\\User',	1,	'auth_token',	'a64fbf781f7998fec9e965cb71f576cb744a5d80d4887e7137de9a939cece212',	'[\"*\"]',	NULL,	'2022-06-23 13:34:35',	'2022-06-23 13:34:35'),
(3,	'App\\Models\\User',	1,	'auth_token',	'e31f216fef6b0a5fb1ac2141b2479296fd3881d294bb8afe32afd02aa46d6495',	'[\"*\"]',	'2022-06-24 07:22:36',	'2022-06-23 13:36:26',	'2022-06-24 07:22:36'),
(4,	'App\\Models\\User',	1,	'auth_token',	'd01bb11042161557589d86580fbe46e4e38fbf0b7798deb56f67c7f2e33f68b7',	'[\"*\"]',	NULL,	'2022-06-24 06:21:37',	'2022-06-24 06:21:37'),
(5,	'App\\Models\\User',	1,	'auth_token',	'65ee86360d07c3fb3de4e5ea9ca7b8138de0a5899c65fca486870ebb7e5af43e',	'[\"*\"]',	NULL,	'2022-06-24 06:21:44',	'2022-06-24 06:21:44'),
(6,	'App\\Models\\User',	1,	'auth_token',	'd5d4a49b059738bc0678aac382255efcc47835ff7084baf0d58ce90f3c2aca8a',	'[\"*\"]',	NULL,	'2022-06-24 06:21:45',	'2022-06-24 06:21:45'),
(7,	'App\\Models\\User',	1,	'auth_token',	'b9bd32a9e0cbf01fc13edf07df6af93a9b521adc0e4a3c518eab5a0eab2305de',	'[\"*\"]',	NULL,	'2022-06-24 06:21:46',	'2022-06-24 06:21:46'),
(8,	'App\\Models\\User',	1,	'auth_token',	'ab7810459f50b02c2126ceb7bfed6e24a49af802b03dbf66ef9356d0880b8aa5',	'[\"*\"]',	NULL,	'2022-06-24 06:21:46',	'2022-06-24 06:21:46'),
(9,	'App\\Models\\User',	1,	'auth_token',	'90d622cd0287b78cdbfffc26060f8a452174a6a16236c82d30c6096a67642171',	'[\"*\"]',	NULL,	'2022-06-24 06:21:47',	'2022-06-24 06:21:47'),
(10,	'App\\Models\\User',	1,	'auth_token',	'5239fc12a465ba0391683e234bf90c4b7c41b8391df4d511d023a0136b49075c',	'[\"*\"]',	NULL,	'2022-06-24 06:21:48',	'2022-06-24 06:21:48'),
(11,	'App\\Models\\User',	1,	'auth_token',	'746399be0d6a5db2275f3c7cb4f396cf3f549974a919d0168a0b54ae22545c47',	'[\"*\"]',	NULL,	'2022-06-24 06:21:49',	'2022-06-24 06:21:49'),
(12,	'App\\Models\\User',	1,	'auth_token',	'dedf1b477ae4aa0b7f29fcf0f1c3db243e4ce3b32937ac0a1390dd2c9193e948',	'[\"*\"]',	NULL,	'2022-06-24 06:21:50',	'2022-06-24 06:21:50'),
(13,	'App\\Models\\User',	1,	'auth_token',	'3390c450c42be0d2a607d96f0acf10644361b075feea09e8f560e94d68c5ffa7',	'[\"*\"]',	NULL,	'2022-06-24 06:21:50',	'2022-06-24 06:21:50'),
(14,	'App\\Models\\User',	1,	'auth_token',	'ebc7fbe3c93146810877b4914319f9bd65e07703c68090061924013e49f31281',	'[\"*\"]',	NULL,	'2022-06-24 06:21:51',	'2022-06-24 06:21:51'),
(15,	'App\\Models\\User',	1,	'auth_token',	'b8b3492ff584fed697f83f285b5ee67a6a33a2b590a77000c85cf48f0ad98d92',	'[\"*\"]',	NULL,	'2022-06-24 06:21:51',	'2022-06-24 06:21:51'),
(16,	'App\\Models\\User',	1,	'auth_token',	'93b7a2bbd27b466c840c69bc86abe3fbfcd1222a0b0d4ed6eae7527ac432f3ec',	'[\"*\"]',	NULL,	'2022-06-24 06:21:51',	'2022-06-24 06:21:51'),
(17,	'App\\Models\\User',	1,	'auth_token',	'75a1d05241e763cd45d301870404345861c3c4d9ec9fd519ad5d504f786914aa',	'[\"*\"]',	NULL,	'2022-06-24 06:21:52',	'2022-06-24 06:21:52'),
(18,	'App\\Models\\User',	1,	'auth_token',	'12a2aa4b1fb30ecd65de786eaff9e4145596ee2d39844f9c57957c4ed7665d4a',	'[\"*\"]',	NULL,	'2022-06-24 06:21:52',	'2022-06-24 06:21:52'),
(19,	'App\\Models\\User',	1,	'auth_token',	'bf8b03f984e193231c39adf13770479716a375f071b0b341c89fa93552ef68d4',	'[\"*\"]',	NULL,	'2022-06-24 06:21:52',	'2022-06-24 06:21:52'),
(20,	'App\\Models\\User',	1,	'auth_token',	'262ead3ac37f35e0d1eabf453cb02658173fa355c4b68eec16eab7bcfc96678c',	'[\"*\"]',	NULL,	'2022-06-24 06:21:52',	'2022-06-24 06:21:52'),
(21,	'App\\Models\\User',	1,	'auth_token',	'0121e4496363591c7dbd8b650c2d293f96ceae1fac4b75d59aee6cbff9cfbb20',	'[\"*\"]',	NULL,	'2022-06-24 06:21:53',	'2022-06-24 06:21:53'),
(22,	'App\\Models\\User',	1,	'auth_token',	'1c8247f0a9a2a66138ba69de664fa62d1ac286d3ee49f481d4bbc5ee35d5912a',	'[\"*\"]',	NULL,	'2022-06-24 06:21:53',	'2022-06-24 06:21:53'),
(23,	'App\\Models\\User',	1,	'auth_token',	'21183a656a09271dbf523a53915768b6387f1b6e9a1912ab95bead0096c1f872',	'[\"*\"]',	NULL,	'2022-06-24 06:21:54',	'2022-06-24 06:21:54'),
(24,	'App\\Models\\User',	1,	'auth_token',	'4d2355f8012c7093ff451ace52a50582a346d9011f339f4d346a8a7d969f0ed3',	'[\"*\"]',	NULL,	'2022-06-24 06:21:54',	'2022-06-24 06:21:54'),
(25,	'App\\Models\\User',	1,	'auth_token',	'07d376cb0eab9b3559f8bcf0f432d25ec93b94bcec065f80ef72e5623961499a',	'[\"*\"]',	NULL,	'2022-06-24 06:21:54',	'2022-06-24 06:21:54'),
(26,	'App\\Models\\User',	1,	'auth_token',	'14a00044de33553c0da1e3c0ad0fd97b7d76accee82c296d7890e12066b2b3fa',	'[\"*\"]',	NULL,	'2022-06-24 06:21:56',	'2022-06-24 06:21:56'),
(27,	'App\\Models\\User',	1,	'auth_token',	'f93ba6084fd190f4e52d19355ee01b645ee29b77af199183cef7905c8294cf01',	'[\"*\"]',	NULL,	'2022-06-24 06:21:56',	'2022-06-24 06:21:56'),
(28,	'App\\Models\\User',	1,	'auth_token',	'd30f1bd76994d3ebaa281e3bd13be296fd35e84044fa9133ca3486daecac2c4b',	'[\"*\"]',	NULL,	'2022-06-24 06:21:56',	'2022-06-24 06:21:56'),
(29,	'App\\Models\\User',	1,	'auth_token',	'f63a22a63020225b92081e5913c829e71a6158d1bff568b4741acf2c691ffeb7',	'[\"*\"]',	NULL,	'2022-06-24 06:21:57',	'2022-06-24 06:21:57'),
(30,	'App\\Models\\User',	1,	'auth_token',	'c3078f60b3ec8819c25b53550893085f4110b9885ffbf98d0825c94756febc50',	'[\"*\"]',	NULL,	'2022-06-24 06:21:57',	'2022-06-24 06:21:57'),
(31,	'App\\Models\\User',	1,	'auth_token',	'a55d1a4dcd029c691aba473f1c01922bc98cd21eb1067002b9f33d22dae27972',	'[\"*\"]',	NULL,	'2022-06-24 06:21:58',	'2022-06-24 06:21:58'),
(32,	'App\\Models\\User',	1,	'auth_token',	'5f417d64e17088de6d429793afc9b572ee1b5592bb2c7df3eaff1445d895d290',	'[\"*\"]',	NULL,	'2022-06-24 06:21:59',	'2022-06-24 06:21:59'),
(33,	'App\\Models\\User',	1,	'auth_token',	'e2fcb4bf21cdb1d034a97e513fe4f4885dc65d40d6ec7fc905b569214b34e94c',	'[\"*\"]',	NULL,	'2022-06-24 06:22:34',	'2022-06-24 06:22:34'),
(34,	'App\\Models\\User',	1,	'auth_token',	'b73f1c3723a307d5f61d9b77da1b47e6b774bb2752a2995a8771aafbcae82309',	'[\"*\"]',	NULL,	'2022-06-24 06:22:36',	'2022-06-24 06:22:36'),
(35,	'App\\Models\\User',	1,	'auth_token',	'f9b4dc6da4ac98d8373e337f58b39ff34870f7c212398432e2901af9e2896f1a',	'[\"*\"]',	NULL,	'2022-06-24 06:34:25',	'2022-06-24 06:34:25'),
(36,	'App\\Models\\User',	1,	'auth_token',	'c1375a8346c1a9cbabfbc7ce497e99919cd49cb24fbd8cf4a8748c84fb766d29',	'[\"*\"]',	NULL,	'2022-06-24 06:35:38',	'2022-06-24 06:35:38'),
(37,	'App\\Models\\User',	1,	'auth_token',	'0e71b30f3ca2570dab8837b24611c6586cbf7482c7e1df7811d275e14d97cfff',	'[\"*\"]',	'2022-06-24 08:20:56',	'2022-06-24 06:45:17',	'2022-06-24 08:20:56'),
(38,	'App\\Models\\User',	1,	'auth_token',	'7f07be6dbf17e662b2431c7a6f5c52f5d8429f44b3a9a41f9bca5144c61ba848',	'[\"*\"]',	'2022-06-24 11:26:52',	'2022-06-24 09:28:24',	'2022-06-24 11:26:52'),
(39,	'App\\Models\\User',	1,	'auth_token',	'4a651f1e2c129be2b188244b02e4d58fdfdfe63692c4dcff1174642a1e43b52d',	'[\"*\"]',	NULL,	'2022-06-24 10:28:04',	'2022-06-24 10:28:04'),
(40,	'App\\Models\\User',	1,	'auth_token',	'cfaa92fb3a9e8c0671bdfb5728a5479e135aa61c6d95f867aabdf86523511572',	'[\"*\"]',	NULL,	'2022-06-24 10:28:30',	'2022-06-24 10:28:30'),
(41,	'App\\Models\\User',	2,	'auth_token',	'1a49bec965db8d6a41b0331d44ae5761f639fc255c0aeb68575d3fbaff000a6e',	'[\"*\"]',	NULL,	'2022-06-24 10:30:14',	'2022-06-24 10:30:14'),
(42,	'App\\Models\\User',	2,	'auth_token',	'067dbb8fe53fe05669490920883114a8ab59bac7f0b04154c9b72a7267298b60',	'[\"*\"]',	NULL,	'2022-06-24 10:31:05',	'2022-06-24 10:31:05'),
(43,	'App\\Models\\User',	3,	'auth_token',	'214ebaa47dfa235f79ff339c401ac3105ee4af82dfc26b0ddd64d4861b7f1dd3',	'[\"*\"]',	NULL,	'2022-06-24 10:44:24',	'2022-06-24 10:44:24'),
(44,	'App\\Models\\User',	4,	'auth_token',	'a9df4a8ca8945c948c11856e28235300898c2e0a501a041793195ba87c8fb0cc',	'[\"*\"]',	NULL,	'2022-06-24 10:46:21',	'2022-06-24 10:46:21'),
(45,	'App\\Models\\User',	5,	'auth_token',	'cdae8dfac0b4448d18326f581222bbc9bea2693b9af3a5c7d6481534ef1fff7a',	'[\"*\"]',	NULL,	'2022-06-24 10:47:20',	'2022-06-24 10:47:20'),
(46,	'App\\Models\\User',	6,	'auth_token',	'b1d77e99e80887a0f91762dbb8bfb55d254777f5b909635a4282831078094d84',	'[\"*\"]',	NULL,	'2022-06-24 10:47:58',	'2022-06-24 10:47:58'),
(47,	'App\\Models\\User',	7,	'auth_token',	'7386c4cb4443e91aef32cb2961687cc9202b02222de0ecb705ef8448545d58cc',	'[\"*\"]',	NULL,	'2022-06-24 10:48:11',	'2022-06-24 10:48:11'),
(48,	'App\\Models\\User',	8,	'auth_token',	'd4e4d2149f75861df6f57e100e381101791f19481fbae61e2c32033ca045dc45',	'[\"*\"]',	NULL,	'2022-06-24 10:50:34',	'2022-06-24 10:50:34'),
(49,	'App\\Models\\User',	9,	'auth_token',	'fcd940d01331db3543a2c4ebc7c174a6175a15fa18e552196ab968d4e2dafbca',	'[\"*\"]',	NULL,	'2022-06-24 10:51:03',	'2022-06-24 10:51:03'),
(50,	'App\\Models\\User',	9,	'auth_token',	'7b03342761cc1f296c6db7be58e0397bffcbc22bebdeb3fcd50d2db0872d8d1b',	'[\"*\"]',	'2022-06-24 11:03:50',	'2022-06-24 10:53:37',	'2022-06-24 11:03:50');

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `avatar_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_category_id_foreign` (`category_id`),
  KEY `products_avatar_id_foreign` (`avatar_id`),
  CONSTRAINT `products_avatar_id_foreign` FOREIGN KEY (`avatar_id`) REFERENCES `avatars` (`id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `products` (`id`, `avatar_id`, `category_id`, `name`, `price`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2,	1,	1,	'AXA Washing Machine',	45000.00,	'Nice',	'2022-06-23 13:15:17',	'2022-06-23 13:16:00',	'2022-06-23 13:16:00'),
(3,	1,	1,	'AXA Washing Machine',	45000.00,	'Nice',	'2022-06-23 13:16:26',	'2022-06-23 13:16:26',	NULL),
(4,	1,	1,	'AXA Washing Machine 2',	80000.00,	'Awesome',	'2022-06-24 07:21:34',	'2022-06-24 07:21:34',	NULL);

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `admin`, `remember_token`, `created_at`, `updated_at`) VALUES
(1,	'test',	'admin1@admin.com',	NULL,	'$2y$10$V7TrrAfVWtBNF20gzEoq6eLjQmf9X65Xp2PGihPZJG6EV4b8ASjdG',	NULL,	NULL,	'2022-06-23 13:14:05',	'2022-06-23 13:14:05'),
(2,	'Prajnha K',	'prajnha@test.com',	NULL,	'$2y$10$.o32DNhL7FVAE7ezpjTewOInqlsTKMwo4fg11bzT/x/t21SWbS542',	NULL,	NULL,	'2022-06-24 10:30:14',	'2022-06-24 10:30:14'),
(9,	'Admin',	'admin@test.com',	NULL,	'$2y$10$3EktbM8PCpJLU74kSwAxKu2xhDcxRcGkGzzv8/mldG1O6w/Z1MOQa',	'1',	NULL,	'2022-06-24 10:51:03',	'2022-06-24 10:51:03');

-- 2022-06-24 17:15:42
