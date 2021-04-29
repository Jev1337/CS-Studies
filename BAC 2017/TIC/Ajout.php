<?php
	//establishing db connections:
	mysql_connect('localhost','root','') or die('Erreur!');
	mysql_select_db('BD2017') or die ('Erreur!');
	//post imports:
	$cin = $_POST['textbox1'];
	$nom = $_POST['textbox2'];
	$prenom = $_POST['textbox3'];
	$tel = $_POST['textbox4'];
	$codeart = $_POST['S'];
	$prix = $_POST['textbox5'];
	//queries:
	$req="SELECT PrixBase FROM Article WHERE Code = '$codeart'";
	$res=mysql_query($req);
	$T = mysql_fetch_array($res);
	if ($T[0] > $prix)
		echo('Offre rejetée!');
	else{
			$req="SELECT * FROM Client WHERE Cin='$cin'";
			$res=mysql_query($req);
			if (mysql_num_rows($res)==0){
				$req="INSERT INTO Client VALUES ('$cin','$nom','$prenom','$tel')";
				$res=mysql_query($req);
				$req="INSERT INTO Offre VALUES ('$cin','$codeart','$prix')";
				$res=mysql_query($req);
				echo("Offre enregistrée pour ce nouveau client");
		}
			else{
				$req="SELECT * FROM Offre WHERE Cin='$cin' AND Code='$codeart'";
				$res=mysql_query($req);
				if(mysql_num_rows($res)==0){
					$req="INSERT INTO Offre VALUES ('$cin','$codeart','$prix')";
					$res=mysql_query($req);
					echo("Nouvelle offre enregistrée");
				}
				else{
					$req="UPDATE Offre SET PrixPropose='$prix' WHERE Cin='$cin' AND Code='$codeart'";
					$res=mysql_query($req);
					echo("Mise à jour faite avec succès");
				}
			}
		}
?>