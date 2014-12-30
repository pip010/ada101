--To deallocate objects from the heap in Ada, it is necessary to use a deallocation subprogram that accepts a
--specific access type. A generic procedure is provided that can be customized to fit your needs—it’s called
--Ada.Unchecked_Deallocation. To create your customized deallocator (that is, to instantiate this generic), you must
--provide the object type as well as the access type as follows:

with Ada.Unchecked_Deallocation;
procedure Main 
is
	type Integer_Access is access all Integer;
	procedure Free is new Ada.Unchecked_Deallocation (Integer, Integer_Access);
	My_Pointer : Integer_Access := new Integer;

	--When using Ada pointers to reference objects on the stack, the referenced objects must be declared as being aliased.
	Var : aliased Integer;             		       -- int Var; (c++)
	VarPtr : Integer_Access := Var'Access;		   -- int * Ptr = &Var; (c++)

begin
	Free (My_Pointer);
end Main;
