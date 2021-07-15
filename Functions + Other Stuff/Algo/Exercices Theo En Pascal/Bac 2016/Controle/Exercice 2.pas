program Ex22020;
uses wincrt;
const
a=10;
b=14;
n=11;
Function Verif_Pr(n:Integer):Boolean;
Var
U0,U1,U2,U3,i: Integer;
Begin
	U0:=3;
	U1:=0;
	U2:=2;
	i:=2;
	Repeat
		i:=i+1;
		U3:=U1+U0;
		U0:=U1;
		U1:=U2;
		U2:=U3;
	until (i=n);
	Verif_Pr:= U3 mod n = 0;
end;

function Verif_Geo(a,b:Integer) :Boolean;
Var
U: array[0..50] of Integer;
i:Integer;
R1,R2:real;
Begin
	u[0]:=3;
	u[1]:=0;
	u[2]:=2;
	i:=2;
	Repeat
		i:=i+1;
		U[i]:=U[i-2] + U[i-3];
	until i=b;
	R2:=U[a+1] / U[a];
	i:=a+1;
	Repeat
		i:=i+1;
		R1:=U[i]/U[i-1];
	until (R1<>R2) or (i=b);
	Verif_Geo:=R1=R2;
end;
Begin
	writeln(Verif_Pr(n));
	writeln(Verif_Geo(a,b));
end.