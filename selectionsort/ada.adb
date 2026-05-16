procedure Selection_Sort is
   type Int_Array is array (Integer range <>) of Integer;
   procedure Sort (A : in out Int_Array) is
      Min_Idx : Integer;
      Tmp     : Integer;
   begin
      for I in A'First .. A'Last - 1 loop
         Min_Idx := I;
         for J in I + 1 .. A'Last loop
            if A (J) < A (Min_Idx) then
               Min_Idx := J;
            end if;
         end loop;
         Tmp := A (I);
         A (I) := A (Min_Idx);
         A (Min_Idx) := Tmp;
      end loop;
   end Sort;
begin
   null;
end Selection_Sort;
