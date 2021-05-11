<?php
$Mat = $_POST['S'];
mysql_connect('localhost','root','') or die('Erreur de connexion!');
mysql_select_db('BD2015') or die ('ERREUR DE BD!');
$req = "SELECT Nom,Prénom FROM Pilote WHERE Matricule='$Mat'";
$res = mysql_query($req);
$t = mysql_fetch_array($res);
echo($t[0].' '.$t[1].' a effectué :<br>');
$req = "SELECT DISTINCT Marque FROM Vol V, Avion A WHERE V.IdAvion = A.IdAvion AND V.MatPilote ='$Mat'";

$res = mysql_query($req);
while ($t = mysql_fetch_array($res)){
	$reqT = "SELECT SUM(Durée) FROM Vol V, Avion A WHERE V.IdAvion = A.IdAvion AND V.MatPilote ='$Mat' AND A.Marque = '$t[0]'";
	$resT=mysql_query($reqT);
	$t1=mysql_fetch_array($resT);
	
	$reqC = "SELECT COUNT(Marque) FROM Vol V, Avion A WHERE V.IdAvion = A.IdAvion AND V.MatPilote ='$Mat' AND A.Marque='$t[0]'";
	$resC=mysql_query($reqC);
	$t2=mysql_fetch_array($resC);
	$nb = $t1[0]/60;
	echo($t[0].' '.$nb.' '.$t2[0].'<br>');
	}
?>