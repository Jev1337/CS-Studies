program bacsc2020;
uses wincrt;
var
NL,NC,L,C:Integer;
Procedure Saisie(var L,C,Li,Ci:Integer);
Begin
	Repeat
		writeln('Veuillez Saisir: ');
		write('NL:');
		read(l);
		write('NC:');
		read(c);
	until (L in [1..100]) and (C in [1..100]);
	Repeat
		writeln('Veuillez Saisir: ');
		write('L init: ');
		readln(Li);
		write('C init: ');
		readln(Ci);
	until (Li in [1..L]) and (Ci in [1..C]);
end;

Function Verif(var ch:string):Boolean;
Var
i:Integer;
test:Boolean;
Begin
	i:=0;
	Repeat
		i:=i+1;
		test:=ch[i] in ['G','H','B','D'];
	until (i = Length(ch)) or (test=false);
	Verif:=test;
end;

Procedure mouvement(var L,C,Li,Ci:Integer);
Var
i:Integer;
ch:string;
Begin
	Repeat
		writeln('Veuillez Saisir (H pour Haut ou B pour Bas ou D pour Droite ou G pour gauche): ');
		readln(ch);
	until Verif(ch);
	i:=0;
	Repeat
		i:=i+1;
		case ch[i] Of
			'G': Ci:=Ci-1;
			'H': Li:=Li-1;
			'B': Li:=Li+1;
			'D': Ci:=Ci+1;
		end;
	until (Li > L) or (Ci > C) or (i=Length(ch));
	if (Li > L) or (Ci > C) Then
		writeln('Attention cas de depassement cause par le pas Numero 4')
	Else
		writeln('Je suis a la position (',Li,',',Ci,')');
end;


Begin
	Saisie(NL,NC,L,C);
	Mouvement(NL,NC,L,C);
end.