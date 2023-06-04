<?php
session_start();

require_once "db_connect.php";

if($_SESSION['role']=='STUDENT' OR $_SESSION['role']=='TEACHER') {
	$admin = false;
} else 
	$admin = true;

if(!$admin) {
	header('Location: ./main.php');
	exit();
}


//does ISBN already exist?
$isbn_taken = $mysqli->prepare("SELECT ? IN (SELECT ISBN FROM book);");
$isbn_taken->bind_param("i",$_POST['ISBN']);
$isbn_taken->execute();
$isbn_taken_result = $isbn_taken->get_result();
$isbn_taken_array = $isbn_taken_result->fetch_array(MYSQLI_NUM);

if($isbn_taken_array[0] == 1) {
	header('Location: ./insert_book.php?isbn_taken=1');
	exit();
}


if((!isset($_POST['writer']) or empty($_POST['writer'])) AND (!isset($_POST['new_writers']) or empty($_POST['writers']))) {
	header('Location: ./insert_book.php?no_writer=1');
	exit();
}

if((!isset($_POST['category']) or $_POST['category']=="") AND (!isset($_POST['new_category']) or $_POST['new_category']=="")) {
	header('Location: ./insert_book.php?no_category=1');
	exit();
}

if((!isset($_POST['language']) or $_POST['language']=="") AND (!isset($_POST['new_language']) or $_POST['new_language']=="")) {
	header('Location: ./insert_book.php?no_language=1');
	exit();
}

if((isset($_POST['language']) and $_POST['language']!="") AND (isset($_POST['new_language']) and $_POST['new_language']!="")) {
	header('Location: ./insert_book.php?more_language=1');
	exit();
}

if(!isset($_FILES['picture']) or $_FILES['picture']['size']==0)
	$cover = 0;
else
	$cover = 1 ;
	
if(!isset($_POST['publisher']) or $_POST['publisher']=="")
	$publisher = NULL;
else
	$publisher = $mysqli->real_escape_string($_POST['publisher']);

if(!isset($_POST['summary']) or $_POST['summary']=="")
	$summary = NULL;
else
	$summary = $mysqli->real_escape_string($_POST['summary']);


$title = $mysqli->real_escape_string($_POST['title']);
$insert_book = $mysqli->prepare("INSERT INTO book VALUES (?,?,?,?,?,?);");
$insert_book->bind_param("isssii",$_POST['ISBN'],$title,$publisher,$summary,$cover,$_POST['page_number']);
$insert_book->execute();

if(!isset($_POST['copies'])) 
	$copies = 0;
else
	$copies = $_POST['copies'];

$insert_school_book = $mysqli->prepare("INSERT INTO school_book VALUES (?,?,?);");
$insert_school_book->bind_param("iii",$_SESSION['school_id'],$_POST['ISBN'],$copies);
$insert_school_book->execute();

foreach($_POST['writer'] as $row) {
	$insert_writer_book = $mysqli->prepare("INSERT INTO writer_book VALUES (?,?);");
	$insert_writer_book->bind_param("is",$_POST['ISBN'],$row);
	$insert_writer_book->execute();
}

if(isset($_POST['new_writers']) AND !empty($_POST['new_writers'])) {
	$new_writers = explode(',',$_POST['new_writers']);
}

if(isset($new_writers)) {
	foreach($new_writers as $row) {
		$name = explode(' ',$row);

		$insert_writer = $mysqli->prepare("INSERT INTO writer(first_name,last_name) VALUES (?,?);");
		$insert_writer->bind_param("ss",$name[1], $name[0]);
		$insert_writer->execute();

		$insert_writer_book = $mysqli->prepare("INSERT INTO writer_book VALUES (?,LAST_INSERT_ID());");
		$insert_writer_book->bind_param("i",$_POST['ISBN']);
		$insert_writer_book->execute();
	}
}


foreach($_POST['category'] as $row) {
	$insert_book_category = $mysqli->prepare("INSERT INTO book_category VALUES (?,?);");
	$insert_book_category->bind_param("is",$_POST['ISBN'],$row);
	$insert_book_category->execute();
}


if(isset($_POST['new_category']) AND !empty($_POST['new_category'])) {
	$new_category = explode(',',$_POST['new_category']);
}

if(isset($new_category)) {
	foreach($new_category as $row) {
		$insert_category = $mysqli->prepare("INSERT INTO category VALUES (?);");
		$cat_name = $mysqli->real_escape_string($row);
		$insert_category->bind_param("s",$cat_name);
		$insert_category->execute();

		$insert_book_category = $mysqli->prepare("INSERT INTO book_category VALUES (?,?);");
		$insert_book_category->bind_param("is",$_POST['ISBN'],$cat_name);
		$insert_book_category->execute();
	}
}

if(isset($_POST['new_language']) and !empty($_POST['new_language'])) {
		$insert_language = $mysqli->prepare("INSERT INTO language VALUES (?);");
		$lang_name = $mysqli->real_escape_string($_POST['new_language']);
		$insert_language->bind_param("s",$lang_name);
		$insert_language->execute();

		$insert_book_language = $mysqli->prepare("INSERT INTO book_language VALUES (?,?);");
		$insert_book_language->bind_param("is",$_POST['ISBN'],$lang_name);
		$insert_book_language->execute();
} else {
		$insert_book_language = $mysqli->prepare("INSERT INTO book_language VALUES (?,?);");
		$insert_book_language->bind_param("is",$_POST['ISBN'],$_POST['language']);
		$insert_book_language->execute();
}

$keyword = explode(',',$_POST['keyword']);

foreach($keyword as $row) {

	$safe_keyword = $mysqli->real_escape_string($row);
	//does keyword already exist?
	$keyword_exists = $mysqli->prepare("SELECT ? IN (SELECT keyword FROM keyword);");
	$keyword_exists->bind_param("s",$safe_keyword);
	$keyword_exists->execute();
	$keyword_exists_result = $keyword_exists->get_result();
	$keyword_exists_array = $keyword_exists_result->fetch_array(MYSQLI_NUM);
	
	if($keyword_exists_array[0] == 0) {
	$insert_keyword = $mysqli->prepare("INSERT INTO keyword VALUES (?);");
	$insert_keyword->bind_param("s",$safe_keyword);
	$insert_keyword->execute();
	}
	
	$insert_book_keyword = $mysqli->prepare("INSERT INTO book_keyword VALUES (?,?);");
	$insert_book_keyword->bind_param("is",$_POST['ISBN'],$safe_keyword);
	$insert_book_keyword->execute();
}

	$update_publisher = $mysqli->prepare('UPDATE book SET has_picture = 1 WHERE ISBN = ?');
	$update_publisher->bind_param("i",$ISBN);
	$update_publisher->execute();

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

if($cover) {
$uploadfile = "./cover/".basename($_POST['ISBN']).".png";
if (!move_uploaded_file($_FILES['picture']['tmp_name'], $uploadfile)) {
	header('Location: ./insert_book.php?'.$phpFileUploadErrors[$_FILES['picture']['error']]);
	exit();
}
}

header('Location: ./insert_book.php');
