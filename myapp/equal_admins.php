<?php
include_once "header.php";
require_once "./db_connect.php";

if($_SESSION['role']!='CENTRAL_ADMIN' ) {
	header('Location: ./main.php');
	exit();
}

?>
<h2>Admins with same number of book rentals approved in a year</h2>

<table border=1 frame=hsides rules=rows>
	<tr>
		<td>Admin 1 Name</td>
		<td>Admin 2 Name</td>
		<td>Number of rentals</td>
		<td>Year</td>
	</tr>

<?php

$stmt = 
"SELECT * FROM admins_with_same_rentals_in_year;"
;

//echo $stmt;

$query = $mysqli->query($stmt);

foreach($query as $row) { ?>
	<tr>
	<td> <?php echo $row['fn1'].' '.$row['ln1']; ?> </td>
	<td> <?php echo $row['fn2'].' '.$row['ln2']; ?> </td>
	<td> <?php echo $row['rents']; ?> </td>
	<td> <?php echo $row['rent_year']; ?> </td>
	</tr>
<?php } ?>

</table>
