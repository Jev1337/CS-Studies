Program bac2020;
Uses Wincrt;
Var
  f,g,h: Text;

Function Divis13(n:String): Boolean;
Var
  v,e,s,sg: Integer;
Begin
  s := 0;
  sg := -1;
  While Length(n) >= 3 Do
    Begin
      Val(Copy(N,Length(N)-2,3),v,e);
      S := s+v*Sg;
      Sg := -Sg;
      Delete(N,Length(N)-2,3);
    End;
  Val(N,v,e);
  s := S+v*Sg;
  divis13 := Abs(S) Mod 13 = 0;
End;

Function Divis7(n:String): Boolean;
Var
  s,sg,j,i,e,v: Integer;
  t: Array[1..3] Of Integer;
Begin
  t[1] := 1;
  t[2] := 3;
  t[3] := 2;
  Repeat
    s := 0;
    sg := 1;
    j := 0;
    For i:= Length(N) downto 1 Do
      Begin
        j := j+1;
        Val(N[i],v,e);
        s := s+v*sg*t[j];
        If j=3 Then
          Begin
            j := 0;
            sg := -sg;
          End;
      End;
    Str(s,n);
		writeln(s);
  Until s<10;
  divis7 := (s = 0) Or (s=7);
End;
Procedure Saisie(Var f:Text);
Var
  n,nb,i: Longint;
Begin
  Rewrite(f);
  Repeat
    Writeln('Veuillez Saisir N: ');
    Readln(nb);
  Until nb>= 5;
  For i:= 1 To nb Do
    Begin
      Repeat
        Write('Veuillez Saisir le nombre: ');
        Readln(n);
      Until n>=0;
      Writeln(f,n);
    End;
  Close(f);
End;
Procedure Divis(Var f:Text;Var g:Text; Var h:Text);
Var
  n: String;
Begin
  Reset(f);
  Rewrite(g);
  Rewrite(h);
  While Not(Eof(f)) Do
    Begin
      Readln(f,n);
      If Divis13(n) Then
        Writeln(g,n);
      If Divis7(n) Then
        Writeln(h,n);
    End;
  Close(f);
  Close(g);
  Close(h);
End;
Begin
  Assign(f,'Nombre.txt');
  Assign(g,'Div13.txt');
  Assign(h,'Div7.txt');
  Saisie(f);
  Divis(f,g,h);
End.
