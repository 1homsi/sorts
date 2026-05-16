with Ada.Text_IO; use Ada.Text_IO;

procedure Ada is
   type Int_Array is array (Natural range <>) of Integer;

   procedure Shell_Sort (Arr : in out Int_Array) is
      N    : Natural := Arr'Length;
      Gap  : Natural := N / 2;
      Temp : Integer;
      J    : Natural;
   begin
      while Gap > 0 loop
         for I in Arr'First + Gap .. Arr'Last loop
            Temp := Arr (I);
            J := I;
            while J >= Arr'First + Gap and then Arr (J - Gap) > Temp loop
               Arr (J) := Arr (J - Gap);
               J := J - Gap;
            end loop;
            Arr (J) := Temp;
         end loop;
         Gap := Gap / 2;
      end loop;
   end Shell_Sort;

   Data : Int_Array := (64, 34, 25, 12, 22, 11, 90);
begin
   Shell_Sort (Data);
   for I in Data'Range loop
      Put (Integer'Image (Data (I)));
   end loop;
   New_Line;
end Ada;
