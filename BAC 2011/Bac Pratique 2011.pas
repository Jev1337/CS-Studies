				Program bac2011;
Uses Wincrt;
Var
f:text;
a,b:longint;
Function premier (x:longint): Boolean;
Var
  i,nb: longint;
Begin
  nb := 0;
  premier := False;
  For i:=x Downto 2 Do
    If (x Mod i) = 0 Then
      nb := nb+1;
  If nb=1 Then
    premier := True;
End;

Function puis (entier,facteur:Longint): Longint;
Var
  j,i: Longint;
Begin
  j := 1;
	writeln (facteur) ;
  For i:=1 To facteur Do
    j := j*entier;
  puis := j;
End;

Procedure creation (Var f:Text);
Begin
  Assign (f,'c:/bac/mersenne.txt');
End;

Procedure saisie (Var a,b:Longint);
Begin
  Repeat
    Write ('Saisir A: ');
    Readln (a);
    Write ('Saisir B: ');
    Readln (b);
  Until (2<a) And (a<b) And (b<50000);
End;

Procedure traitement (Var f:Text;a,b:Longint);
Var
aux,x,i:longint;
Begin
    rewrite (f);
    for i:=a to b Do
        Begin
            aux:=0;
            Repeat
                aux := aux+1;
            x := puis(2,aux)-1;
            Until    x=i;
            if (premier(x)) and (premier(i)) Then
                writeln (f,'(2^',aux,')-1');
        end;
    close (f);
End;

Procedure affiche (Var f:Text);
Var
  ch: String;
Begin
  Reset (f);
  While Not (Eof(f)) Do
    Begin
            readln (f,ch);
            writeln (ch);
        End;
    close (f);
End;
Begin
    creation (f);
    saisie (a,b);
    traitement (f,a,b);
    affiche (f);
End.