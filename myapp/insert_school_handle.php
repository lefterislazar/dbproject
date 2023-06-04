<?php
require_once "./db_connect.php";
session_start();

if($_SESSION['role']!='CENTRAL_ADMIN' ) {
	header('Location: ./main.php');
	exit();
}

$insert = $mysqli->prepare('INSERT INTO school_unit VALUES (?,?,?,?,?);');
$insert->bind_param('isiss',$_POST['school_id'],$_POST['school_name'],$_POST['zip'],$_POST['address'],$_POST['city']);
$insert->execute();

$phones = explode(',',$_POST['add_tel']);

foreach($phones as $phone) {
	$insert = $mysqli->prepare('INSERT INTO school_phone VALUES (?,?);');
	$insert->bind_param('ii',$_POST['school_id'],$phone);
	$insert->execute();
}


$emails = explode(',',$_POST['add_email']);

foreach($emails as $email) {
	$insert = $mysqli->prepare('INSERT INTO school_email VALUES (?,?);');
	$insert->bind_param('is',$_POST['school_id'],$email);
	$insert->execute();
	echo $email.' 1';
}

header('Location: ./insert_school.php?success');

exit()	;
