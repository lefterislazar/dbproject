<?php
include_once "header.php";
require_once "db_connect.php";
?>

<h2>Pending Users</h2>

<?php
if($_SESSION['role']=='LIB_ADMIN') {
	$pending_users_stmt = $mysqli->prepare('SELECT * FROM pending_lib_user WHERE school_id = ? AND role != "LIBRARY ADMIN" ORDER BY user_id;');
	$pending_users_stmt->bind_param("i",$_SESSION['school_id']);
}else {
	$pending_users_stmt = $mysqli->prepare('SELECT * FROM pending_lib_user WHERE role = "LIBRARY ADMIN" ORDER BY user_id;');
}
$pending_users_stmt->execute();
$pending_users = $pending_users_stmt->get_result();

if (isset($_GET['act_success'])) {
  if($_GET['act_success']) {
    echo "Activation successful";
  } else {
    echo "Activation failed";
  }
}
?>
<table>
<tr>
  <td>Username</td>
  <td>Name</td>
  <td>Role</td>
	<?php
	if($_SESSION['role']=='CENTRAL_ADMIN') { ?>
		<td>School</td>
	<?php } ?>
<tr/>
<?php
foreach ($pending_users as $row) {
echo '
<tr>
	<td>'.$row['username'].'</td>
  <td>'.$row['first_name'].' '.$row['last_name'].'</td>
  <td>'.$row['role'].'</td>';
	if($_SESSION['role']=='CENTRAL_ADMIN') { 
		echo '<td>'.$row['school_id'].'</td>';
	}
 
echo  '<td>
<form action="activate_user.php" method="post">
<input type="hidden" name="user_id" value="'.$row['user_id'].'">
<input type="hidden" name="username" value="'.$row['username'].'">
<input type="hidden" name="password" value="'.$row['password'].'">
<input type="hidden" name="first_name" value="'.$row['first_name'].'">
<input type="hidden" name="last_name" value="'.$row['last_name'].'">
<input type="hidden" name="birth_date" value="'.$row['birth_date'].'">
<input type="hidden" name="role" value="'.$row['role'].'">
<input type="hidden" name="school_id" value="'.$row['school_id'].'">
<button type"submit">Activate user</button>
</form>
  </td>
<tr>';
 }; ?>

