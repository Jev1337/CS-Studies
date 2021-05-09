Program Ex4;
Uses Wincrt;
Var
  f,g: Text;
Function Compress(ch:String): String;
Var
  i,x: Integer;
  ch1,ch2: String;
Begin
  ch1 := '';
  If ch[1] <> '0' Then
    ch1 := '0';
  i := 0;
  Repeat
{writeln(ch);}
    If ch[1]='2' Then {Chunk of 255s}
      Begin
        If Pos('0',ch) <> 0 Then
          Begin
            x := (Pos('0',ch)-1) Div 3;
            Str(x, ch2);
            ch1 := ch1+' '+ ch2;
            Delete(ch,1,x*3);
          End
        Else
          Begin
            x := Length(ch) Div 3;
            Str(x, ch2);
            ch1 := ch1+' '+ch2;
            ch := '';
          End;
      End
    Else
      Begin
        If Pos('2',ch) <> 0 Then {Chunk of 0s}
          Begin
            x := Pos('2',ch)-1;
            Str(x, ch2);
            ch1 := ch1+' '+ ch2;
            Delete(ch,1,x);
          End
        Else
          Begin
            x := Length(ch);
            Str(x, ch2);
            ch1 := ch1+' '+ch2;
            ch := '';
          End;
      End;
  Until ch='';
  compress := ch1;
End;
Procedure Remplir(Var f,g:Text);
Var
  ch: String;
Begin
  Reset(f);
  Rewrite(g);
  While Not(Eof(f)) Do
    Begin
      Readln(f,ch);
      Writeln(g,compress(ch));
    End;
  Close(f);
  Close(g);
End;
Procedure Affiche(Var g:Text);
Var
  ch: String;
Begin
  Reset(g);
  While Not(Eof(g)) Do
    Begin
      Readln(g,ch);
      Writeln(ch);
    End;
  Close(g);
End;
Begin
  Assign(f,'image.txt');
  Assign(g,'im_compress.txt');
  Remplir(f,g);
  affiche(g);
End.
