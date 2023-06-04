<?php
session_start();

require_once "db_connect.php";

$ISBN = $_POST['ISBN'];

if($_SESSION['role']=='STUDENT' OR $_SESSION['role']=='TEACHER') {
	$admin = false;
} else 
	$admin = true;

if(!$admin) {
	header('Location: ./main.php');
	exit();
}

if(isset($_POST['ch_name'])) {
	$update_cover = $mysqli->prepare('UPDATE book SET title = ? WHERE ISBN = ?');
	$update_cover->bind_param("si",$_POST['title'],$ISBN);
	$update_cover->execute();
}

if(isset($_POST['ch_writers'])) {
	if((!isset($_POST['writer']) or empty($_POST['writer'])) AND (!isset($_POST['new_writers']) or empty($_POST['new_writers']))) {
		header('Location: ./book.php?ISBN='.$ISBN.'&edit=1&no_writer=1');
		exit();
	}
	
	
	$old_writer_q = $mysqli->prepare("SELECT writer_id FROM writer_book WHERE ISBN = ?;");
	$old_writer_q->bind_param("i", $ISBN);
	$old_writer_q->execute();
	$old_writer_q_result = $old_writer_q->get_result();
	$old_writer_q_array = $old_writer_q_result->fetch_assoc();

	$old_writers = [];
	foreach($old_writer_q_result as $row) {
		array_push($old_writers,$row['writer_id']);
	}

	$add_existing_writers = [];
	foreach($_POST['writer'] as $row) {
		if(!in_array($row,$old_writers)) {
			array_push($add_existing_writers,$row);
		}
	}
	
	if(!empty($add_existing_writers)) {
		$insert_stmt = "INSERT INTO writer_book VALUES ";
		foreach($add_existing_writers as $writer) {
			$insert_stmt = $insert_stmt.'('.$ISBN.','.$writer.'), ';
		}	
		$insert_stmt = substr($insert_stmt,0,-2).';';
		echo $insert_stmt;	
		$insert_q = $mysqli->query($insert_stmt);
	}
	if(!empty($_POST['writer'])) {
		$delete_stmt = "DELETE FROM writer_book WHERE ISBN = ".$ISBN." AND writer_id NOT IN (";
		foreach($_POST['writer'] as $row) {
			$delete_stmt = $delete_stmt.$row.',';
		}
		$delete_stmt = substr($delete_stmt,0,-1).');';
		echo $delete_stmt;
		$delete_q = $mysqli->query($delete_stmt);

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
			$insert_writer_book->bind_param("i",$ISBN);
			$insert_writer_book->execute();
		}
	}
}
if(isset($_POST['ch_category'])) {
	if((!isset($_POST['category']) or $_POST['category']=="") AND (!isset($_POST['new_category']) or $_POST['new_category']=="")) {
		header('Location: ./book.php?ISBN='.$ISBN.'&edit=1&no_category=1');
		exit();
	}

	$old_category_q = $mysqli->prepare("SELECT category_name FROM book_category WHERE ISBN = ?;");
	$old_category_q->bind_param("i", $ISBN);
	$old_category_q->execute();
	$old_category_q_result = $old_category_q->get_result();
	$old_category_q_array = $old_category_q_result->fetch_assoc();

	$old_categories = [];
	foreach($old_category_q_result as $row) {
		array_push($old_categories,$row['category_name']);
	}

	$add_existing_category = [];
	foreach($_POST['category'] as $row) {
		if(!in_array($row,$old_categories)) {
			array_push($add_existing_category,$row);
			echo $row;
		}
	}

	if(!empty($add_existing_category)) {
		$insert_stmt = "INSERT INTO book_category(ISBN,category_name) VALUES ";
		foreach($add_existing_category as $category) {
			$insert_stmt = $insert_stmt.'('.$ISBN.",'".$mysqli->real_escape_string($category)."'), ";
		}	
		$insert_stmt = substr($insert_stmt,0,-2).';';
		echo $insert_stmt;	

		$insert_q = $mysqli->query($insert_stmt);
	}
	if(!empty($_POST['category'])) {
		$delete_stmt = "DELETE FROM book_category WHERE ISBN = ".$ISBN." AND category_name NOT IN (";
		foreach($_POST['category'] as $row) {
			$delete_stmt = $delete_stmt."'".$mysqli->real_escape_string($row)."',";
		}
		$delete_stmt = substr($delete_stmt,0,-1).');';
		echo $delete_stmt;
		$delete_q = $mysqli->query($delete_stmt);
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
}
if(isset($_POST['ch_language'])) {
	if((!isset($_POST['language']) or $_POST['language']=="") AND (!isset($_POST['new_language']) or $_POST['new_language']=="")) {
		header('Location: ./book.php?ISBN='.$ISBN.'&edit=1&no_language=1');
		exit();
	}
	if((isset($_POST['language']) and $_POST['language']!="") AND (isset($_POST['new_language']) and $_POST['new_language']!="")) {
		header('Location: ./book.php?ISBN='.$ISBN.'&edit=1&more_language=1');
		exit();
	}

	if(isset($_POST['language']) and $_POST['language']!="") {
		$old_language_q = $mysqli->prepare("SELECT language_name FROM book_language WHERE ISBN = ?;");
		$old_language_q->bind_param("i", $ISBN);
		$old_language_q->execute();
		$old_language_q_result = $old_language_q->get_result();
		$old_language_q_array = $old_language_q_result->fetch_assoc();
		if($old_language_q_array['language_name'] != $_POST['language']) {
			$delete_lang = $mysqli->prepare('DELETE FROM book_language WHERE ISBN = ? AND language_name = ?;');
			$delete_lang->bind_param("is",$ISBN,$old_language_q_array['language_name']);
			$delete_lang->execute();

			$insert_lang = $mysqli->prepare('INSERT INTO book_language VALUES (?,?);');
			$insert_lang->bind_param("is",$ISBN,$_POST['language']);
			$insert_lang->execute();
		}
	} else {
		$insert_language = $mysqli->prepare("INSERT INTO language VALUES (?);");
		$lang_name = $mysqli->real_escape_string($_POST['new_language']);
		$insert_language->bind_param("s",$lang_name);
		$insert_language->execute();

		$lang_name = $mysqli->real_escape_string($_POST['new_language']);
		$insert_book_language = $mysqli->prepare("INSERT INTO book_language VALUES (?,?);");
		$insert_book_language->bind_param("is",'ISBN',$lang_name);
		$insert_book_language->execute();
	}
}

if(isset($_POST['ch_keyword'])) {
	$keyword_array = explode(',',$_POST['keyword']);
	$old_keyword_q = $mysqli->prepare("SELECT keyword FROM book_keyword WHERE ISBN = ?;");
	$old_keyword_q->bind_param("i", $ISBN);
	$old_keyword_q->execute();
	$old_keyword_q_result = $old_keyword_q->get_result();
	$old_keyword_q_array = $old_keyword_q_result->fetch_assoc();

	$old_keywords = [];
	foreach($old_keyword_q_result as $row) {
		array_push($old_keywords,$row['keyword']);
	}

	$add_keywords = [];
	foreach($keyword_array as $row) {
		if(!in_array($row,$old_keywords)) {
			array_push($add_keywords,$row);
		}
	}
	
	foreach($add_keywords as $keyword) {
		$check_keyword = $mysqli->prepare("SELECT ? IN (SELECT * FROM keyword)");
		$check_keyword->bind_param("s",$keyword);
		$check_keyword->execute();
		$check_keyword_result = $check_keyword->get_result();
		$check_keyword_array = $check_keyword_result->fetch_array(MYSQLI_NUM);

		if($check_keyword_array[0] == 0) {
			$insert_keyword_book = $mysqli->prepare("INSERT INTO keyword VALUES (?);");
			$insert_keyword_book->bind_param("s",$keyword);
			$insert_keyword_book->execute();
		}
	}	

	if(!empty($add_keywords)) {
		$insert_stmt = "INSERT INTO book_keyword VALUES ";
		foreach($add_keywords as $keyword) {
			$insert_stmt = $insert_stmt."(".$ISBN.",'".$keyword."'), ";
		}	
		$insert_stmt = substr($insert_stmt,0,-2).';';
		echo $insert_stmt;	
		$insert_q = $mysqli->query($insert_stmt);
	}
	if(!empty($_POST['keyword'])) {
		$delete_stmt = "DELETE FROM book_keyword WHERE ISBN = ".$ISBN." AND keyword NOT IN ('";
			foreach($keyword_array as $row) {
				$delete_stmt = $delete_stmt.$row."','";
			}
		$delete_stmt = substr($delete_stmt,0,-3)."');";
		echo $delete_stmt;
		$delete_q = $mysqli->query($delete_stmt);
		}
}

if(isset($_POST['ch_publisher'])) {
	$update_publisher = $mysqli->prepare('UPDATE book SET publisher = ? WHERE ISBN = ?');
	$safe_publisher = $mysqli->real_escape_string($_POST['publisher']);
	$update_publisher->bind_param("si",$safe_publisher,$ISBN);
	$update_publisher->execute();
}

if(isset($_POST['ch_summary'])) {
	$update_summary = $mysqli->prepare('UPDATE book SET summary = ? WHERE ISBN = ?');
	$safe_summary = $mysqli->real_escape_string($_POST['summary']);
	$update_summary->bind_param("si",$safe_summary,$ISBN);
	$update_summary->execute();
}
if(isset($_POST['ch_pages'])) {
	$update_pages = $mysqli->prepare('UPDATE book SET page_num = ? WHERE ISBN = ?');
	$update_pages->bind_param("ii",$_POST['page_number'],$ISBN);
	$update_pages->execute();
}
if(isset($_POST['ch_copies'])) {
	$check_available = $mysqli->prepare('SELECT 1 FROM school_book WHERE ISBN = ? AND school_id = ?');
	$check_available->bind_param("ii",$ISBN,$_SESSION['school_id']);
	$check_available->execute();
	$check_available_result = $check_available->get_result();

	if($check_available_result->num_rows == 0) {
		$insert_copies = $mysqli->prepare('INSERT INTO school_book VALUES (?,?,?);');
		$insert_copies->bind_param("sii",$_SESSION['school_id'],$ISBN,$_POST['copies']);
		$insert_copies->execute();
	} else {
		$update_copies = $mysqli->prepare('UPDATE school_book SET available_copies = ? WHERE ISBN = ? AND school_id = ?');
		$update_copies->bind_param("sii",$_POST['copies'],$ISBN,$_SESSION['school_id']);
		$update_copies->execute();
	}
}
if(isset($_POST['rm_cover'])) {
	$update_cover = $mysqli->prepare('UPDATE book SET has_picture = 0 WHERE ISBN = ?');
	$update_cover->bind_param("i",$ISBN);
	$update_cover->execute();
}
if(isset($_POST['ch_cover'])) {
	$update_cover = $mysqli->prepare('UPDATE book SET has_picture = 1 WHERE ISBN = ?');
	$update_cover->bind_param("i",$ISBN);
	$update_cover->execute();

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



	$uploadfile = "./cover/".basename($ISBN).".png";
	echo $uploadfile;
	if (!move_uploaded_file($_FILES['picture']['tmp_name'], $uploadfile)) {
		header('Location: ./book.php?ISBN='.$ISBN.'&edit=1&error='.$_FILES['picture']['error']);
		exit();
	}

}


header('Location: ./book.php?ISBN='.$ISBN.'&edit=1');
