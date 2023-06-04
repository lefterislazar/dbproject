<?php
session_start();
$reviewer_id = htmlspecialchars($_SESSION['user_id']);
$review_ISBN = htmlspecialchars($_POST['ISBN']);
$rating = $_POST['likert'];
$text = $_POST['user_message'];

require_once "db_connect.php";

if(isset($_POST['editing'])) {
	if($_POST['pen'] == false) {
	$delete_previous = $mysqli->prepare('DELETE FROM review WHERE reviewer_id = ? AND ISBN =?;');
	$delete_previous->bind_param("ii",$_SESSION['user_id'],$review_ISBN);
	$delete_previous->execute();
	} else {
	$delete_previous = $mysqli->prepare('DELETE FROM pending_review WHERE reviewer_id = ? AND ISBN =?;');
	$delete_previous->bind_param("ii",$_SESSION['user_id'],$review_ISBN);
	$delete_previous->execute();
	}
}

$result =  $mysqli->prepare("INSERT INTO pending_review(reviewer_id,ISBN,text,likert_scale) VALUES
(?,?,?,?);");
$result->bind_param("iisi",$_SESSION['user_id'],$review_ISBN,$text,$rating);
$result->execute();


if($result) {
  header('Location: ./book.php?ISBN='.$review_ISBN.'&rev_post=true');
  exit();
}
else {
  header('Location: ./book.php?ISBN='.$review_ISBN.'&rev_post=false');
  exit();
}
