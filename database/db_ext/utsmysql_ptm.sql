/*
SQLyog Enterprise v13.1.1 (64 bit)
MySQL - 10.1.36-MariaDB : Database - utsmysql_ptm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`utsmysql_ptm` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `utsmysql_ptm`;

/*Table structure for table `hobi` */

DROP TABLE IF EXISTS `hobi`;

CREATE TABLE `hobi` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `nbi` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_hobi` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hobi_nbi_foreign` (`nbi`),
  CONSTRAINT `hobi_nbi_foreign` FOREIGN KEY (`nbi`) REFERENCES `mahasiswa` (`nbi`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `hobi` */

insert  into `hobi`(`id`,`nbi`,`nama_hobi`) values 
(1,'1461700123','Memasak'),
(4,'1461700124','Membaca Buku'),
(5,'1461700124','Memasak'),
(24,'1461700125','Bermain Bola'),
(25,'1461700125','Bermain Gitar'),
(26,'1461700126','Bermain Bola'),
(27,'1461700126','Memasak'),
(28,'1461700126','Bermain Game'),
(29,'1461700099','Bermain Bola'),
(30,'1461700099','Membaca Buku'),
(31,'1461700099','Bermain Gitar'),
(32,'1461700099','Bermain Game');

/*Table structure for table `mahasiswa` */

DROP TABLE IF EXISTS `mahasiswa`;

CREATE TABLE `mahasiswa` (
  `nbi` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_lahir` date NOT NULL,
  `prodi` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jns_kelamin` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`nbi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `mahasiswa` */

insert  into `mahasiswa`(`nbi`,`nama`,`alamat`,`tgl_lahir`,`prodi`,`jns_kelamin`,`agama`,`created_at`,`updated_at`) values 
('1461700099','Rizal Kurnia Pratama','Jl.Kayu 8B No.9','1998-05-20','Teknik Informatika','Laki-Laki','Islam','2019-10-19 17:10:52','2019-10-19 22:52:32'),
('1461700123','Tukiem','Jl.Buntu','1998-05-01','Teknik Sipil','Perempuan','Islam','2019-10-19 17:07:46','2019-10-19 17:07:46'),
('1461700124','Jenny','Jl.Tol','1998-02-03','Sastra Inggris','Perempuan','Kristen Protestan','2019-10-19 20:15:03','2019-10-19 20:15:03'),
('1461700125','Sukijan','Jl.pafing','1998-06-01','Teknik Elektro','Laki-Laki','Islam','2019-10-19 21:01:42','2019-10-19 21:01:42'),
('1461700126','Bangpen','Jl.buntu 2','1998-05-01','Sastra Jepang','Laki-Laki','Kristen Protestan','2019-10-20 02:59:33','2019-10-20 02:59:33');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2019_10_19_001642_create_mahasiswa_table',1),
(2,'2019_10_19_004456_create_hobi_table',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
