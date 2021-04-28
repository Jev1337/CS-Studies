program Bac20081;
uses wincrt;
Type
Enreg = Record
	Deci: string;
	Oct: string;
	Hexa:string;
	Bin:string;
end;
tab= array[1..100] of Enreg;
Var
f:text;
t:tab;
n:Integer;

Procedure Remplir(var f:text; var n:Integer);
Var
x,i:Integer;
Begin
	rewrite(f);
	Repeat
		write('Veuillez Saisir N: ');
		readln(n);
	until n in [6..99];
	for i:= 1 to n Do
	Begin
		Repeat
			write('Veuillez Saisir l''entier',i,': ');
			readln(x);
		until (x < 32000) and (x >= 0);
		writeln(f,x);
	end;
	close(f);
end;

Function Conv(ch: string; d:Integer): string;
Var
ch1,ch2:string;
x:LongInt;
e,r:Integer;
Begin
	ch2:='';
	val(ch,x,e);
	Repeat
		r:= x mod d;
		if (d=16) and (r in [10..15]) then
			ch1:= chr(r+55)
		else
			str(r,ch1);
		ch2:= ch1+ch2;
		x:= x div d;
	until x=0;
	Conv:= ch2;
end;


Procedure Trait(var f:text; n:Integer; var t:tab);
Var
i:Integer;
Begin
	reset(f);
	for i:= 1 to n Do
	Begin
		readln(f,t[i].Deci);
		t[i].Oct:= Conv(t[i].Deci,8);
		t[i].Hexa:= Conv(t[i].Deci,16);
		t[i].bin:= Conv(t[i].Deci,2);
	end;
	close(f);
end;

Procedure Affiche(n:Integer; t:tab);
var
i:Integer;
Begin
	for i:= 1 to n Do
		writeln(t[i].Deci,' | ',t[i].Oct,' | ',t[i].Hexa, ' | ',t[i].Bin)
end;

Begin
	assign(f,'nombres.txt');
	Remplir(f,n);
	Trait(f,n,t);
	Affiche(n,t);
end.