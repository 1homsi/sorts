with Ada.Text_IO; use Ada.Text_IO;

procedure Counting_Sort is
   type Int_Array is array (Natural range <>) of Integer;

   procedure Sort (Arr : in out Int_Array) is
      Min, Max, Range_Val : Integer;
      Count : Int_Array (0 .. 1000) := (others => 0);
      Output : Int_Array (Arr'Range);
   begin
      if Arr'Length = 0 then return; end if;
      Min := Arr (Arr'First); Max := Arr (Arr'First);
      for I in Arr'Range loop
         if Arr (I) < Min then Min := Arr (I); end if;
         if Arr (I) > Max then Max := Arr (I); end if;
      end loop;
      Range_Val := Max - Min;
      for I in Arr'Range loop Count (Arr (I) - Min) := Count (Arr (I) - Min) + 1; end loop;
      for I in 1 .. Range_Val loop Count (I) := Count (I) + Count (I - 1); end loop;
      for I in reverse Arr'Range loop
         Count (Arr (I) - Min) := Count (Arr (I) - Min) - 1;
         Output (Arr'First + Count (Arr (I) - Min)) := Arr (I);
      end loop;
      Arr := Output;
   end Sort;

   Data : Int_Array := (4, 2, 2, 8, 3, 3, 1);
begin
   Sort (Data);
   for V of Data loop Put (Integer'Image (V)); end loop;
   New_Line;
end Counting_Sort;
