<?php
session_start();
require_once "db_connect.php";
$reserve_ISBN = htmlspecialchars($_GET['ISBN']);

$user_rents = $mysqli->prepare(" INSERT INTO reservation(user_id,ISBN)
VALUES (?,?);");
$user_rents->bind_param("ii",$_SESSION['user_id'],$reserve_ISBN);
$user_rents->execute();

if(!$executionfailed) {
  header('Location: ./book.php?ISBN='.$reserve_ISBN.'&res_succ=true');
  exit();
}
else {
  header('Location: ./book.php?ISBN='.$reserve_ISBN.'&res_succ=false');
  exit();
}
