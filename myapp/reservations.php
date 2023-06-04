<?php
include_once "header.php";
require_once "db_connect.php";

if($_SESSION['role']=='STUDENT' OR $_SESSION['role']=='TEACHER') {
	$admin = false;
} else 
	$admin = true;
?>


<h2><?php if(!$admin) echo 'My '; ?>Reservations</h2>

<?php
if($admin) { ?>
<p>You can accept reservations out of order as long as there are enough copies so those that reserve sooner will have a copy available </p>


<form action="" method="post">
  <label for="user_search">Search by username:</label>
  <input type="search" id="user_search" name="user_search"/>
  <button type="submit">Search</button>
  <button type="submit" name='clear' value='clear'>Clear search</button>
</form>
<?php
} 

	//add user search to stmt if there is a search
	$stmt1 = "SELECT * FROM reservation_full_data WHERE school_id = ?";
	$stmt2 = " ORDER BY ISBN,submission_date; ";
	if((!isset($_POST['user_search']) OR isset($_POST['clear'])) AND $admin) {
		$stmt = $stmt1.$stmt2;
	}	else if(!$admin) {
		$stmt = $stmt1." AND user_id = ?".$stmt2;
	} else {
		$stmt = $stmt1." AND username LIKE ?".$stmt2;
	}


	$existing_reservers_stmt = $mysqli->prepare($stmt);
	if((!isset($_POST['user_search']) OR isset($_POST['clear'])) AND $admin) {
		$existing_reservers_stmt->bind_param("i",$_SESSION['school_id']);
	}	else if(!$admin) {
		$existing_reservers_stmt->bind_param("ii",$_SESSION['school_id'],$_SESSION['user_id']);
	} else {
		$search_term = '%'.$_POST['user_search'].'%';
		$existing_reservers_stmt->bind_param("is",$_SESSION['school_id'],$search_term);
	}
  $existing_reservers_stmt->execute();
	$existing_reservers_result = $existing_reservers_stmt->get_result();
  $existing_reservers_array = $existing_reservers_result->fetch_assoc();

	if (isset($_GET['rent_success'])) {
		if($_GET['rent_success']) {
			echo "Rent activated";
		} else {
			echo "Rent failed";
		}
	}

	if (isset($_GET['del_success'])) {
		if($_GET['del_success']) {
			echo "Reservation deleted";
		} else {
			echo "Reservation deletion failed";
		}
	}

?>

<table border=1 frame=hsides rules=rows>
<tr>
  <td></td>
  <td>Book Name</td>
  <td>ISBN</td>
  <td>Username</td>
  <td>Date</td>
  <td>Available Copies</td>
<tr/>
<?php

foreach ($existing_reservers_result as $row) {?>
<tr>
  <td>
  <form action="./reserv_to_active.php" method="post">
	<?php
		if($row['reserv_order'] <= $row['available_copies']) {
		if($row['late'] == 1) {
			$rent_button = "Awaiting late return";
			$rent_button_disable = "disabled";
		} else {

			if(($row['role'] == 'STUDENT' AND $row['renting'] > 1) OR
				 (($row['role'] == 'TEACHER' OR $row['role'] == 'LIB_ADMIN') AND $row['renting'] > 0)) {
			
				$rent_button = "Rent limit reached";
				$rent_button_disable = "disabled";
			}else {
				$rent_button = "Rent";
				$rent_button_disable = "";
		} 
		}
	
	if($admin) {
	?>

  <button type="submit" name="rent" value="rent" <?php echo $rent_button_disable; ?> ><?php echo $rent_button;?></button>
	<?php
	};
	}
	?>
  <button type="submit" name ="delete" value="delete">Delete</button>
  <input type="hidden" name="reservation_id" value="<?php echo $row['reservation_id']; ?>">
  </form>
  </td>
  <td> <?php echo $row['book_title']; ?></td>
  <td> <?php echo $row['ISBN']; ?></td>
  <td> <?php echo $row['username']; ?> </td>
  <td> <?php echo $row['submission_date']; ?></td>
  <td> <?php echo $row['available_copies']; ?></td>
  <td>
</form>
  </td>
</tr> 
<?php }; ?>
