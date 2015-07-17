<?php

/* php script created Udeep Shakya
based on Jason Dansie's script EventInput.php and Dinesh's script old_event.php
This script deletes an event from database.
This script expects client's user_id (from GET method), event's event id, title and description (by POST method). you can change both to POST method or according to client's app.
It then checks record with user given title and description in table "events". It deletes the record only if event id and user id sent by the client matches with the data in database.

*/

// for the Swengi project at Metropolia			//
/////////////////////////////////////////////////

// clients user_id who hits delete command
$client= $_GET['user_id'];
//$client= stripslashes($client);
//$client= mysql_real_escape_string($client);



include_once('con.php');

//gets the event to delete from the phone app, the app in phone should
// provide event_id, title and description of event.
$eventToDelete = $_POST[ 'eventToDelete' ];

//converts the post into a string for manipulation
$xml = simplexml_load_string($eventToDelete);


// Initialization
	$conn = mysql_connect($host, $user, $pass);
	mysql_select_db($db, $conn);
 
	// Error checking
	if(!$conn) {
		die('Could not connect to database ' . mysql_error());
	}
 

// For each  node, we make a separate variable, in this case only one node should be sent by client.
foreach ($xml->event as $e)
{
   
   $delete_eventId = $e->event_id;
   $title = $e->title;
   $description = $e->description;
	
	
	// Protect against sql injections, but commented here as it may not work
	
	/*
	$delete_eventId= stripslashes($delete_eventId);
	$title= stripslashes($title);
	$description = stripslashes($description);
	
	$delete_eventId= mysql_real_escape_string($delete_eventId);
	$title= mysql_real_escape_string($title);
	$description = mysql_real_escape_string($description);
	*/
  $sql= "SELECT user_id FROM events WHERE title = \"$title\" AND description=\"$description\" AND event_id = $delete_eventId";
	$sqlresult = mysql_query($sql, $conn) or die("Could not connect to table");
	$count =mysql_num_rows($sqlresult);
	if($count<1)
	{
		echo("Sorry, event not found in database");
	}
	elseif($count>1) //in case, multiple records are found
	{
		echo("Multiple records found for same event, cannot delete, report admin");
	}
	else // if only one record for event is found
	{
		$row = mysql_fetch_assoc($sqlresult);
		
		if($row['user_id'] == $client) // if the client is creator of the event
		{
			//delete the event from all related tables
			$delete_sql = "DELETE FROM events WHERE event_id =\"$delete_eventId\"";
			$deleteresult = mysql_query($delete_sql,$conn) or die ("Cannot delete from events");

			$delete_sql = "DELETE FROM geolocation WHERE event_id = \"$delete_eventId\"";
			$deleteresult = mysql_query($delete_sql,$conn) or die ("Cannot delete from geolocation");	
	
			$delete_sql = "DELETE FROM alarm WHERE event_id = \"$delete_eventId\"";
			$deleteresult = mysql_query($delete_sql,$conn) or die ("Cannot delete from alarm");

			$delete_sql = "DELETE FROM trigger_updates WHERE event_id = \"$delete_eventId\"";
			$deleteresult = mysql_query($delete_sql,$conn) or die ("Cannot delete from trigger_updates");
	
			$delete_sql = "DELETE FROM dates WHERE event_id = \"$delete_eventId\"";
			$deleteresult = mysql_query($delete_sql,$conn) or die (mysql_error($conn));
		
			echo("Event deleted from events, geolocation, alarm, trigger_updates and dates");
		
		}
		
		else // if client is not creator of event
		{
			echo(" sorry, you cannot delete event created others");
		}
	
		
		
	}
		
}
mysql_close($conn);
 
?>