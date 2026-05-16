with Ada.Text_IO; use Ada.Text_IO;

procedure ada is
    type Int_Array is array (Integer range <>) of Integer;
    Arr : Int_Array := (3, 1, 4, 1, 5, 9, 2, 6);

    procedure Stooge_Sort (A : in out Int_Array; First, Last : Integer) is
        Tmp : Integer;
        T : Integer;
    begin
        if A (First) > A (Last) then
            Tmp := A (First);
            A (First) := A (Last);
            A (Last) := Tmp;
        end if;
        if Last - First + 1 > 2 then
            T := (Last - First + 1) * 2 / 3;
            Stooge_Sort (A, First, First + T - 1);
            Stooge_Sort (A, Last - T + 1, Last);
            Stooge_Sort (A, First, First + T - 1);
        end if;
    end Stooge_Sort;

begin
    Stooge_Sort (Arr, Arr'First, Arr'Last);
    for I in Arr'Range loop
        Put (Integer'Image (Arr (I)) & " ");
    end loop;
    New_Line;
end ada;
