procedure Main is 
	type Grade is range 0..100;
	G1, G2 : Grade;
	N : Integer;

	for Day use
		(Monday => 10,
		Tuesday=>11,
		Wednesday=>12,
		Thursday=>13,
		Friday=>14,
		Saturday=>15,
		Sunday=>16);

	-- Contract based programming
	subtype Business_Day is Day range Monday..Friday; -- These declarations don’t create new types, just new names for constrained ranges of their base types.
	subtype Weekend_Day is Day range Saturday..Sunday; -- These declarations don’t create new types, just new names for constrained ranges of their base types.
	--subtype Dice_Throw is Integer range 1..6; -- These declarations don’t create new types, just new names for constrained ranges of their base types.

	-- Aspect oriented programming
	subtype Dice_Throw is Integer with Dynamic_Predicate => Dice_Throw in 1..6; --The predicate is checked on assignment, parameter passing, and in several other context

	type Not_Null is new Integer with Dynamic_Predicate => Not_Null /= 0; -- They can be used to represent types with arbitrary constraints, in particular types with discontinuities
	type Even is new Integer with Dynamic_Predicate => Even mod 2 = 0; -- They can be used to represent types with arbitrary constraints, in particular types with discontinuities

begin
	... -- Initialization of N
	G1:=80; -- OK
	G1:=N; -- Illegal (type mismatch)
	G1:=Grade(N); -- Legal, run-time range check
	G2:=G1+10; -- Legal, run-time range check
	G1:=(G1+G2)/2; -- Legal, run-time range check; (G1+G2) might still overflow and it is OK !

end Main
