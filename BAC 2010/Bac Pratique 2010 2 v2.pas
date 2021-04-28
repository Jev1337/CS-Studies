Program Bac2010;
Uses Wincrt;
Var
  f: Text;
  GN,PN: String;
Procedure Remplir(Var f:Text);
Var
  i,n: Integer;
Begin
  Rewrite(f);
  Repeat
    Write('Saisir N: ');
    Readln(N);
  Until n In [3..50];
  For i:= 1 To n Do
    Writeln(f, Random(9)+1);
  Close(f);
End;
Procedure Trier(ch:String; Var GN:String; Var PN:String);
Var
  i,x: Integer;
  max: Char;
Begin
  x := Length(ch);
  Repeat
    max := ch[1];
    For i:= 2 To x Do
      If ch[i] > max Then
        max := ch[i];
    For i:= 1 To x Do
      If ch[i] = max Then
        Begin
          GN := GN+max;
          PN := max+PN;
          Delete(ch,i,1);
          x := x-1;
        End;
  Until x = 0;
End;
Procedure PetitGrand(Var F:Text;Var PN,GN:String);
Var
  aux,ch: String;
Begin
  Reset(f);
  ch := '';
  While Not Eof(f) Do
    Begin
      Readln(f,aux);
      ch := ch+aux;
    End;
  Trier(ch,GN,PN);
  Writeln('le plus petit nombre (pn) est: ',pn,' et le plus grand nombre (gn) est: ',gn);
  Close(f);
End;

Function Verif(ch:string):Boolean;
Var
i:Integer;
r:char;
Begin
	  r := ch[1];
		i:=2;
  while  (r=ch[i]) and (i <> Length(ch)) do
  	i:=i+1;
		verif:= r = ch[i];
end;

Procedure Affiche(GN:String);
Var
  e,i,x,y: Integer;
  ch,aux: String;
  r: Char;
  test: Boolean;
  t: Array[1..50] Of Integer;
Begin
  test := True;
  ch := '' ;
  For i:= 1 To Length(GN) Div 2 Do
    Begin
      Val(gn[i],x,e);
      Val(gn[Length(GN)-i+1],y,e);
      t[i] := x-y;
    End;
  For i:= 1 To Length(GN) Div 2 Do
    Begin
      Str(t[i+1]-t[i],aux);
      ch := aux+ch;
    End;
  If verif(ch) Then
    Begin
      For i:= 1 To (Length(gn) Div 2) - 1 Do
        Write(t[i],', ');
      Write(t[i+1], ' est une suite arithmetique de raison r = ',r);
    End
  Else
    Write('Aucune suite arithmetique!');
End;
Begin
  Assign(f,'Nombres.txt');
  Randomize();
  Remplir(F);
  PetitGrand(F,GN,PN);
  Affiche(GN);
End.