Program Exercice_8_9;
uses wincrt;
Type
tab = array[1..10000] of Integer;
Var
c:char;
T:tab;
N:Integer;
Procedure Remplir(var T:tab; var N:Integer);
Var
i:Integer;
Begin
	writeln('Creation d''un tableau: ');
	Repeat
		write('Veuillez Saisir n: ');
		readln(n);
	until n>0;
	for i:= 1 to n Do
		T[i]:= Random(900)+100;
end;
Procedure Affiche( T:tab; N:Integer);
Var
i:Integer;
Begin
	writeln('Affichage du tableau: ');
	for i:= 1 to n Do
		write(T[i],' | ');
	writeln;
end;
Procedure Modifier(var T:tab; var N:Integer);
Var
i:Integer;
Begin
	writeln('Modification du tableau: ');
	Repeat
		write('Veuillez Saisir la case i que vous voulez modifier: ');
		readln(i);
	until i <= n;
	write('Veuillez Saisir La Nouvelle Valeur: ');
	readln(t[i]);
end;
Procedure Ajouter(var T:tab; var N:Integer);
Var
i:Integer;
Begin
	writeln('Ajout d''une case au tableau: ');
	n:=n+1;
	write('Veuillez Saisir La Nouvelle Valeur a Ajouter: ');
	readln(t[n]);
end;
Procedure Supprimer(var T:tab; var N:Integer);
Var
i,j:Integer;
Begin
		writeln('Suppression d''une case du tableau: ');
		Repeat
			write('Veuillez Saisir La Case A supprimer: ');
			readln(i);
		until i<=n;
		for j:= i to n-1 Do
			t[j]:=t[j+1];
		t[n]:=0;
		n:=n-1;
end;
Procedure Inserer(var T:tab; var N:Integer);
Var
i,j:Integer;
Begin
		writeln('Insertion d''une case au tableau: ');
		Repeat
			write('Veuillez Saisir La Case ou vous voulez inserer une valeur: ');
			readln(i);
		until i<=n;
		for j:= n+1 downto i+1 Do
			t[j]:=t[j-1];
		write('Veuillez Saisir la valeur a Inserer: ');
		readln(t[i]);
		n:=n+1;
end;
Procedure Min(T:Tab; N:Integer);
Var
i,mini:Integer;
Begin
		writeln('Recherche de la valeur minimale: ');
	Mini:= 1;
	for i:= 2 to n Do
		If t[mini] > t[i] Then
			mini:=i;
	writeln('La valeur minimale est t[',mini,']=',t[mini]);
end;
Procedure Max(T:tab; N:Integer);
Var
maxi,i:Integer;
Begin
	writeln('Recherche de la valeur maximale: ');
Maxi:= 1;
	for i:= 2 to n Do
		If t[maxi] < t[i] Then
			maxi:=i;
	writeln('La valeur maximale est t[',maxi,']=',t[maxi]);
end;
Procedure Choix(var c:char);
Begin
	writeln('[A] - Abandon');
	writeln('[B] - Creation du tableau');
	writeln('[C] - Affichage du tableau');
	writeln('[D] - Modification d''un element du tableau');
	writeln('[E] - Ajout d''un element a la fin du tableau');
	writeln('[F] - Suppression d''un element du tableau');
	writeln('[G] - Insertion d''un element dans le tableau');
	writeln('[H] - Recherche du plus petit element du tableau');
	writeln('[I] - Recherche du plus grand element du tableau');
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
	randomize;
	Repeat
		Menu(c);
	until c = 'A';
end.