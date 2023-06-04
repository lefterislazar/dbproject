<?php

include "header.php";

require_once "db_connect.php";

if($_SESSION['role']!='CENTRAL_ADMIN') {
	header('Location: ./main.php');
	exit();
}

if(isset($_GET['id'])) {
	$uid = $_GET['id'];
} else 
	$uid = $_SESSION['user_id'];

$user_info = $mysqli->prepare('SELECT * FROM central_admin WHERE user_id = ?;');
$user_info->bind_param('i',$uid);
$user_info->execute();
$user_info_result = $user_info->get_result();
$user_info_array = $user_info_result->fetch_assoc();

?>




<h2>Central Administrator Page</h2>

<?php
if(!isset($_GET['edit'])) {?>
<p> Username: <?php echo $user_info_array['username']; ?> </p>
<p> First Name: <?php echo $user_info_array['first_name']; ?> </p>
<p> Last Name: <?php echo $user_info_array['last_name']; ?> </p>
<p> Role: Central Administrator</p>

<?php
} else if(isset($_GET['edit'])){ ?>

<form action="./edit_user_handle.php" method="post">
	<p> Username: <input type="text" name="edit_username" value="<?php echo $user_info_array['username']; ?>"> 
	<?php if(isset($_GET['edit'])) { ?>
	<button type="submit" name="ch_username">Change</button>
	<input type="hidden" name="id" value="<?php echo $user_info_array['user_id']; ?>"/>
	<input type="hidden" name="central" value=1 />

	<?php }; 
	if(isset($_GET['taken_username']) AND $_GET['taken_username']==true) {
	echo '</p> <p>Username is already taken';
	}
	?>

	</p>
</form>
<form action="./edit_user_handle.php" method="post">
	<p> Password: <input type="password" name="edit_password"> 
	<?php if(isset($_GET['edit'])) { ?>
	<button type="submit" name="ch_password">Change</button>
	<input type="hidden" name="id" value="<?php echo $user_info_array['user_id']; ?>"/>
	<input type="hidden" name="central" value=1 />

	</p>
</form>
<form action="./edit_user_handle.php" method="post">
	<p> First Name: <input type="text" name="edit_first_name" value="<?php echo $user_info_array['first_name']; ?>" />
	<?php if(isset($_GET['edit'])) { ?>
	<button type="submit" name="ch_first_name">Change</button>
	<input type="hidden" name="id" value="<?php echo $user_info_array['user_id']; ?>"/>
	<input type="hidden" name="central" value=1 />
	<?php }; ?>
	</p>
</form>
<form action="./edit_user_handle.php" method="post">
	<p> Last Name: <input type="text" name="edit_last_name" value="<?php echo $user_info_array['last_name']; ?>" />
	<?php if(isset($_GET['edit'])) { ?>
	<button type="submit" name="ch_last_name">Change</button>
	<input type="hidden" name="id" value="<?php echo $user_info_array['user_id']; ?>"/>
	<input type="hidden" name="central" value=1 />
	<?php }; ?>
	</p>
</form>



<form action="./central_user_page.php" method='get'>
<?php if(isset($_GET['edit'])) {
	if(isset($_GET['id'])) { ?>
	<input type="hidden" name="id" value="<?php echo $uid;?>"/>
	<?php }; ?>
<input type="hidden" name="done" value="1"/>
<button type="submit">Done</button>
<?php }; ?>
</form>


<?php }; 

 } 

if(!isset($_GET['edit'])) {?>
<form actiom="" method="get">
	<?php
	if(isset($_GET['id'])) { ?>
	<input type="hidden" name="id" value="<?php echo $uid;?>"/>
	<?php }; ?>
	<input type="hidden" name="edit" value=1/>
<button type="submit">Edit</button>
</form>

<?php  }; 

?>
</body>
