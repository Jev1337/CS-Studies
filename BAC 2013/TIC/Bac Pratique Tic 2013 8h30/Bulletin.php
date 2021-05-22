<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Document sans titre</title>
</head>

<body>


  <?php
  	mysql_connect('localhost','root','') or die('Erreur de connexion');
	mysql_select_db('BD2013');
	$num = $_POST['T1'];
	$req = "SELECT * FROM Eleve WHERE Numero = '$num'";
	$res = mysql_query($req);
	if(mysql_num_rows($res) == 0){
		echo("Numéro de l'élève n'existe pas");
	}
	else{
		$req="SELECT * FROM Note WHERE NumEleve = '$num'";
		$res= mysql_query($req);
		if (mysql_num_rows($res) != 3){
		echo("Saisie incomplète des notes");
		} else{
		$req="SELECT Code,NomPrenom,Coeff,Libelle,DC,DS FROM Note N, Eleve E, Matiere M WHERE N.NumEleve = E.Numero AND N.CodeMatiere = M.Code GROUP BY Code ORDER BY Libelle"; //ORDER BY Libelle(Algo,BD puis TIC comme le tableau demandé)
		$res=mysql_query($req);
$moygen=0;
		?>
		<table width="451" border="1">
  <tr>
    <th width="180" scope="row">Bulletin de notes de l'&eacute;l&egrave;ve </th>
    <td width="255"><?php $T=mysql_fetch_array($res); echo($T[1]); ?></td>
  </tr>
  <tr>
    <th scope="row">Algorithmique et programmation </th>
    <td>
	<?php 
		$moy=($T[4]+$T[5])/2;
		$moygen=$moygen+$moy;
		$prod= $moy * $T[2];
	echo($T[2].'|'.$T[4].'|'.$T[5].'|'.$moy.'|'.$prod); ?>
	</td>
  </tr>
  <tr>
    <th scope="row">Bases de donn&eacute;es </th>
    <td>	
	<?php
		$T=mysql_fetch_array($res);  
		$moy=($T[4]+$T[5])/2;
		$moygen=$moygen+$moy;
		$prod= $moy * $T[2];
	echo($T[2].'|'.$T[4].'|'.$T[5].'|'.$moy.'|'.$prod); ?>
	</td>
  </tr>
  <tr>
    <th scope="row">Technologies de l'Information et de la Communication </th>
    <td>
	<?php
		$T=mysql_fetch_array($res);  
		$moy=($T[4]+$T[5])/2;
		$moygen=$moygen+$moy;
		$prod= $moy * $T[2];
	echo($T[2].'|'.$T[4].'|'.$T[5].'|'.$moy.'|'.$prod); ?>
	</td>
  </tr>
  <tr>
    <th scope="row">Moyenne g&eacute;n&eacute;rale </th>
    <td>	
	<?php
		$moygen=$moygen / 3;
		echo($moygen);
	 ?>
	</td>
  </tr>
  </table>
  <?php
		}
	}
?>

<p>&nbsp;</p>
<p>
  
</p>
<p>&nbsp;</p>
</body>
</html>
