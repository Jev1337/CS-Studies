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
Procedure PermierFactoriel(x:Longint; Var foo:Boolean; Var y:Longint; Var s:Longint);
Begin
  foo := False;
  s := 0;
  y := 0;
  If (Premier(Fact(x) + 1)) Then
    Begin
      foo := True;
      y := Fact(x) + 1
    End;
  If (Premier(Fact(x) - 1)) Then
    Begin
      foo := True;
      s := Fact(x) - 1;
    End;
End;
Procedure PremierPrimoriel(x:Longint; Var foo:Boolean;Var z:Longint; Var y:Longint);
Var
  i,s: Longint;
Begin
  foo := False;
  s := 1;
  y := 0;
  z := 0;
  For i:= 1 To x Do
    If Premier(i) Then
      s := s*i;
  If Premier(s+1) Then
    Begin
      foo := True;
      z := s+1
    End;
  If premier(s-1) Then
    Begin
      foo := True;
      y := s-1;
    End;
End;
Procedure Fac_Prim(n:Longint);
Var
  i,s,j,y: Longint;
  test: Boolean;
Begin
  i := 0;
  j := 0;
  Repeat
    i := i+1;
        PermierFactoriel(i,test,s,y);
        If test Then
          Begin
            If Y<>0 Then
              Begin
                Writeln(Y,' est un Premier Factoriel');
                j := j+1;
              End;
            If S<>0 Then
              Begin
                Writeln(S,' est un Premier Factoriel');
                j := j+1;
              End;
          End;
  Until j=n;
  i := 1;
  j := 0;
  Repeat
    i := i+1;
    If Premier(i) Then
      Begin
        PremierPrimoriel(i,test,s,y);
        If test Then
          Begin
            If Y<>0 Then
              Begin
                Writeln(Y,' est un Premier Primoriel');
                j := j+1;
              End;
            If S<>0 Then
              Begin
                Writeln(S,' est un Premier Primoriel');
                j := j+1;
              End;
            j := j+1;
          End;
      End;
  Until j=n;
End;
Begin
  Saisie(n);
  Fac_Prim(n);
End.
