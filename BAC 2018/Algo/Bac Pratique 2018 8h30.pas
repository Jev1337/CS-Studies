Uses Wincrt;
Type
  mat = Array[1..20,1..10] Of Integer;
Var
  // n in 1..20
  f,g: Text;
  m: mat;
  l,c: Integer;
Procedure TransfertFrom(Var f:Text; Var m:mat; Var i,max:Integer);
Var
  e,j: Integer;
  a: Char;
  ch: String;
Begin
  Reset(f);
  i := 1;
  j := 0;
  max := 0;
  ch := '';
  While Not(Eof(f)) Do
    Begin
      read(f,a);
      If a <> ' ' Then
        ch := ch+ a
      Else
        Begin
          j := j+1;
          Val(ch,M[i,j],e);
          ch := '';
        End;
      If Eoln(f) Then
        Begin
          If max < j Then
            max := j;
          Val(ch,M[i,j],e);
          ch := '';
          Readln(f);
          i := i+1;
          j := 0;
        End;
    End;
  i := i-1;
  Close(f);
End;

Procedure Tri_Insertion (Var M: mat ; j,l: Integer) ;
Var
  i, k, aux : Integer ;
Begin
  For i := 2 To l Do
    Begin
      aux := M[i,j] ;
      k := i ;
      While (k > 1) And (M[k - 1,j] > aux) Do
        Begin
          M[k,j] := M[k- 1,j] ;
          k := k - 1 ;
        End ;
      M[k,j] := aux ;
    End ;
End;

Procedure TransfertTo(Var m:mat; l,c:Integer; Var g:Text);
Var
  i,j: Integer;
Begin
  Rewrite(g);
  For j:= 1 To c Do
    Tri_Insertion(m,j,l);
  For i:= 1 To l Do
    Begin
      For j:= 1 To c Do
        Write(g,M[i,j],' ');
      Writeln(g);
    End;
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
  Assign(f,'Source.txt');
  Assign(g,'Resultat.txt');
  TransfertFrom(f,m,l,c);
  TransfertTo(m,l,c,g);
  Affiche(g);
End.
