CREATE DATABASE `bankdatabase` /*!40100 DEFAULT CHARACTER SET utf8 */;
CREATE TABLE `account` (
  `AccountNo` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) NOT NULL,
  `MiddleName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `Contact` bigint(20) NOT NULL,
  `SSN` varchar(45) NOT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Address` varchar(100) NOT NULL,
  `Gender` varchar(6) NOT NULL,
  `State` varchar(20) NOT NULL,
  `Username` varchar(45) NOT NULL,
  `virtualcardyn` varchar(1) NOT NULL DEFAULT 'N',
  `accountbalance` double(10,2) NOT NULL DEFAULT '100.00',
  PRIMARY KEY (`AccountNo`)
) ENGINE=InnoDB AUTO_INCREMENT=100001 DEFAULT CHARSET=utf8;
CREATE TABLE `carddetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creditcardnumber` bigint(16) NOT NULL,
  `cvvnumber` int(11) NOT NULL,
  `nameoncard` varchar(45) NOT NULL,
  `expiry` varchar(45) NOT NULL,
  `alias` varchar(45) NOT NULL,
  `cardtype` varchar(20) NOT NULL,
  `accountno` int(11) NOT NULL,
  PRIMARY KEY (`id`,`creditcardnumber`),
  UNIQUE KEY `creditcardnumber_UNIQUE` (`creditcardnumber`),
  KEY `AccountNo_idx` (`accountno`),
  CONSTRAINT `AccountNo` FOREIGN KEY (`accountno`) REFERENCES `account` (`AccountNo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
CREATE TABLE `login` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `no_of_attempts` int(11) NOT NULL DEFAULT '5',
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `updated_by` varchar(20) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `active_yn` char(1) NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `password_UNIQUE` (`password`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
CREATE TABLE `payee` (
  `PayeeId` int(11) NOT NULL AUTO_INCREMENT,
  `PayeeName` varchar(45) NOT NULL,
  `PayeeAccountNo` int(11) NOT NULL,
  `PayeeNickName` varchar(45) DEFAULT NULL,
  `PayeeContactNo` bigint(10) NOT NULL,
  `PayerAccountNo` int(11) NOT NULL,
  PRIMARY KEY (`PayeeId`),
  KEY `PayerAccountNo_idx` (`PayerAccountNo`),
  CONSTRAINT `PayerAccountNo` FOREIGN KEY (`PayerAccountNo`) REFERENCES `account` (`AccountNo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
CREATE TABLE `rates` (
  `CcyPairID` int(11) NOT NULL AUTO_INCREMENT,
  `CcyPair` varchar(45) NOT NULL,
  `CcyPairBidRate` varchar(20) NOT NULL,
  `CcyPairAskRate` varchar(20) NOT NULL,
  PRIMARY KEY (`CcyPairID`),
  UNIQUE KEY `CcyPair_UNIQUE` (`CcyPair`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
CREATE TABLE `virtualcards` (
  `card_id` int(11) NOT NULL AUTO_INCREMENT,
  `virtualcard1` int(4) NOT NULL,
  `virtualcard2` int(4) NOT NULL,
  `virtualcard3` int(4) NOT NULL,
  `virtualcard4` int(4) NOT NULL,
  `cvv` int(3) NOT NULL,
  `expirymonth` int(2) NOT NULL,
  `expiryyear` int(2) NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `AccNo` int(11) NOT NULL,
  `balance` double(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`card_id`),
  KEY `accountNo_idx` (`AccNo`),
  CONSTRAINT `AccNo` FOREIGN KEY (`AccNo`) REFERENCES `account` (`AccountNo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
CREATE TABLE `bankdatabase`.`transactions` (
  `transactionid` INT(11) NOT NULL AUTO_INCREMENT,
  `transactionfrom` VARCHAR(45) NOT NULL,
  `transactionto` VARCHAR(45) NULL DEFAULT 'VIRTUAL CARD/ FOREX',
  `fromaccountno` INT(11) NOT NULL,
  `toaccountno` INT(11) NULL,
  `transactionamount` DOUBLE(10,2) NOT NULL,
  `transactiontime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`transactionid`))
ENGINE = InnoDB
AUTO_INCREMENT = 1000000;
