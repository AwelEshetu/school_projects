<?php
/*
*php and mysql
*/
$connection = mysql_connect('localhost','awele','1234');
if(!$connection)
{
  die('error connecting to database server'.mysql_error());
}
if(!mysql_select_db('awele',$connection))
{
die('error connecting to database'.mysqle_error());
}



?>