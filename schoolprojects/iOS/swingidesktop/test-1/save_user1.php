<?php
//to recive user registration info from client to save it to database

// receiving password from client
$passwordReceived = md5($_GET['password']);

//$passwordReceived = stripslashes($passwordReceived);

//save it from sql injection
//$passwordReceived = mysql_real_escape_string($passwordReceived);

//receiving email_id from client
$email = $_GET['email'];
//$email = stripslashes($email);
//$email = mysql_real_escape_string($email);
echo("\nData received by server is $email\n");
// include file which assigns database connection variables
include_once('con.php');

//connecting to databse
$conn = mysql_connect($host, $user, $pass);
	mysql_select_db($db, $conn);
	// Database connection Error checking
	if(!$conn) {
		die('Could not connect to database' . mysql_error());
}
// Insert the user info into the database
	$retval = mysql_query("INSERT INTO users (
	password,
	temp_password, 
	email, 
	view,
	post,
	add_users,
	add_categories,
	add_groups
	) VALUES (
	'$passwordReceived',
	'NULL', 
	'$email',
	1,
	0,
	0,
	0,
	0
	)",$conn);
 
	if($retval) {
		echo "user info updated\n";
		
	} else if(!$retval) {
		die('Could not insert row into users\n' . mysql_error());
	}
	
	$email = 'user12';
	
	$query = "SELECT * FROM users WHERE email = '$email'";
    $resultID = mysql_query($query, $conn) or die("Data not found.");
    
    $row = mysql_fetch_assoc($resultID); 
    $user_id = $row['user_id'];
    
    echo "<br />";
    echo $user_id;
	mysql_close($conn);
	
 
?>
	