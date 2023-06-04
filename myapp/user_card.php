<?php
session_start();

if(!isset($_POST['first_name']) or !isset($_POST['last_name']))
	echo "No name given to put on card";

$im = imagecreatefromjpeg("./cover/background.jpg");
$color = imagecolorallocate($im, 0xF4, 0x43, 0x36);
ob_start();
imagefttext($im,20,0,35,55,$color,'./font/OpenSans-Regular.ttf','Κάρτα χρήστη βιβλιοθήκης');
imagefttext($im,20,0,35,100,$color,'./font/OpenSans-Regular.ttf','Όνομα: '.$_POST['first_name']);
imagefttext($im,20,0,35,145,$color,'./font/OpenSans-Regular.ttf','Επώνυμο: '.$_POST['last_name']);
imagefttext($im,20,0,35,190,$color,'./font/OpenSans-Regular.ttf','Username: '.$_POST['username']);
imagejpeg($im,NULL,100); 
imagedestroy( $im );
$i = ob_get_clean();

echo "<img src='data:image/jpeg;base64," . base64_encode( $i )."'>"; //saviour line!g
