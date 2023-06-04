<?php
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
$mysqli = new mysqli("127.0.0.1", "root", "", "dbproject", 3306);

if($mysqli->connect_errno) {
	printf("Connect failed: %s\n", $mysqli->connect_error);
	die();
}

// banned users should not have access to db
if(isset($_SESSION['user_id'])) {
	$banned = $mysqli->prepare('SELECT banned FROM lib_user WHERE user_id = ?;');
	$banned->bind_param("i",$_SESSION['user_id']);
	$banned->execute();
	$banned_result = $banned->get_result();
	$banned_array = $banned_result->fetch_assoc();

	if(isset($banned_array['banned']) and $banned_array['banned']) {
		header('Location: ./logout_handle.php?banned=1');
		exit();
	}
}

