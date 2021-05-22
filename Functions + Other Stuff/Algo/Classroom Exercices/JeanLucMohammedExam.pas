program JeanLucMomo;
uses wincrt;
Type
mat = array[1..225,1..225] of char;
Var
N:Integer;
M:mat;
F:text;

Function verif(ch:string):Boolean;
Var
test:Boolean;
i:Integer;
Begin
	i:=0;
	Repeat
		i:=i+1;
		test:=Upcase(ch[i]) in ['A'..'Z','0'..'9'];
	until (test = false) or (i=Length(ch)) ;
	verif:=test;
end;
Procedure Saisie (var N :Integer);
Begin
	Repeat
		writeln('Veuillez Saisir N agences: ');
		readln(n);
	until (n in [3..15])
end;

Procedure Transfert(var res:string;N:Integer;m:mat);
Var
i,j:Integer;
Begin
		for i:= 1 to n Do
			res:=res+M[i,i];
		for i:= 2 to n Do
			for j:= 1 to i-1 Do
				res:=res+M[i,j];
		for i:= 1 to n-1 Do
			for j:=i+1 to n do
				res:=res+M[i,j];
end;

Function Tri(ch:string): string;
Var
permut:Boolean;
i:Integer;
aux:char;
Begin
	Repeat
		permut:=false;
		for i:= 1 to Length(ch)-1 Do
			if ch[i] > ch[i+1] Then
			Begin
				aux:=ch[i];
				ch[i]:=ch[i+1];
				ch[i+1]:=aux;
				permut:=true;
			end;
	until permut=false;
	tri:=ch;
end;
Procedure Remplir(var M:mat; N:Integer; var f:text);
Var
i,j:Integer;
ch,res:string;
Begin
rewrite(f);
		Repeat
			writeln('Veuillez Saisir le mot de passe: ');
			readln(ch);
		until verif(ch) and (length(ch) <= n*n);
		while Length(ch) <> n*n Do
			ch:=ch+ Chr(Random(26)+Ord('A'));
		for i:= 1 to n Do
			for j:= 1 to n Do
			Begin
				M[i,j]:=ch[1];
				delete(ch,1,1);
			end;
		res:='';
		Transfert(Res,N,M);
		for i:= 1 to n Do
		Begin
			for j:= 1 to n Do
				ch:=ch+res[j];
			writeln(f,Tri(ch));
			ch:='';
			delete(res,1,n);
		end;
close(f);
end;
Begin
	assign(F,'Mots.txt');
	Saisie(N);
	Remplir(M,N,F);
end.