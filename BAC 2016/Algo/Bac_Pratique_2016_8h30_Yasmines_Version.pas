Uses wincrt;
Var
n:Integer;

Procedure Saisie(var n:Integer);
Begin
	Repeat
		writeln('Veuillez Saisir n: ');
		readln(n);
	until n in [3..5];
end;

function fact(x:integer):integer;
Var
    s,i:integer;
Begin
s:=1;
 for i:=1 to x do
        s:=s*i;
fact:=s;
end;

function premier(x:integer):boolean;
Var
    nb,i:integer;
    test:boolean;
Begin
nb:=0;
  for i:=2 to (x-1) do
        if x mod i =0 then
            nb:=nb+1;

    if nb<>0 then
        test:=false
    else
        test:=true;
premier:=test;
end;

Function SommeP(x:Integer): LongInt;
Var
s:LongInt;
i:Integer;
Begin
	s:=1;
	for i:= 1 to x Do
		if Premier(i) Then
			s:=s*i;
	SommeP:=s;
end;

function SeekPF(x:Integer): Boolean;
Var
i:Integer;
test:Boolean;
Begin
	i:=0;
	Repeat
		i:=i+1;
		test:= (fact(i)+1 = x) or (fact(i)-1 = x);
	Until (test) or (fact(i)>=x);
	seekPf:=test;
end;

function SeekPP(x:Integer): Boolean;
Var
i:LongInt;
test:Boolean;
Begin
	i:=1;
	Repeat
		i:=i+1;
		test:= Premier(i) AND ((SommeP(i)+1 = x) or (SommeP(i)-1 = x));
	Until (test) or (SommeP(i)>=x);
	seekPP:=test;
end;

Procedure Affiche(n:Integer);
Var
i,j:LongInt;
Begin
		writeln();
		writeln('Les Premiers Factoriels: ');
		i:=0;
		j:=0;
		Repeat
			i:=i+1;
			If SeekPF(i) And Premier(i) Then
			Begin
				j:=j+1;
				writeln(i);
			end;
		until j=n;
		writeln();
		writeln('Les Premiers Primoriels: ');
		i:=1;
		j:=0;
		Repeat
			i:=i+1;
			If SeekPP(i) And Premier(i) Then
			Begin
				j:=j+1;
				writeln(i);
			end;
		until j=n;
end;

Begin
	Saisie(n);
	Affiche(n);
end.