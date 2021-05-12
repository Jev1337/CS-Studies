program bac2009;
uses wincrt;
Var
	f:text;
Function Premier(ch:string):Boolean;
Var
x,i,r,e:LongInt;
Begin
	val(ch,x,e);
	r:=0;
	for i:= 1 to x Do
		if x mod i = 0 Then
			r:=r+1;
	Premier:= r = 2;
end;

Function SuperPremier(x:LongInt):Boolean;
Var
ch:string;
i:LongInt;
Begin
	str(x,ch);
	i:=1;
	While (Premier(ch[i])) and (i<>Length(ch)) do
		i:=i+1;
	SuperPremier:= (Premier(ch[i])) and (i=Length(ch)); 
end;

Procedure Remplir(var f:text);
Var
i,n:LongInt;
Begin
	rewrite(f);
	Repeat
		write('Veuillez Saisir N: ');
		readln(n);
	until (40000<n) and (n<100000);
	for i:=1 to n Do
		if SuperPremier(i) Then
		Begin
			writeln(i,' super premier');
			writeln(f,i,' super premier');
		end;
	close(f);
end;

Begin
	assign(f,'super_p.txt');
	Remplir(f);
end.