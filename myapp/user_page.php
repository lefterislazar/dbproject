<?php

include "header.php";

require_once "db_connect.php";

if($_SESSION['role']=='STUDENT' OR $_SESSION['role']=='TEACHER') {
	$admin = false;
} else 
	$admin = true;

if(!$admin AND isset($_GET['id'])) {
	header('Location: ./main.php');
	exit();
}

if(isset($_GET['id'])) {
	$uid = $_GET['id'];
} else {
	$uid = $_SESSION['user_id'];
}
	$user_info = $mysqli->prepare('SELECT * FROM user_page_info WHERE user_id = ?;');
	$user_info->bind_param('i',$uid);
	$user_info->execute();
	$user_info_result = $user_info->get_result();
	$user_info_array = $user_info_result->fetch_assoc();

?>




<h2> <?php if(isset($_GET['id']) AND $_GET['id'] != $_SESSION['user_id']) echo $user_info_array['username']."'s ";?> User Page</h2>

<?php
if(!isset($_GET['edit']) OR $_SESSION['role']=='STUDENT') {?>
<p> Username: <?php echo $user_info_array['username']; ?> </p>
<p> First Name: <?php echo $user_info_array['first_name']; ?> </p>
<p> Last Name: <?php echo $user_info_array['last_name']; ?> </p>
<p> Role: <?php echo $user_info_array['role']; ?></p> <?php
if($user_info_array['role']!='STUDENT') { ?>
<p> Date of birth: <?php echo $user_info_array['birth_date']; ?></p>
<?php } ?>
<p> Renting: <?php echo $user_info_array['renting']; ?></p>
<p> Reserving: <?php echo $user_info_array['reserving']; ?></p>

<?php
	
} else if(isset($_GET['edit']) AND $_SESSION['role']!='STUDENT'){ ?>

	<?php if(!isset($_GET['id'])) { ?>
<form action="./edit_user_handle.php" method="post">
	<p> Username: <input type="text" name="edit_username" value="<?php echo $user_info_array['username']; ?>"> 
	<?php if(isset($_GET['edit'])) { ?>
	<button type="submit" name="ch_username">Change</button>
	<input type="hidden" name="id" value="<?php echo $user_info_array['user_id']; ?>"/>

	<?php }; 
	if(isset($_GET['taken_username']) AND $_GET['taken_username']==true) {
	echo '</p> <p>Username is already taken';
	}
	?>

	</p>
</form>
	<?php }; ?>
<form action="./edit_user_handle.php" method="post">
	<?php if(!isset($_GET['id']) or $_GET['id'] == $_SESSION['user_id']) { ?>
	<p> Password: <input type="password" name="edit_password"> 
	<?php if(isset($_GET['edit'])) { ?>
	<button type="submit" name="ch_password">Change</button>
	<input type="hidden" name="id" value="<?php echo $user_info_array['user_id']; ?>"/>
	<?php }; ?>
	</p>
</form>
	<?php }; ?>
<form action="./edit_user_handle.php" method="post">
	<p> First Name: <input type="text" name="edit_first_name" value="<?php echo $user_info_array['first_name']; ?>" />
	<?php if(isset($_GET['edit'])) { ?>
	<button type="submit" name="ch_first_name">Change</button>
	<input type="hidden" name="id" value="<?php echo $user_info_array['user_id']; ?>"/>
	<?php }; ?>
	</p>
</form>
<form action="./edit_user_handle.php" method="post">
	<p> Last Name: <input type="text" name="edit_last_name" value="<?php echo $user_info_array['last_name']; ?>" />
	<?php if(isset($_GET['edit'])) { ?>
	<button type="submit" name="ch_last_name">Change</button>
	<input type="hidden" name="id" value="<?php echo $user_info_array['user_id']; ?>"/>
	<?php }; ?>
	</p>
</form>


<p> Role: <?php echo $user_info_array['role']; ?></p>
	<?php
	if($user_info_array['role']!='STUDENT') { ?>
<form action="./edit_user_handle.php" method="post">
	<p> Date of birth: <input type="date" name="edit_birth_date" value="<?php echo $user_info_array['birth_date']; ?>" /> 
	<?php if(isset($_GET['edit'])) { ?>
	<button type="submit" name="ch_birth_date">Change</button>
	<input type="hidden" name="id" value="<?php echo $user_info_array['user_id']; ?>"/>
	<?php }; ?>
<?php } ?>
	</p>
</form>
<p> Renting: <?php echo $user_info_array['renting']; ?></p>
<p> Reserving: <?php echo $user_info_array['reserving']; ?></p>


<form action="./user_page.php" method='get'>
<?php if(isset($_GET['edit'])) {
	if(isset($_GET['id'])) { ?>
	<input type="hidden" name="id" value="<?php echo $uid;?>"/>
	<?php }; ?>
<input type="hidden" name="done" value="1"/>
<button type="submit">Done</button>
<?php }; ?>
</form>


<?php  } 

if($_SESSION['role']=='STUDENT' AND !isset($_GET['edit'])) { ?>
<form action="./edit_user_handle.php" method="post">
	<p> Change Password: <input type="password" name="edit_password"> 
	<button type="submit" name="ch_password">Change</button>
	<input type="hidden" name="id" value="<?php echo $user_info_array['user_id']; ?>"/>

	</p>
</form>
<?php } 

if($_SESSION['role']!='STUDENT' AND !isset($_GET['edit'])) {?>
<form actiom="" method="get">
	<?php
	if(isset($_GET['id'])) { ?>
	<input type="hidden" name="id" value="<?php echo $uid;?>"/>
	<?php }; ?>
	<input type="hidden" name="edit" value=1/>
<button type="submit">Edit</button>
</form>

<?php  }; 

if($admin and $_SESSION['role']!='CENTRAL_ADMIN') { ?>
	<form action="./user_card.php" method="post">
		<input type="hidden" name="first_name" value="<?php echo $user_info_array['first_name'];?>"/>
		<input type="hidden" name="last_name" value="<?php echo $user_info_array['last_name']?>"/>
		<input type="hidden" name="username" value="<?php echo $user_info_array['username']?>"/>
		<button type="submit">Print user card</button>
	</form>
<?php }
?>
