CREATE TABLE `contacts` (
  `id` varchar(40) NOT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `ContactId` varchar(45) DEFAULT NULL,
  `Account` varchar(45) DEFAULT NULL,
  `AccountId` varchar(45) DEFAULT NULL,
  `LastUpdated` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Created` TIMESTAMP DEFAULT '1970-01-01 00:00:01',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;