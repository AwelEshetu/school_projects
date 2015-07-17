<?php

//The codes below has been commented because there is another file "multiplepushcron.php" which does the same job as this file. You uncomment the codes below, if you want to use this file.
/*
include_once('con.php');

$link = mysql_connect($host, $user, $pass) or die("Could not connect to host."); 
mysql_select_db($db, $link) or die("Could not find database."); 

$query = "SELECT * FROM  trigger_updates WHERE 
updated = 1"; 
$result = mysql_query($query, $link) or die("Data not found."); 
$test = mysql_num_rows($result);

for($x = 0 ; $x < $test  ; $x++)
{ 
	$row = mysql_fetch_assoc($result);
	$event_id = $row['event_id'];
	echo "<br />";
	echo $event_id;
	
	exec("php /var/www/test/simplepush.php");
	
	$query = "UPDATE trigger_updates SET updated = 0	WHERE 
	event_id = $event_id"; 
	$result = mysql_query($query, $link) or die("Data not found."); 
	
}
*/


?>