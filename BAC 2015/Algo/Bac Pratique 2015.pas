Program Bac2015;
Uses Wincrt;
Type
  reg = Record
    Dep: Integer;
    Nb: Integer;
  End;
  tabreg = Array[1..100] Of reg;
Var
  f: Text;
  tr: tabreg;
  p: Integer;
Procedure Remplir(Var f:Text;Var p:Integer);
Var
  i,n: Integer;
Begin
  Rewrite(f);
  Repeat
    Write('Veuillez Saisir le nombre des suites: ');
    Readln(P);
  Until P In [2..30];
  For i:=1 To P Do
    Begin
      Repeat
        Write('Veuillez Saisir le nombre U0 pour la suite ',i,': ');
        Readln(n);
      Until (n>=2) And (n<=1000);
      Writeln(f,n);
    End;
  Close(f);
End;
Function check(x:Integer): Integer;
Type
  tab = Array[0..100] Of Integer;
Var
  t: tab;
  // Je sais que c'est possible d'utiliser une chaine au lieu d'un tableau mais je préfere comme ca
  i,j: Integer;
Begin
  i := 0;
  t[i] := x;
  While t[i] <> 1 Do
    Begin
      i := i+1;
      If (t[i-1] Mod 2 = 0) Then
        t[i] := (t[i-1] Div 2)
      Else
        t[i] := ((3*t[i-1])+1);
    End;
  check := i;
End;
Procedure Trait(Var f:Text; Var tr:tabreg;p:Integer);
Var
  x,i: Integer;
Begin
  Reset(f);
  For i:=1 To P Do
    Begin
      Readln(f,x);
      tr[i].nb := check(x);
      tr[i].dep := x;
    End;
  Close(f);
End;

Procedure affiche(tr:tabreg; p:Integer);
Var
  indmin,min,i: Integer;
Begin
	min:= tr[1].nb;
	for i:= 2 to p Do
		if min > tr[i].nb then
		min:= tr[i].nb;
		writeln('Le nombre minimal de calcul pour atteindre 1 est: ',min);
		for i:=1 to p Do
		if min = tr[i].nb then
		Begin
		writeln(' Avec le nombre U0 de: ',tr[i].dep);
		end;
End;
Begin
  Assign(f,'Depart.txt');
  remplir(f,p);
  trait(f,tr,p);
		clrscr;
  affiche(tr,p);
End.