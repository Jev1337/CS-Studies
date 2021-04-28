Uses Wincrt;
Type
  Mat = Array[1..20,1..20] Of Integer;
Var
  F: Text;
  M: mat;
  N: Byte;

Function Premier(x:Integer): Boolean;
Var
  test: Boolean;
  i: Integer;
Begin
  test := True;
  For i:= 2 To (x Div 2) Do
    If x Mod i = 0 Then
      test := False;
  Premier := test;
End;
Procedure AutoRemplir(Var M:Mat; Var N:Byte);
Var
  i,j: Integer;
  x: Integer;
Begin
  Randomize();
  Repeat
    Write('Veuillez Saisir N: ');
    Readln(N);
  Until N In [4..20];
  For i:= 1 To N Do
    For j:= 1 To N Do
      Begin
        Repeat
          x := Random(98)+2;
        Until premier(x);
        M[i,j] := x;
      End;
End;
Procedure Chk1(M:mat;i:Integer; N:Byte;Var Res:Boolean;Var ch:String; sig:Integer);
Var
  aux: String;
  j: Integer;
Begin
  j := 0;
  Str(i,aux);
  ch := 'L'+aux+'*';
  Repeat
    j := j+1;
    Res := M[i,j]*sig < M[i,j+1]*sig;
    Str(M[i,j],aux);
    ch := ch+aux+'-';
  Until (Res=False) Or (J=N-1);
  Str(M[i,j+1],aux);
  ch := ch+aux;
End;
Procedure Chk2(M:mat;j:Integer; N:Byte;Var Res:Boolean;Var ch:String;sig:Integer);
Var
  aux: String;
  i: Integer ;
Begin
  i := 0;
  Str(j,aux);
  ch := 'C'+aux+'*';
  Repeat
    i := i+1;
    Res := M[i,j]*sig < M[i+1,j]*sig;
    Str(M[i,j],aux);
    ch := ch+aux+'-';
  Until (Res=False) Or (I=N-1);
  Str(M[i+1,j],aux);
  ch := ch+aux;
End;
Procedure DetectSort(M:mat; N:Byte; Var F:Text);
Var
  i,j: Integer;
  ch: String;
  res: Boolean;
Begin
  Rewrite(f);
  For i:= 1 To n Do
    Begin
      Chk1(M,i,N,Res,Ch,1); {Colonnes}
      If (Res = False) Then
        Chk1(M,i,N,Res,ch,-1);
      If res Then
        Writeln(f,ch);
      Chk2(M,i,N,Res,Ch,1); {Lignes}
      If (Res = False) Then
        Chk2(M,i,N,Res,ch,-1);
      If res Then
        Writeln(f,ch);
    End;
  Close(f);
End;
Begin
  Assign(f,'Result.txt');
  AutoRemplir(M,N);
  DetectSort(M,N,F);
End.
