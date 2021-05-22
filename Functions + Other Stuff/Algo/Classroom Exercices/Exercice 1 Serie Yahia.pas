{Thanks to momo for providing this exercise's link, and also thanks to Yahia for the the exercise itself!}
{https://cdn.discordapp.com/attachments/833273071325675531/835868501952036865/20210425_142227.jpg}
program ex1;
uses wincrt;
Var
n:Integer;
Procedure Saisie(var n:Integer);
Begin
	Repeat
		writeln('Veuillez Choisir Une Valeur : ');
		readln(n);
	until n >0;
end;

Procedure Suite(n:Integer);
Var
i,j:Integer;
Begin
	write('U',n,'= "');
	for i:= 1 to n Do
	Begin
		for j:= 1 to i Do
			write(i);
	end;
	writeln('"');
end;
Begin
	Saisie(n);
	Suite(n);
end.