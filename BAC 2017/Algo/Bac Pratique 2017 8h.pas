Program BAC;
Uses crt;
Type
  Mat = Array[1..10,1..10] Of Char;
Var
  f,g: Text;
  c: String;

Procedure Creation(Var f,g: Text);
Begin
  Assign(f,'Source.txt');
  Assign(g, 'Crypt.txt');
End;
Procedure Saisie(Var Cle: String);

Function Verif(ch:String): Boolean;
Var
  i: Integer;
  test: Boolean;
Begin
  i := 0;
  test := True;
  Repeat
    i := i+1;
    test := (Pos(ch[i],ch) = i) And (ch[i] In ['A'..'Z']);
  Until (test = False) Or (i = Length(ch));
  verif := test;
End;
Begin
  Repeat
    Write('Veuillez Saisir La Cle De Cryptage: ');
    Readln(cle);
  Until (verif(cle)) And (Length(cle) In [5..10]);
End;
Procedure Crypter(Cle: String; Var f,g:Text);

Procedure Remplir(Var M:Mat;L:Integer;C:Integer;Var Ch:String);
Var
  i,j: Integer;
Begin
  For i:= 1 To L Do
    Begin
      For j:= 1 To C Do
        Begin
          M[i,j] := ch[1];
          Delete(ch,1,1);
        End;
    End;
End;
Var
  m: mat;
  i,j,L,C: Integer;
  ch,ch2: String;
Begin
  Reset(f);
  Rewrite(g);
  While Not (Eof(F)) Do
    Begin
      Readln(f,ch);
      While Length(ch) Mod Length(cle) <> 0 Do
        ch := ch+' ';
      C := Length(cle);
      L := Length(ch) Div Length(Cle);
      Remplir(M,L,C,Ch);
      ch2 := '';
      For j:= 1 To C Do
        Begin
          ch2 := ch2+cle[j];
          For i:= 1 To L Do
            ch2 := ch2+M[i,j];
        End;
      Writeln(g, ch2);
    End;
  Close(f);
  Close(g);
End;
Procedure Affiche(Var g:Text);
Var
  ch: String;
Begin
  Reset(g);
  While Not (Eof(G)) Do
    Begin
      Readln(g,ch);
      Writeln(ch);
    End;
  Close(g);
End;
Begin
  Creation(f,g);
  Saisie(C);
  Crypter(C,f,g);
  Affiche(g);
End.
