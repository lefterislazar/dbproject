<?php
include_once "header.php";
//WHOLE FILE IS CHAOS, FINISH LATER
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
?>

<h2>Book List</h2>
<p> Search by: </p>
<form action="" method="get">
  <ul>
  <li>
  <label for="title_search">Title:</label>
  <input type="search" id="title_search" name="title"/>
  </li>
  <li>
  <label for="writer_search">Writer:</label>
  <input type="search" id="writer_search" name="writer"/>
  </li>
  <li>
  <label for="category_search">In at least one category:</label>
  <select id="category_search" name="category[]" multiple/>
		<option value="">--select--</option>
	<?php
	$result = $mysqli->query("SELECT * FROM category");
	foreach ($result as $row) {
		echo "<option>".$row['category_name']."</option>\n";
	};
	?>
  </select>
  </li>
	<?php if($admin) { ?>
	<li>
	<label for="copies">Available copies:</label>
	<input type="number" id="copies" name="copies" />
	</li>
	<?php
	} ?>
  <button type="submit">Search</button>
  </ul>
</form>


<table border=1 frame=hsides rules=rows>
  <tr>
    <td>Book Name</td>
    <td>ISBN</td>
    <td>Writers</td>
    <td>Categories</td>
    <td>Language</td>
	<?php if(!$c_admin) { ?>
		<td>Available Copies <br> at your school</td>
	<?php }; ?>
  </tr>
<?php
//Shape query
if((isset($_GET['title']) and !empty($_GET['title'])) or (isset($_GET['writer']) and !empty($_GET['writer'])) or (isset($_GET['category']) and !empty($_GET['category'])) or (isset($_GET['copies']) and !empty($_GET['copies']))) {
	$query_str = "select b.ISBN AS ISBN,b.title AS title,b.writer_id AS writer_id,b.writer_names AS writer_names,b.categories AS categories,group_concat(k.keyword separator ', ') AS keywords,l.language_name AS language";

	if(!$c_admin) { 
		$query_str = $query_str.", sb.available_copies ";
	}

	$query_str = $query_str." from (select b.ISBN AS ISBN,b.title AS title,b.writer_id AS writer_id,b.writer_names AS writer_names,group_concat(c.category_name separator ',') AS categories 
from ((SELECT b.ISBN, b.title, wb.writer_id, GROUP_CONCAT(' ',w.first_name,' ', w.last_name) writer_names
FROM book b LEFT JOIN writer_book wb ON b.ISBN = wb.ISBN
LEFT JOIN writer w ON wb.writer_id = w.writer_id ";

	if(isset($_GET['title']) and !empty($_GET['title'])) {
		$query_str = $query_str."WHERE b.title LIKE '%".$mysqli->real_escape_string($_GET['title'])."%'";
	}
	if(isset($_GET['writer']) and !empty($_GET['writer'])) {
		if(isset($_GET['title']) and !empty($_GET['title']))
			$query_str = $query_str.' AND';
		else
			$query_str = $query_str.' WHERE';
		$query_str = $query_str." CONCAT(w.first_name,' ',w.last_name) LIKE '%".$mysqli->real_escape_string($_GET['writer'])."%' ";
	}

	$query_str = $query_str."GROUP BY b.ISBN) b LEFT JOIN dbproject.book_category c on(b.ISBN = c.ISBN)) ";
	if(isset($_GET['category']) and !empty($_GET['category[]'])) {
		$query_str = $query_str."WHERE FALSE";
		foreach($_GET['category'] as $cat) {
			$query_str = $query_str." OR c.category_name = '".$mysqli->real_escape_string($cat)."' ";
		}
	}
 
	$query_str = $query_str."GROUP BY b.ISBN) b  
	left join dbproject.book_keyword k on(b.ISBN = k.ISBN)
	left join dbproject.book_language l on(b.ISBN = l.ISBN)";
	if(!$c_admin) {
			$query_str = $query_str."left join school_book sb on(b.ISBN = sb.ISBN) WHERE sb.school_id = '".$mysqli->real_escape_string($_SESSION['school_id'])."' ";
	}
	
	if(isset($_GET['copies']) and !empty($_GET['copies']) AND $admin) {
			$query_str = $query_str."AND sb.available_copies = '".$mysqli->real_escape_string($_GET['copies'])."' ";
	}
	$query_str = $query_str."group by b.ISBN;";


	//echo $query_str;
  $result = $mysqli->query($query_str);

  for ($row_no = 0; $row_no < $result->num_rows; $row_no++ ) {
    $result->data_seek($row_no);
    $row = $result->fetch_assoc();
    echo "<tr>\n".'<td> <a href="./book.php?ISBN='.$row['ISBN'].'">'.$row['title']
	.'</td> <td>'.$row['ISBN'] .'</a> </td> <td>';

    $writer_array = explode(', ',$row['writer_names']);
    foreach($writer_array as $writer) {
      echo $writer.'</a> <br>';
    }
    echo '</td> <td>';

    $category_array = explode(',',$row['categories']);
    foreach($category_array as $category) {
      echo $category.'<br>';
    }
    echo '</td> <td>'.$row['language'].'</td>';
		if(!$c_admin) { 
			echo '</td> <td>'.$row['available_copies'].'</td>'."</tr>";
		}
  }
} else {

// Execute Query
	if(!$c_admin) {
	$query_str = "SELECT * FROM book_full_data_searchable WHERE school_id = ?";
  	$result = $mysqli->query($query_str);
  } else {
	$query_str = "SELECT * FROM book_full_data";
  $result = $mysqli->query($query_str);

	}

$last_ISBN = 0; 

  for ($row_no = 0; $row_no < $result->num_rows; $row_no++ ) {
    $result->data_seek($row_no);
    $row = $result->fetch_assoc();
    echo "<tr>\n".'<td> <a href="./book.php?ISBN='.$row['ISBN'].'">'.$row['title']
	.'</td> <td>'.$row['ISBN'] .'</a> </td> <td>';

    $writer_array = explode(', ',$row['writer_names']);
    foreach($writer_array as $writer) {
      echo $writer.'</a> <br>';
    }
    echo '</td> <td>';

    $category_array = explode(',',$row['categories']);
    foreach($category_array as $category) {
      echo $category.'<br>';
    }
    echo '</td> <td>'.$row['language'].'</td>';
		if(!$c_admin) { 
			echo '</td> <td>'.$row['available_copies'].'</td>'."</tr>";
		}
  }
  }

?>
</table>

  </body>
