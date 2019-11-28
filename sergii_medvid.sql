-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: CherkasyElektroTrans
-- ------------------------------------------------------
-- Server version	5.7.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `employee_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Employee ID',
  `first_name` varchar(127) NOT NULL COMMENT 'First Name of Employee',
  `last_name` varchar(127) NOT NULL COMMENT 'Last Name of Employee',
  `dob` date DEFAULT NULL COMMENT 'Date of Birth of Employee',
  `current_salary` decimal(10,2) DEFAULT NULL COMMENT 'Current Salary of Employee',
  `position_id` int(10) unsigned NOT NULL COMMENT 'Current Position of Employee',
  `hire_date` date NOT NULL COMMENT 'Date of Employee Hired',
  `fire_date` date DEFAULT NULL COMMENT 'Date of Employee Fired',
  PRIMARY KEY (`employee_id`),
  KEY `EMPLOYEE_POSITION_ID_POSITION_POSITION_ID` (`position_id`),
  CONSTRAINT `EMPLOYEE_POSITION_ID_POSITION_POSITION_ID` FOREIGN KEY (`position_id`) REFERENCES `position` (`position_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='Employee';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Alex','Buk','1978-10-15',20000.00,3,'2001-01-02',NULL),(2,'Marina','Buk','1985-01-15',15000.25,1,'2010-10-02',NULL),(3,'Alice','Jolud','1990-08-05',12500.00,1,'2008-11-22','2010-10-01'),(4,'Alex','Bondar','1987-09-16',13000.00,2,'2007-04-02','2010-10-01'),(5,'Elena','Buk','1968-07-05',15000.25,1,'2001-10-07',NULL),(6,'Max','Shilo','1987-09-16',12500.00,4,'2005-10-07',NULL),(7,'Valentina','Nemiroff','1985-10-15',12500.00,4,'2005-10-07',NULL),(8,'Stanislav','Urich','1978-10-18',13000.00,4,'2009-03-07',NULL),(9,'Valentina','Smirnoff','1969-09-10',13500.25,4,'2000-02-07','2018-11-07'),(10,'Stanislav','Urich','1978-10-18',13000.00,4,'2009-03-07',NULL),(11,'Vadim','Urich','1988-07-01',11705.50,5,'2007-04-07',NULL),(12,'Ekaterina','Dub','1987-05-05',9705.50,6,'2005-05-05',NULL),(13,'Maria','Golub','1990-04-01',9885.50,6,'2007-07-01',NULL),(14,'Leonid','Zhukovsy',NULL,11856.00,7,'2007-07-01',NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `income`
--

