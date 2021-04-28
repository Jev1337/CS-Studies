Program Bac2013;
Uses Wincrt;
Type
  enreg = Record
    NL: Integer;
    ICD: Integer;
    ICF: Integer;
  End;
  mat = Array[1..50,1..50] Of Integer;
  tab = Array[1..50] Of enreg;
Var
  M: mat;
  T: Tab;
  l,c,n: Integer;
  f: Text;
Procedure Remplir(Var M:mat;Var l,c:Integer);
Var
  i,j: Integer;
Begin
  Repeat
    Write('Veuillez Saisir L: ');
    Readln(L);
    Write('Veuillez Saisir C: ');
    Readln(C);
  Until (L In[3..24]) And (C In[3..24]);
  For i:= 1 To L Do
    For j:=1 To C Do
      Repeat
        Write('M[',i,',',j,'] = ');
        Readln(M[i,j]);
      Until (M[i,j] <> 0);
End;
Procedure Somme(M:mat;i,j,c:Integer;Var icf:Integer; Var s:Integer);
Begin
  s := 0;
  Repeat
    j := j+1;
    s := s+M[i,j];
  Until (s=0) Or (j=c);
  icf := j;
End;
Procedure Trait(M:mat;L,C:Integer; Var T:tab; Var N:Integer; Var F:Text);
Var
  max,icf,s,i,j: Integer;
Begin
  Rewrite(f);
  max := 0;
  n := 0;
  For i:= 1 To L Do
    For j:= 1 To C Do
      Begin
        somme(M,i,j-1,c,ICF,S);        //Returns ICF and S
        If s=0 Then
          Begin
            n := n+1;
            If max < ICF-j Then
              max := ICF-J;
            t[n].NL := i;
            t[n].ICD := j;
            t[n].ICF := ICF;
          End;
      End;
  Writeln(f,'La plus longue sequence = ',max+1);
  For i:=1 To n Do
    If (t[i].ICF - t[i].ICD = max) Then
      Writeln(f,t[i].NL,'#',t[i].ICD,'#',t[i].ICF);
  Close(f);
End;
Begin
  Assign(f,'Long_Seq.txt');
  Remplir(M,L,C);
  Trait(M,L,C,T,N,F);
End.