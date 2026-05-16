procedure Cocktail_Sort is
   type Int_Array is array (Integer range <>) of Integer;

   procedure Sort (Arr : in out Int_Array) is
      Swapped : Boolean;
      Start   : Integer := Arr'First;
      Finish  : Integer := Arr'Last;
      Temp    : Integer;
   begin
      loop
         Swapped := False;
         for I in Start .. Finish - 1 loop
            if Arr (I) > Arr (I + 1) then
               Temp := Arr (I);
               Arr (I) := Arr (I + 1);
               Arr (I + 1) := Temp;
               Swapped := True;
            end if;
         end loop;
         exit when not Swapped;
         Swapped := False;
         Finish := Finish - 1;
         for I in reverse Start .. Finish - 1 loop
            if Arr (I) > Arr (I + 1) then
               Temp := Arr (I);
               Arr (I) := Arr (I + 1);
               Arr (I + 1) := Temp;
               Swapped := True;
            end if;
         end loop;
         Start := Start + 1;
         exit when not Swapped;
      end loop;
   end Sort;

begin
   null;
end Cocktail_Sort;
