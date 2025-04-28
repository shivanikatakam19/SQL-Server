-- MySQL dump 10.13  Distrib 8.0.39, for Win64 (x86_64)
--
-- Host: localhost    Database: organizationdb
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `benchemployees`
--

DROP TABLE IF EXISTS `benchemployees`;
/*!50001 DROP VIEW IF EXISTS `benchemployees`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `benchemployees` AS SELECT 
 1 AS `employee_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `date_of_birth`,
 1 AS `employee_address`,
 1 AS `gender`,
 1 AS `salary`,
 1 AS `department_id`,
 1 AS `project_id`,
 1 AS `branch`,
 1 AS `serial_no`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `orders` int DEFAULT '0',
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'clara','Marq',0),(2,'zook','Bean',0),(3,'amy','Oswald',0);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `department_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `department_name` varchar(20) DEFAULT NULL,
  `department_location` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`department_id`),
  UNIQUE KEY `department_id` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Development','block 2'),(2,'HR','Banglore');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_history`
--

DROP TABLE IF EXISTS `employee_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_history` (
  `employee_id` int DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `date_of_birth` varchar(15) DEFAULT NULL,
  `employee_address` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `salary` varchar(20) DEFAULT NULL,
  `department_id` bigint unsigned DEFAULT NULL,
  `project_id` bigint unsigned DEFAULT NULL,
  `updated_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_history`
--

LOCK TABLES `employee_history` WRITE;
/*!40000 ALTER TABLE `employee_history` DISABLE KEYS */;
INSERT INTO `employee_history` VALUES (7,'peter','black','1998-03-02','Newyork','Male','60000',2,3,'2025-04-18'),(10,'test','employee','1998-04-23','New york','Male','4000',2,3,'2025-04-18'),(11,'test','employee','1998-04-23','New york','Male','4000',2,3,'2025-04-18'),(1,'joe','clark','1997-04-12','New Jersey','Male','29900',1,2,'2025-04-21'),(1,'joe','clark','1997-04-12','New Jersey','Male','30000',1,2,'2025-04-21'),(2,'sean','wilson','1999-09-28','Austin','Male','28100',1,2,'2025-04-21'),(2,'sean','wilson','1999-09-28','Austin','Male','28000',1,2,'2025-04-21'),(1,'joe','clark','1997-04-12','New Jersey','Male','29900',1,2,'2025-04-21'),(2,'sean','wilson','1999-09-28','Austin','Male','28100',1,2,'2025-04-21'),(1,'joe','clark','1997-04-12','New Jersey','Male','29500',1,2,'2025-04-21'),(2,'sean','wilson','1999-09-28','Austin','Male','28500',1,2,'2025-04-21'),(1,'joe','clark','1997-04-12','New Jersey','Male','29000',1,2,'2025-04-21'),(2,'sean','wilson','1999-09-28','Austin','Male','28000',1,2,'2025-04-21'),(1,'joe','clark','1997-04-12','New Jersey','Male','29500',1,2,'2025-04-21'),(2,'sean','wilson','1999-09-28','Austin','Male','27500',1,2,'2025-04-21'),(11,'test','employee','1998-04-23','New york','Male','4500',2,3,'2025-04-21'),(4,'lily','ore','1987-09-02','Los Angeles','Female','49000',1,3,'2025-04-21'),(3,'Amy','Mills','2000-05-22','Chicago','Female','27000',1,2,'2025-04-21'),(5,'marcus','park','1996-02-13','newyork','Male','30000',1,3,'2025-04-23'),(1,'joe','clark','1997-04-12','New Jersey','Male','30000',1,2,'2025-04-23'),(1,'joe','clark','1997-04-12','New Jersey','Male','29900',1,2,'2025-04-23'),(1,'joe','clark','1997-04-12','New Jersey','Male','30000',1,2,'2025-04-23'),(1,'joe','clark','1997-04-12','New Jersey','Male','29900',1,2,'2025-04-23'),(1,'joe','clark','1997-04-12','New Jersey','Male','30000',1,2,'2025-04-23'),(1,'joe','clark','1997-04-12','New Jersey','Male','29900',1,2,'2025-04-23'),(1,'joe','clark','1997-04-12','New Jersey','Male','30000',1,2,'2025-04-23'),(1,'joe','clark','1997-04-12','New Jersey','Male','29900',1,2,'2025-04-23'),(1,'joe','clark','1997-04-12','New Jersey','Male','29400',1,2,'2025-04-23'),(1,'joe','clark','1997-04-12','New Jersey','Male','28900',1,2,'2025-04-23'),(1,'joe','clark','1997-04-12','New Jersey','Male','28400',1,2,'2025-04-23'),(1,'joe','clark','1997-04-12','New Jersey','Male','27900',1,2,'2025-04-23'),(1,'joe','clark','1997-04-12','New Jersey','Male','30000',1,2,'2025-04-23'),(1,'joe','clark','1997-04-12','New Jersey','Male','29500',1,2,'2025-04-23'),(1,'joe','clark','1997-04-12','New Jersey','Male','29000',1,2,'2025-04-23'),(1,'joe','clark','1997-04-12','New Jersey','Male','30000',1,2,'2025-04-23'),(1,'joe','clark','1997-04-12','New Jersey','Male','29500',1,2,'2025-04-23'),(1,'joe','clark','1997-04-12','New Jersey','Male','29000',1,2,'2025-04-23'),(1,'joe','clark','1997-04-12','New Jersey','Male','30000',1,2,'2025-04-23'),(1,'joe','clark','1997-04-12','New Jersey','Male','29500',1,2,'2025-04-23'),(1,'joe','clark','1997-04-12','New Jersey','Male','29000',1,2,'2025-04-23'),(1,'joe','clark','1997-04-12','New Jersey','Male','30000',1,2,'2025-04-23'),(1,'joe','clark','1997-04-12','New Jersey','Male','25000',1,2,'2025-04-23'),(1,'joe','clark','1997-04-12','New Jersey','Male','30000',1,2,'2025-04-23'),(1,'joe','clark','1997-04-12','New Jersey','Male','20000',1,2,'2025-04-23'),(1,'joe','clark','1997-04-12','New Jersey','Male','30000',1,2,'2025-04-23'),(4,'lily','ore','1987-09-02','Los Angeles','Female','48000',1,3,'2025-04-28'),(3,'Amy','Mills','2000-05-22','Chicago','Female','26000',1,2,'2025-04-28'),(4,'lily','ore','1987-09-02','Los Angeles','Female','49000',1,3,'2025-04-28'),(3,'Amy','Mills','2000-05-22','Chicago','Female','25000',1,2,'2025-04-28'),(4,'lily','ore','1987-09-02','Los Angeles','Female','50000',1,3,'2025-04-28'),(3,'Amy','Mills','2000-05-22','Chicago','Female','24000',1,2,'2025-04-28'),(4,'lily','ore','1987-09-02','Los Angeles','Female','51000',1,3,'2025-04-28'),(3,'Amy','Mills','2000-05-22','Chicago','Female','23000',1,2,'2025-04-28'),(4,'lily','ore','1987-09-02','Los Angeles','Female','52000',1,3,'2025-04-28');
/*!40000 ALTER TABLE `employee_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `date_of_birth` varchar(15) DEFAULT NULL,
  `employee_address` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `salary` bigint NOT NULL,
  `department_id` bigint unsigned DEFAULT NULL,
  `project_id` bigint unsigned DEFAULT NULL,
  `branch` varchar(15) DEFAULT 'Hyderabad',
  `serial_no` int DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `employee_id` (`employee_id`),
  KEY `department_id` (`department_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`),
  CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'joe','clark','1997-04-12','New Jersey','Male',30000,1,2,'Hyderabad',NULL),(2,'sean','wilson','1999-09-28','Austin','Male',27500,1,2,'Hyderabad',NULL),(3,'Amy','Mills','2000-05-22','Chicago','Female',23000,1,2,'Hyderabad',NULL),(4,'lily','ore','1987-09-02','Los Angeles','Female',52000,1,3,'Hyderabad',NULL),(5,'marcus','park','1996-02-13','newyork','Male',30000,1,3,'Hyderabad',NULL),(6,'zook','smith','2001-02-28','Dallas','Male',18000,2,NULL,'Hyderabad',NULL),(7,'peter','black','1998-03-02','Newyork','Male',60000,2,3,'Hyderabad',NULL),(8,'clara','smith','1997-10-20','California','Female',24000,2,NULL,'Hyderabad',NULL),(9,'test','employee','1998-04-23','New york','Male',4000,2,3,'Hyderabad',NULL),(10,'test','employee','1998-04-23','New york','Male',4000,2,3,'Hyderabad',NULL),(11,'test','employee','1998-04-23','New york','Male',4500,2,3,'Hyderabad',NULL);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `employee_audit_on_insert` AFTER INSERT ON `employees` FOR EACH ROW BEGIN
    INSERT into employee_history values (new.employee_id, new.first_name, new.last_name, new.date_of_birth, new.employee_address, 
    new.gender, new.salary, new.department_id, new.project_id, now());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `employee_audit` AFTER UPDATE ON `employees` FOR EACH ROW BEGIN
    IF old.first_name <> new.first_name OR 
       old.last_name <> new.last_name OR 
       old.date_of_birth <> new.date_of_birth OR 
       old.employee_address <> new.employee_address OR
       old.gender <> new.gender OR
       old.salary <> new.salary OR
       old.department_id <> new.department_id OR
       old.project_id <> new.project_id THEN
        INSERT into employee_history values (new.employee_id, new.first_name, new.last_name, new.date_of_birth, new.employee_address, 
        new.gender, new.salary, new.department_id, new.project_id, now());
    END If;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `project_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `project_name` varchar(20) DEFAULT NULL,
  `client_name` varchar(15) DEFAULT NULL,
  `project_location` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`project_id`),
  UNIQUE KEY `project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'Face Recognition','Marq','USA'),(2,'Internal','Bean','UK'),(3,'External','Oswald','Banglore'),(4,'Cognine','Shivani','Hyderabad'),(5,'Cognine','Shivani','Hyderabad');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `benchemployees`
--

/*!50001 DROP VIEW IF EXISTS `benchemployees`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `benchemployees` AS select `employees`.`employee_id` AS `employee_id`,`employees`.`first_name` AS `first_name`,`employees`.`last_name` AS `last_name`,`employees`.`date_of_birth` AS `date_of_birth`,`employees`.`employee_address` AS `employee_address`,`employees`.`gender` AS `gender`,`employees`.`salary` AS `salary`,`employees`.`department_id` AS `department_id`,`employees`.`project_id` AS `project_id`,`employees`.`branch` AS `branch`,`employees`.`serial_no` AS `serial_no` from `employees` where (`employees`.`project_id` is null) */;
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

-- Dump completed on 2025-04-28 18:20:20
