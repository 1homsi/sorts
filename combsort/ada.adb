with Ada.Text_IO; use Ada.Text_IO;

procedure Comb_Sort is
   type Int_Array is array (Natural range <>) of Integer;

   procedure Sort (Arr : in out Int_Array) is
      N      : constant Natural := Arr'Length;
      Gap    : Natural := N;
      Sorted : Boolean := False;
      Tmp    : Integer;
   begin
      while not Sorted loop
         Gap := Natural (Float (Gap) / 1.3);
         if Gap < 1 then
            Gap := 1;
            Sorted := True;
         end if;
         for I in Arr'First .. Arr'Last - Gap loop
            if Arr (I) > Arr (I + Gap) then
               Tmp := Arr (I);
               Arr (I) := Arr (I + Gap);
               Arr (I + Gap) := Tmp;
               Sorted := False;
            end if;
         end loop;
      end loop;
   end Sort;

begin
   null;
end Comb_Sort;
