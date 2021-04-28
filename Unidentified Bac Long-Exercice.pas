Program ex;
Uses Wincrt;
Var
  cle,msg: String;

Function Verif1(ch:String): Boolean;
Var
  i: Integer;
  test: Boolean;
Begin
  i := 0;
  Repeat
    i := i+1;
    test := ch[i] = Upcase(ch[i]);
  Until (i=Length(ch)) Or (test = False);
  verif1 := test;
End;

Function Verif2(ch:String): Boolean;
Var
  i: Integer;
  test: Boolean;
Begin
  i := 0;
  Repeat
    i := i+1;
    test := ch[i] In ['a'..'z','0'..'9',' '];
  Until (i=Length(ch)) Or (test = False);
  verif2 := test;
End;

Procedure Saisie(Var Cle,Msg:String);
Begin
  Repeat
    Write('Veuillez Saisir une cle: ');
    Readln(cle);
  Until (Length(cle) = 6) And (verif1(cle));
  Repeat
    Write('Veuillez Saisir Le Message: ');
    Readln(msg);
  Until (Length(msg) <= 18) And (verif2(msg))
End;

Function Crypt(cle,msg:String): String;
Type
  mat = Array['A'..'G','A'..'F'] Of Char;
Var
  j,k: Char;
  i: Integer;
  m1: mat;
  m2: mat;
  msgi: String;
Function IsNotIn(x:Char;M:mat;L,C:Char): Boolean;
Var
  i,j: Char;
  test: Boolean;
Begin
  test := True;
  For i:= 'A' To L Do
    For j:= 'A' To C Do
      If M[i,j] = x Then
        test := False;
  IsNotIn := test;
End;

Procedure RemplirAlea(Var M:mat; L,C:Char; aleatoire:Boolean);
Var
	f:text;
  i,j: Char;
  k: Integer;
  ch: Char;
Begin
  If aleatoire Then
    For i:= 'A' To L Do
      For j:= 'A' To C Do
        Begin
          Repeat
            ch := Chr(Random(2)*(Ord('a') - Ord('0') + Random(17))+ Ord('0') + Random(10));
          Until IsNotIn(CH,M,L,C);
          {voir si il existe deja}
          M[i,j] := ch;
        End
  Else
    Begin
			assign(f,'temp.txt');
			reset(f);
			i:='A';
			j:=pred('A');
      For k:= 1 To 36 Do
        Begin
          j := Succ(j);
          If j = 'G' Then
            Begin
              j := 'A';
              i := Succ(i);
            End;
          Readln(f,M[i,j]);
        End;
				close(f);
    End;
End;

Function crypt1(msg: String;m:mat;L,C:Char): String;
Var
  i,j: Char;
  k: Integer;
  msgi: String;
Begin
  msgi := '';
  For k:= 1 To Length(msg) Do
    Begin
      If msg[k] = ' ' Then Msgi := msgi+ ' '
      Else
        For i:= 'A' To L Do
          For j:= 'A' To C Do
            If msg[k] = M[i,j] Then
              msgi := msgi+i+j;
    End;
  crypt1 := msgi;
End;

Procedure Remplir(Var M: mat; L,C:Char; msgi,cle:String);
Var
  i,j: Char;
Begin
  For j:= 'A' To C Do
    M['A',j] := cle[Ord(j)-Ord('A')+1];
  While Length(msgi) <> 36 Do
    msgi := msgi+ ' ';
  For i:= 'B' To L Do
    For j:= 'A' To C Do
      Begin
        M[i,j] := msgi[1];
        Delete(msgi,1,1);
      End;
End;

Procedure Permut(Var M:mat; L,j:Char);
Var
  aux: Char;
  i: Char;
Begin
  For i:= 'A' To L Do
    Begin
      aux := M[i,j];
      M[i,j] := M[i,Succ(j)];
      M[i,Succ(j)] := aux;
    End;
End;

Procedure Tri(Var M:mat ;L,c:Char);
Var
  j: Char;
  echange: Boolean;
Begin
  Repeat
    echange := False;
    For j:= 'A' To Pred(c) Do
      If M['A',j] > M['A',Succ(j)] Then
        Begin
          permut(M,L,j);
          echange := True;
        End;
  Until echange = False;
End;

Function crypt2(M:mat;L,C:Char): String;
Var
  i,j: Char;
  ch: String;
Begin
  ch := '';
  For j:= 'A' To C Do
    For i:= 'B' To L Do
      ch := ch+M[i,j];
  crypt2 := ch;
End;
Begin
  {RemplirAlea(M1,'F','F',False); => Mode Non Aleatoire}
	RemplirAlea(M1,'F','F',true); {=> Mode Aleatoire}
  msgi := crypt1(msg,m1,'F','F');
  Remplir(M2,'G','F',msgi,cle);
  tri(M2,'G','F');
  crypt := crypt2(M2,'G','F');
End;
Begin
  Randomize;
  saisie(cle,msg);
  Writeln(crypt(cle,msg));
End.