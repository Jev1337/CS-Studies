Program mersenne;
Uses Wincrt;
Var
  a,b: Longint;
  f: Text;
Procedure Saisie(Var A,B: Longint);
Begin
  Repeat
    Write('Veuillez Saisir A: ');
    Readln(A);
    Write('Veuillez Saisir B: ');
    Readln(B);
  Until (2<=A) And (A<=B) And (B<=50000)
End;

Function prime(x:Longint): Boolean ;
Var
  i: Longint;
  y: Integer;
Begin
  i := 1;
  y := 0;
  While (y<>1) And (i <> x Div 2) Do
    Begin
      i := i+1;
      If x Mod i = 0 Then
        y := y+1;
    End;
  prime := Not(y=1)
End;

Function puis(x:Longint): Longint;
Var
  j,i: Longint;
Begin
  j := 1;
  For i:=1 To x Do
    j := j*2 ;
  puis := j;
End;
Procedure Trait(A,B: Longint; Var f:Text);
Var
  n,m,i: Longint;
Begin
  Rewrite(f);
 	for i:= A to B Do
	Begin
		n:=0;
		Repeat
			n:=n+1;
			M:= puis(n)-1;
		Until (M>=i);
		if (M=i) and (Prime(M)) Then
			writeln(f,'M=(2^',n,'-1)')
	end;	
  Close(f);
End;
Procedure Affiche(Var f:Text) ;
Var
  ch: String;
Begin
  Reset(f);
	if Eof(f) Then
	writeln('Il n''ya aucun nombre de Mersenne.')
	else
  While Not(Eof(f)) Do
    Begin
      Readln(f,ch);
      Writeln(ch);
    End;
  Close(f);
End;
Begin
  Assign(f,'mersenne.txt');
  saisie(A,B);
  trait(A,B,f);
  affiche(f);
End.