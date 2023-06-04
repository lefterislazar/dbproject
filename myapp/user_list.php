<?php


include_once "header.php";
require_once "./db_connect.php";

if($_SESSION['role']=='STUDENT' OR $_SESSION['role']=='TEACHER') {
	header('Location: ./main.php');
	exit();
} 
?>

<h2>Users List</h2>


<form action="" method="post">
  <ul>
  <li>
  <label for="username">Search by username:</label>
  <input type="search" id="username" name="username_search"/>
  <button type="submit">Search</button>
	<button type="submit" name='clear' value='clear'>Clear search</button>
  </li>
	<?php
	if(!isset($_POST['late']) and $_SESSION['role']!='CENTRAL_ADMIN') { ?>
	<li>
		<button type="submit" name="late" value="late">Show users with late rentals</button>
	</li>
		<?php } else if ($_SESSION['role']!='CENTRAL_ADMIN'){ ?>
	<li>
		<button type="submit" name="all" value="all">Show all users</button>
	</li>
	<?php
	};?>
	
  </ul>
</form>

<?php

$stmt = "SELECT *  FROM lib_user INNER JOIN user_role ON lib_user.user_id = user_role.user_id";
if($_SESSION['role']=='LIB_ADMIN') {
	$stmt = $stmt." WHERE lib_user.school_id = ?";
}

if(isset($_POST['late'])) {
	if($_SESSION['role']!=='LIB_ADMIN') {
		$stmt = $stmt." WHERE 1";
	}
	$stmt = $stmt.' AND lib_user.user_id IN (SELECT rent_user_id FROM late_rent)';
}
if(isset($_POST['username_search']) AND !isset($_POST['clear'])) {
	if($_POST['username_search'] !== "") {
		if(!isset($_POST['late']) and $_SESSION['role']!=='LIB_ADMIN') {
			$stmt = $stmt." WHERE 1";
		}
		$stmt = $stmt.' AND lib_user.username LIKE ?';
	}
}

$stmt = $stmt.';';
//echo $stmt;

$users_stmt = $mysqli->prepare($stmt);

if(!isset($_POST['username_search']) OR $_POST['username_search'] == "" OR isset($_POST['clear'])) {
	if($_SESSION['role']=='LIB_ADMIN') {
		$users_stmt->bind_param("i",$_SESSION['school_id']);
	}
}	else {
	$search_term = '%'.$_POST['username_search'].'%';
	if($_SESSION['role']=='LIB_ADMIN') {
		$users_stmt->bind_param("is",$_SESSION['school_id'],$search_term);
	} else
		$users_stmt->bind_param("s",$search_term);
}
$users_stmt->execute();
$users_result = $users_stmt->get_result();
$users_array = $users_result->fetch_assoc();


if(isset($_GET['ban_failed'])) {
	if(!$_GET['ban_failed']) {
		echo "Ban failed";
	} else
		echo "User banned";
}
if(isset($_GET['unban_failed'])) {
	if(!$_GET['unban_failed']) {
		echo "Unban failed";
	} else
		echo "User unbanned";
}
if(isset($_GET['del_failed'])) {
	if(!$_GET['del_failed']) {
		echo "Del failed";
	} else
		echo "User deleted";
} else if(isset($_GET['del_failed_by_rent'])) {
		echo "Del failed, user has a rental that he has not yet returned";
	}
?>

<table border=1 frame=hsides rules=rows>
<tr>
  <td></td>
  <td>Username</td>
  <td>Name</td>
  <td>Role</td>
  <td>Renting</td>
  <td>Reserving</td>
	
<tr/>
<?php

foreach ($users_result as $row) {?>
<tr>
  <td>
	<form action="./ban.php" method="post">
		<input type="hidden" name="user_id" value="<?php echo $row['user_id'];?>"/>
		<?php
	if($_SESSION['role']!='CENTRAL_ADMIN') {
		if($row['banned']) { ?>
		<button type="submit" name="unban" value="1">Unban</button>
		<?php
		} else {?>
			<button type="submit" name="ban" value="1">Ban</button>
		<?php
		}
		 ?>
		<button type="submit" name="delete" value="1">Delete User account</button>
		<?php } ?>
	</form>
  </td>
  <td> <a href="./user_page.php?id=<?php echo $row['user_id'];?>" ><?php echo $row['username']; ?></td>
  <td> <?php echo $row['first_name'].' '.$row['last_name']; ?></a> </td>
  <td> <?php echo $row['role']; ?></td>
  <td> <?php echo $row['renting']; ?></td>
  <td> <?php echo $row['reserving']; ?></td>
  <td> <?php if($row['banned']) echo 'BANNED'; ?></td>
</tr> 

<?php }; 
?>
</table>
