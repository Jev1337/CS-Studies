<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Document sans titre</title>
</head>

<body>
<table width="665" border="1">
  <tr>
    <th width="74" scope="col">N&deg; d'ordre </th>
    <th width="144" scope="col">Titre de la pi&egrave;ce </th>
    <th width="189" scope="col">Libell&eacute; de la salle </th>
    <th width="230" scope="col">Date du spectacle </th>
  </tr>
    <?php
	mysql_connect('localhost','root','') or die('Erreur de connexion');
	mysql_select_db('BD2016') or die('Erreur de connexion');
	$req="SELECT Titre,Libelle,DateSpectacle FROM Spectacle Sp, Salle S, Piece P WHERE Sp.IdPiece = P.IdPiece AND Sp.IdSalle = S.IdSalle ORDER BY DateSpectacle , Titre";
	$res=mysql_query($req);
	$i=0;
	while($T = mysql_fetch_array($res)){
	$i++;
		echo('  <tr>
    <td width="74" scope="col">'.$i.'</td>
    <td width="144" scope="col">'.$T[0].'</td>
    <td width="189" scope="col">'.$T[1].'</td>
    <td width="230" scope="col">'.$T[2].'</td>
  </tr>');
	}
	?>
</table>
<p>
</p>
</body>
</html>
