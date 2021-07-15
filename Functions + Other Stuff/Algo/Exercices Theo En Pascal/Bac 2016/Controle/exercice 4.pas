program exerccie4;
uses wincrt;
Const
n=5;
Type
enreg= Record
	j:Integer;
	m:Integer;
	a:Integer;
end;
tab = array[1..50] of enreg;
Var
i:Integer;
T:tab;
Procedure Tri(var T:tab; n:Integer);
Var
temp:enreg;
aux:Boolean;
i:Integer;
Begin
	Repeat
		aux:=false;
		for i:= 1 to n-1 Do
			if((t[i].a>t[i+1].a) or ((t[i].m>t[i+1].m)) and (t[i].a=t[i+1].a)) or ((t[i].j>t[i+1].j)and(t[i].m= t[i+1].m)and(t[i].a=t[i+1].a)) Then
			Begin
				temp:=t[i];
				t[i]:=t[i+1];
				t[i+1]:=temp;
				aux:=true;
			end;
	until aux = false;
end;

Begin
	t[1].a:=2002;
	t[2].a:=2003;
	t[3].a:=2002;
	t[4].a:=1998;
	t[5].a:=2003;
	t[1].m:=1;
	t[2].m:=3;
	t[3].m:=1;
	t[4].m:=4;
	t[5].m:=1;
	t[1].j:=16;
	t[2].j:=30;
	t[3].j:=15;
	t[4].j:=2;
	t[5].j:=12;
	tri(t,n);
	for i:= 1 to n Do
	Begin
		with t[i] Do
		Begin
			write(a,'|',m,'|',j);
		end;
		writeln();
	end;
end.