<?php
include_once "header.php";
require_once "./db_connect.php";

if($_SESSION['role']!='CENTRAL_ADMIN' ) {
	header('Location: ./main.php');
	exit();
}
?>
<h2>School List</h2>
<p> Search by: </p>
<form action="" method="get">
  <ul>
  <li>
  <label for="school_id">Find by ID:</label>
  <input type="number" id="school_id" name="school_id"/>
  </li>
  <li>
  <label for="name_search">Search by Name:</label>
  <input type="search" id="name_search" name="name_search"/>
  </li>
  <button type="submit">Search</button>
  </ul>
</form>


<table border=1 frame=hsides rules=rows>
  <tr>
    <td>School ID</td>
    <td>School Name</td>
		<td>City</td>
  </tr>
<?php
//Shape query
if(isset($_GET['school_id']) and !empty($_GET['school_id'])) {
	$query_str = "SELECT school_id,school_name,city FROM school_unit WHERE school_id = ?";
  $query = $mysqli->prepare($query_str);
	$query->bind_param('i',$_GET['school_id']);
} else if(isset($_GET['name_search']) and !empty($_GET['name_search'])) {
	$query_str = "SELECT school_id,school_name,city FROM school_unit WHERE school_name LIKE  ?";
  $query = $mysqli->prepare($query_str);
	$search_name = '%'.$_GET['name_search'].'%';
	$query->bind_param('s', $search_name);
} else {
	$query_str = "SELECT school_id,school_name,city FROM school_unit";
  $query = $mysqli->prepare($query_str);
}
	$query->execute();
	$query_result = $query->get_result();
	$query_array = $query_result->fetch_assoc();

	if(empty($query_array))	{ ?>
		</table>
		<p>No schools with this ID</p>
	<?php
	}	

  foreach ($query_result as $row) { ?>
		<tr>
			
			<td><a href="./school_page.php?school_id=<?php echo $row['school_id']; ?>">
			<?php echo $row['school_id'];?></a></td>
			<td><a href="./school_page.php?school_id=<?php echo $row['school_id']; ?>">
			<?php echo $row['school_name'];?></a></td>
			
			<td><?php echo $row['city'];?></td>
		</tr>
	<?php	
  }



?>
</table>

  </body>
