<?php
session_start();
if(!isset($_SESSION['user_id'])) {
  header('Location: c:\xampp\htdocs\myapps\index.php');
  exit();
}
?>
<!DOCTYPE html>
<html lang="en-US">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <title>Library</title>
  </head>
  <body>

<header>
<?php echo '<h3>'.$_SESSION['username'].'</h3>';?>
<p><a href="./book_list.php">BOOK LIST</a></p>
<?php
if($_SESSION['role'] === 'LIB_ADMIN') { ?>
<p><a href="./insert_book.php">INSERT BOOK</a></p>
<?php } 
if($_SESSION['role'] !== 'CENTRAL_ADMIN') { ?>
<p><a href="./user_page.php">USER PAGE</a></p>
<?php } else { ?>
<p><a href="./central_user_page.php">USER PAGE</a></p>
<?php }
if($_SESSION['role'] === 'LIB_ADMIN') { ?>
<p><a href="./pending_users.php">PENDING USERS</a></p>
<p><a href="./pending_reviews.php">PENDING REVIEWS</a></p>
<p><a href="./reservations.php">RESERVATIONS</a></p>
<p><a href="./rentals.php">RENTALS</a></p>
<p><a href="./im_rental.php">CREATE RENTAL</a></p>
<p><a href="./user_list.php">USERS</a></p>
<p><a href="./avg_reviews.php">AVERAGE REVIEW STATISTICS</a></p>
<?php } 
if($_SESSION['role'] === 'STUDENT' OR $_SESSION['role'] === 'TEACHER') { ?>
<p><a href="./pending_reviews.php">MY PENDING REVIEWS</a></p>
<p><a href="./reservations.php">MY RESERVATIONS</a></p>
<p><a href="./rentals.php">MY RENTALS</a></p>
<?php }
if($_SESSION['role'] === 'CENTRAL_ADMIN') { ?>
<p><a href="./school_list.php">SCHOOLS LIST</a></p>
<p><a href="./insert_school.php">INSERT SCHOOL</a></p>
<p><a href="./user_list.php">USERS</a></p>
<p><a href="./pending_users.php">PENDING USERS</a></p>
<p><a href="./backup.php">BACKUP/RESTORE DATABASE</a></p>
<p>---- Special Statistics ----</p>
<p><a href="./rents_per_school.php">RENTALS PER SCHOOL</a></p>
<p><a href="./category_info.php">CATEGORY WRITERS & TEACHERS</a></p>
<p><a href="./young_teachers.php">YOUNG TEACHERS WITH MOST RENTALS</a></p>
<p><a href="./unrented_writers.php">WRITERS WITH NO RENTED BOOKS</a></p>
<p><a href="./equal_admins.php">ADMINS WITH SAME NUMBER OF BOOK RENTALS APPROVED IN A YEAR</a></p>
<p><a href="./top_pairs.php">MOST POPULAR CATEGORY PAIRS</a></p>
<p><a href="./not_top_writers.php">WRITERS 5 BOOKS AWAY FROM TOP</a></p>
<p>----------------------------</p>
<?php } ?>
<p><a href="./logout_handle.php">LOG OUT</a></p>

</header>
<hr>

