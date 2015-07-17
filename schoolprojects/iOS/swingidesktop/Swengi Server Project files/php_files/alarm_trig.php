   <?php
    include_once('con.php');
    
    // Initialization
	
	// connect to database
	
	$conn = mysql_connect($host, $user, $pass);
	mysql_select_db($db, $conn);
 
	// Error checking
	if(!$conn) {
		die('Could not connect ' . mysql_error());
	}
 
    
    $calendar = $_POST[ 'alarm' ];
	$calendar = str_replace("&", "&amp;", $calendar);
  	$xml = simplexml_load_string($calendar);
  	printf($xml);
    
   foreach($xml->children() as $child) {
        
       if(($child->getName())==event_id){
		$event_id=$child;
		$event_id = stripslashes($event_id);
		$event_id = mysql_real_escape_string($event_id);
	}
	 if(($child->getName())==alarm_id){
		$alarm_id=$child;
		$alarm_id = stripslashes($alarm_id);
		$alarm_id = mysql_real_escape_string($alarm_id);
	}
	 if(($child->getName())==event){
		$event=$child;
		$event = stripslashes($event);
		$event = mysql_real_escape_string($event);
	}
	 if(($child->getName())==event_date){
		$event_date=$child;
		$event_date = stripslashes($event_date);
		$event_date = mysql_real_escape_string($event_date);
	}
	 if(($child->getName())==alarm_time){
		$alarm_time=$child;
		$alarm_time = stripslashes($alarm_time);
		$alarm_time = mysql_real_escape_string($alarm_time);
	}
	 
	}
    
  echo "$event";
    
	}
	
	// Insert the score
	mysql_query("INSERT INTO alarm(
			event_id,
			alarm_id
			event,
			event_date,
			alarm_time
		) VALUES (
			$event_id,
			$alarm_id,
			$event,
			$event_date,
			$alarm_time,
		)",$conn);
 
	if(mysql_query) {
		echo "Alarm set to: $alarm_time";
		
	} else if(!mysql_query) {
		die('Could not insert row ' . mysql_error());
	}
 
	mysql_close($conn);
?>
    

