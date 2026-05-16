with Ada.Text_IO; use Ada.Text_IO;

procedure Ada is
   type Int_Array is array (Integer range <>) of Integer;

   procedure Flip (Arr : in out Int_Array; K : Integer) is
      Left  : Integer := Arr'First;
      Right : Integer := Arr'First + K;
      Tmp   : Integer;
   begin
      while Left < Right loop
         Tmp := Arr (Left);
         Arr (Left) := Arr (Right);
         Arr (Right) := Tmp;
         Left := Left + 1;
         Right := Right - 1;
      end loop;
   end Flip;

   procedure Pancake_Sort (Arr : in out Int_Array) is
      Max_Idx : Integer;
      N : Integer := Arr'Length;
   begin
      for Size in reverse 2 .. N loop
         Max_Idx := Arr'First;
         for I in Arr'First + 1 .. Arr'First + Size - 1 loop
            if Arr (I) > Arr (Max_Idx) then
               Max_Idx := I;
            end if;
         end loop;
         if Max_Idx /= Arr'First + Size - 1 then
            if Max_Idx /= Arr'First then
               Flip (Arr, Max_Idx - Arr'First);
            end if;
            Flip (Arr, Size - 1);
         end if;
      end loop;
   end Pancake_Sort;

   Arr : Int_Array := (3, 6, 2, 7, 4, 1, 5);
begin
   Pancake_Sort (Arr);
   for V of Arr loop
      Put (Integer'Image (V) & " ");
   end loop;
   New_Line;
end Ada;
