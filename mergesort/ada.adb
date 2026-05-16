-- Mergesort in Ada
with Ada.Text_IO; use Ada.Text_IO;

procedure Mergesort is
   type Int_Array is array (Positive range <>) of Integer;

   procedure Merge (A : in out Int_Array; L, M, R : Positive) is
      Left  : Int_Array := A (L .. M);
      Right : Int_Array := A (M + 1 .. R);
      I : Positive := Left'First;
      J : Positive := Right'First;
      K : Positive := L;
   begin
      while I <= Left'Last and J <= Right'Last loop
         if Left (I) <= Right (J) then
            A (K) := Left (I); I := I + 1;
         else
            A (K) := Right (J); J := J + 1;
         end if;
         K := K + 1;
      end loop;
      while I <= Left'Last loop
         A (K) := Left (I); I := I + 1; K := K + 1;
      end loop;
      while J <= Right'Last loop
         A (K) := Right (J); J := J + 1; K := K + 1;
      end loop;
   end Merge;

   procedure Sort (A : in out Int_Array; L, R : Positive) is
      M : Positive;
   begin
      if L < R then
         M := (L + R) / 2;
         Sort (A, L, M);
         Sort (A, M + 1, R);
         Merge (A, L, M, R);
      end if;
   end Sort;

   Data : Int_Array := (5, 2, 8, 1, 9, 3);
begin
   Sort (Data, Data'First, Data'Last);
   for X of Data loop
      Put (Integer'Image (X));
   end loop;
   New_Line;
end Mergesort;
