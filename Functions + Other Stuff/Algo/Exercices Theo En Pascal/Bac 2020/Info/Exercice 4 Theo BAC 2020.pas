Program exercice4;
Uses Wincrt;
Type
  Mat = Array[1..50,1..50] Of Integer;
Var
  M: mat;
  N: Integer;
  f: Text;

Procedure Remplir(Var f:Text; Var M:mat; Var N:Integer);
Var
  i,j,max,maxj: Integer;
Begin
  Rewrite(f);
  Repeat
    Writeln('Veuillez Saisir n: ');
    Readln(n);
  Until n In [5..50];
  For i:= 1 To n Do
    For j:= 1 To n Do
      Begin
        Writeln('Veuillez Saisir M[',i,',',j,']: ');
        Readln(M[i,j]);
      End;
  For i:= 1 To n Do {Travail Theorique de la Procedure Remplir commence ici}
    Begin
      max := M[i,1];
      maxj := 1;
      For j:= 2 To n Do
        If M[i,j] > max Then
          Begin
            max := M[i,j];
            maxj := j;
          End;
      Writeln(f,'Vmax = ',max,', NL = ',i,' et NC = ',maxj);
    End;
  Close(f);
End;
Function Frequence(Var f:Text; nc:Integer): Integer;
Var
  ch: String;
  x,e,nb: Integer;
Begin
  Reset(f);
  nb := 0;
  While Not(Eof(f)) Do
    Begin
      Readln(f,ch);
      Delete(ch,1,Pos('NC = ',ch)+4);       {On peut utiliser Val(ch[length(ch)-1]+ch[length(ch),x,e) car val(' 123',x,e) => x=123 e=0}
      Val(ch,x,e);
      If x = nc Then
        nb := nb+1;
    End;
  Close(f);
  frequence := nb;
End;

Procedure Dominant(var F:Text;N:Integer);
Var
  max,maxj,j: Integer;
Begin
  max := frequence(F,1);
  For j:= 2 To n Do
    If frequence(F,j)>=max Then
		Begin
      max := frequence(F,j);
			maxj:=j;
		end;
  Writeln(maxj,' est la colonne dominante');
End;
Begin
  Assign(f,'F_Max.txt');
  Remplir(F,M,N);
	Dominant(F,N);
End.
