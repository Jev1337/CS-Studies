Program Test;
Uses Wincrt;
Const
  L = 10;
  C = 10;
Type
  mat = Array[1..10,1..10] Of Char;
Var
  M: mat;
Procedure Generer(M: mat;L,C : Integer);
Var
  i,j: Integer;
Begin

//Remplissage De La Matrice:
  For i:= 1 To L Do
    For j:= 1 To C Do
      M[i,j] := Chr(Random(2)*(Ord('a') - Ord('0') + Random(17))+ Ord('0') + Random(10));

//Affichage De La Matrice:			
  For i:= 1 To L Do
    Begin
      For j:= 1 To c Do
        Write(M[i,j], ' | ');
      Writeln();
    End;

//Fin du programme:
  Writeln();
  Writeln('Cliquez Un Boutton Pour Generer Un Nouveau Tableau Aleatoire.');
  Readkey();
	ClrScr;
  Generer(M,L,C);
End;
Begin
  Randomize;
  Generer(M,L,C);
End.