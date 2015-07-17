<?php

include "includes/start.php";
$page_title = $lang["title_log_in"];

include "includes/header.php";
if ($_SESSION['user_id'] == 1) {
?>
<form action="actions.php" method="post">
<table>
<tr>
<td><?php echo $lang["email"]; ?>:</td><td><input type="text" name="email" size="30"></td>
</tr>
<tr>
<td><?php echo $lang["password"]; ?>:</td><td><input type="password" name="password" size="30"></td>
</tr>
</table>
<input type="hidden" name="return_to" value="<?php echo $_REQUEST["return_to"] ? $_REQUEST["return_to"]:$_SERVER['HTTP_REFERER']; ?>">
<?php include "includes/hidden_fields.php"; ?>
<input type="submit" name="mode" value="Log In" />
</form>
<?php
} else {
	echo "<p>".$lang["logged_in"]."</p>\n";
}

include "includes/footer.php";
?>