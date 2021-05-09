Program bac_2011_est_vraiment_facile;
Uses Wincrt;
Type
  scan = Record
    Nb_Dec: Longint;
    Mention: String;
  End;
  tab = Array[1..50] Of scan;
Var
  f: Text;
  n: Integer;
  t: tab;

Function Verif(ch:String): Boolean;
Var
  i: Integer;
  test: Boolean;
Begin
  i := 0;
  Repeat
    i := i+1;
    test := Upcase(ch[i]) In ['A'..'Z','0'..'9'];
  Until Not(test) Or (i=Length(ch));
  verif := test;
End;
Procedure Remplir(Var F:Text; Var N:Integer);
Var
  i: Integer;
  ch: String;
Begin
  Rewrite(f);
  Repeat
    Write('Veuillez Saisir N: ');
    Readln(N);
  Until n In [1..50];
  For i:= 1 To n Do
    Begin
      Repeat
        Write('Veuillez saisir ch(',i,'): ');
        Readln(ch);
      Until verif(ch);
      Writeln(f,ch);
    End;
End;
Function Filtrer(ch: String): Longint;
Var
  i,e: Longint;
  ch1: String;
Begin
  ch1 := '';
  For i:= 1 To Length(ch) Do
    If ch[i] In ['0'..'9'] Then
      ch1 := ch1+ch[i];
  Val(ch1,i,e);
  If e=0 Then
    filtrer := i
  Else
    filtrer := 1999999999;
End;
Function Div11(n:Integer): String;
Var
  ch: String;
  x,i,y,e: Integer;
Begin
  x := 0;
  y := x;
  Str(n,ch);
  For i:= 1 To Length(ch) Do
    Begin
      Val(ch[i],n,e);
      If i Mod 2 = 0 Then
        x := x+n
      Else
        y := y+n;
    End;
  If Abs(x-y) Mod 11 = 0 Then
    div11 := 'Le nombre est divisible par 11'
  Else
    div11 := 'Le nombre n''est pas divisible par 11';
End;
Procedure Trait(Var F:Text; N:Integer;Var T:tab);
Var
  i: Integer;
  ch: String;
Begin
  Reset(f);
  For i:= 1 To N Do
    Begin
      Readln(f,ch);
      t[i].Nb_Dec := Filtrer(ch);
      If t[i].Nb_Dec <> 1999999999 Then
        t[i].Mention := Div11(t[i].Nb_Dec)
      Else
        t[i].mention := 'Ce n''est pas un nombre decimal';
    End;
  Close(f);
End;
Procedure Affiche(t:tab; n:Integer);
Var
  i: Integer;
Begin
  For i:= 1 To n Do
    Writeln('Nb_Dec: ',t[i].Nb_Dec,' | ','Mention: ',t[i].mention);
End;
Begin
  Assign(f,'chaines.txt');
  Remplir(F,N);
  Trait(F,N,T);
  Affiche(T,N);
End.
