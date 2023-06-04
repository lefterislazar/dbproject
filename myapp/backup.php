<?php
include_once 'header.php';
//require_once "./db_connect.php";

if($_SESSION['role']!='CENTRAL_ADMIN' ) {
	header('Location: ./main.php');
	exit();
}
?>
<h2>Backup Database</h2>

<form action="backup_handle.php" method="post">
	<input type="hidden" name="backup" value=1 />
	<button type="submit">Create Backup</button>
</form>
<p><?php
if(isset($_GET['b_success']) and $_GET['b_success']==1) {
	echo 'Backup successful'; ?>
	<form action="backup_test.sql">
		<button type="submit">Download Backup</button>
	</form>
<?php }
 ?>
</p>

<h2>Restore Database</h2>

<form enctype="multipart/form-data" action="backup_handle.php" method="post">
	<input type="hidden" name="restore" value=1 />
	<input type="file" id="restore_file" name="restore_file" accept=".sql"/>
	<button type="submit">Restore</button>
</form>
