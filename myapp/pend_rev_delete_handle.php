
<?php
session_start();
$review_id = $_POST['review_id'];

require_once "db_connect.php";


$result =  $mysqli->prepare("DELETE FROM pending_review WHERE review_id = ?;");
$result->bind_param("i",$review_id);
$result->execute();

if(isset($_POST['delete']) {
if(!$result) {
  header('Location: ./pending_reviews.php?del_success=false');
  exit();
}
else {
  header('Location: ./pending_reviews.php?del_success=true');
  exit();
}
}
