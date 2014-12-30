

with Ada.Text_IO; use Ada.Text_IO;

procedure Main
is
	function Divide (Left, Right : Float) return Float
	with 
		Pre => Right /= 0.0,
		Post => Divide’Result * Right < Left + 0.0001
			and then Divide’Result * Right > Left - 0.0001;
	is
	begin
		return Left / Right;
	end Divide;

	procedure Increment (V : in out Integer)
	with 
		Pre => V < Integer’Last,
		Post => V = V’Old + 1;
	is
	begin
		V = V + 1;
	end Increment;

	-- Variable declarations
	A, B, C : Integer := 1;
begin
	Proc(A,B,C);
	Put_Line("A is" & A'Img & " B is" & B'Img & " C is" & C'Img);
end Main;