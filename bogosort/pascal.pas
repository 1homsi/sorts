procedure Bogosort(var arr: array of integer);
begin
    while not IsSorted(arr) do
        Shuffle(arr);
end;
