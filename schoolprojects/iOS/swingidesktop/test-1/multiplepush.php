<?php

// php script moified by Udeep Shakya based on Jason's script	//
// for the Swengi project at Metropolia			//
/* This script selects multiple tokens from database which belong to users of groups which have an updated event. And then the script pushes a notification to the devices of those users.
*/
//

include_once('con.php');
// Initialization of connection to database
	$conn = mysql_connect($host, $user, $pass);
	mysql_select_db($db, $conn);
 
// Error checking
	if(!$conn) {
		die('Could not connect to database ' . mysql_error($conn));
	}


// Put your private key's passphrase here:
$passphrase = 'swengi11';



////////////////////////////////////////////////////////////////////////////////

$ctx = stream_context_create();
stream_context_set_option($ctx, 'ssl', 'local_cert', '/var/www/test/cert.pem');
stream_context_set_option($ctx, 'ssl', 'passphrase', $passphrase);

// Open a connection to the APNS server
$fp = stream_socket_client(
	'ssl://gateway.sandbox.push.apple.com:2195', $err,
	$errstr, 60, STREAM_CLIENT_CONNECT|STREAM_CLIENT_PERSISTENT, $ctx);

if (!$fp)
	exit("Failed to connect: $err $errstr" . PHP_EOL);

echo 'Connected to APNS' . PHP_EOL;
echo "<br />";


//selecting multiple tokens which belong to users of groups whose events are updated.
$query = "SELECT token_no, email FROM tokens, trigger_updates, events, users_to_groups, users WHERE 
trigger_updates.updated = 1 AND trigger_updates.event_id = events.event_id AND events.group_id=users_to_groups.group_id AND users_to_groups.user_id=tokens.user_id AND tokens.user_id=users.user_id";
$sqlreturn = mysql_query($query, $conn) or die("Data not found."); 

for($x = 0 ; $x < mysql_num_rows($sqlreturn) ; $x++){ 
    $row = mysql_fetch_assoc($sqlreturn); 
    $deviceToken=$row['token_no'];
    $email = $row['email'];
    
    // Put your alert message here:
	$message = "Your events have been updated, please do a pull. Message sent to ".$email;
    
   
   // Create the payload body
	$body['aps'] = array(
	'alert' => $message,
	'sound' => 'default'
	);

	// Encode the payload as JSON
	$payload = json_encode($body);
   
   
   // Build the binary notification
	$msg = chr(0) . pack('n', 32) . pack('H*', $deviceToken) . pack('n', strlen($payload)) . $payload;

	// Send it to the server
	$result = fwrite($fp, $msg, strlen($msg));

	if (!$result)
		echo 'Message not delivered' . PHP_EOL;
	else
		echo 'Message successfully delivered' . PHP_EOL;
	}




// Close the connection to the server
fclose($fp);
//close the databse connection
mysql_close($conn);