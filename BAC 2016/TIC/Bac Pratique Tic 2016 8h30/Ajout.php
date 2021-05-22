<?php
mysql_connect('localhost','root','') or die('Erreur de connexion');
mysql_select_db('BD2016') or die('Erreur de connexion!');
$piece = $_POST['S1'];
$salle= $_POST['S2'];
$date=$_POST['A'].'-'.$_POST['M'].'-'.$_POST['J'];
$act=$_POST['T0'];
$req="SELECT * FROM Spectacle WHERE DateSpectacle='$date' AND IdSalle = '$salle'";
$res=mysql_query($req);
if (mysql_num_rows($res) != 0){
	echo('Salle non disponible');
}
else{
	$req="SELECT * FROM Spectacle WHERE IdPiece='$piece' AND DateSpectacle='$date'";
	$res=mysql_query($req);
	if(mysql_num_rows($res) != 0){
		echo('Piece dèja programmée');
	}
	else{
		$req="INSERT INTO Spectacle VALUES ('$piece','$date','$salle','$act')";
		$res=mysql_query($req);
		echo('Ajout effectué avec succès');
	}
}
?>