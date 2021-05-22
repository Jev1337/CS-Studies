program Exercice2;
uses wincrt;
Var
n:LongInt;
Function Puis(x,y:LongInt):LongInt;
Var
aux,i:LongInt;
Begin
	aux:=x;
	for i:= 1 to y-1 Do
		x:=x*aux;
	puis:=x;
end;
Function Conv(x,y:LongInt):LongInt;
Var
ch,ch1:string;
e:Integer;
Begin
	ch:='';
	Repeat
		if x mod y >=10 Then
			ch:=Chr(Ord(x mod y+55))+ch
		Else
		Begin
			str(x mod y,ch1);
			ch:=ch1+ch;
		end;
		x:=x div y;
	until x=0;
	val(ch,x,e);
	conv:=x;
end;
Procedure Remq(var N:LongInt);
Var
x,e,i,s:LongInt;
ch:string;
Begin
	s:=0;
	writeln('Veuillez Saisir n: ');
	readln(n);
	str(n,ch);
	for i:= 1 to Length(ch) Do
	Begin
		val(ch[i],x,e);
		s:=s+puis(x,Length(ch));
	end;
	if (conv(s,Length(ch))) = N Then
		writeln('Le nombre ',n,' est un nombre remarquable')
	Else
		writeln('Le nombre ',n,' n''est pas un nombre remarquable');
end;
Begin
	Remq(N);
end.