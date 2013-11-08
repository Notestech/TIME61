<?php 
	$link = mysql_connect("127.0.0.1:3306","root","1234");
	if (!$link) {
		die("connect mysql failed:" . mysql_error());
	}
	if (!mysql_select_db("TIME61",$link)) {
		die("connect database failed:" . mysql_error());
	}
	mysql_query("SET NAMES UTF8");
 ?>