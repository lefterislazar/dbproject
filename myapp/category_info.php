<?php
include_once "header.php";
require_once "./db_connect.php";

if($_SESSION['role']!='CENTRAL_ADMIN' ) {
	header('Location: ./main.php');
	exit();
}

$category_q = $mysqli->query("SELECT * FROM category ORDER BY category_name;");

?>
<h2>Category Writers and Teachers</h2>
<p> Choose category: </p>
<form action="" method="get">
	<select type="text" list="category_list"  id="category" name="category"/>
	<datalist id="category_list">
		<option>--select--</option>
	<?php
	foreach($category_q as $row) {
	?>
		<option value="<?php echo $row['category_name'];?>"> <?php echo $row['category_name']; ?></option>	
	<?php
	}
	?>
	</datalist>
	</select>
  <button type="submit">Search</button>
</form>


<h3>Writers in category:</h3>
<table border=1 frame=hsides rules=rows>

<?php

$stmt = 'SELECT DISTINCT w.writer_id, w.first_name, w.last_name, bc.category_name FROM
	writer w INNER JOIN writer_book wb on w.writer_id = wb.writer_id
	INNER JOIN book b ON b.ISBN = wb.ISBN
	INNER JOIN book_category bc ON bc.ISBN = b.ISBN
	WHERE bc.category_name = ?;';

//echo $stmt;

$query = $mysqli->prepare($stmt);
$query->bind_param('s',$_GET['category']);
$query->execute();
$query_result = $query->get_result();

foreach($query_result as $row) { ?>
	<tr>
	<td> <?php echo $row['first_name'].' '.$row['last_name']; ?> </td>
	</tr>
<?php } ?>

</table>



<h3>Teachers who have rented books in category in the last 12 months:</h3>
<table border=1 frame=hsides rules=rows>

<?php

$stmt = 'SELECT DISTINCT u.user_id,u.first_name,u.last_name FROM lib_user u
	INNER JOIN all_rents_from_teachers ar ON ar.user_id = u.user_id
	INNER JOIN book_category bc ON bc.ISBN = ar.ISBN
	WHERE (bc.category_name = ?) AND (ar.start_date) >= DATE_SUB(NOW(),INTERVAL 1 YEAR);';

//echo $stmt;

$query = $mysqli->prepare($stmt);
$query->bind_param('s',$_GET['category']);
$query->execute();
$query_result = $query->get_result();

foreach($query_result as $row) { ?>
	<tr>
	<td> <?php echo $row['first_name'].' '.$row['last_name']; ?> </td>
	</tr>
<?php } ?>

</table>
