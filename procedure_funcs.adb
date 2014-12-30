


with Ada.Text_IO; use Ada.Text_IO;

procedure Main
is
	function Func (Var : Integer) return Integer
	is
	begin
		return Var + 1;
	end Func;

	-- function overload, unlike c++ return type suficient for overload
	function GenValue (Str : String) return Integer
	is
	begin
		return 1;
	end GenValue;
	function GenValue (Str : String) return Float
	is
	begin
		return 1.1;
	end GenValue;

	procedure Proc
		(Var1 : Integer;
		Var2 : out Integer;
		Var3 : in out Integer)
	is
	begin
		Var2 := Func (Var1);
		Var3 := Var3 + 1 + GenValue("arg");
	end Proc;

	-- Variable declarations
	A, B, C : Integer := 1;
begin
	Proc(A,B,C);
	Put_Line("A is" & A'Img & " B is" & B'Img & " C is" & C'Img);
end Main;