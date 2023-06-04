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

/*
 *	Ta περισσότερα σχόλια προέκυψαν από το mysqldump, και επειδή δεν γνωρίζω ποια είναι η αναγκαιότητα τους για
 *  για τη λειτουργία του αρχείου τα αφήνω. Γενικά αν ξεκινάνε με θαυμαστικό και αριθμό είναι δουλειά του mysqldump
 *	Όλοι οι ακέραιοι int(11) προέκυψαν αυτόματα σε αυτό το μήκος, έθεσα int σκέτο
 *	Τα views ορίζονται στο τέλος, οι ενδιάμεσες δηλώσεις τους θα αγνοηθούν
 */

DROP TABLE IF EXISTS `active_rent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_rent` (
	/*Ακέραιος που παράγεται από τη βάση, AUTO_INCREMENT και χρησιμοποιείται ως primary key*/
  `rent_ID` int(11) NOT NULL AUTO_INCREMENT,
	/*Ακέραιος, foreign key προς τον χρήστη που δανείζεται, αναγκαία σχέση*/
  `renting_user_id` int(11) NOT NULL,
  	/*Ακέραιος, foreign key προς τον χειριστή που καταχωρεί το δανεισμό, αναγκαία σχέση*/
  `admin_user_id` int(11) NOT NULL,
	/*Ακέραιος, foreign key προς το δανειζόμενο βιβλίο, αναγκαία σχέση, ο περιορισμός του μεγέθους σε 13 ψηφία
	 πραγματοποιείται στο table school_book */
  `ISBN` bigint(13) unsigned zerofill NOT NULL,
	/*Ημερομηνία έναρξης του δανεισμού, δε χρειάζεται γενικά να συμπληρωθεί καθώς αποκτά αυτόματα την τρέχουσα ημερομηνία */
  `start_date` date NOT NULL DEFAULT curdate(),
  PRIMARY KEY (`rent_ID`),
	/* Δεν επιτρέπεται ένας χρήστης να δανειστεί δύο φορές το ίδιο βιβλίο & επιτάχυνση ορισμένων queries */
  UNIQUE KEY `uk_active_rent_user_id_isbn` (`renting_user_id`,`ISBN`),
  KEY `fk_active_rent_lib_admin` (`admin_user_id`),
  KEY `fk_active_rent_book` (`ISBN`),
  CONSTRAINT `fk_active_rent_book` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON UPDATE CASCADE,
	/*Αν εκκρεμεί τρέχον δανεισμός δεν μπορεί να επιτυχθεί διαγραφή του χειριστή αφού το DELETE είναι default, δηλαδή restric*/
  CONSTRAINT `fk_active_rent_lib_admin` FOREIGN KEY (`admin_user_id`) REFERENCES `lib_admin` (`user_id`) ON UPDATE CASCADE,
	/*Αν εκκρεμεί τρέχον δανεισμός δεν μπορεί να επιτυχθεί διαγραφή του χρήστη αφού το DELETE είναι default, δηλαδή restric*/
  CONSTRAINT `fk_active_rent_lib_user` FOREIGN KEY (`renting_user_id`) REFERENCES `lib_user` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=548 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
	/*Ακέραιος, primary key του βιβλίου, 13 ψηφία άρα περιορίζουμε τις τιμές του σε μέχρι 13ψηφιο αριθμό
	και ορίζουμε zerofill ώστε να απεικονίζονται 13 ψηφία ακόμα και με μηδενικά στην αρχή */
  `ISBN` bigint(13) unsigned zerofill NOT NULL CHECK (`ISBN` < 10000000000000),
	/*Αναγκαία η ύπαρξη τίτλου */
  `title` varchar(50) NOT NULL,
	/* Μη αναγκαίος ο ορισμός εκδότη */
  `publisher` varchar(30) DEFAULT NULL,
	/* Μη αναγκαία η περίληψη */
  `summary` text DEFAULT NULL,
	/*δείκτης της ύπαρξης εξωφύλλου, αναγκαίος, χρησιμοποιείται σα bool αν δεν οριστεί 
	θεωρούμε πώς δεν έχουμε εξώφυλλο */
  `has_picture` tinyint(1) NOT NULL DEFAULT 0,
	/* Μη αναγκαία η ύπαρξη αριθμό σελίδων */
  `page_num` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `book_category`
--

DROP TABLE IF EXISTS `book_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_category` (
	/*Ακέραιος, foreign key προς το book, αναγκαία σχέση, ο περιορισμός του μεγέθους σε 13 ψηφία
	 πραγματοποιείται στο table σχέση book */
  `ISBN` bigint(13) unsigned NOT NULL,
	/* Όνομα της κατηγορίας, αναγκαίο */
  `category_name` varchar(20) NOT NULL,
	/* το ζεύγος των παραπάνω αποτελεί primary key */
  PRIMARY KEY (`ISBN`,`category_name`),
  KEY `fk_book_category_category` (`category_name`),
	/* Ορισμός index στο ISBN για επιτάχυνση αναζητήσεων κατά σκέτο ISBN, δεν φτιάχνεται σίγουρα αυτόματα,
	δε γνωρίζω γιατί */
  KEY `idx_book_category_isbn` (`ISBN`),
	/* Αν σβηστεί ένα βιβλίο δεν υπάρχει λόγος να παραμείνει το δεδομένο των κατηγοριών του, delete cascade */
  CONSTRAINT `fk_book_category_book` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE,
  	/* Παρεμπόδιση σβησίματος κατηγορίας αν ανείκει βιβλίο σε αυτή */
  CONSTRAINT `fk_book_category_category` FOREIGN KEY (`category_name`) REFERENCES `category` (`category_name`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
	/*Ακέραιος, foreign key προς το book, αναγκαία σχέση, ο περιορισμός του μεγέθους σε 13 ψηφία
	 πραγματοποιείται στο table σχέση book */
  `ISBN` bigint(13) unsigned NOT NULL,
	/* Λέξη κλειδί, αναγκαία για την σχέση*/
  `keyword` varchar(20) NOT NULL,
  	/* το ζεύγος των παραπάνω αποτελεί primary key */
  PRIMARY KEY (`ISBN`,`keyword`),
  KEY `fk_book_keyword_keyword` (`keyword`),
	/* Ορισμός index στο ISBN για επιτάχυνση αναζητήσεων κατά σκέτο ISBN, δεν φτιάχνεται σίγουρα αυτόματα,
	δε γνωρίζω γιατί */
  KEY `idx_book_keyword_isbn` (`ISBN`),
  	/* Αν σβηστεί ένα βιβλίο δεν υπάρχει λόγος να παραμείνει το δεδομένο των λέξεων κλειδιών του, delete cascade */
  CONSTRAINT `fk_book_keyword_book` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE,
  	/* Παρεμπόδιση σβησίματος λέξης κλειδιού αν ανείκει βιβλίο σε αυτή */
  CONSTRAINT `fk_book_keyword_keyword` FOREIGN KEY (`keyword`) REFERENCES `keyword` (`keyword`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `book_language`
--

DROP TABLE IF EXISTS `book_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_language` (
	/*Ακέραιος, foreign key προς το book, αναγκαία σχέση, ο περιορισμός του μεγέθους σε 13 ψηφία
	 πραγματοποιείται στο table σχέση book */
  `ISBN` bigint(13) unsigned zerofill NOT NULL,
  	/* Γλώσσα, αναγκαία για το βιβλίο*/
  `language_name` varchar(20) NOT NULL,
   	/* το ζεύγος των παραπάνω αποτελεί primary key */
  PRIMARY KEY (`ISBN`,`language_name`),
	/* Εφόσον κάθε βιβλίο έχει μόνο μία γλώσσα το ISBN πρέπει να είναι μοναδικό στον πίνακα
	& επιταχύνονται κάποια queris */
  UNIQUE KEY `ISBN` (`ISBN`),
  KEY `fk_book_language_category` (`language_name`),
    /* Αν σβηστεί ένα βιβλίο δεν υπάρχει λόγος να παραμείνει το δεδομένο της γλώσσας του, delete cascade */
  CONSTRAINT `fk_book_language_book` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE,
  	/* Παρεμπόδιση σβησίματος γλώσσας αν ανείκει βιβλίο σε αυτή */
  CONSTRAINT `fk_book_language_category` FOREIGN KEY (`language_name`) REFERENCES `language` (`language_name`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
	/*Κατηγορία, primary key, αναγκαίο για τη σχέση */
  `category_name` varchar(40) NOT NULL,
  PRIMARY KEY (`category_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
	/* Ακέραιος, primary key άρα αναγκαίος για τη σχέση, αυτόματα αυξανόμενος
	στην απλή λειτουργία δεν ορίζεται από το χρήστη */
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
	/* Username χρήστη, αναγκαίο για τη σχέση */
  `username` varchar(30) NOT NULL,
	/* Κωδικός χρήστη, αναγκαίο για τη σχέση */
  `password` varchar(30) NOT NULL,
	/* Μικρό όνομα χρήστη, αναγκαίο για τη σχέση */
  `first_name` varchar(30) NOT NULL,
	/* Επώνυμο χρήστη, αναγκαίο για τη σχέση */
  `last_name` varchar(30) NOT NULL,
  PRIMARY KEY (`user_id`),
	/*θέλουμε το username να είναι ξεχωριστό για κάθε χειριστή αν υπάρξουν πολλοί
	οπότε unique key, το οποίο επιταχύνει και κάποια queries */  
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keyword`
--

DROP TABLE IF EXISTS `keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keyword` (
	/*Λέξι κλειδί, primary key, αναγκαίο για τη σχέση */
  `keyword` varchar(20) NOT NULL,
  PRIMARY KEY (`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language` (
  	/*Γλώσσα, primary key, αναγκαίο για τη σχέση */
  `language_name` varchar(20) NOT NULL,
  PRIMARY KEY (`language_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
	/* Ακέραιος, primary key άρα αναγκαίος για τη σχέση,και foreign key
	ως προς το teacher */  
  `user_id` int(11) NOT NULL,
	/* Ακέραιος, foreign key προς το σχολείο στο οποία είναι χειριστής */
  `school_id` int(7) unsigned zerofill NOT NULL,
  PRIMARY KEY (`user_id`),
	/* Ορίζω έναν χειριστή ανά σχολείο, άρα το school_id πρέπει να είναι unique */
  UNIQUE KEY `school_id` (`school_id`),
	/* Ο lib_admin συμμετέχει ολικά σε σχολείο, άρα παρεμπόδιση σβησίματος σχολείου με υπαρκτό lib_admin */
  CONSTRAINT `fk_lib_admin_school_unit` FOREIGN KEY (`school_id`) REFERENCES `school_unit` (`school_id`) ON UPDATE CASCADE,
	/* Ο lib_admin συμμετέχει ολικά σε θέση εκπαιδευτικού, άρα παρεμπόδιση σβησίματος εκπαιδευτικού ο οποιός είναι και lib_admin */
  CONSTRAINT `fk_lib_admin_teacher` FOREIGN KEY (`user_id`) REFERENCES `teacher` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

/*
 * Για την εξασφάληση ότι το school_id του lib_admin θα είναι ίδιο με το 
 * school_id του αντίστοιχου user_id στο πίνακα lib_user χρησιμοποιείται το 
 * Trigger admin_correct_school_id το οποίο βρίσκεται στο DML
 */


--
-- Table structure for table `lib_user`
--

DROP TABLE IF EXISTS `lib_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lib_user` (
	/* Ακέραιος, primary key άρα αναγκαίος για τη σχέση, αυτόματα αυξανόμενος
	στην απλή λειτουργία δεν ορίζεται από το χρήστη */
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
	/* Username χρήστη, αναγκαίο για τη σχέση */
  `username` varchar(30) NOT NULL,
	/* Password χρήστη, αναγκαίο για τη σχέση */
  `password` varchar(30) NOT NULL,
	/* Μικρό όνομα χρήστη, αναγκαίο για τη σχέση */
  `first_name` varchar(30) NOT NULL,
	/* Επώνυμο΄ χρήστη, αναγκαίο για τη σχέση */
  `last_name` varchar(30) NOT NULL,	
	/* Foreign key προς το school_unit, αναγκαίο για τη σχέση,
	κάθε χρήστης είναι μέλος ενός σχολείου */
  `school_id` int(7) unsigned zerofill NOT NULL,
	/* Μετρητής των τρεχόντων δανεισμών του χρήστη,
	αναγκαίο για τη σχέση, αρχικοποιείται σε 0 αν δεν οριστεί */
  `renting` tinyint(1) unsigned DEFAULT 0,
	/* Μετρητής των τρέχουσων κρατήσεων του χρήστη,
	αναγκαίο για τη σχέση, αρχικοποιείται σε 0 αν δεν οριστεί */
  `reserving` tinyint(1) unsigned DEFAULT 0,
	/* Σημαία για το αν ο λογαρισασμός είναι απενεργοποιημένος,
	αναγκαίο για τη σχέση, αρχικοποιείται σε 0 αν δεν οριστεί */
  `banned` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`),
	/*θέλουμε το username να είναι ξεχωριστό για κάθε χρήστη
	οπότε unique key, το οποίο επιταχύνει και κάποια queries */  
  UNIQUE KEY `username` (`username`),
  KEY `fk_lib_user_school_unit` (`school_id`),
	/* κάθε χρήστης είναι μέλος ενός σχολείου, οπότε εμποδίζεται η διαγραφή σχολείου αν υπάρχουν χρήστες μέλη αυτού */
  CONSTRAINT `fk_lib_user_school_unit` FOREIGN KEY (`school_id`) REFERENCES `school_unit` (`school_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
	/*Ακέραιος που παράγεται από τη βάση, και κληρονομείται από την active_rent 
	εφόσον κάθε παλαιός δανεισμός έχει υπάρξει ενεργός, άρα είναι υποψήφιο κλειδί
	και χρησιμοποιείται ως primary key*/
  `rent_ID` int(11) NOT NULL,
  	/*Ακέραιος, foreign key προς τον χρήστη που δανείζεται, μη αναγκαία σχέση
	εφόσον είναι δυνατή η διαγραφή χρήστη. Για να παραμείνουν ακριβή τα στατιστικά
	θέλουμε να παραμείνει ο δανεισμός, οπότε θέτουμε NULLable τον όρο */
  `renting_user_id` int(11) DEFAULT NULL,
    /*Ακέραιος, foreign key προς τον χειριστή που καταχωρεί το δανεισμό, αναγκαία σχέση*/
  `admin_user_id` int(11) NOT NULL,
	/*Ακέραιος, foreign key προς το δανειζόμενο βιβλίο, αναγκαία σχέση, ο περιορισμός του μεγέθους σε 13 ψηφία
	 πραγματοποιείται στο table school_book */
  `ISBN` bigint(13) unsigned NOT NULL,
	/*Ημερομηνία έναρξης του δανεισμού, δε χρειάζεται γενικά να συμπληρωθεί καθώς αποκτά 
	την ημερομηνία έναρξης του πρώην ενεργού δανεισμού*/
  `start_date` date NOT NULL,
	/*Ημερομηνία λήξης του δανεισμού, δε χρειάζεται γενικά να συμπληρωθεί καθώς αποκτά 
	αυτόματα την τρέχουσα ημερομηνία*/
  `return_date` date NOT NULL DEFAULT curdate(),
  PRIMARY KEY (`rent_ID`),
  KEY `fk_past_rent_lib_user` (`renting_user_id`),
  KEY `fk_past_rent_lib_admin` (`admin_user_id`),
  KEY `fk_past_rent_book` (`ISBN`),
	/* Ο δανεισμός συμμετέχει πλήρως στη σχέση με το βιβλίο, οπότε εμπόδιση διαγραφής βιβλίου
	αν υπάρχει πρώην δανεισμός σε αυτό */
  CONSTRAINT `fk_past_rent_book` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON UPDATE CASCADE,
	/* Ο δανεισμός συμμετέχει πλήρως στη σχέση με τον χειριστή, δεν υφίσταται δανεισμός χωρίς καταχώρηση
	, οπότε εμπόδιση διαγραφής χειριστή αν υπάρχει πρώην δανεισμός καταχωρημένος από αυτόν */
  CONSTRAINT `fk_past_rent_lib_admin` FOREIGN KEY (`admin_user_id`) REFERENCES `lib_admin` (`user_id`) ON UPDATE CASCADE,
	/* Σε περίπτωση διαγραφής του δανειζόμενου χρήστη, θέσε NULL το foreign key προς τον χρήστη αυτόν */
  CONSTRAINT `fk_past_rent_lib_user` FOREIGN KEY (`renting_user_id`) REFERENCES `lib_user` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
	/* έλεγχος ακεραιότητας, η Ημερομηνία επιστροφής είναι τουλάχιστον ίδια ή μεταγενέστερη από την ημερομηνία έναρξης */
  CONSTRAINT `past_rent_return_after_start` CHECK (`return_date` >= `start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `/* Ακέραιος, primary key άρα αναγκαίος για τη σχέση, αυτόματα αυξανόμενος
	στην απλή λειτουργία δεν ορίζεται από το χρήστη */
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
	/* Username χρήστη, αναγκαίο για τη σχέση */
  `username` varchar(30) NOT NULL,
	/* Password χρήστη, αναγκαίο για τη σχέση */
  `password` varchar(30) NOT NULL,
	/* Μικρό όνομα χρήστη, αναγκαίο για τη σχέση */
  `first_name` varchar(30) NOT NULL,
	/* Επώνυμο χρήστη, αναγκαίο για τη σχέση */
  `last_name` varchar(30) NOT NULL,	
	/* Ημερομηνία γέννησης σε περίπτωση που η χρήστης είναι εκπαιδευτικός
	το θεωρώ αναγκαίο και αν τελικά δε χρειαστεί το χειρίζεται το backend */
  `birth_date` date NOT NULL,
	/*Επιθυμητός ρόλος, αναγκαίο για τη σχέση, συγκεκριμένες αποδεκτές τιμές */
  `role` set('TEACHER','STUDENT','LIBRARY ADMIN') NOT NULL,
	/* Foreign key προς το school_unit, αναγκαίο για τη σχέση,
	κάθε χρήστης δηλώνει να είναι μέλος ενός σχολείου */
  `school_id` int(7) unsigned zerofill NOT NULL,
  PRIMARY KEY (`user_id`),
	/*θέλουμε το username να είναι ξεχωριστό για κάθε χρήστη
	οπότε unique key, το οποίο επιταχύνει και κάποια queries
	η σύγκριση με τα usernames εγγεγραμένων χρηστών γίνεται από το backend */  
  UNIQUE KEY `username` (`username`),
  KEY `fk_pending_lib_user_school_unit` (`school_id`),
  	/* κάθε χρήστης δηλώνει να είναι μέλος ενός σχολείου, οπότε εμποδίζεται η διαγραφή σχολείου αν υπάρχουν χρήστες μέλη αυτού */
  CONSTRAINT `fk_pending_lib_user_school_unit` FOREIGN KEY (`school_id`) REFERENCES `school_unit` (`school_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pending_review`
--

DROP TABLE IF EXISTS `pending_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pending_review` (
  `/* Ακέραιος, primary key άρα αναγκαίος για τη σχέση, αυτόματα αυξανόμενος
	στην απλή λειτουργία δεν ορίζεται από το χρήστη */
  `review_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  	/*Ακέραιος, foreign key προς τον χρήστη που δανείζεται, αναγκαία σχέση
	εφόσον θεωρώ ότι δεν υφίσταται ανώνυμη αξιολόγηση. */
  `reviewer_id` int(11) NOT NULL,
	/*Ακέραιος, foreign key προς το δανειζόμενο βιβλίο, αναγκαία σχέση, ο περιορισμός του μεγέθους σε 13 ψηφία
	 πραγματοποιείται στο table school_book */
  `ISBN` bigint(13) unsigned zerofill NOT NULL,
	/* Κείμενο αξιολόγησης δεν είνααι αναγκαίο */
  `text` text DEFAULT NULL,
	/* Rating αξιολόγησης, αναγκαίο για τη σχέση, τιμές από 1 έως 5, άρα αρκεί int(1) για απεικόνιση */
  `likert_scale` int(1) NOT NULL CHECK (`likert_scale` between 1 and 5),
	/*Ημερομηνία υποβολής της αξιολόγησης, δε χρειάζεται γενικά να συμπληρωθεί καθώς αποκτά 
	αυτόματα την τρέχουσα ημερομηνία, αναγκαία για την σχέση*/
  `review_date` date NOT NULL DEFAULT curdate(),
  PRIMARY KEY (`review_id`),
	/*κάθε χρήστης επιτρέπεται να έχει μόνο μία εκκρεμής αξιολόγηση ανά βιβλίο, άρα
	unique το ζεύγος αξιολογητή και βιλίου, & επιταχύνονται κάποια queries */
  UNIQUE KEY `uk_pending_review_user_id_isbn` (`reviewer_id`,`ISBN`),
  KEY `fk_pending_review_book` (`ISBN`),
	/* Η αξιολόγηση συμμετέχει πλήρως στη συσχέτιση με το βιβλίο, άρα εμπόδιση διαγραφής βιβλίων με εκκρεμής αξιολογήσεις */
  CONSTRAINT `fk_pending_review_book` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON UPDATE CASCADE,
	/* Θέλω δυνατότητα διαγραφής χρήστη και η αξιολόγηση συμμετέχει πλήρως στη συσχέτιση με το χρήστη, άρα διαγραφή*/
  CONSTRAINT `fk_pending_review_lib_user` FOREIGN KEY (`reviewer_id`) REFERENCES `lib_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `principal` (
	/* Ακέραιος, primary key άρα αναγκαίος για τη σχέση,και foreign key
	ως προς το teacher */  
  `user_id` int(11) NOT NULL,
	/* Ακέραιος, foreign key προς το σχολείο στο οποία είναι χειριστής */
  `school_id` int(7) unsigned zerofill NOT NULL,
  PRIMARY KEY (`user_id`),
	/* Ορίζω έναν διευθυντή ανά σχολείο, άρα το school_id πρέπει να είναι unique */
  UNIQUE KEY `school_id` (`school_id`),
  	/* Ο διευθυντής συμμετέχει ολικά σε σχολείο, άρα παρεμπόδιση σβησίματος σχολείου με υπαρκτό lib_admin */
  CONSTRAINT `fk_principal_school_unit` FOREIGN KEY (`school_id`) REFERENCES `school_unit` (`school_id`) ON UPDATE CASCADE,
	/* Ο διευθυντής συμμετέχει ολικά σε θέση εκπαιδευτικού, άρα παρεμπόδιση σβησίματος εκπαιδευτικού ο οποιός είναι και lib_admin */
  CONSTRAINT `fk_principal_teacher` FOREIGN KEY (`user_id`) REFERENCES `teacher` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


/*
 * Για την εξασφάληση ότι το school_id του principal θα είναι ίδιο με το 
 * school_id του αντίστοιχου user_id στο πίνακα lib_user χρησιμοποιείται το 
 * Trigger principal_correct_school_id το οποίο βρίσκεται στο DML
 */

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
  `/* Ακέραιος, primary key άρα αναγκαίος για τη σχέση, αυτόματα αυξανόμενος
	στην απλή λειτουργία δεν ορίζεται από το χρήστη */
  `reservation_ID` int(11) NOT NULL AUTO_INCREMENT,
  	/*Ακέραιος, foreign key προς τον χρήστη που δανείζεται, αναγκαία σχέση
	εφόσον θεωρώ ότι δεν υφίσταται ανώνυμη κράτηση. */
  `user_id` int(11) NOT NULL,
	/*Ακέραιος, foreign key προς το δανειζόμενο βιβλίο, αναγκαία σχέση, ο περιορισμός του μεγέθους σε 13 ψηφία
	 πραγματοποιείται στο table school_book */
  `ISBN` bigint(13) unsigned zerofill NOT NULL,
	/*Ημερομηνία υποβολής της κράτησης, δε χρειάζεται γενικά να συμπληρωθεί καθώς αποκτά 
	αυτόματα την τρέχουσα ημερομηνία, αναγκαία για την σχέση*/
  `submission_date` date NOT NULL DEFAULT curdate(),
  PRIMARY KEY (`reservation_ID`),
	/*κάθε χρήστης επιτρέπεται να έχει μόνο μία κράτηση ανά βιβλίο, άρα
	unique το ζεύγος αξιολογητή και βιλίου, & επιταχύνονται κάποια queries */
  UNIQUE KEY `uk_reservation_user_id_ISBN` (`user_id`,`ISBN`),
  KEY `fk_reserves_book` (`ISBN`),
	/* Θέλω δυνατότητα διαγραφής χρήστη και η κράτηση συμμετέχει πλήρως στη συσχέτιση με το χρήστη, άρα διαγραφή*/
  CONSTRAINT `fk_reservation_lib_user` FOREIGN KEY (`user_id`) REFERENCES `lib_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
	/* Η κράτηση συμμετέχει πλήρως στη συσχέτιση με το βιβλίο, άρα εμπόδιση διαγραφής βιβλίων με ενεργές κρατήσεις */
  CONSTRAINT `fk_reserves_book` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
	/*Ακέραιος που παράγεται από τη βάση, και κληρονομείται από την pending_rent 
	εφόσον κάθε αξιολόγηση έχει υπάρξει εκκρεμής, άρα είναι υποψήφιο κλειδί
	και χρησιμοποιείται ως primary key*/
  `review_id` int(10) unsigned NOT NULL,
  	/*Ακέραιος, foreign key προς τον χρήστη που δανείζεται, αναγκαία σχέση
	εφόσον θεωρώ ότι δεν υφίσταται ανώνυμη αξιολόγηση. */
  `reviewer_id` int(11) NOT NULL,
  	/*Ακέραιος, foreign key προς τον χειριστή που εγκρίνει την αξιολόγηση, αναγκαία σχέση*/
  `admin_user_id` int(11) NOT NULL,
	/*Ακέραιος, foreign key προς το δανειζόμενο βιβλίο, αναγκαία σχέση, ο περιορισμός του μεγέθους σε 13 ψηφία
	 πραγματοποιείται στο table school_book */
  `ISBN` bigint(13) unsigned zerofill NOT NULL,
	/* Κείμενο αξιολόγησης δεν είνααι αναγκαίο */
  `text` text DEFAULT NULL,
	/* Rating αξιολόγησης, αναγκαίο για τη σχέση, τιμές από 1 έως 5, άρα αρκεί int(1) για απεικόνιση */
  `likert_scale` int(1) NOT NULL CHECK (`likert_scale` between 1 and 5),
	/*Ημερομηνία υποβολής της αξιολόγησης, δε χρειάζεται γενικά να συμπληρωθεί καθώς 
	κληρωνομεί την ημερομηνία την πρώην εκκρεμής αξιολόγησης , αναγκαία για την σχέση*/
  `review_date` date NOT NULL,
  PRIMARY KEY (`review_id`),
	/*κάθε χρήστης επιτρέπεται να έχει μόνο μία αξιολόγηση ανά βιβλίο, άρα
	unique το ζεύγος αξιολογητή και βιλίου, & επιταχύνονται κάποια queries */
  UNIQUE KEY `uk_review_user_id_isbn` (`reviewer_id`,`ISBN`),
  KEY `fk_review_lib_admin` (`admin_user_id`),
  KEY `fk_review_book` (`ISBN`),
	/* Η αξιολόγηση συμμετέχει πλήρως στη συσχέτιση με το βιβλίο, άρα εμπόδιση διαγραφής βιβλίων με αξιολογήσεις */
  CONSTRAINT `fk_review_book` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON UPDATE CASCADE,
  	/* Η αξιολόγηση συμμετέχει πλήρως στη συσχέτιση με το χειριστή, άρα εμπόδιση διαγραφής χειριστή που έχει εγκρίνει αξιολογήσεις */
  CONSTRAINT `fk_review_lib_admin` FOREIGN KEY (`admin_user_id`) REFERENCES `lib_admin` (`user_id`) ON UPDATE CASCADE,
	/* Θέλω δυνατότητα διαγραφής χρήστη και η αξιολόγηση συμμετέχει πλήρως στη συσχέτιση με το χρήστη, άρα διαγραφή*/
  CONSTRAINT `fk_review_lib_user` FOREIGN KEY (`reviewer_id`) REFERENCES `lib_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
	/* Ακέραιος, foreign key προς το σχολείο στο οποίο υπάρχει το βιβλίο */
  `school_id` int(7) unsigned NOT NULL,
	/*Ακέραιος, foreign key προς το δανειζόμενο βιβλίο, αναγκαία σχέση, ο περιορισμός του μεγέθους σε 13 ψηφία
	 πραγματοποιείται στο table school_book */
  `ISBN` bigint(13) unsigned zerofill NOT NULL,
	/*Διαθέσιμα αντίτυπα, αναγκαίο για τη σχέση */
  `available_copies` int(10) unsigned NOT NULL,
  PRIMARY KEY (`school_id`,`ISBN`),
  KEY `fk_school_book_book` (`ISBN`),
	/*Δεν έχει νόημα η καταγραφή διαθεσιμότητας βιβλίων για πλέον ανύπαρκτο βιβλίο σε σχολείο, άρα on delete cascade */
  CONSTRAINT `fk_school_book_book` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE,
	/*Δεν έχει νόημα η καταγραφή διαθεσιμότητας βιβλίων για πλέον ανύπαρκτο σχολείο, άρα on delete cascade */
  CONSTRAINT `fk_school_book_school_unit` FOREIGN KEY (`school_id`) REFERENCES `school_unit` (`school_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `school_email`
--

DROP TABLE IF EXISTS `school_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school_email` (
	/* Ακέραιος, foreign key προς το σχολείο στο οποίο κατέχει το mail */
  `school_id` int(7) unsigned NOT NULL,
	/* email, αναγκαίο για τη σχέση */
  `email` varchar(30) NOT NULL,
	/* το ζεύγος των ιδιοτήτων ορίζει το primary key */
  PRIMARY KEY (`school_id`,`email`),
  KEY `idx_school_email` (`school_id`),
	/* Με διαγραφή του σχολείου θέλω διαγραφή των email του */
  CONSTRAINT `fk_school_email_school_unit` FOREIGN KEY (`school_id`) REFERENCES `school_unit` (`school_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `school_phone`
--

DROP TABLE IF EXISTS `school_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school_phone` (
	/* Ακέραιος, foreign key προς το σχολείο στο οποίο κατέχει το mail */
  `school_id` int(7) unsigned zerofill NOT NULL,
	/* τηλέφωνο, αναγκαίο για τη σχέση
	10ψηφιο, άρα ελέγχο ότι έχω τιμή έως 10ψηφια και αν είναι λιγότερα κάνω zerofill */
  `phone_number` bigint(10) unsigned zerofill NOT NULL CHECK (`phone_number` < 10000000000),
	/* το ζεύγος των ιδιοτήτων ορίζει το primary key */
  PRIMARY KEY (`school_id`,`phone_number`),
  KEY `idx_school_phone` (`school_id`),
	/* Με διαγραφή του σχολείου θέλω διαγραφή των τηλεφώνων του */
  CONSTRAINT `fk_school_phone_school_unit` FOREIGN KEY (`school_id`) REFERENCES `school_unit` (`school_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
	/*Ακέραιος αριθμός ID, 7ψήφιος που ορίζει κάθε σχολείο, ποϋπάρχει της βάσης
	περιορίζω την τιμή μέχρι 7 ψηφία και αν είναι λιγότερα κάνω zerofill */
  `school_id` int(7) unsigned zerofill NOT NULL CHECK (`school_id` < 10000000),
	/*Όνομα σχολείου, αναγκαίο για τη σχέση */
  `school_name` varchar(50) NOT NULL,
	/*πόλη, αναγκαία για τη σχέση */
  `city` varchar(20) NOT NULL,
	/*Διεύθυνση, αναγκαία για τη σχέση */
  `address` varchar(30) NOT NULL,
	/*Ταχυδρομικός κώδικας, αναγκαίος για τη σχέση */
  `zip_code` int(5) unsigned zerofill NOT NULL,
  PRIMARY KEY (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
	/*Ακέραιος, foreign key προς τον χρήστη είναι student, αναγκαία σχέση
	ορίζεται ως primary key*/
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
	/* πλήρη συμμετοχή στη συσχέτιση με χρήστη ως γενίκευση, άρα ON DELETE CASCADE αφού θέλω δυνατότητα διαγραφής χρήστη */
  CONSTRAINT `fk_student_lib_user` FOREIGN KEY (`user_id`) REFERENCES `lib_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
	/*Ακέραιος, foreign key προς τον χρήστη είναι teacher, αναγκαία σχέση
	ορίζεται ως primary key*/
  `user_id` int(11) NOT NULL,
	/*Ημερομηνία γέννησης του εκπαιδευτικού, αναγκαία για τη σχέση */
  `birth_date` date NOT NULL,
  PRIMARY KEY (`user_id`),	
	/* πλήρη συμμετοχή στη συσχέτιση με χρήστη ως γενίκευση, άρα ON DELETE CASCADE αφού θέλω δυνατότητα διαγραφής χρήστη */
  CONSTRAINT `fk_teacher_lib_user` FOREIGN KEY (`user_id`) REFERENCES `lib_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
	/*Ακέραιος που παράγεται από τη βάση, AUTO_INCREMENT και χρησιμοποιείται ως primary key*/
  `writer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	/*Μικρό όνομα, αναγκαίο για τη σχέση */
  `first_name` varchar(30) NOT NULL,
	/*Επώνυμο, αναγκαίο για τη σχέση */
  `last_name` varchar(30) NOT NULL,
  PRIMARY KEY (`writer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `writer_book`
--

DROP TABLE IF EXISTS `writer_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `writer_book` (
	/*Ακέραιος, foreign key προς το δανειζόμενο βιβλίο, αναγκαία σχέση, ο περιορισμός του μεγέθους σε 13 ψηφία
	 πραγματοποιείται στο table school_book */
  `ISBN` bigint(13) unsigned NOT NULL,
	/*Ακέραιος, foreign key προς το συγγραφέα, αναγκαίο για τη σχέση */
  `writer_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ISBN`,`writer_id`),
  KEY `fk_writer_book_writer` (`writer_id`),
	/* Ορισμός index στο ISBN για επιτάχυνση αναζητήσεων κατά σκέτο ISBN, δεν φτιάχνεται σίγουρα αυτόματα,
	δε γνωρίζω γιατί */
  KEY `idx_writer_book_isbn` (`ISBN`),
	/* Σε περίπτωση διαγραφής του βιβλίου δεν υπάρχει ανάγκη συγκράτησης της σχέσης του με συγγραφείς */
  CONSTRAINT `fk_writer_book_book` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE,
	/*Εμπόδιση διαγραφής συγγραφέα αν αυτός έχει συγγράψει βιβλία της βάσης */
  CONSTRAINT `fk_writer_book_writer` FOREIGN KEY (`writer_id`) REFERENCES `writer` (`writer_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
 VIEW `admin_rent` AS 
 select `ar`.`admin_user_id` AS `admin_id`,`u`.`first_name` AS `first_name`,`u`.`last_name` AS `last_name`,
 `ar`.`rent_id` AS `rent_id`,`ar`.`start_date` AS `start_date` 
 from (`all_rent` `ar` join `lib_user` `u` on(`ar`.`admin_user_id` = `u`.`user_id`)) ;
 
 /* Επιστρέφει όνομα ενός χειριστή μαζί με τους δανεισμούς, παλαιούς ή τρέχοντες, που έχει εγκρίνει.
Χρησιμοποποιείται στην admin_rent_per_year */

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
VIEW `admin_rent_per_year` AS 
select `admin_rent`.`admin_id` AS `admin_id`,`admin_rent`.`first_name` AS `first_name`,
`admin_rent`.`last_name` AS `last_name`,year(`admin_rent`.`start_date`) AS `rent_year`,
count(`admin_rent`.`rent_id`) AS `rents` 
from `admin_rent` group by `admin_rent`.`admin_id`,year(`admin_rent`.`start_date`);

/* Επιστρέφει όνομα ενός χειριστή μαζί με τον αριθμό δανεισμών που έχει εγκρίνει σε ένα έτος.
Χρησιμοποποιείται στην admins_with_same_rentals_in_year */

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
VIEW `admins_with_same_rentals_in_year` AS 
select `a1`.`first_name` AS `fn1`,`a1`.`last_name` AS `ln1`,
`a2`.`first_name` AS `fn2`,`a2`.`last_name` AS `ln2`,`a1`.`rents` AS `rents`,`a1`.`rent_year` AS `rent_year`
 from (`admin_rent_per_year` `a1` join `admin_rent_per_year` `a2` on(`a1`.`rents` = `a2`.`rents`
  and `a1`.`rent_year` = `a2`.`rent_year` and `a1`.`admin_id` < `a2`.`admin_id`)) where `a2`.`rents` > 20;

/*Επιστρέφει ονόματα δύο χειριστών που σε ένα έτος έχουν καταχωρήσει τον ίδιο αριθμό δανεισμών, μεγαλύτερο από 20, 
και το έτος και τον αριθμό των δανεισμών.
Η ανισότητα στα id χρησιμοποιείται για να μην υπάρχουν καθρεπτισμένοι συνδυασμοί των ίδιων εκπαιδευτικών
Απαντά στο ερώτημα 3.1.5 */

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
VIEW `all_rent` AS 
select 'ACT' AS `status`,`active_rent`.`rent_ID` AS `rent_id`,`active_rent`.`ISBN` AS `ISBN`,
`active_rent`.`renting_user_id` AS `renting_user_id`,`active_rent`.`admin_user_id` AS `admin_user_id`,
`active_rent`.`start_date` AS `start_date`,NULL AS `return_date` from `active_rent` 
union 
select 'PAST' AS `status`,
`past_rent`.`rent_ID` AS `rent_id`,`past_rent`.`ISBN` AS `ISBN`,`past_rent`.`renting_user_id` AS `renting_user_id`,
`past_rent`.`admin_user_id` AS `admin_user_id`,`past_rent`.`start_date` AS `start_date`,
past_rent`.`return_date` AS `return_date` from `past_rent`;

/* Επιστρέφει μια συνένωση των active_rents με τα past_rents
Χρησιμοποποιείται στις admin_rent, all_rents_from_teachers, book_rent_count */

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
VIEW `all_rents_from_teachers` AS 
select `r`.`status` AS `status`,`r`.`rent_id` AS `rent_id`,`r`.`ISBN` AS `ISBN`,
`r`.`renting_user_id` AS `renting_user_id`,`r`.`admin_user_id` AS `admin_user_id`,`r`.`start_date` AS `start_date`,
`r`.`return_date` AS `return_date`,`t`.`user_id` AS `user_id`,`t`.`birth_date` AS `birth_date`
 from (`all_rent` `r` join `teacher` `t` on(`r`.`renting_user_id` = `t`.`user_id`));
 
 /* Επιστρέφει μια συνένωση των active_rents με τα past_rents από εκπαιδευτικούς, μαζί με την ημερομηνία
 γέννησης του εκπαιδευτικού
Χρησιμοποποιείται στην young_teachers */

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
VIEW `book_full_data` AS
select `b`.`ISBN` AS `ISBN`,`b`.`title` AS `title`,`b`.`writer_id` AS `writer_id`,
`b`.`writer_names` AS `writer_names`,`b`.`categories` AS `categories`,`b`.`keywords` AS `keywords`,
`l`.`language_name` AS `language` 
from ((select `b`.`ISBN` AS `ISBN`,`b`.`title` AS `title`,`b`.`writer_id` AS `writer_id`,
`b`.`writer_names` AS `writer_names`,`b`.`categories` AS `categories`,
group_concat(`k`.`keyword` separator ', ') AS `keywords` 
from ((select `b`.`ISBN` AS `ISBN`,`b`.`title` AS `title`,`b`.`writer_id` AS `writer_id`,
`b`.`writer_names` AS `writer_names`,group_concat(`c`.`category_name` separator ',') AS `categories` 
from ((select `b`.`ISBN` AS `ISBN`,`b`.`title` AS `title`,`wb`.`writer_id` AS `writer_id`,
group_concat(' ',`w`.`first_name`,' ',`w`.`last_name` separator ',') AS `writer_names` 
from ((`book` `b` left join `writer_book` `wb` on(`b`.`ISBN` = `wb`.`ISBN`)) 
left join `writer` `w` on(`wb`.`writer_id` = `w`.`writer_id`)) group by `b`.`ISBN`) `b` 
left join `book_category` `c` on(`b`.`ISBN` = `c`.`ISBN`)) group by `b`.`ISBN`) `b` 
left join `book_keyword` `k` on(`b`.`ISBN` = `k`.`ISBN`)) group by `b`.`ISBN`) `b` 
left join `book_language` `l` on(`b`.`ISBN` = `l`.`ISBN`));

/*Επιστρέφει διάφορα χαρακτηριστιά του βιβλίου, school agnostic
Χρησιμοποιείται στη book_list.php και book.php*/

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
VIEW `book_full_data_searchable` AS 
select `b`.`ISBN` AS `ISBN`,`b`.`title` AS `title`,`b`.`writer_id` AS `writer_id`,
`b`.`writer_names` AS `writer_names`,`b`.`categories` AS `categories`,
`b`.`keywords` AS `keywords`,`l`.`language_name` AS `language`,
`sb`.`available_copies` AS `available_copies`,`sb`.`school_id` AS `school_id` 
from (((select `b`.`ISBN` AS `ISBN`,`b`.`title` AS `title`,
`b`.`writer_id` AS `writer_id`,`b`.`writer_names` AS `writer_names`,
`b`.`categories` AS `categories`,group_concat(`k`.`keyword` separator ', ') AS `keywords` 
from ((select `b`.`ISBN` AS `ISBN`,`b`.`title` AS `title`,`b`.`writer_id` AS `writer_id`,
`b`.`writer_names` AS `writer_names`,group_concat(`c`.`category_name` separator ',') AS `categories` 
from ((select `b`.`ISBN` AS `ISBN`,`b`.`title` AS `title`,`wb`.`writer_id` AS `writer_id`,
group_concat(' ',`w`.`first_name`,' ',`w`.`last_name` separator ',') AS `writer_names` 
from ((`book` `b` left join `writer_book` `wb` on(`b`.`ISBN` = `wb`.`ISBN`)) 
left join `writer` `w` on(`wb`.`writer_id` = `w`.`writer_id`)) group by `b`.`ISBN`) `b` 
left join `book_category` `c` on(`b`.`ISBN` = `c`.`ISBN`)) group by `b`.`ISBN`) `b` 
left join `book_keyword` `k` on(`b`.`ISBN` = `k`.`ISBN`)) group by `b`.`ISBN`) `b` 
left join `book_language` `l` on(`b`.`ISBN` = `l`.`ISBN`)) 
left join `school_book` `sb` on(`b`.`ISBN` = `sb`.`ISBN`));

/*Επιστρέφει διάφορα χαρακτηριστιά του βιβλίου, school specific
Χρησιμοποιείται στη book_list.php και book.php*/

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
VIEW `book_rent_count` AS 
select `b`.`ISBN` AS `ISBN`,count(`r`.`rent_id`) AS `rent_count` 
from (`book` `b` join `all_rent` `r`) 
where `b`.`ISBN` = `r`.`ISBN` 
group by `b`.`ISBN`;

/*Επιστρέφει τον αριθμό κρατήσεων ενός βιβλίου*/

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
VIEW `category_review_avg` AS
select `c`.`category_name` AS `category_name`,avg(`r`.`likert_scale`) AS `AVG(likert_scale)`
from ((`category` `c` left join `book_category` `bc` on(`c`.`category_name` = `bc`.`category_name`))
left join `review` `r` on(`r`.`ISBN` = `bc`.`ISBN`))
group by `c`.`category_name`;

/*Επιστρέφει τον μέσο όρο των αξιολογήσεων για μία κατηγορία, school agnostic
Χρησιμοποιείται στην σελίδα AVERAGE REVIEW STATISTICS /*

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
VIEW `category_review_avg_per_school` AS
select `c`.`category_name` AS `category_name`,avg(`r`.`likert_scale`) AS `AVG(likert_scale)`,
`u`.`school_id` AS `school_id` 
from (((`category` `c` left join `book_category` `bc` on(`c`.`category_name` = `bc`.`category_name`)) 
left join `review` `r` on(`r`.`ISBN` = `bc`.`ISBN`)) 
left join `lib_user` `u` on(`r`.`reviewer_id` = `u`.`user_id`)) 
group by `c`.`category_name`,`u`.`school_id`;

/*Επιστρέφει τον μέσο όρο των αξιολογήσεων για μία κατηγορία, school specific
Χρησιμοποιείται στην σελίδα AVERAGE REVIEW STATISTICS */

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
VIEW `late_rent` AS
select `active_rent`.`rent_ID` AS `rent_ID`,`active_rent`.`renting_user_id` AS `rent_user_id`,
`active_rent`.`admin_user_id` AS `admin_user_id`,`active_rent`.`ISBN` AS `ISBN`,
`active_rent`.`start_date` AS `start_date`,
to_days(curdate()) - to_days(`active_rent`.`start_date` + interval 1 week) AS `late_by` 
from `active_rent` where curdate() > `active_rent`.`start_date` + interval 1 week ;

/*Επιστρέφει δεδομένα ενεργής κράτησης η επιστροφή της οποίας έχει καθυστερήσει, μαζί με τον
αριθμό ημερών κατά τις οποίες έχει καθυστερήσει
Χρησιμοποιείται σε διάφορα σημεία για έλεγχο καθυστέρηση κράτησης,
π.χ. σελίδα RENTALS του χειριστή (rentals.php)
και στην reservation_full_data

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
VIEW `most_popular_category_pairs` AS
select `c1`.`category_name` AS `c1n`,`c2`.`category_name` AS `c2n`,
sum(`br`.`rent_count`) AS `rent_count` 
from ((`book_category` `c1` 
join `book_category` `c2` on(`c1`.`ISBN` = `c2`.`ISBN` and `c1`.`category_name` < `c2`.`category_name`)) 
join `book_rent_count` `br`) 
where `br`.`ISBN` = `c1`.`ISBN` 
group by `c1`.`category_name`,`c2`.`category_name` 
order by sum(`br`.`rent_count`) desc limit 3;

/*Επιστρέφει τα 3 πιο δανεισμένα ζεύγη κατηγοριων
Χρησιμοποιείται στη σελίδα MOST POPULAR CATEGORY PAIRS
Απαντάει στο ερώτημα 3.1.6 */


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
VIEW `not_top_writers` AS
select `writer_book_count`.`writer_id` AS `writer_id`,
`writer_book_count`.`first_name` AS `first_name`,`writer_book_count`.`last_name` AS `last_name`,
`writer_book_count`.`book_count` AS `book_count` 
from `writer_book_count` 
where `writer_book_count`.`book_count` < (select max(`writer_book_count`.`book_count`) 
from `writer_book_count`) - 5;

/*Επιστρέφει τους συγγραφείς με περισσότερα από 5 βιβλία λιγότερα δανεισμένα
από τον συγγραφέα με το μέγιστο αριθμό δανεισμών βιβλίων
Χρησιμοποιείται στη σελίδα WRITERS 5 BOOKS AWAY FROM TOP
Απαντάει στο ερώτημα 3.1.7 */

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
VIEW `past_rent_full_data` AS
select `r`.`rent_ID` AS `rent_id`,`r`.`ISBN` AS `ISBN`,
`b`.`title` AS `book_title`,`r`.`renting_user_id` AS `renting_user_id`,
`u`.`username` AS `username`,`u`.`school_id` AS `school_id`,
`r`.`start_date` AS `start_date`,`r`.`return_date` AS `return_date` 
from ((`past_rent` `r` join `book` `b` on(`r`.`ISBN` = `b`.`ISBN`)) 
join `lib_user` `u` on(`r`.`renting_user_id` = `u`.`user_id`)) 
order by `r`.`start_date`;

/*Επιστρέφει διάφορα δεδομένα για παλαιούς δανεισμούς
Χρησιμοποιείται στη σελίδα RENTALS */

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
VIEW `pending_review_full_data` AS select `r`.`ISBN` AS `ISBN`,
`b`.`title` AS `book_title`,`r`.`likert_scale` AS `likert_scale`,
`r`.`text` AS `text`,`r`.`reviewer_id` AS `reviewer_id`,
`u`.`username` AS `username`,`u`.`school_id` AS `school_id`,
`r`.`review_id` AS `review_id` 
from ((`pending_review` `r` join `book` `b` on(`r`.`ISBN` = `b`.`ISBN`)) 
join `lib_user` `u` on(`r`.`reviewer_id` = `u`.`user_id`));

/*Επιστρέφει διάφορα δεδομένα για εκκρεμής αξιολογήσεις
Χρησιμοποιείται στην PENDING REVIEWS */


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
VIEW `principal_full_data` AS
select `p`.`user_id` AS `user_id`,`p`.`school_id` AS `school_id`,
`u`.`first_name` AS `first_name`,`u`.`last_name` AS `last_name`,
`u`.`username` AS `username` 
from (`principal` `p` join `lib_user` `u` on(`p`.`user_id` = `u`.`user_id`)) */;

/*Επιστρέφει διάφορα δεδομένα για τον διευθυντή ενός σχολείου
Χρησιμοποιείται στις κεντρικές σελίδες των σχολείων για τον κεντρικό χειριστή
school_page.php */

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
VIEW `rent_full_data` AS
select `r`.`rent_ID` AS `rent_id`,`r`.`ISBN` AS `ISBN`,
`b`.`title` AS `book_title`,`r`.`renting_user_id` AS `renting_user_id`,
`u`.`username` AS `username`,`u`.`first_name` AS `first_name`,
`u`.`last_name` AS `last_name`,`u`.`school_id` AS `school_id`,
`r`.`start_date` AS `start_date`,
if(to_days(curdate()) - to_days(`r`.`start_date` + interval 1 week) > 0,to_days(curdate()) - to_days(`r`.`start_date` + interval 1 week),0) AS `late_by` 
from ((`active_rent` `r` join `book` `b` on(`r`.`ISBN` = `b`.`ISBN`)) 
join `lib_user` `u` on(`r`.`renting_user_id` = `u`.`user_id`)) 
order by `r`.`start_date` ;

/* Επιστρέφει διάφορα δεδομένα για έναν ενεργό δανεισμό και τον δανειζόμενο
καθώς και τις ημέρες κατά τις οποίες έχει καθυστερήσει η επιστροφή, 0 αν δεν έχει
Χρησιμοποιείται στην σελίδα RENTALS rentals.php

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
VIEW `reservation_full_data` AS
select `r`.`reservation_ID` AS `reservation_id`,
`r`.`ISBN` AS `ISBN`,`b`.`title` AS `book_title`,
`r`.`user_id` AS `user_id`,`u`.`username` AS `username`,
`u`.`school_id` AS `school_id`,`u`.`reserving` AS `reserving`,
`u`.`renting` AS `renting`,`ur`.`role` AS `role`,
`r`.`submission_date` AS `submission_date`,
`sb`.`available_copies` AS `available_copies`,
row_number() over ( partition by `u`.`school_id`,`r`.`ISBN` order by `r`.`submission_date`) AS `reserv_order`,
`r`.`user_id` in (select `late_rent`.`rent_user_id` from `late_rent`) AS `late` 
from ((((`reservation` `r` join `book` `b` on(`r`.`ISBN` = `b`.`ISBN`)) 
join `lib_user` `u` on(`r`.`user_id` = `u`.`user_id`)) 
join `school_book` `sb` on(`sb`.`school_id` = `u`.`school_id` and `sb`.`ISBN` = `r`.`ISBN`)) 
join `user_role` `ur` on(`ur`.`user_id` = `u`.`user_id`)) */;

/*Επιστρέφει διάφορα δεδομένα για κράτηση και χρήστη κράτησης, διαθεσιμότητα του βιβλίου
στο σχολείο του χρήστη και αριθμίζει τις κρατήσεις ξεχωριστά για κάθε σχολείο, ανά βιβλίο
με βάση την ημερομηνία που κατατέθηκαν, ώστε να υπολογιστεί στο backend αν υπάρχει περιθώριο
για δανεισμό κράτησης εκτός σειράς. Επιπλέον αν ο χρήστης έχει καθυστερήση σε επιστροφή άλλου δανεισμού
Χρησιμοποιείται στην RESERVATIONS reservations.php */

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
VIEW `review_full_data` AS
select `r`.`ISBN` AS `ISBN`,`b`.`title` AS `book_title`,`r`.`likert_scale` AS `likert_scale`,
`r`.`text` AS `text`,
`r`.`reviewer_id` AS `reviewer_id`,`u`.`username` AS `username`,`u`.`school_id` AS `school_id`,
`r`.`review_id` AS `review_id`,`r`.`admin_user_id` AS `admin_user_id` 
from ((`review` `r` join `book` `b` on(`r`.`ISBN` = `b`.`ISBN`)) 
join `lib_user` `u` on(`r`.`reviewer_id` = `u`.`user_id`)) */;

/*Επιστρέφει διάφορα δεδομένα για μια αξιολόγηση
Χρησιμοποιείται στις book.php, pending_reviews.php */

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
VIEW `school_rents` AS
select `s`.`school_id` AS `school_id`,`s`.`school_name` AS `school_name`,`r`.`rent_id` AS `rent_id`,
`u`.`user_id` AS `username`,`r`.`start_date` AS `start_date` 
from ((`school_unit` `s` 
left join `lib_user` `u` on(`s`.`school_id` = `u`.`school_id`)) 
left join `all_rent` `r` on(`u`.`user_id` = `r`.`renting_user_id`));

/*Επιστρέφει τις κρατήσεις που υπάρχουν σε κάθε σχολείο 
Χρησιμοποιείται στη rents per school,
βοηθάει στην απάντηση του ερωτήματος 3.1.1
το υπόλοιπο λύνεται στον κώδικα, σελίδα rents_per_school.php */


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
VIEW `school_teachers` AS
select `t`.`user_id` AS `user_id`,`u`.`first_name` AS `first_name`,
`u`.`last_name` AS `last_name`,`u`.`school_id` AS `school_id` 
from (`teacher` `t` join `lib_user` `u` on(`t`.`user_id` = `u`.`user_id`)) ;

/*Επιστρέφει δεδομένα όλων των καθηγητών για με το σχολείο που ανήκουν,
χρησιμοποιείται για καθορισμό νέου διευθυντή στη
school_page.php */

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
VIEW `user_page_info` AS
select `u`.`user_id` AS `user_id`,`u`.`username` AS `username`,
`u`.`first_name` AS `first_name`,`u`.`last_name` AS `last_name`,
`u`.`renting` AS `renting`,`u`.`reserving` AS `reserving`,`ur`.`role` AS `role`,
`t`.`birth_date` AS `birth_date` 
from ((`lib_user` `u` join `user_role` `ur` on(`u`.`user_id` = `ur`.`user_id`)) 
left join `teacher` `t` on(`u`.`user_id` = `t`.`user_id`));

/*Επιστρέφει όλα τα δεδομένα που είναι να εμφανιστούν στη user_page.php,
η ημερομηνία γέννησης μόνο στους εκπαιδευτικούς όπου υπάρχει, εξού και το
left join */

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
VIEW `user_renting_info` AS 
(select `lib_user`.`user_id` AS `user_id`,`lib_user`.`username` AS `username`,
`lib_user`.`school_id` AS `school_id`,`lib_user`.`renting` AS `renting`,
`lib_user`.`reserving` AS `reserving`,convert('TEACHER' using utf8) AS `role` 
from (`lib_user` join `teacher` on(`lib_user`.`user_id` = `teacher`.`user_id`)))
 union 
 (select `lib_user`.`user_id` AS `user_id`,`lib_user`.`username` AS `username`,
 `lib_user`.`school_id` AS `school_id`,`lib_user`.`renting` AS `renting`,
 `lib_user`.`reserving` AS `reserving`,convert('STUDENT' using utf8) AS `STUDENT` 
 from (`lib_user` join `student` on(`lib_user`.`user_id` = `student`.`user_id`))) */;
 
 /*Επιστρέφει χρήσιμα δεδομένα για θέματα κρατήσεων και δανεισμών για όλους τους χρήστες
 χρησιμοποιείται στην book.php και την im_rental.php
 δηλαδή για δανεισμό άμεσο είτα από τη σελίδα του βιβλίου ή την ειδική */
 
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
VIEW `user_review_avg` AS select `u`.`user_id` AS `user_id`,`u`.`username` AS `username`,
`u`.`first_name` AS `first_name`,`u`.`last_name` AS `last_name`,
avg(`r`.`likert_scale`) AS `AVG(likert_scale)` 
from (`review` `r` join `lib_user` `u` on(`u`.`user_id` = `r`.`reviewer_id`)) 
group by `u`.`user_id`;

/*Επιστρέφει το μέσο όρο αξιολογήσεων των χρηστών που έχουν αξιολογήσεις
χρησιμοποιείται στην AVERAGE REVIEW STATISTICS avg_reviews.php */


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
VIEW `user_review_category_avg` AS
select `u`.`user_id` AS `user_id`,`u`.`username` AS `username`,
`u`.`first_name` AS `first_name`,`u`.`last_name` AS `last_name`,
`c`.`category_name` AS `category_name`,
avg(`r`.`likert_scale`) AS `avg` 
from (((`category` `c` 
left join `book_category` `bc` on(`c`.`category_name` = `bc`.`category_name`)) 
left join `review` `r` on(`r`.`ISBN` = `bc`.`ISBN`)) 
join `lib_user` `u` on(`u`.`user_id` = `r`.`reviewer_id`)) 
group by `u`.`user_id`,`c`.`category_name` 
order by `u`.`user_id`;

/*Επιστρέφει το μέσο όρο αξιολογήσεων των χρηστών σε κατηγορίες
στις οποίες έχουν αξιολογήσεις
χρησιμοποιείται στην AVERAGE REVIEW STATISTICS avg_reviews.php */

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
VIEW `user_role` AS
select `lib_admin`.`user_id` AS `user_id`,`lib_admin`.`school_id` AS `school_id`,
convert('LIB_ADMIN' using utf8) AS `role` 
from `lib_admin`
union
select `teacher`.`user_id` AS `user_id`,`lib_user`.`school_id` AS `school_id`,
convert('TEACHER' using utf8) AS `CONVERT('TEACHER' USING utf8)` 
from (`teacher` join `lib_user` on(`teacher`.`user_id` = `lib_user`.`user_id`))
where !(`teacher`.`user_id` in (select `lib_admin`.`user_id` from `lib_admin`))
union
select `student`.`user_id` AS `user_id`,`lib_user`.`school_id` AS `school_id`,
convert('STUDENT' using utf8) AS `CONVERT('STUDENT' USING utf8)` from (`student` join `lib_user` on(`student`.`user_id` = `lib_user`.`user_id`));

/*Επιστρέφει λίστα με όλους τους χρήστες, το σχολείο στο οποίο ανήκουν και το ρόλο τους
Χρησιμοποιείται στην login_handle.php */

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
VIEW `writer_book_count` AS
select `w`.`writer_id` AS `writer_id`,`w`.`first_name` AS `first_name`,
`w`.`last_name` AS `last_name`,count(`wb`.`ISBN`) AS `book_count` 
from (`writer` `w` left join `writer_book` `wb` on(`w`.`writer_id` = `wb`.`writer_id`)) 
group by `w`.`writer_id`;

/* Επιστρέφει τον αριθμό των βιβλίων που έχει γράψει ο συγγραφέας
χρησιμοποιείται στην not_top_writers */

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
VIEW `writers_with_no_rented_books` AS 
select `wb`.`writer_id` AS `writer_id`,`writer`.`first_name` AS `first_name`,
`writer`.`last_name` AS `last_name` 
from ((`writer` left join `writer_book` `wb` on(`wb`.`writer_id` = `writer`.`writer_id`)) 
left join `all_rent` on(`wb`.`ISBN` = `all_rent`.`ISBN`)) 
group by `wb`.`writer_id` 
having count(`all_rent`.`rent_id`) = 0;

/* Επιστρέφει τα ονόματα των συγγραφέων που δεν έχουν κανένα δανεισμένο βιβλίο
απαντάει στην 3.1.4 */

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
VIEW `young_teachers` AS
select `t`.`user_id` AS `user_id`,`u`.`first_name` AS `first_name`,
`u`.`last_name` AS `last_name`,
count(`ar`.`ISBN`) AS `count(ar.ISBN)`,timestampdiff(YEAR,`t`.`birth_date`,curdate()) AS `age` 
from ((`teacher` `t` join `all_rents_from_teachers` `ar` on(`t`.`user_id` = `ar`.`user_id`)) 
join `lib_user` `u` on(`t`.`user_id` = `u`.`user_id`)) 
group by `t`.`user_id` 
having `age` < 40 
order by count(`ar`.`ISBN`) desc */;

/*Επιστρέφει τους νέους εκπαιδευτικούς που έχουν δανειστεί στα περισσότερα βιβλία
και τον αριθμό των βιβλίων
απαντάει στην 3.1.3
χρησιμοποιείται στην σελίδα young_teachers.php */

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

-- Dump completed on 2023-06-04 18:27:24
