Program bac_2016;
Uses Wincrt;
Var
  n: Integer;
Procedure Saisie(Var n:Integer);
Begin
  Repeat
    Write('Veuillez Saisir n: ');
    Readln(n);
  Until n In [2..5];   // Max Possible N is 9 with SmallInt (Current Variables are set to SmallInt!)
End;
Function Fact(x:Integer): Integer;
Var
  s,i: Integer;
Begin
  s := 1;
  For i:= 1 To x Do
    s := s*i;
  Fact := s;
End;
Function Premier(x:Integer): Boolean;
Var
  i,j: Integer;
Begin
  j := 0;
  For i:= 1 To x Do
    If x Mod i = 0 Then
      j := j+1;
  Premier := j=2;
End;
Procedure PermierFactoriel(x:Integer; Var foo:Boolean; Var y:Integer);
Begin
  foo := False;
  If (Premier(Fact(x) + 1)) Then
    Begin
      foo := True;
      y := Fact(x) + 1
    End
  Else If (Premier(Fact(x) - 1)) Then
         Begin
           foo := True;
           y := Fact(x) - 1;
         End;
End;
Procedure PremierPrimoriel(x:Integer; Var foo:Boolean;Var s:Integer);
Var
  i: Integer;
Begin
  foo := False;
  s := 1;
  For i:= 1 To x Do
    If Premier(i) Then
      s := s*i;
  If Premier(s+1) Then
    Begin
      foo := True;
      s := s+1
    End
  Else If premier(s-1) Then
         Begin
           foo := True;
           s := s-1;
         End;
End;
Procedure Fac_Prim(n:Integer);
Var
  i,s,j: Integer;
  test: Boolean;
Begin
  i := 1;
  j := 0;
  Repeat
    i := i+1;
    If Premier(i) Then
      Begin
        PermierFactoriel(i,test,s);
        If test Then
          Writeln(S,' est un Premier Factoriel');
      End;
    j := j+1;
  Until j=n;
  i := 1;
  j := 0;
  Repeat
    i := i+1;
    If Premier(i) Then
      Begin
        PremierPrimoriel(i,test,s);
        If test Then
          Writeln(S,' est un Premier Primoriel');
      End;
    j := j+1;
  Until j=n;
End;
Begin
  Saisie(n);
  Fac_Prim(n);
End.
