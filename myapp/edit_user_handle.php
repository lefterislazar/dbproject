<?php
session_start();
require_once "db_connect.php";

if($_SESSION['role']=='STUDENT' OR $_SESSION['role']=='TEACHER') {
	$admin = false;
	$include_id = '';
} else {
	$admin = true;
	$include_id = 'id='.$_POST['id'];
}

if($_SESSION['role']=='STUDENT') {
	header('Location: ./main.php');
	exit();
}


if($_SESSION['role']=='CENTRAL_ADMIN' and isset($_POST['central']) and $_POST['central'] == 1) {

	if(isset($_POST['ch_username'])) {
		$username = $_POST['edit_username'];
		$username_uniqueness_query = $mysqli->prepare("SELECT username FROM central_admin WHERE username = ?;");
		$username_uniqueness_query->bind_param("s",$username);
		$username_uniqueness_query->execute();
		$unique_result = $username_uniqueness_query->get_result();
		$unique_array = $unique_result->fetch_assoc();

			if($unique_result->num_rows != 0) {
				header('Location: ./central_user_page.php?edit=1&'.$include_id.'&taken_username=true');
				exit();
			}
	$change = $mysqli->prepare('UPDATE central_admin SET username = ? WHERE user_id = ?;');
	$change->bind_param("si",$mysqli->real_escape_string($_POST['edit_username']),$_POST['id']);
	$change->execute();

	header('Location: ./central_user_page.php?edit=1&'.$include_id);
	exit();
	}

	if(isset($_POST['ch_password'])) {

	$change = $mysqli->prepare('UPDATE central_admin SET password = ? WHERE user_id = ?;');
	$change->bind_param("si",$mysqli->real_escape_string($_POST['edit_password']),$_POST['id']);
	$change->execute();

	header('Location: ./central_user_page.php?edit=1&'.$include_id);
	exit();
	}
	if(isset($_POST['ch_first_name'])) {

	$change = $mysqli->prepare('UPDATE central_admin SET first_name = ? WHERE user_id = ?;');
	$change->bind_param("si",$mysqli->real_escape_string($_POST['edit_first_name']),$_POST['id']);
	$change->execute();

	header('Location: ./central_user_page.php?edit=1&'.$include_id);
	exit();
	}

	if(isset($_POST['ch_last_name'])) {

	$change = $mysqli->prepare('UPDATE central_admin SET last_name = ? WHERE user_id = ?;');
	$change->bind_param("si",$mysqli->real_escape_string($_POST['edit_last_name']),$_POST['id']);
	$change->execute();

	header('Location: ./central_user_page.php?edit=1&'.$include_id);
	exit();
	}

}

if(isset($_POST['ch_username'])) {

//test that username does not exist
	$username_uniqueness_query = $mysqli->prepare("SELECT username FROM pending_lib_user WHERE username = ? UNION ALL SELECT username FROM lib_user WHERE username = ?;");
	$username_uniqueness_query->bind_param("ss",$mysqli->real_escape_string($_POST['edit_username']),$mysqli->real_escape_string($_POST['edit_username']));
	$username_uniqueness_query->execute();
	$unique_result = ($username_uniqueness_query->get_result())->fetch_assoc();

	if(!empty($unique_result)) {
		header('Location: ./user_page.php?edit=1&'.$include_id.'&taken_username=true');
		exit();
	}


$change = $mysqli->prepare('UPDATE lib_user SET username = ? WHERE user_id = ?;');
$change->bind_param("si",$mysqli->real_escape_string($_POST['edit_username']),$_POST['id']);
$change->execute();

header('Location: ./user_page.php?edit=1&'.$include_id);
exit();
}


if(isset($_POST['ch_password'])) {

$change = $mysqli->prepare('UPDATE lib_user SET password = ? WHERE user_id = ?;');
$change->bind_param("si",$mysqli->real_escape_string($_POST['edit_password']),$_POST['id']);
$change->execute();

header('Location: ./user_page.php?edit=1&'.$include_id);
exit();
}

if(isset($_POST['ch_first_name'])) {

$change = $mysqli->prepare('UPDATE lib_user SET first_name = ? WHERE user_id = ?;');
$change->bind_param("si",$mysqli->real_escape_string($_POST['edit_first_name']),$_POST['id']);
$change->execute();

header('Location: ./user_page.php?edit=1&'.$include_id);
exit();
}

if(isset($_POST['ch_last_name'])) {

$change = $mysqli->prepare('UPDATE lib_user SET last_name = ? WHERE user_id = ?;');
$change->bind_param("si",$mysqli->real_escape_string($_POST['edit_last_name']),$_POST['id']);
$change->execute();

header('Location: ./user_page.php?edit=1&'.$include_id);
exit();
}

if(isset($_POST['ch_birth_date'])) {

$change = $mysqli->prepare('UPDATE teacher SET birth_date = ? WHERE user_id = ?;');
$change->bind_param("si",$mysqli->real_escape_string($_POST['edit_birth_date']),$_POST['id']);
$change->execute();

header('Location: ./user_page.php?edit=1&'.$include_id);
exit();
}
