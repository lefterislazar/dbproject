<?php
$username = htmlspecialchars($_POST['user_name']);
$password = htmlspecialchars($_POST['password']);
$first_name = htmlspecialchars($_POST['first_name']);
$last_name = htmlspecialchars($_POST['last_name']);
$birth_date = $_POST['birth_date'];
$role = strtoupper(htmlspecialchars($_POST['role']));
$school_id = htmlspecialchars($_POST['school_pick']);

if(!isset($_POST['age']) AND $role === 'Teacher') {
header('Location: ./index.php?no_age=true');
  exit();
}
require_once "./db_connect.php";
//test that there is no lib_admin
if($role == 'LIBRARY ADMIN') {
	$admin_uniqueness_query = $mysqli->prepare("SELECT user_id FROM lib_admin WHERE school_id = ?;");
	$admin_uniqueness_query->bind_param("i",$school_id);
	$admin_uniqueness_query->execute();
	$admin_unique_result = $admin_uniqueness_query->get_result();
	$admin_unique_array = $admin_unique_result->fetch_assoc();

	if($admin_unique_result->num_rows != 0) {
		header('location: ./index.php?already_admin=true');
		exit();
	}
}
//test that username does not exist
$username_uniqueness_query = $mysqli->prepare("SELECT username FROM pending_lib_user WHERE username = ? UNION ALL SELECT username FROM lib_user WHERE username = ? UNION ALL SELECT username FROM central_admin WHERE username = ?;");
$username_uniqueness_query->bind_param("sss",$username,$username,$username);
$username_uniqueness_query->execute();
$unique_result = $username_uniqueness_query->get_result();
$unique_array = $unique_result->fetch_assoc();

if(!empty($unique_array)) {
	header('location: ./index.php?taken_username=true');
  exit();
}

$stmt = $mysqli->prepare("INSERT INTO pending_lib_user(username,password,first_name,last_name,birth_date,role,school_id) VALUES (?,?,?,?,?,?,?);");

$stmt->bind_param("ssssssi",$mysqli->real_escape_string($username),$mysqli->real_escape_string($password),$mysqli->real_escape_string($first_name),$mysqli->real_escape_string($last_name),$birth_date,$mysqli->real_escape_string($role),$school_id);
$executionfailed = $stmt->execute();

if(!$executionfailed) {
  header('Location: ./index.php?su_success=false');
  exit();
}
else {
  header('Location: ./index.php?su_success=true');
  exit();
}
