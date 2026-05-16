with Ada.Text_IO; use Ada.Text_IO;

procedure Ada is
   type Int_Array is array (Natural range <>) of Integer;

   procedure Bubble_Sort (Arr : in out Int_Array) is
      Tmp     : Integer;
      Swapped : Boolean;
      N       : Natural := Arr'Length;
   begin
      loop
         Swapped := False;
         for I in Arr'First .. Arr'First + N - 2 loop
            if Arr (I) > Arr (I + 1) then
               Tmp := Arr (I);
               Arr (I) := Arr (I + 1);
               Arr (I + 1) := Tmp;
               Swapped := True;
            end if;
         end loop;
         N := N - 1;
         exit when not Swapped;
      end loop;
   end Bubble_Sort;

   Data : Int_Array := (64, 34, 25, 12, 22, 11, 90);
begin
   Bubble_Sort (Data);
   for I in Data'Range loop
      Put (Integer'Image (Data (I)));
   end loop;
   New_Line;
end Ada;