DROP TABLE IF EXISTS `income`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `income` (
  `date` date NOT NULL COMMENT 'Date of Work',
  `transport_id` int(10) unsigned NOT NULL COMMENT 'Transport ID',
  `employee_id` int(10) unsigned NOT NULL COMMENT 'Employee ID',
  `income` decimal(10,2) NOT NULL COMMENT 'Total Income for Working Day',
  KEY `INCOME_EMPLOYEE_ID_EMPLOYEE_EMPLOYEE_ID` (`employee_id`),
  KEY `INCOME_TRANSPORT_ID_TRANSPORT_TRANSPORT_ID` (`transport_id`),
  CONSTRAINT `INCOME_EMPLOYEE_ID_EMPLOYEE_EMPLOYEE_ID` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON UPDATE CASCADE,
  CONSTRAINT `INCOME_TRANSPORT_ID_TRANSPORT_TRANSPORT_ID` FOREIGN KEY (`transport_id`) REFERENCES `transport` (`transport_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Income History';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `income`
--

LOCK TABLES `income` WRITE;
/*!40000 ALTER TABLE `income` DISABLE KEYS */;
INSERT INTO `income` VALUES ('2019-08-07',1,6,15000.00),('2019-08-08',1,6,9000.00),('2019-08-11',1,6,18000.00),('2019-09-15',1,6,12000.00),('2019-09-09',1,7,8000.00),('2019-08-07',2,7,9000.00),('2019-08-07',3,8,7500.00),('2019-08-10',3,7,14000.00),('2019-08-08',4,8,8500.00),('2019-08-09',4,8,8500.00),('2019-08-01',4,7,8500.00),('2019-08-16',4,6,13500.55),('2019-08-22',8,9,19000.00),('2019-08-22',5,7,13000.71),('2019-09-07',15,6,15000.00),('2019-09-08',14,10,9500.51),('2019-09-11',13,9,18000.00),('2019-09-15',11,10,12000.00),('2019-09-09',10,7,8000.00),('2019-09-07',10,7,9000.00),('2019-09-07',4,6,8500.00),('2019-09-10',11,10,14000.00),('2019-09-08',10,6,8500.00),('2019-09-09',10,6,8100.00),('2019-09-01',9,8,8500.00),('2019-09-16',9,8,13499.50),('2019-09-22',9,9,15000.00),('2019-09-22',8,7,9900.71),('2019-10-01',10,6,14000.00),('2019-10-01',11,7,9900.45),('2019-10-01',1,10,25000.00),('2019-10-05',11,8,11000.00),('2019-10-06',1,9,8500.00),('2019-10-07',10,7,9800.00),('2019-10-07',4,10,8900.00),('2019-10-07',15,6,11000.44),('2019-10-08',10,6,10500.00),('2019-10-09',10,6,11100.00),('2019-10-22',5,8,8900.40),('2019-10-22',6,6,12599.50),('2019-10-22',9,9,19000.00),('2019-10-22',1,7,18900.71);
/*!40000 ALTER TABLE `income` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position` (
  `position_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Position ID',
  `position_name` varchar(127) NOT NULL COMMENT 'Name of Position',
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Position';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'accounting'),(2,'economist'),(3,'director'),(4,'driver'),(5,'electrician'),(6,'conductor'),(7,'mechanic'),(8,'gardner');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salary` (
  `salary_record_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Payment Record ID',
  `date` date NOT NULL COMMENT 'Payment Date',
  `employee_id` int(10) unsigned NOT NULL COMMENT 'Employee ID',
  `payment` decimal(10,2) NOT NULL COMMENT 'Total Sum of Payment',
  PRIMARY KEY (`salary_record_id`),
  KEY `SALARY_EMPLOYEE_ID_EMPLOYEE_EMPLOYEE_ID` (`employee_id`),
  CONSTRAINT `SALARY_EMPLOYEE_ID_EMPLOYEE_EMPLOYEE_ID` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='Salary History';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary`
--

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
INSERT INTO `salary` VALUES (1,'2019-10-03',1,19800.00),(2,'2019-10-03',2,15100.00),(3,'2019-10-03',3,12100.00),(4,'2019-10-03',4,13020.00),(5,'2019-10-03',5,15500.00),(6,'2019-10-02',6,12500.00),(7,'2019-10-02',7,12100.00),(8,'2019-10-02',8,13200.00),(9,'2019-10-02',9,14000.00),(10,'2019-10-02',10,10000.00),(11,'2019-10-03',11,9800.00),(12,'2019-10-03',12,8100.00),(13,'2019-10-03',13,10000.00),(14,'2019-10-03',14,12010.00),(15,'2019-09-04',1,15000.00),(16,'2019-09-04',2,14100.00),(17,'2019-09-04',3,11100.00),(18,'2019-09-04',4,12020.00),(19,'2019-09-04',5,13500.00),(20,'2019-09-05',6,10505.00),(21,'2019-09-05',7,12020.00),(22,'2019-09-05',8,12280.00),(23,'2019-09-05',9,12500.00),(24,'2019-09-05',10,9900.00),(25,'2019-09-05',11,10100.00),(26,'2019-09-05',12,9500.00),(27,'2019-09-05',13,9984.00),(28,'2019-09-05',14,11510.00),(29,'2019-08-03',1,18000.00),(30,'2019-08-03',2,14100.00),(31,'2019-08-03',3,11010.00),(32,'2019-08-03',4,11555.00),(33,'2019-08-03',5,12500.00),(34,'2019-08-03',6,10205.00),(35,'2019-08-03',7,11120.00),(36,'2019-08-04',8,12680.00),(37,'2019-08-04',9,12110.00),(38,'2019-08-04',10,9990.00),(39,'2019-08-04',11,10009.00),(40,'2019-08-04',12,9595.00),(41,'2019-08-04',13,10111.00),(42,'2019-08-04',14,11498.85);
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transport`
--

DROP TABLE IF EXISTS `transport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transport` (
  `transport_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unit ID',
  `unit_type` varchar(127) NOT NULL COMMENT 'Type of Unit',
  `manufacturer` varchar(127) NOT NULL COMMENT 'Unit Manufacturer',
  `model` varchar(63) NOT NULL COMMENT 'Model of Unit',
  `year_make` year(4) NOT NULL COMMENT 'Year Make of Unit',
  `unit_number` varchar(31) NOT NULL COMMENT 'Number of Unit',
  PRIMARY KEY (`transport_id`),
  UNIQUE KEY `unit_number` (`unit_number`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='Transport';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport`
--

LOCK TABLES `transport` WRITE;
/*!40000 ALTER TABLE `transport` DISABLE KEYS */;
INSERT INTO `transport` VALUES (1,'trolleybus','LAZ','E301',2015,'2617'),(2,'trolleybus','ZiU','682',1985,'285'),(3,'trolleybus','ZiU','682',1988,'287'),(4,'trolleybus','ZiU','686',1995,'1010'),(5,'trolleybus','Skoda','14TR',2014,'583'),(6,'trolleybus','Skoda','14TR',2011,'581'),(7,'trolleybus','UMZ','T2',2005,'2044'),(8,'trolleybus','UMZ','T2',2007,'2045'),(9,'trolleybus','UMZ','T2',2008,'2046'),(10,'trolleybus','UMZ','T2',2008,'2047'),(11,'trolleybus','Bogdan','Т701',2011,'4045'),(12,'trolleybus','Bogdan','Т701',2012,'4055'),(13,'trolleybus','Bogdan','Т701',2012,'4056'),(14,'trolleybus','LAZ','E301',2015,'2618'),(15,'trolleybus','LAZ','E301',2016,'2619');
/*!40000 ALTER TABLE `transport` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-28 14:44:09
