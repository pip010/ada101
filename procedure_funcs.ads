-- procedure has  no return and qualifie accessors for args
procedure Proc
(Var1 : Integer;
Var2 : out Integer;
Var3 : in out Integer);

-- functions always returns
function Func (Var : Integer) return Integer;
