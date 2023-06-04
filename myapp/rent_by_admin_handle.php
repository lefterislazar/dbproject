<?php
session_start();
require_once "db_connect.php";
$rent_ISBN = $_POST['ISBN'];
$rent_user_id = $_POST['user_id'];

if($_POST['back'] == './book.php') {
	$back_loc = 'Location: ./book.php?ISBN='.$rent_ISBN;
} else
	$back_loc = 'Location: ./im_rental.php?';

echo $rent_user_id,' ',$_SESSION['user_id'],' ',$rent_ISBN;
$user_rents = $mysqli->prepare("INSERT INTO active_rent(renting_user_id, admin_user_id, ISBN) VALUES (?,?,?);"); 
$user_rents->bind_param("iii",$rent_user_id,$_SESSION['user_id'],$rent_ISBN);
$user_rents->execute();

if(!$user_rents) {
  header($back_loc.'&rent_succ=false');
  exit();
}


$del_reserv = $mysqli->prepare("DELETE FROM reservation WHERE user_id = ? AND ISBN = ?;");
$del_reserv->bind_param("ii",$rent_user_id,$rent_ISBN);
$del_reserv->execute();

if($del_reserv) {
  header($back_loc.'&rent_succ=true');
  exit();
}
else {
  header($back_loc.'&rent_succ=false');
  exit();
}
