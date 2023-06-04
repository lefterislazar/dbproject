<?php
session_start();
$reservation_id = $_POST['reservation_id'];

require_once "db_connect.php";

if(isset($_POST['rent'])) {
$insert_rent = $mysqli->prepare("INSERT INTO active_rent(admin_user_id,ISBN,renting_user_id,start_date) SELECT ?,ISBN,user_id,submission_date FROM reservation WHERE reservation_id = ?;");
$insert_rent->bind_param("ii",$_SESSION['user_id'],$reservation_id);
$insert_result = $insert_rent->execute();


if(!$insert_result) {
  header('Location: ./reservations.php?rent_success=false');
  exit();
}
}

$result =  $mysqli->prepare("DELETE FROM reservation WHERE reservation_id = ?;");
$result->bind_param("i",$reservation_id);
$result = $result->execute();

if(isset($_POST['delete'])) {
if($result) {
  header('Location: ./reservations.php?del_success=true');
  exit();
}
}

if(!$result) {
  header('Location: ./reservations.php?del_success=false');
  exit();
} else {
  header('Location: ./reservations.php?rent_success=true');
  exit();
}


