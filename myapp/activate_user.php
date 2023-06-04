<?php
session_start();
require_once "db_connect.php";

$insert_user_stmt = $mysqli->prepare("INSERT INTO lib_user(username,password,first_name,last_name,school_id) VALUES (?,?,?,?,?) ;");
$insert_user_stmt->bind_param("ssssi",
$_POST['username'],$_POST['password'],$_POST['first_name'],
$_POST['last_name'],$_SESSION['school_id']);
$insert_user_stmt->execute();

if(!$insert_user_stmt) {
  header('Location: ./pending_users.php?act_success=false');
  exit();
}

$get_inserted_id = $mysqli->prepare("SELECT user_id FROM lib_user
WHERE username = ?;");
$get_inserted_id->bind_param("s",
$_POST['username']);
$get_inserted_id->execute(); 
$get_inserted_id_result = ($get_inserted_id->get_result())->fetch_assoc();

if(!$get_inserted_id) {
  header('Location: ./pending_users.php?act_success=false');
  exit();
}

if($_POST['role']==='STUDENT') {
$insert_user_stmt = $mysqli->prepare("INSERT INTO student VALUES (?);");
$insert_user_stmt->bind_param("s",$get_inserted_id_result['user_id']);
} else {
$insert_user_stmt = $mysqli->prepare("INSERT INTO teacher VALUES (?,?);");
$insert_user_stmt->bind_param("si",$get_inserted_id_result['user_id'],$_POST['birth_date']);
}
$insert_user_stmt->execute();

if($_POST['role']==='LIBRARY ADMIN' and $_SESSION['role']=='CENTRAL_ADMIN') {
$insert_user_stmt = $mysqli->prepare("INSERT INTO lib_admin VALUES (?,?);");
$insert_user_stmt->bind_param("ii",$get_inserted_id_result['user_id'],$_POST['school_id']);
}

$insert_user_stmt->execute();

if(!$insert_user_stmt) {
  header('Location: ./pending_users.php?act_success=false');
  exit();
}



$delete_user_stmt = $mysqli->prepare("DELETE FROM pending_lib_user
WHERE  user_id = ? ;");
$delete_user_stmt->bind_param("i",
$_POST['user_id']);
$delete_user_stmt->execute();

if(!$delete_user_stmt) {
  header('Location: ./pending_users.php?act_success=false');
  exit();
}
else {
  header('Location: ./pending_users.php?act_success=true');
  exit();
}
