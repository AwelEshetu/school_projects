<?php
$host = "localhost"; 
$user = "swengi11"; 
$pass = "swengi11"; 
$db = "test2"; 

$conn = mysql_connect($host, $user, $pass);
	mysql_select_db($db, $conn);
 
	// Error checking
	if(!$conn) {
		die('Could not connect ' . mysql_error());
	}
	
	mysql_query("INSERT INTO alarm(event_id,alarm_id,event,event_date,alarm_time)
	VALUES('2','5','gome','12:12:12')", $conn);
?>