function selectionSort
    input Real arr[:];
    output Real sorted[size(arr,1)];
protected
    Integer n = size(arr,1);
    Integer minIdx;
    Real tmp;
algorithm
    sorted := arr;
    for i in 1:n-1 loop
        minIdx := i;
        for j in i+1:n loop
            if sorted[j] < sorted[minIdx] then
                minIdx := j;
            end if;
        end for;
        tmp := sorted[i];
        sorted[i] := sorted[minIdx];
        sorted[minIdx] := tmp;
    end for;
end selectionSort;
