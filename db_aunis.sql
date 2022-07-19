-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2022 at 02:10 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_aunis`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add kontrak', 7, 'add_kontrak'),
(26, 'Can change kontrak', 7, 'change_kontrak'),
(27, 'Can delete kontrak', 7, 'delete_kontrak'),
(28, 'Can view kontrak', 7, 'view_kontrak'),
(29, 'Can add perusahaan', 8, 'add_perusahaan'),
(30, 'Can change perusahaan', 8, 'change_perusahaan'),
(31, 'Can delete perusahaan', 8, 'delete_perusahaan'),
(32, 'Can view perusahaan', 8, 'view_perusahaan'),
(33, 'Can add isi_kontrak', 9, 'add_isi_kontrak'),
(34, 'Can change isi_kontrak', 9, 'change_isi_kontrak'),
(35, 'Can delete isi_kontrak', 9, 'delete_isi_kontrak'),
(36, 'Can view isi_kontrak', 9, 'view_isi_kontrak'),
(37, 'Can add kwitansi', 10, 'add_kwitansi'),
(38, 'Can change kwitansi', 10, 'change_kwitansi'),
(39, 'Can delete kwitansi', 10, 'delete_kwitansi'),
(40, 'Can view kwitansi', 10, 'view_kwitansi'),
(41, 'Can add satuan_barang', 11, 'add_satuan_barang'),
(42, 'Can change satuan_barang', 11, 'change_satuan_barang'),
(43, 'Can delete satuan_barang', 11, 'delete_satuan_barang'),
(44, 'Can view satuan_barang', 11, 'view_satuan_barang'),
(45, 'Can add surat j', 12, 'add_suratj'),
(46, 'Can change surat j', 12, 'change_suratj'),
(47, 'Can delete surat j', 12, 'delete_suratj'),
(48, 'Can view surat j', 12, 'view_suratj'),
(49, 'Can add s jalan', 13, 'add_sjalan'),
(50, 'Can change s jalan', 13, 'change_sjalan'),
(51, 'Can delete s jalan', 13, 'delete_sjalan'),
(52, 'Can view s jalan', 13, 'view_sjalan'),
(53, 'Can add isi_s jalan', 14, 'add_isi_sjalan'),
(54, 'Can change isi_s jalan', 14, 'change_isi_sjalan'),
(55, 'Can delete isi_s jalan', 14, 'delete_isi_sjalan'),
(56, 'Can view isi_s jalan', 14, 'view_isi_sjalan'),
(57, 'Can add isi_kwitansi', 15, 'add_isi_kwitansi'),
(58, 'Can change isi_kwitansi', 15, 'change_isi_kwitansi'),
(59, 'Can delete isi_kwitansi', 15, 'delete_isi_kwitansi'),
(60, 'Can view isi_kwitansi', 15, 'view_isi_kwitansi');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$216000$cRYQJc96qKn4$5EBce+v9EuXK3VrSln6Lo5daRYiJ/O+Ha9soN6GOM2c=', '2022-06-16 15:44:41.344632', 1, 'aunis', '', '', 'aunis@gmail.com', 1, 1, '2022-06-16 15:41:53.221997'),
(2, 'pbkdf2_sha256$216000$GiCMlwAZuD4l$iDFHRMtXvVDqbBgX4D8ErEPy6IwX5ND22rtqKVqacKU=', '2022-07-12 12:00:31.443723', 1, 'admin', '', '', 'admin@mail.com', 1, 1, '2022-06-25 06:04:59.592447');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-06-25 06:27:08.100511', '1', 'BOX', 1, '[{\"added\": {}}]', 11, 2),
(2, '2022-06-25 06:27:13.712071', '2', 'PCS', 1, '[{\"added\": {}}]', 11, 2),
(3, '2022-06-25 06:28:10.157765', '3', 'LBR', 1, '[{\"added\": {}}]', 11, 2),
(4, '2022-06-25 06:28:27.414844', '4', 'BUKU', 1, '[{\"added\": {}}]', 11, 2);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(9, 'website', 'isi_kontrak'),
(15, 'website', 'isi_kwitansi'),
(14, 'website', 'isi_sjalan'),
(7, 'website', 'kontrak'),
(10, 'website', 'kwitansi'),
(8, 'website', 'perusahaan'),
(11, 'website', 'satuan_barang'),
(13, 'website', 'sjalan'),
(12, 'website', 'suratj');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-06-16 15:41:06.103095'),
(2, 'auth', '0001_initial', '2022-06-16 15:41:06.240550'),
(3, 'admin', '0001_initial', '2022-06-16 15:41:06.545559'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-06-16 15:41:06.658932'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-06-16 15:41:06.666959'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-06-16 15:41:06.717125'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-06-16 15:41:06.764282'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-06-16 15:41:06.779331'),
(9, 'auth', '0004_alter_user_username_opts', '2022-06-16 15:41:06.789364'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-06-16 15:41:06.838527'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-06-16 15:41:06.841537'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-06-16 15:41:06.848561'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-06-16 15:41:06.864616'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-06-16 15:41:06.878659'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-06-16 15:41:06.895716'),
(16, 'auth', '0011_update_proxy_permissions', '2022-06-16 15:41:06.905750'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-06-16 15:41:06.921802'),
(18, 'sessions', '0001_initial', '2022-06-16 15:41:06.942872'),
(19, 'website', '0001_initial', '2022-06-16 15:41:07.032168'),
(20, 'website', '0002_auto_20220606_2046', '2022-06-16 15:41:07.363262');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('fb3mil9fu2arze2ovt0esyfxgp289vnc', '.eJxVjMsOwiAQRf-FtSEMZQZw6b7fQIaHUjU0Ke3K-O_apAvd3nPOfYnA21rD1ssSpizOQovT7xY5PUrbQb5zu80yzW1dpih3RR60y3HO5Xk53L-Dyr1-a5_ZXZPXUdlk0SIgF4LoAJNnxUDGUTREYKJGMIRqsICDpWQyUzHi_QHKZjax:1o5oUB:Q8ln2nzNmY4kIARxhuguInTab8CLQ23_lzMVv-qnsh0', '2022-07-11 13:09:03.450300'),
('igz4pw8axlthlc1wnjanzlm87kf1f8sj', '.eJxVjEEOwiAQRe_C2hCgUygu3fcMZGAGqRqalHZlvLtt0oVu33v_v0XAbS1ha7yEicRVaHH5ZRHTk-sh6IH1Pss013WZojwSedomx5n4dTvbv4OCrexrTJmdN7G3GQ0ydACMxoLPCrXnpLQi0tr2w44ypxQHmw3lDkiBc058vgDKOGU:1o1rfl:-fOV6FTTqZBn6cdck2ipjcVW1n6XEL6TJJcYUmmXQ8k', '2022-06-30 15:44:41.356671'),
('ji56doazvy758e8yehv8w0ht84cafdww', '.eJxVjMsOwiAQRf-FtSEMZQZw6b7fQIaHUjU0Ke3K-O_apAvd3nPOfYnA21rD1ssSpizOQovT7xY5PUrbQb5zu80yzW1dpih3RR60y3HO5Xk53L-Dyr1-a5_ZXZPXUdlk0SIgF4LoAJNnxUDGUTREYKJGMIRqsICDpWQyUzHi_QHKZjax:1o4yvB:h9bDoOWRWT8aLCnL5Y_Kjd5Q2VeUh8v3qsBQ2TrLiFU', '2022-07-09 06:05:29.305723'),
('me8ukkw2r6h3z95prfku3964tgxziwye', '.eJxVjMsOwiAQRf-FtSEMZQZw6b7fQIaHUjU0Ke3K-O_apAvd3nPOfYnA21rD1ssSpizOQovT7xY5PUrbQb5zu80yzW1dpih3RR60y3HO5Xk53L-Dyr1-a5_ZXZPXUdlk0SIgF4LoAJNnxUDGUTREYKJGMIRqsICDpWQyUzHi_QHKZjax:1o4yxu:hS-hYz3TmH47z4MStsvsIVv-_2O0w5Ksk6LfJcLUGKY', '2022-07-09 06:08:18.209371'),
('tah9xynm60xk7r7utn6w66ofnerhkmrg', '.eJxVjMsOwiAQRf-FtSEMZQZw6b7fQIaHUjU0Ke3K-O_apAvd3nPOfYnA21rD1ssSpizOQovT7xY5PUrbQb5zu80yzW1dpih3RR60y3HO5Xk53L-Dyr1-a5_ZXZPXUdlk0SIgF4LoAJNnxUDGUTREYKJGMIRqsICDpWQyUzHi_QHKZjax:1o4yzU:IBxQ6zVAOya9dosMcqHC1FcDd3MXaQb1FjQ5bn5tQCs', '2022-07-09 06:09:56.199473'),
('tpzmocivhl3onvmea6tjorxq72hdbe8f', '.eJxVjMsOwiAQRf-FtSEMZQZw6b7fQIaHUjU0Ke3K-O_apAvd3nPOfYnA21rD1ssSpizOQovT7xY5PUrbQb5zu80yzW1dpih3RR60y3HO5Xk53L-Dyr1-a5_ZXZPXUdlk0SIgF4LoAJNnxUDGUTREYKJGMIRqsICDpWQyUzHi_QHKZjax:1oBEZ5:Ls4B6E0iincgRofcYuTOZFIccpkXWenn-ffbpfX0VLY', '2022-07-26 12:00:31.458773');

-- --------------------------------------------------------

--
-- Table structure for table `website_isi_kontrak`
--

CREATE TABLE `website_isi_kontrak` (
  `id` int(11) NOT NULL,
  `no_kontrak` varchar(50) NOT NULL,
  `Code_Purchase` varchar(50) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `spesifikasi` varchar(255) NOT NULL,
  `satuan` varchar(50) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `supplier` varchar(50) NOT NULL,
  `tgl_order` date NOT NULL,
  `waktu` varchar(50) NOT NULL,
  `tgl_penyerahan` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  `id_kontrak_id` int(11) NOT NULL,
  `id_perusahaan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `website_isi_kontrak`
