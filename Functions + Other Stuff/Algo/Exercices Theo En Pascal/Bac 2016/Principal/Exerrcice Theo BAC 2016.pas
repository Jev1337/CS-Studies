Program rere;
Uses Wincrt;
Var
  F: Text;
Function Prime(x:Integer): Boolean;
Var
  r,i: Integer;
Begin
  r := 0;
  For i:= 1 To x Do
    If x Mod i = 0 Then
      r := r+1;
  prime := (r=2);
End;
Function Bin(x:LongInt): String;
Var
  r,ch: String;
Begin
	ch:='';
  Repeat
    Str(x Mod 2,r);
    ch := r+ch;
    x := x Div 2;
  Until x = 0;
  bin := ch;
End;
Function Hex(x:LongInt): String;
Var
  r,ch: String;
Begin
		ch:='';
  Repeat
    Str(x Mod 16,r);
    If r > '10' Then
      r := Chr(x Mod 16 + 55);
    ch := r+ch;
    x := x Div 16;
  Until x= 0;
  hex := ch;
End;
Function Check(ch:String): Boolean;
Var
  aux: String;
	x:LongInt;
  e,i: Integer;
  test1,test2: Boolean;
Begin
	test1:=false;
	test2:=true;
  for i:= 1 to Length(ch) Do
		if not(ch[i] in ['0'..'9']) Then
			test2:=false;
	if test2 then
	Begin
    If Length(ch) = 13 Then
      Begin
        Val(ch[1]+ch[2]+ch[3],x,e);
				     If prime(x) Then
          Begin
            Val(ch[4]+ch[5]+ch[6]+ch[7]+ch[8],x,e);
            aux := Bin(x);
            While (Pos('1',aux) <> 0) Do
              Delete(aux,Pos('1',aux),1);
            If Length(aux) > 8 Then
              Begin
                Val(ch[9]+ch[10]+ch[11]+ch[12]+ch[13],x,e);
                aux := hex(x);
                If (Pos('E',aux) <> 0) Or (Pos('F',aux) <> 0) Or (Pos('D',aux) <> 0) Then
                  test1 := True
              End ;
          End ;
      End;
	end;
  check := test1;
End;
Procedure Retreive(Var F:Text);
Var
  ch: String;
Begin
  Reset(f);
  While Not(Eof(F)) Do
    Begin
      Readln(f,ch);
      If check(ch) Then
        Writeln('Recharge reussite!')
      Else
        Writeln('Code non valide!');
    End;
End;
Begin
  Assign(f,'test.txt');
  Retreive(f);
End.
