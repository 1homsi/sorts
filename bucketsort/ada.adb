with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Ada is
   type Float_Array is array (Integer range <>) of Float;
   type Bucket_Array is array (Integer range <>) of Integer;

   procedure Insertion_Sort (A : in out Float_Array) is
      Key : Float;
      J : Integer;
   begin
      for I in A'First + 1 .. A'Last loop
         Key := A (I);
         J := I - 1;
         while J >= A'First and then A (J) > Key loop
            A (J + 1) := A (J);
            J := J - 1;
         end loop;
         A (J + 1) := Key;
      end loop;
   end Insertion_Sort;

   procedure Bucket_Sort (A : in out Float_Array) is
      N : Integer := A'Length;
      Min_V, Max_V : Float;
      Idx : Integer;
      type Bucket_T is array (1 .. N) of Float;
      type All_Buckets is array (0 .. N - 1) of Bucket_T;
      Buckets : All_Buckets := (others => (others => 0.0));
      Counts : array (0 .. N - 1) of Integer := (others => 0);
      Pos : Integer := A'First;
   begin
      Min_V := A (A'First);
      Max_V := A (A'First);
      for I in A'Range loop
         if A (I) < Min_V then Min_V := A (I); end if;
         if A (I) > Max_V then Max_V := A (I); end if;
      end loop;
      for I in A'Range loop
         Idx := Integer (Float'Floor ((A (I) - Min_V) / (Max_V - Min_V + 1.0) * Float (N)));
         if Idx >= N then Idx := N - 1; end if;
         Counts (Idx) := Counts (Idx) + 1;
         Buckets (Idx)(Counts (Idx)) := A (I);
      end loop;
      for B in 0 .. N - 1 loop
         declare
            Slice : Float_Array := Buckets (B)(1 .. Counts (B));
         begin
            Insertion_Sort (Slice);
            for K in Slice'Range loop
               A (Pos) := Slice (K);
               Pos := Pos + 1;
            end loop;
         end;
      end loop;
   end Bucket_Sort;

   Data : Float_Array := (0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68);
begin
   Bucket_Sort (Data);
   for V of Data loop
      Put (V, Fore => 1, Aft => 2, Exp => 0);
      Put (" ");
   end loop;
   New_Line;
end Ada;
