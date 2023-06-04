<?php
session_start();
session_unset();
session_destroy();
session_abort();
if(isset($_GET['banned'])) {
	header('Location: ./index.php?banned=1');
	exit();
} else {
	header('Location: ./index.php');
	exit();
}
