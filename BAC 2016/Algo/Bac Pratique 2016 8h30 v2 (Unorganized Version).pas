Program bac_2016;
Uses Wincrt;
Var
  n: Longint;
Procedure Saisie(Var n:Longint);
Begin
  Repeat
    Write('Veuillez Saisir n: ');
    Readln(n);
  Until n In [2..5];
End;
Function Fact(x:Longint): Longint;
Var
  s,i: Longint;
Begin
  s := 1;
  For i:= 1 To x Do
    s := s*i;
  Fact := s;
End;
Function Premier(x:Longint): Boolean;
Var
  i,j: Longint;
Begin
  j := 0;
  For i:= 1 To x Do
    If x Mod i = 0 Then
      j := j+1;
  Premier := j=2;
End;
Procedure Fac_Prim(n:Longint);
Var
  i,s,j,y,k: Longint;
Begin
  j := 0;
  k := 0;
  y := 0;
  Repeat
    k := k+1;
    If (Premier(Fact(k) - 1)) Then
      Begin
        Writeln('Premier Factoriel: ', Fact(k) - 1);
        y := y+1;
      End;
    If (Premier(Fact(k) + 1)) And (y<>n) Then
      Begin
        Writeln('Premier Factoriel: ', Fact(k) + 1);
        y := y+1;
      End;
    If premier(k) Then
      Begin
        s := 1;
        For i:= 1 To k Do
          If Premier(i) Then
            s := s*i;
        If (premier(s-1)) And (j<>n) Then
          Begin
            Writeln('Premier Primordiel: ', s-1);
            j := j+1;
          End;
        If Premier(s+1) Then
          Begin
            Writeln('Premier Primordiel: ', s+1);
            j := j+1;
          End;
      End;
  Until (j=n) Or (y=n);
End;
Begin
  Saisie(n);
  Fac_Prim(n);
End.
