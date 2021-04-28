Program bac;
uses wincrt;
Type
mat = array[1..10,1..10] of Integer;
Var
m:mat;
L,C:Integer;
f:text;
	Procedure Remplir(var M:mat; var L,C:Integer);
	Var
	i,j:Integer;
	Begin
		Repeat
			write('Veuillez Saisir L: ');
			readln(l);
			write('Veuillez Saisir C: ');
			readln(c);
		until	(L in [1..10]) and (C in [3..10]) and (C mod 2 = 0);
		for i:= 1 to L Do
			for j:= 1 to C Do
			Begin
				write('Veuillez Saisir M[',i,',',j,']: ');
				readln(M[i,j]);
			end;
	end;

	Procedure SommeSy(M:mat; L,C:Integer; var F:text);
	Var
	i,j:Integer;
	Begin
		rewrite(f);
		for i:= 1 to L Do
			for j:= 1 to C div 2 Do
			writeln(f,abs(M[i,j]-M[i,C-j+1]));
		close(f);
	end;


	Procedure AfficheSuite(var F:text; nbtrait:Integer);
	Type
	tab = array[1..200] of Integer;
	Var
	k,j,fin,i:Integer;
	t,u: tab;
	ch,aux:string;
	test:Boolean;
	Begin
		Reset(f);
		ch:='';
		k:=0;
			for i:= 1 to Nbtrait Do        // F (File Of Text) -> T (Array)  nbtrait = longeur du tableau T
				readln(f,t[i]);
				
			for i:= 1 to NbTrait-1 do      // T (Array) -> U (Array)     nbtrait-1 = longeur du tableau U
				U[i]:= t[i+1]-t[i];         // Calculer la difference entre t[i+1] et t[i] et la mettre dans U[i]

			for i:= 1 to NbTrait-1 Do    // Rechercher dans U le nombre de répétitions successives puis parcourrir le même nombre dans le tableau T (en utilisant une formule i-k to i+1) 
			Begin
				 if U[i] = U[i+1] Then
							k:=k+1
				Else if k <> 0 then
				Begin
					for j:= i-k to i+1 Do
					Begin	
						 str(t[j],aux);
						 ch:= ch+aux+',';
					end;
						Delete(ch,Length(ch),1);
						writeln(ch, ' est une suite arithmetique de raison r = ', U[i]);
						ch:='';
						k:=0;
				end;
			end;
		close(f);
	end;
Begin
	assign(f,'Fnombres.txt');
	Remplir(M,L,C);
	SommeSy(M,L,C,F);
	AfficheSuite(F,(C div 2*L));
end.
