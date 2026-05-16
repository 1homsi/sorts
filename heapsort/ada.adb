with Ada.Text_IO; use Ada.Text_IO;

procedure ada is
   type Int_Array is array (Natural range <>) of Integer;

   procedure Heapify (Arr : in out Int_Array; N, I : Natural) is
      Largest : Natural := I;
      Left    : Natural := 2 * I + 1;
      Right   : Natural := 2 * I + 2;
      Tmp     : Integer;
   begin
      if Left < N and then Arr (Left) > Arr (Largest) then Largest := Left; end if;
      if Right < N and then Arr (Right) > Arr (Largest) then Largest := Right; end if;
      if Largest /= I then
         Tmp := Arr (I); Arr (I) := Arr (Largest); Arr (Largest) := Tmp;
         Heapify (Arr, N, Largest);
      end if;
   end Heapify;

   procedure Heapsort (Arr : in out Int_Array) is
      N   : Natural := Arr'Length;
      Tmp : Integer;
   begin
      for I in reverse 0 .. N / 2 - 1 loop Heapify (Arr, N, I); end loop;
      for I in reverse 1 .. N - 1 loop
         Tmp := Arr (0); Arr (0) := Arr (I); Arr (I) := Tmp;
         Heapify (Arr, I, 0);
      end loop;
   end Heapsort;

   Data : Int_Array := (12, 11, 13, 5, 6, 7);
begin
   Heapsort (Data);
   for X of Data loop Put (Integer'Image (X)); end loop;
   New_Line;
end ada;
