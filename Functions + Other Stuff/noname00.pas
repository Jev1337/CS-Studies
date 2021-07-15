Program bacsc2020;
Uses Wincrt;
Var
  NL,NC,L,C: Integer;

Procedure Saisie(Var L,C,Li,Ci:Integer);
Begin
  Repeat
    Writeln('Veuillez Saisir: ');
    Write('NL:');
    read(l);
    Write('NC:');
    read(c);
  Until (L In [1..100]) And (C In [1..100]);
  Repeat
    Writeln('Veuillez Saisir: ');
    Write('L init: ');
    Readln(Li);
    Write('C init: ');
    Readln(Ci);
  Until (Li In [1..L]) And (Ci In [1..C]);
End;
Procedure mouvement(Var L,C,Li,Ci:Integer);
Var
  i,j: Integer;
  k: Char;
  ch1,ch2: String;
Begin
  i := 0;
  ch1 := '  ';
  For i:= 1 To (C*3) Do
    ch1 := ch1+'-';
  Repeat
		clrscr;
		writeln('Controls: WASD/ZQSD');
		Writeln(ch1);
    For i:= 1 To L+1 Do
      Begin
        For j:= 1 To C+1 Do
					if (Li = i) and (Ci=j) then
            Write('| X')
					Else
						Write(' | ');
				writeln();
				Writeln(ch1);
      End;
    k := Readkey();
    Case Upcase(k) Of
      'Q': Ci := Ci-1;
      'Z': Li := Li-1;
      'S': Li := Li+1;
      'D': Ci := Ci+1;
    End;
  Until (Li > L+1) Or (Ci > C+1) or (L = 0) or (C=0);
  If (Li > L) Or (Ci > C) or (L = 0) or (C=0) Then
    Writeln('Attention cas de depassement!')
End;
Begin
  Saisie(NL,NC,L,C);
  Mouvement(NL,NC,L,C);
End.
