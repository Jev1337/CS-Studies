<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Document sans titre</title>
</head>

<body>
<table width="467" height="86" border="1">
  <tr>
    <td width="77">Matiere</td>
    <td width="374">Pourcentage d'avancement de la saisie des notes des &eacute;l&egrave;ves </td>
  </tr>
  <?php
  	mysql_connect('localhost','root','') or die('Erreur de connexion');
	mysql_select_db('BD2013');
	$req="SELECT CodeMatiere, COUNT(NumEleve), COUNT(Numero) FROM Note N,Eleve E WHERE N.NumEleve=E.Numero AND DC IS NOT NULL AND DS IS NOT NULL GROUP BY CodeMatiere";
	$res=mysql_query($req);
	while($T=mysql_fetch_array($res)){
		$p = ($T[1]/$T[2])* 100;
		echo('<tr>
    <td width="77">'.$T[0].'</td>
    <td width="374">'.$p.'</td>
  </tr>');
	}
  ?>
</table>

</body>
</html>
