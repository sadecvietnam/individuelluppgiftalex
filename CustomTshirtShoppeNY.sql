-- --------------------------------------------------------
-- Värd:                         127.0.0.1
-- Serverversion:                5.6.37 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for CustomTShirtShoppeNY
CREATE DATABASE IF NOT EXISTS `CustomTShirtShoppeNY` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `CustomTShirtShoppeNY`;

-- Dumping structure for view CustomTShirtShoppeNY.2tshirts
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `2tshirts` (
	`id` INT(11) NOT NULL,
	`product_name` CHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`description` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`price` INT(50) NOT NULL,
	`vat percent` INT(100) NOT NULL,
	`text` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`image` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for view CustomTShirtShoppeNY.customs
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `customs` (
	`orderId` INT(11) NOT NULL,
	`userId` INT(11) NOT NULL,
	`productId` INT(11) NOT NULL,
	`productName` CHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`quantity` INT(50) NOT NULL,
	`userName` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`textOnTshirt` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`imageOnTshirt` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for view CustomTShirtShoppeNY.customtshirts
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `customtshirts` (
	`orderId` INT(11) NOT NULL,
	`userId` INT(11) NOT NULL,
	`productId` INT(11) NOT NULL,
	`productName` CHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`quantity` INT(50) NOT NULL,
	`userName` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`textOnTshirt` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`imageOnTshirt` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for tabell CustomTShirtShoppeNY.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL DEFAULT '0',
  `packed` tinyint(4) NOT NULL DEFAULT '0',
  `sent` tinyint(4) NOT NULL DEFAULT '0',
  `delivered` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- Dumpar data för tabell CustomTShirtShoppeNY.orders: ~4 rows (ungefär)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`id`, `userid`, `packed`, `sent`, `delivered`) VALUES
	(21, 6, 1, 0, 0),
	(22, 7, 1, 0, 0),
	(23, 8, 0, 0, 0),
	(24, 9, 0, 0, 0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Dumping structure for tabell CustomTShirtShoppeNY.order_rows
CREATE TABLE IF NOT EXISTS `order_rows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `quantity` int(50) NOT NULL DEFAULT '0',
  `text` varchar(50) NOT NULL DEFAULT '0',
  `image` varchar(50) NOT NULL DEFAULT '0',
  `OkToShare` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `orderid` (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- Dumpar data för tabell CustomTShirtShoppeNY.order_rows: ~4 rows (ungefär)
/*!40000 ALTER TABLE `order_rows` DISABLE KEYS */;
INSERT INTO `order_rows` (`id`, `orderid`, `product_id`, `quantity`, `text`, `image`, `OkToShare`) VALUES
	(21, 21, 1, 50, 'BATMAN', '1jpg', 0),
	(22, 22, 2, 20, 'HULKEN', '2jpg', 1),
	(23, 23, 3, 25, 'SUPERMAN', '3jpg', 0),
	(24, 24, 4, 70, 'HERO', '4jpg', 1);
/*!40000 ALTER TABLE `order_rows` ENABLE KEYS */;

-- Dumping structure for view CustomTShirtShoppeNY.otherlayouts
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `otherlayouts` (
	`textOnTshirt` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`imageOnTshirt` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for tabell CustomTShirtShoppeNY.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` char(50) NOT NULL DEFAULT '0',
  `description` varchar(50) NOT NULL DEFAULT '0',
  `price` int(50) NOT NULL DEFAULT '0',
  `vat percent` int(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumpar data för tabell CustomTShirtShoppeNY.products: ~4 rows (ungefär)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `product_name`, `description`, `price`, `vat percent`) VALUES
	(1, 'Core Cotton T‑shirt', 'All Heather colors, Neon colors, and Ash are cotto', 150, 20),
	(2, 'Champion Premium Fashion Ringer T‑shirt', '5.4 oz., 60/30/10 polyester/cotton/rayon tri-blend', 250, 30),
	(3, 'Augusta Ringer T‑shirt', 'Lightweight blended material, Contrast color sleev', 370, 15),
	(4, 'Bella + Canvas Lightweight Baseball Raglan', '3.6 oz. All colors are a poly/cotton blend', 430, 10);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for view CustomTShirtShoppeNY.tshirts2
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `tshirts2` (
	`id` INT(11) NOT NULL,
	`product_name` CHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`description` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`price` INT(50) NOT NULL,
	`vat percent` INT(100) NOT NULL,
	`text` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`image` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for tabell CustomTShirtShoppeNY.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `email` varchar(50) NOT NULL DEFAULT '0',
  `password` varchar(50) NOT NULL DEFAULT '0',
  `address` varchar(50) NOT NULL DEFAULT '0',
  `postal_code` varchar(10) NOT NULL DEFAULT '0',
  `city` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Dumpar data för tabell CustomTShirtShoppeNY.users: ~0 rows (ungefär)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for view CustomTShirtShoppeNY.2tshirts
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `2tshirts`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `2tshirts` AS select `products`.`id` AS `id`,`products`.`product_name` AS `product_name`,`products`.`description` AS `description`,`products`.`price` AS `price`,`products`.`vat percent` AS `vat percent`,`order_rows`.`text` AS `text`,`order_rows`.`image` AS `image` from (`products` join `order_rows`) where (`products`.`id` = `order_rows`.`product_id`);

-- Dumping structure for view CustomTShirtShoppeNY.customs
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `customs`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `customs` AS select `orders`.`id` AS `orderId`,`users`.`id` AS `userId`,`products`.`id` AS `productId`,`products`.`product_name` AS `productName`,`order_rows`.`quantity` AS `quantity`,`users`.`name` AS `userName`,`order_rows`.`text` AS `textOnTshirt`,`order_rows`.`image` AS `imageOnTshirt` from (((`orders` join `order_rows`) join `users`) join `products`) where ((`orders`.`id` = `order_rows`.`orderid`) and (`users`.`id` = `orders`.`userid`) and (`products`.`id` = `order_rows`.`product_id`)) order by `orders`.`id`,`order_rows`.`id`;

-- Dumping structure for view CustomTShirtShoppeNY.customtshirts
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `customtshirts`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `customtshirts` AS select `orders`.`id` AS `orderId`,`users`.`id` AS `userId`,`products`.`id` AS `productId`,`products`.`product_name` AS `productName`,`order_rows`.`quantity` AS `quantity`,`users`.`name` AS `userName`,`order_rows`.`text` AS `textOnTshirt`,`order_rows`.`image` AS `imageOnTshirt` from (((`orders` join `order_rows`) join `users`) join `products`) where ((`orders`.`id` = `order_rows`.`orderid`) and (`users`.`id` = `orders`.`userid`) and (`products`.`id` = `order_rows`.`product_id`)) order by `orders`.`id`,`order_rows`.`id`;

-- Dumping structure for view CustomTShirtShoppeNY.otherlayouts
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `otherlayouts`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `otherlayouts` AS select distinct `order_rows`.`text` AS `textOnTshirt`,`order_rows`.`image` AS `imageOnTshirt` from `order_rows` where (`order_rows`.`OkToShare` = 1);

-- Dumping structure for view CustomTShirtShoppeNY.tshirts2
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `tshirts2`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tshirts2` AS select `products`.`id` AS `id`,`products`.`product_name` AS `product_name`,`products`.`description` AS `description`,`products`.`price` AS `price`,`products`.`vat percent` AS `vat percent`,`order_rows`.`text` AS `text`,`order_rows`.`image` AS `image` from (`products` join `order_rows`) where (`products`.`id` = `order_rows`.`product_id`);

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
