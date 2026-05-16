procedure Bogosort(Arr : in out Integer_Array) is
begin
    while not Is_Sorted(Arr) loop
        Shuffle(Arr);
    end loop;
end Bogosort;
