Uses Wincrt;
Const
  e = 0.001; {Example : 10^-3 = 0.001 (Saisie au pgme principale)}
Type
  Mat = Array[0..100,0..100] Of Integer;
Var
  m: mat;

Function Somme(M:mat;i,c:Integer): LongInt;
Var
j:Integer;
s:LongInt;
Begin
	s:=0;
	for j:= i downto i-c+1 Do
		s:=s+M[i,j];
	Somme:=s;
end;

Procedure Remplir(var M:mat);
Var
R1,R2: Real;
i,j:Integer;
Begin
	i:=0;
	M[0,0]:=1;
	R2:=0;
	Repeat
		i:=i+1;
		M[i,0]:=0;
		for j:= 1 to i Do
			M[i,j]:= Somme(M,i-1,j);
		R1:=R2;
		R2:=(2*i*M[i-1,i-1])/(M[i,i]);
	until abs(R2-R1) <= e;
	writeln(R2:1:9,'... est la val approchee de pi de la ligne ',i);
end;

Begin
	Remplir(M);
end.