--

INSERT INTO `website_isi_kontrak` (`id`, `no_kontrak`, `Code_Purchase`, `nama_barang`, `spesifikasi`, `satuan`, `jumlah`, `harga`, `total`, `supplier`, `tgl_order`, `waktu`, `tgl_penyerahan`, `status`, `id_kontrak_id`, `id_perusahaan_id`) VALUES
(38, 'BSI-SW-22003', '220614017', 'Materai 印花税票', 'Denominasi/面额： RP 10,00', 'Lembar 张', 500, 10000, 5000000, 'AUNIS PRINT OFFSET', '2022-06-16', '3', '2022-07-12', 1, 21, 1),
(39, 'ITSS-M-211271-28', '220624110', '1.Buku Record Pertukaran Shift Kerja 交接班记录本', 'Spesifikasi: Kertas A4;Kategori pencetakan: pencetakan dua sisi;Mengikat lembar: 50 lembar;Metode penjilidan: Penjilidan kiri dengan hekter, diperlukan Sampul( tidak mudah sobek) 规格:A4;纸张方向:纵向;印刷类别:双面印刷;装订页数:100;装订 方向:左侧', 'Buku/本', 100, 10920, 1092000, 'TOKO AUNIS PRINT OFFSET', '2022-07-02', '15', '2022-07-17', 1, 22, 1),
(40, 'ITSS-M-211271-28', '220624111', '2.Catatan Inspeksi Alat di Produksi 1 一车间主设备设备点巡检记录 表', 'Spesifikasi: Kertas A4;Kategori pencetakan: pencetakan dua sisi;Mengikat lembar: 50 lembar;Metode penjilidan: Penjilidan kiri dengan hekter, diperlukan Sampul( tidak mudah sobek) 规格:A4;纸张方向:纵向;印刷类别:双面印刷;装订页数:100;装订 方向:左侧', 'Buku/本', 30, 10920, 327600, 'TOKO AUNIS PRINT OFFSET', '2022-07-02', '15', '2022-07-17', 1, 22, 1),
(41, 'ITSS-M-211271-28', '220624112', '3.Catatan Inspeksi Alat di Produksi 2 二车间主设备设备点巡检记录 表', 'Spesifikasi: Kertas A4;Kategori pencetakan: pencetakan dua sisi;Mengikat lembar: 50 lembar;Metode penjilidan: Penjilidan kiri dengan hekter, diperlukan Sampul( tidak mudah sobek) 规格:A4;纸张方向:纵向;印刷类别:双面印刷;装订页数:100;装订 方向:左侧', 'Buku/本', 30, 10920, 327600, 'TOKO AUNIS PRINT OFFSET', '2022-07-02', '15', '2022-07-17', 1, 22, 1),
(42, 'ITSS-M-211271-28', '220624113', '4.Catatan Inspeksi Alat Bantu di Produksi 1 一车间辅助设备设备点巡检记 录表', 'Spesifikasi: Kertas A4;Kategori pencetakan: pencetakan dua sisi;Mengikat lembar: 50 lembar;Metode penjilidan: Penjilidan kiri dengan hekter, diperlukan Sampul( tidak mudah sobek) 规格:A4;纸张方向:纵向;印刷类别:双面印刷;装订页数:100;装订 方向:左侧', 'Buku/本', 30, 10920, 327600, 'TOKO AUNIS PRINT OFFSET', '2022-07-02', '15', '2022-07-17', 0, 22, 1),
(43, 'ITSS-M-211271-28', '220624114', '5.Catatan Inspeksi Alat Bantu di Produksi 2 二车间辅助设备设备点巡检记 录表', 'Spesifikasi: Kertas A4;Kategori pencetakan: pencetakan dua sisi;Mengikat lembar: 50 lembar;Metode penjilidan: Penjilidan kiri dengan hekter, diperlukan Sampul( tidak mudah sobek) 规格:A4;纸张方向:纵向;印刷类别:双面印刷;装订页数:100;装订 方向:左侧', 'Buku/本', 30, 10920, 327600, 'TOKO AUNIS PRINT OFFSET', '2022-07-02', '15', '2022-07-17', 0, 22, 1),
(44, 'ITSS-M-211271-29', '220624115', '6.Tabel Inspeksi Alat Blower di Produksi 1 一车间风机设备点巡检表', 'Spesifikasi: Kertas A4;Kategori pencetakan: pencetakan dua sisi;Mengikat lembar: 50 lembar;Metode penjilidan: Penjilidan kiri dengan hekter, diperlukan Sampul( tidak mudah sobek) 规格:A4;纸张方向:纵向;印刷类别:双面印刷;装订页数:100;装订 方向:左侧', 'Buku/本', 30, 10920, 327600, 'TOKO AUNIS PRINT OFFSET', '2022-07-02', '15', '2022-07-17', 0, 22, 1),
(45, 'ITSS-M-211271-29', '220624116', '7.Tabel Inspeksi Alat Blower di Produksi 2 二车间风机设备点巡检表', 'Spesifikasi: Kertas A4;Kategori pencetakan: pencetakan dua sisi;Mengikat lembar: 50 lembar;Metode penjilidan: Penjilidan kiri dengan hekter, diperlukan Sampul( tidak mudah sobek) 规格:A4;纸张方向:纵向;印刷类别:双面印刷;装订页数:100;装订 方向:左侧', 'Buku/本', 30, 10920, 327600, 'TOKO AUNIS PRINT OFFSET', '2022-07-02', '15', '2022-07-17', 0, 22, 1),
(46, 'ITSS-M-211271-29', '220624117', '8.Catatan Inspeksi Dinamo di Produksi 1 一车间电机检查记录表', 'Spesifikasi: Kertas A4;Kategori pencetakan: pencetakan dua sisi;Mengikat lembar: 50 lembar;Metode penjilidan: Penjilidan kiri dengan hekter, diperlukan Sampul( tidak mudah sobek) 规格:A4;纸张方向:纵向;印刷类别:双面印刷;装订页数:100;装订 方向:左侧', 'Buku/本', 30, 10920, 327600, 'TOKO AUNIS PRINT OFFSET', '2022-07-02', '15', '2022-07-17', 0, 22, 1),
(47, 'ITSS-M-211271-29', '220624118', '9.Catatan Inspeksi Dinamo di Produksi 2 二车间电机检查记录表', 'Spesifikasi: Kertas A4;Kategori pencetakan: pencetakan dua sisi;Mengikat lembar: 50 lembar;Metode penjilidan: Penjilidan kiri dengan hekter, diperlukan Sampul( tidak mudah sobek) 规格:A4;纸张方向:纵向;印刷类别:双面印刷;装订页数:100;装订 方向:左侧', 'Buku/本', 30, 10920, 327600, 'TOKO AUNIS PRINT OFFSET', '2022-07-02', '15', '2022-07-17', 0, 22, 1);

