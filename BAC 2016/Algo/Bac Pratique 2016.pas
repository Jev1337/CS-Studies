Program bac_2016;
Uses Wincrt;
Var
  n: LongInt;
Procedure Saisie(Var n:LongInt);
Begin
  Repeat
    Write('Veuillez Saisir n: ');
    Readln(n);
  Until n In [2..5];   // Max Possible N is 4 with LongInt
End;
Function Fact(x:LongInt): LongInt;
Var
  s,i: LongInt;
Begin
  s := 1;
  For i:= 1 To x Do
    s := s*i;
  Fact := s;
End;
Function Premier(x:LongInt): Boolean;
Var
  i,j: LongInt;
Begin
  j := 0;
  For i:= 1 To x Do
    If x Mod i = 0 Then
      j := j+1;
  Premier := j=2;
End;
Procedure PermierFactoriel(x:LongInt; Var foo:Boolean; Var y:LongInt; Var s:LongInt);
Begin
  foo := False;
	s:=0;
	y:=0;
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
Procedure PremierPrimoriel(x:LongInt; Var foo:Boolean;Var z:LongInt; var y:LongInt);
Var
  i,s: LongInt;
Begin
  foo := False;
  s := 1;
	y:=0;
	z:=0;
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
Procedure Fac_Prim(n:LongInt);
Var
  i,s,j,y: LongInt;
  test: Boolean;
Begin
  i := 1;
  j := 0;
  Repeat
    i := i+1;
    If Premier(i) Then
      Begin
        PermierFactoriel(i,test,s,y);
        If test Then
				Begin
					if Y<>0 Then
					Begin
          	Writeln(Y,' est un Premier Factoriel');
						j := j+1;
					end;
					if S<>0 then
					Begin
						Writeln(S,' est un Premier Factoriel');
						j := j+1;
					end;
				end;
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
      		if Y<>0 Then
					Begin
          	Writeln(Y,' est un Premier Primoriel');
												j := j+1;
					end;
					if S<>0 then
					Begin
						Writeln(S,' est un Premier Primoriel');
												j := j+1;
					end;
					j := j+1;
				end;
      End;
  Until j=n;
End;
Begin
  Saisie(n);
  Fac_Prim(n);
End.