Uses Wincrt;
Var
  n: Integer;
Procedure Saisie(Var n:Integer);
Begin
  Repeat
    Writeln('Veuillez Saisir n: ');
    Readln(n);
  Until n In [3..5];
End;
Function fact(x:Integer): Integer;
Var
  s,i: Integer;
Begin
  s := 1;
  For i:=1 To x Do
    s := s*i;
  fact := s;
End;
Function premier(x:Integer): Boolean;
Var
  nb,i: Integer;
  test: Boolean;
Begin
  nb := 0;
  For i:=1 To x Do
    If x Mod i =0 Then
      nb := nb+1;
  test := nb=2;
  premier := test;
End;
Function SommeP(x:Integer): Longint;
Var
  s: Longint;
  i: Integer;
Begin
  s := 1;
  For i:= 1 To x Do
    If Premier(i) Then
      s := s*i;
  SommeP := s;
End;
Function SeekPF(x:Integer): Boolean;
Var
  i: Integer;
  test: Boolean;
Begin
  i := 0;
  Repeat
    i := i+1;
    test := (fact(i)+1 = x) Or (fact(i)-1 = x);
  Until (test) Or (fact(i)>=x);
  seekPf := test;
End;
Function SeekPP(x:Integer): Boolean;
Var
  i: Longint;
  test: Boolean;
Begin
  i := 1;
  Repeat
    i := i+1;
    test := Premier(i) And ((SommeP(i)+1 = x) Or (SommeP(i)-1 = x));
  Until (test) Or (SommeP(i)>=x);
  seekPP := test;
End;
Procedure Affiche(n:Integer);
Var
  i,j: Longint;
Begin
  Writeln();
  Writeln('Les Premiers Factoriels: ');
  i := 0;
  j := 0;
  Repeat
    i := i+1;
    If SeekPF(i) And Premier(i) Then
      Begin
        j := j+1;
        Writeln(i);
      End;
  Until j=n;
  Writeln();
  Writeln('Les Premiers Primoriels: ');
  i := 1;
  j := 0;
  Repeat
    i := i+1;
    If SeekPP(i) And Premier(i) Then
      Begin
        j := j+1;
        Writeln(i);
      End;
  Until j=n;
End;
Begin
  Saisie(n);
  Affiche(n);
End.
