-- --------------------------------------------------------
-- Sunucu:                       localhost
-- Sunucu sürümü:                5.7.19 - MySQL Community Server (GPL)
-- Sunucu İşletim Sistemi:       Win64
-- HeidiSQL Sürüm:               9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- oyundb için veritabanı yapısı dökülüyor
CREATE DATABASE IF NOT EXISTS `oyundb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `oyundb`;

-- tablo yapısı dökülüyor oyundb.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `idAdmin` int(45) NOT NULL AUTO_INCREMENT,
  `a_ad` varchar(45) NOT NULL,
  `a_soyad` varchar(45) NOT NULL,
  `a_email` varchar(45) NOT NULL,
  `a_username` varchar(45) NOT NULL,
  `a_sifre` varchar(45) NOT NULL,
  PRIMARY KEY (`idAdmin`),
  UNIQUE KEY `a_username` (`a_username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Veri çıktısı seçilmemişti
-- tablo yapısı dökülüyor oyundb.kullanici
CREATE TABLE IF NOT EXISTS `kullanici` (
  `idKullanici` int(45) NOT NULL,
  `k_ad` varchar(45) NOT NULL,
  `k_soyad` varchar(45) NOT NULL,
  `k_email` varchar(45) NOT NULL,
  `k_username` varchar(45) NOT NULL,
  `k_sifre` varchar(45) NOT NULL,
  PRIMARY KEY (`idKullanici`),
  UNIQUE KEY `k_username` (`k_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Veri çıktısı seçilmemişti
-- tablo yapısı dökülüyor oyundb.motor
CREATE TABLE IF NOT EXISTS `motor` (
  `idMotor` int(45) NOT NULL AUTO_INCREMENT,
  `m_ad` varchar(45) NOT NULL,
  PRIMARY KEY (`idMotor`),
  UNIQUE KEY `m_ad` (`m_ad`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- Veri çıktısı seçilmemişti
-- tablo yapısı dökülüyor oyundb.oyun
CREATE TABLE IF NOT EXISTS `oyun` (
  `idOyun` int(45) NOT NULL AUTO_INCREMENT,
  `o_ad` varchar(45) NOT NULL,
  `o_tarih` varchar(45) DEFAULT NULL,
  `o_yayimciid` int(45) NOT NULL,
  `o_motorid` int(45) NOT NULL,
  PRIMARY KEY (`idOyun`),
  UNIQUE KEY `o_ad` (`o_ad`),
  KEY `o_motorid` (`o_motorid`),
  KEY `o_yayimciid` (`o_yayimciid`),
  CONSTRAINT `FK_oyun_motor` FOREIGN KEY (`o_motorid`) REFERENCES `motor` (`idMotor`),
  CONSTRAINT `FK_oyun_yayimci` FOREIGN KEY (`o_yayimciid`) REFERENCES `yayimci` (`idYayimci`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- Veri çıktısı seçilmemişti
-- tablo yapısı dökülüyor oyundb.oyun_platform
CREATE TABLE IF NOT EXISTS `oyun_platform` (
  `idOyunPlatform` int(45) NOT NULL AUTO_INCREMENT,
  `idOyun` int(45) NOT NULL,
  `idPlatform` int(45) NOT NULL,
  PRIMARY KEY (`idOyunPlatform`),
  KEY `idOyun` (`idOyun`),
  KEY `idPlatform` (`idPlatform`),
  CONSTRAINT `FK_oyun_platform_oyun` FOREIGN KEY (`idOyun`) REFERENCES `oyun` (`idOyun`),
  CONSTRAINT `FK_oyun_platform_platform` FOREIGN KEY (`idPlatform`) REFERENCES `platform` (`idPlatform`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8;

-- Veri çıktısı seçilmemişti
-- tablo yapısı dökülüyor oyundb.oyun_tur
CREATE TABLE IF NOT EXISTS `oyun_tur` (
  `idOyunTur` int(45) NOT NULL AUTO_INCREMENT,
  `idOyun` int(45) NOT NULL,
  `idTur` int(45) NOT NULL,
  PRIMARY KEY (`idOyunTur`),
  KEY `idOyun` (`idOyun`),
  KEY `idTur` (`idTur`),
  CONSTRAINT `FK_oyun_tur_oyun` FOREIGN KEY (`idOyun`) REFERENCES `oyun` (`idOyun`),
  CONSTRAINT `FK_oyun_tur_tur` FOREIGN KEY (`idTur`) REFERENCES `tur` (`idTur`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

-- Veri çıktısı seçilmemişti
-- tablo yapısı dökülüyor oyundb.platform
CREATE TABLE IF NOT EXISTS `platform` (
  `idPlatform` int(45) NOT NULL AUTO_INCREMENT,
  `p_ad` varchar(45) NOT NULL,
  `p_web` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPlatform`),
  UNIQUE KEY `p_ad` (`p_ad`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- Veri çıktısı seçilmemişti
-- tablo yapısı dökülüyor oyundb.tur
CREATE TABLE IF NOT EXISTS `tur` (
  `idTur` int(45) NOT NULL AUTO_INCREMENT,
  `t_ad` varchar(45) NOT NULL,
  PRIMARY KEY (`idTur`),
  UNIQUE KEY `t_ad` (`t_ad`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- Veri çıktısı seçilmemişti
-- tablo yapısı dökülüyor oyundb.yayimci
CREATE TABLE IF NOT EXISTS `yayimci` (
  `idYayimci` int(45) NOT NULL AUTO_INCREMENT,
  `y_ad` varchar(45) NOT NULL,
  `y_kurulus` varchar(45) DEFAULT NULL,
  `y_web` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idYayimci`),
  UNIQUE KEY `y_ad` (`y_ad`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- Veri çıktısı seçilmemişti
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
