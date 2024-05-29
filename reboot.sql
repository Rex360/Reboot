
CREATE TABLE IF NOT EXISTS `bank_accounts` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(11) DEFAULT (NULL),
  `account_name` VARCHAR(50) DEFAULT (NULL),
  `account_balance` INT(11) NOT NULL DEFAULT 0,
  `account_type` ENUM('shared','job','gang') NOT NULL,
  `users` LONGTEXT DEFAULT ('[]'),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `account_name` (`account_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `bank_statements` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(11) DEFAULT (NULL),
  `account_name` VARCHAR(50) DEFAULT ('checking'),
  `amount` INT(11) DEFAULT (NULL),
  `reason` VARCHAR(50) DEFAULT (NULL),
  `statement_type` ENUM('deposit','withdraw') DEFAULT (NULL),
  `date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`) USING BTREE,
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `bans` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) DEFAULT (NULL),
  `license` VARCHAR(50) DEFAULT (NULL),
  `discord` VARCHAR(50) DEFAULT (NULL),
  `ip` VARCHAR(50) DEFAULT (NULL),
  `reason` TEXT DEFAULT (NULL),
  `expire` INT(11) DEFAULT (NULL),
  `bannedby` VARCHAR(255) NOT NULL DEFAULT 'LeBanhammer',
  PRIMARY KEY (`id`),
  KEY `license` (`license`),
  KEY `discord` (`discord`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `occasion_vehicles` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `seller` VARCHAR(50) DEFAULT (NULL),
  `price` INT(11) DEFAULT (NULL),
  `description` LONGTEXT DEFAULT (NULL),
  `plate` VARCHAR(50) DEFAULT (NULL),
  `model` VARCHAR(50) DEFAULT (NULL),
  `mods` TEXT DEFAULT (NULL),
  `occasionid` VARCHAR(50) DEFAULT (NULL),
  PRIMARY KEY (`id`),
  KEY `occasionId` (`occasionid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `phone_invoices` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(11) DEFAULT (NULL),
  `amount` INT(11) NOT NULL DEFAULT 0,
  `society` TINYTEXT DEFAULT (NULL),
  `sender` VARCHAR(50) DEFAULT (NULL),
  `sendercitizenid` VARCHAR(50) DEFAULT (NULL),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `phone_gallery` (
   `citizenid` VARCHAR(11) NOT NULL ,
   `image` VARCHAR(255) NOT NULL ,
   `date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP()
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `player_mails` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(11) DEFAULT (NULL),
  `sender` VARCHAR(50) DEFAULT (NULL),
  `subject` VARCHAR(50) DEFAULT (NULL),
  `message` TEXT DEFAULT (NULL),
  `read` TINYINT(4) DEFAULT 0,
  `mailid` INT(11) DEFAULT (NULL),
  `date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  `button` TEXT DEFAULT (NULL),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(11) DEFAULT (NULL),
  `number` VARCHAR(50) DEFAULT (NULL),
  `messages` TEXT DEFAULT (NULL),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `number` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `phone_tweets` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(11) DEFAULT (NULL),
  `firstName` VARCHAR(25) DEFAULT (NULL),
  `lastName` VARCHAR(25) DEFAULT (NULL),
  `message` TEXT DEFAULT (NULL),
  `date` DATETIME DEFAULT CURRENT_TIMESTAMP(),
  `url` TEXT DEFAULT (NULL),
  `picture` VARCHAR(512) DEFAULT './img/default.png',
  `tweetId` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `player_contacts` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(11) DEFAULT (NULL),
  `name` VARCHAR(50) DEFAULT (NULL),
  `number` VARCHAR(50) DEFAULT (NULL),
  `iban` VARCHAR(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `players` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(11) NOT NULL,
  `cid` INT(11) DEFAULT (NULL),
  `license` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `money` TEXT NOT NULL,
  `charinfo` TEXT DEFAULT (NULL),
  `job` TEXT NOT NULL,
  `gang` TEXT DEFAULT (NULL),
  `position` TEXT NOT NULL,
  `metadata` TEXT NOT NULL,
  `inventory` LONGTEXT DEFAULT (NULL),
  `last_updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  PRIMARY KEY (`citizenid`),
  KEY `id` (`id`),
  KEY `last_updated` (`last_updated`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `playerskins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `player_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL DEFAULT '0',
  `model` varchar(50) DEFAULT NULL,
  `props` varchar(1000) DEFAULT NULL,
  `components` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizenid_outfitname_model` (`citizenid`,`outfitname`,`model`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `player_outfit_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `outfitid` int(11) NOT NULL,
  `code` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `FK_player_outfit_codes_player_outfits` (`outfitid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `management_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `minrank` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL DEFAULT 'Cool Outfit',
  `gender` varchar(50) NOT NULL DEFAULT 'male',
  `model` varchar(50) DEFAULT NULL,
  `props` varchar(1000) DEFAULT NULL,
  `components` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `player_vehicles` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `license` VARCHAR(50) DEFAULT (NULL),
  `citizenid` VARCHAR(11) DEFAULT (NULL),
  `vehicle` VARCHAR(50) DEFAULT (NULL),
  `hash` VARCHAR(50) DEFAULT (NULL),
  `mods` LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT (NULL),
  `plate` VARCHAR(8) NOT NULL,
  `fakeplate` VARCHAR(8) DEFAULT (NULL),
  `garage` VARCHAR(50) DEFAULT (NULL),
  `fuel` INT(11) DEFAULT 100,
  `engine` FLOAT DEFAULT 1000,
  `body` FLOAT DEFAULT 1000,
  `state` INT(11) DEFAULT 1,
  `depotprice` INT(11) NOT NULL DEFAULT 0,
  `drivingdistance` INT(50) DEFAULT (NULL),
  `status` TEXT DEFAULT (NULL),
  `balance` INT(11) NOT NULL DEFAULT 0,
  `paymentamount` INT(11) NOT NULL DEFAULT 0,
  `paymentsleft` INT(11) NOT NULL DEFAULT 0,
  `financetime` INT(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `plate` (`plate`),
  KEY `citizenid` (`citizenid`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `player_warns` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `senderIdentifier` VARCHAR(50) DEFAULT (NULL),
  `targetIdentifier` VARCHAR(50) DEFAULT (NULL),
  `reason` TEXT DEFAULT (NULL),
  `warnId` VARCHAR(50) DEFAULT (NULL),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `inventories` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `identifier` VARCHAR(50) NOT NULL,
  `items` LONGTEXT DEFAULT ('[]'),
  PRIMARY KEY (`identifier`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- OX Doorlock
CREATE TABLE IF NOT EXISTS `ox_doorlock` (
  `id` int (11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
  )ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- PS Realtor
DROP table IF EXISTS `properties`;

CREATE TABLE IF NOT EXISTS `properties` (
    `property_id` int(11) NOT NULL AUTO_INCREMENT,
    `owner_citizenid` varchar(50) NULL,
    `street` VARCHAR(100) NULL,
    `region` VARCHAR(100) NULL,
    `description` LONGTEXT NULL,
    `has_access` JSON NULL DEFAULT (JSON_ARRAY()), -- [citizenid1, citizenid2, ...]
    `extra_imgs` JSON NULL DEFAULT (JSON_ARRAY()),
    `furnitures` JSON NULL DEFAULT (JSON_ARRAY()),
    `for_sale` boolean NOT NULL DEFAULT 1,
    `price` int(11) NOT NULL DEFAULT 0,
    `shell` varchar(50) NOT NULL,
    `apartment` varchar(50) NULL DEFAULT NULL, -- if NULL then it's a house
    `door_data` JSON NULL DEFAULT NULL, -- {"x": 0.0, "y": 0.0, "z": 0.0, "h": 0.0, "length": 0.0, "width": 0.0}
    `garage_data` JSON NULL DEFAULT NULL, -- {"x": 0.0, "y": 0.0, "z": 0.0} -- NULL if no garage
    PRIMARY KEY (`property_id`),
    CONSTRAINT `FK_owner_citizenid` FOREIGN KEY (`owner_citizenid`) REFERENCES `players` (`citizenid`) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT `UQ_owner_apartment` UNIQUE (`owner_citizenid`, `apartment`) -- A character can only own one apartment
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- PS - MDT 

CREATE TABLE IF NOT EXISTS `mdt_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` VARCHAR(20) DEFAULT NULL,
  `information` MEDIUMTEXT DEFAULT NULL,
  `tags` TEXT NOT NULL,
  `gallery` TEXT NOT NULL,
  `jobtype` VARCHAR(25) DEFAULT 'police',
  `pfp` TEXT DEFAULT NULL,
  `fingerprint` VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `mdt_bulletin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` TEXT NOT NULL,
  `desc` TEXT NOT NULL,
  `author` varchar(50) NOT NULL,
  `time` varchar(20)  NOT NULL,
  `jobtype` VARCHAR(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `mdt_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `details` LONGTEXT DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `officersinvolved` text DEFAULT NULL,
  `civsinvolved` text DEFAULT NULL,
  `gallery` text DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `mdt_bolos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `individual` varchar(50) DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `gallery` text DEFAULT NULL,
  `officersinvolved` text DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) NOT NULL DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `mdt_convictions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(50) DEFAULT NULL,
  `linkedincident` int(11) NOT NULL DEFAULT 0,
  `warrant` varchar(50) DEFAULT NULL,
  `guilty` varchar(50) DEFAULT NULL,
  `processed` varchar(50) DEFAULT NULL,
  `associated` varchar(50) DEFAULT '0',
  `charges` text DEFAULT NULL,
  `fine` int(11) DEFAULT 0,
  `sentence` int(11) DEFAULT 0,
  `recfine` int(11) DEFAULT 0,
  `recsentence` int(11) DEFAULT 0,
  `time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `mdt_incidents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(50) NOT NULL DEFAULT '0',
  `details` LONGTEXT NOT NULL,
  `tags` text NOT NULL,
  `officersinvolved` text NOT NULL,
  `civsinvolved` text NOT NULL,
  `evidence` text NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) NOT NULL DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `mdt_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `mdt_vehicleinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(50) DEFAULT NULL,
  `information` text NOT NULL DEFAULT '',
  `stolen` tinyint(1) NOT NULL DEFAULT 0,
  `code5` tinyint(1) NOT NULL DEFAULT 0,
  `image` text NOT NULL DEFAULT '',
  `points` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `mdt_weaponinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `information` text NOT NULL DEFAULT '',
  `weapClass` varchar(50) DEFAULT NULL,
  `weapModel` varchar(50) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `serial` (`serial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `mdt_impound` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicleid` int(11) NOT NULL,
  `linkedreport` int(11) NOT NULL,
  `fee` int(11) DEFAULT NULL,
  `time` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `mdt_clocking` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL DEFAULT '',
  `firstname` varchar(255) NOT NULL DEFAULT '',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `clock_in_time` varchar(255) NOT NULL DEFAULT '',
  `clock_out_time` varchar(50) DEFAULT NULL,
  `total_time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- CDN Fuel

CREATE TABLE IF NOT EXISTS `fuel_stations` (
  `location` int(11) DEFAULT NULL,
  `owned` int(11) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT NULL,
  `fuelprice` int(11) DEFAULT NULL,
  `balance` int(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`location`)
) ENGINE=InnoDB;

INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (1, 0, '0', 100000, 3, 0, 'Davis Avenue Ron');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (2, 0, '0', 100000, 3, 0, 'Grove Street LTD');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (3, 0, '0', 100000, 3, 0, 'Dutch London Xero');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (4, 0, '0', 100000, 3, 0, 'Little Seoul LTD');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (5, 0, '0', 100000, 3, 0, 'Strawberry Ave Xero');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (6, 0, '0', 100000, 3, 0, 'Popular Street Ron');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (7, 0, '0', 100000, 3, 0, 'Capital Blvd Ron');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (8, 0, '0', 100000, 3, 0, 'Mirror Park LTD');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (9, 0, '0', 100000, 3, 0, 'Clinton Ave Globe Oil');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (10, 0, '0', 100000, 3, 0, 'North Rockford Ron');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (11, 0, '0', 100000, 3, 0, 'Great Ocean Xero');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (12, 0, '0', 100000, 3, 0, 'Paleto Blvd Xero');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (13, 0, '0', 100000, 3, 0, 'Paleto Ron');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (14, 0, '0', 100000, 3, 0, 'Paleto Globe Oil');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (15, 0, '0', 100000, 3, 0, 'Grapeseed LTD');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (16, 0, '0', 100000, 3, 0, 'Sandy Shores Xero');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (17, 0, '0', 100000, 3, 0, 'Sandy Shores Globe Oil');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (18, 0, '0', 100000, 3, 0, 'Senora Freeway Xero');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (19, 0, '0', 100000, 3, 0, 'Harmony Globe Oil');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (20, 0, '0', 100000, 3, 0, 'Route 68 Globe Oil');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (21, 0, '0', 100000, 3, 0, 'Route 68 Workshop Globe O');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (22, 0, '0', 100000, 3, 0, 'Route 68 Xero');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (23, 0, '0', 100000, 3, 0, 'Route 68 Ron');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (24, 0, '0', 100000, 3, 0, "Rex\'s Diner Globe Oil");
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (25, 0, '0', 100000, 3, 0, 'Palmino Freeway Ron');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (26, 0, '0', 100000, 3, 0, 'North Rockford LTD');
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES (27, 0, '0', 100000, 3, 0, 'Alta Street Globe Oil');