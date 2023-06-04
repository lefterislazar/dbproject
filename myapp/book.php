<?php
include_once "header.php";
$ISBN = htmlspecialchars($_GET['ISBN']);

require_once "./db_connect.php";

if($_SESSION['role']=='STUDENT' OR $_SESSION['role']=='TEACHER') {
	$admin = false;
	$c_admin = false;
} else if($_SESSION['role']!='CENTRAL_ADMIN') {
	$admin = true;
	$c_admin = false;
} else {
	$c_admin = true;
	$admin = false;
	}

if(!$admin and !$c_admin AND isset($_GET['edit'])) {
	header('Location: ./main.php');
	exit();
}

if($c_admin) {
$book_ext_data = $mysqli->prepare("SELECT * FROM book_full_data WHERE ISBN = ?;");
$book_ext_data->bind_param("i",$ISBN,);
$book_ext_data->execute();
$book_ext_array = ($book_ext_data->get_result())->fetch_assoc();
} else {
$book_ext_data = $mysqli->prepare("SELECT * FROM book_full_data_searchable WHERE ISBN = ?;");
$book_ext_data->bind_param("i",$ISBN);
$book_ext_data->execute();
$book_ext_array = ($book_ext_data->get_result())->fetch_assoc();
}
$book_data = $mysqli->prepare("SELECT * FROM book WHERE ISBN = ?;");
$book_data->bind_param("i",$ISBN);
$book_data->execute();
$book_array = ($book_data->get_result())->fetch_assoc();
?>
<?php
//NOT EDITING ///////////////////////////////////////////////////////
if(!isset($_GET['edit']) or $_GET['edit']==0) { ?>

	<h1> <?php echo $book_ext_array['title']; ?> </h1>
	<?php
	if($book_array['has_picture'] == 0) { ?>
		<img src=".\cover\default.png" alt="cover" width="150" height="200"/>
	<?php } else  {?> 
		<img src=".\cover\<?php echo $ISBN; ?>.png" alt="cover" width="150" height="200"/>
	<?php }; ?>
	<p>ISBN: <?php echo $book_array['ISBN']; ?> </p>
	<p> <?php echo $book_ext_array['writer_names']; ?> </p>
	<p>Εδκότης: <?php echo $book_array['publisher']?> pages</p>
	<p> Κατηγορίες: <?php echo $book_ext_array['categories'];?> </p>
	<p> Λέξεις κλειδιά: <?php echo $book_ext_array['keywords']?> </p>
	<p> Γλώσσα: <?php echo $book_ext_array['language']?></p>
	<p><?php echo $book_array['page_num']?> pages</p>
	<p>Περίληψη: <?php echo $book_array['summary']?></p>
<?php
} else { ?>

<form enctype="multipart/form-data" action="edit_book_handle.php" method="post">
	<h1> Title: <input type="text" id="title" name="title" value="<?php echo $book_ext_array['title'];?>" size=40 /> <button type="submit" name="ch_name">Change</button> </h1>
	<input type="hidden" name="ISBN" value="<?php echo $ISBN;?>"/>
	<p>ISBN: <?php echo $book_array['ISBN']; ?> </p>

	<?php
	$writer_q = $mysqli->prepare("SELECT writer.writer_id,first_name,last_name,writer.writer_id IN (SELECT writer_id FROM writer_book WHERE ISBN = ?) as ex FROM writer ORDER BY ex DESC,last_name;");
	$writer_q->bind_param("i", $ISBN);
	$writer_q->execute();
	$writer_q_result = $writer_q->get_result();
	$writer_q_array = $writer_q_result->fetch_assoc();
	
	$category_q = $mysqli->prepare("SELECT category_name,category_name IN (SELECT category_name FROM book_category WHERE ISBN = ?) as ex FROM category ORDER BY ex DESC,category_name;");
	$category_q->bind_param("i", $ISBN);
	$category_q->execute();
	$category_q_result = $category_q->get_result();
	$category_q_array = $category_q_result->fetch_assoc();

	$language_q = $mysqli->prepare("SELECT language_name,language_name IN (SELECT language_name FROM book_language WHERE ISBN = ?) as ex FROM language ORDER BY ex DESC,language_name;");
	$language_q->bind_param("i", $ISBN);
	$language_q->execute();
	$language_q_result = $language_q->get_result();
	$language_q_array = $language_q_result->fetch_assoc();

	$keyword_q = $mysqli->prepare("SELECT keyword FROM book_keyword WHERE ISBN = ? ;");
	$keyword_q->bind_param("i", $ISBN);
	$keyword_q->execute();
	$keyword_q_result = $keyword_q->get_result();
	$keyword_q_array = $keyword_q_result->fetch_assoc();

	?>
	<p>Writers:
	<select type="search" list="writer_list"  id="writer" name="writer[]" multiple/>
	<datalist id="writer_list">
	<?php
	foreach($writer_q_result as $row) {
	?>
		<option value="<?php echo $row['writer_id']; 
		?>"
		<?php
		if($row['ex'] == 1)
			echo ' selected';
		?>
    > <?php echo $row['last_name']. ' '.$row['first_name']
		; ?></option>	
	<?php
	}
	?>
	</datalist>
	</select> </p>
	<p>and/or</p>
	<label for="new_writers">Insert new writers, (format: last_name first_name, writers seperated by commas):</label>
	<input type'text' id="new_writers" name="new_writers" placeholder="e.g. Doe John,Doe Jane,..." size=40 />
  <button type="submit" name="ch_writers">Change</button>

	<?php
	if(isset($_GET['no_writer'])) { ?>
		<p>Please insert writer(s)!</p>
	<?php
	} ?>


	<p>Publisher: <input type="text" id="publisher" name="publisher" value="<?php echo $book_array['publisher'];?>"/><button type="submit" name="ch_publisher">Change</button></p>
  

	<p>Summary: <textarea id="summary" name="summary"><?php echo $book_array['summary'];?></textarea> <button type="submit" name="ch_summary">Change</button></p>
 
	<p>Categories:
	<select type="text" list="category_list"  id="category" name="category[]" multiple/>
	<datalist id="category_list">
	<?php
	foreach($category_q_result as $row) {
	?>
		<option value="<?php echo $row['category_name']; ?>" 
	<?php
		if($row['ex'] == 1)
			echo ' selected';
		?>
	> <?php echo $row['category_name']; ?></option>	
	<?php
	}
	?>
	</datalist>
	</select> </p>
	<p>and/or</p>
	<p> Insert new categories, (format: category_name, seperated by commas):
	<input type'text' id="new_category" name="new_category" placeholder="e.g. Fiction,Fantasy, ..." size=40 /> <button type="submit" name="ch_category">Change</button> </p>

	<?php
	if(isset($_GET['no_category'])) { ?>
		<p>Please insert at least on category!</p>
	<?php
	} ?>

	<p>Language:
	<select type="text" list="language_list"  id="language" name="language"/>
	<datalist id="language_list">
		<option value="">--select--</option>
	<?php
	foreach($language_q_result as $row) {
	?>
		<option value="<?php echo $row['language_name']; ?> "
	<?php
		if($row['ex'] == 1)
			echo ' selected';
		?>

		> <?php echo $row['language_name']; ?></option>	
	<?php
	}
	?>
	</datalist>
	</select></p>
	<p>and/or</p>
	<p>Insert new language:
	<input type'text' id="new_language" name="new_language"/> <button type="submit" name="ch_language">Change</button> </p>

	<?php
	if(isset($_GET['no_language'])) { ?>
		<p>Please insert a language!</p>
	<?php
	}
	if(isset($_GET['more_language'])) { ?>
		<p>Please insert only one language!</p>
	<?php
	} ?>

	<p>Number of pages:
	<input type="number" id="page_number" name="page_number" value=<?php echo $book_array['page_num'];?> /> <button type="submit" name="ch_pages" />Change</button> </p>

	<p>Cover (.png ONLY):
	<input type="file" id="picture" name="picture" accept=".png"/><button type="submit" name="ch_cover" >Change</button> <button type="submit" name="rm_cover">Remove</button></p>

	<p>Insert keywords (seperated by commas):
	<?php
	$keyword_str = NULL;
	foreach($keyword_q_result as $word) {
		$keyword_str = $keyword_str.','.$word['keyword']; 
	} 
	$keyword_str = substr($keyword_str,1) ?>
	<input type'text' id="keyword" name="keyword" placeholder="e.g. lorem,ipsum, ..." size=40 value="<?php echo $keyword_str;?>"/><button type="submit" name="ch_keyword">Change</button> </p>

	<?php if($_SESSION['role'] != 'CENTRAL_ADMIN') { ?>
	<p>Available copies at your school:
	<input type="number" id="copies" name="copies"/><button type="submit" name="ch_copies">Change</button> </p>
	<?php } ?>


</form>
<?php  } ?>

