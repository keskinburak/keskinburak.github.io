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

-- oyundb.admin: ~2 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `admin`;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`idAdmin`, `a_ad`, `a_soyad`, `a_email`, `a_username`, `a_sifre`) VALUES
	(1, 'Burak', 'Keskin', 'keskinburak94@gmail.com', 'burakun94', '280413'),
	(2, 'Merve', 'Altın', 'mervealtin@gmail.com', 'altin17', '280413');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;

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

-- oyundb.kullanici: ~3 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `kullanici`;
/*!40000 ALTER TABLE `kullanici` DISABLE KEYS */;
INSERT INTO `kullanici` (`idKullanici`, `k_ad`, `k_soyad`, `k_email`, `k_username`, `k_sifre`) VALUES
	(1, 'Ali', 'Yildiz', 'aliyildiz@gmail.com', 'yildiz59', '123123'),
	(2, 'Bircet Tufan', 'Akkan', 'tufanakkan@gmail.com', 'akkan95', '321321'),
	(3, 'Ugur', 'Öztürk', 'ozturkugur@hotmail.com', 'ozturk93', '123123');
/*!40000 ALTER TABLE `kullanici` ENABLE KEYS */;

-- tablo yapısı dökülüyor oyundb.motor
CREATE TABLE IF NOT EXISTS `motor` (
  `idMotor` int(45) NOT NULL AUTO_INCREMENT,
  `m_ad` varchar(45) NOT NULL,
  PRIMARY KEY (`idMotor`),
  UNIQUE KEY `m_ad` (`m_ad`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- oyundb.motor: ~28 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `motor`;
/*!40000 ALTER TABLE `motor` DISABLE KEYS */;
INSERT INTO `motor` (`idMotor`, `m_ad`) VALUES
	(3, 'Anvil'),
	(4, 'Build Engine'),
	(5, 'Chrome Engine'),
	(6, 'Clickteam Fusion'),
	(7, 'Creation Engine'),
	(8, 'Cry Engine'),
	(9, 'Decima'),
	(10, 'Dunia Engine'),
	(11, 'ego'),
	(12, 'Essence Engine'),
	(13, 'Forgelight Engine'),
	(14, 'Fox Engine'),
	(15, 'Frostbite'),
	(16, 'Gamebyro'),
	(17, 'GoldSrc'),
	(18, 'id Tech'),
	(19, 'INSANE'),
	(20, 'IW engine'),
	(21, 'Jade'),
	(22, 'MT Framework'),
	(24, 'Odyssey Engine'),
	(27, 'RAGE'),
	(25, 'Real Virtuality'),
	(26, 'REDEngine'),
	(28, 'SAGE'),
	(29, 'Source'),
	(30, 'Unity'),
	(31, 'Unreal Engine');
/*!40000 ALTER TABLE `motor` ENABLE KEYS */;

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

-- oyundb.oyun: ~32 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `oyun`;
/*!40000 ALTER TABLE `oyun` DISABLE KEYS */;
INSERT INTO `oyun` (`idOyun`, `o_ad`, `o_tarih`, `o_yayimciid`, `o_motorid`) VALUES
	(2, 'Assassin\'s Creed Unity', '2014', 11, 3),
	(3, 'Tom Clancy\'s Rainbow Six Siege', '2015', 11, 3),
	(4, 'Shadow Warrior', '1997', 26, 4),
	(5, 'Dying Light', '2015', 19, 5),
	(8, 'Dead Island', '2011', 20, 5),
	(9, 'Five Nights at Freddy\'s', '2014', 21, 6),
	(10, 'The Elder Scrolls V: Skyrim', '2011', 22, 7),
	(11, 'Crysis 3', '2013', 7, 8),
	(12, 'Death Stranding', 'TBA', 2, 9),
	(13, 'Far Cry:Primal', '2016', 11, 10),
	(14, 'Dirt 3', '2011', 23, 11),
	(15, 'Company of Heroes 2', '2013', 16, 12),
	(16, 'H1Z1 : King of the Kill', 'TBA', 24, 13),
	(17, 'Pro Evolution Soccer 2017', '2016', 18, 14),
	(18, 'Star Wars Battlefront', '2015', 7, 15),
	(19, 'Ghost in the Shell: First Assault', '2015', 10, 16),
	(20, 'Counter-Strike', '1999', 25, 17),
	(21, 'Doom', '2016', 22, 18),
	(22, 'Star Wars: Rebel Assault II', '1995', 27, 19),
	(23, 'Call of Duty: Infinite Warfare', '2016', 6, 20),
	(24, 'Naruto: The Broken Bond', '2008', 11, 21),
	(25, 'Resident Evil: Revelations 2', '2015', 14, 22),
	(26, 'Star Wars Knights of the Old Republic II', '2005', 27, 24),
	(27, 'ARMA 3', '2013', 28, 25),
	(28, 'The Witcher 3: Wild Hunt', '2015', 29, 26),
	(29, 'Grand Theft Auto V', '2015', 30, 27),
	(30, 'Command & Conquer 4: Tiberian Twilight', '2010', 7, 28),
	(31, 'Counter-Strike: Global Offensive', '2012', 25, 29),
	(32, 'Dota 2', '2012', 25, 29),
	(33, 'Pokémon Go', '2016', 31, 30),
	(34, 'Batman: Arkham Knight', '2015', 19, 31),
	(60, 'BurVe', '1994', 2, 3);
/*!40000 ALTER TABLE `oyun` ENABLE KEYS */;

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

-- oyundb.oyun_platform: ~95 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `oyun_platform`;
/*!40000 ALTER TABLE `oyun_platform` DISABLE KEYS */;
INSERT INTO `oyun_platform` (`idOyunPlatform`, `idOyun`, `idPlatform`) VALUES
	(4, 2, 1),
	(5, 2, 13),
	(6, 2, 15),
	(8, 3, 1),
	(9, 3, 13),
	(10, 3, 15),
	(13, 4, 1),
	(14, 5, 1),
	(15, 5, 5),
	(16, 5, 13),
	(17, 5, 15),
	(32, 8, 1),
	(33, 8, 4),
	(34, 8, 5),
	(35, 8, 12),
	(36, 8, 13),
	(37, 8, 14),
	(38, 8, 15),
	(39, 9, 1),
	(40, 9, 6),
	(41, 9, 7),
	(42, 10, 1),
	(43, 10, 12),
	(44, 10, 13),
	(45, 10, 14),
	(46, 10, 15),
	(47, 11, 1),
	(48, 11, 12),
	(49, 11, 14),
	(50, 12, 13),
	(51, 13, 1),
	(52, 13, 13),
	(53, 13, 15),
	(54, 14, 1),
	(55, 14, 4),
	(56, 14, 12),
	(57, 14, 14),
	(58, 15, 1),
	(59, 15, 4),
	(60, 15, 5),
	(61, 16, 1),
	(62, 16, 13),
	(63, 16, 15),
	(64, 17, 1),
	(65, 17, 6),
	(66, 17, 12),
	(67, 17, 13),
	(68, 17, 14),
	(69, 17, 15),
	(70, 18, 1),
	(71, 18, 13),
	(72, 18, 15),
	(73, 19, 1),
	(74, 20, 1),
	(75, 21, 1),
	(76, 21, 13),
	(77, 21, 15),
	(78, 22, 1),
	(79, 23, 1),
	(80, 23, 13),
	(81, 23, 15),
	(82, 24, 14),
	(83, 25, 1),
	(84, 25, 12),
	(85, 25, 13),
	(86, 25, 14),
	(87, 25, 15),
	(88, 26, 1),
	(89, 26, 4),
	(90, 26, 5),
	(91, 27, 1),
	(92, 28, 1),
	(93, 28, 13),
	(94, 28, 15),
	(95, 29, 1),
	(96, 29, 12),
	(97, 29, 13),
	(98, 29, 14),
	(99, 29, 15),
	(100, 30, 1),
	(101, 31, 1),
	(102, 31, 4),
	(103, 31, 5),
	(104, 31, 12),
	(105, 31, 14),
	(106, 32, 1),
	(107, 32, 4),
	(108, 32, 5),
	(109, 33, 6),
	(110, 33, 7),
	(111, 34, 1),
	(112, 34, 13),
	(113, 34, 15),
	(143, 60, 1),
	(144, 60, 4);
/*!40000 ALTER TABLE `oyun_platform` ENABLE KEYS */;

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

-- oyundb.oyun_tur: ~47 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `oyun_tur`;
/*!40000 ALTER TABLE `oyun_tur` DISABLE KEYS */;
INSERT INTO `oyun_tur` (`idOyunTur`, `idOyun`, `idTur`) VALUES
	(1, 2, 10),
	(2, 3, 7),
	(3, 4, 7),
	(4, 5, 10),
	(5, 5, 18),
	(6, 5, 9),
	(35, 8, 27),
	(36, 8, 18),
	(37, 8, 9),
	(38, 9, 18),
	(39, 9, 9),
	(40, 10, 27),
	(41, 11, 7),
	(42, 12, 28),
	(43, 13, 10),
	(44, 13, 7),
	(45, 14, 23),
	(46, 15, 16),
	(47, 16, 7),
	(48, 16, 9),
	(49, 16, 8),
	(50, 17, 13),
	(51, 18, 7),
	(52, 18, 8),
	(53, 19, 7),
	(54, 20, 7),
	(55, 21, 7),
	(56, 22, 28),
	(57, 23, 7),
	(58, 24, 10),
	(59, 24, 5),
	(60, 25, 7),
	(61, 25, 18),
	(62, 25, 9),
	(63, 26, 12),
	(64, 27, 7),
	(65, 28, 27),
	(66, 29, 10),
	(67, 29, 7),
	(68, 29, 8),
	(69, 30, 16),
	(70, 31, 7),
	(71, 32, 2),
	(72, 33, 29),
	(73, 34, 10),
	(76, 60, 28),
	(77, 60, 27);
/*!40000 ALTER TABLE `oyun_tur` ENABLE KEYS */;

-- tablo yapısı dökülüyor oyundb.platform
CREATE TABLE IF NOT EXISTS `platform` (
  `idPlatform` int(45) NOT NULL AUTO_INCREMENT,
  `p_ad` varchar(45) NOT NULL,
  `p_web` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPlatform`),
  UNIQUE KEY `p_ad` (`p_ad`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- oyundb.platform: ~12 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `platform`;
/*!40000 ALTER TABLE `platform` DISABLE KEYS */;
INSERT INTO `platform` (`idPlatform`, `p_ad`, `p_web`) VALUES
	(1, 'Windows', 'windows.microsoft.com'),
	(4, 'macOS', 'www.apple.com/macos'),
	(5, 'Linux', ''),
	(6, 'Android', 'android.com'),
	(7, 'iOS', 'www.apple.com/ios/'),
	(8, 'Windows Phone', 'www.windowsphone.com'),
	(9, 'Wii', ''),
	(10, 'PlayStation', ''),
	(11, 'PlayStation 2', ''),
	(12, 'PlayStation 3', 'playstation.com/ps3/'),
	(13, 'PlayStation 4', 'playstation.com/ps4/'),
	(14, 'Xbox 360', 'xbox.com/xbox360/'),
	(15, 'Xbox One', 'xbox.com');
/*!40000 ALTER TABLE `platform` ENABLE KEYS */;

-- tablo yapısı dökülüyor oyundb.tur
CREATE TABLE IF NOT EXISTS `tur` (
  `idTur` int(45) NOT NULL AUTO_INCREMENT,
  `t_ad` varchar(45) NOT NULL,
  PRIMARY KEY (`idTur`),
  UNIQUE KEY `t_ad` (`t_ad`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- oyundb.tur: ~21 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `tur`;
/*!40000 ALTER TABLE `tur` DISABLE KEYS */;
INSERT INTO `tur` (`idTur`, `t_ad`) VALUES
	(28, 'Action'),
	(27, 'Action role-playing game'),
	(10, 'Action-Adventure'),
	(11, 'Adventure'),
	(15, 'Construction and management'),
	(5, 'Fighting'),
	(7, 'First Person Shooter'),
	(4, 'Hack and Slash'),
	(18, 'Horror'),
	(14, 'Life Simulation'),
	(29, 'Location-based game'),
	(3, 'MMORPG'),
	(2, 'MOBA'),
	(6, 'Platform'),
	(23, 'Racing'),
	(12, 'RPG'),
	(13, 'Sports'),
	(16, 'Strateji'),
	(9, 'Survival'),
	(8, 'Third Person Shooter');
/*!40000 ALTER TABLE `tur` ENABLE KEYS */;

-- tablo yapısı dökülüyor oyundb.yayimci
CREATE TABLE IF NOT EXISTS `yayimci` (
  `idYayimci` int(45) NOT NULL AUTO_INCREMENT,
  `y_ad` varchar(45) NOT NULL,
  `y_kurulus` varchar(45) DEFAULT NULL,
  `y_web` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idYayimci`),
  UNIQUE KEY `y_ad` (`y_ad`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- oyundb.yayimci: ~30 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `yayimci`;
/*!40000 ALTER TABLE `yayimci` DISABLE KEYS */;
INSERT INTO `yayimci` (`idYayimci`, `y_ad`, `y_kurulus`, `y_web`) VALUES
	(2, 'Sony', '7 Mayis 1946', 'sony.net'),
	(3, 'Tencent', '11 Kasim 1998', 'tencent.com'),
	(4, 'Microsoft Game Studios', '2002', 'microsoftstudios.com'),
	(5, 'Nintendo', '23 Eylül 1889', 'nintendo.com'),
	(6, 'Activision Bilizzard', '2008', 'www.activisionblizzard.com'),
	(7, 'Electronic Arts', '27 Mayis 1982', 'ea.com'),
	(8, 'Bandai Namco Games', '5 Temmuz 1950', 'bandainamco.ent'),
	(9, 'King Digital Entertainment', 'Agustos 2003', 'king.com'),
	(10, 'Nexon', '1994', 'http://company.nexon.co.jp/en/'),
	(11, 'Ubisoft', '12 Mart 1986', 'ubisoft.com'),
	(12, 'Telltale Games', '12 Temmuz 2004', 'telltale.com'),
	(13, 'Paradox Interactive', '1999', 'www.paradoxplaza.com'),
	(14, 'Capcom', '30 Mayis 1979', 'www.capcom.com'),
	(15, 'Take-Two Interactive', '1993', 'take2games.com'),
	(16, 'Sega', '1960', 'sega.co.uk'),
	(17, 'Zen Studios', '2003', 'www.zenstudios.com'),
	(18, 'Konami', '21 Mart 1969', 'www.konami.com/en/'),
	(19, 'Warner Bros Interactive Entertainment', '23 Haziran 1993', 'community.wbgames.com'),
	(20, 'Deep Silver', '2002', 'www.deepsilver.com/home/'),
	(21, 'Indie', 'NULL', 'NULL'),
	(22, 'Bethesda Softworks', '1986', 'bethsoft.com'),
	(23, 'Codemasters', '6 Agustos 1986', 'http://www.codemasters.com/'),
	(24, 'Daybreak Game Company', '1998', 'www.daybreakgames.com'),
	(25, 'Valve', '24 Agustos 1996', 'www.valvesoftware.com'),
	(26, '3D Realms', '1987', '3drealms.com'),
	(27, 'Lucas Arts', '1 Mayis 1982', 'lucasfilm.com/games'),
	(28, 'Bohemia Interactive', '1999', 'http://www.bistudio.com/'),
	(29, 'CD Projekt', '1994', 'www.cdprojekt.com/en/'),
	(30, 'Rockstar Games', '1998', 'rockstargames.com'),
	(31, 'Niantic, Inc.', '2010', 'www.nianticlabs.com');
/*!40000 ALTER TABLE `yayimci` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
