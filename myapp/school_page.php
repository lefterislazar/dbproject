<?php
include_once "header.php";
require_once "./db_connect.php";

if($_SESSION['role']!='CENTRAL_ADMIN' ) {
	header('Location: ./main.php');
	exit();
} else if(!isset($_GET['school_id']) or empty($_GET['school_id'])) {
	header('Location: ./school_list.php');
	exit();
} else {
	$school_info = $mysqli->prepare('SELECT * FROM school_unit WHERE school_id = ?;');
	$school_info->bind_param('i',$_GET['school_id']);
	$school_info->execute();
	$school_info_result = $school_info->get_result();
	$school_info_array = $school_info_result->fetch_assoc();

	$school_principal = $mysqli->prepare('SELECT * FROM principal_full_data WHERE school_id = ?;');
	$school_principal->bind_param('i',$_GET['school_id']);
	$school_principal->execute();
	$school_principal_result = $school_principal->get_result();
	$school_principal_array = $school_principal_result->fetch_assoc();

	$school_phones = $mysqli->prepare('SELECT phone_number FROM school_phone WHERE school_id = ?;');
	$school_phones->bind_param('i',$_GET['school_id']);
	$school_phones->execute();
	$school_phones_result = $school_phones->get_result();
	$school_phones_array = $school_phones_result->fetch_assoc();

	$school_emails = $mysqli->prepare('SELECT email FROM school_email WHERE school_id = ?;');
	$school_emails->bind_param('i',$_GET['school_id']);
	$school_emails->execute();
	$school_emails_result = $school_emails->get_result();
	$school_emails_array = $school_emails_result->fetch_assoc();
}

?>


<?php
if(!isset($_GET['edit'])) { ?>
	<h2><?php echo $school_info_array['school_name']; ?></h2>
	<p>School ID: <?php echo $_GET['school_id']; ?></p>
	<p>City: <?php echo $school_info_array['city']; ?></p>
	<p>Address: <?php echo $school_info_array['address']; ?></p>
	<p>Zip code: <?php echo $school_info_array['zip_code']; ?></p>
	<p>Principal: 
	<?php
	if(empty($school_principal_array))
		echo "No principal set"; 
	else {
		echo '<a href="./user_page.php?id='.$school_principal_array['user_id'].'" >'.
		$school_principal_array['last_name'].' '.$school_principal_array['first_name'].'</a>';
	}
	?>
	</p>
	<p>Phone Number: <br>
		<?php
		foreach($school_phones_result as $row)	{
			echo $row['phone_number'].'<br>';
		} ?>
	</p>
	<p>Email: <br>
		<?php
		foreach($school_emails_result as $row)	{
			echo $row['email'].'<br>';
		} ?>
	</p>

	<?php
} else { 
	//Find teachers that can be set as principals
	$school_teachers = $mysqli->prepare('SELECT user_id,first_name,last_name FROM school_teachers WHERE school_id = ?;');
	$school_teachers->bind_param('i',$_GET['school_id']);
	$school_teachers->execute();
	$school_teachers_result = $school_teachers->get_result();
	$school_teachers_array = $school_teachers_result->fetch_assoc();
	
	?>
	<form action="./edit_school_handle.php" method="post">
	<input type='hidden' name='school_id' value="<?php echo $_GET['school_id']; ?>"/>

	<h2><input type="text" id='name' name='name'
	value='<?php echo $school_info_array['school_name']; ?>'>
	<button type="submit" name="edit_name">Change</button>
	</h2>

	<p>School ID: <?php echo $_GET['school_id']; ?></p>
	<p>City: 
	<input type="text" id='city' name='city'
	value='<?php echo $school_info_array['city']; ?>'>
	<button type="submit" name="edit_city">Change</button>
	</p>
	<p>Address: 
	<input type="text" id='address' name='address'
	value='<?php echo $school_info_array['address']; ?>'>
	<button type="submit" name="edit_address">Change</button>
	</p>
	<p>Zip code: 
	<input type="text" id='zip' name='zip'
	value='<?php echo $school_info_array['zip_code']; ?>'>
	<button type="submit" name="edit_zip">Change</button>
	</p>
	<p>Principal: 
	<select type="search" lsit="teacher_list" id='principal' name='principal'
	<?php
	if($school_principal_result->num_rows != 0) {?>
	value='<?php echo $school_principal_array['user_id']; ?>'
	<?php } ?>
	> 

		<?php
		foreach($school_teachers_result as $row)	{ ?>
			<option value='<?php echo $row['user_id']; ?>' <?php
			if($school_principal_result->num_rows != 0 and $row['user_id'] == $school_principal_array['user_id'])
				echo 'selected';
			?>
			>
			<?php
			echo $row['first_name'].' '.$row['last_name'].'<br>';
			?>
			</option>
		<?php
		} ?>
	</select>
	<button type="submit" name="edit_principal">Change</button>

	<p>Phone Number: <br>
		<?php
		foreach($school_phones_result as $row)	{
			echo $row['phone_number']; ?>
			<button type="submit" name="rm_phone"
			value="<?php echo $row['phone_number'];?>">
			Remove</button> <br>
			<?php
		} ?>

	<input type="tel" id="add_phone" name="add_tel" minlength=10 maxlength=10 placeholder='10 digit number'/>	
	<button type="submit" name="add_phone">Add phone number</button>
	</p>

	<p>Email: <br>
		<?php
		foreach($school_emails_result as $row)	{
			echo $row['email']; ?>
			<button type="submit" name="rm_email"
			value="<?php echo $row['email'];?>">
			Remove</button> <br>
			<?php
		} ?>
	<input type="email" id="add_email" name="add_email[]">	
	<button type="submit" name="adding_email">Add email</button>
	</p>
	</form>
	<?php
}


if(!isset($_GET['edit'])) {?>
<form actiom="./school_page.php" method="get">
	<input type="hidden" name="school_id" value="<?php echo $_GET['school_id'];?>"/>
<input type="hidden" name="edit" value="1"/>
<button type="submit">Edit</button>
</form>
<?php }; ?>

<form action="./school_page.php" method='get'>
<?php if(isset($_GET['edit'])) {
	?>
	<input type="hidden" name="school_id" value="<?php echo $_GET['school_id'];?>"/>
	
<input type="hidden" name="done" value="1"/>
<button type="submit">Done</button>
<?php }; ?>
</form>
