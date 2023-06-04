<?php
include_once "header.php";
require_once "db_connect.php";
?>
<h2>Welcome, <?php echo $_SESSION['username'];?></h2>

<?php echo $_SESSION['role']; ?>
