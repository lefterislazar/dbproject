<?php

require_once "db_connect.php";
include "header.php";

if($_SESSION['role']=='STUDENT' OR $_SESSION['role']=='TEACHER') {
	$admin = false;
} else 
	$admin = true;

$writer_q = $mysqli->query("SELECT * FROM writer ORDER BY last_name;");

$category_q = $mysqli->query("SELECT * FROM category ORDER BY category_name;");

$language_q = $mysqli->query("SELECT * FROM language ORDER BY language_name;");



?>

<h2>Insert Book</h2>

<form enctype="multipart/form-data" action="insert_book_handle.php" method="post">
 <ul>
 <li>
	<label for="ISBN">ISBN:</label>
	<input type="text" id="ISBN" name="ISBN" required/>
	<?php
	if(isset($_GET['isbn_taken'])) { ?>
		<p>Book already exists</p>
	<?php
	} ?>
 </li>
 <li>
	<label for="title">Title:</label>
	<input type="text" id="title" name="title" required/>
 </li>
 <li>
	<label for="writer">Writers:</label>
	<select type="search" list="writer_list"  id="writer" name="writer[]" multiple/>
	<datalist id="writer_list">
	<?php
	foreach($writer_q as $row) {
	?>
		<option value="<?php echo $row['writer_id']; ?> "> <?php echo $row['last_name']. ' '.$row['first_name']
		.', '.$row['birth_year']; ?></option>	
	<?php
	}
	?>
	</datalist>
	</select>
	<p>and/or</p>
	<label for="new_writers">Insert new writers, (format: last_name first_name, writers seperated by commas):</label>
	<input type'text' id="new_writers" name="new_writers" placeholder="e.g. Doe John,Doe Jane,..." size=40 />
 </li>
 <li>
	<label for="publisher">Publisher:</label>
	<input type="text" id="publisher" name="publisher"/>
 </li>
 <li>
	<label for="summary">Summary:</label>
	<textarea type="text" id="summary" name="summary"/>
	</textarea>
 </li>
 <li>
	<label for="category">Categories (required):</label>
	<select type="text" list="category_list"  id="category" name="category[]" multiple/>
	<datalist id="category_list">
	<?php
	foreach($category_q as $row) {
	?>
		<option value="<?php echo $row['category_name']; ?> "> <?php echo $row['category_name']; ?></option>	
	<?php
	}
	?>
	</datalist>
	</select>
	<p>and/or</p>
	<label for="new_category">Insert new categories, (format: category_name, seperated by commas):</label>
	<input type'text' id="new_category" name="new_category" placeholder="e.g. Fiction,Fantasy, ..." size=40 />
 </li>
 <li>
	<label for="language">Language (if new is set, existing will be ignored):</label>
	<select type="text" list="language_list"  id="language" name="language"/>
	<datalist id="language_list">
		<option value="">--select--</option>
	<?php
	foreach($language_q as $row) {
	?>
		<option value="<?php echo $row['language_name']; ?> "> <?php echo $row['language_name']; ?></option>	
	<?php
	}
	?>
	</datalist>
	</select>
	<p>and/or</p>
	<label for="new_language">Insert new language:</label>
	<input type'text' id="new_language" name="new_language"/>
 </li>
 <li>
	<label for="page_number">Number of pages:</label>
	<input type="number" id="page_number" name="page_number"/>
 </li>
 <li>
	<label for="picture">Cover (.png ONLY):</label>
	<input type="file" id="picture" name="picture" accept=".png"/>
 </li>
 <li>
	<label for="keyword">Insert keywords (seperated by commas):</label>
	<input type'text' id="keyword" name="keyword" placeholder="e.g. lorem,ipsum, ..." size=40 />
 </li>
 <li>
	<label for="copies">Available copies at your school:</label>
	<input type="number" id="copies" name="copies"/>
 </li>
 <li>
 <button type="submit">Submit</button>
 </li>
</form>
