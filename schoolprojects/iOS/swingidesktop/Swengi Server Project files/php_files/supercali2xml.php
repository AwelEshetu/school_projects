<?php 

header("Content-type: text/xml"); 

require_once('con.php');

$linkID = mysql_connect($host, $user, $pass) or die("Could not connect to host."); 
mysql_select_db($db, $linkID) or die("Could not find database."); 

$query = "SELECT * FROM events"; 
$resultID = mysql_query($query, $linkID) or die("Data not found."); 

 
 $xml_output = "<?xml version=\"1.0\"?>\n"; 
$xml_output .= "<calendar>\n"; 

for($x = 0 ; $x < mysql_num_rows($resultID) ; $x++){ 
    $row = mysql_fetch_assoc($resultID); 
    $xml_output .= "\t<event>\n"; 
    $xml_output .= "\t\t<Event_id>" . $row['event_id'] . "</Event_id>\n";
   
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
    $xml_output .= "\t\t<user_id>" . $row['user_id'] . "</user_id>\n";
    $xml_output .= "\t\t<group_id>" . $row['group_id'] . "</group_id>\n";
    $xml_output .= "\t\t<status_id>" . $row['status_id'] . "</status_id>\n";
    $xml_output .= "\t\t<stamp>" . $row['stamp'] . "</stamp>\n";
    
    $xml_output .= "\t</event>\n"; 
} 

$xml_output .= "</calendar>"; 

echo $xml_output; 

 
 ?> 