<?php
if($admin or $c_admin and !isset($_GET['edit'])) {?>
<form actiom="./book.php" method="get">
	<input type="hidden" name="ISBN" value="<?php echo $ISBN;?>"/>
<input type="hidden" name="edit" value="1"/>
<button type="submit">Edit</button>
</form>
<?php }; ?>

<form action="./book.php" method='get'>
<?php if(isset($_GET['edit'])) {
	?>
	<input type="hidden" name="ISBN" value="<?php echo $ISBN;?>"/>
	
<input type="hidden" name="done" value="1"/>
<button type="submit">Done</button>
<?php }; ?>
</form>


<hr>
<?php
///////////////////////////////////////////////////////////////////////////////////////////
$book_in_school = $mysqli->prepare("SELECT * FROM school_book WHERE
school_id = ? AND ISBN = ?;");
$book_in_school->bind_param("ii",$_SESSION['school_id'],$ISBN);
$book_in_school->execute();
$book_in_school_result = ($book_in_school->get_result())->fetch_assoc();


if (empty($book_in_school_result)) {
  $reserve_button =  "Book not available for reservation at your School";
  $reserve_for_button = "Book not available for rent at your School";
  $reserve_button_disable = "disabled";
  $reserve_for_button_disable = "disabled";
} else echo "<p>Copies currently available: ".$book_in_school_result['available_copies'].'</p>';
 

$user_rents = $mysqli->prepare("SELECT reserving FROM lib_user WHERE
user_id = ?;");
$user_rents->bind_param("i",$_SESSION['user_id']);
$user_rents->execute();
$user_rents_result = ($user_rents->get_result())->fetch_assoc();

if($_SESSION['role'] == 'STUDENT')
  $rent_lim = 2;
else $rent_lim = 1;

if ($user_rents_result['reserving'] >= $rent_lim) {
  $reserve_button =  "No more reservations possible";
  $reserve_button_disable = "disabled";
}  

$already_rent =  $mysqli->prepare("SELECT * FROM active_rent WHERE
renting_user_id = ? AND ISBN = ?;");
$already_rent->bind_param("ii",$_SESSION['user_id'],$ISBN);
$already_rent->execute();
$already_rent_result = ($already_rent->get_result())->fetch_assoc();

if (!empty($already_rent_result)) {
  $reserve_button =  "Already renting book";
  $reserve_button_disable = "disabled";
}

$already_reserve =  $mysqli->prepare("SELECT * FROM reservation WHERE
user_id = ? AND ISBN = ?;");
$already_reserve->bind_param("ii",$_SESSION['user_id'],$ISBN);
$already_reserve->execute();
$already_reserve_result = ($already_reserve->get_result())->fetch_assoc();

if (!empty($already_reserve_result)) {
  $reserve_button =  "Already reserving book";
  $reserve_button_disable = "disabled";
}

$is_late =  $mysqli->prepare("SELECT * FROM late_rent WHERE
rent_user_id = ?;");
$is_late->bind_param("i",$_SESSION['user_id']);
$is_late->execute();
$is_late_result = ($is_late->get_result())->fetch_assoc();

if (!empty($is_late_reserve_result)) {
  $reserve_button =  "You have a late return";
  $reserve_button_disable = "disabled";
}
//if all the above are cleared
if(!isset($reserve_button)) {
$reserve_button = "Reserve";
$reserve_button_disable = "";
}
?>

<?php
echo '<form action="./reservation_handle.php?ISBN='.$ISBN.'" method=\'post\'>';
if($_SESSION['role'] != 'CENTRAL_ADMIN') { 
?>
	<label>Reserve:</label> 
  <button type='submit'<?php echo $reserve_button_disable.'>'.$reserve_button;?></button>
</form>

<?php }
if(isset($_GET['res_succ'])) {
  if($_GET['res_succ'] === 'true')
	echo "<p>Reservation successful</p>";
  else echo "Reservation failed";
}

if (!empty($already_reserve_result)) {
  echo '<form action="./cancel_reservation_handle.php?ISBN='.$ISBN.'" method=\'post\'>'.
"<button type='submit'>Cancel reservation</button>
</form>";
}

if(isset($_GET['canc_succ'])) {
  if($_GET['canc_succ'] === 'true')
	echo "<p>Reservation cancelation successful</p>";
  else echo "Reservation cancelation failed";
}


if($_SESSION['role'] == 'LIB_ADMIN') { 

	//Check if there are enough copies to cover existing reservations first	
	$existing_reservers_stmt = $mysqli->prepare("SELECT count(*) FROM reservation INNER JOIN lib_user ON lib_user.user_id = reservation.user_id WHERE reservation.ISBN = ? AND lib_user.school_id = ?;");
	$existing_reservers_stmt->bind_param("ii",$ISBN,$_SESSION['school_id']);
  $existing_reservers_stmt->execute();
	$existing_reservers_result = $existing_reservers_stmt->get_result();
  $existing_reservers_array = $existing_reservers_result->fetch_assoc();
	
	
	if (!empty($book_in_school_result)) {
		if($book_in_school_result['available_copies'] <= $existing_reservers_array['count(*)']) {
			$reserve_for_button = "Not enough copies available";
			$reserve_for_button_disable = "disabled";
		}
	} 

	// First a rent_for button
	if(!isset($reserve_for_button)) {
		$reserve_for_button = "Rent for:";
		$reserve_for_button_disable = "";
	}

	$renters_stmt = $mysqli->prepare("SELECT user_id,username,renting,role FROM user_renting_info WHERE school_id = ?
	AND ((role='TEACHER' and  renting < 1) OR (role='STUDENT' and renting < 2)) AND user_id NOT IN (SELECT rent_user_id FROM late_rent)");
	$renters_stmt->bind_param("i",$_SESSION['school_id']);
	$renters_stmt->execute();
	if(!$renters_stmt) {
		echo 'Users for rent query failed';
	} else {
		$renters_result = $renters_stmt->get_result();
		$renters_array = $renters_result->fetch_assoc();
		?>

		<form action="./rent_by_admin_handle.php" method="post">
			<label>Rent without reservation for user:</label> 
			<button type='submit'<?php echo $reserve_for_button_disable.'>'.$reserve_for_button;?></button>
			<input type="hidden" name="back" value="./book.php">
			<input type="hidden" name="ISBN" value="<?php echo $ISBN;?>">
			<select list="rent_users"  id="user_id" name="user_id" required autocomplete="off"
			placeholder="[id] username (currently renting)">
			<datalist id="rent_users">
					<option value="">[id] username (renting)</option>
			<?php
				foreach($renters_result as $row) {
					?>
					<option value="<?php echo $row['user_id']; ?>" >
					<?php echo '['.$row['user_id'].']'.
					$row['username'].' ('.$row['renting'].')'; ?>
					</option>
				<?php
				}
				?>
			</datalist>
			</select>
		</form>
  <?php
	} 
	if(isset($_GET['rent_succ'])) {
		if($_GET['rent_succ'] === 'true')
		echo "<p>Rent successful</p>";
		else echo "Rent failed";
	}
}







$likert_map = [
	1 => 'Πολύ κακό',
	2 => 'Κακό',
	3 => 'Μέτριο',
	4 => 'Καλό',
	5 => 'Πολύ καλό'
];
//Check if user has already reviewed the book

$allow_review;
$already_reviewed = $mysqli->prepare('SELECT * FROM review WHERE reviewer_id = ? AND ISBN = ? ;');
$already_reviewed->bind_param("ii",$_SESSION['user_id'],$ISBN);
$already_reviewed->execute();
$already_reviewed_result = $already_reviewed->get_result();
$already_reviewed_array = $already_reviewed_result->fetch_assoc();


$already_reviewed_pen = $mysqli->prepare('SELECT * FROM pending_review WHERE reviewer_id = ? AND ISBN = ? ;');
$already_reviewed_pen->bind_param("ii",$_SESSION['user_id'],$ISBN);
$already_reviewed_pen->execute();
$already_reviewed_pen_result = $already_reviewed_pen->get_result();
$already_reviewed_pen_array = $already_reviewed_pen_result->fetch_assoc();

if(empty($already_reviewed_pen_array) AND empty($already_reviewed_array) and $_SESSION['role']!='CENTRAL_ADMIN') 
  $allow_review = true;
else $allow_review = false;

if($allow_review) {

//Allow review only if book has been rented
$have_rented =  $mysqli->prepare("SELECT * FROM all_rent WHERE
renting_user_id = ? AND ISBN = ?;");
$have_rented->bind_param("ii",$_SESSION['user_id'],$ISBN);
$have_rented->execute();
$have_rented_result = $have_rented->get_result();
$have_rented_array = $have_rented_result->fetch_assoc();

if (!empty($have_rented_array)) {?>
<h3>Αφήστε την Κριτική σας</h3>
<form action="./review_post_handle.php" method="post">
  <ul>
<input type="hidden" id="book" name="ISBN" value="<?php echo $ISBN;?>" />
  <li>
    <label for="likert">Rating:</label>
    <select id="likert" name="likert" required>
	<option value=1>Πολύ κακό</option>
	<option value=2>κακό</option>
	<option value=3>Μέτριο</option>
	<option value=4>Καλό</option>
	<option value=5>Πολύ Καλό</option>
    </select>
  </li>
  <li>
  <label for="msg">Message:</label>
      <textarea id="msg" name="user_message"></textarea>
  </li>
  <li>
  <button type="submit">Submit review</button>
  </li>
  </ul>
</form>
<?php
} 
} 

if(isset($_GET['rev_post'])) {
  if($_GET['rev_post'] === 'true')
	echo "<p>Review pending moderation</p>";
  else echo "<p>Review post failed</p>";
}


// Else if he has reviewed it, display review, pending or approved 
if (!empty($already_reviewed_pen_array) and !isset($_GET['rev_edit'])) {?>
  <h3>Η κριτική σας (αναμένει αποδοχή) </h3>
  <table>
<tr>
  <td>Rating</td>
  <td>Review</td> 
</tr> <?php
	foreach ($already_reviewed_pen_result as $row) { ?>
	<tr>
	  <td> <?php echo $likert_map[$row['likert_scale']]; ?></td>
	  <td><p> <?php echo $row['text']; ?></p></td>
	</tr> 
  </table>
	<?php
	}

}else if (!empty($already_reviewed_array) and !isset($_GET['rev_edit'])){?>
  <h3>Η κριτική σας</h3>
  <table>
<tr>
  <td>Rating</td>
  <td>Review</td> 
</tr> <?php
	foreach ($already_reviewed_result as $row) { ?>
	<tr>
	  <td> <?php echo $likert_map[$row['likert_scale']]; ?></td>
	  <td><p> <?php echo $row['text']; ?></p></td>
	</tr> 
  </table>
	<?php
	}
} else if (isset($_GET['rev_edit']) and (!empty($already_reviewed_pen_array) or !empty($already_reviewed_array))) { 
//		EDIT REVIEW
	if(!empty($already_reviewed_pen_array)) {
		$review_pen = 1;
		$review = $already_reviewed_pen_array;
	}
	else {
		$review_pen = 0;
		$review = $already_reviewed_array;
	}


?>

<h3>Επεξεργαστείτε την Κριτική σας</h3>
	<form action="./review_post_handle.php" method="post">
		<ul>
	<input type="hidden" id="book" name="ISBN" value="<?php echo $ISBN;?>" />
	<input type="hidden" name="editing" value=1 />
	<input type="hidden" name="pen" value=<?php echo $review_pen; ?> />
		<li>
			<label for="likert">Rating:</label>
			<select id="likert" name="likert" value="<?php echo $review['likert_scale'];?>" required>
		<option value=1 <?php if($review['likert_scale'] == 1) echo 'selected'; ?> >Πολύ κακό</option>
		<option value=2 <?php if($review['likert_scale'] == 2) echo 'selected'; ?>>κακό</option>
		<option value=3 <?php if($review['likert_scale'] == 3) echo 'selected'; ?>>Μέτριο</option>
		<option value=4 <?php if($review['likert_scale'] == 4) echo 'selected'; ?>>Καλό</option>
		<option value=5 <?php if($review['likert_scale'] == 5) echo 'selected'; ?>>Πολύ Καλό</option>
			</select>
		</li>
		<li>
		<label for="msg">Message:</label>
				<textarea id="msg" name="user_message"><?php echo $review['text']; ?></textarea>
		</li>
		<li>
		<button type="submit">Submit review</button>
		</li>
		</ul>
	</form>
<?php }
if(!isset($_GET['rev_edit']) and !$c_admin and (!empty($already_reviewed_pen_array) or !empty($already_reviewed_array))) { ?>
	<form action="" method="get">
		<input type="hidden" name="ISBN" value="<?php echo $ISBN ?>" />
		<button type="submit" name="rev_edit" value=1>Edit</button>
	</form>
<?php
} else if (!$c_admin and (!empty($already_reviewed_pen_array) or !empty($already_reviewed_array))){ ?>
	<form action="" method="get">
		<input type="hidden" name="ISBN" value="<?php echo $ISBN ?>" />
		<button type="submit" name="cancel" value=1>Cancel</button>
	</form>
<?php
}


?>


<h3>Κριτικές χρηστών </h3>

<?php
$reviews_stmt = $mysqli->prepare('SELECT * FROM review_full_data WHERE ISBN = ? ;');
$reviews_stmt->bind_param("i",$ISBN);
$reviews_stmt->execute();
$reviews_stmt_result = $reviews_stmt->get_result();

$avg_rating_stmt = $mysqli->prepare('SELECT AVG(likert_scale) FROM review WHERE ISBN = ? ;');
$avg_rating_stmt->bind_param("i",$ISBN);
$avg_rating_stmt->execute();
$avg_rating_stmt_result = $avg_rating_stmt->get_result();
$avg_rating_stmt_array = $avg_rating_stmt_result->fetch_array(MYSQLI_NUM);
?>
<p>Average Rating: <?php echo $avg_rating_stmt_array[0]; ?> </p>
<table>
<tr>
  <td>Username</td>
  <td>Rating</td>
  <td>Review</td?
<tr/>
<?php
foreach ($reviews_stmt_result as $row) {
echo '
<tr>
  <td>'.$row['username'].'</td>
  <td>'.$likert_map[$row['likert_scale']].'</td>
  <td><p>'.$row['text'].'</p></td>
<tr>'; 
 } ?>


  </body>
