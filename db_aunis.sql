-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2022 at 11:49 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
(1, 'pbkdf2_sha256$216000$ayiVwexyICb6$JLYtF3zDt1p9T5DHPuowueGYF7ybVXLXlHV5hAqS2Kc=', '2022-06-06 13:47:04.659393', 1, 'admin', '', '', 'admin@mail.com', 1, 1, '2022-06-06 13:46:36.631541');

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
(1, '2022-06-06 13:49:22.450385', '1', 'BUKU', 1, '[{\"added\": {}}]', 11, 1),
(2, '2022-06-06 13:49:27.791117', '2', 'PCS', 1, '[{\"added\": {}}]', 11, 1),
(3, '2022-06-06 13:49:33.016820', '3', 'BOX', 1, '[{\"added\": {}}]', 11, 1),
(4, '2022-06-06 13:49:38.333840', '4', 'LBR', 1, '[{\"added\": {}}]', 11, 1);

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
(1, 'contenttypes', '0001_initial', '2022-06-06 13:46:07.281186'),
(2, 'auth', '0001_initial', '2022-06-06 13:46:07.708190'),
(3, 'admin', '0001_initial', '2022-06-06 13:46:08.308244'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-06-06 13:46:08.459245'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-06-06 13:46:08.471243'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-06-06 13:46:08.566451'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-06-06 13:46:08.668453'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-06-06 13:46:08.694455'),
(9, 'auth', '0004_alter_user_username_opts', '2022-06-06 13:46:08.707451'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-06-06 13:46:08.758449'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-06-06 13:46:08.762489'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-06-06 13:46:08.772452'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-06-06 13:46:08.791450'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-06-06 13:46:08.809845'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-06-06 13:46:08.828845'),
(16, 'auth', '0011_update_proxy_permissions', '2022-06-06 13:46:08.840879'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-06-06 13:46:08.860841'),
(18, 'sessions', '0001_initial', '2022-06-06 13:46:08.918875'),
(19, 'website', '0001_initial', '2022-06-06 13:46:09.051901'),
(20, 'website', '0002_auto_20220606_2046', '2022-06-06 13:46:09.607406');

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
('ku15nbntll4w64ov096m7emwmidw8ip6', '.eJxVjMsOwiAQRf-FtSEULA-X7v0GMsMMUjWQlHZl_HfbpAvd3nPOfYsI61Li2nmOE4mLGMTpd0NIT647oAfUe5Op1WWeUO6KPGiXt0b8uh7u30GBXrZaI1kAjeBHE4z2hIkTD3rMlh05lSlYpLNRpF1WiWwgh2FTFXurIInPFwXqOJQ:1nyD4S:Su7EitUO2tBaASJjU-YAp4z-jzGP8JHAruiKuyre-sw', '2022-06-20 13:47:04.663372');

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
(1, 'GCNS-M- 21788-06', '210821010', 'Buku Inspeksi Gulungan Baja Hot Rolling 热轧钢卷摊开检验记录表', 'Kertas HVS A4, cetak vertikal satu sisi,50 lembar/buku bercover, jilid atas versi rekod (hekter)A4纸;单面印刷;每本50张;需要 封面;不易撕;上方装订', 'Buku 本', 200, 8250, 1650000, 'TOKO AUNIS PRINT OFFSET', '2021-09-03', '45', '2021-10-18', 0, 1, 1),
(2, 'IRNC-M- 21665-03', '210815028', 'Tabel Catatan Inspeksi Harian Mesin Penggulung Bagian Belakang 出口段卷取机日点检表', 'Kertas HVS A4, cetak horizontal; timbal balik,16 lembar/buku bercover , jilid kiri versi rekod (hekter)32页(16张),正反面 打印,A4纸,横版', 'Buku 本', 60, 3360, 201600, 'TOKO AUNIS PRINT OFFSET', '2021-09-03', '45', '2021-10-18', 0, 1, 3),
(3, 'IRNC-M- 21665-04', '210815029', 'Tabel Catatan Inspeksi Harian Mesin Las Bagian Depan 入口段焊机日焊机点检表', 'Kertas HVS A4, cetak horizontal; timbal balik,16 lembar/buku bercover , jilid kiri versi rekod (hekter)32页(16张),正反面 打印,A4纸,横版', 'Buku 本', 60, 3360, 201600, 'TOKO AUNIS PRINT OFFSET', '2021-09-03', '45', '2021-10-18', 0, 1, 3),
(4, 'IRNC-M- 21665-04', '210815030', 'Tabel Catatan Inspeksi Harian Mesin pembuka gulungan Bagian Depan 入口段开卷机点检表', 'Kertas HVS A4, cetak horizontal; timbal balik,16 lembar/buku bercover , jilid kiri versi rekod (hekter)32页(16张),正反面 打印,A4纸,横版', 'Buku 本', 60, 3360, 201600, 'TOKO AUNIS PRINT OFFSET', '2021-09-03', '45', '2021-10-18', 0, 1, 3),
(5, 'IRNC-M- 21665-04', '210815031', 'Tabel Catatan Inspeksi Harian Tungku Anil Bagian Depan 入口段退火炉日点检表', 'Kertas HVS A4, cetak horizontal; timbal balik,16 lembar/buku bercover , jilid kiri versi rekod (hekter)32页(16张),正反面 打印,A4纸,横版', 'Buku 本', 60, 3360, 201600, 'TOKO AUNIS PRINT OFFSET', '2021-09-03', '45', '2021-10-18', 0, 1, 3),
(6, 'IRNC-M- 21665-04', '210815032', 'Buku Rekod Pertukaran Shift 交接班记录本', 'Kertas HVS A4, cetak vertikal timbal balik,41 lembar/buku,bercover, jilid kiri, rekod (hekter) 92页(41张),正反面打印,A4纸,竖版', 'Buku 本', 100, 8610, 861000, 'TOKO AUNIS PRINT OFFSET', '2021-09-03', '45', '2021-10-18', 0, 1, 3),
(7, 'IRNC-M- 21665-04', '210815033', 'Daftar Pemeriksaan Zona Asam 2 酸区点检记录本二', 'Kertas HVS A4, cetak vertikal timbal balik,41 lembar/buku,bercover, jilid kiri, rekod (hekter) 92页(41张),正反面打印,A4纸,竖版', 'Buku 本', 60, 8610, 516600, 'TOKO AUNIS PRINT OFFSET', '2021-09-03', '45', '2021-10-18', 0, 1, 3),
(8, 'IRNC-M- 21665-04', '210815034', 'Tabel Catatan Pemeriksaan Peralatan 设备点检记录表', 'Kertas HVS A4, cetak horizontal; timbal balik,16 lembar/buku bercover , jilid kiri versi rekod (hekter)32页(16张),正反面 打印,A4纸,竖版', 'Buku 本', 50, 3360, 168000, 'TOKO AUNIS PRINT OFFSET', '2021-09-03', '45', '2021-10-18', 0, 1, 3),
(9, 'IRNC-M- 21665-05', '210815035', 'Tabel Operasi Perawatan Pelumasan Peralatan 液压润滑点检表', 'Kertas HVS A4, cetak horizontal; timbal balik,16 lembar/buku bercover , jilid kiri versi rekod (hekter)32页(16张),正反面 打印,A4纸,竖版', 'Buku 本', 50, 3360, 168000, 'TOKO AUNIS PRINT OFFSET', '2021-09-03', '45', '2021-10-18', 0, 1, 3),
(10, 'IRNC-M- 21665-05', '210815036', 'BUKU REKOD PERTULARAN SHIFT KERJA 交接班记录', 'Kertas HVS A4, cetak horizontal; timbal balik,16 lembar/buku bercover , jilid kiri versi rekod (hekter)32页(16张),正反面 打印,A4纸,竖版', 'Buku 本', 50, 3360, 168000, 'TOKO AUNIS PRINT OFFSET', '2021-09-03', '45', '2021-10-18', 0, 1, 3),
(11, 'ITSS-M- 211271-04', '210901002', 'Transfer catatan inspeksi dan transfer dua truk flatbed 平板车点检本', 'Kertas HVS A4, cetak vertikal; timbal balik,34 lembar/buku bercover , jilid kiri versi rekod (hekter)A4纸张,双面印刷,每 本34张,需要封面,不易撕,左侧钉装', 'Buku 本', 700, 7140, 4998000, 'TOKO AUNIS PRINT OFFSET', '2021-09-03', '45', '2021-10-18', 0, 1, 2),
(12, 'GCNS-M- 21788-06', '210821011', 'Buku Record Gulungan Baja Hot Rolling 热轧钢卷初判检验记录表', 'Kertas HVS A4, cetak vertikal satu sisi,50 lembar/buku bercover, jilid atas versi rekod (hekter)A4纸;单面印刷;每本50张;需要 封面;不易撕;上方装订', 'Buku 本', 100, 8250, 825000, 'TOKO AUNIS PRINT OFFSET', '2021-09-03', '45', '2021-10-18', 0, 1, 1),
(13, 'ITSS-M- 211271-04', '210901003', 'Tabel Inspeksi Derek Mobil untuk Bagian Transportasi 2 汽车吊点检本', 'Kertas HVS A4, cetak horizontal; timbal balik,34 lembar/buku bercover , jilid kiri versi rekod (hekter)A4纸张,双面印刷,每 本34张,需要封面,不易撕,左侧钉装', 'Buku 本', 200, 7140, 1428000, 'TOKO AUNIS PRINT OFFSET', '2021-09-03', '45', '2021-10-18', 0, 1, 2),
(14, 'GCNS-M- 21788-06', '210821012', 'Buku Pemeriksaan Layar Gulungan Baja Hot Rolling 热轧钢卷表检仪检验记录表', 'Kertas HVS A4, cetak vertikal satu sisi,50 lembar/buku bercover, jilid atas versi rekod (hekter)A4纸;单面印刷;每本50张;需要 封面;不易撕;上方装订', 'Buku 本', 150, 8250, 1237500, 'TOKO AUNIS PRINT OFFSET', '2021-09-03', '45', '2021-10-18', 0, 1, 1),
(15, 'GCNS-M- 21788-06', '210821014', 'Catatn Pengecekan Gulungan Baja Putih 白皮记录表', 'Kertas HVS A4, cetak vertikal timbal balik,60 lembar/buku bercover, jilid kiri versi rekod (hekter)A4纸;双面印刷;每本 60张;需要封面;易撕;左侧装订', 'Buku 本', 200, 12600, 2520000, 'TOKO AUNIS PRINT OFFSET', '2021-09-03', '45', '2021-10-18', 0, 1, 1),
(16, 'GCNS-M- 21788-06', '210821015', 'Buku Cacatan Shift Sebelum / Sesudah 班前会记录本', 'Kertas HVS A4, cetak vertikal timbal balik,50 lembar/buku bercover, jilid kiri versi rekod (hekter) A4纸;双面印刷;每本50张;需要封面; 不易撕;左侧装订', 'Buku 本', 50, 10500, 525000, 'TOKO AUNIS PRINT OFFSET', '2021-09-03', '45', '2021-10-18', 0, 1, 1),
(17, 'GCNS-M- 21788-06', '210821016', 'Rekapan Pemeriksaan Kualitas Pemotongan Baja YongQing Indo 分条记录表', 'Kertas HVS A4, cetak satu sisi,60 lembar/buku bercover, jilid kiri versi nota (mudah sobek) A4纸;单面印刷;每本60张;需要封面; 易撕;左侧装订', 'Buku 本', 100, 9900, 990000, 'TOKO AUNIS PRINT OFFSET', '2021-09-03', '45', '2021-10-18', 0, 1, 1),
(18, 'ITSS-M- 211271-04', '210825014', 'Rekod Rapat Pra Kerja班前会记 录本', 'Kertas HVS A4, cetak vertikal timbal balik,30 lembar/buku bercover, jilid kiri versi rekod (hekter)规格:A4纸;纸张方向:纵 向;印刷类别:双面印刷;装订页数:30 (不含封面)', 'Buku 本', 1000, 6300, 6300000, 'TOKO AUNIS PRINT OFFSET', '2021-09-03', '45', '2021-10-18', 0, 1, 2),
(19, 'IRNC-M- 21665-03', '210815026', 'Daftar Pemeriksaan Zona Asam 酸区现场点检表', 'Kertas HVS A4, cetak vertikal timbal balik,16 lembar/buku bercover , jilid kiri versi rekod (hekter)32页(16张),正反面 打印,A4纸,竖版', 'Buku 本', 60, 3360, 201600, 'TOKO AUNIS PRINT OFFSET', '2021-09-03', '45', '2021-10-18', 0, 1, 3),
(20, 'IRNC-M- 21665-03', '210815027', 'Tabel Catatan Inspeksi Harian Shot Blasting Bagian Tengah 中间段抛丸机点检表', 'Kertas HVS A4, cetak horizontal; timbal balik,16 lembar/buku bercover , jilid kiri versi rekod (hekter)32页(16张),正反面 打印,A4纸,横版', 'Buku 本', 60, 3360, 201600, 'TOKO AUNIS PRINT OFFSET', '2021-09-03', '45', '2021-10-18', 0, 1, 3),
(22, 'asd', 'ass', 'Buku Inspeksi Gulungan Baja Hot Rolling ', 'Kertas HVS A4, cetak vertikal satu sisi', 'asd', 1, 2, 2, 'AUNIS PRINT OFFSET', '2022-06-22', '12', '2022-06-20', 0, 3, 2),
(23, 'asd', 'assvvv', 'Buku Inspeksi Gulungan Baja Hot Rolling ', 'as', '123', 12, 2, 24, 'AUNIS PRINT OFFSET', '2022-06-19', '12', '2022-06-12', 0, 4, 1),
(24, 'asd', 'assvvv', 'daeeee', 'Kertas HVS A4, cetak vertikal satu sisi', '123', 1, 1, 1, 'AUNIS PRINT OFFSET', '2022-06-27', '1', '2022-06-28', 0, 5, 2);

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
(2, 'CACSAC', 2, 3, 4, 1),
(3, 'lmlmlm', 13, 3, 4, 4),
(5, 'CACSAC', 3, 2, 6, 1),
(6, 'adf', 2, 2, 15, 1),
(7, 'adf', 12, 1, 15, 1),
(9, 'CACSAC', 2, 3, 19, 1);

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

--
-- Dumping data for table `website_isi_sjalan`
--

INSERT INTO `website_isi_sjalan` (`id`, `jumlah`, `nomor_dos`, `id_SJalan_id`, `id_isikontrak_id`) VALUES
(1, 1, 21, 1, 4),
(2, 11, 212, 1, 1),
(3, 2, 3, 3, 1),
(4, 12, 21, 5, 1);

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
(1, 'uploads/-_PO_AUNIS_2021.09.03_rSOgQi8.pdf', '45a28bb5-0c99-46f4-948b-6c45cd6ff6b6', '2022-06-06'),
(3, 'uploads/kontrak2', '52257883-5040-49fc-8029-c6d1a4c2c6e3', '2022-06-08'),
(4, 'uploads/kontrak2', 'b5f269b9-2772-4f36-885a-c776e801bd91', '2022-06-08'),
(5, 'uploads/0d0ccf4d-feba-4182-8ca1-01b15f36e793.pdf', '0d0ccf4d-feba-4182-8ca1-01b15f36e793', '2022-06-08');

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
(4, '1', '31441', '2022-06-07'),
(6, '3', 'qwqwqw', '2022-06-10'),
(15, '4', '31441dava', '2022-06-22'),
(16, '2', '31441dava', '2022-06-22'),
(19, 'AUNIS/K/2022/5', '31441', '2022-06-03');

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
(1, 'GCNS', 'GCNS', '', NULL),
(2, 'ITSS', 'ITSS', '', NULL),
(3, 'IRNC', 'IRNC', '', NULL);

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
(1, 'BUKU'),
(2, 'PCS'),
(3, 'BOX'),
(4, 'LBR');

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

--
-- Dumping data for table `website_sjalan`
--

INSERT INTO `website_sjalan` (`id`, `no_surat`, `no_hp`, `tanggal`, `id_kontrak_id`, `pemesan_id`) VALUES
(1, '1', '213ddd', '2022-06-17', 1, 2),
(3, '2', 'ffdf', '2022-06-08', 1, 3),
(4, 'AUNIS/SJ/2022/3', 'ffdf', '2022-06-10', 1, 1),
(5, 'AUNIS/SJ/2022/4', '213ddd', '2022-06-11', 1, 2);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `website_isi_kwitansi`
--
ALTER TABLE `website_isi_kwitansi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `website_isi_sjalan`
--
ALTER TABLE `website_isi_sjalan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `website_kontrak`
--
ALTER TABLE `website_kontrak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `website_kwitansi`
--
ALTER TABLE `website_kwitansi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `website_perusahaan`
--
ALTER TABLE `website_perusahaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
