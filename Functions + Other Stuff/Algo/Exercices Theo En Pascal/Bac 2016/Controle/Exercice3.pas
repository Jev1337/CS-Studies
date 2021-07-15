program ex3;
uses wincrt;
Const
n=15;
Function premier(x:Integer):Boolean;
Var
r,i:Integer;
Begin
	r:=0;
	for i:= 1 to x Do
		if x mod i = 0 Then
			r:=r+1;
	premier:= r=2;
end;

Procedure Puis(x,y:Integer; var s:LongInt);
Begin
	s:=1;
	Repeat
		S:=s*x;
	until s>=y;
end;
Procedure Nb_primaire(n:Integer);
Var
nb,i,j:Integer;
s:LongInt;
Begin
	nb:=0;
	i:=0;
	Repeat
		i:=i+1;
		j:=1;
		Repeat
			s:=1;
			j:=j+1;
			if premier(j) then
				puis(j,i,s);
		until (S=i) or (j=i);
		if (s=i) Then
		Begin
			nb:=nb+1;
			writeln(i,' est un nombre primaire');
		end;
	until nb=n;
end;
Begin
Nb_primaire(n);
end.