<?php
include_once "header.php";
require_once "./db_connect.php";

if($_SESSION['role']!='CENTRAL_ADMIN' ) {
	header('Location: ./main.php');
	exit();
}

?>
<h2>Writers with no rented books</h2>

<table border=1 frame=hsides rules=rows>
	<tr>
		<td>Writer name</td>
	</tr>

<?php

$stmt = '
SELECT  * FROM writers_with_no_rented_books
';

//echo $stmt;

$query = $mysqli->query($stmt);

foreach($query as $row) { ?>
	<tr>
	<td> <?php echo $row['first_name'].' '.$row['last_name']; ?> </td>
	</tr>
<?php } ?>

</table>

