<?php 

header("Content-type: text/xml"); 

require_once('con.php');

$linkID = mysql_connect($host, $user, $pass) or die("Could not connect to host."); 
mysql_select_db($db, $linkID) or die("Could not find database."); 

$query = "SELECT * FROM events, trigger_updates WHERE 
trigger_updates.user_id = 5 AND events.event_id = trigger_updates.event_id"; 
$resultID = mysql_query($query, $linkID) or die("Data not found."); 

 
 
 $xml_output = "<?xml version=\"1.0\"?>\n"; 
$xml_output .= "<calendar>\n"; 

for($x = 0 ; $x < mysql_num_rows($resultID) ; $x++){ 
    $row = mysql_fetch_assoc($resultID); 
    $eventid = $row['event_id'];
    $xml_output .= "\t<event event_id =  \"$eventid\">\n"; 
    $xml_output .= "\t\t<event_id>" . $row['event_id'] . "</event_id>\n";
   
        // Escaping illegal characters 
        $row['title'] = str_replace("&", "&", $row['title']); 
        $row['title'] = str_replace("<", "<", $row['title']); 
        $row['title'] = str_replace(">", "&gt;", $row['title']); 
        $row['title'] = str_replace("\"", "&quot;", $row['title']);
    $xml_output .= "\t\t<title>" . $row['title'] . "</title>\n";
    $xml_output .= "\t\t<venue_id>" . $row['venue_id'] . "</venue_id>\n";
    $xml_output .= "\t\t<contact_id>" . $row['contact_id'] . "</contact_id>\n";
    
    // Escaping illegal characters 
        $row['description'] = str_replace("&", "&", $row['description']); 
        $row['description'] = str_replace("<", "<", $row['description']); 
        $row['description'] = str_replace(">", "&gt;", $row['description']); 
        $row['description'] = str_replace("\"", "&quot;", $row['description']); 
    $xml_output .= "\t\t<description>" . $row['description'] . "</description>\n";
    $xml_output .= "\t\t<category_id>" . $row['category_id'] . "</category_id>\n";
    
    	$row['user_id'] = str_replace("&", "&", $row['user_id']); 
        $row['user_id'] = str_replace("<", "<", $row['user_id']); 
        $row['user_id'] = str_replace(">", "&gt;", $row['user_id']); 
        $row['user_id'] = str_replace("\"", "&quot;", $row['user_id']);
    $xml_output .= "\t\t<user_id>" . $row['user_id'] . "</user_id>\n";
    $xml_output .= "\t\t<group_id>" . $row['group_id'] . "</group_id>\n";
    $xml_output .= "\t\t<status_id>" . $row['status_id'] . "</status_id>\n";
    $xml_output .= "\t\t<stamp>" . $row['stamp'] . "</stamp>\n";
    //dates
    $xml_output .= "\t\t<date>" . $row['date'] . "</date>\n";
    $xml_output .= "\t\t<end_date>" . $row['end_date'] . "</end_date>\n";   
    //geoloc
    $xml_output .="\t\t<latitude>" . $row['latitude'] . "</latitude>\n";
	$xml_output .="\t\t<longitude>" . $row['longitude'] . "</longitude>\n";	
	
    $xml_output .= "\t</event>\n"; 
} 

$xml_output .= "</calendar>"; 

// sets checked to 1 for each event that has be pulled by this script.

$xml = simplexml_load_string($xml_output);
$i =0;
foreach ($xml->event as $e) 
{
	 $event_id = $e->event_id;
	 
	 $retval = mysql_query("UPDATE trigger_updates set checked = '1'
	 WHERE event_id = $event_id",$linkID);
	$i++;
}


echo $xml_output; 


 mysql_close($linkID);
 ?> 