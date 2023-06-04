<?php
include_once "header.php";
require_once "./db_connect.php";

if($_SESSION['role']!='CENTRAL_ADMIN' ) {
	header('Location: ./main.php');
	exit();
}

?>
<h2>Teachers younger than 40 years old with the most book rentals:</h2>

<table border=1 frame=hsides rules=rows>
	<tr>
		<td>Teacher Name</td>
		<td>Age</td>
		<td>Number of Rentals</td>
	</tr>

<?php

$stmt = 'SELECT * FROM young_teachers';

//echo $stmt;

$query = $mysqli->query($stmt);

foreach($query as $row) { ?>
	<tr>
	<td> <?php echo $row['first_name'].' '.$row['last_name']; ?> </td>
	<td> <?php echo $row['age']; ?> </td>
	<td> <?php echo $row['count(ar.ISBN)']; ?> </td>
	</tr>
<?php } ?>

</table>

