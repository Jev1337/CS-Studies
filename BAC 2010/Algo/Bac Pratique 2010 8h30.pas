Program bac_2010;
Uses Wincrt;
Var
  f: Text;
  gn,pn: String;
  n: Integer;

Procedure Remplir(Var f:Text;Var n:Integer);
Var
  i: Integer;
Begin
  Rewrite(f);
  Repeat
    Writeln('Saisir n: ');
    Readln(n);
  Until n In [2..50];
  For i:= 1 To n Do
    Writeln(f,Random(9)+1);
  Close(f);
End;
Procedure minmax(Var gn,pn:String; n:Integer);
Var
  ch1,ch2: String;
  i,aux: Integer;
Begin
  Reset(f);
  gn := '';
  pn := '';
  ch2 := '';
  For i:= 1 To n Do
    Begin
      Readln(f,ch1);
      ch2 := ch2+ch1;
    End;
  Repeat
    aux := 1;
    For i:= 1 To Length(ch2) Do
      If ch2[i] < ch2[aux] Then
        aux := i;
    pn := pn+ch2[aux];
    Delete(ch2,aux,1);
  Until ch2='';
  For i:= n Downto 1 Do
    gn := gn+pn[i];
  Writeln('PN: ',pn);
  Writeln('GN: ',gn);
  Close(f);
End;
Function Ecart(gn:String; n:Integer): Boolean ;
Var
  test: Boolean;
  x,i,y,R2,R1,e: Integer;
  t: Array[1..20] Of Integer;
Begin
  i := 0;
  test := True;
  For i:= 1 To n Div 2 Do
    Begin
      Val(gn[i],x,e);
      Val(gn[n-i+1],y,e);
      T[i] := Abs(x-y);
    End;
  i := 1;
  R1 := Abs(t[1]-t[2]);
  Repeat
    i := i+1;
    R2 := Abs(t[i-1]-t[i]);
    If R1 <> R2 Then
      test := False;
  Until (i= n Div 2) Or (test=False);
  ecart := test;
End;
Begin
  Randomize();
  Assign(f,'nombres.txt');
  Remplir(f,n);
  minmax(gn,pn,n);
  Writeln(ecart(gn,n));
End.
