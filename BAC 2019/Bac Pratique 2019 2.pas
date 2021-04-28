Program cringe;
Uses Wincrt;
Type
  enreg = Record
    a,b: Integer;
    PPCM: Integer;
  End;
  tab = Array[1..100] Of enreg;
Var
  t: tab;
  n: Byte;

Procedure Saisie(Var t:tab;Var n:Byte);
Var
  i: Integer;
Begin
  Repeat
    Write('Veuillez Saisir N: ');
    Readln(N);
  Until n In [1..100];
  For i:=1 To n Do
    Repeat
      Clrscr;
      Write('Veuillez Saisir [',i,'] => a: ');
      Readln(t[i].a);
      Write('Veuillez Saisir [',i,'] => b: ');
      Readln(t[i].b);
    Until (t[i].a < 1000) And (t[i].a >0) And (t[i].b < 1000) And (t[i].b >0);
End;
Procedure Trait(Var t:tab; n:Byte);
Type
  Mat = Array[1..2,2..1000] Of Longint;
Var
  i: Integer;

Procedure Init(Var M:mat);
Var
  i,j: Integer;
Begin
  For i:= 1 To 2 Do
    For j:= 2 To 1000 Do
      M[i,j] := 1;
End;
Function premier(x:Integer): Boolean;
Var
  i,r: Integer;
Begin
  r := 0;
  For i:= 1 To x Do
    If x Mod i =0 Then
      r := r+1;
  premier := r=2;
End;
Procedure Stocker(x:Integer;Var M:mat; i:Integer;var max:Integer);
Var
  j: Integer;
Begin
  j := 2;
  Repeat
    If x Mod j = 0 Then
      Begin
        x := x Div j;
        M[i,j] := M[i,j]*j;
      End
    Else
      Repeat
        j := j+1;
      Until premier(j);
  Until x=1;
	max:=j;
End;
Function PPCM(x,y:Integer): Integer;
Var
  M: mat;
  i,j,aux,max: Integer;
Begin
  i := 1;
  init(M);
  stocker(x,m,1,max);
  stocker(y,m,2,aux);
	if max < aux Then
		max:=aux;
  For j:= 2 To max Do
    If M[1,j] > M[2,j] Then
      i := i*M[1,j]
    Else
      i := i*M[2,j];
  PPCM := i;
End;
Begin
  For i:=1 To n Do
    Begin
      t[i].ppcm := ppcm(t[i].a,t[i].b);
    End;
End;
Procedure Affiche(t:tab;n:Byte);
Var
  i: Integer;
Begin
  For i:=1 To n Do
    With t[i] Do
      Writeln('PPCM(',a,',',b,')= ',PPCM);
End;
Begin
  Saisie(t,n);
  Trait(t,n);
  Affiche(t,n);
End.