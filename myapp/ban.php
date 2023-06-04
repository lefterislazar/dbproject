<?php
session_start();
require_once "db_connect.php";

if($_SESSION['role']=='STUDENT' OR $_SESSION['role']=='TEACHER') {
	header('Location: ./main.php');
	exit();
}

if(isset($_POST['ban'])) {

$ban_stmt = $mysqli->prepare('UPDATE lib_user SET banned = 1 WHERE user_id = ?;');
$ban_stmt->bind_param("i",$_POST['user_id']);
if(!$ban_stmt->execute()) {
	header('Location: ./user_list.php?ban_failed=true');
	exit();
} else {
	header('Location: ./user_list.php?ban_failed=false');
	exit();
}
}
if(isset($_POST['unban'])) {

$ban_stmt = $mysqli->prepare('UPDATE lib_user SET banned = 0 WHERE user_id = ?;');
$ban_stmt->bind_param("i",$_POST['user_id']);
if(!$ban_stmt->execute()) {
	header('Location: ./user_list.php?unban_failed=true');
	exit();
} else {
	header('Location: ./user_list.php?unban_failed=false');
	exit();
}

}
if(isset($_POST['delete'])) {

	$has_active_rent = $mysqli->prepare('SELECT 1 from active_rent WHERE renting_user_id = ?;');
	$has_active_rent->bind_param('i',$_POST['user_id']);
	$has_active_rent->execute();
	$has_active_rent_result = $has_active_rent->get_result();


	if($has_active_rent_result->num_rows == 0){
		$ban_stmt = $mysqli->prepare('DELETE FROM lib_user WHERE user_id = ?;');
		$ban_stmt->bind_param("i",$_POST['user_id']);
		if(!$ban_stmt->execute()) {
			header('Location: ./user_list.php?del_failed=true');
			exit();
		} else {
			header('Location: ./user_list.php?del_failed=false');
			exit();
		}
	} else {
			header('Location: ./user_list.php?del_failed_by_rent=true');
			exit();
	}
}
