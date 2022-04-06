CREATE DATABASE  IF NOT EXISTS `catastrophic_events` /*!40100 DEFAULT CHARACTER SET
utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `catastrophic_events`;
-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: localhost    Database: catastrophic_events
-- ------------------------------------------------------
-- Server version 8.0.26


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
--
-- Temporary view structure for view `$billion_disasters`
--
DROP TABLE IF EXISTS `$billion_disasters`;
/*!50001 DROP VIEW IF EXISTS `$billion_disasters`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `$billion_disasters` AS SELECT 
 1 AS `event_type`,
 1 AS `instrument_name`,
 1 AS `occurence_date`,
 1 AS `event_city`,
 1 AS `event_state`,
 1 AS `casualties`,
 1 AS `damages`,
 1 AS `affected_areas`*/;
SET character_set_client = @saved_cs_client;
--
-- Temporary view structure for view `avg_cost_by_state`
--
DROP TABLE IF EXISTS `avg_cost_by_state`;
/*!50001 DROP VIEW IF EXISTS `avg_cost_by_state`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `avg_cost_by_state` AS SELECT 
 1 AS `event_state`,
 1 AS `damages`*/;
SET character_set_client = @saved_cs_client;
--
-- Table structure for table `catastrophic_events`
--
DROP TABLE IF EXISTS `catastrophic_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
Keaunna Cleveland
You have some tables that are less than 15/30 for base/linking, but it makes sense given what those tables are (instruments, event_types)
CREATE TABLE `catastrophic_events` (
  `catastrophic_event_id` int NOT NULL AUTO_INCREMENT,
  `event_id` int NOT NULL,
  `occurence_date` date NOT NULL,
  `event_city` varchar(100) NOT NULL,
  `event_state` varchar(10) DEFAULT NULL,
  `casualties` int NOT NULL,
  `damages` bigint DEFAULT NULL,
  `affected_areas` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`catastrophic_event_id`),
  KEY `fk_catastrophic_events_event_types1_idx` (`event_id`),
  CONSTRAINT `fk_catastrophic_events_event_types1` FOREIGN KEY (`event_id`) 
REFERENCES `event_types` (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `catastrophic_events`
--
LOCK TABLES `catastrophic_events` WRITE;
/*!40000 ALTER TABLE `catastrophic_events` DISABLE KEYS */;
INSERT INTO `catastrophic_events` VALUES (10,1,'2010-01-
09','Eureka','CA',35,325000000,'Humbolt County'),(11,1,'2010-04-
04','Baja','CA',237,1150000000,'Imperial County'),(12,1,'2011-08-
23','Mineral','VA',0,250000000,'Louisa County'),(13,1,'2011-11-
06','Prague','OK',2,0,'United States'),(14,1,'2013-01-05','Craig','AK',0,0,'Prince 
of Wales Island'),(15,1,'2014-03-10','Ferndale','CA',0,0,'Northern CA'),
(16,1,'2014-03-29','Brea','CA',0,108000000,'Southern CA'),(17,1,'2014-08-24','San 
Fransisco','CA',200,681000000,'Bay Area'),(18,1,'2016-01-
24','Iliamna','AK',0,15000000,'Cook Inlet region'),(19,1,'2018-11-
30','Anchorage','AK',117,30000000,'South Central AK'),(20,1,'2019-07-
04','Ridgecrest','CA',26,5300000000,'Kern County'),(21,1,'2020-03-18','Salt Lake 
City','UT',0,630000000,'Salth Lake Valley'),(22,1,'2020-08-
09','Sparta','NC',1,300000,'Alleghany County'),(23,1,'2021-07-
29','Perryville','AK',0,0,'Alaska Peninsula'),(24,1,'2021-07-
08','Coleville','CA',0,312000,'Southwest US'),(25,3,'2012-01-
22','Birmingham','AL',2,400000000,'Southern US'),(26,3,'2012-02-
28','Harrisburg','IL',15,300000000,'Great Plains'),(27,3,'2013-02-
10','Hattiesburg','MS',0,250000000,'Midwest'),(28,3,'2013-04-
07','Hazelwood','MO',1,330000000,'Midwest'),(29,3,'2014-04-
25','Washington','NC',1,340000000,'North Carolina'),(30,3,'2014-04-
27','Mayflower','AR',35,410000000,'Dixie Alley'),(31,3,'2015-04-
08','Rochelle','IL',2,380000000,'Midwestern US'),(32,3,'2015-05-05','Bridge 
Creek','OK',5,200000000,'Great Plains'),(33,3,'2016-02-
23','Laplace','LA',7,190000000,'Southern US'),(34,3,'2016-05-
07','Wray','CO',2,225000000,'Western US'),(35,3,'2017-02-
07','Killian','LA',1,500000000,'Southeastern US'),(36,3,'2017-02-
28','Washburn','IL',4,310000000,'Midwestern US'),(37,3,'2018-04-
03','Mountainburg','AK',1,290000000,'Southern US'),(38,3,'2019-03-
03','Beauregard','AL',23,275000000,'Southeastern US'),(39,3,'2020-01-
10','Haughton','LA',7,260000000,'South Central US'),(40,5,'2014-05-
04','Southeastern','HI',0,800000000,'Western US'),(41,5,'2014-05-18','Skamania 
County','WA',57,1000000000,'Western US'),(42,5,'2015-06-
02','Tacoma','WA',23000,6000000000,'Western US'),(43,5,'2015-04-15','Hawaiin 
Islands','HI',10000,7000000,'Western US'),(44,5,'2016-09-21','Mount 
Hood','OR',120,13000000,'Western US'),(45,5,'2016-08-06','Long Valley 
Caldera','CA',0,0,'Western US'),(46,5,'2017-09-21','Mount St. 
Helens','WA',5,100000000,'Western US'),(47,5,'2017-03-22','Mount 
Akutan','AK',0,160000000,'Alaska '),(48,5,'2018-09-17','Bogoslof 
Island','AK',0,0,'Alaska'),(49,5,'2018-03-27','Mauna 
Loa','HI',2500,12000000,'Western US'),(50,5,'2019-02-17','Mount 
Shasta','CA',1200,18000000,'Western US'),(51,5,'2019-10-15','Gorda 
Ridge','OR',250,22000000,'Western US'),(52,5,'2020-06-21','Loihi 
Seamount','HI',152,5000000,'Western US'),(53,5,'2020-12-
30','Kilauea','HI',53,126554,'Western US'),(54,5,'2021-03-06','Mount 
Augustine','AK',12,8000000,'Southern Alaska'),(55,2,'2017-08-16','San Jose 
Island','TX',68,1250000000,'Southeastern US'),(56,2,'2018-08-31','Wrightsville 
Beach','NC',24,2400000000,'Eastern US'),(57,2,'2018-10-07','Panama 
City','FL',31,2500000000,'Southeastern US'),(58,2,'2017-08-30','Marco 
Island','FL',52,7700000000,'Southeastern US'),(59,2,'2017-09-16','St. 
Thomas','USVI',3059,9100000000,'US Virgin Islands'),(60,2,'2017-10-
04','Bootheville-Venice','LA',48,787000000,'Southeastern US'),(61,2,'2016-09-
28','McClellanville','SC',603,1600000000,'Southeastern US'),(62,2,'2021-08-
26','Port Fourchon','LA',115,6525000000,'Eastern US'),(63,2,'2015-08-
24','Cocodrie','LA',9,4400000000,'Southeastern US'),(64,2,'2020-09-11','Gulf 
Shores','AL',4,7300000000,'Southeastern US'),(65,2,'2013-09-12','Corpus 
Christi','TX',32,1500000000,'Southern US'),(66,2,'2012-10-22','Atlantic 
City','NJ',233,6870000000,'Eastern US'),(67,2,'2011-08-21','Cape 
Lookout','NC',49,1400000000,'Eastern US'),(68,2,'2018-07-06','Port 
Arthur','TX',1,0,'Eastern US'),(69,2,'2010-09-01','Galveston 
Island','TX',214,3800000000,'Southern US'),(70,4,'2010-01-19','Virgin 
Islands','USVI',2000,1200000000,'Virgin Islands'),(71,4,'2017-03-17','New 
Orleans','LA',1475,5000000000,'Southeast US'),(72,4,'2012-07-09','Galveston 
','TX',1100,893000000,'Southeast TX'),(73,4,'2012-06-27','Santa 
Barbara','CA',700,1000000000,'Northwest LA'),(74,4,'2015-05-
21','Honolulu','HI',1000,2700000000,'Southeast HI'),(75,4,'2020-04-28','Bethel 
Census ','AK',10,20000000,'Bethel Census Area'),(76,4,'2010-01-04','Halepuaa 
Ahupua','HI',200,117000000,'Southern Cook Islands'),(77,4,'2019-08-15','Hilo 
Bay','HI',2100,800000000,'northeastern, HI'),(78,4,'2019-08-
29','Kahului','HI',2700,5200000000,'Maui County'),(79,4,'2020-09-
01','Oxnard','CA',1200,6000000000,'Ventura County'),(80,4,'2014-12-14','Santa 
Cruz','CA',819,1880000000,'Santa Cruz Mountains'),(81,4,'2018-10-
29','Carlsbad','CA',749,1210000000,'Southwest CA'),(82,4,'2013-07-29','Carmel 
Highlands','CA',200,990000000,'Midwest CA'),(83,4,'2016-11-
20','Miami','FL',1300,4500000000,'Southern US'),(84,4,'2017-09-
11','Naples','FL',900,3700000000,'Southwest FL'),(85,4,'2011-02-14','New 
Orleans','LA',1000,6200000000,'Southeast US');
/*!40000 ALTER TABLE `catastrophic_events` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `catastrophic_events_instruments`
--
DROP TABLE IF EXISTS `catastrophic_events_instruments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catastrophic_events_instruments` (
  `instruments_id` int NOT NULL,
  `catastrophic_event_id` int NOT NULL,
  KEY `fk_instruments_has_catastrophic_events_catastrophic_events1_idx` 
(`catastrophic_event_id`),
  KEY `fk_instruments_has_catastrophic_events_instruments1_idx` (`instruments_id`),
  CONSTRAINT `fk_instruments_has_catastrophic_events_catastrophic_events1` FOREIGN 
KEY (`catastrophic_event_id`) REFERENCES `catastrophic_events` 
(`catastrophic_event_id`),
  CONSTRAINT `fk_instruments_has_catastrophic_events_instruments1` FOREIGN KEY 
(`instruments_id`) REFERENCES `instruments` (`instruments_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `catastrophic_events_instruments`
--
LOCK TABLES `catastrophic_events_instruments` WRITE;
/*!40000 ALTER TABLE `catastrophic_events_instruments` DISABLE KEYS */;
INSERT INTO `catastrophic_events_instruments` VALUES (1,10),(1,11),(1,12),(1,13),
(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),
(2,25),(2,26),(2,27),(2,28),(2,29),(2,30),(2,31),(2,32),(2,33),(2,34),(2,35),
(2,36),(2,37),(2,38),(2,39),(3,40),(3,41),(3,42),(3,43),(3,44),(3,45),(3,46),
(3,47),(3,48),(3,49),(3,50),(3,51),(3,52),(3,53),(3,54),(4,55),(4,56),(4,57),
(4,58),(4,59),(4,60),(4,61),(4,62),(4,63),(4,64),(4,65),(4,66),(4,67),(4,68),
(4,69),(5,70),(5,71),(5,72),(5,73),(5,74),(5,75),(5,76),(5,77),(5,78),(5,79),
(5,80),(5,81),(5,82),(5,83),(5,84),(5,85);
/*!40000 ALTER TABLE `catastrophic_events_instruments` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `earthquakes`
--
DROP TABLE IF EXISTS `earthquakes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `earthquakes` (
  `earthquake_id` int NOT NULL AUTO_INCREMENT,
  `magnitude` decimal(5,2) NOT NULL,
  `catastrophic_event_id` int NOT NULL,
  PRIMARY KEY (`earthquake_id`),
  KEY `fk_earthquakes_catastrophic_events1_idx` (`catastrophic_event_id`),
  CONSTRAINT `fk_earthquakes_catastrophic_events1` FOREIGN KEY 
(`catastrophic_event_id`) REFERENCES `catastrophic_events` 
(`catastrophic_event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `earthquakes`
--
LOCK TABLES `earthquakes` WRITE;
/*!40000 ALTER TABLE `earthquakes` DISABLE KEYS */;
INSERT INTO `earthquakes` VALUES (1,6.50,10),(2,5.40,11),(3,5.80,12),(4,5.70,13),
(5,7.50,14),(6,6.80,15),(7,5.10,16),(8,6.00,17),(9,7.10,18),(10,7.10,19),
(11,7.10,20),(12,5.70,21),(13,5.10,22),(14,8.20,23),(15,6.00,24);
/*!40000 ALTER TABLE `earthquakes` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `event_types`
--
DROP TABLE IF EXISTS `event_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_types` (
  `event_id` int NOT NULL AUTO_INCREMENT,
  `event_type` varchar(45) NOT NULL,
  `event_desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `event_types`
--
LOCK TABLES `event_types` WRITE;
/*!40000 ALTER TABLE `event_types` DISABLE KEYS */;
INSERT INTO `event_types` VALUES (1,'earthquakes','shaking of earth resulting from 
rubbing of tectonic plates'),(2,'hurricanes','Large storm swirls with destructive 
windspeeds and heavy rains '),(3,'tornadoes','A violently rotating column of air 
touching the ground, usually attached to the base of a thunderstorm'),
(4,'tsunamis','huge waves caused by either an underwater earthquake or volcanic 
eruption'),(5,'volcanoes','eruption of volcanic mountain that can release lava, hot
ash,  cinders, and gas');
/*!40000 ALTER TABLE `event_types` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Temporary view structure for view `high_casualty`
--
DROP TABLE IF EXISTS `high_casualty`;
/*!50001 DROP VIEW IF EXISTS `high_casualty`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `high_casualty` AS SELECT 
 1 AS `event_type`,
 1 AS `occurence_date`,
 1 AS `location`,
 1 AS `casualties`*/;
SET character_set_client = @saved_cs_client;
--
-- Table structure for table `hurricanes`
--
DROP TABLE IF EXISTS `hurricanes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hurricanes` (
  `hurricane_id` int NOT NULL AUTO_INCREMENT,
  `hurricane_name` varchar(45) NOT NULL,
  `category` varchar(45) DEFAULT NULL,
  `rainfall` varchar(45) DEFAULT NULL,
  `windspeed` varchar(45) DEFAULT NULL,
  `catastrophic_event_id` int NOT NULL,
  PRIMARY KEY (`hurricane_id`),
  KEY `fk_hurricanes_catastrophic_events1_idx` (`catastrophic_event_id`),
  CONSTRAINT `fk_hurricanes_catastrophic_events1` FOREIGN KEY 
(`catastrophic_event_id`) REFERENCES `catastrophic_events` 
(`catastrophic_event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `hurricanes`
--
LOCK TABLES `hurricanes` WRITE;
/*!40000 ALTER TABLE `hurricanes` DISABLE KEYS */;
INSERT INTO `hurricanes` VALUES (1,'Harvey','4','132','60.58',55),
(2,'Florence','4','132','35.93',56),(3,'Michael','5','161','9.62',57),
(4,'Irma','5','178','15',58),(5,'Maria','5','173','40.5',59),
(6,'Nate','1','92','7',60),(7,'Matthew','4','155','20',61),
(8,'Ida','4','150','8.41',62),(9,'Zeta','3','115','8.8',63),
(10,'Sally','2','110','30',64),(11,'Ingrid','1','86','20.1',65),
(12,'Sandy','3','115','8.03',66),(13,'Irene','3','121','15.66',67),
(14,'Chris','2','90','16',68),(15,'Ike','4','145','10',69);
/*!40000 ALTER TABLE `hurricanes` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `instruments`
--
DROP TABLE IF EXISTS `instruments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instruments` (
  `instruments_id` int NOT NULL AUTO_INCREMENT,
  `instrument_name` varchar(45) DEFAULT NULL,
  `instrument_desc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`instruments_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `instruments`
--
LOCK TABLES `instruments` WRITE;
/*!40000 ALTER TABLE `instruments` DISABLE KEYS */;
INSERT INTO `instruments` VALUES (1,'Seismograph','used to record seismic waves'),
(2,'Fujita Scale','used to measure intensity of of tornadoes'),
(3,'Tiltmeters','measures deformation at ground level which predicts volcanic 
activity'),(4,'Saffir-Simpson Scale','used to categorize hurricanes according to 
sustained wind strength'),(5,'Deep-ocean detection buoys','used to confirm tsunami 
waves casues by undersea quakes');
/*!40000 ALTER TABLE `instruments` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Temporary view structure for view `low_damage`
--
DROP TABLE IF EXISTS `low_damage`;
/*!50001 DROP VIEW IF EXISTS `low_damage`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `low_damage` AS SELECT 
 1 AS `event_type`,
 1 AS `occurence_date`,
 1 AS `event_city`,
 1 AS `event_state`,
 1 AS `damages`*/;
SET character_set_client = @saved_cs_client;
--
-- Temporary view structure for view `max_caus_by_event`
--
DROP TABLE IF EXISTS `max_caus_by_event`;
/*!50001 DROP VIEW IF EXISTS `max_caus_by_event`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `max_caus_by_event` AS SELECT 
 1 AS `event_type`,
 1 AS `casualties`*/;
SET character_set_client = @saved_cs_client;
--
-- Table structure for table `tornadoes`
--
DROP TABLE IF EXISTS `tornadoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tornadoes` (
  `tornado_id` int NOT NULL AUTO_INCREMENT,
  `EF_rating` int DEFAULT NULL,
  `windspeed` varchar(45) DEFAULT NULL,
  `catastrophic_event_id` int NOT NULL,
  PRIMARY KEY (`tornado_id`),
  KEY `fk_tornadoes_catastrophic_events1_idx` (`catastrophic_event_id`),
  CONSTRAINT `fk_tornadoes_catastrophic_events1` FOREIGN KEY 
(`catastrophic_event_id`) REFERENCES `catastrophic_events` 
(`catastrophic_event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `tornadoes`
--
LOCK TABLES `tornadoes` WRITE;
/*!40000 ALTER TABLE `tornadoes` DISABLE KEYS */;
INSERT INTO `tornadoes` VALUES (1,3,'158',25),(2,4,'206',26),(3,4,'200',27),
(4,2,'167',28),(5,3,'178',29),(6,4,'145',30),(7,4,'201',31),(8,3,'203',32),
(9,2,'192',33),(10,2,'155',34),(11,2,'170',35),(12,3,'176',36),(13,2,'160',37),
(14,4,'184',38),(15,2,'155',39);
/*!40000 ALTER TABLE `tornadoes` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `tsunamis`
--
DROP TABLE IF EXISTS `tsunamis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tsunamis` (
  `tsunamis_id` int NOT NULL AUTO_INCREMENT,
  `size(meters)` float NOT NULL,
  `catastrophic_event_id` int NOT NULL,
  PRIMARY KEY (`tsunamis_id`),
  KEY `fk_tsunamis_catastrophic_events1_idx` (`catastrophic_event_id`),
  CONSTRAINT `fk_tsunamis_catastrophic_events1` FOREIGN KEY 
(`catastrophic_event_id`) REFERENCES `catastrophic_events` 
(`catastrophic_event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `tsunamis`
--
LOCK TABLES `tsunamis` WRITE;
/*!40000 ALTER TABLE `tsunamis` DISABLE KEYS */;
INSERT INTO `tsunamis` VALUES (1,2.7,70),(2,3.2,71),(3,3.1,72),(4,3.5,73),
(5,4.2,74),(6,1.8,75),(7,3.3,76),(8,4.4,77),(9,5,78),(10,2.2,79),(11,3.1,80),
(12,1.1,81),(13,4.1,82),(14,3.8,83),(15,4.8,84);
/*!40000 ALTER TABLE `tsunamis` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `volcanoes`
--
DROP TABLE IF EXISTS `volcanoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volcanoes` (
  `volcano_id` int NOT NULL AUTO_INCREMENT,
  `VEI_rating` int DEFAULT NULL,
  `catastrophic_event_id` int NOT NULL,
  PRIMARY KEY (`volcano_id`),
  KEY `fk_volcanoes_catastrophic_events1_idx` (`catastrophic_event_id`),
  CONSTRAINT `fk_volcanoes_catastrophic_events1` FOREIGN KEY 
(`catastrophic_event_id`) REFERENCES `catastrophic_events` 
(`catastrophic_event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `volcanoes`
--
LOCK TABLES `volcanoes` WRITE;
/*!40000 ALTER TABLE `volcanoes` DISABLE KEYS */;
INSERT INTO `volcanoes` VALUES (1,4,40),(2,3,41),(3,2,42),(4,5,43),(5,4,44),
(6,4,45),(7,3,46),(8,2,47),(9,4,48),(10,5,49),(11,3,50),(12,3,51),(13,2,52),
(14,2,53),(15,6,54);
/*!40000 ALTER TABLE `volcanoes` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Dumping routines for database 'catastrophic_events'
--
--
-- Final view structure for view `$billion_disasters`
--
/*!50001 DROP VIEW IF EXISTS `$billion_disasters`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `$billion_disasters` AS select `event_types`.`event_type` AS 
`event_type`,`instruments`.`instrument_name` AS 
`instrument_name`,`catastrophic_events`.`occurence_date` AS 
`occurence_date`,`catastrophic_events`.`event_city` AS 
`event_city`,`catastrophic_events`.`event_state` AS 
`event_state`,`catastrophic_events`.`casualties` AS 
`casualties`,concat('$',convert(format(`catastrophic_events`.`damages`,0) using 
utf8mb4)) AS `damages`,`catastrophic_events`.`affected_areas` AS `affected_areas` 
from (((`catastrophic_events` join `catastrophic_events_instruments` 
on((`catastrophic_events`.`catastrophic_event_id` = 
`catastrophic_events_instruments`.`catastrophic_event_id`))) join `instruments` 
on((`catastrophic_events_instruments`.`instruments_id` = 
`instruments`.`instruments_id`))) join `event_types` 
on((`catastrophic_events`.`event_id` = `event_types`.`event_id`))) where 
`catastrophic_events`.`damages` in (select `catastrophic_events`.`damages` from 
`catastrophic_events` where (`catastrophic_events`.`damages` >= 1000000000)) order 
by concat('$',convert(format(`catastrophic_events`.`damages`,0) using utf8mb4)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
--
-- Final view structure for view `avg_cost_by_state`
--
/*!50001 DROP VIEW IF EXISTS `avg_cost_by_state`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `avg_cost_by_state` AS select `catastrophic_events`.`event_state` AS 
`event_state`,concat('$',convert(format(avg(`catastrophic_events`.`damages`),0) 
using utf8mb4)) AS `damages` from (`catastrophic_events` join `event_types` `e` 
on((`catastrophic_events`.`event_id` = `e`.`event_id`))) group by 
`catastrophic_events`.`event_state` order by avg(`catastrophic_events`.`damages`) 
*/;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
--
-- Final view structure for view `high_casualty`
--
/*!50001 DROP VIEW IF EXISTS `high_casualty`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `high_casualty` AS select `e`.`event_type` AS 
`event_type`,`catastrophic_events`.`occurence_date` AS 
`occurence_date`,concat(`catastrophic_events`.`event_city`,', 
',`catastrophic_events`.`event_state`) AS 
`location`,`catastrophic_events`.`casualties` AS `casualties` from 
(`catastrophic_events` join `event_types` `e` on((`catastrophic_events`.`event_id` 
= `e`.`event_id`))) where (`catastrophic_events`.`casualties` > 1000) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
--
-- Final view structure for view `low_damage`
--
/*!50001 DROP VIEW IF EXISTS `low_damage`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `low_damage` AS select `e`.`event_type` AS 
`event_type`,`catastrophic_events`.`occurence_date` AS 
`occurence_date`,`catastrophic_events`.`event_city` AS 
`event_city`,`catastrophic_events`.`event_state` AS 
`event_state`,`catastrophic_events`.`damages` AS `damages` from 
(`catastrophic_events` join `event_types` `e` on((`catastrophic_events`.`event_id` 
= `e`.`event_id`))) where (`catastrophic_events`.`damages` < 1000000) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
--
-- Final view structure for view `max_caus_by_event`
--
/*!50001 DROP VIEW IF EXISTS `max_caus_by_event`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `max_caus_by_event` AS select `e`.`event_type` AS 
`event_type`,max(`catastrophic_events`.`casualties`) AS `casualties` from 
(`catastrophic_events` join `event_types` `e` on((`catastrophic_events`.`event_id` 
= `e`.`event_id`))) group by `e`.`event_type` order by `casualties` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
-- Dump completed on 2021-12-13 15:53:27
