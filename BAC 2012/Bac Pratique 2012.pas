Program bac;
Uses Wincrt;
Var
  k: Integer;
  f: Text;

Procedure Saisie(Var k:Integer);
Begin
  Repeat
    Write('Saisir k: ');
    Readln(k);
  Until k In [2..15];
End;
Function Increment(ch:String): String;
Type
  tab = Array['0'..'9'] Of Integer;
Var
  t: tab;
  aux,ch1: String;
  i: Integer;
  j: Char;

Procedure Init(Var t:tab);
Var
  i: Char;
Begin
  For i:= '0' To '9' Do
    Begin
      t[i] := 0;
    End;
End;
Begin
  init(t);
  ch1 := '';
  aux := '';
  For i:= 1 To Length(ch) Do
    t[ch[i]] := t[ch[i]]+1;
  For j:= '9' Downto '0' Do
    Begin
      If t[j] > 0 Then
        Begin
          Str(t[j], aux);
          ch1 := ch1 + aux + j;
        End;
    End;
  increment := ch1;
End;
Procedure Trait(k:Integer; Var f:Text);
Var
  U: Array[0..16] Of String;
  i: Integer;
Begin
  Rewrite(f);
  u[0] := '0';
  For i:= 1 To k Do
    Begin
      u[i] := Increment(u[i-1]);
      Writeln(f,u[i]);
    End;
  Close(f);
End;
Procedure affiche(Var f:Text);
Var
  ch: String;
Begin
  Reset(f);
  While Not(Eof(f)) Do
    Begin
      Readln(f,ch);
      Writeln(ch);
    End;
  Close(f);
End;
Begin
  Assign(f,'Robinson.txt');
  Saisie(k);
  Trait(k,f);
  affiche(f);
End.
