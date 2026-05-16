with Ada.Text_IO; use Ada.Text_IO;

procedure Ada is
   type Int_Array is array (Natural range <>) of Integer;

   procedure Counting_Sort (Arr : in out Int_Array; Exp : Integer) is
      N      : constant Natural := Arr'Length;
      Output : Int_Array (0 .. N - 1) := (others => 0);
      Count  : array (0 .. 9) of Integer := (others => 0);
      Idx    : Integer;
   begin
      for I in Arr'Range loop
         Idx := (Arr (I) / Exp) mod 10;
         Count (Idx) := Count (Idx) + 1;
      end loop;
      for I in 1 .. 9 loop
         Count (I) := Count (I) + Count (I - 1);
      end loop;
      for I in reverse Arr'Range loop
         Idx := (Arr (I) / Exp) mod 10;
         Count (Idx) := Count (Idx) - 1;
         Output (Count (Idx)) := Arr (I);
      end loop;
      for I in 0 .. N - 1 loop
         Arr (Arr'First + I) := Output (I);
      end loop;
   end Counting_Sort;

   procedure Radix_Sort (Arr : in out Int_Array) is
      Max : Integer := Arr (Arr'First);
      Exp : Integer := 1;
   begin
      for I in Arr'Range loop
         if Arr (I) > Max then Max := Arr (I); end if;
      end loop;
      while Max / Exp > 0 loop
         Counting_Sort (Arr, Exp);
         Exp := Exp * 10;
      end loop;
   end Radix_Sort;

   Arr : Int_Array (0 .. 7) := (170, 45, 75, 90, 802, 24, 2, 66);
begin
   Radix_Sort (Arr);
   for I in Arr'Range loop
      Put (Integer'Image (Arr (I)));
   end loop;
   New_Line;
end Ada;
