<?php
$username = htmlspecialchars($_POST['user_name']);
$password = htmlspecialchars($_POST['password']);

require_once "./db_connect.php";

//first we check seperately for the central admin since he is in seperate table
if(isset($_POST['central']) and $_POST['central']==1) {
$username_password_stmt = $mysqli->prepare("SELECT user_id,username,password FROM central_admin WHERE username = ? ;");
$username_password_stmt->bind_param("s",$username);
$username_password_stmt->execute();
$username_password_result = $username_password_stmt->get_result();
$username_password_array = $username_password_result->fetch_assoc();

if(!empty($username_password_array)) {
  if(strcmp($password,($username_password_array['password'])) !== 0) {
		header("Location: ./index.php?wrong_pass=true");
		exit();
  } else {
		session_start();
		$_SESSION['user_id'] = $username_password_array['user_id'];
		$_SESSION['username'] = $username;
		$_SESSION['school_id'] = 0; 
		$_SESSION['role'] = 'CENTRAL_ADMIN';
		header("Location: ./main.php");
		exit();
  }  
}
}

// INSERT THE NEEDED PAGES


//now for other roles
$username_password_stmt = $mysqli->prepare("SELECT user_id,username,password,school_id FROM lib_user WHERE username = ? ;");
$username_password_stmt->bind_param("s",$username);
$username_password_stmt->execute();
$username_password_result = $username_password_stmt->get_result();
$username_password_array = $username_password_result->fetch_assoc();
if(empty($username_password_array)) {
  header('Location: ./index.php?no_user=true');
  exit();
}

if(strcmp($password,($username_password_array['password'])) !== 0) {
  header("Location: ./index.php?wrong_pass=true");
  exit();
}


$user_role = $mysqli->prepare("SELECT * FROM user_role WHERE user_id = ? ;");
$user_role->bind_param("s",$username_password_array['user_id']);
$user_role->execute();
$user_role_result = $user_role->get_result();
$user_role_array = $user_role_result->fetch_assoc();


session_start();
$_SESSION['user_id'] = $user_role_array['user_id'];
$_SESSION['username'] = $username;
$_SESSION['school_id'] = $user_role_array['school_id']; 
$_SESSION['role'] = $user_role_array['role'];
if (strcmp($_SESSION['role'], 'LIB_ADMIN') === 0 OR
strcmp($_SESSION['role'], 'TEACHER') ===  0 OR
strcmp($_SESSION['role'], "STUDENT") === 0) {
  header("Location: ./main.php");
  exit();
}


