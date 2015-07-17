
<?php
// php script created by Udeep Shakya		//
// for the Swengi project at Metropolia			//
/* This file expects to get token no. and user_id from client. This script then
checks if that user with that user_id exists in database and if yes then
save the user_id and token number in the table "tokens"
*/
//

/////////////////////////////////////////////////

echo("\nprocess started in server\n");

// receiving token from client
$tokenreceived = $_GET['newToken'];
//$tokenreceived = stripslashes($tokenreceived);
//$tokenreceived = mysql_real_escape_string($tokenreceived);
echo("\nToken received by server is $tokenreceived\n");

// receiving user_id from client
$user_id = $_GET['user_id'];
//$user_id = stripslashes($user_id);
//$user_id = mysql_real_escape_string($user_id);

// include file which assigns database connection variables
include_once('con.php');

//connecting to databse
$conn = mysql_connect($host, $user, $pass);
	mysql_select_db($db, $conn);
	// Database connection Error checking
	if(!$conn) {
		die('Could not connect to database' . mysql_error());
	}
	
	//selecting email of the client from table "users"
   $query = "SELECT email FROM users WHERE user_id=\"$user_id\""; 
   $sqlreturn = mysql_query($query, $conn) or die("\n Cannot connect to table users");
	$numrows =mysql_num_rows($sqlreturn);
	
	// if client record is not found the users table, ie, if the client is not registered
	if($numrows<1){
	die ("The user id you provided is not in our record");
	}
	
	//if there are multiple users with same user_id
	else if ($numrows>1){
	die("Users table error, mulitple records with same user_id found, please report to server team");
	}
	

			
			//insert new record in table "tokens" with token_no for the client
			//or update the token_no if the record for that user already exist in table "tokens"
			$sql = "INSERT INTO tokens (user_id,token_no) VALUES ($user_id,\"$tokenreceived\") ON DUPLICATE KEY UPDATE token_no=\"$tokenreceived\"";
			$sqlresponse = mysql_query($sql, $conn) or die("Cannot insert or update table.");
			$row=mysql_fetch_assoc($sqlreturn);
			$email = $row['email'];
			echo("your token is saved to username: $email");

//closing the database connection
mysql_close($conn);



?>