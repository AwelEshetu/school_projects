<?php

include_once('con.php');

$linkID = mysql_connect($host, $user, $pass) or die("Could not connect to host."); 
mysql_select_db($db, $linkID) or die("Could not find database."); 

$query = "SELECT * FROM  trigger_updates WHERE 
checked = 1";
$result = mysql_query($query, $linkID) or die("Data not found."); 

$count=mysql_num_rows($result);

for($i=0;$i<$count;$i++)
{
	$sql = "DELETE FROM trigger_updates WHERE checked = 1";
	$result = mysql_query($sql);

}

mysql_close($linkID);

echo $count;
echo " rows delete";
?>