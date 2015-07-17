<?php

$host = "localhost"; 
$user = "swengi11"; 
$pass = "swengi11"; 
$database = "supercali"; 



$linkID = mysql_connect($host, $user, $pass) or die("Could not connect to host."); 
mysql_select_db($database, $linkID) or die("Could not find database."); 

$doc = new DOMDocument();
  $doc->load( 'newevent.xml' );
  
  $event = $doc->getElementsByTagName( "event" );
  foreach( $event as $event )
  {
  $event_id = $event->getElementsByTagName( "event_id" );
  $event_id = $event_id->item(0)->nodeValue;
  
  $title = $event->getElementsByTagName( "title" );
  $title = $title->item(0)->nodeValue;
  
  $description = $event->getElementsByTagName( "description" );
  $description = $description->item(0)->nodeValue;
  
  $stamp = $event->getElementsByTagName( "stamp" );
  $stamp = $stamp->item(0)->nodeValue;
 
  $query = "INSERT INTO events(event_id, title, description, stamp) VALUES('$event_id', '$title', '$description', '$stamp')";
  $result = mysql_query($query)or die("table not found.");


echo "The data has been added to the database.";

  }

?>
  