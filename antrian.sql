-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.24-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for antrian
-- CREATE DATABASE IF NOT EXISTS `antrian` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
-- USE `antrian`;

-- Dumping structure for table antrian.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table antrian.admin: ~2 rows (approximately)
INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama_lengkap`) VALUES
	(1, 'admin', '$2y$10$Y/sPp9HR6PxRGUclp.kutOgCYivMEJWzi4EJKG9rAKhel5PcOybl6', 'admin'),
	(2, 'daniar', '$2y$10$6N9Bqpj9eGwwbYOwXfLnyeW2y25fxb/EdZJTIX7b05jMrPEeGMfAm', 'Daniar Syifa Fauziah Arum');
    
-- Dumping structure for table antrian.pelayanan
CREATE TABLE IF NOT EXISTS `pelayanan` (
  `id_pelayanan` int(11) NOT NULL AUTO_INCREMENT,
  `kode_pelayanan` varchar(2) NOT NULL,
  `nama_pelayanan` varchar(50) NOT NULL,
  PRIMARY KEY (`id_pelayanan`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping structure for table antrian.loket
CREATE TABLE IF NOT EXISTS `loket` (
  `id_loket` int(11) NOT NULL AUTO_INCREMENT,
  `nama_loket` varchar(50) NOT NULL,
  `pelayanan_id` int(11) NOT NULL,
  PRIMARY KEY (`id_loket`),
  KEY `pelayanan_id` (`pelayanan_id`),
  CONSTRAINT `loket_ibfk_1` FOREIGN KEY (`pelayanan_id`) REFERENCES `pelayanan` (`id_pelayanan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table antrian.loket: ~4 rows (approximately)


-- Dumping data for table antrian.pelayanan: ~5 rows (approximately)

-- Dumping structure for table antrian.antrian
CREATE TABLE IF NOT EXISTS `antrian` (
  `id_antrian` int(11) NOT NULL AUTO_INCREMENT,
  `no_antrian` int(11) NOT NULL,
  `kode_antrian` varchar(10) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `waktu_panggil` datetime DEFAULT NULL,
  `waktu_selesai` datetime DEFAULT NULL,
  `created_at` date NOT NULL,
  `pelayanan_id` int(11) NOT NULL,
  `loket_id` int(11) NOT NULL,
  PRIMARY KEY (`id_antrian`),
  KEY `pelayanan_id` (`pelayanan_id`),
  KEY `loket_id` (`loket_id`),
  CONSTRAINT `antrian_ibfk_1` FOREIGN KEY (`loket_id`) REFERENCES `loket` (`id_loket`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `antrian_ibfk_2` FOREIGN KEY (`pelayanan_id`) REFERENCES `pelayanan` (`id_pelayanan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table antrian.antrian: ~26 rows (approximately)


/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
