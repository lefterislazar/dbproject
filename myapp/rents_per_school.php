<?php
include_once "header.php";
require_once "./db_connect.php";

if($_SESSION['role']!='CENTRAL_ADMIN' ) {
	header('Location: ./main.php');
	exit();
}
?>
<h2>Rentals per School</h2>
<p> Rentals in: </p>
<form action="" method="get">
  <ul>
  <li>
  <label for="year">Year:</label>
  <input type="year" id="year" name="year" size=6 />
  <button type="submit" name="year_search" >Search</button>
  </li>
  <li>
  <label for="month">Year-Month:</label>
  <input type="year" id="year_m" name="year_m" size=6 />
  <select list="months" id="month" name="month"/>
		<datalist id="months">
			<option value="" selected>--select--</option>
			<option value=1>January</option>
			<option value=2>February</option>
			<option value=3>March</option>
			<option value=4>April</option>
			<option value=5>May</option>
			<option value=6>June</option>
			<option value=7>July</option>
			<option value=8>August</option>
			<option value=9>September</option>
			<option value=10>October</option>
			<option value=11>November</option>
			<option value=12>December</option>
		</datalist>
	</select>
  <button type="submit" name="year_month_search" >Search</button>
  </li>
  </ul>
</form>



<table border=1 frame=hsides rules=rows>
  <tr>
    <td>School ID</td>
    <td>School Name</td>
		<td>Rentals</td>
  </tr>

<?php

$stmt = "SELECT school_id, school_name, count(rent_id)
FROM (
SELECT s.school_id, s.school_name, r.rent_id, u.user_id, r.start_date
FROM school_unit s LEFT JOIN lib_user u ON s.school_id = u.school_id
LEFT JOIN  (SELECT * FROM all_rent ";

if((isset($_GET['year']) and !empty($_GET['year'])) or (isset($_GET['year_m']) and !empty($_GET['year_m']))) {
	$stmt = $stmt." WHERE (year(start_date) = ?) ";
	if(isset($_GET['year_month_search']) and !empty($_GET['month'])) {
		$stmt = $stmt." AND (month(start_date) = ?) ";
	}
}



$stmt = $stmt.') r ON u.user_id = r.renting_user_id) school_rents GROUP BY school_id ORDER BY count(rent_id) DESC;';

//echo $stmt;



$query = $mysqli->prepare($stmt);
if(isset($_GET['year_search']) and !empty($_GET['year'])) {
	$query->bind_param('i',$_GET['year']);
}
if(isset($_GET['year_month_search']) and !empty($_GET['year_m'] and !empty($_GET['month']))) {
	$query->bind_param('ii',$_GET['year_m'],$_GET['month']);
}	

$query->execute();
$query_result = $query->get_result();

foreach($query_result as $row) { ?>
	<tr>
	<td> <?php echo $row['school_id']; ?> </td>
	<td> <?php echo $row['school_name']; ?> </td>
	<td> <?php echo $row['count(rent_id)']; ?> </td>
	</tr>
<?php } ?>

</table>



