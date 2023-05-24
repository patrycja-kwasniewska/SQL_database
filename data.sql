-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: apk_finanse
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `cel_finansowy`
--


LOCK TABLES `cel_finansowy` WRITE;
/*!40000 ALTER TABLE `cel_finansowy` DISABLE KEYS */;
INSERT INTO `cel_finansowy` VALUES (1,'Wycieczka','2022-11-12','2023-06-22',1200.00,650.00,1,2),(2,'Komputer','2022-11-05','2023-12-22',12000.00,7500.00,2,3),(3,'Narzędzia','2023-02-12','2023-06-21',900.00,330.00,3,1);
/*!40000 ALTER TABLE `cel_finansowy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dług`
--



--
-- Dumping data for table `dług`
--

LOCK TABLES `dług` WRITE;
/*!40000 ALTER TABLE `dług` DISABLE KEYS */;
INSERT INTO `dług` VALUES (1,1200.00,'2023-08-12','2022-01-15','Pożyczka',7.50,1),(2,19000.00,'2023-01-12','2022-04-15','Raty za samochód',5.20,2),(3,500.00,'2023-01-01','2022-02-04','Pożyczka od kolegi',0.00,3);
/*!40000 ALTER TABLE `dług` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inwestycja`
--

DROP TABLE IF EXISTS `inwestycja`;


--
-- Dumping data for table `inwestycja`
--

LOCK TABLES `inwestycja` WRITE;
/*!40000 ALTER TABLE `inwestycja` DISABLE KEYS */;
INSERT INTO `inwestycja` VALUES (1,'Obligacje skarbowe',1000.00,'Obligacje','2023-01-01',1054.00,1,1),(2,'Obligacje państwowe',3000.00,'Obligacje','2023-02-01',3012.00,2,2),(3,'Akcje firmy xyz',500.00,'Akcje','2023-03-12',728.00,3,3);
/*!40000 ALTER TABLE `inwestycja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategoria_przychodów`
--


--
-- Dumping data for table `kategoria_przychodów`
--

LOCK TABLES `kategoria_przychodów` WRITE;
/*!40000 ALTER TABLE `kategoria_przychodów` DISABLE KEYS */;
INSERT INTO `kategoria_przychodów` VALUES (1,'Wypłata','Wypłaty za pracę'),(2,'Darowizna','Wszelkiego rodzaju darowizny, spadki itp'),(3,'Sprzedaż','Przychód związany ze sprzedażą'),(4,'Usługi','Przychód związany ze świadczonymi usługami'),(5,'Prezent','Środki otrzymane w ramach prezentów');
/*!40000 ALTER TABLE `kategoria_przychodów` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategoria_wydatków`
--


--
-- Dumping data for table `kategoria_wydatków`
--

LOCK TABLES `kategoria_wydatków` WRITE;
/*!40000 ALTER TABLE `kategoria_wydatków` DISABLE KEYS */;
INSERT INTO `kategoria_wydatków` VALUES (1,'Zakupy spożywcze','Zakupy składające się z produktów spożywczych'),(2,'Sport','Rzeczy związane ze sportem takie jak siłownia, odżywki, karnety'),(3,'Elektronika','Rzeczy związane ze ze sprzętem elektronicznym takim jak baterie, nowe urządzenia, licencje'),(4,'Dom','Rzeczy związane z czystością, akesoriami, meblami itp. '),(5,'Inne','Rzeczy z pozostałych kategorii');
/*!40000 ALTER TABLE `kategoria_wydatków` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `konto`
--


--
-- Dumping data for table `konto`
--

LOCK TABLES `konto` WRITE;
/*!40000 ALTER TABLE `konto` DISABLE KEYS */;
INSERT INTO `konto` VALUES (1,1340,'Główne konto',1),(2,5400,'Konto służbowe',3),(3,12300,'Konto osobiste',2);
/*!40000 ALTER TABLE `konto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_wydatków`
--

DROP TABLE IF EXISTS `plan_wydatków`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;


--
-- Dumping data for table `plan_wydatków`
--

LOCK TABLES `plan_wydatków` WRITE;
/*!40000 ALTER TABLE `plan_wydatków` DISABLE KEYS */;
INSERT INTO `plan_wydatków` VALUES (1,340.00,280.00,60.00,2,1,1),(2,540.00,640.00,-100.00,3,3,2),(3,1200.00,800.00,400.00,4,2,3);
/*!40000 ALTER TABLE `plan_wydatków` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `powiadomienie`
--


--
-- Dumping data for table `powiadomienie`
--

LOCK TABLES `powiadomienie` WRITE;
/*!40000 ALTER TABLE `powiadomienie` DISABLE KEYS */;
INSERT INTO `powiadomienie` VALUES (1,'00:00:20','Pamiętaj aby uzupełnić dane z dzisiejszego dnia',0,1),(2,'00:00:16','Pamiętaj o oszczędzaniu na swoje cele',0,3);
/*!40000 ALTER TABLE `powiadomienie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `przychód`
--


--
-- Dumping data for table `przychód`
--

LOCK TABLES `przychód` WRITE;
/*!40000 ALTER TABLE `przychód` DISABLE KEYS */;
INSERT INTO `przychód` VALUES (1,'2023-03-01',6500.00,'Wypłata za projekt bazy danych',1,1,2),(2,'2022-12-22',800.00,'Premia świąteczna',2,5,3),(3,'2023-03-01',2500.00,'Sprzedaż starego komputera',3,3,1);
/*!40000 ALTER TABLE `przychód` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `raport`
--


--
-- Dumping data for table `raport`
--

LOCK TABLES `raport` WRITE;
/*!40000 ALTER TABLE `raport` DISABLE KEYS */;
INSERT INTO `raport` VALUES (1,'Raport miesięczny','2023-02-01','2023-03-01',43.10,2500.00,1,1,4);
/*!40000 ALTER TABLE `raport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `raport_ma_przychód`
--


--
-- Dumping data for table `raport_ma_przychód`
--

LOCK TABLES `raport_ma_przychód` WRITE;
/*!40000 ALTER TABLE `raport_ma_przychód` DISABLE KEYS */;
/*!40000 ALTER TABLE `raport_ma_przychód` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `szczegoły_inwestycji`
--

--
-- Dumping data for table `szczegoły_inwestycji`
--

LOCK TABLES `szczegoły_inwestycji` WRITE;
/*!40000 ALTER TABLE `szczegoły_inwestycji` DISABLE KEYS */;
INSERT INTO `szczegoły_inwestycji` VALUES (1,'Wysoki procent, dobra inwestycja'),(2,'Niski procent ale w zamian krótki okres'),(3,'Ryzykowne akcje, mozliwy spory zarobek');
/*!40000 ALTER TABLE `szczegoły_inwestycji` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `szczegóły_celu`
--


-- Dumping data for table `szczegóły_celu`
--

LOCK TABLES `szczegóły_celu` WRITE;
/*!40000 ALTER TABLE `szczegóły_celu` DISABLE KEYS */;
INSERT INTO `szczegóły_celu` VALUES (1,'Cel na wycieczkę w góry podczas urlopu'),(2,'Cel na wycieczkę w góry podczas urlopu'),(3,'Cel na wycieczkę w góry podczas urlopu'),(4,'Cel na wycieczkę w góry podczas urlopu'),(5,'Cel na wycieczkę w góry podczas urlopu'),(6,'Cel na wycieczkę w góry podczas urlopu'),(7,'Cel na wycieczkę w góry podczas urlopu'),(8,'Cel na nowy komputer do pracy'),(9,'cela na nowe narzędzia warsztatowe i nowe klucze');
/*!40000 ALTER TABLE `szczegóły_celu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `szczegóły_inwestycji`

--
-- Dumping data for table `szczegóły_inwestycji`
--

LOCK TABLES `szczegóły_inwestycji` WRITE;
/*!40000 ALTER TABLE `szczegóły_inwestycji` DISABLE KEYS */;
/*!40000 ALTER TABLE `szczegóły_inwestycji` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `szczegóły_planu_wydatków`
--


--
-- Dumping data for table `szczegóły_planu_wydatków`
--

LOCK TABLES `szczegóły_planu_wydatków` WRITE;
/*!40000 ALTER TABLE `szczegóły_planu_wydatków` DISABLE KEYS */;
INSERT INTO `szczegóły_planu_wydatków` VALUES (1,'Wydatki na jedzenie za ostatni okres'),(2,'Wydatki na nowy procesor, okazał się droższy niż było planowane.'),(3,'Zakup nowych mebli do łazienki, wyszły taniej z uwagi na promocję.');
/*!40000 ALTER TABLE `szczegóły_planu_wydatków` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `szczegóły_przychodu`
--


--
-- Dumping data for table `szczegóły_przychodu`
--

LOCK TABLES `szczegóły_przychodu` WRITE;
/*!40000 ALTER TABLE `szczegóły_przychodu` DISABLE KEYS */;
INSERT INTO `szczegóły_przychodu` VALUES (1,'Wypłata za pracę nad bazą danych sklepu internetowego'),(2,'Premia świąteczna za dobre wyniki w pracy'),(3,'Sprzedaż starego komputera, środki mają iść na nowy komputer.');
/*!40000 ALTER TABLE `szczegóły_przychodu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `szczegóły_transakcji_cyklicznej`
--

-
-- Dumping data for table `szczegóły_transakcji_cyklicznej`
--

LOCK TABLES `szczegóły_transakcji_cyklicznej` WRITE;
/*!40000 ALTER TABLE `szczegóły_transakcji_cyklicznej` DISABLE KEYS */;
INSERT INTO `szczegóły_transakcji_cyklicznej` VALUES (1,'Opłata co miesięczna za subskrybcję netflixa'),(2,'Opłata za czynsz za wynajmowany pokój'),(3,'Opłata za co miesięczną subskrybcję HBO ');
/*!40000 ALTER TABLE `szczegóły_transakcji_cyklicznej` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `szczegóły_wydatku`
--

--
-- Dumping data for table `szczegóły_wydatku`
--

LOCK TABLES `szczegóły_wydatku` WRITE;
/*!40000 ALTER TABLE `szczegóły_wydatku` DISABLE KEYS */;
INSERT INTO `szczegóły_wydatku` VALUES (1,'Zakupy na obiad, makaron, sos, pomidory, przyprawy, mięso'),(2,'Zakupy na obiad, makaron, sos, pomidory, przyprawy, mięso'),(3,'Licencja na Corel Video Studio, konieczna do pracy'),(4,'Rachunki za prąd, wodę oraz gaz.'),(5,'Rachunki za prąd, wodę oraz gaz');
/*!40000 ALTER TABLE `szczegóły_wydatku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transakcje_cykliczne`
--

--
-- Dumping data for table `transakcje_cykliczne`
--

LOCK TABLES `transakcje_cykliczne` WRITE;
/*!40000 ALTER TABLE `transakcje_cykliczne` DISABLE KEYS */;
INSERT INTO `transakcje_cykliczne` VALUES (1,'Netflix','2023-01-01',31,55.00,1,2),(2,'Czynsz','2022-04-01',31,900.00,2,3),(3,'HBO MAX','2023-02-01',31,25.00,3,1);
/*!40000 ALTER TABLE `transakcje_cykliczne` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `użytkownik`
--


--
-- Dumping data for table `użytkownik`
--

LOCK TABLES `użytkownik` WRITE;
/*!40000 ALTER TABLE `użytkownik` DISABLE KEYS */;
INSERT INTO `użytkownik` VALUES (1,'Karol','Kowalski','karol@op.com','password'),(2,'Anna','Wiśniewska','anna@op.com','user'),(3,'Jan','Wielkopolski','jan@op.com','1234');
/*!40000 ALTER TABLE `użytkownik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wydatek`
--


--
-- Dumping data for table `wydatek`
--

LOCK TABLES `wydatek` WRITE;
/*!40000 ALTER TABLE `wydatek` DISABLE KEYS */;
INSERT INTO `wydatek` VALUES (3,'2022-12-13',43.10,'Zakupy na obiad',1,1,1),(4,'2022-12-15',73.10,'Zakupy na kolacje',2,1,2),(5,'2023-02-18',399.99,'Licencja programu',1,3,1),(7,'2023-01-12',341.20,'Rachunki',4,3,3);
/*!40000 ALTER TABLE `wydatek` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-13 15:53:43
