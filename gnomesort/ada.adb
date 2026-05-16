procedure Gnome_Sort is
   type Int_Array is array (Natural range <>) of Integer;

   procedure Sort (Arr : in out Int_Array) is
      I    : Natural := Arr'First;
      Temp : Integer;
   begin
      while I <= Arr'Last loop
         if I = Arr'First or else Arr (I) >= Arr (I - 1) then
            I := I + 1;
         else
            Temp := Arr (I);
            Arr (I) := Arr (I - 1);
            Arr (I - 1) := Temp;
            I := I - 1;
         end if;
      end loop;
   end Sort;
begin
   null;
end Gnome_Sort;
