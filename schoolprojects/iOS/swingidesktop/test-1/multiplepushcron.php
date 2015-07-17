<?php
//script created by Udeep Shakya based on Jason's script "pushUpdate.php"

/* This script is run by cron job every minute
This script checks if there are any updated event in table "trigger_updates" and if there are this script executes "multiplepush.php" which sends push notification to multiple devices.
*/

include_once('con.php');

$conn = mysql_connect($host, $user, $pass) or die("Could not connect to host."); 
mysql_select_db($db, $conn) or die("Could not find database."); 

$query = "SELECT * FROM  trigger_updates WHERE 
updated = 1"; 
$result = mysql_query($query, $conn) or die("Data not found."); 
$rowsnum = mysql_num_rows($result);

if($rowsnum>0) // if there are rows which are just updated
{ 

	
	exec("php /var/www/test/multiplepush.php"); // execute script which push notifications
	
	$query = "UPDATE trigger_updates SET updated = 0	WHERE 
	updated=1"; // set update triggers to 0
	$result = mysql_query($query, $conn) or die("Data not found."); 
	
}

mysql_close($conn);


?>