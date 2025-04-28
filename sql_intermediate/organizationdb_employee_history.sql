-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: organizationdb
-- ------------------------------------------------------
-- Server version	8.0.39

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-28 18:08:34
