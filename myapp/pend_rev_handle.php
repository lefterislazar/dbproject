<?php
session_start();
$review_id = $_POST['review_id'];

require_once "db_connect.php";

if(isset($_POST['approve'])) {
$insert_rev = $mysqli->prepare("INSERT INTO review SELECT review_id,reviewer_id,?,ISBN,text,likert_scale,review_date FROM pending_review WHERE review_id = ?;");
$insert_rev->bind_param("ii",$_SESSION['user_id'],$review_id);
$insert_result = $insert_rev->execute();


if(!$insert_result) {
  header('Location: ./pending_reviews.php?apr_success=false');
  exit();
}
}

$result =  $mysqli->prepare("DELETE FROM pending_review WHERE review_id = ?;");
$result->bind_param("i",$review_id);
$result = $result->execute();

if(isset($_POST['delete'])) {
if($result) {
  header('Location: ./pending_reviews.php?del_success=true');
  exit();
}
}

if(!$result) {
  header('Location: ./pending_reviews.php?del_success=false');
  exit();
} else {
  header('Location: ./pending_reviews.php?apr_success=true');
  exit();
}


