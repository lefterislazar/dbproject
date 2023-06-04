<?php
include_once "header.php";
require_once "./db_connect.php";

if($_SESSION['role']!='CENTRAL_ADMIN' ) {
	header('Location: ./main.php');
	exit();
}

?>
<h2>Writers with no less than 5 books less than the writer with most books writtern</h2>

<table border=1 frame=hsides rules=rows>
	<tr>
		<td>Writer name</td>
		<td>Number of Books written</td>
	</tr>

<?php

$stmt = 
"SELECT * FROM not_top_writers; 

"
;

//echo $stmt;

$query = $mysqli->query($stmt);

foreach($query as $row) { ?>
	<tr>
	<td> <?php echo $row['first_name'].' '.$row['last_name']; ?> </td>
	<td> <?php echo $row['book_count']; ?> </td>
	</tr>
<?php } ?>

</table>
