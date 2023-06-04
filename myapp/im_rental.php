<?php

require_once "db_connect.php";
include "header.php";

if($_SESSION['role']=='STUDENT' OR $_SESSION['role']=='TEACHER') {
	header('Location ./main.php');
};
?>
<h2>Create a rental</h2>

<form action="" method="get">
			<label for="user_search">Search for user:</label>
			<input type="search" id="user_search" name="user_search"/>
			<label for="book_search">Search for book:</label>
			<input type="search" id="book_search" name="book_search"/>
			<button type="submit">Submit</button>
		</form>
<?php

if(isset($_GET["user_search"])) {
	$books_str = "SELECT book.ISBN,title,available_copies,count(reservation_id) as res_count FROM book INNER JOIN school_book ON book.ISBN = school_book.ISBN LEFT JOIN reservation ON reservation.ISBN = book.ISBN WHERE school_book.school_id = ? AND title LIKE ? GROUP BY book.ISBN  HAVING available_copies > res_count;";
	$books_stmt = $mysqli->prepare($books_str);
	$book_search = '%'.$_GET['book_search'].'%';
	$books_stmt->bind_param("is",$_SESSION['school_id'],$book_search);
	$books_stmt->execute();
if(!$books_stmt) {
	echo 'Books query failed';
} else {

	$books_result = $books_stmt->get_result();
	$books_array = $books_result->fetch_assoc();

	$renters_stmt = $mysqli->prepare("SELECT user_id,username,renting,role FROM user_renting_info WHERE school_id = ? AND username LIKE ?
	AND ((role='TEACHER' and  renting < 1) OR (role='STUDENT' and renting < 2)) AND user_id NOT IN (SELECT rent_user_id FROM late_rent)
	;");
	$user_search = '%'.$_GET['user_search'].'%';
	$renters_stmt->bind_param("is",$_SESSION['school_id'],$user_search);
	$renters_stmt->execute();
	if(!$renters_stmt) {
		echo 'Users for rent query failed';
	} else {
		$renters_result = $renters_stmt->get_result();
		$renters_array = $renters_result->fetch_assoc();
		?>

		
		
		<form action="./rent_by_admin_handle.php" method="post">
			<label for="user_id">Rent without reservation for user: {username (renting)}</label> 
			<input type="hidden" name="back" value="./im_rental.php">
			<div>	
			<?php
				foreach($renters_result as $row) {
					?>
					<input type='radio' id="<?php echo $row['user_id'];?>" value="<?php echo $row['user_id']; ?>" name="user_id"/>
					<label for="<?php echo $row['user_id'];?>"> <?php echo $row['username'].' ('.$row['renting'].')'; ?><br> </label>
				<?php
				}?>
			 <br>
			</div>
			<label for="ISBN">Book: {title (available copies)}</label> 
			<div>
			<?php
				foreach($books_result as $row) {
					?>
					<input type='radio' id="<?php echo $row['ISBN'];?>" value="<?php echo $row['ISBN']; ?>" name="ISBN"/>
					<label for="<?php echo $row['ISBN'];?>"> <?php echo $row['title'].' ('.$row['available_copies'].')'; ?><br> </label>
		
				<?php
				}
				 ?>
			</div>
			<button type='submit'>Submit</button>
		</form>

<p> The above form only lists books with more copies available at this school than the existing reservations, and users that have not reached their limit of concurrent rentals </p>
<?php
	}	
}
	}

	if(isset($_GET['rent_succ'])) {
		if($_GET['rent_succ'] === 'true')
		echo "<p>Rent successful</p>";
		else echo "Rent failed";
}
				?>

</body>
			
