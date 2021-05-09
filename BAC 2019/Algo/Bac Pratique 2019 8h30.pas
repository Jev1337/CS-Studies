Uses wincrt;
Type
enreg = Record
					a:Integer;
					b:Integer;
					PPCM: Integer;
				end;
tab = array[1..100] of enreg;
Var
t:tab;
n:Integer;

Function PC(x,y:Integer): Integer;
Type
tab2 = array[1..100] of Integer;
Var
t1,t2: tab2;
n1,n2,p,i,j,k:Integer;
	Function Premier(x:Integer): Boolean;
	Var
	i,r:Integer;
	Begin
		r:=0;
		for i:= 1 to x Do
			if x mod i = 0 Then
				r:=r+1;
		premier:= r=2; 
	end;
	Procedure Facteur(c:Integer; var tc:tab2; var nc:Integer);
	Var
	i:Integer;
	Begin
		nc:=0;
		i:=2;
		Repeat
			If c mod i = 0
			Then
			Begin
				nc:=nc+1;
				tc[nc]:=i;
				c:=c div i;
			end
			Else
				Repeat
					i:=i+1
				until premier(i);
		until c=1;
	end;
Begin
	Facteur(x,t1,n1);
	Facteur(y,t2,n2);
	i:=1;
	j:=1;
	p:=1;
	Repeat
		if t1[i] = t2[j]
		Then
		Begin
			p:= p*t1[i];
			i:=i+1;
			j:=j+1;
		end
		Else if t1[i]<t2[j]
				Then
				Begin
					p:=p*t1[i];
					i:=i+1;
				end
				Else
				Begin
					p:=p*t2[j];
					j:=j+1;
				end;
	Until (i>n1) or (j>n2);
	if i>n1
	Then
		for k:=j to n2 Do
			p:=p*t2[k]
	Else
		for k:=i to n1 Do
			p:=p*t1[k];
	pc:=p;
end;

Procedure Saisie(var t:tab;var n:Integer);
Var
i:Integer;
Begin
	Repeat
		write('Saisir n: ');
		readln(n);
	Until n in[2..100];
	for i:= 1 to n Do
	Begin
		Repeat
			write('Veuillez Saisir a: ');
			readln(t[i].a);
		until (t[i].a < 1000) and (t[i].a > 0);
		Repeat
			write('Veuillez Saisir b: ');
			readln(t[i].b);
		Until (t[i].b < 1000) and (t[i].b > 0);
		t[i].ppcm:= PC(t[i].a,t[i].b);
	end;
end;

Procedure Affiche(t:tab;n:Integer);
Var
i:Integer;
Begin
	for i:= 1 to n Do
	Begin
		writeln('PPCM(',t[i].a,',',t[i].b,') = ',t[i].PPCM);
		writeln('PGCD(',t[i].a,',',t[i].b,') = ',((t[i].a*t[i].b) div t[i].PPCM));
	end;
end;

Begin
	Saisie(t,n);
	Affiche(t,n);
end.