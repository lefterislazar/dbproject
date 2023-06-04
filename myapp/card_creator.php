<?php

$im = imagecreatefromjpeg("./cover/background.jpg");
$black = imagecolorallocate($im, 0x00, 0x00, 0x00);
imagefttext($im,13,0,105,55,$black,'./font/OpenSans-Regular.ttf','γειά σας');
ob_start();
imagejpeg($im,NULL,100); 
imagedestroy( $im );
$i = ob_get_clean();

echo "<img src='data:image/jpeg;base64," . base64_encode( $i )."'>"; //saviour line!g
