program bac2009;
uses wincrt;
Var
f:text;
Function Inv(x:LongInt):LongInt;
Var
chmin,ch:string;
i,e:LongInt;
Begin
	str(x,ch);
	chmin:='';
	for i:= 1 to Length(ch) Do
		chmin:=ch[i]+chmin;
	val(chmin,i,e);
	inv:=i;
end;
Function max(x:LongInt):LongInt;
Var
ch,chmax:string;
maxi,i,e:LongInt;
Begin
	chmax:='';
	str(x,ch);
	Repeat
		maxi:=1;
		for i:= 2 to Length(ch) Do
			if ch[maxi] < ch[i] Then
				maxi:=i;
		chmax:= chmax+ch[maxi];
		delete(ch,maxi,1);
	until ch = '';
	val(chmax,i,e);
	max:=i;
end;
Procedure Remplir(var f:text);
Var
U,Ui:LongInt;
Begin
	rewrite(f);
	Repeat
		writeln('Veuillez Saisir U0: ');
		readln(U);
	until (U > 999) and (U<2000);
	Repeat
		writeln(f,U);
		Ui:=U;
		U:= max(U)-inv(max(u));
	until U = Ui;
	close(f);
end;

Begin
	assign(f,'suite.txt');
	Remplir(f);
end.