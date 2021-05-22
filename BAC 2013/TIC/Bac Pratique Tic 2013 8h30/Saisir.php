<?php
	mysql_connect('localhost','root','') or die('Erreur de connexion');
	mysql_select_db('BD2013');
	$num = $_POST['T1'];
	$DC = $_POST['T2'];
	$DS = $_POST['T3'];
	$S = $_POST['S'];
	$req="SELECT * FROM Eleve WHERE Numero = '$num'";
	$res= mysql_query($req);
	if (mysql_num_rows($res) ==0){
		echo('Elève non inscrit');
	}
	else{
		$req="SELECT * FROM Note WHERE NumEleve = '$num' AND CodeMatiere = '$S' AND DC IS NOT NULL AND DS IS NOT NULL";
		$res= mysql_query($req);
		if(mysql_num_rows($res) != 0){
			echo('Notes déjà saisies');
		}
		else{
			$req="INSERT INTO Note VALUES('$num','$S','$DC','$DS')";
			$res= mysql_query($req);
			echo('Ajout des notes avec succées');
		}
	}
?>
