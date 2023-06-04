<?php
session_start();
$rent_id = $_POST['rent_id'];
echo $rent_id;

require_once "db_connect.php";

$stmt = "INSERT INTO past_rent(rent_ID,admin_user_id,ISBN,renting_user_id,start_date) SELECT rent_ID,admin_user_id,ISBN,renting_user_id,start_date FROM active_rent WHERE rent_id = ?;";
$insert_rent = $mysqli->prepare($stmt);
$insert_rent->bind_param("i",$rent_id);
$insert_result = $insert_rent->execute();


if(!$insert_result) {
  header('Location: ./rentals.php?return_success=false');
  exit();
}

$result =  $mysqli->prepare("DELETE FROM active_rent WHERE rent_id = ?;");
$result->bind_param("i",$rent_id);
$result = $result->execute();

if(!$result) {
  header('Location: ./rentals.php?return_success=false');
  exit();
} else {
  header('Location: ./rentals.php?return_success=true');
  exit();
}


