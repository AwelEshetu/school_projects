<?php
echo("\n php called in server\n");
// receiving group from client
$groupReceived = $_GET['group'];
echo("\nData received by server is $groupReceived\n");
//$groupReceived = stripslashes($groupReceived);
//$groupReceived = mysql_real_escape_string($groupReceived);

// include file which assigns database connection variables
include_once('con.php');

//connecting to databse
$conn = mysql_connect($host, $user, $pass);
	mysql_select_db($db, $conn);
	// Database connection Error checking
	if(!$conn) {
		die('Could not connect to database' . mysql_error());
}
// Insert the user info into the database
	$retval = mysql_query("INSERT INTO groups(
	name,
	sub_of,
	sequence
	)VALUES(
	'$groupReceived',
	1,
	0
	) ",$conn);
 
	if($retval) {
		echo "group info updated\n";
		
	} else if(!$retval) {
		die('Could not insert row into group\n' . mysql_error());
	}
	mysql_close($conn);
 
?>