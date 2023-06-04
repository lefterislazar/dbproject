<?php
require_once "./db_connect.php";
session_start();

if($_SESSION['role']!='CENTRAL_ADMIN' ) {
	header('Location: ./main.php');
	exit();
} else if(!isset($_POST['school_id']) or empty($_POST['school_id'])) {
	header('Location: ./school_list.php');
	exit();
}

if(isset($_POST['edit_name']) and !empty($_POST['name'])) {
	$update = $mysqli->prepare('update school_unit set
	school_name = ? where school_id = ?;');
	$update->bind_param('si',$_POST['name'],$_POST['school_id']);
	$update->execute();
}

if(isset($_POST['edit_city']) and !empty($_POST['city'])) {
	$update = $mysqli->prepare('update school_unit set
	city = ? where school_id = ?;');
	$update->bind_param('si',$_POST['city'],$_POST['school_id']);
	$update->execute();
}

if(isset($_POST['edit_address']) and !empty($_POST['address'])) {
	$update = $mysqli->prepare('update school_unit set
	address = ? where school_id = ?;');
	$update->bind_param('si',$_POST['address'],$_POST['school_id']);
	$update->execute();
}

if(isset($_POST['edit_zip']) and !empty($_POST['zip'])) {
	$update = $mysqli->prepare('UPDATE school_unit SET
	zip_code = ? WHERE school_unit = ?;');
	$update->bind_param('ii',$_POST['zip'],$_POST['school_id']);
	$update->execute();
}

if(isset($_POST['edit_principal']) and !empty($_POST['principal'])) {

	$school_principal = $mysqli->prepare('SELECT user_id FROM principal WHERE school_id = ?;');
	$school_principal->bind_param('i',$_POST['school_id']);
	$school_principal->execute();
	$school_principal_result = $school_principal->get_result();
	$school_principal_array = $school_principal_result->fetch_assoc();

	if($school_principal_array['user_id'] != $_POST['principal']) {
		$delete = $mysqli->prepare('DELETE FROM principal WHERE user_id = ?;');
		$delete->bind_param('i',$school_principal_array['user_id']);
		$delete->execute();

		$insert = $mysqli->prepare('INSERT INTO principal VALUES
		(?,?);');
		$insert->bind_param('ii',$_POST['principal'],$_POST['school_id']);
		$insert->execute();
	}
}

if(isset($_POST['rm_phone'])) {
	$delete = $mysqli->prepare('DELETE FROM school_phone WHERE phone_number = ?;');
	$delete->bind_param('i',$_POST['rm_phone']);
	$delete->execute();
}

if(isset($_POST['add_phone']) and !empty($_POST['add_tel'])) {
	$insert = $mysqli->prepare('INSERT INTO school_phone VALUES (?,?);');
	$insert->bind_param('ii',$_POST['school_id'],$_POST['add_tel']);
	$insert->execute();
}

if(isset($_POST['rm_email'])) {
	$delete = $mysqli->prepare('DELETE FROM school_email WHERE email = ?;');
	$delete->bind_param('s',$_POST['rm_email']);
	$delete->execute();
}

if(isset($_POST['adding_email']) and !empty($_POST['add_email'])) {
	$insert = $mysqli->prepare('INSERT INTO school_email VALUES (?,?);');
	$insert->bind_param('is',$_POST['school_id'],$_POST['add_email'][0]);
	$insert->execute();
}

header('Location: ./school_page.php?edit=1&school_id='.$_POST['school_id']);
exit();
