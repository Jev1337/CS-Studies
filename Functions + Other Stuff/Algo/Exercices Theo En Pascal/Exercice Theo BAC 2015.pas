Uses Wincrt;
Const
  e = 0.001;
Type
  Mat = Array[0..100,0..100] Of Integer;
Var
  m: mat;

Function Somme(M:mat;i,c:Byte): LongInt;
Var
j,s:LongInt;
Begin
	s:=0;
	for j:= i downto i-c+1 do
		s:=s+M[i,j];
	somme:=s;
end;

Procedure Remplir(var M:mat; e:real);
Var
R1,R2:real;
i,j:Integer;
Begin
	M[0,0]:=1;
	i:=0;
	R2:=0;
	Repeat
		i:=i+1;
		for j:= 1 to i Do
			M[i,j]:= Somme(M,i-1,j);
		R1:=R2;
		R2:= (2*i*M[i-1,i-1])/(M[i,i]);
	until abs(R2-R1) <= e;
	writeln('La valeur approché est de : ',R2:1:9,'... De la ligne: ',i);
end;

Begin
	Remplir(M,e);
end.