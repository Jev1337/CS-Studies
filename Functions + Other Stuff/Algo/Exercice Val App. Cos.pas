program cosi;
uses wincrt;

Function Puis(x:real;y:Integer):real;
Var
i:Integer;
aux:real;
Begin
	aux:=x;
	for i:= 1 to y Do
		x:=x*aux;
	puis:=x;
end;

Function Fact(x:Integer):LongInt;
Var
aux:LongInt;
i:Integer;
Begin
	aux:=1;
	for i:= 2 to x Do
		aux:=aux*i;
	fact:=aux;
end;

Function Sinus(x:Real):Real;
Var
sig,i:Integer;
s1,s2:Real;
Begin
	sig:=1;
	s2:=x;
	i:=1;
	Repeat
		i:=i+2;
		sig:=-sig;
		S1:=S2;
		S2:=S2+sig*puis(x,i)/(fact(i));
	until abs(S2-S1)<= 0.0001;
	Sinus:=S2;
end;
Begin
	writeln(Sinus(1):1:8);
end.