-- --------------------------------------------------------

--
-- Table structure for table `website_isi_kwitansi`
--

CREATE TABLE `website_isi_kwitansi` (
  `id` int(11) NOT NULL,
  `id_isikontrak` varchar(50) NOT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `id_kwitansi_id` int(11) NOT NULL,
  `satuan_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `website_isi_kwitansi`
--

INSERT INTO `website_isi_kwitansi` (`id`, `id_isikontrak`, `jumlah`, `harga`, `id_kwitansi_id`, `satuan_id`) VALUES
(2, 'barang1', 15, 13, 4, 4),
(3, 'BUKU ALBUM', 10, 10000, 5, 2),
(4, 'PULPEN', 1, 30000, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `website_isi_sjalan`
--

CREATE TABLE `website_isi_sjalan` (
  `id` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `nomor_dos` int(11) NOT NULL,
  `id_SJalan_id` int(11) NOT NULL,
  `id_isikontrak_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `website_kontrak`
--

CREATE TABLE `website_kontrak` (
  `id` int(11) NOT NULL,
  `file_pdf` varchar(100) DEFAULT NULL,
  `kode` varchar(50) NOT NULL,
  `date_upload` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `website_kontrak`
--

INSERT INTO `website_kontrak` (`id`, `file_pdf`, `kode`, `date_upload`) VALUES
(21, 'BSI-SW-22003', '91a68735-aba1-4eb9-b4ee-02e9e0e0a2f6', '2022-07-12'),
(22, 'uploads/PO_AUNIS_2022_JULY_02.pdf', '26a32609-48e4-433d-aa63-ea9855266d0e', '2022-07-12');

-- --------------------------------------------------------

--
-- Table structure for table `website_kwitansi`
--

CREATE TABLE `website_kwitansi` (
  `id` int(11) NOT NULL,
  `no_kwitansi` varchar(50) NOT NULL,
  `penerima` varchar(50) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `website_kwitansi`
--

INSERT INTO `website_kwitansi` (`id`, `no_kwitansi`, `penerima`, `tanggal`) VALUES
(4, 'AUNIS/K/2022/1', 'PT. MATAKAR KENDARI', '2022-06-17'),
(5, 'AUNIS/K/2022/2', 'KEJAKSAAN NEGERI KENDARI', '2022-06-16');

-- --------------------------------------------------------

--
-- Table structure for table `website_perusahaan`
--

CREATE TABLE `website_perusahaan` (
  `id` int(11) NOT NULL,
  `kode_perusahaan` varchar(50) NOT NULL,
  `nama_perusahaan` varchar(50) NOT NULL,
  `alamat` longtext,
  `npwp` varchar(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `website_perusahaan`
--

INSERT INTO `website_perusahaan` (`id`, `kode_perusahaan`, `nama_perusahaan`, `alamat`, `npwp`) VALUES
(1, 'ITSS', 'PT.INDONESIA TSINGSHAN STAINLESS STEEL', 'GEDUNG IMIP, JL. BATU MULIA 8 RT. 007 RW. 007 MERUYA UTARA, KEMBANGAN KOTA ADM. JAKARTA BARAT DKI JAKARTA 11620', '71.706.475.2-014.000'),
(2, 'IRNC', 'PT.INDONESIA RUIPU NICKEL AND CHROME ALLOY', 'GEDUNG IMIP, JALAN BATU MULIA 8 RT. 007 RW. 007 MERUYA UTARA KEMBANGAN KOTA ADM. JAKARTA BARAT DKI JAKARTA 11620IRNC', '74.613.637.3-012.000'),
(3, 'PT. GCNS', 'PT.INDONESIA GUANG CHING NICKEL AND STAINLESS STEE', 'GEDUNG IMIP JL. BATU MULIA NO. 8 RT. 007 RW. 007 MERUYA UTARA, KEMBANGAN KOTA ADM. JAKARTA BARAT DKI JAKARTA 11620', '70.725.476.9-014.000'),
(4, 'PT. CSI', 'PT.CAHAYA SMELTER INDONESIA', 'GEDUNG IMIP, JL. BATU MULIA 8, RT. 007 RW. 007, MERUYA UTARA, KEMBANGAN, KOTA ADM. JAKARTA BARAT, DKI JAKARTA, 11620', '85.936.483.8-014.000'),
(5, 'PT. HNI', 'PT.HENGJAYA NICKEL INDUSTRY', 'GEDUNG IMIP, JL. BATU MULIA 8, RT. 007 RW. 007, MERUYA UTARA, KEMBANGAN, KOTA ADM. JAKARTA BARAT, DKI JAKARTA, 11620', '83.831.548.9-014.000'),
(6, 'PT. IMIP', 'PT.INDONESIA MOROWALI INDUSTRIAL PARK', 'GEDUNG IMIP JL BATU MULIA NO. 8 RT. 007 RW. 007 MERUYA UTARA KEMBANGAN KOTA ADM. JAKARTA BARAT DKI JAKARTA 11620', '03.310.985.1-014.000'),
(7, 'PT. RNI', 'PT.RANGER NICKEL INDUSTRY', 'GEDUNG IMIP, JL. BATU MULIA NO. 8, RT. 007 RW. 007, MERUYA UTARA, KEMBANGAN, KOTA ADM. JAKARTA BARAT, DKI JAKARTA, 11620', '85.460.461.8-067.000'),
(8, 'PT. SMI', 'PT.SULAWESI MINING INVESTMENT', 'GEDUNG IMIP JALAN BATU MULIA NO.8 RT. 007 RW. 007 MERUYA UTARA KEMBANGAN KOTA ADM. JAKARTA BARAT DKI JAKARTA 11620', '02.983.141.9-046.000'),
(9, 'PT. TSI', 'PT.TSINGSHAN STEEL INDONESIA', 'GEDUNG IMIP, JL BATU MULIA 8 MERUYA UTARA KEMBANGAN KOTA ADM. JAKARTA BARAT DKI JAKARTA 11620', '80.774.920.5-014.000'),
(10, 'PT. MPM', 'PT.MOROWALI POWER MANDIRI', 'GEDUNG IMIP, JL BATU MULIA 8 MERUYA UTARA KEMBANGAN KOTA ADM. JAKARTA BARAT DKI JAKARTA 11620', '86.867.359.1-014.000');

-- --------------------------------------------------------

--
-- Table structure for table `website_satuan_barang`
--

CREATE TABLE `website_satuan_barang` (
  `id` int(11) NOT NULL,
  `nama_satuan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `website_satuan_barang`
--

INSERT INTO `website_satuan_barang` (`id`, `nama_satuan`) VALUES
(1, 'BOX'),
(2, 'PCS'),
(3, 'LBR'),
(4, 'BUKU');

-- --------------------------------------------------------

--
-- Table structure for table `website_sjalan`
--

CREATE TABLE `website_sjalan` (
  `id` int(11) NOT NULL,
  `no_surat` varchar(50) NOT NULL,
  `no_hp` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `id_kontrak_id` int(11) NOT NULL,
  `pemesan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `website_suratj`
--

CREATE TABLE `website_suratj` (
  `id` int(11) NOT NULL,
  `no_surat` varchar(50) NOT NULL,
  `no_hp` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` int(11) NOT NULL,
  `nomor_dos` int(11) NOT NULL,
  `id_isikontrak_id` int(11) NOT NULL,
  `id_kontrak_id` int(11) NOT NULL,
  `pemesan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `website_isi_kontrak`
--
ALTER TABLE `website_isi_kontrak`
  ADD PRIMARY KEY (`id`),
  ADD KEY `website_isi_kontrak_id_kontrak_id_1a34bc3a_fk_website_kontrak_id` (`id_kontrak_id`),
  ADD KEY `website_isi_kontrak_id_perusahaan_id_f73bc5ab_fk_website_p` (`id_perusahaan_id`);

--
-- Indexes for table `website_isi_kwitansi`
--
ALTER TABLE `website_isi_kwitansi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `website_isi_kwitansi_id_kwitansi_id_e983a300_fk_website_k` (`id_kwitansi_id`),
  ADD KEY `website_isi_kwitansi_satuan_id_f0651096_fk_website_s` (`satuan_id`);

--
-- Indexes for table `website_isi_sjalan`
--
ALTER TABLE `website_isi_sjalan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `website_isi_sjalan_id_SJalan_id_2883b328_fk_website_sjalan_id` (`id_SJalan_id`),
  ADD KEY `website_isi_sjalan_id_isikontrak_id_04787468_fk_website_i` (`id_isikontrak_id`);

--
-- Indexes for table `website_kontrak`
--
ALTER TABLE `website_kontrak`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `website_kwitansi`
--
ALTER TABLE `website_kwitansi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `no_kwitansi` (`no_kwitansi`);

--
-- Indexes for table `website_perusahaan`
--
ALTER TABLE `website_perusahaan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_perusahaan` (`kode_perusahaan`);

--
-- Indexes for table `website_satuan_barang`
--
ALTER TABLE `website_satuan_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `website_sjalan`
--
ALTER TABLE `website_sjalan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `no_surat` (`no_surat`),
  ADD KEY `website_sjalan_id_kontrak_id_f53ceb46_fk_website_kontrak_id` (`id_kontrak_id`),
  ADD KEY `website_sjalan_pemesan_id_151b8a3e_fk_website_perusahaan_id` (`pemesan_id`);

--
-- Indexes for table `website_suratj`
--
ALTER TABLE `website_suratj`
  ADD PRIMARY KEY (`id`),
  ADD KEY `website_suratj_id_isikontrak_id_d565a255_fk_website_i` (`id_isikontrak_id`),
  ADD KEY `website_suratj_id_kontrak_id_de8a58c9_fk_website_kontrak_id` (`id_kontrak_id`),
  ADD KEY `website_suratj_pemesan_id_33a442d7_fk_website_perusahaan_id` (`pemesan_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `website_isi_kontrak`
--
ALTER TABLE `website_isi_kontrak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `website_isi_kwitansi`
--
ALTER TABLE `website_isi_kwitansi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `website_isi_sjalan`
--
ALTER TABLE `website_isi_sjalan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `website_kontrak`
--
ALTER TABLE `website_kontrak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `website_kwitansi`
--
ALTER TABLE `website_kwitansi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `website_perusahaan`
--
ALTER TABLE `website_perusahaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `website_satuan_barang`
--
ALTER TABLE `website_satuan_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `website_sjalan`
--
ALTER TABLE `website_sjalan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `website_suratj`
--
ALTER TABLE `website_suratj`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `website_isi_kontrak`
--
ALTER TABLE `website_isi_kontrak`
  ADD CONSTRAINT `website_isi_kontrak_id_kontrak_id_1a34bc3a_fk_website_kontrak_id` FOREIGN KEY (`id_kontrak_id`) REFERENCES `website_kontrak` (`id`),
  ADD CONSTRAINT `website_isi_kontrak_id_perusahaan_id_f73bc5ab_fk_website_p` FOREIGN KEY (`id_perusahaan_id`) REFERENCES `website_perusahaan` (`id`);

--
-- Constraints for table `website_isi_kwitansi`
--
ALTER TABLE `website_isi_kwitansi`
  ADD CONSTRAINT `website_isi_kwitansi_id_kwitansi_id_e983a300_fk_website_k` FOREIGN KEY (`id_kwitansi_id`) REFERENCES `website_kwitansi` (`id`),
  ADD CONSTRAINT `website_isi_kwitansi_satuan_id_f0651096_fk_website_s` FOREIGN KEY (`satuan_id`) REFERENCES `website_satuan_barang` (`id`);

--
-- Constraints for table `website_isi_sjalan`
--
ALTER TABLE `website_isi_sjalan`
  ADD CONSTRAINT `website_isi_sjalan_id_SJalan_id_2883b328_fk_website_sjalan_id` FOREIGN KEY (`id_SJalan_id`) REFERENCES `website_sjalan` (`id`),
  ADD CONSTRAINT `website_isi_sjalan_id_isikontrak_id_04787468_fk_website_i` FOREIGN KEY (`id_isikontrak_id`) REFERENCES `website_isi_kontrak` (`id`);

--
-- Constraints for table `website_sjalan`
--
ALTER TABLE `website_sjalan`
  ADD CONSTRAINT `website_sjalan_id_kontrak_id_f53ceb46_fk_website_kontrak_id` FOREIGN KEY (`id_kontrak_id`) REFERENCES `website_kontrak` (`id`),
  ADD CONSTRAINT `website_sjalan_pemesan_id_151b8a3e_fk_website_perusahaan_id` FOREIGN KEY (`pemesan_id`) REFERENCES `website_perusahaan` (`id`);

--
-- Constraints for table `website_suratj`
--
ALTER TABLE `website_suratj`
  ADD CONSTRAINT `website_suratj_id_isikontrak_id_d565a255_fk_website_i` FOREIGN KEY (`id_isikontrak_id`) REFERENCES `website_isi_kontrak` (`id`),
  ADD CONSTRAINT `website_suratj_id_kontrak_id_de8a58c9_fk_website_kontrak_id` FOREIGN KEY (`id_kontrak_id`) REFERENCES `website_kontrak` (`id`),
  ADD CONSTRAINT `website_suratj_pemesan_id_33a442d7_fk_website_perusahaan_id` FOREIGN KEY (`pemesan_id`) REFERENCES `website_perusahaan` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
