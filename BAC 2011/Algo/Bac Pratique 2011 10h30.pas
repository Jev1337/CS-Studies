Program Bac2011;
// Temps Pris Pour Finir Ce Programme: 50:40:96 Minutes
// Methode De Compilation: FreePascal
Uses crt;
Type
  tab = Array[1..100] Of Integer;
Var
  f: Text;
  N,M: Integer;
  //Saisie De N et M
Procedure Saisie(Var N,M: Integer);
Begin
  Repeat
    Write('Veuillez Saisir M: ');
    Readln(M);
    Write('Veuillez Saisir N: ');
    Readln(N);
  Until (100<M) And (N < 1000) And (M<N);
End;
//Somme des chiffres d'un entier
Function SumNbr(x: Integer): Integer;
Var
  s,i,y,e: Integer;
  ch: String;
Begin
  s := 0;
  Str(x,ch);
  For i:= 1 To Length(ch) Do
    Begin
      Val(ch[i],y,e);
      s := s+y;
    End;
  sumnbr := s;
End;
//Calcul Des Facteurs Premiers
Procedure FP(Var t: tab;Var j:Integer; x: Integer; Var Somme:Integer);
Var
  i,k: Integer;
Begin
  // Compteur Des Diviseurs
  i := 1;
  // Compteur Du Tableau T
  j := 0;
  somme := 0;
  Repeat
    i := i+1;
    If x Mod i = 0 Then
      Begin
        j := j+1;
        // Le tableau T sert a stocker les facteurs premiers pour les mettre dans le fichier après
        t[j] := i;
        x := x Div i;
        i := 1;
      End;
  Until x=1;
  For k:=1 To j Do
    somme := somme + sumnbr(t[k]) ;
  // Somme des chiffres des fact premiers totales
End;
// Voir si le nombre est rigolo; si Il est, Le stocker dans F
Procedure Rigolo(Var f: Text;N,M: Integer);
Var
  t: tab;
  k,i,j,somme: Integer;
Begin
  Rewrite(f);
  For i:= M To N Do
    Begin
      FP(t,j,i,somme);
      If sumnbr(i) = somme Then
        Begin
          Write(f, i,' = ', t[1]);
          For k:=2 To j Do
            Write(f, ' * ', t[k]);
          Writeln(f);
        End;
    End;
  Close(f);
End;
Procedure Affiche(Var f: Text);
Var
  ch: String;
Begin
	ch:='';
  Reset(f);
  While Not (Eof(F)) Do
    Begin
      Readln(f, ch);
      Writeln(ch);
    End;
  Close(f);
	if ch='' Then
	writeln('Il n''ya pas de nombres rigolo!');
End;
Begin
  //Juste Pour Lancer Directement j'utilise directement l'emplacement du fichier .pas
  Assign(F,'Resultat.txt');
  Saisie(N,M);
  Rigolo(F,N,M);
  Affiche(F);
End.