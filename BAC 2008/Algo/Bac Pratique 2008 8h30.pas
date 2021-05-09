Program Bac20082;
Uses Wincrt;
Var
  f,g,h: Text;
  n: Integer;
Procedure Remplir(Var f:Text; Var n:Integer);
Var
  i,x: Integer;
Begin
  Rewrite(f);
  Repeat
    Write('Veuillez Saisir n: ');
    Readln(n);
  Until n In [1..99];
  For i:= 1 To n Do
    Begin
      Repeat
        Write('Veuillez Saisir l''entier ',i,' : ');
        Readln(x);
      Until (x < 32000) And (x>=0);
      Writeln(f,x);
    End;
  Close(f);
End;
Function Rond(ch:String): Boolean;
Var
  i,s,e: Integer;
  x: Longint;
Begin
  i := 0;
  s := 0;
	val(ch,x,e);
  Repeat
    s := s+ x Mod 2;
    If x Mod 2 = 0 Then
      i := i+1;
    x := x Div 2;
  Until x=0;
  If s = i Then
		rond:= true
		else
		rond:= false;
End;
Procedure Trait(Var f:Text; n:Integer; Var g,h:Text);
Var
  i: Integer;
  ch: String;
Begin
  Reset(f);
  Rewrite(g);
  Rewrite(h);
  For i:= 1 To n Do
    Begin
      Readln(f,ch);
      If rond(ch) Then
        Writeln(g,ch)
      Else
        Writeln(h,ch);
    End;
  Close(f);
  Close(g);
  Close(h);
End;
Procedure Affiche(Var g:Text);
Var
  ch: String;
Begin
  Reset(g);
  Writeln('Les nombres ronds sont: ');
  While Not(Eof(g)) Do
    Begin
      Readln(g,ch);
      Writeln(ch);
    End;
  Close(g);
End;
Begin
  Assign(f,'naturels.txt');
  Assign(g,'ronds.txt');
  Assign(h,'non-ronds.txt');
  Remplir(f,n);
  Trait(f,n,g,h);
  Affiche(g);
End.
