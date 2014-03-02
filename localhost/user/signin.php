<?php
session_start();
require_once("../link.php");

$name = $_POST['name'];
$pwd = $_POST['pwd'];
// $name = $_GET['name'];
// $pwd = $_GET['pwd'];
$sql = "select AcountName, AcountFace from TIME61.AcountInfo where AcountName = '{$name}' and AcountPassword = '{$pwd}';";
$req = mysql_query($sql,$link);


if($result = mysql_fetch_assoc($req)){
	echo "YES";
	$_SESSION['ACOUNTNAME'] = $result['AcountName'];
	$_SESSION['ACOUNTPASSWORD'] = $result['AcountFace'];

}else{
	die("登入失败:" . mysql_error());
}

 ?>