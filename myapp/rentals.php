<?php
include_once "header.php";
require_once "db_connect.php";

if($_SESSION['role']=='STUDENT' OR $_SESSION['role']=='TEACHER') {
	$admin = false;
} else 
	$admin = true;
?>


<h2><?php if(!$admin) echo 'My '; ?>Rentals</h2>
<h3>Active rentals:</h3>

<?php
if(isset($_GET['late_only'])) {
  ?>
	<form action="./rentals.php" method="post">
		<button type="submit">Show all rentals</button>
	</form>
  <?php
}	else { ?>
	<form action="" method="get">
		<button type="submit" name='late_only' value='late_only'>Show late rentals only</button>
	</form>
	<?php
}



if($admin) { ?>
<form action="" method="post">
  <label for="user_search">Search by username:</label>
  <input type="search" id="user_search" name="user_search"/>
  <button type="submit">Search</button>
  <button type="submit" name='clear' value='clear'>Clear search</button>
</form>
<form action="" method="post">
  <label for="first_search" >Search by first name:</label>
  <input type="search" id="first_search" name="first_search"/>
  <button type="submit">Search</button>
  <button type="submit" name='clear' value='clear'>Clear search</button>
</form>
<form action="" method="post">
  <label for="last_search" >Search by last name:</label>
  <input type="search" id="last_search" name="last_search"/>
  <button type="submit">Search</button>
  <button type="submit" name='clear' value='clear'>Clear search</button>
</form>
<form action="" method="post">
  <label for="days_search" >Search by days late:</label>
  <input type="search" id="days_search" name="days_search"/>
  <button type="submit">Search</button>
  <button type="submit" name='clear' value='clear'>Clear search</button>
</form>
<?php

};

	//add user search to stmt if there is a search
	$stmt = "SELECT *  FROM rent_full_data WHERE school_id = ?";

	if(((!isset($_POST['user_search']) and !isset($_POST['first_search']) and !isset($_POST['last_search']) and !isset($_POST['days_search'])) OR isset($_POST['clear'])) AND $admin) {
		;
	}	else if(!$admin) {
		$stmt = $stmt." AND renting_user_id = ?";
	} else if(isset($_POST['user_search']) and !empty($_POST['user_search'])) {
		$stmt = $stmt." AND username LIKE '%".$mysqli->real_escape_string($_POST['user_search'])."%'";
	} else if(isset($_POST['first_search']) and !empty($_POST['first_search'])){
		$stmt = $stmt." AND first_name LIKE '%".$mysqli->real_escape_string($_POST['first_search'])."%'";
	} else if(isset($_POST['last_search']) and !empty($_POST['last_search'])){
		$stmt = $stmt." AND last_name LIKE '%".$mysqli->real_escape_string($_POST['last_search'])."%'";
	} else if(isset($_POST['days_search']) and !empty($_POST['days_search'])){
		$stmt = $stmt." AND late_by = ".$mysqli->real_escape_string($_POST['days_search']);
	}
	if(isset($_GET['late_only'])) {
		$stmt = $stmt." AND late_by > 0;";
	} else 
		$stmt = $stmt.';';

 //echo $stmt;
	$existing_rents_stmt = $mysqli->prepare($stmt);
	if($admin) {
		$existing_rents_stmt->bind_param("i",$_SESSION['school_id']);
	}	else if(!$admin) {
		$existing_rents_stmt->bind_param("ii",$_SESSION['school_id'],$_SESSION['user_id']);
	}  
	$existing_rents_stmt->execute();
	$existing_rents_result = $existing_rents_stmt->get_result();
  $existing_rents_array = $existing_rents_result->fetch_assoc();

if (isset($_GET['return_success'])) {
  if($_GET['return_success']) {
    echo "Book returned";
  } else {
    echo "Book return failed";
  }
}


?>

<table border=1 frame=hsides rules=rows>
<tr>
  <td></td>
  <td>Book</td>
  <td>Username</td>
  <td>Start Date</td>
<tr/>
<?php

foreach ($existing_rents_result as $row) {?>
<tr>
	<?php 
	if($admin) { ?>
  <td>
  <form action="./return_rental_handle.php" method="post">
	<?php
		
	
	
	if(!isset($rent_button)) {
		$return_button = "Returned";
		$return_button_disable = "";
	}
	
	?>

  <button type="submit" name="Returned" value="returned" <?php echo $return_button_disable; ?> ><?php echo $return_button;?></button>
	<?php }
	?>
  <!--<button type="submit" name ="delete" value="delete">Delete</button>-->
  <input type="hidden" name="rent_id" value="<?php echo $row['rent_id']; ?>">
  </form>
  </td>
  <td> <?php echo $row['book_title']; ?></td>
  <td> <a href="./user_page.php?id=<?php echo $row['renting_user_id'];?>"/> <?php echo $row['username']; ?> </td>
  <td> <?php echo $row['start_date']; ?></td>
  <?php if($row['late_by']>0) echo '<td> Late by '.$row['late_by'].' days</td>'; ?>

  
</tr> 

<?php }; 
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
?>
</table>



<h3>Past rentals:</h3>
<?php

	//add user search to stmt if there is a search
	$stmt = "SELECT *  FROM past_rent_full_data WHERE school_id = ?";

	if((!isset($_POST['user_search']) OR isset($_POST['clear'])) AND $admin) {
		;
	}	else if(!$admin) {
		$stmt = $stmt." AND renting_user_id = ?";
	} else {
		$stmt = $stmt." AND username LIKE ?";
	}
	if(isset($_GET['late_only'])) {
		$stmt = $stmt." AND return_date > ADDDATE(start_date, INTERVAL 1 WEEK);";
	} else 
	if(isset($_POST['days_search']) and !empty($_POST['days_search'])) {
		$stmt = $stmt." AND return_date = ADDDATE(start_date, INTERVAL ".$_POST['days_search']."+7 DAY);";
	} else 
		$stmt = $stmt.';';

	//echo $stmt;
	$past_rents_stmt = $mysqli->prepare($stmt);
	if((!isset($_POST['user_search']) OR isset($_POST['clear'])) AND $admin) {
		$past_rents_stmt->bind_param("i",$_SESSION['school_id']);
	}	else if(!$admin) {
		$past_rents_stmt->bind_param("ii",$_SESSION['school_id'],$_SESSION['user_id']);
	} else {
		$search_term = '%'.$_POST['user_search'].'%';
		$past_rents_stmt->bind_param("is",$_SESSION['school_id'],$search_term);
	}
  $past_rents_stmt->execute();
	$past_rents_result = $past_rents_stmt->get_result();
  $past_rents_array = $past_rents_result->fetch_assoc();

if (isset($_GET['return_success'])) {
  if($_GET['return_success']) {
    echo "Book returned";
  } else {
    echo "Book return failed";
  }
}


?>

<table border=1 frame=hsides rules=rows>
<tr>
  <td></td>
  <td>Book</td>
  <td>Username</td>
  <td>Start Date</td>
  <td>Return Date</td>
<tr/>
<?php

foreach ($past_rents_result as $row) {?>
<tr>
  <td>
	<?php
		?>

	<?php
	?>
 <!--</form>-->
  </td>
  <td> <?php echo $row['book_title']; ?></td>
  <td> <?php echo $row['username']; ?> </td>
  <td> <?php echo $row['start_date']; ?></td>
  <td> <?php echo $row['return_date']; ?></td>
 <!-- <?php if($row['late']==1) echo '<td> Late </td>'; ?>-->
</form>
  </td>
</tr> 
<?php }; ?>
</body>
