-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: dbproject
-- ------------------------------------------------------
-- Server version	10.4.27-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `active_rent`
--

DROP TABLE IF EXISTS `active_rent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_rent` (
  `rent_ID` int(11) NOT NULL AUTO_INCREMENT,
  `renting_user_id` int(11) NOT NULL,
  `admin_user_id` int(11) NOT NULL,
  `ISBN` bigint(13) unsigned zerofill NOT NULL,
  `start_date` date NOT NULL DEFAULT curdate(),
  PRIMARY KEY (`rent_ID`),
  UNIQUE KEY `uk_active_rent_user_id_isbn` (`renting_user_id`,`ISBN`),
  KEY `fk_active_rent_lib_admin` (`admin_user_id`),
  KEY `fk_active_rent_book` (`ISBN`),
  CONSTRAINT `fk_active_rent_book` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON UPDATE CASCADE,
  CONSTRAINT `fk_active_rent_lib_admin` FOREIGN KEY (`admin_user_id`) REFERENCES `lib_admin` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_active_rent_lib_user` FOREIGN KEY (`renting_user_id`) REFERENCES `lib_user` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=548 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_rent`
--

LOCK TABLES `active_rent` WRITE;
/*!40000 ALTER TABLE `active_rent` DISABLE KEYS */;
INSERT INTO `active_rent` VALUES (401,72,4,9781476387246,'2023-05-27'),(402,2,2,9780295914343,'2023-05-30'),(406,64,13,9780522316438,'2023-05-19'),(407,43,13,9780728854048,'2023-05-31'),(408,45,12,9780054770050,'2023-05-25'),(410,36,12,9781503987845,'2023-05-26'),(411,60,2,9781002388952,'2023-05-28'),(413,48,13,9781990994821,'2023-05-25'),(416,60,2,9780100398542,'2023-05-19'),(421,45,12,9780295914343,'2023-05-22'),(423,18,2,9780167617051,'2023-05-24'),(425,51,12,9781098619374,'2023-05-26'),(426,37,2,9780126353426,'2023-05-18'),(428,76,12,9781572775084,'2023-05-25'),(429,9,2,9780793507368,'2023-05-25'),(430,40,4,9781946521460,'2023-05-21'),(432,27,4,9780522316438,'2023-05-25'),(433,50,12,9781690512332,'2023-05-28'),(436,72,4,9781905619221,'2023-05-22'),(438,77,13,9780829906264,'2023-05-18'),(439,24,4,9781561036387,'2023-05-21'),(440,8,13,9781429201162,'2023-05-28'),(441,27,4,9781844450534,'2023-05-27'),(442,19,2,9781874732761,'2023-05-22'),(443,11,4,9780256542806,'2023-05-27'),(445,25,4,9781130957402,'2023-05-26'),(447,25,4,9781561036387,'2023-05-22'),(448,65,13,9781844450534,'2023-05-21'),(451,4,4,9781844450534,'2023-05-21'),(452,15,2,9780243438600,'2023-05-30'),(454,65,13,9780728854048,'2023-05-23'),(457,26,4,9780916174880,'2023-05-22'),(458,13,13,9780388139066,'2023-05-22'),(462,59,13,9781572775084,'2023-05-26'),(466,47,12,9781661726072,'2023-05-27'),(468,53,4,9780995642669,'2023-05-25'),(471,5,13,9780067979235,'2023-05-28'),(472,51,12,9781905619221,'2023-05-25'),(473,64,13,9781909213425,'2023-05-19'),(476,34,13,9781065179436,'2023-05-28'),(480,69,13,9780731663910,'2023-05-30'),(481,77,13,9781085165068,'2023-05-21'),(482,50,12,9780159376690,'2023-05-20'),(484,21,12,9781130957402,'2023-05-29'),(487,22,13,9780114812577,'2023-05-29'),(489,80,12,9781857542547,'2023-05-23'),(490,36,12,9781566266413,'2023-05-19'),(491,73,13,9780793507368,'2023-05-23'),(495,21,12,9781531006112,'2023-05-23'),(496,70,2,9781566266413,'2023-05-22'),(499,48,13,9781721541966,'2023-05-22'),(500,74,12,9780654457160,'2023-05-27'),(502,14,4,9781531006112,'2023-05-22'),(505,28,12,9780894166938,'2023-05-27'),(515,49,12,9781905619221,'2023-05-23'),(516,31,4,9781905619221,'2023-05-30'),(517,16,2,9781992362994,'2023-05-26'),(523,73,13,9780495612193,'2023-05-30'),(526,41,2,9780689793264,'2023-05-29'),(527,66,13,9780613902434,'2023-05-29'),(529,71,13,9780399208850,'2023-05-21'),(532,68,4,9781317966746,'2023-05-24'),(534,70,2,9781561036387,'2023-05-26'),(537,26,4,9781129640254,'2023-05-18'),(539,41,2,9780731663910,'2023-05-20'),(543,66,13,9781340499716,'2023-05-30'),(545,52,4,9781059025909,'2023-05-26'),(547,12,12,9781129640254,'2023-05-31');
/*!40000 ALTER TABLE `active_rent` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER rent_insertion BEFORE INSERT ON active_rent FOR EACH ROW
BEGIN
	IF (SELECT new.renting_user_id IN (select user_id from teacher))
	THEN SET @rent_lim = 1;
	ELSEIF (SELECT new.renting_user_id IN (select user_id from student))
		THEN SET @rent_lim = 2;
	END IF;
	
	SET @school_id = (SELECT school_id FROM lib_user WHERE user_id = new.renting_user_id);
	SET @other_start_date = (select min(start_date) FROM active_rent WHERE renting_user_id = new.renting_user_id);

	IF ((select available_copies FROM school_book WHERE ISBN = new.ISBN AND school_id = @school_id) = 0) 
	THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'No more copies';
	ELSE
		UPDATE school_book SET `available_copies` = `available_copies` - 1 WHERE school_book.school_id = (SELECT school_id FROM lib_user WHERE user_id = new.renting_user_id) AND school_book.ISBN = new.ISBN;
	END IF;
	
	IF ((select renting FROM lib_user WHERE user_id = new.renting_user_id) < @rent_lim)
	THEN
		UPDATE lib_user SET renting = renting + 1 WHERE lib_user.user_id = new.renting_user_id;
	ELSE
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Cannot have more active rents';
	END IF;
	
	IF (ADDDATE(@other_start_date,INTERVAL 1 WEEK) < new.start_date)
	THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Cannot have more active rents when a rental is late';
	END IF;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER rent_deletion AFTER DELETE ON active_rent FOR EACH ROW
BEGIN
	IF ((select renting from lib_user where lib_user.user_id = old.renting_user_id) > 0 )
	THEN
		UPDATE lib_user SET renting = renting - 1 WHERE lib_user.user_id = old.renting_user_id;
		UPDATE school_book SET available_copies = available_copies + 1 WHERE school_book.school_id = (SELECT school_id FROM lib_user WHERE user_id = old.renting_user_id) AND school_book.ISBN = old.ISBN;
	ELSE
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Rents already at 0';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `admin_rent`
--

DROP TABLE IF EXISTS `admin_rent`;
/*!50001 DROP VIEW IF EXISTS `admin_rent`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `admin_rent` AS SELECT
 1 AS `admin_id`,
  1 AS `first_name`,
  1 AS `last_name`,
  1 AS `rent_id`,
  1 AS `start_date` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `admin_rent_per_year`
--

DROP TABLE IF EXISTS `admin_rent_per_year`;
/*!50001 DROP VIEW IF EXISTS `admin_rent_per_year`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `admin_rent_per_year` AS SELECT
 1 AS `admin_id`,
  1 AS `first_name`,
  1 AS `last_name`,
  1 AS `rent_year`,
  1 AS `rents` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `admins_with_same_rentals_in_year`
--

DROP TABLE IF EXISTS `admins_with_same_rentals_in_year`;
/*!50001 DROP VIEW IF EXISTS `admins_with_same_rentals_in_year`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `admins_with_same_rentals_in_year` AS SELECT
 1 AS `fn1`,
  1 AS `ln1`,
  1 AS `fn2`,
  1 AS `ln2`,
  1 AS `rents`,
  1 AS `rent_year` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `all_rent`
--

DROP TABLE IF EXISTS `all_rent`;
/*!50001 DROP VIEW IF EXISTS `all_rent`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `all_rent` AS SELECT
 1 AS `status`,
  1 AS `rent_id`,
  1 AS `ISBN`,
  1 AS `renting_user_id`,
  1 AS `admin_user_id`,
  1 AS `start_date`,
  1 AS `return_date` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `all_rents_from_teachers`
--

DROP TABLE IF EXISTS `all_rents_from_teachers`;
/*!50001 DROP VIEW IF EXISTS `all_rents_from_teachers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `all_rents_from_teachers` AS SELECT
 1 AS `status`,
  1 AS `rent_id`,
  1 AS `ISBN`,
  1 AS `renting_user_id`,
  1 AS `admin_user_id`,
  1 AS `start_date`,
  1 AS `return_date`,
  1 AS `user_id`,
  1 AS `birth_date` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `ISBN` bigint(13) unsigned zerofill NOT NULL CHECK (`ISBN` < 10000000000000),
  `title` varchar(50) NOT NULL,
  `publisher` varchar(30) DEFAULT NULL,
  `summary` text DEFAULT NULL,
  `has_picture` tinyint(1) NOT NULL DEFAULT 0,
  `page_num` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (9780054770050,'Lord of the Flies','Maddox, Manning and Vazquez','Υπηρεσία μα σημεία διολισθήσεις τρόποι με. Αγοράζοντας εργάστηκε να του έτσι τεκμηριώνει πετάνε. Κάτι από εφαρμογή κώδικάς.',0,767),(9780064449649,'Lolita','Nichols-Walker','Κειμένων γεύματος μου απαρατήρητο άλγεβρα μεταγλωτίσει ποσοστό. Αποκλειστικούς κώδικα αθόρυβες εκείνου προσλάμβανες σε. Ιδιαίτερα κι αρέσει. Τοπικές εκτός δουλεύει που από συγγραφείς.',0,782),(9780065907940,'One Hundred Years of Solitude','Jimenez-Brown','Αποστηθίσει τεκμηριώνει χρησιμοποιούσες έχω που τον. Εικόνες ήδη λίγο πάντα τον πως. Ανώδυνη κανένας ταξινομεί λίγο.',0,457),(9780067979235,'Η Τρύπα στο Πάντελον','Evans, Scott and Harris','Ως μέσης χαρακτηριστικών διορθώσει αποδείξεις ερωτήσεις φακέλους. Οι εργασίας όχι αθόρυβες μηχανής πιο νέου ένα. Ας το πάντως ήδη συνηθίζουν ταξινομεί ο. Σταματάς απίστευτα ίδιο ερώτηση.',0,676),(9780100398542,'The Picture of Dorian Gray','Aguilar-Hicks','Στέλνοντάς χρονοδιαγράμματος μας μεταφραστής βγήκε μετρήσεις απαράδεκτη. Περιβάλλον ποια αποθηκευτικού χρειάζονται μας επί. Ανταγωνιστής εξακολουθεί δουλεύει δυστυχώς σαν μεταγλωτίσει κάτι. Άρθρων μέχρι για θέλεις δε διολισθήσεις λαμβάνουν.',0,841),(9780114812577,'One Hundred Years of Solitude','King Inc','Εκτελέσεις βαθμό ίδιο συγκεντρωμένοι μεταγλωτιστής τις της. Της σκεφτείς μην ποια ημέρα στο δε. Αντιλήφθηκαν βαθμό πρώτο σίγουρος κειμένων παίρνει χρόνου. Δημιουργια μη τη με περισσότερες.',0,983),(9780126353426,'Wuthering Heights','Lopez Inc','Εδώ τα μα έτσι. Φακέλους χρησιμοποιούσες πετούν σαν εντολές. Δούλευε βιβλίο εγώ μέρος μην δωροδοκηθούν και. Κανείς μαγικά ακούσει ένας θα. Έτσι τρέξει προσοχή μαγικά κανείς μέγιστη.',0,951),(9780138991791,'Ο Μεγάλος Καταρράκτης','Simpson Group','Την απομόνωση θυμάμαι άτομο πάρεις να. Εντολές προκύπτουν διαχειριστής σημαντικός έξι. Εργαζόμενων παραδώσεις γραφικά εγώ.',0,956),(9780159376690,'One Hundred Years of Solitude','Baker-Wilkerson','Μάθε έγραψες δοκιμάσεις θα. Χαρακτηριστικών χαρακτηριστικό αγοράζοντας συγχωνευτεί εγώ θα βρίσκονται. Περιβάλλοντος περιμένουν έγραψες απόλαυσε. Παράδειγμα σαν του νέου ζητήσεις τι γεγονός τοπικές.',0,694),(9780160514425,'Lord of the Flies','Conley-Stewart','Κώδικάς εφαρμογή μάθε ποια παίρνουν μιας τον. Κάνε στις δεν του. Τρόπο οι τελειώσει πρόσληψη επιχείριση δυστυχώς. Ναι μερικούς ωραίο ποια του αναφέρονται.',0,868),(9780167617051,'The Road','Rivera PLC','Διάβασε έρθει κώδικα λιγότερο έρθει καλύτερο αποστηθίσει. Βάζοντας εφαρμογής προβληματική ταξινομεί στέλνοντάς. Διάβασε ως γιαυτό.',0,782),(9780217836180,'Το Αλώνι','Reynolds-Mccullough','Κλπ διορθώσει για εργάστηκε μεταγλωτιστής περισσότερη. Από κειμένων χρησιμοποιώντας. Λιγότερο συνηθίζουν γραμμή με ζητήσεις.',0,771),(9780243438600,'The Catcher in the Rye','Klein, Gardner and Booker','Επιστρέφουν εικόνες έξι χρησιμοποίησέ φράση άρα του. Προϊόντα συνεχώς συγχωνευτεί ένα. Διακόψουμε εκδόσεις μέσης αυτός μάθε εργαζόμενοι. Άρθρων εργαζόμενοι ο παραδοτέου.',0,313),(9780256542806,'The Alchemist','Mckay-Mcdonald','Εκτός εταιρείες διασφαλίζεται άλγεβρα. Διακοπής μέχρι συνάδελφος απαράδεκτη. Εδώ χρησιμοποιούνταν ένα μέχρι προγραμματιστής. Ίδιο μέχρι ευκολότερο εκτελείται μιας έτσι δουλεύει.',0,59),(9780295914343,'Η Αλίκη στη Χώρα των Θαυμάτων','Mata, Cole and Burgess','Πρώτης αναφέρονται μην στη σας. Κι μην αποστηθίσει διάβασε λέει δε πάρα το. Σε θα τοπικές στο διορθώσει χώρου άρα νόμιζες. Εδώ για έρθει στις που άρα σκεφτείς. Πετούν στις δύο.',0,80),(9780322545335,'Fahrenheit 451','Patterson-Livingston','Επιστρέφουν επί για του για γιαυτό. Πολύ εδώ επί πλέον τέλειοι προσοχή ναι. Ύψος δημιουργείς δε μια. Εκθέσεις ανά μαγικά εφαμοργής προσπαθήσεις.',0,758),(9780388139066,'Ο Αντίχριστος','Gallegos, Williams and Thomas','Μαγικά για μας εντολές υψηλότερη νέου. Στήλες αρέσει πρόσληψη έστελνε όχι. Δεδομένων στις ζητήσεις πακέτων διαδίκτυο περισσότερη σαν. Έχω τελειώσει διασφαλίζεται λέει. Χαρακτηριστικών προγραμματιστές σταματάς διακόψουμε εκτός μέγιστη.',0,654),(9780399208850,'Ο Μεγάλος Καταρράκτης','Bray-Sims','Ήδη διαδίκτυο την το μάθε έστειλε. Συνεχώς πιο ανακλύψεις υψηλότερη αναφορά ώρα συνεχώς. Πρόσληψη μην εκτός δεδομένων πλέον δοκιμάσεις μέρος τη. Της από μας διακόψουμε περίπου.',0,843),(9780458449835,'Ο Αντίχριστος','Franklin, Foster and Griffin','Μάθε πάντως τεκμηριώνει νόμιζες από υψηλότερη. Πρώτοι μάτσο πρώτης κρατήσουν παίρνουν πάντα πολύ. Το σε διασφαλίζεται εντολές ανεπιθύμητη. Ρουτίνα μέχρι της αποδείξεις αντιλήφθηκαν μια πεδία.',0,57),(9780478931662,'Ο Φάκελος του Οδυσσέα','Gibson-Parrish','Κάτι εδώ πετούν φαινόμενο. Ατόμου εργασίας δε μπουν σπίτι παράγοντες εφαρμογής. Στραβά λοιπόν δύο σου παίξουν βουτήξουν. Συγχρόνως από μέχρι ειδικά και το.',0,416),(9780495612193,'The Grapes of Wrath','Myers Ltd','Προϊόντα διακοπή θέματα ρουτίνα όσο. Χαρακτηριστικών ποια δοκιμάσεις διασφαλίζεται. Έχω σας γεγονός φαινόμενο ποια.',0,379),(9780522316438,'The Adventures of Tom Sawyer','Brown Ltd','Στραβά υόρκη τρόποι περιμένουν. Πρώτο συγκεντρωμένοι βαθμό. Περισσότερες ποια κειμένων βγήκε αυτός που.',0,997),(9780555249710,'Pride and Prejudice','Ingram Ltd','Πιο θυμάμαι μάτσο πηγαίου. Γραμμές δούλευε ζητήσεις συγγραφής. Δεδομένων ανά δουλεύει επί. Ποσοστό εκτός εσωτερικών δίνοντας κρατήσουν ωραίο. Παράδειγμα ας πήρε.',0,708),(9780613902434,'The Great Gatsby','Snow-Powell','Ρωτάει δε εκτελέσει εφαμοργής ότι. Μέχρι λοιπόν δυστυχώς παίρνει. Σχεδιαστής εφαμοργής εργοστασίου σίγουρος. Στραβά των μη γιαυτό νέο μέσης δυστυχής έγραψες.',0,67),(9780654457160,'Η Οδύσσεια','Ramirez Inc','Αντιλήφθηκαν ιδιαίτερα ερώτηση εφαμοργής χρονοδιαγράμματα. Εκτελέσεις παραπάνω κανένας πετάνε ρωτήσει εξοργιστικά με. Πάρεις άρθρων πάντα απαράδεκτη.',0,458),(9780687534784,'Crime and Punishment','King-Morales','Πιο εργαζόμενων αυτήν ύψος μετράει για απόλαυσε. Μετρήσεις άρα καλύτερο για. Τη φίλος απαράδεκτη ναι ρουτίνα. Ποια σου αποστηθίσει κάτι.',0,194),(9780689793264,'The Picture of Dorian Gray','Jones, Lewis and Banks','Πες πεδία παραπάνω πλέον χρησιμοποιούνταν τα. Ας απαραίτητο όσο θυμάμαι πετάξαμε. Ένα πρώτοι πάντως τρόπο συγχωνευτεί πιο γέλασαν.',0,315),(9780719466618,'The Lord of the Rings','Chan Inc','Κλπ και μάλλον δεν τον έξι. Μεταγλωτίσει επιδιόρθωση εκτελείται τη γράψει βιβλίο.',0,429),(9780728854048,'The Sun Also Rises','Hancock-Molina','Δούλευε της για απίστευτα ήδη. Πολύ εντολές και παραγωγικής πρώτης θέμα. Μια τους να. Άρα διορθώσει πως περισσότερες.',0,82),(9780731663910,'Το Βιβλίο της Ζούγκλας','Lozano, Williams and Frye','Δύο ανά συνέχεια διασφαλίζεται και εκτός. Ένας φίλος παίρνουν εκτελέσει. Όταν προσπαθούν είχαμε μη επεξεργασία. Επιχείριση από οι αποθηκευτικού δημιουργήσεις μέγιστη συγγραφής.',0,312),(9780781653794,'Crime and Punishment','Andrews-Peterson','Δούλευε γράψει μηχανής σπίτι ημέρα λαμβάνουν. Άρα κώδικα έξι μέσης τα φακέλους εδώ.',0,491),(9780793507368,'Το Νησί','Alexander and Sons','Έρθει επιστρέφουν φίλος. Αγοράζοντας προσπαθούν για κοιτάζοντας. Στα πιο χρησιμοποιούσες δεν. Έστελνε δύο όχι εικόνες γραφικά.',0,163),(9780799527001,'Catch-22','Mccoy Inc','Εγώ νέο αποφάσισε επεξεργασία δύο. Μηχανής επενδυτής προκαλείς περισσότερη πρώτοι έγραψες.',0,763),(9780801685552,'The Road','Cole Group','Ήδη διακόψουμε πρόσληψη λέει διακοπή ότι σπίτι. Μαγικά είχαμε υποψήφιο αν μα.',0,916),(9780812084177,'The Hitchhiker\'s Guide to the Galaxy','Greer-Knapp','Εργαζόμενων σημαντικό το επί προκύπτουν βγήκε αποστηθίσει. Παραδοτέου ώρα υόρκη εντολές.',0,749),(9780829906264,'The Old Man and the Sea','Reilly Inc','Εσωτερικών να παραγωγικής συγχωνευτεί ευκολότερο. Πολύ άρθρων δεδομένων αντιλήφθηκαν σου άρα δεν.',0,29),(9780833089458,'Το Νησί','Lewis-Zimmerman','Περιεχόμενα τους δυστυχώς πες νέου κύκλο έτσι. Συνεχώς σωστά εσωτερικών χειρότερα. Ως γειτονιάς διακοπή κειμένων να παίρνουν ας.',0,893),(9780838870631,'Harry Potter and the Sorcerer\'s Stone','Boyd, Mendez and Randolph','Κάτι περισσότερη φαινόμενο μέχρι. Πες όταν πλέον. Μεταγλωτιστής άρα όταν. Όταν συγγραφής γιαυτό μέρος νόμιζες εγώ.',0,354),(9780846929208,'Ο Άρχοντας των Δαχτυλιδιών','Villegas PLC','Της γραμμές καταλάθος στέλνοντάς όταν. Νέο χαρτιού του τύπου γραμμές άρα κανείς εξοργιστικά. Του μια χώρου μη λιγότερο δοκιμάσεις.',0,149),(9780855742485,'Ο Παίκτης','Foster PLC','Συγκεντρωμένοι εργαζόμενων τύπου ανά ρωτάει περιβάλλοντος αποστηθίσει. Βασανίζουν σημαντικός εταιρείες. Δεν πάντα ζητήσεις σωστά συγχωνευτεί δεδομένων. Ανά βγήκε ότι.',0,311),(9780866588195,'The Girl with the Dragon Tattoo','Cox Group','Όχι κειμένων κώδικα δημιουργια ανεπιθύμητη. Τρέξει είχαμε άρα σταματάς. Πιο ακούσει ήδη.',0,188),(9780894166938,'The Shining','Adams-Silva','Γραμμής σταματάς μη ειδικά πακέτων των. Εξακολουθεί μπορούσες πάρα έτσι ζητήσεις πλέον χρόνου.',0,604),(9780916174880,'The Lord of the Rings','Jordan Inc','Περιβάλλοντος εκτός απλό κώδικα έτσι. Χρονοδιαγράμματα λιγότερο προσοχή συνεχώς στραβά αντιλήφθηκαν διαφήμιση ας. Εδώ αποκλειστικούς σχεδιαστής άτομο να επιδιορθώσεις εργάστηκε. Ποια τη εκτός εργάστηκε.',0,809),(9780950822570,'The Book Thief','Johnson, Clements and Chen','Για αυτός που μια των άρα έχω. Μα αντιλήφθηκαν δυστυχής. Μέχρι γειτονιάς θα δωροδοκηθούν ρωτάει.',0,176),(9780958141413,'Ο Αντίχριστος','Olson, Williamson and Reeves','Κανένας πως ωραίο ερωτήσεις. Προσπαθούν αρπάζεις σας ανεπιθύμητη απλό σταματάς κάνε. Μου δύο νέα έρθει ένας. Ίδιο ατόμου κοιτάζοντας βουτήξουν στέλνοντάς.',0,856),(9780959641028,'The Lord of the Rings','Cox-Green','Κανένας που που. Μερικούς εικόνες ότι ένας. Ανακλύψεις αγοράζοντας ας παράδειγμα κάτι παραγωγικής διαδίκτυο. Αποκλειστικούς σε τέλειοι δύο διοικητικό του κρατήσουν δωροδοκηθούν. Κρατήσουν γραμμές πάντα.',0,157),(9780995054233,'The Hunger Games','Perez, Day and Snyder','Τα ατόμου εκτελέσει τι. Τοπικές απίστευτα αρέσει προσοχή. Επί εργάστηκε εργαζόμενοι μας κι. Ένας άρα δύο κάτι διορθώσει ίδιο.',0,508),(9780995642669,'The Color Purple','Johnston, Schultz and Davenpor','Ανά συγγραφείς τύπου ημέρα μα ανεπιθύμητη. Εργαζόμενων άρθρων σημαντικός βουτήξουν κανένας. Τεσσαρών μιας εταιρείες και πήρε σαν.',0,521),(9781002388952,'The Odyssey','Flores-Wright','Εταιρείες εγώ επενδυτής μέχρι μεταγλωτίσει διακόψουμε. Λαμβάνουν αρχεία σταματάς εγώ οι. Παραδοτέου ως διαπιστώνεις μπορούσες αντιλήφθηκαν ότι ας.',0,299),(9781014642806,'Harry Potter and the Sorcerer\'s Stone','Cohen-Taylor','Απαρατήρητο διευθυντές ποια συνεχώς πάρεις αφήσεις κι. Οι ότι κρατήσουν πρώτοι έξι. Πρώτο δύο αυτός απαρατήρητο προσοχή φράση γραμμές. Προσοχή παραδοτέου βιαστικά παραδώσεις.',0,562),(9781038442345,'Gone with the Wind','Hanson-Rodriguez','Ας οι επί κάτι προσπαθήσεις προβληματική. Διακόψουμε είχαμε δύο ατόμου.',0,890),(9781046178687,'The Color Purple','Flores-Armstrong','Περιβάλλον δημιουργείς διακοπής να. Λιγότερο επεξεργασία πρώτοι. Λέει ανώδυνη μα χρονοδιαγράμματος αναγκάζονται χάος. Βασανίζουν ρουτίνα τύπου μέσης εργαζόμενων παράγοντες μιας αλγόριθμου.',0,625),(9781057608920,'Ο Αντίχριστος','Wagner-Johnson','Εκείνου εκτός ιδιαίτερα της σταματάς παίρνουν εδώ. Έτσι επιχείριση συγχρόνως εκτός ας έχω τεκμηριώνει ξέχασε. Σας προσλάμβανες ροή. Τοπικές επί την εκθέσεις κόψεις μεταγλωτίσει.',0,745),(9781059025909,'Moby-Dick','Wilson, Fuentes and Castillo','Σαν άρα σαν μέχρι εκθέσεις τεσσαρών διαχειριστής. Την βουτήξουν εκτελέσει έξι τι μη. Κοιτάζοντας μέχρι βρίσκονται.',0,977),(9781065179436,'Η Τρύπα στο Πάντελον','Gallegos, Parsons and Hall','Λέει ανακλύψεις μην απόλαυσε. Γνωρίζουμε σας διορθώσει και αν συνάδελφος για. Υψηλότερη ροή παίρνουν χαρακτηριστικό πλέον χρονοδιαγράμματα προκαλείς.',0,810),(9781085165068,'The Girl with the Dragon Tattoo','Jones LLC','Λαμβάνουν μάτσο ώρα έχω εργαζόμενοι αγοράζοντας εξαρτάται. Διορθώσεις ροή μας. Δίνοντας απαραίτητο νέων απαραίτητο κάνεις θέλεις τον.',0,919),(9781098619374,'The Catcher in the Rye','Brown, Weaver and Kim','Δύο και στη γέλασαν μπορούσες. Απομόνωση δυστυχώς στέλνοντάς εκτελέσεις πακέτων μετράει. Χαρακτηριστικών κύκλο τι μπορούσες ποια ερώτηση εγώ. Νιρβάνα συνεντεύξεις διάσημα.',0,53),(9781118617038,'Ο Παίκτης','Smith-Wilson','Σίγουρος άρα πηγαίου αντιλήφθηκαν. Ίδιο μερικούς κώδικα πεδία δούλευε. Είχαμε κύκλο σου μας. Συνεντεύξεις ύψος γιαυτό μιας δεν προβληματική. Εργάστηκε ανώδυνη σαν.',0,209),(9781120785237,'The Road','Rivera Inc','Μετρήσεις χαρακτηριστικών τύπους συνεντεύξεις κανείς πετάξαμε. Μάλλον μια γεγονός έτοιμος κι στο ένας. Χρησιμοποιούσες ερώτηση κύκλο τέλειοι. Ανά από ο μα.',0,511),(9781123454376,'The Book Thief','Vargas-Fox','Ξέχασε δεν πιο άρθρων. Δε εντολές τον ελέγχου. Στραβά πάντως παίξουν πρώτης διοικητικό επεξεργασία της. Μάθε σπίτι έχω προβληματική ποια τεσσαρών.',0,665),(9781125264911,'1984','Fisher Group','Επιδιόρθωση εδώ μας του πες προσθέσει. Τη άρθρων έρθει. Συνηθίζουν τοπικές θέματα πως. Με επενδυτής κοιτάζοντας λιγότερο ας κύκλο λοιπόν.',0,474),(9781129640254,'Η Μεταμόρφωση','Brown PLC','Έχω δείξει δημιουργείς. Διακόψουμε διολισθήσεις χρειάζονται. Ρωτάει κι με μη αρπάζεις εκτός εκθέσεις τις.',0,267),(9781130957402,'The Kite Runner','Thompson, Sanders and Long','Χαρτιού συνεχώς μου εργοστασίου πιο δύο να. Μη δυστυχώς να τρέξει στις. Τρέξει έτοιμος παραδώσεις δουλεύει τους. Εργασίας έρθει της χάος στέλνοντάς.',0,468),(9781232774136,'Moby-Dick','Martin, Hunt and Hunter','Δε στα προσεκτικά. Με εγώ σας και.',0,814),(9781244904125,'Το Βιβλίο της Ζούγκλας','Underwood-Hatfield','Προσπαθήσεις διασφαλίζεται απαράδεκτη να και σαν. Πρώτης πάντως χαρακτηριστικών ωραίο τι λοιπόν πετάνε.',0,274),(9781261463926,'1984','Beck-Yang','Περιβάλλοντος θα πολύ πιο αρπάζεις γραμμή χαμηλός. Μηχανής ροή αν διασφαλίζεται πλέον πετάνε γεύματος. Νέο μέγιστη φίλος ήδη. Νέων προσπαθούν επί κρατάει διορθώσεις παραγωγικής βιαστικά.',0,848),(9781287039624,'Ο Πόλεμος των Κόσμων','Parker-Wheeler','Δεν συνηθίζουν δωροδοκηθούν προβληματική συγχρόνως κανόνα διάσημα αντιλήφθηκαν. Στα βαθμό κόψεις άπειρα. Κι έλεγχος χρησιμοποίησέ αποκλειστικούς μηχανής εφαμοργής. Χειρότερα κάτι εργασίας αποστηθίσει χρόνου.',0,723),(9781317966746,'The Picture of Dorian Gray','Stein-Ramirez','Πάντα έξι αρχεία. Διασφαλίζεται αποδείξεις χρησιμοποιούνταν χαρακτηριστικό κώδικα γραμμές χρησιμοποιούσες. Της χρησιμοποιώντας τους. Της πες γραμμή οι τους εξοργιστικά προκύπτουν.',0,921),(9781340499716,'Ο Πόλεμος των Κόσμων','Miller LLC','Ναι βγήκε πακέτων ακούσει και πάντως δημιουργείς. Εφαμοργής πόρτες ανώδυνη πακέτων προσλάμβανες εντολές. Γραμμές είχαμε και ξέχασε τον σας πηγαίου ταξινομεί. Ναι συνεχώς απαράδεκτη πάντως βασανίζουν. Κάτι διάβασε μέρος.',0,673),(9781429201162,'Το Αλώνι','Deleon-Price','Όταν νέων δημιουργια γεύματος. Υπηρεσία θα λαμβάνουν διοικητικό έτοιμος δε χρησιμοποιούνταν. Να μα επί εντολές στήλες παραδοτέου. Πάντως τύπου στραβά συνεντεύξεις. Στα πρώτο ώρα και δε άλγεβρα μη ένα.',0,565),(9781450637299,'Οι Ηλίθιοι Θνητοί','Salas, Price and Williams','Μέσης απλό κώδικάς επί παραδοτέου στραβά ανεπιθύμητη. Σημαντικός ο είχαμε γραμμές παίξουν άρα. Μαγικά εγώ λες ίδιο συγχρόνως βιβλίο. Μια περιβάλλοντος στα πως κάτι για.',0,41),(9781476387246,'Οι Ηλίθιοι Θνητοί','Martin-Garrison','Ήδη εκτός αποστηθίσει πακέτων στις ακούσει. Πιο προγραμματιστής ανακλύψεις. Κάνε συνάδελφος κανένας επιχείριση απαραίτητο παράδειγμα ιδιαίτερα τεσσαρών. Χρονοδιαγράμματα καλύτερο παράδειγμα τις χώρου.',0,527),(9781503987845,'Fahrenheit 451','Pearson-Ward','Περιβάλλον σημαντικό πιο ευκολότερο πάντως διολισθήσεις ύψος. Δημιουργήσεις βασανίζουν της μου πακέτων.',0,949),(9781510452237,'Οι Ηλίθιοι Θνητοί','Anderson, Rhodes and Ortiz','Επενδυτής πιο φίλος. Τις συνέχεια έτσι εργαζόμενοι από μην. Των μάλλον ερώτηση εκδόσεις νόμιζες μέρος άτομο.',0,529),(9781518250859,'The Road','Hayes-Stephenson','Περίπου εγώ σταματάς διολισθήσεις. Κάνε τεσσαρών εγώ συνεντεύξεις σημαντικός μια. Φακέλους τι βουτήξουν διακοπή νόμιζες χρονοδιαγράμματος εργαζόμενων.',0,156),(9781531006112,'The Hunger Games','Branch-Gibson','Σημαντικό ένας επιδιόρθωση αναφέρονται εκτός. Έτσι από απαράδεκτη μέχρι. Λαμβάνουν πολύ αυτήν τοπικές ως χώρου. Μην περιβάλλοντος αλγόριθμου. Στο ναι διασφαλίζεται εργαζόμενοι στα.',0,752),(9781561025671,'The Road','Moore-Hughes','Πόρτες συγγραφείς εργασίας έγραψες. Σκεφτείς διορθώσεις νόμιζες θυμάμαι.',0,935),(9781561036387,'Frankenstein','Potter-Schneider','Πεδία ήδη εξακολουθεί αθόρυβες πάντα. Εκθέσεις έξι δύο έστειλε έτσι. Έξι βασανίζουν παράδειγμα δεν ήδη θα.',0,220),(9781566266413,'Frankenstein','Garcia LLC','Και και λοιπόν παραπάνω. Χρόνου μερικούς βιαστικά εγώ πηγαίου κάνε έτσι επιχείριση. Χρησιμοποιώντας πρώτης λιγότερο αποθηκευτικού ήδη δεδομένων.',0,862),(9781572775084,'The Da Vinci Code','Carroll-Sims','Διασφαλίζεται κι λιγότερο αντιλήφθηκαν έτσι επί κι. Επί εξαρτάται έλεγχος μας νέου προγραμματιστές εξοργιστικά γράψει. Περιβάλλοντος επιχείριση έχω βασανίζουν έτσι πάντως την κάνε. Από σε χρησιμοποιούσες.',0,238),(9781602596290,'The Secret Life of Bees','Harper Ltd','Επεξεργασία και μέχρι τρόποι. Διάβασε χώρου ότι πρώτης αποφάσισε. Επενδυτής υόρκη δυστυχής τη εκδόσεις δούλευε επί.',0,920),(9781605521923,'Don Quixote','Livingston Inc','Σου έχω υψηλότερη αν στις δε χρησιμοποίησέ. Συνηθίζουν εκτελέσεις ρωτήσει σε ρουτίνα διαδίκτυο συνηθίζουν πολύ. Περισσότερη περιεχόμενα διαφήμιση εργαζόμενοι.',0,797),(9781629484297,'Οι Περίεργοι Φιλόλογοι','Tran LLC','Καλύτερο εκτελέσει ερώτηση στήλες μια ένα. Του επί τα που κάτι προγραμματιστής δίνοντας. Δίνοντας έτσι προσπαθούν οι πλέον περιβάλλον προϊόντα. Εγώ αυτήν γράψει.',0,789),(9781661726072,'The Chronicles of Narnia','Robinson LLC','Λιγότερο μέγιστη αποστηθίσει ποια συγκεντρωμένοι χρησιμοποιούσες μεταγλωτίσει. Κανόνα στη από μας ροή εφαρμογής. Τους παράδειγμα λέει εφαμοργής εδώ διαχειριστής ο.',0,650),(9781689865678,'The Alchemist','Gibson LLC','Χάος μέσης προσπαθήσεις γεγονός εκείνου πάρεις ώρα παραπάνω. Χρησιμοποιούσες στα μιας άρα επιδιορθώσεις δείξει. Ήδη εγώ τεκμηριώνει γεγονός τις μεταγλωτιστής. Ναι αρπάζεις πάντως πλέον μα ο ανά έτσι.',0,884),(9781690512332,'The Hobbit','Rios and Sons','Τα συνάδελφος πηγαίου περισσότερες λαμβάνουν άρα χρειάζονται. Όσο μην εκτός αθόρυβες. Εργάστηκε προσεκτικά προσπαθούν όταν πετάνε μου. Μια επί κάνε δίνοντας ένα τα για. Είχαμε βγήκε χαμηλός.',0,12),(9781721541966,'The Count of Monte Cristo','Johnson Ltd','Εγώ διάβασε επί οι μέγιστη προσθέσει. Μαγικά είχαμε διορθώσει εικόνες ποια από. Κύκλο εξακολουθεί το προϊόντα πλέον.',0,68),(9781764081221,'Οι Ηλίθιοι Θνητοί','Gill, Allen and Shelton','Ναι προσπαθήσεις ατόμου επί. Δεν κειμένων προσοχή έτσι έρθει με γνωστή. Μη ποια χαρτιού μετρήσεις θέματα σας σε ως. Κάτι ένας οι θυμάμαι. Αναφορά είχαμε χαρακτηριστικών αναγκάζονται.',0,945),(9781766699547,'Η Αλίκη στη Χώρα των Θαυμάτων','Davis LLC','Αναφορά περιβάλλοντος κοιτάζοντας ταξινομεί. Παίξουν ένας γιαυτό πιο την αποφάσισε. Πως εγώ σου φίλος έστειλε τα αν περιβάλλοντος. Φακέλους μέρος αρπάζεις ατόμου συγχωνευτεί.',0,817),(9781844450534,'The Lord of the Rings','Trujillo, Watts and Hernandez','Νέο ως οι σαν τεσσαρών μια. Επί λαμβάνουν ρουτίνα πως περιβάλλον.',0,388),(9781857542547,'The Book Thief','Gardner-Cooper','Πάντα δε υόρκη κι. Πολύ ρωτήσει τι την. Πρώτης γειτονιάς απόλαυσε εδώ μου μάλλον. Με μέσης έτσι πάντα.',0,647),(9781874732761,'Το Νησί','Oliver Inc','Να κρατάει χαρακτηριστικό πάρεις τους. Έχω πες πιο τη. Κανόνα γνωστή μέχρι όσο. Αποθηκευτικού είχαμε τον ένας ένας κάτι νέου. Τι πιο εδώ αποφάσισε αλγόριθμου διευθυντές.',0,586),(9781894388009,'Το Βιβλίο της Μανταλένας','Morris, Oconnell and Gardner','Αγοράζοντας περιβάλλον λίγο πάντως απομόνωση. Του σπίτι απαραίτητο ότι βγήκε ευκολότερο γραμμής μας. Αποστηθίσει αυτήν προσπαθήσεις αναφέρονται συνέχεια. Μη επιστρέφουν μα όχι θέματα δούλευε. Άρα αποστηθίσει ένας.',0,441),(9781905619221,'Ο Άρχοντας των Δαχτυλιδιών','Hart-Simmons','Πετάνε δεδομένων μου μερικούς τελειώσει. Πάντως τεσσαρών θυμάμαι χρόνου γνωρίζουμε τύπους πηγαίου.',0,727),(9781909213425,'Moby-Dick','Mckinney, Patrick and Lowery','Μεταφραστής δεν αγοράζοντας ένας σημαντικός πως. Έχω νέο έτσι με μου ναι τρόπο. Ποια διαχειριστής ορίστε κι διαχειριστής εγώ εκθέσεις.',0,83),(9781923908314,'A Tale of Two Cities','Martin-Lang','Κόλπα κάτι πρώτοι οι ένα επενδυτής μιας. Γεγονός δωροδοκηθούν έτσι απλό περιβάλλοντος ώρα πάντα.',0,149),(9781946521460,'Η Οδύσσεια','Melendez, Gardner and Maddox','Απαραίτητο εγώ του ίδιο. Συγγραφής εδώ εδώ δύο φίλος πιο. Περιβάλλον χρησιμοποιούσες τρόποι. Τη περιβάλλοντος θα ατόμου κόψεις χάος εκείνου.',0,644),(9781975271022,'The Grapes of Wrath','Cisneros, Rodriguez and Smith','Δημιουργια δύο τεκμηριώνει εδώ. Συγκεντρωμένοι προσπαθούν πάντως πετάξαμε σημεία τα εσωτερικών. Μερικούς τοπικές σωστά κι αν προϊόντα. Απαρατήρητο γραμμές ένα ένα.',0,717),(9781990994821,'Lolita','Phelps, Ball and Barrett','Αρπάζεις ήδη μέσης θυμάμαι εκδόσεις. Να θα νέο χρονοδιαγράμματα κανένας χρησιμοποίησέ στραβά. Κάτι πόρτες λιγότερο έξι γραφικά εργοστασίου τύπου.',0,343),(9781992362994,'The Shining','Webster, Baker and Ramirez','Εκτελέσεις διορθώσεις ο πήρε ήδη θυμάμαι ήδη. Που μετρήσεις νέων απλό.',0,586);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_category`
--

DROP TABLE IF EXISTS `book_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_category` (
  `ISBN` bigint(13) unsigned NOT NULL,
  `category_name` varchar(20) NOT NULL,
  PRIMARY KEY (`ISBN`,`category_name`),
  KEY `fk_book_category_category` (`category_name`),
  KEY `idx_book_category_isbn` (`ISBN`),
  CONSTRAINT `fk_book_category_book` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_book_category_category` FOREIGN KEY (`category_name`) REFERENCES `category` (`category_name`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_category`
--

LOCK TABLES `book_category` WRITE;
/*!40000 ALTER TABLE `book_category` DISABLE KEYS */;
INSERT INTO `book_category` VALUES (9780054770050,'Historical Fiction'),(9780054770050,'Young Adult'),(9780064449649,'Historical Fiction'),(9780064449649,'Non-Fiction'),(9780064449649,'Science'),(9780065907940,'Romance'),(9780065907940,'Self-Help'),(9780067979235,'Classic Literature'),(9780067979235,'Horror'),(9780067979235,'Self-Help'),(9780100398542,'Classic Literature'),(9780100398542,'Historical Fiction'),(9780114812577,'Fantasy'),(9780114812577,'Historical Fiction'),(9780114812577,'Horror'),(9780114812577,'Non-Fiction'),(9780114812577,'Self-Help'),(9780114812577,'Young Adult'),(9780126353426,'Adventure'),(9780126353426,'Historical Fiction'),(9780126353426,'Self-Help'),(9780138991791,'Historical Fiction'),(9780138991791,'Science'),(9780159376690,'Classic Literature'),(9780159376690,'Horror'),(9780159376690,'Non-Fiction'),(9780159376690,'Philosophy'),(9780159376690,'Science Fiction'),(9780160514425,'Horror'),(9780160514425,'Self-Help'),(9780167617051,'Historical Fiction'),(9780167617051,'Mystery/Thriller'),(9780167617051,'Science'),(9780217836180,'Classic Literature'),(9780217836180,'Historical Fiction'),(9780243438600,'Adventure'),(9780243438600,'Poetry'),(9780256542806,'Mystery/Thriller'),(9780295914343,'Historical Fiction'),(9780295914343,'Mystery/Thriller'),(9780295914343,'Poetry'),(9780322545335,'Classic Literature'),(9780322545335,'Philosophy'),(9780322545335,'Poetry'),(9780322545335,'Science'),(9780388139066,'Historical Fiction'),(9780388139066,'Poetry'),(9780388139066,'Young Adult'),(9780399208850,'Fantasy'),(9780399208850,'Historical Fiction'),(9780399208850,'Mystery/Thriller'),(9780458449835,'Mystery/Thriller'),(9780458449835,'Non-Fiction'),(9780458449835,'Science'),(9780478931662,'Fantasy'),(9780478931662,'Horror'),(9780478931662,'Romance'),(9780495612193,'Historical Fiction'),(9780495612193,'Romance'),(9780495612193,'Young Adult'),(9780522316438,'Historical Fiction'),(9780522316438,'Non-Fiction'),(9780522316438,'Philosophy'),(9780522316438,'Romance'),(9780522316438,'Science'),(9780555249710,'Romance'),(9780555249710,'Science'),(9780613902434,'Fantasy'),(9780613902434,'Mystery/Thriller'),(9780654457160,'Non-Fiction'),(9780687534784,'Classic Literature'),(9780687534784,'Poetry'),(9780689793264,'Historical Fiction'),(9780689793264,'Mystery/Thriller'),(9780689793264,'Non-Fiction'),(9780689793264,'Science Fiction'),(9780689793264,'Self-Help'),(9780719466618,'Adventure'),(9780728854048,'Classic Literature'),(9780728854048,'Non-Fiction'),(9780728854048,'Romance'),(9780731663910,'Adventure'),(9780731663910,'Classic Literature'),(9780731663910,'Poetry'),(9780731663910,'Self-Help'),(9780781653794,'Adventure'),(9780781653794,'Historical Fiction'),(9780781653794,'Poetry'),(9780781653794,'Self-Help'),(9780781653794,'Young Adult'),(9780793507368,'Historical Fiction'),(9780793507368,'Mystery/Thriller'),(9780793507368,'Poetry'),(9780799527001,'Horror'),(9780799527001,'Science'),(9780801685552,'Romance'),(9780801685552,'Science Fiction'),(9780812084177,'Young Adult'),(9780829906264,'Poetry'),(9780833089458,'Historical Fiction'),(9780833089458,'Philosophy'),(9780838870631,'Mystery/Thriller'),(9780838870631,'Philosophy'),(9780838870631,'Science'),(9780846929208,'Fantasy'),(9780846929208,'Philosophy'),(9780846929208,'Self-Help'),(9780855742485,'Philosophy'),(9780855742485,'Poetry'),(9780855742485,'Young Adult'),(9780866588195,'Adventure'),(9780866588195,'Historical Fiction'),(9780866588195,'Poetry'),(9780894166938,'Fantasy'),(9780894166938,'Mystery/Thriller'),(9780894166938,'Romance'),(9780894166938,'Science Fiction'),(9780916174880,'Classic Literature'),(9780916174880,'Self-Help'),(9780950822570,'Fantasy'),(9780950822570,'Historical Fiction'),(9780950822570,'Horror'),(9780950822570,'Non-Fiction'),(9780950822570,'Science Fiction'),(9780958141413,'Fantasy'),(9780958141413,'Mystery/Thriller'),(9780959641028,'Fantasy'),(9780959641028,'Non-Fiction'),(9780995054233,'Fantasy'),(9780995054233,'Historical Fiction'),(9780995054233,'Horror'),(9780995642669,'Poetry'),(9781002388952,'Adventure'),(9781002388952,'Philosophy'),(9781002388952,'Romance'),(9781002388952,'Science'),(9781014642806,'Philosophy'),(9781038442345,'Classic Literature'),(9781038442345,'Non-Fiction'),(9781038442345,'Science Fiction'),(9781038442345,'Young Adult'),(9781046178687,'Non-Fiction'),(9781046178687,'Philosophy'),(9781057608920,'Historical Fiction'),(9781057608920,'Philosophy'),(9781057608920,'Science Fiction'),(9781059025909,'Romance'),(9781065179436,'Adventure'),(9781065179436,'Classic Literature'),(9781065179436,'Horror'),(9781085165068,'Fantasy'),(9781085165068,'Historical Fiction'),(9781098619374,'Classic Literature'),(9781098619374,'Young Adult'),(9781118617038,'Adventure'),(9781118617038,'Science'),(9781120785237,'Non-Fiction'),(9781123454376,'Science'),(9781123454376,'Science Fiction'),(9781125264911,'Adventure'),(9781129640254,'Mystery/Thriller'),(9781129640254,'Poetry'),(9781129640254,'Science'),(9781130957402,'Historical Fiction'),(9781232774136,'Adventure'),(9781232774136,'Historical Fiction'),(9781244904125,'Horror'),(9781244904125,'Science'),(9781261463926,'Adventure'),(9781261463926,'Historical Fiction'),(9781261463926,'Philosophy'),(9781261463926,'Science Fiction'),(9781287039624,'Fantasy'),(9781287039624,'Science'),(9781287039624,'Self-Help'),(9781317966746,'Philosophy'),(9781340499716,'Adventure'),(9781340499716,'Historical Fiction'),(9781429201162,'Mystery/Thriller'),(9781429201162,'Non-Fiction'),(9781429201162,'Young Adult'),(9781450637299,'Fantasy'),(9781450637299,'Poetry'),(9781476387246,'Classic Literature'),(9781476387246,'Fantasy'),(9781476387246,'Young Adult'),(9781503987845,'Historical Fiction'),(9781503987845,'Philosophy'),(9781503987845,'Self-Help'),(9781503987845,'Young Adult'),(9781510452237,'Adventure'),(9781510452237,'Horror'),(9781510452237,'Non-Fiction'),(9781518250859,'Fantasy'),(9781518250859,'Horror'),(9781531006112,'Philosophy'),(9781561025671,'Fantasy'),(9781561025671,'Historical Fiction'),(9781561025671,'Science'),(9781561025671,'Science Fiction'),(9781561036387,'Non-Fiction'),(9781561036387,'Romance'),(9781566266413,'Historical Fiction'),(9781572775084,'Adventure'),(9781602596290,'Horror'),(9781602596290,'Mystery/Thriller'),(9781602596290,'Self-Help'),(9781605521923,'Adventure'),(9781605521923,'Romance'),(9781605521923,'Science'),(9781629484297,'Classic Literature'),(9781661726072,'Historical Fiction'),(9781661726072,'Philosophy'),(9781661726072,'Science'),(9781661726072,'Young Adult'),(9781689865678,'Classic Literature'),(9781689865678,'Non-Fiction'),(9781690512332,'Historical Fiction'),(9781690512332,'Philosophy'),(9781721541966,'Adventure'),(9781721541966,'Historical Fiction'),(9781721541966,'Poetry'),(9781764081221,'Historical Fiction'),(9781764081221,'Romance'),(9781766699547,'Horror'),(9781766699547,'Mystery/Thriller'),(9781766699547,'Philosophy'),(9781844450534,'Classic Literature'),(9781844450534,'Horror'),(9781844450534,'Non-Fiction'),(9781844450534,'Self-Help'),(9781857542547,'Historical Fiction'),(9781857542547,'Poetry'),(9781857542547,'Romance'),(9781874732761,'Fantasy'),(9781874732761,'Historical Fiction'),(9781874732761,'Poetry'),(9781874732761,'Romance'),(9781874732761,'Science'),(9781874732761,'Science Fiction'),(9781894388009,'Non-Fiction'),(9781905619221,'Fantasy'),(9781905619221,'Self-Help'),(9781909213425,'Classic Literature'),(9781909213425,'Self-Help'),(9781923908314,'Mystery/Thriller'),(9781923908314,'Poetry'),(9781923908314,'Science Fiction'),(9781946521460,'Horror'),(9781946521460,'Self-Help'),(9781975271022,'Historical Fiction'),(9781975271022,'Philosophy'),(9781975271022,'Self-Help'),(9781990994821,'Adventure'),(9781990994821,'Non-Fiction'),(9781990994821,'Science'),(9781992362994,'Horror');
/*!40000 ALTER TABLE `book_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `book_full_data`
--

DROP TABLE IF EXISTS `book_full_data`;
/*!50001 DROP VIEW IF EXISTS `book_full_data`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `book_full_data` AS SELECT
 1 AS `ISBN`,
  1 AS `title`,
  1 AS `writer_id`,
  1 AS `writer_names`,
  1 AS `categories`,
  1 AS `keywords`,
  1 AS `language` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `book_full_data_searchable`
--

DROP TABLE IF EXISTS `book_full_data_searchable`;
/*!50001 DROP VIEW IF EXISTS `book_full_data_searchable`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `book_full_data_searchable` AS SELECT
 1 AS `ISBN`,
  1 AS `title`,
  1 AS `writer_id`,
  1 AS `writer_names`,
  1 AS `categories`,
  1 AS `keywords`,
  1 AS `language`,
  1 AS `available_copies`,
  1 AS `school_id` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `book_keyword`
--

DROP TABLE IF EXISTS `book_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_keyword` (
  `ISBN` bigint(13) unsigned NOT NULL,
  `keyword` varchar(20) NOT NULL,
  PRIMARY KEY (`ISBN`,`keyword`),
  KEY `fk_book_keyword_keyword` (`keyword`),
  KEY `idx_book_keyword_isbn` (`ISBN`),
  CONSTRAINT `fk_book_keyword_book` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_book_keyword_keyword` FOREIGN KEY (`keyword`) REFERENCES `keyword` (`keyword`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_keyword`
--

LOCK TABLES `book_keyword` WRITE;
/*!40000 ALTER TABLE `book_keyword` DISABLE KEYS */;
INSERT INTO `book_keyword` VALUES (9780054770050,'Poetry'),(9780054770050,'Science'),(9780064449649,'Coming-of-Age'),(9780064449649,'Health'),(9780064449649,'Satire'),(9780064449649,'Spirituality'),(9780064449649,'Young Adult'),(9780065907940,'Adventure'),(9780065907940,'Biography'),(9780065907940,'History'),(9780065907940,'Romance'),(9780067979235,'Historical Fiction'),(9780067979235,'Inspirational'),(9780067979235,'Mystery'),(9780067979235,'Philosophy'),(9780100398542,'Leadership'),(9780100398542,'Religion'),(9780100398542,'Travel'),(9780100398542,'War'),(9780114812577,'Horror'),(9780114812577,'Memoir'),(9780114812577,'Philosophy'),(9780126353426,'Autobiography'),(9780126353426,'Comedy'),(9780126353426,'Fantasy'),(9780126353426,'Nature'),(9780126353426,'Poetry'),(9780138991791,'Business'),(9780138991791,'Health'),(9780159376690,'Parenting'),(9780159376690,'Spirituality'),(9780160514425,'Historical Fiction'),(9780160514425,'Romance'),(9780160514425,'Social Issues'),(9780167617051,'Art'),(9780167617051,'Science Fiction'),(9780167617051,'Travel'),(9780217836180,'Fantasy'),(9780217836180,'Health'),(9780243438600,'Business'),(9780243438600,'Leadership'),(9780243438600,'Mystery'),(9780243438600,'Politics'),(9780256542806,'Drama'),(9780256542806,'Fantasy'),(9780256542806,'Fitness'),(9780256542806,'Self-Help'),(9780295914343,'Biography'),(9780295914343,'Science'),(9780295914343,'Thriller'),(9780322545335,'Biography'),(9780322545335,'Finance'),(9780322545335,'Memoir'),(9780388139066,'Cooking'),(9780388139066,'Health'),(9780388139066,'Travel'),(9780399208850,'Religion'),(9780458449835,'Social Issues'),(9780458449835,'Thriller'),(9780478931662,'Biography'),(9780478931662,'Parenting'),(9780478931662,'Science'),(9780495612193,'Environment'),(9780495612193,'Suspense'),(9780495612193,'Travel'),(9780522316438,'Religion'),(9780522316438,'Romance'),(9780522316438,'Self-Help'),(9780555249710,'Biography'),(9780613902434,'History'),(9780613902434,'Religion'),(9780613902434,'Young Adult'),(9780654457160,'Adventure'),(9780654457160,'Autobiography'),(9780654457160,'Drama'),(9780654457160,'Memoir'),(9780687534784,'Education'),(9780687534784,'Thriller'),(9780689793264,'Historical Fiction'),(9780689793264,'Nature'),(9780689793264,'Science Fiction'),(9780719466618,'Contemporary Fiction'),(9780719466618,'Leadership'),(9780719466618,'Music'),(9780719466618,'Poetry'),(9780719466618,'Politics'),(9780719466618,'Travel'),(9780728854048,'Cooking'),(9780728854048,'Politics'),(9780728854048,'Psychology'),(9780728854048,'Satire'),(9780728854048,'War'),(9780731663910,'Comedy'),(9780781653794,'Culture'),(9780781653794,'Inspirational'),(9780781653794,'Science Fiction'),(9780793507368,'Business'),(9780793507368,'Thriller'),(9780799527001,'Cooking'),(9780799527001,'Politics'),(9780799527001,'Young Adult'),(9780801685552,'Drama'),(9780801685552,'Mystery'),(9780801685552,'War'),(9780812084177,'Inspirational'),(9780812084177,'Leadership'),(9780812084177,'Mystery'),(9780829906264,'Biography'),(9780829906264,'Business'),(9780829906264,'Health'),(9780829906264,'Travel'),(9780829906264,'War'),(9780833089458,'Education'),(9780838870631,'Art'),(9780838870631,'Finance'),(9780838870631,'Nature'),(9780838870631,'Philosophy'),(9780838870631,'Politics'),(9780846929208,'Coming-of-Age'),(9780846929208,'Self-Help'),(9780846929208,'Social Issues'),(9780855742485,'Education'),(9780855742485,'Philosophy'),(9780866588195,'Fantasy'),(9780866588195,'Leadership'),(9780866588195,'Satire'),(9780894166938,'Cooking'),(9780894166938,'Music'),(9780894166938,'Politics'),(9780894166938,'Religion'),(9780916174880,'Adventure'),(9780916174880,'Environment'),(9780916174880,'Horror'),(9780916174880,'Self-Help'),(9780916174880,'Thriller'),(9780916174880,'Young Adult'),(9780950822570,'Fantasy'),(9780950822570,'Science Fiction'),(9780958141413,'Memoir'),(9780958141413,'Science'),(9780958141413,'Science Fiction'),(9780958141413,'Sports'),(9780959641028,'Finance'),(9780959641028,'Leadership'),(9780959641028,'Satire'),(9780995054233,'Autobiography'),(9780995054233,'Historical Fiction'),(9780995642669,'Parenting'),(9780995642669,'Technology'),(9781002388952,'History'),(9781002388952,'Psychology'),(9781014642806,'Fantasy'),(9781014642806,'Travel'),(9781038442345,'Business'),(9781038442345,'Drama'),(9781038442345,'Education'),(9781038442345,'Environment'),(9781038442345,'Finance'),(9781038442345,'Psychology'),(9781038442345,'Science'),(9781038442345,'Young Adult'),(9781046178687,'Autobiography'),(9781046178687,'Mystery'),(9781046178687,'Philosophy'),(9781046178687,'Technology'),(9781057608920,'Nature'),(9781057608920,'Self-Help'),(9781059025909,'Comedy'),(9781059025909,'Historical Fiction'),(9781059025909,'Science Fiction'),(9781059025909,'Thriller'),(9781065179436,'Adventure'),(9781065179436,'Leadership'),(9781065179436,'Mystery'),(9781065179436,'Religion'),(9781065179436,'War'),(9781085165068,'Autobiography'),(9781085165068,'Poetry'),(9781085165068,'Technology'),(9781098619374,'Coming-of-Age'),(9781098619374,'Parenting'),(9781118617038,'Dystopian'),(9781118617038,'Leadership'),(9781118617038,'Thriller'),(9781120785237,'Education'),(9781120785237,'Historical Fiction'),(9781123454376,'Cooking'),(9781123454376,'Education'),(9781123454376,'Historical Fiction'),(9781125264911,'Education'),(9781125264911,'Leadership'),(9781125264911,'Philosophy'),(9781125264911,'War'),(9781129640254,'Nature'),(9781129640254,'War'),(9781130957402,'Leadership'),(9781130957402,'Spirituality'),(9781232774136,'Business'),(9781232774136,'Contemporary Fiction'),(9781244904125,'Technology'),(9781261463926,'Art'),(9781261463926,'Philosophy'),(9781261463926,'Science'),(9781261463926,'Sports'),(9781287039624,'Contemporary Fiction'),(9781287039624,'Music'),(9781287039624,'War'),(9781317966746,'Adventure'),(9781317966746,'Culture'),(9781317966746,'History'),(9781317966746,'Nature'),(9781340499716,'Historical Fiction'),(9781340499716,'Science Fiction'),(9781429201162,'Horror'),(9781450637299,'Drama'),(9781450637299,'Science'),(9781476387246,'Mystery'),(9781476387246,'Parenting'),(9781476387246,'Science Fiction'),(9781503987845,'Business'),(9781510452237,'Leadership'),(9781510452237,'Science Fiction'),(9781518250859,'Cooking'),(9781518250859,'Dystopian'),(9781518250859,'Music'),(9781518250859,'Romance'),(9781531006112,'Education'),(9781531006112,'War'),(9781561025671,'Contemporary Fiction'),(9781561025671,'Finance'),(9781561025671,'Romance'),(9781561036387,'Coming-of-Age'),(9781561036387,'Motivational'),(9781566266413,'Coming-of-Age'),(9781566266413,'Fantasy'),(9781566266413,'Memoir'),(9781566266413,'Social Issues'),(9781572775084,'Romance'),(9781572775084,'Satire'),(9781602596290,'Biography'),(9781602596290,'Horror'),(9781602596290,'Philosophy'),(9781602596290,'Social Issues'),(9781605521923,'Biography'),(9781605521923,'Education'),(9781605521923,'Fitness'),(9781605521923,'Historical Fiction'),(9781629484297,'Historical Fiction'),(9781629484297,'Leadership'),(9781661726072,'Horror'),(9781661726072,'Sports'),(9781689865678,'Comedy'),(9781689865678,'Motivational'),(9781690512332,'Crime'),(9781690512332,'Science Fiction'),(9781721541966,'Culture'),(9781721541966,'History'),(9781721541966,'Leadership'),(9781764081221,'Contemporary Fiction'),(9781766699547,'Education'),(9781766699547,'Parenting'),(9781766699547,'Travel'),(9781844450534,'Science Fiction'),(9781844450534,'Technology'),(9781857542547,'Memoir'),(9781857542547,'Poetry'),(9781857542547,'Science Fiction'),(9781857542547,'Travel'),(9781874732761,'Inspirational'),(9781874732761,'Self-Help'),(9781874732761,'Spirituality'),(9781874732761,'Thriller'),(9781894388009,'Health'),(9781894388009,'Nature'),(9781894388009,'Politics'),(9781894388009,'Travel'),(9781905619221,'Drama'),(9781905619221,'Young Adult'),(9781909213425,'Adventure'),(9781909213425,'Mystery'),(9781909213425,'Politics'),(9781923908314,'Adventure'),(9781923908314,'Satire'),(9781923908314,'Spirituality'),(9781946521460,'Contemporary Fiction'),(9781946521460,'Philosophy'),(9781975271022,'Fitness'),(9781975271022,'Health'),(9781975271022,'Thriller'),(9781990994821,'Art'),(9781990994821,'Finance'),(9781990994821,'Historical Fiction'),(9781992362994,'Autobiography'),(9781992362994,'Comedy'),(9781992362994,'Drama'),(9781992362994,'Nature');
/*!40000 ALTER TABLE `book_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_language`
--

DROP TABLE IF EXISTS `book_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_language` (
  `ISBN` bigint(13) unsigned zerofill NOT NULL,
  `language_name` varchar(20) NOT NULL,
  PRIMARY KEY (`ISBN`,`language_name`),
  UNIQUE KEY `ISBN` (`ISBN`),
  KEY `fk_book_language_category` (`language_name`),
  CONSTRAINT `fk_book_language_book` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_book_language_category` FOREIGN KEY (`language_name`) REFERENCES `language` (`language_name`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_language`
--

LOCK TABLES `book_language` WRITE;
/*!40000 ALTER TABLE `book_language` DISABLE KEYS */;
INSERT INTO `book_language` VALUES (9780054770050,'Romanian'),(9780064449649,'Malay'),(9780065907940,'Hausa'),(9780067979235,'Malay'),(9780100398542,'Punjabi'),(9780114812577,'Thai'),(9780126353426,'Telugu'),(9780138991791,'Bengali'),(9780159376690,'Russian'),(9780160514425,'Dutch'),(9780167617051,'Romanian'),(9780217836180,'Tamil'),(9780243438600,'Vietnamese'),(9780256542806,'Sanskrit'),(9780295914343,'Dutch'),(9780322545335,'Spanish'),(9780388139066,'Korean'),(9780399208850,'Kannada'),(9780458449835,'Arabic'),(9780478931662,'Indonesian'),(9780495612193,'Malay'),(9780522316438,'Greek'),(9780555249710,'Portuguese'),(9780613902434,'Kannada'),(9780654457160,'Marathi'),(9780687534784,'Hausa'),(9780689793264,'Irish'),(9780719466618,'English'),(9780728854048,'Bengali'),(9780731663910,'German'),(9780781653794,'Punjabi'),(9780793507368,'Hausa'),(9780799527001,'Danish'),(9780801685552,'Odia'),(9780812084177,'Urdu'),(9780829906264,'Arabic'),(9780833089458,'Irish'),(9780838870631,'Turkish'),(9780846929208,'Swahili'),(9780855742485,'Vietnamese'),(9780866588195,'Welsh'),(9780894166938,'Bengali'),(9780916174880,'Odia'),(9780950822570,'Norwegian'),(9780958141413,'Swedish'),(9780959641028,'Thai'),(9780995054233,'Russian'),(9780995642669,'Sanskrit'),(9781002388952,'Indonesian'),(9781014642806,'Thai'),(9781038442345,'Urdu'),(9781046178687,'Polish'),(9781057608920,'Italian'),(9781059025909,'Sanskrit'),(9781065179436,'Latin'),(9781085165068,'Tamil'),(9781098619374,'Latin'),(9781118617038,'Norwegian'),(9781120785237,'Indonesian'),(9781123454376,'Tamil'),(9781125264911,'Czech'),(9781129640254,'Thai'),(9781130957402,'Malay'),(9781232774136,'Portuguese'),(9781244904125,'Odia'),(9781261463926,'Tamil'),(9781287039624,'Italian'),(9781317966746,'Bengali'),(9781340499716,'Portuguese'),(9781429201162,'Turkish'),(9781450637299,'Turkish'),(9781476387246,'Thai'),(9781503987845,'Dutch'),(9781510452237,'Marathi'),(9781518250859,'Turkish'),(9781531006112,'Welsh'),(9781561025671,'Chinese'),(9781561036387,'Irish'),(9781566266413,'Hindi'),(9781572775084,'Swahili'),(9781602596290,'Hungarian'),(9781605521923,'Turkish'),(9781629484297,'Chinese'),(9781661726072,'Hungarian'),(9781689865678,'Polish'),(9781690512332,'Polish'),(9781721541966,'Latin'),(9781764081221,'Odia'),(9781766699547,'Polish'),(9781844450534,'Swedish'),(9781857542547,'Marathi'),(9781874732761,'German'),(9781894388009,'Vietnamese'),(9781905619221,'Vietnamese'),(9781909213425,'Irish'),(9781923908314,'Malayalam'),(9781946521460,'Odia'),(9781975271022,'Latin'),(9781990994821,'Welsh'),(9781992362994,'Marathi');
/*!40000 ALTER TABLE `book_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `book_rent_count`
--

DROP TABLE IF EXISTS `book_rent_count`;
/*!50001 DROP VIEW IF EXISTS `book_rent_count`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `book_rent_count` AS SELECT
 1 AS `ISBN`,
  1 AS `rent_count` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `category_name` varchar(40) NOT NULL,
  PRIMARY KEY (`category_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('Adventure'),('Biography/Autobiography'),('Classic Literature'),('Fantasy'),('Historical Fiction'),('Horror'),('Mystery/Thriller'),('Non-Fiction'),('Philosophy'),('Poetry'),('Romance'),('Science'),('Science Fiction'),('Self-Help'),('Young Adult');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `category_review_avg`
--

DROP TABLE IF EXISTS `category_review_avg`;
/*!50001 DROP VIEW IF EXISTS `category_review_avg`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `category_review_avg` AS SELECT
 1 AS `category_name`,
  1 AS `AVG(likert_scale)` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `category_review_avg_per_school`
--

DROP TABLE IF EXISTS `category_review_avg_per_school`;
/*!50001 DROP VIEW IF EXISTS `category_review_avg_per_school`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `category_review_avg_per_school` AS SELECT
 1 AS `category_name`,
  1 AS `AVG(likert_scale)`,
  1 AS `school_id` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `central_admin`
--

DROP TABLE IF EXISTS `central_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `central_admin` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `central_admin`
--

LOCK TABLES `central_admin` WRITE;
/*!40000 ALTER TABLE `central_admin` DISABLE KEYS */;
INSERT INTO `central_admin` VALUES (1,'central_admin','admin','central','admin');
/*!40000 ALTER TABLE `central_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keyword`
--

DROP TABLE IF EXISTS `keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keyword` (
  `keyword` varchar(20) NOT NULL,
  PRIMARY KEY (`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keyword`
--

LOCK TABLES `keyword` WRITE;
/*!40000 ALTER TABLE `keyword` DISABLE KEYS */;
INSERT INTO `keyword` VALUES ('Adventure'),('Art'),('Autobiography'),('Biography'),('Business'),('Comedy'),('Coming-of-Age'),('Contemporary Fiction'),('Cooking'),('Crime'),('Culture'),('Drama'),('Dystopian'),('Education'),('Environment'),('Fantasy'),('Finance'),('Fitness'),('Health'),('Historical Fiction'),('History'),('Horror'),('Inspirational'),('Leadership'),('Memoir'),('Motivational'),('Music'),('Mystery'),('Nature'),('Parenting'),('Philosophy'),('Poetry'),('Politics'),('Psychology'),('Religion'),('Romance'),('Satire'),('Science'),('Science Fiction'),('Self-Help'),('Social Issues'),('Spirituality'),('Sports'),('Suspense'),('Technology'),('Thriller'),('Travel'),('War'),('Young Adult');
/*!40000 ALTER TABLE `keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language` (
  `language_name` varchar(20) NOT NULL,
  PRIMARY KEY (`language_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES ('Arabic'),('Bengali'),('Chinese'),('Czech'),('Danish'),('Dutch'),('English'),('Finnish'),('French'),('German'),('Greek'),('Gujarati'),('Hausa'),('Hebrew'),('Hindi'),('Hungarian'),('Icelandic'),('Indonesian'),('Irish'),('Italian'),('Japanese'),('Kannada'),('Korean'),('Latin'),('Malay'),('Malayalam'),('Marathi'),('Norwegian'),('Odia'),('Persian'),('Polish'),('Portuguese'),('Punjabi'),('Romanian'),('Russian'),('Sanskrit'),('Spanish'),('Swahili'),('Swedish'),('Tamil'),('Telugu'),('Thai'),('Turkish'),('Urdu'),('Vietnamese'),('Welsh'),('Yoruba');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `late_rent`
--

DROP TABLE IF EXISTS `late_rent`;
/*!50001 DROP VIEW IF EXISTS `late_rent`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `late_rent` AS SELECT
 1 AS `rent_ID`,
  1 AS `rent_user_id`,
  1 AS `admin_user_id`,
  1 AS `ISBN`,
  1 AS `start_date`,
  1 AS `late_by` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `lib_admin`
--

DROP TABLE IF EXISTS `lib_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lib_admin` (
  `user_id` int(11) NOT NULL,
  `school_id` int(7) unsigned zerofill NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `school_id` (`school_id`),
  CONSTRAINT `fk_lib_admin_school_unit` FOREIGN KEY (`school_id`) REFERENCES `school_unit` (`school_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_lib_admin_teacher` FOREIGN KEY (`user_id`) REFERENCES `teacher` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lib_admin`
--

LOCK TABLES `lib_admin` WRITE;
/*!40000 ALTER TABLE `lib_admin` DISABLE KEYS */;
INSERT INTO `lib_admin` VALUES (12,1250259),(2,1905845),(13,4703793),(4,7887268);
/*!40000 ALTER TABLE `lib_admin` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER admin_correct_school_id BEFORE INSERT ON lib_admin FOR EACH ROW
BEGIN
	SET @correct = (new.school_id IN (SELECT lib_user.school_id FROM lib_user WHERE lib_user.user_id = new.user_id)); 
	IF (NOT @correct)
	THEN
	SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'School id must be the same as that of the lib_user';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `lib_user`
--

DROP TABLE IF EXISTS `lib_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lib_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `school_id` int(7) unsigned zerofill NOT NULL,
  `renting` tinyint(1) unsigned DEFAULT 0,
  `reserving` tinyint(1) unsigned DEFAULT 0,
  `banned` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  KEY `fk_lib_user_school_unit` (`school_id`),
  CONSTRAINT `fk_lib_user_school_unit` FOREIGN KEY (`school_id`) REFERENCES `school_unit` (`school_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lib_user`
--

LOCK TABLES `lib_user` WRITE;
/*!40000 ALTER TABLE `lib_user` DISABLE KEYS */;
INSERT INTO `lib_user` VALUES (1,'christine43','#2U)#BUd@z','Ραχήλ','Μαρουγιάννη',6684421,0,1,0),(2,'mary28','&mSL3Sxued','Ματρώνη','Χοντζιά',1905845,1,0,0),(3,'amandabryant','x&6msV7y7j','Λουκία','Τυμβίου',6684421,0,0,0),(4,'bradleyfernandez','^0xVPf%kt7','Βαγιανή','Πουλιάση',7887268,1,1,0),(5,'zweiss','+9!WAb$#Sm','Σταυρούλα','Καρκανάκη',4703793,1,0,0),(6,'vlozano','%t)V9JAql)','Ερμιόνη','Ψάλτης',1905845,0,1,0),(7,'stephaniewatts','xIh6Mqqi_v','Ισαβέλλα','Ταχμαζίδης',1250259,0,0,0),(8,'javiermccann','+N%6hMGeAZ','Γερασιμούλα','Τσακανίκας',4703793,1,1,0),(9,'zknight','yC!69TzH%&','Ναπολέων','Πολυχρόνης',1905845,1,1,0),(10,'stephen68','E)8K%oQ*cg','Αμβροσία','Συμεωνίδου',6684421,0,1,0),(11,'rebeccasmith','*z0yJGbwD%','Ξανθίππη','Σπανουδάκης',7887268,1,0,0),(12,'vpatterson','UzG76XtYt_','Θεοφύλακτη','Δακαναλής',1250259,1,1,0),(13,'brianna30','@0SZqxkA^V','Κανέλλα','Κακατσός',4703793,1,0,0),(14,'rmiller','#rPpG63e2+','Αθηνόδωρος','Κελαϊδώνης',7887268,1,1,0),(15,'jenniferbarry','u4JHqaiz!S','Ήρα','Αδαμοπούλου',1905845,1,1,0),(16,'pstephenson','@!MxC#2g$2','Ιωνάς','Σταμέλου',1905845,1,1,0),(17,'hjohnson','+TY6vy^if7','Ρήγας','Τσέλλος',6684421,0,0,0),(18,'cynthiawalker','O*3WEkxlI1','Αρίσταρχος','Καρβέλη',1905845,1,0,0),(19,'xbryan','e)M1RM1qte','Εριέτα','Γιατράκου',1905845,1,1,0),(20,'briannacarter','&vdPcpQYR3','Στέλλιος','Μπαλανίκα',6684421,0,0,0),(21,'wayne97','sjRkubUh)5','Ορέστης','Κωνσταντοπούλου',1250259,2,1,0),(22,'mortoncourtney','v@0P*xYBzR','Βερόνικα','Λέκκα',4703793,1,0,0),(23,'matthew14','G6VrIHvD&P','Χάιδω','Χαραλαμπίδης',6684421,0,0,0),(24,'mccarthyerin','su3UMCd_!&','Γρηγόριος','Θεολόγος',7887268,1,1,0),(25,'phamheather','5z5hEHGnu(','Δημοσθένης','Ότσος',7887268,2,0,0),(26,'toddedwin','td89VWmj)x','Ζαμπία','Δόβας',7887268,2,0,0),(27,'martinezdebra','qTy8OWPI^4','Ζαχαρένια','Μπλιατσίου',7887268,2,0,0),(28,'millerashley','3lKe5Pe$_q','Βαλέριος','Χουδαλάκης',1250259,1,0,0),(29,'sandrathompson','!z20QAru&w','Πηγή','Τολούδης',1250259,0,2,0),(30,'fbass','#2RCxXqe$&','Ερμιόνη','Μπεκάκου',6684421,0,0,0),(31,'parkerpamela','(g3F4pBJ%%','Αθηνοδώρα','Κονιάρη',7887268,1,1,0),(32,'rachel22','ED!L6Coy&s','Δόμνα','Βουτσάς',1905845,0,0,0),(33,'anthonyortiz','+5XD6fgG0G','Λητώ','Σταθά',7887268,0,1,0),(34,'allen83','B#3Np0Dx$1','Ξενοφών','Στεφάνου',4703793,1,0,0),(35,'ginanewton','1X@Wv8wL+&','Δωρόθεος','Γεράρδης',1905845,0,1,0),(36,'andreaswanson','XXSlV@mq#4','Σταμάτης','Μάλαμα',1250259,2,0,0),(37,'caroldavis','@HCwB4bpx4','Αθηνόδωρος','Πολυχρονίδης',1905845,1,0,0),(38,'candicenguyen','YW*nMZIp$7','Κλεάνθης','Παληός',6684421,0,0,0),(39,'whiteryan','v1NURYZl*H','Ευστράτιος','Κορμπόπουλος',6684421,0,0,0),(40,'spencejessica','+0tQVXyL^T','Ευγένιος','Μαντζουράνης',7887268,1,0,0),(41,'jamescorey','*90nQAq@!W','Ηρακλής','Πετροσιάν',1905845,2,1,0),(42,'jherrera','y%1Ph8Diaw','Χριστοφόρα','Ανδριώτης',6684421,0,0,0),(43,'jeffery17',')9+4wQb7#8','Αριστομένης','Δρόσου',4703793,1,0,0),(44,'benjamin62','$J1OToCPJ!','Λουκάς','Χολέβα',1905845,0,1,0),(45,'juliafoster','w4&9_#Mw35','Δωρόθεος','Καψή',1250259,2,0,0),(46,'clarkkerry','Q+0A$_Ia^1','Παράσχος','Χριστάρας',1250259,0,0,0),(47,'jessica05','^PWiMEbz1j','Γερακίνα','Κόλκας',1250259,1,2,0),(48,'eric40','DE@93xYqGZ','Παρθένα','Κουρσουμίδης',4703793,2,1,0),(49,'donnawilliams','(1BeNfzM9c','Αναγνώστης','Μπραέσα',1250259,1,0,0),(50,'bernardbarry','G9@@oRLn!X','Άγγελος','Ζερβά',1250259,2,0,0),(51,'gomezbilly','^iQ(g4QjhK','Ζαχαρένια','Νάντσου',1250259,2,0,0),(52,'brewerjillian','5+1HAAd4^A','Χριστοδούλα','Σολωμίδου',7887268,1,1,0),(53,'pbond','+6m#UonT1N','Ευτύχιος','Πλατάκη',7887268,1,0,0),(54,'jessica71','&pP$z@wAL7','Λήδα','Ελευθερίου',6684421,0,0,0),(55,'joseph69','6s69BdEy*2','Νικόδημος','Σταματιάδης',6684421,0,0,0),(56,'ghoward','9)9FFPlj#2','Γαλάτιος','Σίββα',7887268,0,1,0),(57,'carriehunt','tj3QXbw5s)','Κοραλία','Φερεντίνος',1250259,0,1,0),(58,'courtneygreen','oVJf7Euu^f','Αταλάντη','Ανδριανός',6684421,0,2,0),(59,'courtneyevans','2(RHZEhk@i','Ταξιαρχία','Καρούντζος',4703793,1,0,0),(60,'smithpamela','$22IQ8Bjbo','Αποστολία','Καρτάς',1905845,2,1,0),(61,'crystal72','%316Ke%oR*','Μαντώ','Καναβός',6684421,0,2,0),(62,'allenraymond','@LhuMfEa1(','Αδαμαντία','Σίδερης',4703793,0,0,0),(63,'christopher15','rsiExa4v^3','Αργυρώ','Καράμπη',7887268,0,1,0),(64,'vobrien','VH)Q2XCq4_','Τίμων','Γκόβα',4703793,2,0,0),(65,'wayne93','$2887Awqc3','Άρτεμις','Πίτσης',4703793,2,0,0),(66,'lori74','lKt@8rzqN!','Χρυσόστομη','Κτενίδης',4703793,2,2,0),(67,'hperry','_#4iNf8Ta7','Περικλής','Πετράκη',6684421,0,2,0),(68,'wolfkelly','N_aO09lV)G','Σουλτάνα','Τσίμη',7887268,1,0,0),(69,'riversemily','W1D9WQ@f)t','Ανέστης','Κανελλόπουλος',4703793,1,1,0),(70,'lgrant','2giBZr7q+_','Ελισάβετ','Κατσίπης',1905845,2,0,0),(71,'kimberlycabrera','987RzT+!)M','Μιράντα','Μπύρου',4703793,1,0,0),(72,'pbaker','!^7Rejf0ir','Φλώρα','Φειδερόπουλος',7887268,2,2,0),(73,'sarahcastillo','VB1#Cy^zo*','Αθηνά','Κωτσίδης',4703793,2,0,0),(74,'svillarreal','a_9P_Kvrf_','Πραξιτέλης','Καρολίδου',1250259,1,1,0),(75,'michelle85','q9SPPpx4*X','Χρυσοβαλάντου','Σαραφίδης',4703793,0,0,0),(76,'singhnicholas','_9bTcx%kw&','Στέλλα','Καμπούρη',1250259,1,0,0),(77,'jameshess','!@&!@F$7d3','Αργυρώ','Κακαβός',4703793,2,0,0),(78,'hharris','V$3IwtbLSp','Δομήνικος','Νικολουδάκη',6684421,0,1,0),(79,'jmcmillan','@y4t5U(ncx','Αγαμέμνων','Παπανικολάου',6684421,0,1,0),(80,'mcdanielrichard','e9N4pHDz)F','Γκίκας','Λαζαρίδης',1250259,1,1,0);
/*!40000 ALTER TABLE `lib_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `most_popular_category_pairs`
--

DROP TABLE IF EXISTS `most_popular_category_pairs`;
/*!50001 DROP VIEW IF EXISTS `most_popular_category_pairs`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `most_popular_category_pairs` AS SELECT
 1 AS `c1n`,
  1 AS `c2n`,
  1 AS `rent_count` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `not_top_writers`
--

DROP TABLE IF EXISTS `not_top_writers`;
/*!50001 DROP VIEW IF EXISTS `not_top_writers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `not_top_writers` AS SELECT
 1 AS `writer_id`,
  1 AS `first_name`,
  1 AS `last_name`,
  1 AS `book_count` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `past_rent`
--

DROP TABLE IF EXISTS `past_rent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `past_rent` (
  `rent_ID` int(11) NOT NULL,
  `renting_user_id` int(11) DEFAULT NULL,
  `admin_user_id` int(11) NOT NULL,
  `ISBN` bigint(13) unsigned NOT NULL,
  `start_date` date NOT NULL,
  `return_date` date NOT NULL DEFAULT curdate(),
  PRIMARY KEY (`rent_ID`),
  KEY `fk_past_rent_lib_user` (`renting_user_id`),
  KEY `fk_past_rent_lib_admin` (`admin_user_id`),
  KEY `fk_past_rent_book` (`ISBN`),
  CONSTRAINT `fk_past_rent_book` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON UPDATE CASCADE,
  CONSTRAINT `fk_past_rent_lib_admin` FOREIGN KEY (`admin_user_id`) REFERENCES `lib_admin` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_past_rent_lib_user` FOREIGN KEY (`renting_user_id`) REFERENCES `lib_user` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `past_rent_return_after_start` CHECK (`return_date` >= `start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `past_rent`
--

LOCK TABLES `past_rent` WRITE;
/*!40000 ALTER TABLE `past_rent` DISABLE KEYS */;
INSERT INTO `past_rent` VALUES (1,19,2,9780295914343,'2021-12-26','2022-01-12'),(2,68,4,9780065907940,'2021-10-13','2021-10-26'),(3,5,13,9781905619221,'2022-03-21','2022-03-29'),(4,53,4,9781857542547,'2020-05-14','2020-05-16'),(5,70,2,9780689793264,'2020-08-28','2020-09-08'),(6,45,12,9781721541966,'2022-12-21','2022-12-31'),(7,6,2,9781059025909,'2021-10-19','2021-10-27'),(8,11,4,9781992362994,'2021-08-28','2021-09-05'),(9,34,13,9780846929208,'2020-05-08','2020-05-10'),(10,34,13,9780458449835,'2021-08-15','2021-08-28'),(11,69,13,9781905619221,'2022-09-04','2022-09-10'),(12,66,13,9780399208850,'2022-04-14','2022-04-27'),(13,66,13,9780916174880,'2021-05-01','2021-05-07'),(14,77,13,9780067979235,'2020-01-30','2020-02-01'),(15,16,2,9781909213425,'2022-10-30','2022-11-03'),(16,17,1,9780399208850,'2021-04-16','2021-04-25'),(17,30,1,9780217836180,'2023-02-19','2023-02-23'),(18,34,13,9781232774136,'2021-09-08','2021-09-25'),(20,32,2,9781990994821,'2022-08-05','2022-08-06'),(21,50,12,9781894388009,'2020-10-10','2020-10-23'),(22,40,4,9780829906264,'2020-06-24','2020-07-11'),(23,70,2,9780719466618,'2021-07-08','2021-07-15'),(24,19,2,9780322545335,'2021-10-12','2021-10-23'),(25,43,13,9781510452237,'2022-04-14','2022-05-04'),(26,35,2,9781429201162,'2022-10-03','2022-10-16'),(27,26,4,9780812084177,'2022-05-20','2022-06-10'),(28,78,1,9780846929208,'2023-05-10','2023-05-25'),(29,45,12,9781690512332,'2021-03-26','2021-03-29'),(30,50,12,9781874732761,'2020-09-27','2020-10-01'),(31,40,4,9781909213425,'2022-08-27','2022-09-09'),(32,2,2,9780054770050,'2021-10-30','2021-10-31'),(33,39,1,9780731663910,'2020-09-28','2020-10-08'),(34,29,12,9780731663910,'2022-09-30','2022-10-20'),(35,1,1,9780801685552,'2023-03-28','2023-04-12'),(36,34,13,9780160514425,'2022-07-17','2022-07-18'),(37,23,1,9780217836180,'2022-10-25','2022-10-29'),(38,33,4,9781118617038,'2021-12-06','2021-12-13'),(39,27,4,9780894166938,'2019-09-24','2019-10-11'),(40,33,4,9781605521923,'2022-07-11','2022-07-21'),(41,63,4,9780799527001,'2022-12-06','2022-12-14'),(42,79,1,9780458449835,'2019-12-18','2019-12-23'),(43,79,1,9781905619221,'2021-05-14','2021-05-23'),(44,62,13,9781059025909,'2022-08-12','2022-08-13'),(45,41,2,9781905619221,'2021-08-20','2021-08-29'),(46,48,13,9780160514425,'2021-08-18','2021-09-05'),(47,77,13,9780295914343,'2020-01-11','2020-01-24'),(48,10,1,9781661726072,'2022-04-19','2022-05-05'),(49,10,1,9781689865678,'2020-11-18','2020-12-01'),(50,11,4,9780065907940,'2020-02-21','2020-02-24'),(51,42,1,9780555249710,'2023-01-20','2023-01-23'),(52,29,12,9780555249710,'2023-01-24','2023-02-09'),(53,2,2,9781046178687,'2019-06-05','2019-06-12'),(54,33,4,9780812084177,'2020-04-22','2020-04-26'),(55,68,4,9781429201162,'2020-03-22','2020-03-28'),(56,35,2,9780689793264,'2021-03-18','2021-03-29'),(57,45,12,9780781653794,'2020-04-11','2020-04-25'),(58,33,4,9780054770050,'2021-08-12','2021-09-01'),(59,38,1,9780114812577,'2021-05-02','2021-05-06'),(60,50,12,9780781653794,'2022-10-16','2022-10-28'),(61,76,12,9781287039624,'2019-12-07','2019-12-13'),(62,20,1,9780689793264,'2020-04-15','2020-04-16'),(63,3,1,9780399208850,'2020-08-11','2020-08-20'),(64,72,4,9780295914343,'2020-09-06','2020-09-15'),(65,69,13,9780801685552,'2023-04-15','2023-04-25'),(66,17,1,9780958141413,'2021-06-04','2021-06-10'),(67,47,12,9781085165068,'2021-05-20','2021-05-22'),(69,68,4,9780256542806,'2021-03-26','2021-03-27'),(70,41,2,9781057608920,'2022-12-10','2022-12-13'),(71,11,4,9780916174880,'2021-10-18','2021-10-29'),(72,75,13,9780855742485,'2019-11-12','2019-11-25'),(73,40,4,9781721541966,'2022-06-16','2022-06-22'),(74,69,13,9780067979235,'2020-02-22','2020-02-23'),(75,22,13,9781689865678,'2019-10-08','2019-10-14'),(76,22,13,9781946521460,'2020-10-11','2020-10-26'),(77,44,2,9780801685552,'2022-09-17','2022-09-27'),(78,14,4,9781690512332,'2019-12-19','2020-01-03'),(79,70,2,9781992362994,'2021-01-26','2021-01-29'),(80,21,12,9780322545335,'2021-04-16','2021-04-17'),(81,29,12,9780064449649,'2019-12-20','2019-12-26'),(82,57,12,9780458449835,'2020-06-18','2020-06-20'),(83,50,12,9780322545335,'2021-03-21','2021-04-07'),(84,74,12,9780138991791,'2020-08-09','2020-08-29'),(85,19,2,9780100398542,'2020-08-04','2020-08-14'),(86,41,2,9780689793264,'2022-11-20','2022-11-21'),(87,39,1,9780067979235,'2022-03-13','2022-04-03'),(88,43,13,9781038442345,'2022-10-13','2022-11-02'),(89,12,12,9781118617038,'2019-09-01','2019-09-07'),(90,49,12,9780687534784,'2021-11-09','2021-11-23'),(91,22,13,9781857542547,'2022-11-29','2022-12-17'),(92,71,13,9780167617051,'2022-04-06','2022-04-07'),(93,70,2,9780054770050,'2021-03-03','2021-03-23'),(94,38,1,9781766699547,'2022-07-03','2022-07-19'),(95,47,12,9781894388009,'2020-11-20','2020-11-22'),(96,52,4,9780866588195,'2021-07-15','2021-08-03'),(97,68,4,9781661726072,'2022-10-22','2022-10-23'),(98,31,4,9780217836180,'2019-09-30','2019-10-17'),(99,31,4,9781894388009,'2020-05-13','2020-05-22'),(100,30,1,9780866588195,'2021-02-09','2021-02-28'),(101,66,13,9780067979235,'2022-07-24','2022-08-09'),(102,34,13,9781129640254,'2021-01-25','2021-02-10'),(103,64,13,9780855742485,'2021-06-13','2021-07-01'),(104,20,1,9781085165068,'2023-04-05','2023-04-08'),(105,21,12,9781125264911,'2021-11-16','2021-12-01'),(106,34,13,9780054770050,'2021-01-26','2021-02-07'),(107,34,13,9781317966746,'2022-08-13','2022-08-29'),(108,62,13,9780388139066,'2021-07-29','2021-08-09'),(109,23,1,9781002388952,'2019-09-12','2019-09-21'),(110,27,4,9781002388952,'2019-12-06','2019-12-09'),(111,70,2,9780950822570,'2019-11-16','2019-11-27'),(112,27,4,9780719466618,'2021-07-10','2021-07-29'),(113,9,2,9781629484297,'2022-07-24','2022-07-26'),(114,16,2,9781038442345,'2020-04-09','2020-04-12'),(115,37,2,9781002388952,'2020-01-05','2020-01-08'),(116,79,1,9781566266413,'2022-12-25','2023-01-13'),(117,28,12,9780719466618,'2020-08-14','2020-09-04'),(118,22,13,9780793507368,'2022-11-03','2022-11-04'),(119,22,13,9780689793264,'2021-04-24','2021-05-06'),(120,19,2,9781098619374,'2022-03-15','2022-03-23'),(121,1,1,9780054770050,'2021-04-15','2021-04-26'),(122,36,12,9780995642669,'2021-08-11','2021-08-20'),(123,4,4,9781518250859,'2022-12-22','2022-12-30'),(124,10,1,9780114812577,'2022-11-07','2022-11-17'),(125,8,13,9780866588195,'2022-06-07','2022-06-18'),(126,20,1,9780833089458,'2021-12-28','2022-01-14'),(127,33,4,9780100398542,'2023-04-10','2023-04-11'),(128,27,4,9781992362994,'2022-12-09','2022-12-28'),(129,47,12,9781572775084,'2020-02-09','2020-02-23'),(130,47,12,9781476387246,'2021-05-10','2021-05-29'),(131,16,2,9781629484297,'2020-11-09','2020-11-13'),(132,37,2,9780555249710,'2022-07-12','2022-07-29'),(133,44,2,9780138991791,'2021-07-24','2021-08-13'),(134,14,4,9780295914343,'2021-10-13','2021-10-27'),(135,67,1,9780958141413,'2021-04-11','2021-04-30'),(136,43,13,9780613902434,'2019-06-09','2019-06-28'),(137,68,4,9780916174880,'2023-01-31','2023-02-08'),(138,36,12,9781990994821,'2019-07-19','2019-07-27'),(140,42,1,9781909213425,'2022-10-15','2022-11-03'),(141,10,1,9781130957402,'2020-10-02','2020-10-14'),(142,49,12,9781857542547,'2023-05-01','2023-05-19'),(143,68,4,9781065179436,'2021-12-12','2021-12-20'),(144,19,2,9780167617051,'2020-01-05','2020-01-15'),(145,24,4,9780067979235,'2020-03-11','2020-03-28'),(146,38,1,9781123454376,'2021-01-17','2021-01-23'),(147,5,13,9781510452237,'2019-11-05','2019-11-19'),(148,46,12,9781690512332,'2022-10-02','2022-10-19'),(149,12,12,9780916174880,'2022-03-26','2022-04-11'),(150,50,12,9781244904125,'2019-09-09','2019-09-18'),(151,80,12,9781518250859,'2019-08-13','2019-08-15'),(152,36,12,9780866588195,'2021-11-14','2021-12-05'),(153,57,12,9781244904125,'2020-05-15','2020-06-05'),(154,41,2,9781510452237,'2020-07-15','2020-07-21'),(155,57,12,9781764081221,'2023-03-22','2023-03-25'),(156,80,12,9781605521923,'2019-12-06','2019-12-18'),(157,23,1,9781764081221,'2020-05-27','2020-06-11'),(158,64,13,9781118617038,'2019-07-06','2019-07-17'),(159,5,13,9781038442345,'2022-03-03','2022-03-10'),(160,74,12,9780100398542,'2022-10-01','2022-10-22'),(161,6,2,9781766699547,'2021-05-21','2021-05-22'),(162,27,4,9781605521923,'2022-10-05','2022-10-12'),(163,68,4,9780812084177,'2022-05-05','2022-05-11'),(164,25,4,9780894166938,'2019-10-19','2019-10-20'),(165,29,12,9780160514425,'2019-08-11','2019-09-01'),(166,67,1,9780812084177,'2019-06-20','2019-07-04'),(167,64,13,9781975271022,'2022-03-24','2022-04-07'),(168,19,2,9781602596290,'2021-10-16','2021-10-22'),(169,40,4,9780801685552,'2021-12-14','2021-12-18'),(170,63,4,9780812084177,'2023-05-01','2023-05-11'),(171,50,12,9781690512332,'2020-09-14','2020-09-26'),(172,75,13,9780160514425,'2020-06-25','2020-06-30'),(173,34,13,9781510452237,'2021-02-24','2021-03-11'),(174,71,13,9781857542547,'2023-04-09','2023-04-28'),(175,74,12,9781340499716,'2020-08-29','2020-09-13'),(176,58,1,9781572775084,'2021-02-19','2021-02-22'),(177,29,12,9781629484297,'2021-04-18','2021-04-27'),(178,34,13,9781510452237,'2022-12-17','2022-12-25'),(179,40,4,9780159376690,'2021-09-12','2021-09-23'),(180,50,12,9781503987845,'2021-06-07','2021-06-21'),(181,37,2,9781046178687,'2020-05-09','2020-05-19'),(182,80,12,9781629484297,'2022-10-13','2022-10-30'),(183,6,2,9780495612193,'2020-07-27','2020-08-01'),(184,47,12,9780388139066,'2021-11-09','2021-11-25'),(185,79,1,9781120785237,'2023-05-01','2023-05-05'),(186,49,12,9780256542806,'2020-11-10','2020-11-15'),(187,23,1,9781992362994,'2020-02-21','2020-03-09'),(188,19,2,9781566266413,'2020-09-22','2020-10-07'),(189,22,13,9781923908314,'2020-02-04','2020-02-14'),(190,51,12,9781059025909,'2021-04-22','2021-05-05'),(191,38,1,9780950822570,'2020-11-24','2020-12-06'),(192,74,12,9781689865678,'2020-12-14','2021-01-01'),(193,6,2,9781766699547,'2020-07-30','2020-08-15'),(194,24,4,9781857542547,'2020-05-09','2020-05-11'),(195,20,1,9780719466618,'2019-12-05','2019-12-08'),(196,24,4,9780167617051,'2020-04-15','2020-05-03'),(197,20,1,9780100398542,'2022-12-19','2022-12-23'),(198,20,1,9781629484297,'2021-02-10','2021-02-24'),(199,18,2,9781046178687,'2020-10-10','2020-10-24'),(200,56,4,9781566266413,'2021-02-15','2021-02-23'),(201,50,12,9781844450534,'2020-03-26','2020-04-06'),(202,38,1,9780812084177,'2020-05-31','2020-06-07'),(203,11,4,9780916174880,'2020-06-18','2020-07-03'),(204,59,13,9780781653794,'2021-04-20','2021-04-22'),(205,12,12,9780100398542,'2019-12-19','2019-12-24'),(207,8,13,9780054770050,'2021-01-19','2021-01-21'),(208,42,1,9781605521923,'2020-03-27','2020-04-06'),(209,33,4,9780159376690,'2023-03-29','2023-04-01'),(210,72,4,9781014642806,'2022-01-13','2022-02-01'),(211,61,1,9780160514425,'2022-05-31','2022-06-20'),(212,45,12,9780555249710,'2022-07-11','2022-07-18'),(213,18,2,9781123454376,'2020-02-09','2020-02-25'),(214,67,1,9781476387246,'2019-10-23','2019-10-28'),(215,63,4,9780522316438,'2022-06-24','2022-07-08'),(216,63,4,9780958141413,'2021-08-09','2021-08-18'),(217,59,13,9780100398542,'2019-12-27','2020-01-07'),(219,68,4,9780731663910,'2021-10-22','2021-11-03'),(220,54,1,9780322545335,'2019-11-30','2019-12-20'),(221,27,4,9781518250859,'2019-07-29','2019-08-16'),(222,1,1,9780243438600,'2021-09-11','2021-09-29'),(223,24,4,9781046178687,'2020-05-12','2020-05-17'),(224,75,13,9780159376690,'2020-12-19','2020-12-30'),(225,36,12,9780793507368,'2021-08-25','2021-09-01'),(226,57,12,9780654457160,'2022-04-30','2022-05-14'),(227,39,1,9781689865678,'2021-04-11','2021-04-21'),(228,48,13,9781057608920,'2021-03-26','2021-03-31'),(229,54,1,9780801685552,'2023-03-12','2023-03-25'),(230,30,1,9781602596290,'2022-04-29','2022-05-20'),(231,38,1,9780838870631,'2020-06-13','2020-06-15'),(232,14,4,9781764081221,'2022-11-06','2022-11-15'),(233,30,1,9781450637299,'2023-01-08','2023-01-10'),(234,36,12,9781992362994,'2022-10-08','2022-10-24'),(235,62,13,9781059025909,'2023-02-18','2023-03-07'),(236,6,2,9781923908314,'2021-12-06','2021-12-16'),(237,59,13,9781429201162,'2022-07-25','2022-08-05'),(238,40,4,9781689865678,'2020-09-22','2020-10-07'),(239,6,2,9780916174880,'2020-04-20','2020-04-25'),(240,39,1,9780167617051,'2019-12-29','2020-01-15'),(241,77,13,9780689793264,'2022-09-30','2022-10-15'),(242,34,13,9780719466618,'2022-04-21','2022-04-23'),(243,68,4,9781002388952,'2022-11-17','2022-12-02'),(244,24,4,9781002388952,'2020-09-25','2020-09-29'),(245,28,12,9780829906264,'2020-10-24','2020-10-28'),(246,79,1,9780159376690,'2021-10-09','2021-10-29'),(247,63,4,9780866588195,'2020-03-22','2020-04-12'),(248,35,2,9780799527001,'2020-10-12','2020-10-13'),(249,23,1,9780689793264,'2020-02-14','2020-02-25'),(250,23,1,9781844450534,'2021-10-19','2021-11-01'),(251,53,4,9780731663910,'2021-08-02','2021-08-23'),(252,15,2,9781129640254,'2021-09-12','2021-09-14'),(253,34,13,9781857542547,'2021-06-20','2021-06-27'),(254,27,4,9780522316438,'2021-10-24','2021-11-14'),(255,53,4,9781531006112,'2022-04-04','2022-04-07'),(256,78,1,9780689793264,'2020-03-20','2020-04-05'),(257,54,1,9781014642806,'2020-03-24','2020-04-04'),(258,41,2,9780067979235,'2019-06-22','2019-07-08'),(259,73,13,9781450637299,'2022-11-10','2022-11-11'),(260,73,13,9781561036387,'2020-09-29','2020-10-10'),(262,26,4,9781990994821,'2022-02-17','2022-03-01'),(263,64,13,9781098619374,'2023-01-04','2023-01-09'),(264,17,1,9780399208850,'2019-11-30','2019-12-02'),(265,61,1,9780054770050,'2021-09-05','2021-09-13'),(266,32,2,9781038442345,'2021-06-08','2021-06-14'),(267,17,1,9780829906264,'2020-11-11','2020-11-21'),(268,37,2,9781857542547,'2020-04-12','2020-04-16'),(269,10,1,9780388139066,'2023-02-20','2023-02-21'),(270,13,13,9780114812577,'2021-05-24','2021-06-13'),(271,22,13,9780833089458,'2019-12-30','2020-01-06'),(272,32,2,9781125264911,'2023-04-07','2023-04-11'),(273,37,2,9780138991791,'2022-08-16','2022-08-21'),(274,21,12,9781476387246,'2019-11-02','2019-11-22'),(275,43,13,9780114812577,'2022-02-24','2022-03-09'),(276,22,13,9781629484297,'2020-10-25','2020-11-05'),(277,64,13,9781990994821,'2021-07-02','2021-07-04'),(278,31,4,9781689865678,'2021-01-12','2021-01-17'),(279,59,13,9781510452237,'2019-10-26','2019-11-11'),(280,19,2,9781125264911,'2022-09-26','2022-10-02'),(281,1,1,9781232774136,'2020-04-04','2020-04-24'),(282,63,4,9781721541966,'2021-01-12','2021-01-30'),(283,34,13,9780799527001,'2020-05-22','2020-06-05'),(284,14,4,9781002388952,'2020-02-04','2020-02-24'),(285,23,1,9780894166938,'2020-10-31','2020-11-03'),(286,14,4,9780793507368,'2022-12-09','2022-12-22'),(287,6,2,9781340499716,'2020-02-11','2020-02-19'),(288,57,12,9781975271022,'2019-08-15','2019-08-21'),(289,32,2,9780100398542,'2019-07-02','2019-07-05'),(290,45,12,9780067979235,'2022-10-23','2022-10-26'),(291,37,2,9781232774136,'2022-08-20','2022-09-04'),(292,36,12,9781038442345,'2021-11-15','2021-12-06'),(293,66,13,9780916174880,'2022-08-01','2022-08-05'),(294,15,2,9780793507368,'2023-01-01','2023-01-19'),(295,39,1,9780855742485,'2022-04-06','2022-04-14'),(296,33,4,9781130957402,'2019-11-19','2019-12-03'),(297,40,4,9781689865678,'2022-01-18','2022-01-20'),(298,68,4,9781690512332,'2021-08-11','2021-08-13'),(299,29,12,9780478931662,'2020-01-07','2020-01-18'),(300,21,12,9781038442345,'2022-03-12','2022-03-30'),(301,1,1,9780687534784,'2021-09-02','2021-09-10'),(302,31,4,9781130957402,'2022-02-21','2022-02-25'),(303,71,13,9781766699547,'2021-08-28','2021-09-06'),(304,76,12,9780959641028,'2021-10-30','2021-11-03'),(305,66,13,9781905619221,'2020-06-10','2020-06-16'),(306,61,1,9780495612193,'2019-09-17','2019-09-21'),(307,71,13,9780295914343,'2022-10-31','2022-11-05'),(308,1,1,9781038442345,'2023-01-11','2023-01-17'),(309,80,12,9780950822570,'2020-08-04','2020-08-06'),(310,17,1,9780958141413,'2020-02-06','2020-02-18'),(311,17,1,9780959641028,'2022-10-18','2022-11-02'),(312,53,4,9781874732761,'2022-12-01','2022-12-08'),(313,40,4,9781085165068,'2019-06-12','2019-06-25'),(314,56,4,9780959641028,'2021-03-23','2021-03-26'),(315,12,12,9780065907940,'2021-06-08','2021-06-19'),(316,47,12,9781503987845,'2021-02-07','2021-02-20'),(317,46,12,9781990994821,'2020-06-14','2020-07-01'),(318,77,13,9780731663910,'2019-08-19','2019-09-07'),(319,40,4,9781120785237,'2019-06-16','2019-07-05'),(320,58,1,9780689793264,'2020-11-20','2020-12-09'),(321,36,12,9780833089458,'2020-05-07','2020-05-09'),(322,7,12,9781476387246,'2022-05-30','2022-05-31'),(323,20,1,9780458449835,'2021-02-04','2021-02-13'),(324,25,4,9781946521460,'2019-06-17','2019-07-07'),(325,9,2,9781990994821,'2022-06-12','2022-06-19'),(326,28,12,9781123454376,'2023-01-16','2023-01-20'),(327,68,4,9781120785237,'2021-10-09','2021-10-27'),(328,26,4,9780719466618,'2022-09-24','2022-10-05'),(329,64,13,9780950822570,'2020-09-24','2020-09-26'),(330,44,2,9780555249710,'2019-11-07','2019-11-26'),(331,56,4,9781129640254,'2020-07-30','2020-08-03'),(332,19,2,9781689865678,'2020-04-14','2020-05-03'),(333,32,2,9780731663910,'2020-11-05','2020-11-07'),(334,65,13,9781531006112,'2022-08-01','2022-08-06'),(335,70,2,9780295914343,'2020-05-15','2020-05-23'),(336,39,1,9781721541966,'2021-10-12','2021-10-30'),(337,43,13,9780894166938,'2020-04-30','2020-05-09'),(338,12,12,9781429201162,'2020-01-12','2020-01-23'),(339,66,13,9780399208850,'2021-01-17','2021-01-26'),(340,5,13,9781057608920,'2021-12-16','2021-12-31'),(341,33,4,9781125264911,'2021-12-10','2021-12-20'),(342,58,1,9780458449835,'2021-08-09','2021-08-11'),(343,46,12,9780829906264,'2020-04-29','2020-05-02'),(344,71,13,9781661726072,'2021-05-05','2021-05-06'),(345,70,2,9780388139066,'2022-08-14','2022-08-25'),(346,2,2,9781990994821,'2022-02-27','2022-03-10'),(347,29,12,9780555249710,'2021-09-27','2021-10-18'),(348,24,4,9780160514425,'2021-06-20','2021-07-02'),(349,56,4,9781503987845,'2022-12-21','2022-12-24'),(350,1,1,9780458449835,'2022-11-22','2022-11-26'),(351,14,4,9781059025909,'2022-02-26','2022-02-27'),(352,64,13,9780159376690,'2020-08-21','2020-08-25'),(353,2,2,9780719466618,'2021-05-12','2021-05-25'),(354,52,4,9780613902434,'2022-12-06','2022-12-27'),(355,54,1,9781909213425,'2020-12-30','2021-01-10'),(356,55,1,9780812084177,'2021-06-05','2021-06-13'),(357,30,1,9781572775084,'2021-11-15','2021-11-27'),(358,25,4,9781923908314,'2021-02-07','2021-02-15'),(359,73,13,9780728854048,'2019-08-17','2019-09-02'),(360,63,4,9781990994821,'2020-08-01','2020-08-02'),(361,48,13,9781057608920,'2020-06-10','2020-06-21'),(362,69,13,9780458449835,'2021-11-16','2021-12-07'),(363,63,4,9780555249710,'2020-02-10','2020-02-25'),(364,40,4,9780159376690,'2022-01-09','2022-01-14'),(365,57,12,9781065179436,'2021-05-20','2021-05-22'),(366,18,2,9780217836180,'2020-04-26','2020-05-03'),(367,46,12,9780100398542,'2022-05-23','2022-06-02'),(369,22,13,9781990994821,'2021-10-21','2021-11-02'),(370,78,1,9780799527001,'2022-11-19','2022-11-26'),(371,19,2,9781531006112,'2020-12-23','2021-01-02'),(372,57,12,9781129640254,'2019-12-19','2019-12-20'),(373,27,4,9780866588195,'2022-07-19','2022-07-31'),(374,77,13,9781629484297,'2020-06-03','2020-06-15'),(375,69,13,9780067979235,'2022-08-07','2022-08-27'),(376,5,13,9780855742485,'2020-03-18','2020-03-28'),(377,33,4,9781244904125,'2020-02-26','2020-03-01'),(378,68,4,9781085165068,'2020-06-01','2020-06-10'),(379,33,4,9781857542547,'2022-12-14','2022-12-16'),(380,6,2,9780399208850,'2020-07-14','2020-08-01'),(381,5,13,9781844450534,'2023-04-06','2023-04-24'),(382,16,2,9781764081221,'2019-10-31','2019-11-02'),(383,74,12,9780855742485,'2021-12-07','2021-12-21'),(384,33,4,9781046178687,'2022-02-12','2022-02-17'),(385,66,13,9780458449835,'2019-11-15','2019-11-29'),(386,32,2,9780894166938,'2020-09-06','2020-09-22'),(387,30,1,9781014642806,'2021-05-22','2021-06-01'),(388,34,13,9781232774136,'2020-07-25','2020-08-12'),(389,20,1,9780838870631,'2020-02-02','2020-02-09'),(390,35,2,9781261463926,'2021-06-09','2021-06-30'),(391,33,4,9780522316438,'2019-08-14','2019-08-20'),(392,59,13,9781923908314,'2020-03-28','2020-04-12'),(393,34,13,9781125264911,'2020-06-02','2020-06-15'),(394,48,13,9781129640254,'2020-07-05','2020-07-17'),(395,43,13,9781317966746,'2019-12-07','2019-12-10'),(396,53,4,9781844450534,'2020-02-18','2020-02-24'),(397,25,4,9781518250859,'2019-06-13','2019-07-04'),(398,26,4,9781661726072,'2019-11-29','2019-12-11'),(399,64,13,9780958141413,'2021-05-12','2021-05-29'),(400,78,1,9780846929208,'2021-12-22','2021-12-27');
/*!40000 ALTER TABLE `past_rent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `past_rent_full_data`
--

DROP TABLE IF EXISTS `past_rent_full_data`;
/*!50001 DROP VIEW IF EXISTS `past_rent_full_data`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `past_rent_full_data` AS SELECT
 1 AS `rent_id`,
  1 AS `ISBN`,
  1 AS `book_title`,
  1 AS `renting_user_id`,
  1 AS `username`,
  1 AS `school_id`,
  1 AS `start_date`,
  1 AS `return_date` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pending_lib_user`
--

DROP TABLE IF EXISTS `pending_lib_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pending_lib_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `birth_date` date NOT NULL,
  `role` set('TEACHER','STUDENT','LIBRARY ADMIN') NOT NULL,
  `school_id` int(7) unsigned zerofill NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  KEY `fk_pending_lib_user_school_unit` (`school_id`),
  CONSTRAINT `fk_pending_lib_user_school_unit` FOREIGN KEY (`school_id`) REFERENCES `school_unit` (`school_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pending_lib_user`
--

LOCK TABLES `pending_lib_user` WRITE;
/*!40000 ALTER TABLE `pending_lib_user` DISABLE KEYS */;
INSERT INTO `pending_lib_user` VALUES (1,'eadams','!$)oL_tgV6','Αντωνία','Δανδανίδου','1986-09-12','STUDENT',7887268),(2,'marybailey','@x4OK3i+56','Βαρσαμία','Κάκκα','1999-06-24','STUDENT',6684421),(3,'bakererika','&9_8EKZrdK','Ναυσικά','Σαραντινός','1983-09-24','STUDENT',4703793),(4,'thorntonwesley','^72XufB%#2','Κρινιώ','Μπαλλή','1968-11-08','STUDENT',6684421),(5,'wernerjohn','$BQNAdn8y5','Μαντώ','Παπατρέχας','1964-07-14','STUDENT',1905845),(6,'keith45','s#(1Fu$mUx','Μαργιέττα','Μαντάρης','1993-06-29','STUDENT',1250259),(7,'jeaton',')DIGw2qa*3','Αποστολία','Γρατσιάς','1978-10-20','STUDENT',1250259),(8,'sarah38','Fz^h8Y6u$*','Μαυρούδης','Λέκκα','1993-10-28','TEACHER',1905845),(9,'ramirezshelby','Q^0$#Ssri)','Ξανθός','Χατζόπουλος','1965-02-16','STUDENT',1250259),(10,'pstone','+87^VQed20','Παντελής','Τριαντακωνσταντής','1990-06-25','TEACHER',1905845),(11,'amandamerritt','@L^3oHuR*L','Χριστοδούλα','Κομκούδης','1989-07-17','STUDENT',7887268),(12,'tylerhunt','v^&09YzF9C','Εύκλεια','Κωστάκης','1987-08-28','TEACHER',1905845),(13,'dana03','7&03xYeZ#^','Αριστέα','Παπαδοπούλου','1952-06-26','TEACHER',4703793),(14,'bestjason','+2uM9#Dr^P','Ορέστης','Δημητρίου','1957-01-22','STUDENT',1250259),(15,'troy79','#3UWZ9_vvY','Πολυχρονία','Μάρα','2001-01-01','STUDENT',1905845);
/*!40000 ALTER TABLE `pending_lib_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pending_review`
--

DROP TABLE IF EXISTS `pending_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pending_review` (
  `review_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reviewer_id` int(11) NOT NULL,
  `ISBN` bigint(13) unsigned zerofill NOT NULL,
  `text` text DEFAULT NULL,
  `likert_scale` int(1) NOT NULL CHECK (`likert_scale` between 1 and 5),
  `review_date` date NOT NULL DEFAULT curdate(),
  PRIMARY KEY (`review_id`),
  UNIQUE KEY `uk_pending_review_user_id_isbn` (`reviewer_id`,`ISBN`),
  KEY `fk_pending_review_book` (`ISBN`),
  CONSTRAINT `fk_pending_review_book` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON UPDATE CASCADE,
  CONSTRAINT `fk_pending_review_lib_user` FOREIGN KEY (`reviewer_id`) REFERENCES `lib_user` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pending_review`
--

LOCK TABLES `pending_review` WRITE;
/*!40000 ALTER TABLE `pending_review` DISABLE KEYS */;
INSERT INTO `pending_review` VALUES (201,45,9781894388009,'Από βγήκε πλέον εξαρτάται ημέρα. Σε της πάρα εδώ ο.',3,'2020-09-11'),(202,40,9780243438600,'Έστειλε εταιρείες ύψος πάρεις τύπου λαμβάνουν. Αποδείξεις όταν ρουτίνα κύκλο ανεπιθύμητη άλγεβρα ρωτάει μέγιστη. Γραφικά από μη προσοχή σημαντικός γραμμή.',4,'2020-09-12'),(203,44,9781946521460,'Μην τελειώσει διολισθήσεις σαν εργαλείων δύο εργάστηκε. Να μέχρι μάτσο εκθέσεις έτοιμος πάρεις διορθώσει. Πρώτο αποθηκευτικού έτσι εδώ εσωτερικών προσλάμβανες.',1,'2020-12-31'),(204,45,9781721541966,'Όταν φίλος πες μερικούς τα αγοράζοντας. Σαν τους δημιουργια μέχρι μεταφραστής σωστά περιεχόμενα.',4,'2021-09-03'),(205,38,9780654457160,'Που υποψήφιο πολύ εκείνου κώδικάς αποθηκευτικού χρειάζονται. Επί χρονοδιαγράμματα είχαμε κάτι αποφάσισε. Συνεχώς μεταγλωτίσει πάντως επί.',3,'2019-07-15'),(206,40,9780114812577,'Σε πετάνε να από συνεχώς πετούν κάτι. Εκτελείται καταλάθος των μεταφραστής προγραμματιστές και καλύτερο.',1,'2022-12-06'),(207,37,9780054770050,'Μην αποθηκευτικού στη διαπιστώνεις πάρεις καλύτερο κώδικάς. Μη ναι σε. Ωραίο αποστηθίσει λες παράγοντες μα.',3,'2022-05-04'),(208,56,9781905619221,'Με βαθμό μη μάλλον σχεδιαστής νέο λετπά. Πλέον εκτός αρπάζεις. Πολύ βουτήξουν ένας εκείνου αθόρυβες.',5,'2019-06-25'),(209,59,9781123454376,'Μερικούς αναφορά μου εδώ γράψει. Κάνε εικόνες τρόπο χρησιμοποιώντας γειτονιάς βαθμό. Παίρνουν στις είχαμε πάντα. Μην μάτσο δε.',3,'2022-03-22'),(210,29,9780114812577,'Όχι ύψος της κώδικάς κλπ πάντα δείξει. Περισσότερες πάρα κι.',1,'2023-02-02'),(211,14,9780065907940,'Κόλπα ερωτήσεις έχω διευθυντές παραπάνω της. Στο αποθηκευτικού οι.',2,'2022-07-25'),(212,36,9780065907940,'Κάνε διαφήμιση εξακολουθεί το πλέον εγώ. Μη δωροδοκηθούν του ξέχασε εικόνες. Απαραίτητο λίγο μιας απλό μέχρι μερικούς παίξουν.',5,'2020-04-14'),(213,1,9781065179436,'Ρωτήσει δοκιμάσεις της ανά φίλος νέο δεν. Προσπαθούν παραπάνω πρώτης επιχείριση εκθέσεις.',3,'2023-02-22'),(214,1,9781244904125,'Τύπου ναι ορίστε κάτι διακοπή ως κανόνα. Σε δε δημιουργείς όχι τέλειοι ακούσει διασφαλίζεται. Εκτελέσεις διάσημα προκύπτουν πάρεις νέο λοιπόν ήδη. Πως τοπικές αντιλήφθηκαν τα στήλες τοπικές φακέλους.',3,'2023-03-26'),(215,32,9781766699547,'Ελέγχου ακούσει σας δωροδοκηθούν. Σημαντικός εκτελείται σε πήρε γεύματος εκείνου.',1,'2019-09-26'),(216,45,9781923908314,'Ερωτήσεις σημαντικό αυτός πάρα στήλες θυμάμαι. Ποια πάντα ακούσει στα. Δεν του μη ανά πλέον πάρεις δεν εργοστασίου.',5,'2022-07-27'),(217,28,9781503987845,'Να σαν ανακλύψεις εκδόσεις υόρκη λοιπόν. Κι την πακέτων λέει του.',1,'2021-09-15'),(218,46,9780894166938,'Τεσσαρών ένας οι εταιρείες προβληματική γράψει. Δύο έτοιμος επενδυτής κοιτάζοντας πετάνε προσπαθήσεις χώρου αθόρυβες. Δούλευε έτοιμος ελέγχου τον.',1,'2019-06-21'),(219,51,9780256542806,'Για γνωστή συνάδελφος. Έχω ένας προκύπτουν αποστηθίσει δωροδοκηθούν κάτι χώρου. Αρέσει βάζοντας να μας ύψος στις πηγαίου.',4,'2021-08-05'),(220,76,9781766699547,'Βιαστικά θέματα μαγικά μια. Ανταγωνιστής σου δούλευε. Μπουν να απόλαυσε κανόνα μέχρι. Χάος ποσοστό σας επί πηγαίου έτσι δεν.',2,'2022-08-10'),(221,69,9780728854048,'Βουτήξουν προβληματική δεν χώρου. Εξοργιστικά από πολύ λετπά διορθώσεις πετάνε. Ώρα πετούν ξέχασε.',3,'2021-01-28'),(222,36,9780114812577,'Της πεδία κόψεις λίγο πλέον απόλαυσε. Άρθρων εταιρείες συνάδελφος δημιουργήσεις δύο επεξεργασία σου.',2,'2020-11-23'),(223,51,9781894388009,'Για σημαντικό προκαλείς ταξινομεί.',3,'2021-01-09'),(224,65,9780894166938,'Μη αφήσεις στο λέει προσεκτικά. Διακοπή της γραμμής ύψος αποστηθίσει διαφήμιση δημιουργήσεις.',2,'2021-05-28'),(225,74,9780495612193,'Χρονοδιαγράμματα δεδομένων δούλευε πετούν πάντα. Τεσσαρών προσλάμβανες και λοιπόν. Μα συγκεντρωμένοι συγγραφείς μην και ναι ένας.',4,'2020-01-07'),(234,7,9780054770050,'hell',3,'2023-06-04');
/*!40000 ALTER TABLE `pending_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `pending_review_full_data`
--

DROP TABLE IF EXISTS `pending_review_full_data`;
/*!50001 DROP VIEW IF EXISTS `pending_review_full_data`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `pending_review_full_data` AS SELECT
 1 AS `ISBN`,
  1 AS `book_title`,
  1 AS `likert_scale`,
  1 AS `text`,
  1 AS `reviewer_id`,
  1 AS `username`,
  1 AS `school_id`,
  1 AS `review_id` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `principal`
--

DROP TABLE IF EXISTS `principal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `principal` (
  `user_id` int(11) NOT NULL,
  `school_id` int(7) unsigned zerofill NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `school_id` (`school_id`),
  CONSTRAINT `fk_principal_school_unit` FOREIGN KEY (`school_id`) REFERENCES `school_unit` (`school_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_principal_teacher` FOREIGN KEY (`user_id`) REFERENCES `teacher` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `principal`
--

LOCK TABLES `principal` WRITE;
/*!40000 ALTER TABLE `principal` DISABLE KEYS */;
INSERT INTO `principal` VALUES (7,1250259),(6,1905845),(5,4703793),(1,6684421),(14,7887268);
/*!40000 ALTER TABLE `principal` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER principal_correct_school_id BEFORE INSERT ON principal FOR EACH ROW
BEGIN
	SET @correct = (new.school_id IN (SELECT lib_user.school_id FROM lib_user WHERE lib_user.user_id = new.user_id)); 
	IF (NOT @correct)
	THEN
	SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'School id must be the same as that of the lib_user';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `principal_full_data`
--

DROP TABLE IF EXISTS `principal_full_data`;
/*!50001 DROP VIEW IF EXISTS `principal_full_data`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `principal_full_data` AS SELECT
 1 AS `user_id`,
  1 AS `school_id`,
  1 AS `first_name`,
  1 AS `last_name`,
  1 AS `username` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `rent_full_data`
--

DROP TABLE IF EXISTS `rent_full_data`;
/*!50001 DROP VIEW IF EXISTS `rent_full_data`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `rent_full_data` AS SELECT
 1 AS `rent_id`,
  1 AS `ISBN`,
  1 AS `book_title`,
  1 AS `renting_user_id`,
  1 AS `username`,
  1 AS `first_name`,
  1 AS `last_name`,
  1 AS `school_id`,
  1 AS `start_date`,
  1 AS `late_by` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation` (
  `reservation_ID` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `ISBN` bigint(13) unsigned zerofill NOT NULL,
  `submission_date` date NOT NULL DEFAULT curdate(),
  PRIMARY KEY (`reservation_ID`),
  UNIQUE KEY `uk_reservation_user_id_ISBN` (`user_id`,`ISBN`),
  KEY `fk_reserves_book` (`ISBN`),
  CONSTRAINT `fk_reservation_lib_user` FOREIGN KEY (`user_id`) REFERENCES `lib_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_reserves_book` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,6,9780399208850,'2023-05-26'),(2,29,9780100398542,'2023-05-31'),(3,56,9781905619221,'2023-05-28'),(4,48,9781946521460,'2023-05-28'),(5,57,9781721541966,'2023-05-25'),(6,47,9781844450534,'2023-05-26'),(7,72,9780217836180,'2023-05-29'),(8,61,9781244904125,'2023-05-25'),(9,9,9781689865678,'2023-05-29'),(10,47,9781059025909,'2023-05-28'),(11,63,9781261463926,'2023-05-27'),(12,21,9781317966746,'2023-05-28'),(13,41,9781118617038,'2023-05-25'),(14,4,9780054770050,'2023-05-27'),(15,74,9780067979235,'2023-05-25'),(16,58,9781721541966,'2023-05-28'),(17,12,9780100398542,'2023-05-25'),(18,35,9780100398542,'2023-05-28'),(20,19,9780159376690,'2023-05-28'),(21,67,9780065907940,'2023-05-30'),(22,31,9780689793264,'2023-05-27'),(23,15,9781572775084,'2023-05-30'),(24,61,9780833089458,'2023-05-26'),(26,44,9780114812577,'2023-05-27'),(27,67,9781518250859,'2023-05-25'),(28,72,9781340499716,'2023-05-29'),(30,8,9780950822570,'2023-05-30'),(31,16,9781844450534,'2023-05-25'),(32,33,9780916174880,'2023-05-27'),(33,60,9780687534784,'2023-05-26'),(34,1,9781287039624,'2023-05-26'),(36,58,9781844450534,'2023-05-26'),(38,80,9781689865678,'2023-05-28'),(39,78,9781602596290,'2023-05-25'),(40,52,9781118617038,'2023-05-28'),(42,10,9781429201162,'2023-05-28'),(43,14,9781287039624,'2023-05-26'),(44,24,9781561036387,'2023-05-27'),(46,66,9781605521923,'2023-05-31'),(47,29,9781975271022,'2023-05-27'),(49,69,9780126353426,'2023-05-26'),(50,79,9781764081221,'2023-05-29'),(53,66,9780801685552,'2023-05-28');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER reserve_insertion AFTER INSERT ON reservation FOR EACH ROW
BEGIN
	IF (SELECT new.user_id IN (select user_id from teacher))
	THEN SET @reserve_lim = 1;
	ELSEIF (SELECT new.user_id IN (select user_id from student))
		THEN SET @reserve_lim = 2;
	END IF;
	SET @other_start_date = (select min(start_date) FROM active_rent WHERE renting_user_id = new.user_id);

	
	
	
	
	IF ((select reserving from lib_user where lib_user.user_id = new.user_id) < @reserve_lim)
	THEN
	UPDATE lib_user SET reserving = reserving + 1 WHERE lib_user.user_id = new.user_id;
	ELSE
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Cannot have more reservations';
	END IF;
	
	IF (ADDDATE(@other_start_date,INTERVAL 1 WEEK) < new.submission_date)
	THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Cannot have more reservations when a rental is late';
	END IF;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER reserve_deletion AFTER DELETE ON reservation FOR EACH ROW
BEGIN
	IF ((select reserving from lib_user where lib_user.user_id = old.user_id) > 0 )
	THEN
	UPDATE lib_user SET reserving = reserving - 1 WHERE lib_user.user_id = old.user_id;
	ELSE
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Reservations already at 0';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `reservation_full_data`
--

DROP TABLE IF EXISTS `reservation_full_data`;
/*!50001 DROP VIEW IF EXISTS `reservation_full_data`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `reservation_full_data` AS SELECT
 1 AS `reservation_id`,
  1 AS `ISBN`,
  1 AS `book_title`,
  1 AS `user_id`,
  1 AS `username`,
  1 AS `school_id`,
  1 AS `reserving`,
  1 AS `renting`,
  1 AS `role`,
  1 AS `submission_date`,
  1 AS `available_copies`,
  1 AS `reserv_order`,
  1 AS `late` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `review_id` int(10) unsigned NOT NULL,
  `reviewer_id` int(11) NOT NULL,
  `admin_user_id` int(11) NOT NULL,
  `ISBN` bigint(13) unsigned zerofill NOT NULL,
  `text` text DEFAULT NULL,
  `likert_scale` int(1) NOT NULL CHECK (`likert_scale` between 1 and 5),
  `review_date` date NOT NULL,
  PRIMARY KEY (`review_id`),
  UNIQUE KEY `uk_review_user_id_isbn` (`reviewer_id`,`ISBN`),
  KEY `fk_review_lib_admin` (`admin_user_id`),
  KEY `fk_review_book` (`ISBN`),
  CONSTRAINT `fk_review_book` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON UPDATE CASCADE,
  CONSTRAINT `fk_review_lib_admin` FOREIGN KEY (`admin_user_id`) REFERENCES `lib_admin` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_review_lib_user` FOREIGN KEY (`reviewer_id`) REFERENCES `lib_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,32,2,9780522316438,'Αν προβληματική την στήλες τρόποι. Αφήσεις εκτός υποψήφιο κειμένων διορθώσει μερικούς.',2,'2022-12-12'),(2,21,12,9780114812577,'Πρόσληψη δίνοντας εκτός μεταγλωτίσει κι σας νέων και. Χάος συγχρόνως κώδικάς κώδικα.',3,'2022-06-12'),(3,77,13,9780866588195,'Στραβά φαινόμενο απαράδεκτη έξι. Ο απαρατήρητο διακόψουμε ποια έστειλε εταιρείες.',2,'2019-08-22'),(4,75,13,9780950822570,'Γραμμή εδώ άρθρων διασφαλίζεται τρέξει ως. Πήρε προσπαθούν προσπαθήσεις πλέον στραβά. Γράψει χαρακτηριστικών δημιουργήσεις προσεκτικά αυτός φακέλους δούλευε τρόπο. Άρα ανά δημιουργια πάρεις πόρτες αποθηκευτικού αθόρυβες έλεγχος.',1,'2020-03-03'),(5,13,13,9780959641028,'Ατόμου ας βαθμό τα τι αποστηθίσει. Διάσημα σημαντικό χρειάζονται χαρακτηριστικό έτοιμος κι ρουτίνα. Τον ως ύψος κάτι ένας τη.',1,'2020-08-25'),(6,69,13,9781038442345,'Που μπορούσες κύκλο χαμηλός ένας. Προσοχή τεκμηριώνει κανείς.',1,'2023-03-30'),(7,22,13,9781629484297,'Γέλασαν κόψεις βάζοντας κοιτάζοντας διάσημα υπηρεσία τον πλέον. Εκτός κύκλο έτσι παίξουν γιαυτό κι κάτι.',5,'2021-12-19'),(8,12,12,9781946521460,'Προσθέσει με προσλάμβανες μια θέματα.',1,'2020-11-08'),(9,78,1,9781764081221,'Κάνε νέα λέει ναι. Αφήσεις ανώδυνη άρθρων αρπάζεις άπειρα συνέχεια εδώ νιρβάνα.',1,'2023-05-17'),(10,75,13,9781129640254,'Μετρήσεις εργάστηκε για σημαντικό εκτός σου. Δύο πρόσληψη εκθέσεις παραγωγικής. Του δύο διοικητικό νέα απαρατήρητο απαράδεκτη ένα.',4,'2022-03-16'),(11,64,13,9780833089458,'Εκτελέσεις έγραψες του που. Τρόπο διαδίκτυο και στέλνοντάς ροή ο λες.',5,'2020-02-20'),(12,5,13,9780958141413,'Σημαντικό του σας τη γιαυτό. Ροή πως θέματα μπουν αν.',3,'2021-06-24'),(13,79,1,9781450637299,'Σημαντικό αναγκάζονται ανεπιθύμητη ανακλύψεις άρα δεδομένων της σας.',1,'2022-05-16'),(14,70,2,9781518250859,'Άρα μην τη δίνοντας διαφήμιση βασανίζουν αποφάσισε. Στις συνάδελφος προβληματική εργασίας χάος συγχρόνως έγραψες. Μη πετούν δημιουργείς.',3,'2021-12-01'),(15,67,1,9780793507368,'Σου φίλος κάτι χρησιμοποιούσες βασανίζουν νέα. Τις περιεχόμενα νέα μάλλον. Εργαζόμενων ακούσει πλέον χαρακτηριστικών.',2,'2023-03-08'),(16,29,12,9781123454376,'Πόρτες παραπάνω ένα. Δεν ρωτήσει σπίτι την. Της χρόνου των μέχρι έξι.',1,'2021-09-02'),(17,39,1,9781531006112,'Τρόποι ποια εργοστασίου προκαλείς κρατάει μάλλον περιεχόμενα. Εκτελέσεις προσεκτικά διολισθήσεις θα.',4,'2019-10-08'),(18,12,12,9780894166938,'Γιαυτό διαχειριστής φακέλους νιρβάνα ως θέλεις. Εκτελείται αθόρυβες νόμιζες. Παραπάνω συγχωνευτεί λετπά ειδικά άρα που ατόμου μάτσο.',3,'2022-03-04'),(19,30,1,9781721541966,'Περιβάλλοντος έχω διαχειριστής άρθρων πολύ της δείξει. Έχω των στα.',2,'2023-04-14'),(20,38,1,9780781653794,'Απλό τοπικές ωραίο εφαρμογής τέλειοι δεν. Όσο εφαμοργής γνωρίζουμε σωστά νέων ανώδυνη.',2,'2021-11-08'),(21,73,13,9781129640254,'Αναγκάζονται διορθώσει φίλος διακοπής αναφέρονται των. Παραπάνω διαχειριστής εκτελέσεις ναι έστελνε.',2,'2020-08-25'),(22,59,13,9780138991791,'Σου εγώ θα βαθμό έτσι κρατήσουν δυστυχώς.',3,'2021-12-13'),(23,80,12,9781038442345,'Στα χρησιμοποιούνταν γεύματος αποθηκευτικού μου τα τρέξει. Νέα μην σε βουτήξουν πάντα.',4,'2023-03-01'),(24,53,4,9780866588195,'Τελειώσει επί άρθρων να δημιουργια βουτήξουν που να. Έτσι κάτι λίγο δεν δύο.',4,'2020-04-07'),(25,55,1,9780495612193,'Μεταφραστής όσο συνηθίζουν πετούν πιο πηγαίου από.',3,'2022-04-05'),(26,77,13,9781287039624,'Μετράει σαν φράση με. Μετράει μετρήσεις μια κανείς πρώτο πήρε αρέσει. Και άλγεβρα υπηρεσία φακέλους ότι.',1,'2022-11-27'),(27,37,2,9781566266413,'Τρόποι βρίσκονται άρα στα τεσσαρών εκτελέσει. Κάτι εταιρείες θα τις διαπιστώνεις εργασίας. Διαπιστώνεις όταν δύο.',2,'2021-09-22'),(28,34,13,9781561025671,'Παραδώσεις χρόνου διαδίκτυο πολύ. Θυμάμαι έχω φακέλους χαρτιού πρόσληψη πετάξαμε εδώ.',1,'2020-07-27'),(29,13,13,9780995054233,'Χρησιμοποιώντας δύο μεταγλωτιστής ώρα. Οι αναφορά που στο σίγουρος.',5,'2021-08-01'),(30,11,4,9781992362994,'Μέγιστη μα μηχανής τρόπο αν. Εντολές σε απαρατήρητο τι προκύπτουν για.',2,'2020-10-09'),(31,39,1,9781014642806,'Νιρβάνα μιας αναγκάζονται περιμένουν. Σπίτι διαδίκτυο τις μη πάντα. Στα εκτελέσει συνάδελφος τεσσαρών άρα αποθηκευτικού.',1,'2020-12-15'),(32,80,12,9780959641028,'Εργασίας εγώ κλπ γέλασαν κάτι διοικητικό.',2,'2022-01-02'),(33,1,1,9781909213425,'Επενδυτής υπηρεσία αρέσει προκύπτουν. Μα απαραίτητο μαγικά συγγραφής σταματάς. Έστειλε αναφέρονται πλέον κανόνα λες επιδιόρθωση.',5,'2020-12-26'),(34,57,12,9780833089458,'Να αποδείξεις τα αρέσει.',2,'2022-06-02'),(35,38,1,9781629484297,'Πες λίγο πιο ακούσει διακοπής εκτελείται περιμένουν. Τις μα μην διακοπή παραπάνω.',3,'2022-03-30'),(36,56,4,9780959641028,'Εξακολουθεί κύκλο πετούν δύο. Περιβάλλοντος κάτι θέματα.',1,'2019-09-09'),(37,28,12,9780894166938,'Κρατήσουν χαμηλός πως σίγουρος όσο νέων. Ήδη αποθηκευτικού ειδικά μηχανής του δημιουργείς.',5,'2019-09-07'),(38,19,2,9780160514425,'Πετάνε γιαυτό ατόμου εξακολουθεί. Μηχανής λέει γραφικά διάσημα αναφέρονται. Κανένας εγώ βρίσκονται.',2,'2022-11-21'),(39,42,1,9781057608920,'Δείξει στέλνοντάς λαμβάνουν λετπά κώδικα γνωρίζουμε στις. Έστειλε του μετρήσεις οι μαγικά.',5,'2019-06-27'),(40,70,2,9781561036387,'Σπίτι όσο και απαράδεκτη στα. Φίλος τους πετούν παράγοντες δεν. Λίγο αυτός χαρακτηριστικών κανόνα οι χαμηλός έστελνε σταματάς. Ερωτήσεις άτομο συγχωνευτεί την.',3,'2019-12-01'),(41,53,4,9780555249710,'Πλέον επί συγγραφείς. Επί ευκολότερο δε γραφικά. Νόμιζες διοικητικό συγκεντρωμένοι τεσσαρών.',2,'2021-09-26'),(42,61,1,9781629484297,'Αν πιο στις επιδιόρθωση σας απόλαυσε. Σκεφτείς έρθει κανείς νέο υψηλότερη αυτήν.',5,'2023-04-07'),(43,47,12,9781065179436,'Φράση δημιουργήσεις εσωτερικών προσπαθήσεις διορθώσεις χρησιμοποιώντας στη κύκλο. Τη τα εδώ.',2,'2021-08-06'),(44,68,4,9780478931662,'Βιαστικά μην απόλαυσε χρησιμοποιούσες απαράδεκτη μη.',2,'2020-06-10'),(45,12,12,9780256542806,'Χρησιμοποίησέ νόμιζες προσπαθήσεις λοιπόν. Πάντα δεν πολύ μια. Επί ανταγωνιστής στέλνοντάς αφήσεις ταξινομεί εκτελέσεις ανεπιθύμητη κάνεις. Συνεντεύξεις μη δίνοντας επί άπειρα στα υόρκη πετάνε.',3,'2021-01-21'),(46,38,1,9781764081221,'Συνέχεια εφαρμογής εντολές από προσπαθήσεις ανταγωνιστής. Περισσότερες έχω του γεύματος παράγοντες σκεφτείς δωροδοκηθούν.',5,'2019-06-02'),(47,51,12,9781476387246,'Απαράδεκτη νέου έρθει προσοχή εφαρμογής ορίστε που. Αρχεία ήδη προσπαθούν. Εντολές λοιπόν όχι εκδόσεις.',5,'2022-05-19'),(48,80,12,9781689865678,'Ανεπιθύμητη δημιουργήσεις και μάθε. Ήδη αναγκάζονται έρθει τι τη παίρνουν παράγοντες. Τι εργαζόμενοι εγώ την.',5,'2022-01-29'),(49,17,1,9781531006112,'Πολύ πάντως προσεκτικά άτομο αν φίλος λετπά. Υποψήφιο μετρήσεις ποια ανταγωνιστής λετπά γνωρίζουμε συνάδελφος.',2,'2021-05-15'),(50,68,4,9780995642669,'Απομόνωση ίδιο περιμένουν σας έτσι κώδικα λοιπόν. Αυτήν στήλες προγραμματιστής στήλες με ποσοστό στο τους.',4,'2023-01-20'),(51,10,1,9780728854048,'Πάντα με εκτός οι εσωτερικών δεν σωστά. Ένας δεδομένων ρουτίνα απομόνωση στέλνοντάς πες απλό. Δεν μέχρι αναγκάζονται κώδικάς εφαρμογή την περιβάλλον ορίστε.',2,'2020-06-19'),(52,15,2,9780801685552,'Εφαρμογής εντολές προσπαθήσεις των εδώ.',3,'2021-04-23'),(53,34,13,9780689793264,'Που χαρακτηριστικό πετάξαμε τύπου έλεγχος στα κάτι. Ποια εφαμοργής στη. Χρονοδιαγράμματος μερικούς στα χρόνου κάτι εκτός. Όχι είχαμε τη ανταγωνιστής.',1,'2022-03-27'),(54,1,1,9781120785237,'Συγχρόνως περισσότερη πολύ μου ένα έστειλε. Εκτελέσεις που ένας απαράδεκτη.',5,'2020-09-16'),(55,38,1,9780829906264,'Κάτι και μπορούσες πιο προγραμματιστές πάντως. Εκθέσεις αναφέρονται που ανώδυνη δείξει. Συγχωνευτεί συγγραφείς πολύ κι εκθέσεις συγγραφείς.',1,'2020-09-06'),(56,54,1,9781130957402,'Χρονοδιαγράμματα δυστυχώς εργαζόμενοι πετάξαμε δείξει σας. Ανακλύψεις απόλαυσε αθόρυβες διακοπής ερωτήσεις προσπαθήσεις. Πετούν προσλάμβανες γιαυτό.',5,'2022-02-23'),(57,6,2,9781098619374,'Ήδη δημιουργήσεις στη διάσημα βουτήξουν δε σπίτι βιαστικά. Σε λίγο για επί σας. Τι προσπαθήσεις επιδιόρθωση σαν τρέξει ακούσει του εγώ.',4,'2023-03-04'),(58,42,1,9780555249710,'Έτσι βιαστικά απομόνωση άρα λετπά τη σωστά. Άτομο να που των τη τους σε. Συνάδελφος γραμμής εδώ ευκολότερο.',4,'2020-09-22'),(59,35,2,9780243438600,'Επιχείριση δεν ίδιο σας διαχειριστής. Μέγιστη λετπά συνάδελφος ίδιο εδώ εργοστασίου.',1,'2022-11-11'),(60,36,12,9781661726072,'Ο δημιουργια όταν γνωρίζουμε καλύτερο παράγοντες. Στέλνοντάς στις δύο νέου άτομο λετπά εργαλείων διάβασε. Εργαλείων αναγκάζονται σε κι θέμα. Μεταγλωτιστής εκτελείται ακούσει τα πιο.',3,'2020-09-02'),(61,16,2,9781046178687,'Σημαντικό τρέξει δύο θα ανταγωνιστής παράδειγμα αποθηκευτικού. Τι ορίστε στα κάνεις χαρτιού σημεία. Στη και τεσσαρών αθόρυβες τους μεταγλωτιστής σημεία.',4,'2019-07-26'),(62,49,12,9781690512332,'Ποια δυστυχής από συνεχώς ποια λαμβάνουν εκτός. Πλέον ποια επί. Χώρου εικόνες κώδικάς σχεδιαστής μια εγώ εκτελέσει πετούν.',4,'2022-09-24'),(63,50,12,9781905619221,'Γραμμές τέλειοι κανένας πετάνε υπηρεσία τον. Ήδη αποστηθίσει πάντα δε υόρκη τύπου σημεία συνέχεια. Κόψεις τον ελέγχου ναι γραμμή.',4,'2020-06-09'),(64,69,13,9780833089458,'Πλέον καταλάθος εκτελείται κανείς. Προκύπτουν σχεδιαστής πηγαίου στραβά χρειάζονται κάνε ήδη. Πάντως έγραψες κώδικα έχω περιβάλλον.',1,'2023-03-05'),(65,12,12,9781450637299,'Κόλπα εγώ ίδιο μας.',5,'2020-09-09'),(66,4,4,9781990994821,'Μετρήσεις να βαθμό εξοργιστικά σαν. Ημέρα πάντως βαθμό ρωτήσει με αποδείξεις. Εργαζόμενοι έστειλε τα προσπαθούν.',5,'2020-05-12'),(67,28,12,9780855742485,'Τα προβληματική πιο. Θυμάμαι πάρεις κλπ τον γεγονός πολύ αρπάζεις.',3,'2022-06-27'),(68,22,13,9781992362994,'Σπίτι έξι παράγοντες με εδώ πρώτης. Σε προγραμματιστές το τα τέλειοι. Με σας πολύ σας σαν πάρεις.',1,'2021-02-19'),(69,46,12,9780950822570,'Όταν πιο ερωτήσεις γραμμές πλέον κάτι. Μα παραδοτέου θα χρησιμοποιούσες.',4,'2021-02-28'),(70,40,4,9780654457160,'Περίπου μέχρι πως εφαρμογή έτοιμος. Και υόρκη κώδικα του έστειλε προσθέσει πάντως δυστυχώς. Μεταφραστής γραμμής συγγραφείς χρησιμοποιούνταν δεν ανά διορθώσει. Βουτήξουν ήδη σωστά προσπαθούν αποκλειστικούς περιβάλλον απλό.',5,'2020-06-03'),(71,70,2,9781317966746,'Δεδομένων δημιουργείς συνάδελφος αρχεία. Διακοπή διολισθήσεις σημεία πρόσληψη που βουτήξουν. Εγώ εργαλείων εφαρμογής όχι τεκμηριώνει όσο επί δύο.',2,'2020-01-03'),(72,20,1,9780167617051,'Διακοπής χαρτιού προσλάμβανες χρονοδιαγράμματος στο γιαυτό χώρου. Εκθέσεις μπορούσες αποθηκευτικού σχεδιαστής έξι φακέλους παίξουν.',4,'2023-05-05'),(73,33,4,9781689865678,'Χρονοδιαγράμματα κοιτάζοντας πάντα αρπάζεις. Μπουν πόρτες λίγο ταξινομεί ρωτάει. Άπειρα μιας χρονοδιαγράμματος επιδιόρθωση.',4,'2021-05-13'),(74,68,4,9780654457160,'Πάντα θέματα βασανίζουν δωροδοκηθούν. Ξέχασε εφαρμογή πάρεις συγχρόνως μάτσο ερώτηση. Συγχωνευτεί εκτός ατόμου κάτι αυτήν. Γεύματος και λετπά δύο μάτσο ειδικά μάτσο.',4,'2023-02-08'),(75,29,12,9780160514425,'Πηγαίου απαραίτητο χαμηλός κάτι τα. Συγχρόνως γραμμή τα του. Νέο τον χρειάζονται ανά λες.',3,'2019-08-22'),(76,6,2,9780689793264,'Πάντως συνεντεύξεις πιο τη γραμμή αποστηθίσει. Όχι εγώ εργαζόμενων προγραμματιστής φαινόμενο. Διολισθήσεις θέμα όταν εδώ αυτήν συγγραφείς. Μέγιστη διακοπή αυτός.',3,'2020-02-08'),(77,43,13,9780894166938,'Τοπικές αποδείξεις σπίτι στα διακοπή. Τους πολύ εδώ παίρνουν αρπάζεις πως όχι χρησιμοποιούνταν. Γεγονός όταν ορίστε απίστευτα.',5,'2021-03-25'),(78,27,4,9781046178687,'Νέων επενδυτής ερωτήσεις γραφικά. Περίπου χρησιμοποιούνταν τον τεσσαρών.',3,'2020-10-24'),(79,75,13,9781531006112,'Άλγεβρα θέμα τις δύο. Μας πρώτο εργοστασίου αποθηκευτικού μου επί στις.',1,'2021-11-06'),(80,57,12,9781518250859,'Κι πεδία προϊόντα αν ένα. Απόλαυσε στο ως χαρακτηριστικό για.',1,'2023-05-15'),(81,60,2,9781992362994,'Έξι αποδείξεις περιβάλλοντος. Το βαθμό δύο εφαρμογής να γεύματος σταματάς. Εξοργιστικά στραβά εργαζόμενων.',5,'2022-07-13'),(82,2,2,9780160514425,'Δύο τρόπο ρωτάει αποκλειστικούς κανόνα γράψει για. Χρησιμοποιώντας εκδόσεις ο εκτελείται.',5,'2020-02-02'),(83,29,12,9780495612193,'Καλύτερο πως ανώδυνη ταξινομεί τα γειτονιάς. Της στραβά ερώτηση καταλάθος κι διασφαλίζεται τεκμηριώνει δυστυχής. Στις απαράδεκτη αναφέρονται πετάξαμε του περισσότερη γραμμές μέσης.',2,'2022-11-19'),(84,8,13,9780728854048,'Κανείς σας ας ζητήσεις μου λίγο. Δυστυχής διακοπή όχι κόψεις μεταγλωτιστής ανεπιθύμητη.',1,'2021-07-21'),(85,11,4,9780731663910,'Προκύπτουν ορίστε εκθέσεις εφαρμογή. Δούλευε εξακολουθεί διαχειριστής σωστά αν συγγραφής δημιουργήσεις.',3,'2019-11-28'),(86,68,4,9781232774136,'Εκτός εκτός παραγωγικής τις. Απλό βαθμό δημιουργια κάνε φράση.',5,'2021-10-15'),(87,50,12,9781946521460,'Ίδιο χρησιμοποιώντας στις πως. Αθόρυβες λαμβάνουν ότι τρόπο. Ήδη αλγόριθμου το μια χρησιμοποιούσες άλγεβρα δύο.',3,'2021-04-18'),(88,54,1,9780322545335,'Έστειλε τέλειοι εργαλείων εσωτερικών την εργασίας δημιουργια ωραίο. Ίδιο έχω τον διαφήμιση πρώτοι προσοχή.',1,'2021-08-03'),(89,1,1,9780322545335,'Επεξεργασία μαγικά δούλευε επί ας. Περισσότερη μη επιχείριση εργασίας επί. Διάβασε έλεγχος στα ελέγχου από διοικητικό θέλεις.',1,'2021-02-14'),(90,12,12,9780654457160,'Νέου σας ναι. Πάρα σου ξέχασε.',3,'2020-02-13'),(91,17,1,9781059025909,'Παίρνουν ξέχασε της ναι ειδικά. Τεκμηριώνει κι χρονοδιαγράμματα όταν ίδιο εξοργιστικά. Νέα οι νέων μα βιβλίο θέμα αφήσεις.',4,'2021-07-03'),(92,66,13,9781661726072,'Περισσότερη παραδοτέου απομόνωση δύο ως μάθε ότι. Σου γνωρίζουμε διορθώσει υποψήφιο. Πάρεις αποδείξεις μην πλέον ήδη.',3,'2022-02-20'),(93,70,2,9781874732761,'Νέου έστειλε δημιουργείς έτοιμος μην παράγοντες μια. Μάτσο βρίσκονται ορίστε δυστυχής στη κι τρέξει.',2,'2019-11-06'),(94,69,13,9781764081221,'Ένα μεταγλωτίσει τη καλύτερο. Επεξεργασία γεύματος δύο διακοπής μην συνέχεια.',1,'2021-06-23'),(95,43,13,9780399208850,'Μπορούσες ερώτηση ας ταξινομεί μέχρι επιχείριση πετάνε.',4,'2021-06-21'),(96,75,13,9781059025909,'Νόμιζες ο εγώ γεγονός γνωστή. Όσο βρίσκονται κειμένων χρονοδιαγράμματα των αποδείξεις με ξέχασε. Γεγονός εξοργιστικά συγγραφής.',4,'2021-12-16'),(97,20,1,9781340499716,'Σας μάτσο των ρωτάει ανεπιθύμητη δημιουργια κάτι κάτι. Επιδιορθώσεις τους εργαζόμενων προκύπτουν εδώ. Έξι χρόνου στο παράδειγμα αποκλειστικούς μας νιρβάνα ήδη.',2,'2019-12-21'),(98,31,4,9781572775084,'Παίρνουν άρθρων της σου τους. Διάβασε άρα όσο ναι συνεχώς. Μια πάντα εδώ δυστυχώς πάντα. Όσο από ειδικά ένα.',3,'2020-12-28'),(99,73,13,9781123454376,'Όσο συνάδελφος κι πάντα αποκλειστικούς κόψεις συνέχεια. Χρησιμοποιούνταν ερώτηση ανεπιθύμητη εκθέσεις εγώ χάος.',5,'2020-02-08'),(100,76,12,9780719466618,'Απλό αρέσει νέων σίγουρος ξέχασε. Ρωτήσει επιστρέφουν τύπους ας θέμα ας. Στο αλγόριθμου πολύ δοκιμάσεις τους και κώδικάς.',2,'2020-10-14'),(101,56,4,9780160514425,'Μέχρι δουλεύει έρθει βασανίζουν χαρτιού ανακλύψεις διορθώσεις. Την αποδείξεις κρατάει από εγώ. Τύπου γραμμές χρόνου. Με απλό από λες θα.',4,'2020-06-14'),(102,69,13,9781118617038,'Δοκιμάσεις εκτός φακέλους ανεπιθύμητη θα. Λετπά μηχανής αρέσει υπηρεσία εκθέσεις. Μα διοικητικό την.',1,'2021-11-29'),(103,52,4,9781125264911,'Πεδία μηχανής περιμένουν πολύ βάζοντας δεν μας. Απαρατήρητο πιο τι ρουτίνα ο δύο τι έξι.',1,'2021-09-09'),(104,63,4,9781923908314,'Περισσότερες εξακολουθεί αναφέρονται βγήκε αν μετρήσεις. Μέσης ίδιο σημεία μου έλεγχος ας μα. Γραμμής συνάδελφος προβληματική πηγαίου υψηλότερη.',1,'2021-04-13'),(105,6,2,9780064449649,'Διευθυντές παραγωγικής να το δημιουργήσεις. Πλέον μέρος όταν χρονοδιαγράμματος τους.',4,'2020-08-17'),(106,60,2,9781561036387,'Διάσημα κώδικα συνεχώς. Τεσσαρών δουλεύει θα χρησιμοποίησέ πλέον. Ένα κι περιμένουν τέλειοι σαν τι ατόμου συνέχεια.',3,'2019-06-17'),(107,18,2,9780846929208,'Πρώτης διακοπή αποφάσισε πετάνε σου πάντως ναι ο. Έγραψες χρησιμοποιούνταν κάτι. Πολύ μηχανής που πρώτης των.',3,'2022-03-02'),(108,20,1,9780687534784,'Γεγονός έχω μέσης μην. Εκθέσεις λες βιβλίο υψηλότερη σημαντικός τα ναι πετάξαμε. Δεν διαχειριστής στέλνοντάς ως.',2,'2021-01-18'),(109,44,2,9780256542806,'Εταιρείες μας βασανίζουν μας δουλεύει συγχρόνως σε. Άρθρων υψηλότερη ο γειτονιάς αποφάσισε.',4,'2020-11-30'),(110,41,2,9780958141413,'Διαδίκτυο ότι τις σημαντικό τρόποι. Εγώ εγώ τύπους μην προσπαθήσεις γνωρίζουμε δύο διοικητικό. Επί δεν έστελνε πάντως την όσο ρωτάει.',4,'2019-07-25'),(111,13,13,9780522316438,'Περιεχόμενα του καλύτερο. Συγχωνευτεί μετράει τους πρώτο εργαζόμενοι.',1,'2021-06-05'),(112,3,1,9781923908314,'Την ένας χώρου τα κι γραμμή. Εκθέσεις εδώ ήδη σπίτι ανταγωνιστής. Στη επί γραμμής συγγραφείς τα μη.',3,'2022-03-30'),(113,25,4,9780217836180,'Κάτι χαρτιού υπηρεσία αν στέλνοντάς κώδικα ανά. Δείξει διευθυντές εργαζόμενοι δε πλέον πρόσληψη και. Έστειλε πρώτης άπειρα λαμβάνουν. Περιβάλλον εργαζόμενων διοικητικό εκτός απαραίτητο κάτι.',4,'2020-07-09'),(114,27,4,9781923908314,'Χαρτιού τρόποι δημιουργήσεις πιο δεν εδώ ακούσει. Πλέον όσο έτσι ημέρα πάντα.',4,'2022-02-20'),(115,8,13,9781002388952,'Εκτελέσει κρατάει ένα κόψεις δουλεύει δεν προγραμματιστές εδώ. Θέλεις χαμηλός πολύ περιβάλλον λες ευκολότερο.',2,'2022-08-19'),(116,15,2,9780138991791,'Μιας σημαντικό πρώτης μετρήσεις ας έτσι πάντα.',2,'2020-11-13'),(117,52,4,9781065179436,'Δούλευε σου από έρθει. Τα τι σε θέμα με ήδη που περίπου.',2,'2021-03-01'),(118,14,4,9781038442345,'Για διάβασε αρχεία εφαρμογής προϊόντα χρησιμοποιώντας του οι. Πρώτο και λες επί και πολύ. Δεν δε εγώ βάζοντας απαραίτητο.',2,'2020-08-29'),(119,29,12,9781764081221,'Συνέχεια πρώτοι απαραίτητο έστελνε λιγότερο επενδυτής πως. Εξακολουθεί και δείξει που να των νόμιζες έξι. Πλέον αντιλήφθηκαν το εταιρείες διακοπής ανώδυνη προϊόντα.',5,'2022-03-22'),(120,21,12,9781014642806,'Ζητήσεις εκθέσεις διακοπή τρέξει ναι ζητήσεις. Εκδόσεις συγγραφής όχι πως αλγόριθμου έγραψες περιβάλλοντος διοικητικό. Όταν γραμμή μέχρι τη μεταφραστής υψηλότερη.',4,'2019-09-02'),(121,54,1,9780654457160,'Αυτήν έχω νέου εκτελείται σωστά που.',2,'2020-06-10'),(122,69,13,9780687534784,'Που που όχι απαραίτητο νέων σου. Άτομο εκτελέσεις γιαυτό γράψει βάζοντας σημαντικός. Αποδείξεις φίλος φακέλους προσθέσει τρέξει.',4,'2021-04-28'),(123,30,1,9781894388009,'Ανά χαρακτηριστικών πιο συγγραφείς και αρπάζεις μας. Περιβάλλοντος εδώ μέχρι όχι απλό σαν. Παραγωγικής εκτός μην όσο έχω.',1,'2022-07-02'),(124,64,13,9781689865678,'Μέχρι χάος παίρνουν. Αθόρυβες πεδία προγραμματιστής κλπ χαρακτηριστικό γιαυτό έτσι. Πάντως περιεχόμενα περιεχόμενα ταξινομεί.',2,'2021-11-13'),(125,7,12,9780838870631,'Πρώτο προϊόντα πρώτο τι συνάδελφος. Εσωτερικών διασφαλίζεται πάντως περισσότερες. Περιεχόμενα αποδείξεις εταιρείες πετάνε.',5,'2021-09-15'),(126,57,12,9780958141413,'Μερικούς μερικούς γειτονιάς εγώ. Ήδη βιβλίο εργαζόμενων. Πεδία ένας κόλπα.',5,'2022-04-04'),(127,32,2,9781690512332,'Απαράδεκτη τέλειοι κανείς αυτήν διαφήμιση τη έστελνε.',5,'2020-05-26'),(128,59,13,9781340499716,'Πάρεις απομόνωση εκτελείται αν που πρώτης θα μάλλον. Ίδιο ίδιο ανά κλπ πιο.',2,'2023-05-22'),(129,23,1,9781118617038,'Διαδίκτυο τοπικές πως πάντα νόμιζες γιαυτό. Ναι αποθηκευτικού πλέον διορθώσει εργαλείων λίγο.',2,'2022-05-18'),(130,38,1,9780399208850,'Όταν εξοργιστικά ίδιο διαχειριστής αποθηκευτικού εκτός φακέλους δουλεύει. Στις μιας περισσότερες δεδομένων εδώ διασφαλίζεται την.',1,'2023-02-10'),(131,73,13,9781566266413,'Βουτήξουν ένας πες διολισθήσεις. Έστελνε κρατάει ίδιο καταλάθος έξι παραδοτέου. Ίδιο στραβά αρέσει χαμηλός παραδοτέου.',5,'2021-11-02'),(132,9,2,9781098619374,'Ωραίο κάτι δυστυχής βαθμό διακοπής δημιουργια. Ήδη πως θα τεκμηριώνει έγραψες πολύ ωραίο.',3,'2022-03-17'),(133,33,4,9780833089458,'Ποσοστό ίδιο εργαζόμενων βιβλίο. Αλγόριθμου δημιουργήσεις μου βουτήξουν πάντα.',2,'2022-10-21'),(134,52,4,9780689793264,'Και παραγωγικής τις χρειάζονται σημαντικό. Τα στήλες συγγραφής εντολές άπειρα. Ανεπιθύμητη στη σου τρόποι εσωτερικών δύο πρώτο.',3,'2023-02-08'),(135,18,2,9780613902434,'Ότι διορθώσεις παραδώσεις απαράδεκτη σχεδιαστής κρατήσουν. Στο επιδιόρθωση άπειρα. Τρόπο πετάξαμε χρονοδιαγράμματος μου.',3,'2021-04-27'),(136,69,13,9781844450534,'Πεδία τι επί πάρα περιβάλλον. Ποια διορθώσει μας θα.',2,'2021-04-12'),(137,72,4,9781059025909,'Εργασίας μαγικά περισσότερη απίστευτα ζητήσεις. Λέει παράγοντες από μα.',2,'2020-08-23'),(138,79,1,9781129640254,'Ευκολότερο άρα μερικούς διευθυντές περιβάλλοντος σχεδιαστής εργασίας. Διαδίκτυο ο θα ύψος περιμένουν. Παίξουν ύψος προσεκτικά αποφάσισε εγώ πολύ προσπαθήσεις.',5,'2023-04-13'),(139,46,12,9780846929208,'Μιας υπηρεσία κι διάσημα προσεκτικά συνεχώς πάντα. Παραδοτέου αρπάζεις νέο μας σας εργασίας έτσι.',3,'2021-02-04'),(140,30,1,9780067979235,'Αθόρυβες εντολές την θα πλέον απόλαυσε. Έτσι πάντως παραδώσεις αντιλήφθηκαν πάντα τη αν.',4,'2019-11-18'),(141,5,13,9781038442345,'Αποδείξεις μέχρι στις σωστά χαμηλός εργαλείων. Αποφάσισε σίγουρος αρέσει τα αναφέρονται προσπαθήσεις σε.',2,'2019-10-16'),(142,43,13,9781118617038,'Δύο ότι κι τους προκύπτουν. Προσεκτικά γραφικά τρόπο απομόνωση επιστρέφουν.',1,'2019-12-24'),(143,1,1,9781244904125,'Αυτός υψηλότερη επί πως πιο πάντα στα. Στο μιας ρουτίνα μια διακοπή κλπ δύο.',2,'2020-06-30'),(144,77,13,9780256542806,'Εξαρτάται ξέχασε μάθε εδώ δημιουργήσεις όταν δημιουργείς απομόνωση. Ορίστε τρόποι διακοπή του των κάτι. Ποια μπουν ένας όταν ήδη σαν.',2,'2021-07-05'),(145,65,13,9780388139066,'Ροή διοικητικό λοιπόν πακέτων περισσότερη έτσι δυστυχώς. Κάνε τέλειοι σταματάς. Μηχανής άτομο προκαλείς για μην εκδόσεις. Έστελνε έρθει ακούσει ένα.',4,'2022-10-31'),(146,36,12,9780959641028,'Πακέτων δημιουργήσεις παράδειγμα. Ας εδώ διακοπής ήδη. Ρωτάει δημιουργείς τον στη νόμιζες.',1,'2022-04-09'),(147,43,13,9781046178687,'Σχεδιαστής λετπά τη ρωτάει γιαυτό. Κοιτάζοντας εικόνες παίξουν μερικούς. Γεύματος αλγόριθμου ένα.',2,'2021-05-03'),(148,69,13,9781130957402,'Ωραίο χρονοδιαγράμματος διαπιστώνεις τοπικές νέων. Δύο αρχεία δημιουργια πάντως καλύτερο προσπαθούν. Εντολές ιδιαίτερα προσπαθούν κόλπα χειρότερα ρωτήσει.',1,'2023-04-01'),(149,34,13,9781125264911,'Χειρότερα στο φακέλους πλέον χαρτιού και εφαρμογής. Ρουτίνα θέμα διορθώσεις παίρνουν.',2,'2020-07-27'),(150,54,1,9780126353426,'Όχι πάντα άρθρων γραφικά σωστά αρέσει την. Για διαφήμιση προσεκτικά. Βρίσκονται δεν κάτι τη ελέγχου. Και τις αν σε έξι.',1,'2020-08-16'),(151,42,1,9780719466618,'Κειμένων πάντως στη σε παραδοτέου. Ναι για γεύματος εκτός άλγεβρα βάζοντας.',4,'2022-10-29'),(152,12,12,9780126353426,'Κι δεν εκτελέσει γιαυτό εργασίας τους. Ρωτήσει γεύματος τις όταν δεν αρέσει ώρα.',2,'2023-05-07'),(153,13,13,9781690512332,'Συγχρόνως πλέον δημιουργήσεις ύψος μέγιστη. Υπηρεσία κοιτάζοντας απαρατήρητο μην.',2,'2020-01-19'),(154,25,4,9780478931662,'Όταν παραδώσεις προβληματική πεδία. Παράδειγμα σε γεγονός αλγόριθμου.',2,'2020-08-20'),(155,70,2,9780728854048,'Αλγόριθμου ο παράδειγμα ακούσει αρέσει. Ο λίγο αποστηθίσει. Κώδικα επιχείριση ποια βγήκε απαραίτητο.',4,'2021-03-04'),(156,32,2,9780126353426,'Μέρος ανταγωνιστής τελειώσει παραδοτέου. Ύψος χρόνου ότι προϊόντα. Εργαζόμενοι δύο άλγεβρα τους και πήρε.',5,'2020-02-22'),(157,20,1,9781602596290,'Δε χαρτιού απόλαυσε πακέτων λέει. Γραμμή άρα θέμα τη. Σωστά υποψήφιο εγώ προβληματική παραδώσεις λίγο έγραψες.',4,'2021-11-04'),(158,17,1,9781118617038,'Χαρακτηριστικών μου ναι τύπου. Ανταγωνιστής νέα έχω.',5,'2022-08-03'),(159,68,4,9780495612193,'Τέλειοι λοιπόν έτσι αγοράζοντας ίδιο. Πάντως θέματα φίλος γραμμής τεσσαρών.',2,'2020-03-22'),(160,46,12,9780833089458,'Χρονοδιαγράμματα ο ελέγχου μετράει. Έχω πολύ ερωτήσεις φράση όταν αποφάσισε. Παραπάνω στραβά προβληματική γεγονός γραμμή έρθει ποια όχι.',4,'2020-06-16'),(161,34,13,9780160514425,'Πάντως εφαρμογής και.',4,'2019-10-14'),(162,68,4,9780217836180,'Ώρα έχω δε μέχρι. Διοικητικό στέλνοντάς που μέγιστη θέμα των.',5,'2021-11-28'),(163,36,12,9781450637299,'Εκτελέσεις πολύ κανόνα χειρότερα δουλεύει.',3,'2022-01-05'),(164,34,13,9780067979235,'Διευθυντές εδώ επεξεργασία. Δεδομένων οι κάτι γραμμή μέχρι. Δημιουργια τρόπο όσο χαμηλός προγραμματιστής προκαλείς.',4,'2022-12-06'),(165,62,13,9780687534784,'Σκεφτείς δεν αποφάσισε. Βιαστικά καταλάθος μάλλον βάζοντας κώδικα σπίτι. Κανείς διασφαλίζεται φίλος στέλνοντάς είχαμε ταξινομεί.',4,'2022-10-06'),(166,48,13,9781909213425,'Αναφέρονται κανόνα πάντως ναι παράγοντες. Αν εφαρμογής στις χρησιμοποίησέ το σωστά ποια. Τα μέσης ροή επιδιορθώσεις εφαρμογή προγραμματιστής μέχρι.',5,'2021-01-31'),(167,4,4,9780801685552,'Βαθμό δημιουργήσεις φαινόμενο λίγο χρησιμοποίησέ μα. Θέμα σε ορίστε ημέρα.',3,'2022-02-17'),(168,8,13,9780613902434,'Ποσοστό στα διοικητικό γέλασαν. Ένας διασφαλίζεται άρθρων μια δημιουργια.',2,'2021-06-04'),(169,43,13,9780458449835,'Υπηρεσία βαθμό των έτσι βουτήξουν. Σχεδιαστής περίπου εφαρμογή σταματάς μη χρειάζονται. Λέει μεταγλωτίσει περιμένουν μάλλον κι μην πως ας.',3,'2022-03-17'),(170,21,12,9781661726072,'Ανά μας από όσο βουτήξουν εφαρμογή αρέσει εφαρμογή. Ποσοστό επεξεργασία άρα. Συγχωνευτεί σαν λιγότερο κανείς κάνε να συγκεντρωμένοι.',1,'2021-04-18'),(171,25,4,9781123454376,'Πήρε ένα λετπά μη εκθέσεις και. Δίνοντας εργαζόμενων διαπιστώνεις αυτός ορίστε χρειάζονται μέσης. Μου τι διακόψουμε. Ορίστε διακοπή ότι ένας διακοπή κι από.',2,'2022-05-22'),(172,3,1,9781129640254,'Δημιουργείς γειτονιάς σχεδιαστής σας ροή δεν επιχείριση μην. Εργασίας διακοπή της αποκλειστικούς χάος κι σκεφτείς.',2,'2019-12-18'),(173,3,1,9780728854048,'Ακούσει γραμμή κάτι περίπου έχω.',4,'2022-07-28'),(174,56,4,9781123454376,'Να να λες λες μιας. Από εφαρμογής πλέον τους κοιτάζοντας.',4,'2022-07-07'),(175,75,13,9781661726072,'Νέο κι τις. Ποια δύο γράψει βιαστικά. Εσωτερικών πάρα που δεδομένων.',2,'2020-07-10'),(176,27,4,9781905619221,'Πολύ τύπους βιβλίο προσεκτικά πλέον προγραμματιστές.',3,'2022-09-04'),(177,30,1,9780731663910,'Και δεν να. Χειρότερα δυστυχώς σταματάς εταιρείες. Δύο διαχειριστής δείξει μάτσο λες άλγεβρα.',4,'2022-05-31'),(178,77,13,9781629484297,'Ένας αναφέρονται σημαντικό ακούσει ιδιαίτερα κώδικα και. Δυστυχώς εργασίας νόμιζες γνωστή πιο κάνε. Δε έστειλε διορθώσει χαμηλός. Κοιτάζοντας δεν χειρότερα στη.',4,'2020-10-27'),(179,32,2,9781766699547,'Από βρίσκονται δεν που. Προσεκτικά πόρτες την έχω ορίστε εκτελείται γνωστή ότι.',4,'2020-12-20'),(180,9,2,9780256542806,'Μας πάρα μα πρώτο. Εσωτερικών προσπαθούν περιμένουν οι χάος κρατήσουν ναι ανεπιθύμητη.',4,'2019-12-10'),(181,71,13,9781844450534,'Διολισθήσεις έλεγχος που. Πάντως χρησιμοποίησέ κρατήσουν αν.',3,'2020-04-17'),(182,31,4,9781905619221,'Επενδυτής προσθέσει έστειλε μαγικά φράση μέγιστη μη. Διορθώσεις διορθώσει ένα νέα σου ερωτήσεις στα. Εντολές ο τρέξει πάρα.',2,'2022-09-18'),(183,77,13,9781014642806,'Δεν πρόσληψη εκτελέσει εταιρείες μιας. Πάντως κόψεις πετάξαμε άρα εκδόσεις μην προβληματική.',1,'2022-11-01'),(184,12,12,9781085165068,'Ύψος για κειμένων ίδιο στη έτοιμος. Λιγότερο παραπάνω αρχεία στο θέμα. Προβληματική οι έξι συγχρόνως. Έχω δωροδοκηθούν μας εργάστηκε πες σας.',3,'2020-06-06'),(185,74,12,9780812084177,'Προσθέσει πλέον μερικούς αναγκάζονται της μέσης λαμβάνουν. Ποια μάτσο τον μια για διολισθήσεις.',5,'2021-03-16'),(186,2,2,9781572775084,'Κοιτάζοντας εσωτερικών πάντως λετπά. Και δίνοντας γνωρίζουμε υπηρεσία τη τέλειοι κύκλο πόρτες. Λετπά εφαμοργής της γειτονιάς βασανίζουν τους χαρακτηριστικό μάτσο.',3,'2020-06-19'),(187,79,1,9781946521460,'Μας ανά συνέχεια εργασίας και.',5,'2023-01-07'),(188,22,13,9781874732761,'Της κόλπα όσο αγοράζοντας. Σε νόμιζες περιεχόμενα γειτονιάς χαρτιού τύπους ίδιο. Ποσοστό εταιρείες διαπιστώνεις δύο προβληματική τι.',5,'2021-09-05'),(190,43,13,9780689793264,'Πάντα προσοχή στα χρονοδιαγράμματα ναι χρονοδιαγράμματα αποφάσισε επί. Εφαρμογή ανώδυνη διαδίκτυο ρουτίνα από.',4,'2020-02-26'),(192,41,2,9781766699547,'Ναι τι είχαμε κι. Ποια τύπου νέα σαν χρειάζονται ας μεταφραστής.',3,'2022-12-28'),(193,76,12,9781975271022,'Μην διορθώσεις γιαυτό κι περιεχόμενα βιαστικά ροή. Διαδίκτυο τη βάζοντας δημιουργείς. Αντιλήφθηκαν εργαζόμενοι ύψος πάντως ερωτήσεις.',5,'2022-10-17'),(194,60,2,9780812084177,'Στις προκαλείς πετάνε γνωρίζουμε ανεπιθύμητη. Λαμβάνουν είχαμε κειμένων δύο εργαλείων εκθέσεις να. Εκείνου απίστευτα να. Δημιουργείς σου λοιπόν φίλος έτσι τέλειοι των.',2,'2022-06-28'),(195,40,4,9780719466618,'Βασανίζουν ίδιο διορθώσεις μέγιστη εγώ κύκλο ώρα. Κρατάει έτσι τις για. Διαφήμιση πάντα γειτονιάς στις πως.',4,'2021-09-13'),(196,30,1,9780217836180,'Προσεκτικά εργαζόμενοι διασφαλίζεται ωραίο έτσι κι τη. Γράψει ίδιο του δοκιμάσεις εδώ έστελνε συγχωνευτεί. Χρόνου μιας ανά τελειώσει.',4,'2021-04-01'),(197,57,12,9780458449835,'Επί αθόρυβες εταιρείες πλέον μέρος ύψος. Χώρου άρθρων εκτελείται συνεντεύξεις μηχανής ήδη αν εκείνου. Σαν ίδιο πετάνε στα της.',2,'2022-09-03'),(198,58,1,9780067979235,'Γειτονιάς όχι αγοράζοντας.',4,'2020-06-07'),(199,67,1,9781766699547,'Συγχωνευτεί μάλλον βαθμό αποθηκευτικού δημιουργια. Φίλος χάος υποψήφιο δούλευε χαρακτηριστικών. Έξι συνεντεύξεις εργαζόμενοι οι.',2,'2019-07-06'),(200,57,12,9781085165068,'Διασφαλίζεται απομόνωση μεταγλωτίσει περιβάλλον οι μετρήσεις. Νέων εγώ εγώ προβληματική έχω.',5,'2020-09-27');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `review_full_data`
--

DROP TABLE IF EXISTS `review_full_data`;
/*!50001 DROP VIEW IF EXISTS `review_full_data`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `review_full_data` AS SELECT
 1 AS `ISBN`,
  1 AS `book_title`,
  1 AS `likert_scale`,
  1 AS `text`,
  1 AS `reviewer_id`,
  1 AS `username`,
  1 AS `school_id`,
  1 AS `review_id`,
  1 AS `admin_user_id` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `school_book`
--

DROP TABLE IF EXISTS `school_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school_book` (
  `school_id` int(7) unsigned NOT NULL,
  `ISBN` bigint(13) unsigned zerofill NOT NULL,
  `available_copies` int(10) unsigned NOT NULL,
  PRIMARY KEY (`school_id`,`ISBN`),
  KEY `fk_school_book_book` (`ISBN`),
  CONSTRAINT `fk_school_book_book` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_school_book_school_unit` FOREIGN KEY (`school_id`) REFERENCES `school_unit` (`school_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_book`
--

LOCK TABLES `school_book` WRITE;
/*!40000 ALTER TABLE `school_book` DISABLE KEYS */;
INSERT INTO `school_book` VALUES (1250259,9780054770050,0),(1250259,9780064449649,6),(1250259,9780065907940,9),(1250259,9780067979235,14),(1250259,9780100398542,15),(1250259,9780114812577,7),(1250259,9780126353426,10),(1250259,9780160514425,15),(1250259,9780217836180,5),(1250259,9780388139066,11),(1250259,9780399208850,6),(1250259,9780478931662,15),(1250259,9780522316438,0),(1250259,9780555249710,12),(1250259,9780613902434,7),(1250259,9780687534784,7),(1250259,9780689793264,10),(1250259,9780731663910,7),(1250259,9780793507368,12),(1250259,9780799527001,10),(1250259,9780801685552,7),(1250259,9780829906264,12),(1250259,9780855742485,2),(1250259,9780866588195,1),(1250259,9780958141413,0),(1250259,9780995054233,13),(1250259,9780995642669,15),(1250259,9781002388952,14),(1250259,9781014642806,12),(1250259,9781038442345,11),(1250259,9781046178687,11),(1250259,9781057608920,11),(1250259,9781065179436,13),(1250259,9781085165068,10),(1250259,9781098619374,6),(1250259,9781125264911,14),(1250259,9781130957402,11),(1250259,9781244904125,6),(1250259,9781287039624,2),(1250259,9781317966746,0),(1250259,9781340499716,9),(1250259,9781503987845,6),(1250259,9781561025671,4),(1250259,9781561036387,9),(1250259,9781572775084,6),(1250259,9781602596290,12),(1250259,9781629484297,13),(1250259,9781689865678,10),(1250259,9781690512332,5),(1250259,9781764081221,13),(1250259,9781766699547,6),(1250259,9781844450534,0),(1250259,9781905619221,0),(1250259,9781909213425,1),(1250259,9781946521460,0),(1250259,9781975271022,15),(1250259,9781990994821,12),(1905845,9780054770050,11),(1905845,9780064449649,7),(1905845,9780065907940,0),(1905845,9780067979235,12),(1905845,9780100398542,11),(1905845,9780114812577,3),(1905845,9780167617051,13),(1905845,9780217836180,8),(1905845,9780243438600,9),(1905845,9780256542806,11),(1905845,9780295914343,6),(1905845,9780322545335,3),(1905845,9780388139066,9),(1905845,9780399208850,0),(1905845,9780458449835,10),(1905845,9780478931662,4),(1905845,9780495612193,7),(1905845,9780522316438,0),(1905845,9780555249710,2),(1905845,9780613902434,1),(1905845,9780687534784,3),(1905845,9780689793264,7),(1905845,9780719466618,12),(1905845,9780728854048,5),(1905845,9780731663910,3),(1905845,9780781653794,10),(1905845,9780793507368,6),(1905845,9780799527001,3),(1905845,9780801685552,0),(1905845,9780812084177,2),(1905845,9780833089458,2),(1905845,9780838870631,2),(1905845,9780846929208,1),(1905845,9780866588195,14),(1905845,9780950822570,3),(1905845,9780959641028,12),(1905845,9781014642806,15),(1905845,9781038442345,15),(1905845,9781046178687,8),(1905845,9781057608920,11),(1905845,9781059025909,0),(1905845,9781085165068,1),(1905845,9781118617038,8),(1905845,9781123454376,3),(1905845,9781125264911,11),(1905845,9781129640254,2),(1905845,9781130957402,4),(1905845,9781244904125,6),(1905845,9781261463926,14),(1905845,9781287039624,9),(1905845,9781340499716,12),(1905845,9781450637299,9),(1905845,9781531006112,10),(1905845,9781561025671,0),(1905845,9781561036387,9),(1905845,9781605521923,11),(1905845,9781629484297,6),(1905845,9781689865678,6),(1905845,9781721541966,3),(1905845,9781764081221,2),(1905845,9781766699547,10),(1905845,9781844450534,14),(1905845,9781857542547,8),(1905845,9781874732761,2),(1905845,9781923908314,8),(1905845,9781975271022,5),(4703793,9780054770050,0),(4703793,9780064449649,0),(4703793,9780067979235,0),(4703793,9780100398542,1),(4703793,9780138991791,7),(4703793,9780295914343,5),(4703793,9780458449835,4),(4703793,9780478931662,13),(4703793,9780495612193,2),(4703793,9780522316438,13),(4703793,9780555249710,7),(4703793,9780613902434,11),(4703793,9780687534784,0),(4703793,9780689793264,4),(4703793,9780719466618,3),(4703793,9780728854048,11),(4703793,9780731663910,3),(4703793,9780781653794,7),(4703793,9780799527001,11),(4703793,9780801685552,5),(4703793,9780812084177,6),(4703793,9780829906264,11),(4703793,9780855742485,8),(4703793,9780866588195,10),(4703793,9780950822570,6),(4703793,9780959641028,8),(4703793,9780995642669,9),(4703793,9781038442345,4),(4703793,9781046178687,3),(4703793,9781059025909,2),(4703793,9781065179436,1),(4703793,9781085165068,3),(4703793,9781118617038,7),(4703793,9781120785237,6),(4703793,9781123454376,0),(4703793,9781129640254,5),(4703793,9781244904125,11),(4703793,9781261463926,1),(4703793,9781317966746,9),(4703793,9781340499716,3),(4703793,9781429201162,13),(4703793,9781450637299,9),(4703793,9781503987845,2),(4703793,9781531006112,5),(4703793,9781561036387,0),(4703793,9781572775084,2),(4703793,9781629484297,15),(4703793,9781661726072,8),(4703793,9781689865678,7),(4703793,9781690512332,0),(4703793,9781721541966,9),(4703793,9781764081221,15),(4703793,9781857542547,11),(4703793,9781874732761,1),(4703793,9781894388009,7),(4703793,9781923908314,8),(4703793,9781946521460,13),(4703793,9781990994821,5),(4703793,9781992362994,12),(6684421,9780054770050,7),(6684421,9780064449649,0),(6684421,9780065907940,6),(6684421,9780114812577,0),(6684421,9780159376690,15),(6684421,9780167617051,6),(6684421,9780217836180,0),(6684421,9780243438600,9),(6684421,9780256542806,10),(6684421,9780295914343,8),(6684421,9780322545335,0),(6684421,9780388139066,4),(6684421,9780458449835,9),(6684421,9780495612193,5),(6684421,9780522316438,1),(6684421,9780555249710,1),(6684421,9780613902434,13),(6684421,9780719466618,4),(6684421,9780731663910,15),(6684421,9780781653794,10),(6684421,9780793507368,11),(6684421,9780799527001,3),(6684421,9780812084177,11),(6684421,9780838870631,2),(6684421,9780846929208,3),(6684421,9780950822570,7),(6684421,9780958141413,4),(6684421,9780959641028,6),(6684421,9780995642669,6),(6684421,9781002388952,8),(6684421,9781046178687,3),(6684421,9781057608920,6),(6684421,9781065179436,14),(6684421,9781085165068,8),(6684421,9781098619374,3),(6684421,9781123454376,15),(6684421,9781130957402,4),(6684421,9781232774136,3),(6684421,9781244904125,10),(6684421,9781287039624,6),(6684421,9781429201162,1),(6684421,9781518250859,13),(6684421,9781531006112,4),(6684421,9781561036387,8),(6684421,9781566266413,6),(6684421,9781572775084,0),(6684421,9781602596290,7),(6684421,9781605521923,12),(6684421,9781629484297,4),(6684421,9781661726072,1),(6684421,9781690512332,0),(6684421,9781721541966,11),(6684421,9781764081221,3),(6684421,9781844450534,10),(6684421,9781857542547,1),(6684421,9781874732761,10),(6684421,9781894388009,1),(6684421,9781905619221,2),(6684421,9781909213425,2),(6684421,9781923908314,4),(6684421,9781946521460,14),(6684421,9781990994821,10),(7887268,9780064449649,14),(7887268,9780065907940,6),(7887268,9780067979235,2),(7887268,9780100398542,11),(7887268,9780114812577,5),(7887268,9780126353426,2),(7887268,9780138991791,12),(7887268,9780159376690,10),(7887268,9780167617051,10),(7887268,9780243438600,15),(7887268,9780295914343,8),(7887268,9780322545335,7),(7887268,9780458449835,7),(7887268,9780478931662,10),(7887268,9780654457160,7),(7887268,9780689793264,6),(7887268,9780719466618,2),(7887268,9780728854048,9),(7887268,9780731663910,7),(7887268,9780781653794,14),(7887268,9780793507368,6),(7887268,9780799527001,1),(7887268,9780801685552,7),(7887268,9780812084177,9),(7887268,9780833089458,7),(7887268,9780838870631,14),(7887268,9780846929208,3),(7887268,9780855742485,5),(7887268,9780894166938,5),(7887268,9780916174880,11),(7887268,9780959641028,0),(7887268,9780995642669,10),(7887268,9781014642806,13),(7887268,9781046178687,13),(7887268,9781057608920,7),(7887268,9781059025909,7),(7887268,9781065179436,11),(7887268,9781085165068,1),(7887268,9781098619374,7),(7887268,9781118617038,11),(7887268,9781120785237,2),(7887268,9781125264911,3),(7887268,9781129640254,2),(7887268,9781130957402,6),(7887268,9781244904125,1),(7887268,9781261463926,7),(7887268,9781287039624,2),(7887268,9781317966746,5),(7887268,9781340499716,3),(7887268,9781429201162,4),(7887268,9781510452237,10),(7887268,9781531006112,5),(7887268,9781561025671,1),(7887268,9781572775084,2),(7887268,9781689865678,7),(7887268,9781690512332,13),(7887268,9781721541966,0),(7887268,9781844450534,7),(7887268,9781857542547,7),(7887268,9781874732761,5),(7887268,9781905619221,7),(7887268,9781909213425,6),(7887268,9781923908314,4),(7887268,9781946521460,8),(7887268,9781992362994,12);
/*!40000 ALTER TABLE `school_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_email`
--

DROP TABLE IF EXISTS `school_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school_email` (
  `school_id` int(7) unsigned NOT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`school_id`,`email`),
  KEY `idx_school_email` (`school_id`),
  CONSTRAINT `fk_school_email_school_unit` FOREIGN KEY (`school_id`) REFERENCES `school_unit` (`school_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_email`
--

LOCK TABLES `school_email` WRITE;
/*!40000 ALTER TABLE `school_email` DISABLE KEYS */;
INSERT INTO `school_email` VALUES (1250259,'roberto10@example.org'),(1250259,'sbanks@example.org'),(1905845,'zachary93@example.net'),(4703793,'mendozajeremy@example.org'),(4703793,'sanchezvictor@example.com'),(4703793,'xbailey@example.net'),(6684421,'evelynmurphy@example.com'),(6684421,'jonesjacqueline@example.org'),(6684421,'kimbryan@example.com'),(7887268,'anthonyjohnson@example.org');
/*!40000 ALTER TABLE `school_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_phone`
--

DROP TABLE IF EXISTS `school_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school_phone` (
  `school_id` int(7) unsigned zerofill NOT NULL,
  `phone_number` bigint(10) unsigned zerofill NOT NULL CHECK (`phone_number` < 10000000000),
  PRIMARY KEY (`school_id`,`phone_number`),
  KEY `idx_school_phone` (`school_id`),
  CONSTRAINT `fk_school_phone_school_unit` FOREIGN KEY (`school_id`) REFERENCES `school_unit` (`school_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_phone`
--

LOCK TABLES `school_phone` WRITE;
/*!40000 ALTER TABLE `school_phone` DISABLE KEYS */;
INSERT INTO `school_phone` VALUES (1250259,0590377649),(1250259,4319556827),(1250259,8849599421),(1905845,5232679296),(4703793,4549512226),(4703793,8353967267),(6684421,3228309027),(6684421,4272056778),(6684421,9609750137),(7887268,3385466256);
/*!40000 ALTER TABLE `school_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `school_rents`
--

DROP TABLE IF EXISTS `school_rents`;
/*!50001 DROP VIEW IF EXISTS `school_rents`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `school_rents` AS SELECT
 1 AS `school_id`,
  1 AS `school_name`,
  1 AS `rent_id`,
  1 AS `username`,
  1 AS `start_date` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `school_teachers`
--

DROP TABLE IF EXISTS `school_teachers`;
/*!50001 DROP VIEW IF EXISTS `school_teachers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `school_teachers` AS SELECT
 1 AS `user_id`,
  1 AS `first_name`,
  1 AS `last_name`,
  1 AS `school_id` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `school_unit`
--

DROP TABLE IF EXISTS `school_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school_unit` (
  `school_id` int(7) unsigned zerofill NOT NULL CHECK (`school_id` < 10000000),
  `school_name` varchar(50) NOT NULL,
  `city` varchar(20) NOT NULL,
  `address` varchar(30) NOT NULL,
  `zip_code` int(5) unsigned zerofill NOT NULL,
  PRIMARY KEY (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_unit`
--

LOCK TABLES `school_unit` WRITE;
/*!40000 ALTER TABLE `school_unit` DISABLE KEYS */;
INSERT INTO `school_unit` VALUES (1250259,'4o Ενιαίο Λύκειο Σερρών','Σέρρες','Εθιάς 21',24542),(1905845,'86o Ενιαίο Λύκειο Λάρισας','Λάρισα','Κασσωτάκη 84-70',85179),(4703793,'92o Γυμνάσιο Χανίων','Χανιά','Πύργων Θερμής 78-73',74249),(6684421,'31o Λύκειο Βόλου','Βόλος','Βουναρίων 151-967',69448),(7887268,'80o 1ο Γυμνάσιο Θεσσαλονίκης','Θεσσαλονίκη','Φίλια 30',36139);
/*!40000 ALTER TABLE `school_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_student_lib_user` FOREIGN KEY (`user_id`) REFERENCES `lib_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),(51),(52),(53),(54),(55),(56),(57),(58),(59),(60),(61),(62),(63),(64),(65),(66),(67),(68),(69),(70),(71),(72),(73),(74),(75),(76),(77),(78),(79),(80);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `user_id` int(11) NOT NULL,
  `birth_date` date NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_teacher_lib_user` FOREIGN KEY (`user_id`) REFERENCES `lib_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (1,'1964-01-03'),(2,'1976-10-19'),(3,'2001-10-24'),(4,'1949-11-12'),(5,'1977-12-08'),(6,'1995-07-29'),(7,'1992-02-28'),(8,'1960-09-25'),(9,'1986-05-10'),(10,'1995-08-25'),(11,'1978-07-14'),(12,'1985-02-07'),(13,'1992-03-06'),(14,'1970-10-13'),(15,'1989-08-27'),(16,'1972-10-29'),(17,'1994-11-29'),(18,'1983-06-10'),(19,'1981-09-01'),(20,'1971-02-23');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `user_page_info`
--

DROP TABLE IF EXISTS `user_page_info`;
/*!50001 DROP VIEW IF EXISTS `user_page_info`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `user_page_info` AS SELECT
 1 AS `user_id`,
  1 AS `username`,
  1 AS `first_name`,
  1 AS `last_name`,
  1 AS `renting`,
  1 AS `reserving`,
  1 AS `role`,
  1 AS `birth_date` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `user_renting_info`
--

DROP TABLE IF EXISTS `user_renting_info`;
/*!50001 DROP VIEW IF EXISTS `user_renting_info`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `user_renting_info` AS SELECT
 1 AS `user_id`,
  1 AS `username`,
  1 AS `school_id`,
  1 AS `renting`,
  1 AS `reserving`,
  1 AS `role` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `user_review_avg`
--

DROP TABLE IF EXISTS `user_review_avg`;
/*!50001 DROP VIEW IF EXISTS `user_review_avg`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `user_review_avg` AS SELECT
 1 AS `user_id`,
  1 AS `username`,
  1 AS `first_name`,
  1 AS `last_name`,
  1 AS `AVG(likert_scale)` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `user_review_category_avg`
--

DROP TABLE IF EXISTS `user_review_category_avg`;
/*!50001 DROP VIEW IF EXISTS `user_review_category_avg`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `user_review_category_avg` AS SELECT
 1 AS `user_id`,
  1 AS `username`,
  1 AS `first_name`,
  1 AS `last_name`,
  1 AS `category_name`,
  1 AS `avg` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!50001 DROP VIEW IF EXISTS `user_role`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `user_role` AS SELECT
 1 AS `user_id`,
  1 AS `school_id`,
  1 AS `role` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `writer`
--

DROP TABLE IF EXISTS `writer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `writer` (
  `writer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  PRIMARY KEY (`writer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `writer`
--

LOCK TABLES `writer` WRITE;
/*!40000 ALTER TABLE `writer` DISABLE KEYS */;
INSERT INTO `writer` VALUES (1,'Nicholas','Mendez'),(2,'Bryan','Coleman'),(3,'Kristy','Stephenson'),(4,'Kerri','Wilson'),(5,'Joseph','Ross'),(6,'Maria','Watson'),(7,'Diana','Hughes'),(8,'Craig','Wolfe'),(9,'Travis','Franco'),(10,'Beth','Harris'),(11,'Rose','Monroe'),(12,'Alexis','Davis'),(13,'Michael','Ross'),(14,'Mario','Myers'),(15,'Ashley','Fleming'),(16,'Laura','Alvarado'),(17,'Stephanie','Carlson'),(18,'Gloria','Hayes'),(19,'James','Rhodes'),(20,'Brandy','Morgan'),(21,'April','Rasmussen'),(22,'John','Collins'),(23,'Brandy','Ross'),(24,'Amanda','Cook'),(25,'Anna','Cantrell'),(26,'Paul','Johnson'),(27,'Stacy','Conley'),(28,'Kenneth','Jones'),(29,'Billy','Williams'),(30,'Christopher','Adams'),(31,'Cameron','Leonard'),(32,'Denise','Davis'),(33,'Louis','Booth'),(34,'Alexander','James'),(35,'Erik','Sanchez'),(36,'Angela','Mckinney'),(37,'Jill','Jones'),(38,'Daniel','Hart'),(39,'Bryce','Fuentes'),(40,'Gregory','Cox'),(41,'Amber','Johnson'),(42,'Melvin','Montgomery'),(43,'Donna','Bell'),(44,'Tanya','Ramirez'),(45,'Lisa','Schwartz'),(46,'Jay','Sanchez'),(47,'Michael','Sanders'),(48,'Tammy','Johnson'),(49,'Brittany','Rivas'),(50,'Kimberly','Rodgers');
/*!40000 ALTER TABLE `writer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `writer_book`
--

DROP TABLE IF EXISTS `writer_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `writer_book` (
  `ISBN` bigint(13) unsigned NOT NULL,
  `writer_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ISBN`,`writer_id`),
  KEY `fk_writer_book_writer` (`writer_id`),
  KEY `idx_writer_book_isbn` (`ISBN`),
  CONSTRAINT `fk_writer_book_book` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_writer_book_writer` FOREIGN KEY (`writer_id`) REFERENCES `writer` (`writer_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `writer_book`
--

LOCK TABLES `writer_book` WRITE;
/*!40000 ALTER TABLE `writer_book` DISABLE KEYS */;
INSERT INTO `writer_book` VALUES (9780054770050,30),(9780064449649,47),(9780065907940,44),(9780065907940,48),(9780067979235,23),(9780100398542,29),(9780114812577,4),(9780114812577,9),(9780114812577,14),(9780126353426,43),(9780126353426,49),(9780138991791,10),(9780159376690,18),(9780160514425,25),(9780167617051,26),(9780167617051,40),(9780217836180,3),(9780217836180,14),(9780243438600,23),(9780256542806,31),(9780295914343,32),(9780322545335,13),(9780322545335,49),(9780388139066,41),(9780399208850,11),(9780399208850,24),(9780399208850,35),(9780458449835,1),(9780458449835,9),(9780458449835,20),(9780458449835,39),(9780478931662,20),(9780495612193,32),(9780495612193,48),(9780522316438,20),(9780522316438,45),(9780555249710,32),(9780613902434,45),(9780654457160,26),(9780687534784,38),(9780689793264,6),(9780719466618,8),(9780719466618,39),(9780728854048,35),(9780731663910,25),(9780781653794,1),(9780781653794,33),(9780781653794,39),(9780793507368,24),(9780799527001,22),(9780799527001,49),(9780801685552,43),(9780812084177,15),(9780829906264,49),(9780833089458,2),(9780838870631,39),(9780846929208,18),(9780846929208,23),(9780846929208,50),(9780855742485,38),(9780866588195,25),(9780894166938,39),(9780894166938,41),(9780916174880,10),(9780950822570,28),(9780950822570,33),(9780958141413,24),(9780958141413,46),(9780959641028,6),(9780959641028,39),(9780959641028,43),(9780995054233,17),(9780995642669,8),(9780995642669,27),(9781002388952,35),(9781002388952,48),(9781014642806,50),(9781038442345,4),(9781038442345,13),(9781038442345,48),(9781046178687,6),(9781057608920,20),(9781057608920,24),(9781059025909,16),(9781059025909,24),(9781065179436,9),(9781065179436,14),(9781085165068,16),(9781098619374,7),(9781118617038,11),(9781120785237,32),(9781123454376,23),(9781125264911,38),(9781129640254,33),(9781129640254,44),(9781130957402,35),(9781232774136,16),(9781232774136,22),(9781244904125,45),(9781261463926,1),(9781287039624,1),(9781317966746,16),(9781317966746,26),(9781340499716,2),(9781340499716,42),(9781429201162,15),(9781450637299,34),(9781476387246,12),(9781476387246,14),(9781503987845,22),(9781503987845,50),(9781510452237,6),(9781510452237,9),(9781518250859,9),(9781518250859,27),(9781531006112,23),(9781561025671,17),(9781561036387,24),(9781566266413,31),(9781566266413,50),(9781572775084,21),(9781602596290,24),(9781605521923,1),(9781605521923,50),(9781629484297,33),(9781661726072,22),(9781689865678,19),(9781690512332,5),(9781721541966,3),(9781721541966,32),(9781764081221,20),(9781764081221,41),(9781766699547,35),(9781766699547,44),(9781844450534,36),(9781857542547,2),(9781874732761,40),(9781894388009,37),(9781905619221,34),(9781909213425,6),(9781909213425,16),(9781923908314,9),(9781923908314,16),(9781946521460,14),(9781975271022,32),(9781990994821,42),(9781992362994,25);
/*!40000 ALTER TABLE `writer_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `writer_book_count`
--

DROP TABLE IF EXISTS `writer_book_count`;
/*!50001 DROP VIEW IF EXISTS `writer_book_count`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `writer_book_count` AS SELECT
 1 AS `writer_id`,
  1 AS `first_name`,
  1 AS `last_name`,
  1 AS `book_count` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `writers_with_no_rented_books`
--

DROP TABLE IF EXISTS `writers_with_no_rented_books`;
/*!50001 DROP VIEW IF EXISTS `writers_with_no_rented_books`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `writers_with_no_rented_books` AS SELECT
 1 AS `writer_id`,
  1 AS `first_name`,
  1 AS `last_name` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `young_teachers`
--

DROP TABLE IF EXISTS `young_teachers`;
/*!50001 DROP VIEW IF EXISTS `young_teachers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `young_teachers` AS SELECT
 1 AS `user_id`,
  1 AS `first_name`,
  1 AS `last_name`,
  1 AS `count(ar.ISBN)`,
  1 AS `age` */;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'dbproject'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `delete_reservations` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `delete_reservations` ON SCHEDULE EVERY 1 DAY STARTS '2023-06-04 16:58:34' ON COMPLETION NOT PRESERVE ENABLE DO DELETE FROM reservations WHERE submission_date < DATE_SUB(CURRENT_DATE,INTERVAL 1 WEEK) */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'dbproject'
--

--
-- Final view structure for view `admin_rent`
--

/*!50001 DROP VIEW IF EXISTS `admin_rent`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `admin_rent` AS select `ar`.`admin_user_id` AS `admin_id`,`u`.`first_name` AS `first_name`,`u`.`last_name` AS `last_name`,`ar`.`rent_id` AS `rent_id`,`ar`.`start_date` AS `start_date` from (`all_rent` `ar` join `lib_user` `u` on(`ar`.`admin_user_id` = `u`.`user_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `admin_rent_per_year`
--

/*!50001 DROP VIEW IF EXISTS `admin_rent_per_year`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `admin_rent_per_year` AS select `admin_rent`.`admin_id` AS `admin_id`,`admin_rent`.`first_name` AS `first_name`,`admin_rent`.`last_name` AS `last_name`,year(`admin_rent`.`start_date`) AS `rent_year`,count(`admin_rent`.`rent_id`) AS `rents` from `admin_rent` group by `admin_rent`.`admin_id`,year(`admin_rent`.`start_date`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `admins_with_same_rentals_in_year`
--

/*!50001 DROP VIEW IF EXISTS `admins_with_same_rentals_in_year`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `admins_with_same_rentals_in_year` AS select `a1`.`first_name` AS `fn1`,`a1`.`last_name` AS `ln1`,`a2`.`first_name` AS `fn2`,`a2`.`last_name` AS `ln2`,`a1`.`rents` AS `rents`,`a1`.`rent_year` AS `rent_year` from (`admin_rent_per_year` `a1` join `admin_rent_per_year` `a2` on(`a1`.`rents` = `a2`.`rents` and `a1`.`rent_year` = `a2`.`rent_year` and `a1`.`admin_id` < `a2`.`admin_id`)) where `a2`.`rents` > 20 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `all_rent`
--

/*!50001 DROP VIEW IF EXISTS `all_rent`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `all_rent` AS select 'ACT' AS `status`,`active_rent`.`rent_ID` AS `rent_id`,`active_rent`.`ISBN` AS `ISBN`,`active_rent`.`renting_user_id` AS `renting_user_id`,`active_rent`.`admin_user_id` AS `admin_user_id`,`active_rent`.`start_date` AS `start_date`,NULL AS `return_date` from `active_rent` union select 'PAST' AS `status`,`past_rent`.`rent_ID` AS `rent_id`,`past_rent`.`ISBN` AS `ISBN`,`past_rent`.`renting_user_id` AS `renting_user_id`,`past_rent`.`admin_user_id` AS `admin_user_id`,`past_rent`.`start_date` AS `start_date`,`past_rent`.`return_date` AS `return_date` from `past_rent` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `all_rents_from_teachers`
--

/*!50001 DROP VIEW IF EXISTS `all_rents_from_teachers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `all_rents_from_teachers` AS select `r`.`status` AS `status`,`r`.`rent_id` AS `rent_id`,`r`.`ISBN` AS `ISBN`,`r`.`renting_user_id` AS `renting_user_id`,`r`.`admin_user_id` AS `admin_user_id`,`r`.`start_date` AS `start_date`,`r`.`return_date` AS `return_date`,`t`.`user_id` AS `user_id`,`t`.`birth_date` AS `birth_date` from (`all_rent` `r` join `teacher` `t` on(`r`.`renting_user_id` = `t`.`user_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `book_full_data`
--

/*!50001 DROP VIEW IF EXISTS `book_full_data`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `book_full_data` AS select `b`.`ISBN` AS `ISBN`,`b`.`title` AS `title`,`b`.`writer_id` AS `writer_id`,`b`.`writer_names` AS `writer_names`,`b`.`categories` AS `categories`,`b`.`keywords` AS `keywords`,`l`.`language_name` AS `language` from ((select `b`.`ISBN` AS `ISBN`,`b`.`title` AS `title`,`b`.`writer_id` AS `writer_id`,`b`.`writer_names` AS `writer_names`,`b`.`categories` AS `categories`,group_concat(`k`.`keyword` separator ', ') AS `keywords` from ((select `b`.`ISBN` AS `ISBN`,`b`.`title` AS `title`,`b`.`writer_id` AS `writer_id`,`b`.`writer_names` AS `writer_names`,group_concat(`c`.`category_name` separator ',') AS `categories` from ((select `b`.`ISBN` AS `ISBN`,`b`.`title` AS `title`,`wb`.`writer_id` AS `writer_id`,group_concat(' ',`w`.`first_name`,' ',`w`.`last_name` separator ',') AS `writer_names` from ((`book` `b`  join `writer_book` `wb` on(`b`.`ISBN` = `wb`.`ISBN`))  join `writer` `w` on(`wb`.`writer_id` = `w`.`writer_id`)) group by `b`.`ISBN`) `b`  join `book_category` `c` on(`b`.`ISBN` = `c`.`ISBN`)) group by `b`.`ISBN`) `b`  join `book_keyword` `k` on(`b`.`ISBN` = `k`.`ISBN`)) group by `b`.`ISBN`) `b`  join `book_language` `l` on(`b`.`ISBN` = `l`.`ISBN`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `book_full_data_searchable`
--

/*!50001 DROP VIEW IF EXISTS `book_full_data_searchable`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `book_full_data_searchable` AS select `b`.`ISBN` AS `ISBN`,`b`.`title` AS `title`,`b`.`writer_id` AS `writer_id`,`b`.`writer_names` AS `writer_names`,`b`.`categories` AS `categories`,`b`.`keywords` AS `keywords`,`l`.`language_name` AS `language`,`sb`.`available_copies` AS `available_copies`,`sb`.`school_id` AS `school_id` from (((select `b`.`ISBN` AS `ISBN`,`b`.`title` AS `title`,`b`.`writer_id` AS `writer_id`,`b`.`writer_names` AS `writer_names`,`b`.`categories` AS `categories`,group_concat(`k`.`keyword` separator ', ') AS `keywords` from ((select `b`.`ISBN` AS `ISBN`,`b`.`title` AS `title`,`b`.`writer_id` AS `writer_id`,`b`.`writer_names` AS `writer_names`,group_concat(`c`.`category_name` separator ',') AS `categories` from ((select `b`.`ISBN` AS `ISBN`,`b`.`title` AS `title`,`wb`.`writer_id` AS `writer_id`,group_concat(' ',`w`.`first_name`,' ',`w`.`last_name` separator ',') AS `writer_names` from ((`book` `b` left join `writer_book` `wb` on(`b`.`ISBN` = `wb`.`ISBN`)) left join `writer` `w` on(`wb`.`writer_id` = `w`.`writer_id`)) group by `b`.`ISBN`) `b` left join `book_category` `c` on(`b`.`ISBN` = `c`.`ISBN`)) group by `b`.`ISBN`) `b` left join `book_keyword` `k` on(`b`.`ISBN` = `k`.`ISBN`)) group by `b`.`ISBN`) `b` left join `book_language` `l` on(`b`.`ISBN` = `l`.`ISBN`)) left join `school_book` `sb` on(`b`.`ISBN` = `sb`.`ISBN`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `book_rent_count`
--

/*!50001 DROP VIEW IF EXISTS `book_rent_count`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `book_rent_count` AS select `b`.`ISBN` AS `ISBN`,count(`r`.`rent_id`) AS `rent_count` from (`book` `b` join `all_rent` `r`) where `b`.`ISBN` = `r`.`ISBN` group by `b`.`ISBN` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `category_review_avg`
--

/*!50001 DROP VIEW IF EXISTS `category_review_avg`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `category_review_avg` AS select `c`.`category_name` AS `category_name`,avg(`r`.`likert_scale`) AS `AVG(likert_scale)` from ((`category` `c` left join `book_category` `bc` on(`c`.`category_name` = `bc`.`category_name`)) left join `review` `r` on(`r`.`ISBN` = `bc`.`ISBN`)) group by `c`.`category_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `category_review_avg_per_school`
--

/*!50001 DROP VIEW IF EXISTS `category_review_avg_per_school`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `category_review_avg_per_school` AS select `c`.`category_name` AS `category_name`,avg(`r`.`likert_scale`) AS `AVG(likert_scale)`,`u`.`school_id` AS `school_id` from (((`category` `c` left join `book_category` `bc` on(`c`.`category_name` = `bc`.`category_name`)) left join `review` `r` on(`r`.`ISBN` = `bc`.`ISBN`)) left join `lib_user` `u` on(`r`.`reviewer_id` = `u`.`user_id`)) group by `c`.`category_name`,`u`.`school_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `late_rent`
--

/*!50001 DROP VIEW IF EXISTS `late_rent`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `late_rent` AS select `active_rent`.`rent_ID` AS `rent_ID`,`active_rent`.`renting_user_id` AS `rent_user_id`,`active_rent`.`admin_user_id` AS `admin_user_id`,`active_rent`.`ISBN` AS `ISBN`,`active_rent`.`start_date` AS `start_date`,to_days(curdate()) - to_days(`active_rent`.`start_date` + interval 1 week) AS `late_by` from `active_rent` where curdate() > `active_rent`.`start_date` + interval 1 week */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `most_popular_category_pairs`
--

/*!50001 DROP VIEW IF EXISTS `most_popular_category_pairs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `most_popular_category_pairs` AS select `c1`.`category_name` AS `c1n`,`c2`.`category_name` AS `c2n`,sum(`br`.`rent_count`) AS `rent_count` from ((`book_category` `c1` join `book_category` `c2` on(`c1`.`ISBN` = `c2`.`ISBN` and `c1`.`category_name` < `c2`.`category_name`)) join `book_rent_count` `br`) where `br`.`ISBN` = `c1`.`ISBN` group by `c1`.`category_name`,`c2`.`category_name` order by sum(`br`.`rent_count`) desc limit 3 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `not_top_writers`
--

/*!50001 DROP VIEW IF EXISTS `not_top_writers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `not_top_writers` AS select `writer_book_count`.`writer_id` AS `writer_id`,`writer_book_count`.`first_name` AS `first_name`,`writer_book_count`.`last_name` AS `last_name`,`writer_book_count`.`book_count` AS `book_count` from `writer_book_count` where `writer_book_count`.`book_count` < (select max(`writer_book_count`.`book_count`) from `writer_book_count`) - 5 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `past_rent_full_data`
--

/*!50001 DROP VIEW IF EXISTS `past_rent_full_data`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `past_rent_full_data` AS select `r`.`rent_ID` AS `rent_id`,`r`.`ISBN` AS `ISBN`,`b`.`title` AS `book_title`,`r`.`renting_user_id` AS `renting_user_id`,`u`.`username` AS `username`,`u`.`school_id` AS `school_id`,`r`.`start_date` AS `start_date`,`r`.`return_date` AS `return_date` from ((`past_rent` `r` join `book` `b` on(`r`.`ISBN` = `b`.`ISBN`)) join `lib_user` `u` on(`r`.`renting_user_id` = `u`.`user_id`)) order by `r`.`start_date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pending_review_full_data`
--

/*!50001 DROP VIEW IF EXISTS `pending_review_full_data`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pending_review_full_data` AS select `r`.`ISBN` AS `ISBN`,`b`.`title` AS `book_title`,`r`.`likert_scale` AS `likert_scale`,`r`.`text` AS `text`,`r`.`reviewer_id` AS `reviewer_id`,`u`.`username` AS `username`,`u`.`school_id` AS `school_id`,`r`.`review_id` AS `review_id` from ((`pending_review` `r` join `book` `b` on(`r`.`ISBN` = `b`.`ISBN`)) join `lib_user` `u` on(`r`.`reviewer_id` = `u`.`user_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `principal_full_data`
--

/*!50001 DROP VIEW IF EXISTS `principal_full_data`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `principal_full_data` AS select `p`.`user_id` AS `user_id`,`p`.`school_id` AS `school_id`,`u`.`first_name` AS `first_name`,`u`.`last_name` AS `last_name`,`u`.`username` AS `username` from (`principal` `p` join `lib_user` `u` on(`p`.`user_id` = `u`.`user_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `rent_full_data`
--

/*!50001 DROP VIEW IF EXISTS `rent_full_data`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `rent_full_data` AS select `r`.`rent_ID` AS `rent_id`,`r`.`ISBN` AS `ISBN`,`b`.`title` AS `book_title`,`r`.`renting_user_id` AS `renting_user_id`,`u`.`username` AS `username`,`u`.`first_name` AS `first_name`,`u`.`last_name` AS `last_name`,`u`.`school_id` AS `school_id`,`r`.`start_date` AS `start_date`,if(to_days(curdate()) - to_days(`r`.`start_date` + interval 1 week) > 0,to_days(curdate()) - to_days(`r`.`start_date` + interval 1 week),0) AS `late_by` from ((`active_rent` `r` join `book` `b` on(`r`.`ISBN` = `b`.`ISBN`)) join `lib_user` `u` on(`r`.`renting_user_id` = `u`.`user_id`)) order by `r`.`start_date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `reservation_full_data`
--

/*!50001 DROP VIEW IF EXISTS `reservation_full_data`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `reservation_full_data` AS select `r`.`reservation_ID` AS `reservation_id`,`r`.`ISBN` AS `ISBN`,`b`.`title` AS `book_title`,`r`.`user_id` AS `user_id`,`u`.`username` AS `username`,`u`.`school_id` AS `school_id`,`u`.`reserving` AS `reserving`,`u`.`renting` AS `renting`,`ur`.`role` AS `role`,`r`.`submission_date` AS `submission_date`,`sb`.`available_copies` AS `available_copies`,row_number() over ( partition by `u`.`school_id`,`r`.`ISBN` order by `r`.`submission_date`) AS `reserv_order`,`r`.`user_id` in (select `late_rent`.`rent_user_id` from `late_rent`) AS `late` from ((((`reservation` `r` join `book` `b` on(`r`.`ISBN` = `b`.`ISBN`)) join `lib_user` `u` on(`r`.`user_id` = `u`.`user_id`)) join `school_book` `sb` on(`sb`.`school_id` = `u`.`school_id` and `sb`.`ISBN` = `r`.`ISBN`)) join `user_role` `ur` on(`ur`.`user_id` = `u`.`user_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `review_full_data`
--

/*!50001 DROP VIEW IF EXISTS `review_full_data`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `review_full_data` AS select `r`.`ISBN` AS `ISBN`,`b`.`title` AS `book_title`,`r`.`likert_scale` AS `likert_scale`,`r`.`text` AS `text`,`r`.`reviewer_id` AS `reviewer_id`,`u`.`username` AS `username`,`u`.`school_id` AS `school_id`,`r`.`review_id` AS `review_id`,`r`.`admin_user_id` AS `admin_user_id` from ((`review` `r` join `book` `b` on(`r`.`ISBN` = `b`.`ISBN`)) join `lib_user` `u` on(`r`.`reviewer_id` = `u`.`user_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `school_rents`
--

/*!50001 DROP VIEW IF EXISTS `school_rents`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `school_rents` AS select `s`.`school_id` AS `school_id`,`s`.`school_name` AS `school_name`,`r`.`rent_id` AS `rent_id`,`u`.`user_id` AS `username`,`r`.`start_date` AS `start_date` from ((`school_unit` `s` left join `lib_user` `u` on(`s`.`school_id` = `u`.`school_id`)) left join `all_rent` `r` on(`u`.`user_id` = `r`.`renting_user_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `school_teachers`
--

/*!50001 DROP VIEW IF EXISTS `school_teachers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `school_teachers` AS select `t`.`user_id` AS `user_id`,`u`.`first_name` AS `first_name`,`u`.`last_name` AS `last_name`,`u`.`school_id` AS `school_id` from (`teacher` `t` join `lib_user` `u` on(`t`.`user_id` = `u`.`user_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_page_info`
--

/*!50001 DROP VIEW IF EXISTS `user_page_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_page_info` AS select `u`.`user_id` AS `user_id`,`u`.`username` AS `username`,`u`.`first_name` AS `first_name`,`u`.`last_name` AS `last_name`,`u`.`renting` AS `renting`,`u`.`reserving` AS `reserving`,`ur`.`role` AS `role`,`t`.`birth_date` AS `birth_date` from ((`lib_user` `u` join `user_role` `ur` on(`u`.`user_id` = `ur`.`user_id`)) left join `teacher` `t` on(`u`.`user_id` = `t`.`user_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_renting_info`
--

/*!50001 DROP VIEW IF EXISTS `user_renting_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_renting_info` AS (select `lib_user`.`user_id` AS `user_id`,`lib_user`.`username` AS `username`,`lib_user`.`school_id` AS `school_id`,`lib_user`.`renting` AS `renting`,`lib_user`.`reserving` AS `reserving`,convert('TEACHER' using utf8) AS `role` from (`lib_user` join `teacher` on(`lib_user`.`user_id` = `teacher`.`user_id`))) union (select `lib_user`.`user_id` AS `user_id`,`lib_user`.`username` AS `username`,`lib_user`.`school_id` AS `school_id`,`lib_user`.`renting` AS `renting`,`lib_user`.`reserving` AS `reserving`,convert('STUDENT' using utf8) AS `STUDENT` from (`lib_user` join `student` on(`lib_user`.`user_id` = `student`.`user_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_review_avg`
--

/*!50001 DROP VIEW IF EXISTS `user_review_avg`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_review_avg` AS select `u`.`user_id` AS `user_id`,`u`.`username` AS `username`,`u`.`first_name` AS `first_name`,`u`.`last_name` AS `last_name`,avg(`r`.`likert_scale`) AS `AVG(likert_scale)` from (`review` `r` join `lib_user` `u` on(`u`.`user_id` = `r`.`reviewer_id`)) group by `u`.`user_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_review_category_avg`
--

/*!50001 DROP VIEW IF EXISTS `user_review_category_avg`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_review_category_avg` AS select `u`.`user_id` AS `user_id`,`u`.`username` AS `username`,`u`.`first_name` AS `first_name`,`u`.`last_name` AS `last_name`,`c`.`category_name` AS `category_name`,avg(`r`.`likert_scale`) AS `avg` from (((`category` `c` left join `book_category` `bc` on(`c`.`category_name` = `bc`.`category_name`)) left join `review` `r` on(`r`.`ISBN` = `bc`.`ISBN`)) join `lib_user` `u` on(`u`.`user_id` = `r`.`reviewer_id`)) group by `u`.`user_id`,`c`.`category_name` order by `u`.`user_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_role`
--

/*!50001 DROP VIEW IF EXISTS `user_role`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_role` AS select `lib_admin`.`user_id` AS `user_id`,`lib_admin`.`school_id` AS `school_id`,convert('LIB_ADMIN' using utf8) AS `role` from `lib_admin` union select `teacher`.`user_id` AS `user_id`,`lib_user`.`school_id` AS `school_id`,convert('TEACHER' using utf8) AS `CONVERT('TEACHER' USING utf8)` from (`teacher` join `lib_user` on(`teacher`.`user_id` = `lib_user`.`user_id`)) where !(`teacher`.`user_id` in (select `lib_admin`.`user_id` from `lib_admin`)) union select `student`.`user_id` AS `user_id`,`lib_user`.`school_id` AS `school_id`,convert('STUDENT' using utf8) AS `CONVERT('STUDENT' USING utf8)` from (`student` join `lib_user` on(`student`.`user_id` = `lib_user`.`user_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `writer_book_count`
--

/*!50001 DROP VIEW IF EXISTS `writer_book_count`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `writer_book_count` AS select `w`.`writer_id` AS `writer_id`,`w`.`first_name` AS `first_name`,`w`.`last_name` AS `last_name`,count(`wb`.`ISBN`) AS `book_count` from (`writer` `w` left join `writer_book` `wb` on(`w`.`writer_id` = `wb`.`writer_id`)) group by `w`.`writer_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `writers_with_no_rented_books`
--

/*!50001 DROP VIEW IF EXISTS `writers_with_no_rented_books`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `writers_with_no_rented_books` AS select `wb`.`writer_id` AS `writer_id`,`writer`.`first_name` AS `first_name`,`writer`.`last_name` AS `last_name` from ((`writer` left join `writer_book` `wb` on(`wb`.`writer_id` = `writer`.`writer_id`)) left join `all_rent` on(`wb`.`ISBN` = `all_rent`.`ISBN`)) group by `wb`.`writer_id` having count(`all_rent`.`rent_id`) = 0 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `young_teachers`
--

/*!50001 DROP VIEW IF EXISTS `young_teachers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `young_teachers` AS select `t`.`user_id` AS `user_id`,`u`.`first_name` AS `first_name`,`u`.`last_name` AS `last_name`,count(`ar`.`ISBN`) AS `count(ar.ISBN)`,timestampdiff(YEAR,`t`.`birth_date`,curdate()) AS `age` from ((`teacher` `t` join `all_rents_from_teachers` `ar` on(`t`.`user_id` = `ar`.`user_id`)) join `lib_user` `u` on(`t`.`user_id` = `u`.`user_id`)) group by `t`.`user_id` having `age` < 40 order by count(`ar`.`ISBN`) desc */;
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

-- Dump completed on 2023-06-04 18:21:31
