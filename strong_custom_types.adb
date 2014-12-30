procedure Main is 
	type Distance is new Float;
	type Area is new Float;
	D1:Distance:=2.0;
	D2:Distance:=3.0;
	A:Area;
begin
	D1:=D1+D2;
	-- OK
	D1:=D1+A;
	-- NOT OK: incompatible types for "+" operator
	A:=D1*D2;
	-- NOT OK: incompatible types for ":=" assignment
	A:=Area(D1*D2);-- OK
end Main;