Program JeanLucMomo;
Uses Wincrt;
Type
  mat = Array[1..225,1..225] Of Char;
Var
  N: Integer;
  M: mat;
  F: Text;

Function verif(ch:String): Boolean;
Var
  test: Boolean;
  i: Integer;
Begin
  i := 0;
  Repeat
    i := i+1;
    test := Upcase(ch[i]) In ['A'..'Z','0'..'9'];
  Until (test = False) Or (i=Length(ch)) ;
  verif := test;
End;
Procedure Transfert(Var res:String;N:Integer;m:mat);
Var
  i,j: Integer;
Begin
  For i:= 1 To n Do
    res := res+M[i,i];
  For i:= 2 To n Do
    For j:= 1 To i-1 Do
      res := res+M[i,j];
  For i:= 1 To n-1 Do
    For j:=i+1 To n Do
      res := res+M[i,j];
End;

Function Tri(ch:String): String;
Var
  permut: Boolean;
  i: Integer;
  aux: Char;
Begin
  Repeat
    permut := False;
    For i:= 1 To Length(ch)-1 Do
      If ch[i] > ch[i+1] Then
        Begin
          aux := ch[i];
          ch[i] := ch[i+1];
          ch[i+1] := aux;
          permut := True;
        End;
  Until permut=False;
  tri := ch;
End;
Procedure Remplir(Var M:mat; Var N:Integer; Var f:Text);
Var
  i,j: Integer;
  ch,res: String;
Begin
  Rewrite(f);
  Repeat
    Writeln('Veuillez Saisir N agences: ');
    Readln(n);
  Until (n In [3..15])
Repeat
  Writeln('Veuillez Saisir le mot de passe: ');
  Readln(ch);
Until verif(ch) And (Length(ch) <= n*n);
While Length(ch) <> n*n Do
  ch := ch+ Chr(Random(26)+Ord('A'));
For i:= 1 To n Do
  For j:= 1 To n Do
    Begin
      M[i,j] := ch[1];
      Delete(ch,1,1);
    End;
res := '';
Transfert(Res,N,M);
i := 0;
Repeat
  Writeln(f,tri(Copy(res,1,n)));
  Delete(res,1,n);
Until res='';
Close(f);
End;
Begin
  Assign(F,'Mots.txt');
  Remplir(M,N,F);
End.
