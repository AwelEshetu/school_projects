<?php
$host = "localhost"; 
$user = "swengi11"; 
$pass = "swengi11"; 
$db = "test1"; 

$conn = mysql_connect($host, $user, $pass);
	mysql_select_db($db, $conn);
 
	// Error checking
	if(!$conn) {
		die('Could not connect ' . mysql_error());
	}
 
?>