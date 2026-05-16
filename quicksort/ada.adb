with Ada.Text_IO; use Ada.Text_IO;

procedure ada is
   type Int_Array is array (Integer range <>) of Integer;

   procedure Quicksort (Arr : in out Int_Array; Low, High : Integer) is
      Pivot : Integer;
      I, J  : Integer;
      Tmp   : Integer;
   begin
      if Low < High then
         Pivot := Arr(High);
         I := Low;
         for Jj in Low .. High - 1 loop
            if Arr(Jj) <= Pivot then
               Tmp := Arr(I); Arr(I) := Arr(Jj); Arr(Jj) := Tmp;
               I := I + 1;
            end if;
         end loop;
         Tmp := Arr(I); Arr(I) := Arr(High); Arr(High) := Tmp;
         Quicksort(Arr, Low, I - 1);
         Quicksort(Arr, I + 1, High);
      end if;
   end Quicksort;

   Data : Int_Array := (3, 6, 8, 10, 1, 2, 1);
begin
   Quicksort(Data, Data'First, Data'Last);
   for V of Data loop
      Put(Integer'Image(V));
   end loop;
   New_Line;
end ada;
