CREATE DATABASE `article` /*!40100 DEFAULT CHARACTER SET latin1 */;

DROP TABLE IF EXISTS `article`.`article`;
CREATE TABLE  `article`.`article` (
  `ArticleId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(200) NOT NULL,
  `Teaser` varchar(200) DEFAULT NULL,
  `BodyContent` text,
  PRIMARY KEY (`ArticleId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `article`.`user`;
CREATE TABLE  `article`.`user` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserName` varchar(50) NOT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `Access` varchar(45) NOT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Email` varchar(45) NOT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `Pincode` varchar(10) DEFAULT NULL,
  `Active` tinyint(1) NOT NULL,
  `Dob` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

CREATE TABLE `article`.`Articlefile` ( `ArticleFileId` INT(10) NOT NULL AUTO_INCREMENT, `fileName` VARCHAR(200) NOT NULL, `fileDescription` VARCHAR(200), `fileType` VARCHAR(20), `fileSize` INT(20), `domain` VARCHAR(100), `filePath` VARCHAR(200), `fileUrl` VARCHAR(200), PRIMARY KEY (`ArticleFileId`) ); 
