with Ada.Text_IO; use Ada.Text_IO;

procedure Ada is
   type Int_Array is array (Natural range <>) of Integer;

   procedure Compare_And_Swap (Arr : in out Int_Array; I, J : Natural; Direction : Boolean) is
      Tmp : Integer;
   begin
      if Direction = (Arr(I) > Arr(J)) then
         Tmp := Arr(I); Arr(I) := Arr(J); Arr(J) := Tmp;
      end if;
   end Compare_And_Swap;

   procedure Bitonic_Merge (Arr : in out Int_Array; Lo, Cnt : Natural; Direction : Boolean) is
      K : Natural;
   begin
      if Cnt > 1 then
         K := Cnt / 2;
         for I in Lo .. Lo + K - 1 loop
            Compare_And_Swap(Arr, I, I + K, Direction);
         end loop;
         Bitonic_Merge(Arr, Lo, K, Direction);
         Bitonic_Merge(Arr, Lo + K, K, Direction);
      end if;
   end Bitonic_Merge;

   procedure Bitonic_Sort (Arr : in out Int_Array; Lo, Cnt : Natural; Direction : Boolean) is
      K : Natural;
   begin
      if Cnt > 1 then
         K := Cnt / 2;
         Bitonic_Sort(Arr, Lo, K, True);
         Bitonic_Sort(Arr, Lo + K, K, False);
         Bitonic_Merge(Arr, Lo, Cnt, Direction);
      end if;
   end Bitonic_Sort;

   Data : Int_Array := (3, 7, 4, 8, 6, 2, 1, 5);
begin
   Bitonic_Sort(Data, 0, Data'Length, True);
   for X of Data loop
      Put(Integer'Image(X) & " ");
   end loop;
   New_Line;
end Ada;
