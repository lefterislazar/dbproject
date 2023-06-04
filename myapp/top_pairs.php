<?php
include_once "header.php";
require_once "./db_connect.php";

if($_SESSION['role']!='CENTRAL_ADMIN' ) {
	header('Location: ./main.php');
	exit();
}

?>
<h2>MOST POPULAR CATEGORY PAIRS</h2>

<table border=1 frame=hsides rules=rows>
	<tr>
		<td>Category 1</td>
		<td>Category 2</td>
		<td>Total number of Rentals</td>
	</tr>

<?php

$stmt = 
" SELECT * FROM most_popular_category_pairs; 
"
;

//echo $stmt;

$query = $mysqli->query($stmt);

foreach($query as $row) { ?>
	<tr>
	<td> <?php echo $row['c1n']; ?> </td>
	<td> <?php echo $row['c2n']; ?> </td>
	<td> <?php echo $row['rent_count']; ?> </td>
	</tr>
<?php } ?>

</table>
