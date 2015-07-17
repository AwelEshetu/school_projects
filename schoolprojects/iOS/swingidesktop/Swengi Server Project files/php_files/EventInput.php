<?php

// php script created by Jason Dansie			//
// for the Swengi project at Metropolia			//
/////////////////////////////////////////////////


include_once('con.php');

//gets the post from the phone app
$calendar = $_POST[ 'calendar' ];

//converts the post into a string for manipulation
$xml = simplexml_load_string($calendar);


// Initialization
	$conn = mysql_connect($host, $user, $pass);
	mysql_select_db($db, $conn);
 
	// Error checking
	if(!$conn) {
		die('Could not connect ' . mysql_error());
	}
 

// For each  node, we make a separate variable. 
foreach ($xml->event as $e) {
   
   $event_id = $e->event_id;
   $title = $e->title;
   $venue_id = $e->venue_id;
   $contact_id = $e->contact_id;
   $description = $e->description;
   $category_id = $e->category_id;
   $user_id = $e->user_id;
   $group_id = $e->group_id;
   $status_id = $e->status_id;
   $stamp = $e->stamp;
   $date = $e->date;
   $end_date = $e->end_date;
   
   
   $latitude = $e->latitude;
   $longitude = $e->longitude;
   $startTime = $e->starttime;
   $endTime = $e->endtime;
   
/* this clears bad characters from the code. befor its put into the database
	and protects against injection attacks
*/
   if(get_magic_quotes_gpc()) {
    $title = mysql_real_escape_string(stripslashes($title));
  	$description = mysql_real_escape_string(stripslashes($description));
  	$date = mysql_real_escape_string(stripslashes($date));
	
} else {
	$title = mysql_real_escape_string($title );
  	$description = mysql_real_escape_string($description );
  	$date = mysql_real_escape_string($date );
	
}

   
   
  
   /*this gets the current event_id and adds one to it so the insert 
   	into the dates table works correctly
   */
   $query = "SELECT event_id FROM events ORDER BY event_id DESC"; 
	$resultID = mysql_query($query, $conn) or die("Data not found.");
	$row = mysql_fetch_assoc($resultID); 
	$date_event_id = $row['event_id'] + 1;
	

	//sets the date porper for the database
	$date1 = $date . " " . $startTime;
	$date2 = $date . " " . $endTime;
	
	
	// Insert the event/events into the database
	$retval = mysql_query("INSERT INTO events(
			title,
			venue_id,
			contact_id,
			description,
			category_id,
			user_id,
			group_id,
			status_id,
			date
		) VALUES (
			'$title',
			'$venue_id',
			'$contact_id',
			'$description',
			'$category_id',
			'$user_id',
			'$group_id',
			'$status_id',
			'$date1'
			)",$conn);
 
	if($retval) {
		echo "events updated\n";
		
	} else if(!$retval) {
		die('Could not insert row into events\n' . mysql_error());
	}
	
	$retval = mysql_query("INSERT INTO dates(
			event_id,
			date,
			end_date
		) VALUES (
			'$date_event_id',
			'$date1',
			'$date2'
			)",$conn);
 
	if($retval) {
		echo "dates updated\n";
		
		
	} else if(!$retval) {
		die('Could not insert row into dates\n' . mysql_error());
	}
	
	$retval = mysql_query("INSERT INTO geolocation(
			event_id,
			user_id,
			latitude,
			longitude
		) VALUES (
			'$date_event_id',
			'$user_id',
			'$latitude',
			'$longitude'
			)",$conn);
 
	if($retval) {
		echo "GPS updated\n";
		
		
	} else if(!$retval) {
		die('Could not insert row into dates\n' . mysql_error());
	}
   
}
mysql_close($conn);
 
?>