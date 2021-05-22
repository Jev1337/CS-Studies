<?php
mysql_connect('localhost','root','') or die('Erreur de connexion');
mysql_select_db('BDSPORT') or die('Erreur de connexion');
$code = $_POST['T1'];
$np = $_POST['T2'];
$age = $_POST['T3'];
$email = $_POST['T4'];
$record = $_POST['T5'];
$disp = $_POST['R1'];
$date = $_POST['A'].'-'.$_POST['M'].'-'.$_POST['J'];
$ins="INSERT INTO Competition VALUES ('$code','$date','$disp','$record')";
$req="SELECT * FROM Athlete WHERE Code='$code'";
$res=mysql_query($req);
if (mysql_num_rows($res) ==0){
	$req="INSERT INTO Athlete VALUES('$code','$np','$age','$email')";
	$res=mysql_query($req);
	$res=mysql_query($ins);
	echo('Inscription et ajout effectués avec succès');
}
else{
	$req="SELECT DateC, Record FROM Competition WHERE code = '$code' ORDER BY Record DESC LIMIT 1";
	$res=mysql_query($req);
	$T=mysql_fetch_array($res);
	$D1=explode("-",$T[0]);
	$D2=explode("-",$date);
	if ($T[1] > $record && $D1[1] == $D2[1]){
		$req="UPDATE Competition SET Record='$record',DateC='$date'";
		$res=mysql_query($res);
		echo("Record et date modifés");
	}
	else{
		$res=mysql_query($ins);
		echo("Compétition ajoutée");
	}
}
?>