Program bac2010;
Uses Wincrt;
Const
  alpha = 'ABCDEFGHIJ';
Type
  Mat = Array ['A'..'J','A'..'J'] Of Real;
Var
  T,M: mat;
  n: Integer;
Procedure Saisie(Var T:mat; Var n :Integer);
Var
  i,j: Char;
Begin
  Repeat
    Write('Veuillez Saisir n: ');
    Readln(n);
  Until n In [3..10];
  For j:= 'A' To alpha[n] Do
    For i:= 'A' To 'B' Do
      Begin
        Write('Veuillez Saisir ',j,'[',Chr(Ord(i)+55),'] : ');
        Readln(T[i,j]);
      End;
End;
Procedure Remplir(T:mat;Var n:Integer; Var M:mat);
Var
  i,j: Char;
Begin
  For i:= 'A' To alpha[n] Do
    For j:= 'A' To alpha[n] Do
      M[i,j] := Sqrt(Sqr(T['A',j]-T['A',i]) + Sqr(T['B',j] - T['B',i]));
End;
Procedure Affiche(M:mat;n:Integer);
Var
  i,j: Char;
  min: Real;
Begin
  For i:= 'A' To alpha[n] Do
    Begin
      For j:= 'A' To alpha[n] Do
        Write(M[i,j]:0:1, ' | ');
      Writeln();
    End;
  Repeat
    Writeln('Veuillez Saisir Un Point: ');
    Readln(i);
  Until i In ['A'..alpha[n]];
  If i = 'A' Then
    min := M['A','B']
  Else
    min := M[i,'A'];
  For j:= 'B' To alpha[n] Do
    If (M[i,j] < min) And (i<>j) Then
      min := M[i,j];
  j := Pred('A');
  Repeat
    j := Succ(j);
  Until min=M[i,j];
  Writeln('Le premier point le plus proche a ',i,' est: ',j);
End;
Begin
  Saisie(T,n);
  Remplir(T,n,M);
  Affiche(M,n);
End.
