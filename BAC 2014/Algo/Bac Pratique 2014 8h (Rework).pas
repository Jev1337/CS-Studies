program bac2014;
uses wincrt;
Type
mat = array[1..20,1..20] of Integer;
Var
m:mat;l,c:Integer;f:text;
Procedure Remplir(var M:mat; var l,c:Integer);
Var
i,j:Integer;
Begin
	Repeat
		writeln('Veuillez Saisir L puis C: ');
		write('>');
		readln(l);
		write('>');
		readln(c);
	until (l in [1..10]) and (c in [4,6,8,10]);
	for i:= 1 to l Do
		for j:= 1 to c Do
		Begin
			write('Veuillez Saisir M[',i,',',j,']: ');
			readln(M[i,j]);
		end;
end;

Procedure Trait(M:mat;l,c:Integer;var f:text);
Var
t,v: array[1..40] of Integer;i,j,k,long:Integer;aux,ch:string;
Begin
	rewrite(f);
	for i:= 1 to l Do
		for j:= 1 to c div 2 Do
			writeln(f,abs(M[i,c-j+1]- M[i,j]));
	close(f);
	reset(f);
	long:=(c div 2)*l;
	for i:= 1 to long do
		readln(f,t[i]);
	close(f);
	long:=long-1;
	for i:= 1 to long Do
		v[i]:=(t[i+1]-t[i]);
	k:=0;
	ch:='';
	for i:= 1 to long Do
		if V[i+1] = V[i] Then
			k:=k+1
		else if k<>0 Then
		Begin
			for j:= i-k to i+1 Do
			Begin
				str(t[j],aux);
				ch:=ch+aux+',';
			end;
			delete(ch,Length(ch),1);
			writeln(ch,' est une suite arithmetique de raison r=',v[i]);
			ch:='';
			k:=0;
		end;
end;
Begin
assign(f,'Fnombres.txt');
Remplir(M,l,c);
Trait(M,l,c,f);
end.