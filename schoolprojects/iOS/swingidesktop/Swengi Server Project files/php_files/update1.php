   <?php
    include_once('con.php');
    
    $eventCounter = 0;
	$locCounter = 0;
	$dateCounter = 0;
    $data = file_get_contents("test.xml");
	$xml = simplexml_load_string($data);
  	print_r($xml);
    echo "<br />";
    
    	// Initialization
	$conn = mysql_connect($host, $user, $pass);
	mysql_select_db($db, $conn);
 
	// Error checking
	if(!$conn) {
		die('Could not connect ' . mysql_error());
	}
 
echo "So far so good";
echo "<br />";

//This is the top loop right here that's supposed to hold the whole shebang...
foreach($xml->children() as $event) 
{

echo "Entered the main foreach";
echo "<br />";

//Check for event-tag. Once found, work the magic.
if(($event->getName())==event)
{

echo "Got inside the main foreach's if statement, wohoo!";
echo "<br />";

//This handles the singular events
foreach($xml->children() as $child) 
{
        echo "Entered the inner loop, even better!";
        echo "<br />";
    	if(($child->getName())==event_id)
    	{
			$event_id=$child;
		}
		echo $event_id;
		echo "<br />";
	 	if(($child->getName())==title)
	 	{
			$title=$child;
	  	}
	 	if(($child->getName())==description)
	 	{
			$description=$child;
		}
		if(($child->getName())==date)
	 	{
			$date=$child;
		}
		if(($child->getName())==starttime)
	 	{
			$startTime=$child;
		}
		if(($child->getName())==endtime)
	 	{
			$endTime=$child;
		}
		if(($child->getName())==user_id)
	 	{
			$user_id=$child;
		}
		if(($child->getName())==latitude)
	 	{
			$latitude=$child;
	  	}	
	 	if(($child->getName())==longitude)
	 	{
			$longitude=$child;
		}
		
						
		
}

		// Protect against sql injections
	
 	
 	$query = "SELECT event_id FROM events ORDER BY event_id DESC"; 
	$resultID = mysql_query($query, $conn) or die("Data not found.");
	$row = mysql_fetch_assoc($resultID); 
	$event_id = $row['event_id'] + 1;
	
	$date1 = $date . " " . $startTime;
	$date2 = $date . " " . $endTime;
	echo $date1;
	// Insert the score
	$retval = mysql_query("INSERT INTO events(
			title,
			description,
			user_id,
			date
		) VALUES (
			'$title',
			'$description',
			'$user_id',
			'$date1'
			)",$conn);
 
	if($retval) {
		$eventCounter++;
		
	} else if(!$retval) {
		die('Could not insert row into events\n' . mysql_error());
	}
	
	$retval = mysql_query("INSERT INTO dates(
			event_id,
			date,
			end_date
		) VALUES (
			'$event_id',
			'$date1',
			'$date2'
			)",$conn);
 
	if($retval) {
		$dateCounter++;
		
	}else if(!$retval)
		{
		die('Could not insert row into dates\n' . mysql_error());
		}
	
	$retval = mysql_query("INSERT INTO geolocation(
			event_id,
			user_id,
			latitude,
			longitude
		) VALUES (
			'$event_id',
			'$user_id',
			'$latitude',
			'$longitude'
			)",$conn);
			
	if($retval) {
		$locCounter++;
		
	}else if(!$retval) 
		{
		die('Could not insert row into Locations\n' . mysql_error());
		}
		
}		
}		
		
    echo ($eventCounter." events updated\n");
    echo "<br />";
    echo ($locCounter." locations updated\n");
    echo "<br />";
    echo ($dateCounter." dates updated\n");
    echo "<br />";

	
	mysql_close($conn);
?>