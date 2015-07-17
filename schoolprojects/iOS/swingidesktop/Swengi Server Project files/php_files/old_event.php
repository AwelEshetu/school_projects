<?php
//to get the current date and change it to required date which we want to dalete
$previous = mktime(0,0,0,date("m")-1,date("d"),date("Y"));
//converting the date into required format
$previous_month=date("Y-m-d",$previous);
echo $previous_month." ";
//for db connection
include_once('con.php');

$linkID = mysql_connect($host, $user, $pass) or die("Could not connect to host."); 
mysql_select_db($db, $linkID) or die("Could not find database."); 

//to select the events before the dates
$query = "SELECT * FROM events WHERE date < \"$previous_month\"";
$result = mysql_query($query, $linkID) or die("Data not found."); 

$count=mysql_num_rows($result);


for($i=0;$i<$count;$i++)
{
	$row = mysql_fetch_assoc($result);//

	$delete_eventId=$row['event_id'];
	echo $delete_eventId. " ";
	// to delete old events from events table
	$sql = "DELETE FROM events WHERE event_id = \"$delete_eventId\"";
	$deleteresult = mysql_query($sql,$linkID) or die ("Cannot delete from events");
	//to delete old events from geolocation table
	$sql = "DELETE FROM geolocation WHERE event_id = \"$delete_eventId\"";
	$deleteresult = mysql_query($sql,$linkID) or die ("Cannot delete from geolocation");	
	//to delete old events from alram table
	$sql = "DELETE FROM alarm WHERE event_id = \"$delete_eventId\"";
	$deleteresult = mysql_query($sql,$linkID) or die ("Cannot delete from alarm");
	//to delete old events from trigger_updates table
	$sql = "DELETE FROM trigger_updates WHERE event_id = \"$delete_eventId\"";
	$deleteresult = mysql_query($sql,$linkID) or die ("Cannot delete from trigger_updates");
	//to delete old events from dates table
	$sql = "DELETE FROM dates WHERE event_id = \"$delete_eventId\"";
	$deleteresult = mysql_query($sql,$linkID) or die (mysql_error($linkID));

}


mysql_close($linkID);

echo $count;
echo " rows delete";

?>