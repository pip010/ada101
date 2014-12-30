declare
	A : Integer := 99;
begin
	Put_Line (Integer’Image (A));
	A := Integer’Value ("99");
end;

declare
	C : Character := ’a’;
begin
	C := Character’Val (Character’Pos (C) + 1);
end;

-- like in i++
declare
	C : Character := ’a’;
begin
	Cplusplus := Character’Succ (C);
	Cminusminus := Character’Pred (C);
end;

