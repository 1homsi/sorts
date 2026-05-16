with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Discrete_Random;

procedure Ada is
   type Int_Array is array (Positive range <>) of Integer;
   type Index_Range is range 1 .. 100;
   package Rand is new Ada.Numerics.Discrete_Random (Index_Range);
   Gen : Rand.Generator;

   function Is_Sorted (Arr : Int_Array) return Boolean is
   begin
      for I in Arr'First .. Arr'Last - 1 loop
         if Arr (I) > Arr (I + 1) then
            return False;
         end if;
      end loop;
      return True;
   end Is_Sorted;

   procedure Shuffle (Arr : in out Int_Array) is
      J : Positive;
      Tmp : Integer;
   begin
      for I in reverse Arr'First + 1 .. Arr'Last loop
         J := Positive (Rand.Random (Gen)) mod I + 1;
         Tmp := Arr (I);
         Arr (I) := Arr (J);
         Arr (J) := Tmp;
      end loop;
   end Shuffle;

   procedure Bogosort (Arr : in out Int_Array) is
   begin
      while not Is_Sorted (Arr) loop
         Shuffle (Arr);
      end loop;
   end Bogosort;

   Arr : Int_Array := (3, 1, 4, 1, 5, 9, 2, 6);
begin
   Rand.Reset (Gen);
   Bogosort (Arr);
   for V of Arr loop
      Put (Integer'Image (V) & " ");
   end loop;
   New_Line;
end Ada;
