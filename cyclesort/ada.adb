with Ada.Text_IO; use Ada.Text_IO;

procedure Ada is
   type Int_Array is array (Natural range <>) of Integer;

   procedure Cycle_Sort (Arr : in out Int_Array) is
      N     : constant Natural := Arr'Length;
      Item  : Integer;
      Pos   : Natural;
      Tmp   : Integer;
   begin
      for Cycle_Start in Arr'First .. Arr'Last - 1 loop
         Item := Arr (Cycle_Start);
         Pos  := Cycle_Start;
         for I in Cycle_Start + 1 .. Arr'Last loop
            if Arr (I) < Item then
               Pos := Pos + 1;
            end if;
         end loop;
         if Pos = Cycle_Start then
            goto Continue;
         end if;
         while Item = Arr (Pos) loop
            Pos := Pos + 1;
         end loop;
         Tmp      := Arr (Pos);
         Arr (Pos) := Item;
         Item     := Tmp;
         while Pos /= Cycle_Start loop
            Pos := Cycle_Start;
            for I in Cycle_Start + 1 .. Arr'Last loop
               if Arr (I) < Item then
                  Pos := Pos + 1;
               end if;
            end loop;
            while Item = Arr (Pos) loop
               Pos := Pos + 1;
            end loop;
            Tmp      := Arr (Pos);
            Arr (Pos) := Item;
            Item     := Tmp;
         end loop;
         <<Continue>>
      end loop;
   end Cycle_Sort;

   Arr : Int_Array := (5, 4, 3, 2, 1);
begin
   Cycle_Sort (Arr);
   for X of Arr loop
      Put (Integer'Image (X) & " ");
   end loop;
   New_Line;
end Ada;
