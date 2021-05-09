Program bac2012;
Uses Wincrt;
Var
  f,g: Text;
Function Facteurs(x:Integer): String;
Var
  ch,aux: String;
  i,j,k: Integer;
  t: Array[1..50] Of String;
Begin
  i := 2;
  j := 0;
  ch := '';
  Repeat
    If x Mod i = 0 Then
      Begin
        j := j+1;
        Str(i,aux);
        t[j] := aux;
        x := x Div i;
      End
    Else
      i := i+1;
  Until x=1;
  i := 0;
  Repeat
    i := i+1;
    k := 1;
    While t[i] = t[i+1] Do
      Begin
        k := k+1;
        i := i+1;
      End;
    Str(k,aux);
    ch := ch+aux+t[i];
  Until i>=j;
  facteurs := ch;
End;
Procedure Remplir(Var f:Text);
Var
  n,p,x,i: Integer;
  ch: String;
Begin
  Rewrite(f);
  Repeat
    Write('Veuillez Saisir N: ');
    Readln(N);
    Write('Veuillez Saisir P: ');
    Readln(P);
  Until (N In [2..100]) And (P In [2..6]);
  For i:= 1 To N Do
    Begin
      Repeat
        Write('Saisir la valeur ',i,': ');
        Readln(x);
        Str(x,ch);
      Until Length(ch) = P;
      Writeln(f,ch);
    End;
  Close(f);
End;
Procedure Trait(Var f,g:Text);
Var
  x: Integer;
Begin
  Reset(f);
  Rewrite(g);
  While Not (Eof(f)) Do
    Begin
      Readln(f,x);
      Writeln(g,facteurs(x));
    End;
  Close(f);
  Close(g);
End;

Procedure Affiche(Var g:Text);
Var
  ch: String;
Begin
  Reset(g);
  While Not (Eof(g)) Do
    Begin
      Readln(g,ch);
      Writeln(ch);
    End;
End;
Begin
  Assign(f,'nombres.txt');
  Assign(g,'facteurs.txt');
  Remplir(f);
  Trait(f,g);
  affiche(g);
End.