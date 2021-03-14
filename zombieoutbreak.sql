CREATE TABLE `users` (
	`ID` INT NOT NULL AUTO_INCREMENT,
	`Identifier` VARCHAR(50) NOT NULL,
	`Nickname` TINYTEXT NULL DEFAULT NULL,
	`Name` TINYTEXT NULL DEFAULT NULL,
	`Date Of Birth` VARCHAR(10) NULL DEFAULT NULL,
	`Sex` VARCHAR(12) NULL DEFAULT NULL,
	`Level` INT(11) NOT NULL DEFAULT '1',
	`Occupation` VARCHAR(50) NULL DEFAULT NULL,
	`Skills` LONGTEXT NULL DEFAULT NULL,
	`Group` VARCHAR(50) NULL DEFAULT NULL,
	`Faction` VARCHAR(50) NULL DEFAULT NULL,
	`Money` LONGTEXT NULL DEFAULT NULL,
	`Inventory` LONGTEXT NOT NULL DEFAULT '{}',
	`Skin` LONGTEXT NULL DEFAULT NULL,
	`Position` LONGTEXT NULL DEFAULT NULL,

	PRIMARY KEY (`ID`)
);

CREATE TABLE `items` (
	`Name` VARCHAR(50) NOT NULL,
	`Label` VARCHAR(50) NOT NULL,
	`Description` TEXT(65535) NULL DEFAULT 'No Description.',
	`Weight` FLOAT(12) NOT NULL DEFAULT '0',
	`Limit` INT(11) NOT NULL DEFAULT '1',

	PRIMARY KEY (`Name`)
);

CREATE TABLE `clothes` (
	`Name` VARCHAR(50) NOT NULL,
	`Label` VARCHAR(50) NOT NULL,
	`Description` TEXT(65535) NOT NULL DEFAULT 'No description.',
	`Weight` FLOAT(12) NOT NULL DEFAULT '0',
	`Limit` INT(11) NOT NULL DEFAULT '1',

	PRIMARY KEY (`Name`)
);

INSERT INTO `clothes` VALUES
	('unemployedtshirt', 'Unemployed T-shirt', 'No description.', 0.2, 1),
	('unemployedpants', 'Unemployed Pants', 'No description.', 0.4, 1),
	('unemployedshoes', 'Unemployed Shoes', 'No description.', 0.3, 1),
	('policehat', 'Police Hat', 'No description.', 0.1, 1),
	('policetshirt', 'Police T-shirt', 'No description.', 0.3, 1),
	('policepants', 'Police Pants', 'No description.', 0.4, 1),
	('policeshoes', 'Police Shoes', 'No description.', 0.3, 1),
	('paramedichat', 'Paramedic Hat', 'No description.', 0.1, 1),
	('paramedictshirt', 'Paramedic T-shirt', 'No description.', 0.2, 1),
	('paramedicpants', 'Paramedic Pants', 'No description.', 0.4, 1),
	('paramedicshoes', 'Paramedic Shoes', 'No description.', 0.3, 1)
;

CREATE TABLE `weapons` (
	`Name` VARCHAR(50) NOT NULL,
	`Label` VARCHAR(50) NOT NULL,
	`Description` TEXT(65535) NOT NULL DEFAULT 'No description.',
	`Weight` FLOAT(12) NOT NULL DEFAULT '0',
	
	PRIMARY KEY (`Name`)
);