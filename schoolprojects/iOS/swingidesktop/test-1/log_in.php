<?php

 require_once('con.php');

$emailReceived = $_GET['email'];
 
$passwordReceived = md5($_GET['password']);


$linkID = mysql_connect($host, $user, $pass) or die("Could not connect to host."); 
mysql_select_db($db, $linkID) or die("Could not find database."); 

 
$query = "SELECT * FROM users WHERE email = '$emailReceived'";
$resultID = mysql_query($query, $linkID) or die("Data not found."); 
$numrows =mysql_num_rows($resultID);
 
$row = mysql_fetch_assoc($resultID); 
$email = $row['email'];
$password = $row['password'];
$user_id = $row['user_id'];

if($numrows<1){
	die ("The user id you provided is not in our record 1");
	}
else if($passwordReceived == $password)
{
	echo ("$user_id\n\n");
}
else
{
	echo ("wrong password");
}


?>