<?php
mysql_connect('localhost','root','') or die('Erreur de connexion');
mysql_select_db('BD2014') or die('Erreur de connexion');
$datem = date("Y-m-d");
$cin= $_POST['textbox1'];
$code= $_POST['S'];
$dur= $_POST['R'];
$date = date("Y-m-d", strtotime("+".$dur." months"));
$req= "SELECT * FROM Abonne WHERE Cin='$cin'";
$res=mysql_query($req);
if (mysql_num_rows($res) == 0){
	echo('Abonné inexistant');
}
else{
	$req="SELECT * FROM Abonnement WHERE Code='$code' AND Cin='$cin' AND DateEch > '$datem'";
	$res=mysql_query($req);
	if (mysql_num_rows($res)!= 0){
		echo('Vous êtes déjà abonné à cette revue');
	}
	else{
		$req="INSERT INTO Abonnement VALUES ('$cin','$code','$datem','$date')";
		$res= mysql_query($req);
		$req="SELECT PrixMens FROM Revue WHERE Code='$code'";
		$res= mysql_query($req);
		$T=mysql_fetch_array($res);
		$prix= $T[0] * $dur;
		echo($prix.' est le prix a payer!');
	}
}
?>