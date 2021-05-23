Program Exercice_8_9;
uses wincrt;
Type
tab = array[1..10000] of Integer;
Var
c:char;
T:tab;
N:Integer;
Procedure Remplir(var T:tab; var N:Integer);
Begin
end;
Procedure Affiche( T:tab; N:Integer);
Begin
end;
Procedure Modifier(var T:tab; var N:Integer);
Begin
end;
Procedure Ajouter(var T:tab; var N:Integer);
Begin
end;
Procedure Supprimer(var T:tab; var N:Integer);
Begin
end;
Procedure Inserer(var T:tab; var N:Integer);
Begin
end;
Procedure Min(T:Tab; N:Integer);
Begin
end;
Procedure Max(T:tab; N:Integer);
Begin
end;
Procedure Choix(var c:char);
Begin
	writeln('[A] - Abandon');
	writeln('[B] - Création du tableau');
	writeln('[C] - Affichage du tableau');
	writeln('[D] - Modification d''un élément du tableau');
	writeln('[E] - Ajout d''un élément à la fin du tableau');
	writeln('[F] - Suppression d''un élément du tableau');
	writeln('[G] - Insertion d''un élément dans le tableau');
	writeln('[H] - Recherche du plus petit élément du tableau');
	writeln('[I] - Recherche du plus grand élément du tableau');
	write('Votre Choix > ');
	readln(c);
end;

Procedure Menu(var c:char);
Begin
	Repeat
		writeln('-----------------------------');
		Choix(c);
		clrscr;
	until c in ['A'..'I'];
	case c of
		'B': Remplir(T,N);
		'C': Affiche(T,N);
		'D': Modifier(T,N);
		'E': Ajouter(T,N);
		'F': Supprimer(T,N);
		'G': Inserer(T,N);
		'H': Min(T,N);
		'I': Max(T,N);
	end;
end;

Begin
	Repeat
		Menu(c);
	until c = 'A';
end.