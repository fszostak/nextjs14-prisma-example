# ************************************************************
# Host: 127.0.0.1 (MySQL 5.7.44)
# Database: prisma
# Generation Time: 2024-02-03 10:53:34 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table Post
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Post`;

CREATE TABLE `Post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `content` text,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `authorId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `authorId` (`authorId`),
  CONSTRAINT `Post_ibfk_1` FOREIGN KEY (`authorId`) REFERENCES `User` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

LOCK TABLES `Post` WRITE;
/*!40000 ALTER TABLE `Post` DISABLE KEYS */;

INSERT INTO `Post` (`id`, `title`, `createdAt`, `content`, `published`, `authorId`)
VALUES
	(1,'Title','2024-02-03 09:27:10','Ypsum lorem',0,1),
	(2,'Titulo','2024-02-03 10:05:19','Content',0,1),
	(3,'Titulo','2024-02-03 10:11:22','Content',0,1),
	(4,'Titulo','2024-02-03 10:11:30','Content',0,1),
	(5,'Titulo','2024-02-03 10:11:52','Content',0,1),
	(6,'Titulo','2024-02-03 10:36:40','Content',0,1);

/*!40000 ALTER TABLE `Post` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Profile
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Profile`;

CREATE TABLE `Profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bio` text,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userId` (`userId`),
  CONSTRAINT `Profile_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `User` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `Profile` WRITE;
/*!40000 ALTER TABLE `Profile` DISABLE KEYS */;

INSERT INTO `Profile` (`id`, `bio`, `userId`)
VALUES
	(1,'Master Profile',1);

/*!40000 ALTER TABLE `Profile` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table User
# ------------------------------------------------------------

DROP TABLE IF EXISTS `User`;

CREATE TABLE `User` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;

INSERT INTO `User` (`id`, `name`, `email`)
VALUES
	(1,'Master User','master@user.com');

/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
