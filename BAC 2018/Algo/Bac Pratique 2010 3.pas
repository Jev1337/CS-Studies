program bac20101;
uses wincrt;
Var
f,g:text;


Function Verif(ch:string):Boolean;
var
i:Integer;
test:Boolean;
Begin
	i:=0;
	Repeat
		i:=i+1;
		test:= ch[i] in ['A'..'F','0'..'9'];
	until (test = false) or (i=Length(ch));
	verif:=test;
end;

Procedure Remplir(var f:text);
var
i:Integer;
n:Byte;
ch:string;
Begin
	rewrite(f);
	Repeat
		write('Veuillez Saisir n: ');
		readln(n);
	until n in [2..10];
	for i:= 1 to n Do
	Begin
		Repeat
			write('Veuillez Saisir La Chaine de caractere: ');
			readln(ch);
		until verif(ch);
		writeln(f,ch);
	end;
	close(f);
end;

Function Base(ch:string):Integer;
Var
max:char;
i,e:Integer;
Begin
		max:= ch[1];
		for i:= 2 to Length(ch) Do
			if ch[i]> max Then
				max:=ch[i];
		val(max,i,e);
		if e<>0 Then
			i:= ord(max)-54;
		base:=i+1;
end;

Function Conv(m:string;b:Integer):LongInt;
Var
s,p,x:LongInt;
i,e:Integer;
Begin
	s:=0;
	p:=1;
	for i:= Length(m) downto 1 Do
	Begin
		val(m[i],x,e);
		if e<>0 Then
			x:= ord(m[i])-55;
		s:= s+x*P;
		p:=p*b;
	end;
	Conv:=s;
end;

Procedure Trait(var f,g:text);
Var
m:string;
Begin
	reset(f);
	rewrite(g);
	While not(EOF(F)) do
	Begin
		readln(f,m);
		writeln(g,'(',m,')', Base(m),' = (', Conv(m,Base(m)),')10');
	end;
	close(f);
	close(g);
end;
Procedure Affiche(var g:text);
Var
ch:string;
Begin
	reset(g);
	While not EOF(g) Do
	Begin
		readln(g,ch);
		writeln(ch);
	end;
	close(g);
end;
Begin
Assign(f,'nb_base.txt');
Assign(g,'nombre.txt');
Remplir(F);
Trait(F,G);
Affiche(G);
end.