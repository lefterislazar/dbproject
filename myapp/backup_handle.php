<?php

require_once 'db_connect.php';

if(isset($_POST['backup']) and ($_POST['backup'] == 1)) {
	$output = NULL;
	$return_var = NULL;
	$command = "..\\..\\mysql\\bin\\mysqldump -u root -E -R dbproject > .\\backup_test.sql";
  
	exec($command,$output,$return_var);
	if($return_var == 0) {
		header('Location: ./backup.php?b_success=1');
		exit();
	} else {
		header('Location: ./backup.php?b_fail=1');
		exit();
	}
}

$phpFileUploadErrors = array(
    0 => 'There is no error, the file uploaded with success',
    1 => 'The uploaded file exceeds the upload_max_filesize directive in php.ini',
    2 => 'The uploaded file exceeds the MAX_FILE_SIZE directive that was specified in the HTML form',
    3 => 'The uploaded file was only partially uploaded',
    4 => 'No file was uploaded',
    6 => 'Missing a temporary folder',
    7 => 'Failed to write file to disk.',
    8 => 'A PHP extension stopped the file upload.',
);
if(isset($_POST['restore']) and $_POST['restore'] == 1) {
	$uploadfile = "./restore_point.sql";
	if (!move_uploaded_file($_FILES['restore_file']['tmp_name'], $uploadfile)) {
		header('Location: ./backup.php?r_failed=1');
		exit();
	}
	$command = "..\\..\\mysql\\bin\\mysql -u root dbproject < .\\backup_test.sql";
  
	exec($command,$output,$return_var);
	if($return_var == 0) {
		header('Location: ./backup.php?r_success=1'.$output);
		exit();
	} else {
		header('Location: ./backup.php?r_failed=1'.$output);
		exit();
	}
	exit();
}
