<?php
include_once "header.php";
require_once "db_connect.php";

if($_SESSION['role']=='STUDENT' OR $_SESSION['role']=='TEACHER') {
	$admin = false;
} else 
	$admin = true;
?>

<h2><?php if(!$admin) echo 'My '; ?>Pending Reviews</h2>

<?php
$stmt = 'SELECT * FROM pending_review_full_data WHERE school_id = ?';
if(!$admin) {
	$stmt = $stmt.' AND reviewer_id = ? ;';
} else
	$stmt = $stmt.';';

$pending_reviews_stmt = $mysqli->prepare($stmt);

if(!$admin) {
	$pending_reviews_stmt->bind_param("ii",$_SESSION['school_id'],$_SESSION['user_id']);
} else
	$pending_reviews_stmt->bind_param("i",$_SESSION['school_id']);

$pending_reviews_stmt->execute();
$pending_reviews = $pending_reviews_stmt->get_result();

if (isset($_GET['apr_success'])) {
  if($_GET['apr_success']) {
    echo "Review approved";
  } else {
    echo "Review approval failed";
  }
}

if (isset($_GET['del_success'])) {
  if($_GET['del_success']) {
    echo "Review deleted";
  } else {
    echo "Review deletion failed";
  }
}
?>
<table>
<tr>
  <td></td>
  <td></td>
  <td>Book</td>
<?php
if($admin) {
echo '
  <td>Username</td>';
} ?>
  <td>Rating</td>
  <td>Review</td?
<tr/>
<?php

$likert_map = [
	1 => 'Πολύ κακό',
	2 => 'Κακό',
	3 => 'Μέτριο',
	4 => 'Καλό',
	5 => 'Πολύ καλό'
];

foreach ($pending_reviews as $row) {
echo '
<tr>
	<td>
  <form action="./book.php?ISBN='.$row['ISBN'].'" method="post">
  <button type="submit">Go to book page</button>
	</form>
	</td>
  <td>';
if($admin) { 
	echo '
  <form action="pend_rev_handle.php" method="post">
  <button type="submit" name="approve" value="approve">Approve</button>
  <button type="submit" name ="delete" value="delete">Delete</button>
  <input type="hidden" name="review_id" value="'.$row['review_id'].'">
  </form>';
}
echo '
  </td>
  <td>'.$row['book_title'].'</td>';

if($admin) {
echo '
  <td>'.$row['username'].'</td>';
}
echo '
  <td>'.$likert_map[3].'</td>
  <td><p>'.$row['text'].'</p></td>
  <td>'.
'</form>
  </td>
<tr>'; 
 }; ?>

