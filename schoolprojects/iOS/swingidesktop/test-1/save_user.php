<?php
/*
Please do not add any extra echo comments out of this file to the client.
currently there is one which echos the userid so that we can save it in the
phone client for future use on the client side. 
*/
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

// include file which assigns database connection variables
include_once('con.php');

//connecting to databse
$conn = mysql_connect($host, $user, $pass);
	mysql_select_db($db, $conn);
	// Database connection Error checking
	if(!$conn) 
	{
		die('Could not connect to database' . mysql_error());
	}


$query = "SELECT * FROM users WHERE email = '$email'";
$resultID = mysql_query($query, $conn) or die("Data not found."); 
$numrows =mysql_num_rows($resultID);


if($numrows > 1)
{
	die ("The user id already exists 1");
}

else
{
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
		1,
		0,
		0,
		0
		)",$conn);
	 
		if($retval) 
		{
		
		} 
		else if(!$retval) 
		{
			die('Could not insert row into users\n' . mysql_error());
		}
		
		$query = "SELECT * FROM users WHERE email = '$email'";
		$resultID = mysql_query($query, $conn) or die("Data not found.");
		
		$row = mysql_fetch_assoc($resultID); 
		$user_id = $row['user_id'];
		
		//this adds an entry to the user_to_categoties so that the user is set to the default category.
		$retval = mysql_query("INSERT INTO users_to_categories (
		user_id,
		category_id, 
		moderate
		) VALUES (
		'$user_id',
		'1', 
		'3'
		)",$conn);
	 
		if($retval)
		{
				
		} 
		else if(!$retval) 
		{
			die('Could not insert row into users\n' . mysql_error());
		}
		
		$retval = mysql_query("INSERT INTO users_to_groups (
		user_id,
		group_id, 
		moderate,
		subscribe
		) VALUES (
		'$user_id',
		'1', 
		'3',
		'0'
		)",$conn);
	 
		if($retval)
		{
			
		} 
		else if(!$retval)
		{
			die('Could not insert row into users\n' . mysql_error());
		}
		
		//this echos the user_id to the client for use on the client side.
		
		echo ("$user_id");
}
	mysql_close($conn);
	
 
?>
	