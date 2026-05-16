with Ada.Text_IO; use Ada.Text_IO;

procedure Ada is
   type Int_Array is array (Integer range <>) of Integer;

   Min_Run : constant Integer := 32;

   procedure Insertion_Sort (Arr : in out Int_Array; Left, Right : Integer) is
      Key, J : Integer;
   begin
      for I in Left + 1 .. Right loop
         Key := Arr (I);
         J := I - 1;
         while J >= Left and then Arr (J) > Key loop
            Arr (J + 1) := Arr (J);
            J := J - 1;
         end loop;
         Arr (J + 1) := Key;
      end loop;
   end Insertion_Sort;

   procedure Merge (Arr : in out Int_Array; Left, Mid, Right : Integer) is
      LN : constant Integer := Mid - Left + 1;
      RN : constant Integer := Right - Mid;
      LP : Int_Array (0 .. LN - 1);
      RP : Int_Array (0 .. RN - 1);
      I, J, K : Integer;
   begin
      for X in 0 .. LN - 1 loop LP (X) := Arr (Left + X); end loop;
      for X in 0 .. RN - 1 loop RP (X) := Arr (Mid + 1 + X); end loop;
      I := 0; J := 0; K := Left;
      while I < LN and J < RN loop
         if LP (I) <= RP (J) then Arr (K) := LP (I); I := I + 1;
         else Arr (K) := RP (J); J := J + 1; end if;
         K := K + 1;
      end loop;
      while I < LN loop Arr (K) := LP (I); I := I + 1; K := K + 1; end loop;
      while J < RN loop Arr (K) := RP (J); J := J + 1; K := K + 1; end loop;
   end Merge;

   procedure Timsort (Arr : in out Int_Array) is
      N    : constant Integer := Arr'Length;
      Base : constant Integer := Arr'First;
      I, Size, Left, Mid, Right : Integer;
   begin
      I := 0;
      while I < N loop
         Insertion_Sort (Arr, Base + I, Base + Integer'Min (I + Min_Run - 1, N - 1));
         I := I + Min_Run;
      end loop;
      Size := Min_Run;
      while Size < N loop
         Left := 0;
         while Left < N loop
            Mid := Integer'Min (Left + Size - 1, N - 1);
            Right := Integer'Min (Left + 2 * Size - 1, N - 1);
            if Mid < Right then Merge (Arr, Base + Left, Base + Mid, Base + Right); end if;
            Left := Left + 2 * Size;
         end loop;
         Size := Size * 2;
      end loop;
   end Timsort;

   Data : Int_Array := (5, 2, 8, 1, 9, 3, 7, 4, 6);
begin
   Timsort (Data);
   for X of Data loop Put (Integer'Image (X) & " "); end loop;
   New_Line;
end Ada;
