--
-- Ada program to declare and modify Integers
--

with Ada.Text_IO; use Ada.Text_IO;

procedure Main 
is

	-- Variable declarations
	Variable: Integer := 0;
	A, B : Integer := 0;
	C : Integer := 100;
	D : Integer;

begin
	-- Ada uses a regular assignment statement for incrementation.
	A:=A+1;

	-- Regular addition
	D:=A+B+C;

	--A:=B:=C; doesn’t make sense to an Ada compiler

		-- Demonstrate inner scope
		declare
			Alpha:Integer := 666;
		
		begin
			A:=Alpha+1;
			--Put_Line("Now inside the inner block");
		end

	Variable := A;	

	-- short circut if-else
	if Variable > 0	then
		Put_Line(" > 0 ");
	elsif Variable < 0 then
		Put_Line(" < 0 ");
	else
		Put_Line(" = 0 ");
	end if;

	-- switch statement
	-- break is implicit, no fallbacks. range 1..9 for multi Integer cases;
	case Variable is
		when 0 => 
			Put_Line("Zero");
		when 1..9 => 
			Put_Line("Positive Digit");
		when 10|12|14|16|18 => 
			Put_Line("Even Number between 10 and 18");
		when others => 
			Put_Line("Something else");
	end case;

	-- loops
	while Variable<10_000 loop
		Variable:=Variable*2;
	end loop;

	-- Outputs 0, 1, 2, ..., 9
	for Variable in 0..9 loop
		Put_Line(Integer’Image(Variable));
	end loop;

	-- Outputs 9, 8, 7, ..., 0
	for Variable in reverse 0..9 loop 
		Put_Line(Integer’Image(Variable));
	end loop;

	--for I of Int_List loop
	--	Put_Line(Integer’Image(I));
	--end loop;

	declare
		Alpha:Integer:=1;
		Beta:Integer:=10;
		Result:Float;
		--Flag:Boolean:=true;
		--C:Char:='c';
	begin
		Result:=Float(Alpha)/Float(Beta);
		-- Perform an Integer division then convert to Float, 10 is not Valid Float
		-- Result := Float(Alpha/Beta/10.0);
	end Strong_Typing;

	-- string and arrays
	declare
		type Arr_Type is array (Integer range <>) of Character;
		Arr : Arr_Type (1..26);
		C : Character := ’a’;
		My_String : String := “This is a line with a end of line” & ASCII.LF; -- CAUTION no escape char, use ACII table instead and concat
	begin
		for I in Arr’Range loop
			Arr (I) := C;
			C := Character’Succ (C);
		end loop;
	end;

	-- arrays are not references and are memberwise copied
	declare
		type Arr_Type is array (Integer range <>) of Integer
		A1 : Arr_Type (1 .. 2);
		A2 : Arr_Type (1 .. 2);
	begin
		A1 (1) = 0;
		A1 (2) = 1;
		A2 := A1;
	end;

	-- array slice and splice
	declare
		type Arr_Type is array (Integer range <>) of Integer
		A1 : Arr_Type (1 .. 10);
		A2 : Arr_Type (1 .. 5);
	begin
		A2 (1 .. 3) := A1 (4 .. 6);
	end;

	-- array high level comparison operator, memberwise again!
	declare
		type Arr_Type is array (Integer range <>) of Integer;
		A1 : Arr_Type (1 .. 2);
		A2 : Arr_Type (1 .. 2);
	begin
		if A1 = A2 then
			Put_Line("I love high level programming in ADA12");
		end
	end

	-- array assignments are determined by LHS, RHS or Both
	declare
		type Arr_Type is array (Integer range <>) of Integer;
		A1 : Arr_Type := (1, 2, 3, 4, 5, 6, 7, 8, 9);
		A2 : Arr_Type (-2 .. 42) := (others => 0);
	begin
		A1 := (1, 2, 3, others => 10);
		-- use a slice to assign A2 elements 11 .. 19 to 1
		A2 (11 .. 19) := (others => 1);
	end;

	-- Heterogenious data types ( i.e. struct in C++)
	declare
		type R is record
			A, B : Integer;
			C	: Float;
		end record;
		V : R;
	begin
		V.A := 0;
		-- initialization lists
		V1 : R => (1, 2, 1.0);
		V2 : R => (A => 1, B => 2, C => 1.0);
		V3 : R => (C => 1.0, A => 1, B => 2);
		V4 : R => (C => 1.0, others => <>);
	end;

	-- Pointers in ADA12, like in C++ objects are allocated on the STACK
	declare
		type R is record
			A, B : Integer;
		end record;

		type R_Access is access R;
		V1 : R_Access;
		V2 : R_Access;

		type A_Int is access Integer;
		Var : A_Int := new Integer;
		--Var : A_Int := new Integer’(0); -- with init


	begin
		V1 := new R;
		V1.A := 0;
		V2 := V1;
		V2.A := 1;

		Var.all := 0; --like in c++ we need explicit release of objects on the HEAP
	end;



end Main;