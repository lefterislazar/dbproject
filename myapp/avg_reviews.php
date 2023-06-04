<?php
require_once 'db_connect.php';
include 'header.php';

if($_SESSION['role']=='STUDENT' OR $_SESSION['role']=='TEACHER') {
	$admin = false;
} else 
	$admin = true;


if(!$admin)
	header('Location: ./main.php');
?>
<h2>Average review statistics</h2>

<form action="" method="get">
	<button type="submit" name="view" value="u">View by user average</button> <br>
	<button type="submit" name="view" value="uc">View by user average per category</button> <br>
	<button type="submit" name="view" value="c">View by category average in your school</button> <br>
	<button type="submit" name="view" value="ca">View by category average across all schools</button> <br>
</form>

<br>
<?php
if(!isset($_GET) or (isset($_GET['view']) and $_GET['view']=="u")) { ?>

	<form action="" method="get">
		<input type="search" id="search" name="search_user" />
		<input type="hidden" name="view" value="u"/>
		<button type="submit">Search by username or name</button>
	</form>
<br> <br> <br> <br>

<?php
	if(isset($_GET['search_user']) and !empty($_GET['search_user'])) {
		$search = "%".$mysqli->real_escape_string($_GET['search_user'])."%";
		$query = $mysqli->prepare("SELECT * FROM user_review_avg WHERE username LIKE ? OR CONCAT(first_name,' ',last_name) LIKE ?;");
		$query->bind_param("ss",$search,$search);
	} else {
		$query = $mysqli->prepare("SELECT * FROM user_review_avg;");
	}
		$query->execute();
		$query_result = $query->get_result();

		?>
		<table border=1 frame=hsides rules=rows>
			<tr>
				<td>Username</td>
				<td>Name</td>
				<td>Average review score given</td>
			</tr>
		<?php
		foreach($query_result as $row) { ?>
			<tr>
				<td><?php echo $row['username'];?></td>
				<td><?php echo $row['first_name'].' '.$row['last_name'];?></td>
				<td><?php echo $row['AVG(likert_scale)'];?></td>
			</tr>	
	<?php
		} ?>
		</table>
<?php
} else if(isset($_GET['view']) and $_GET['view']=="uc"){?>

	<form action="" method="get">
		<input type="search" id="search_user" name="search_user" />
		<button type="submit" name="button_user">Search by username or name</button> <br>
		<input type="search" id="search_cat" name="search_cat" />
		<button type="submit" name="button_cat">Search by category</button> <br>
		<button type="submit" name="both">Search by both</button>
		<input type="hidden" name="view" value="uc"/>
	</form>

<br> <br>

<?php
	if(isset($_GET['search_user']) and !empty($_GET['search_user']) and isset($_GET['search_cat']) and !empty($_GET['search_cat'])
		and isset($_GET['both'])) {
		$search_user = "%".$mysqli->real_escape_string($_GET['search_user'])."%";
		$search_cat = "%".$mysqli->real_escape_string($_GET['search_cat'])."%";
		$query = $mysqli->prepare("SELECT * FROM user_review_category_avg WHERE (username LIKE ? OR CONCAT(first_name,' ',last_name) LIKE ?) AND category_name LIKE ?;");
		$query->bind_param("sss",$search_user,$search_user,$search_cat);
	} else if(isset($_GET['search_user']) and !empty($_GET['search_user']) and isset($_GET['button_user'])) {
		$search_user = "%".$mysqli->real_escape_string($_GET['search_user'])."%";
		$query = $mysqli->prepare("SELECT * FROM user_review_category_avg WHERE username LIKE ? OR CONCAT(first_name,' ',last_name) LIKE ?;");
		$query->bind_param("ss",$search_user,$search_user);
	} else if(isset($_GET['search_cat']) and !empty($_GET['search_cat']) and isset($_GET['button_cat'])) {
		$search_cat = "%".$mysqli->real_escape_string($_GET['search_cat'])."%";
		$query = $mysqli->prepare("SELECT * FROM user_review_category_avg WHERE category_name LIKE ?;");
		$query->bind_param("s",$search_cat);
	} else {
		$query = $mysqli->prepare("SELECT * FROM user_review_category_avg;");
	}
	

		$query->execute();
		$query_result = $query->get_result();

		?>
		<table border=1 frame=hsides rules=rows>
			<tr>
				<td>Username</td>
				<td>Name</td>
				<td>Category</td>
				<td>Average review score given</td>
			</tr>
		<?php
		$last_user_id = NULL;
		foreach($query_result as $row) { ?>
			<tr>
				<?php
				if($last_user_id != $row['user_id']) {
					$last_user_id = $row['user_id']
					?>
					<td><?php echo $row['username'];?></td>
					<td><?php echo $row['first_name'].' '.$row['last_name'];?></td>
				<?php } else echo '<td></td><td></td>'; ?>
				<td><?php echo $row['category_name'];?></td>
				<td><?php echo $row['avg'];?></td>
			</tr>	
	<?php
		} ?>
		</table>
<?php
} else if(isset($_GET['view']) and $_GET['view']=="ca") { ?>
	<form action="" method="get">
		<input type="search" id="search" name="search_cat" />
		<input type="hidden" name="view" value="c"/>
		<button type="submit">Search by category</button>
	</form>
<br> <br> <br> <br>
<?php
	if(isset($_GET['search_cat']) and !empty($_GET['search_cat'])) {
		$search = "%".$mysqli->real_escape_string($_GET['search_cat'])."%";
		$query = $mysqli->prepare("SELECT * FROM category_review_avg WHERE category_name LIKE ?;");
		$query->bind_param("s",$search);
	} else {
		$query = $mysqli->prepare("SELECT * FROM category_review_avg;");
	}
		$query->execute();
		$query_result = $query->get_result();

		?>
		<table border=1 frame=hsides rules=rows>
			<tr>
				<td>Category</td>
				<td>Average review score given</td>
			</tr>
		<?php
		foreach($query_result as $row) { ?>
			<tr>
				<td><?php echo $row['category_name'];?></td>
				<td><?php echo $row['AVG(likert_scale)'];?></td>
			</tr>	
	<?php
		} ?>
		</table>
<?php
} else { ?>
	<form action="" method="get">
		<input type="search" id="search" name="search_cat" />
		<input type="hidden" name="view" value="c"/>
		<button type="submit">Search by category</button>
	</form>
<br> <br> <br> <br>
<?php
	if(isset($_GET['search_cat']) and !empty($_GET['search_cat'])) {
		$search = "%".$mysqli->real_escape_string($_GET['search_cat'])."%";
		$query = $mysqli->prepare("SELECT * FROM category_review_avg_per_school WHERE category_name LIKE ? AND school_id = ?;");
		$query->bind_param("si",$search,$_SESSION['school_id']);
	} else {
		$query = $mysqli->prepare("SELECT * FROM category_review_avg_per_school WHERE school_id = ?;");
		$query->bind_param("i",$_SESSION['school_id']);
	}
		$query->execute();
		$query_result = $query->get_result();

		?>
		<table border=1 frame=hsides rules=rows>
			<tr>
				<td>Category</td>
				<td>Average review score given</td>
			</tr>
		<?php
		foreach($query_result as $row) { ?>
			<tr>
				<td><?php echo $row['category_name'];?></td>
				<td><?php echo $row['AVG(likert_scale)'];?></td>
			</tr>	
	<?php
		} ?>
		</table>
<?php
}


