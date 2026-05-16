object gnomeSorter
    export operation sort [arr: Array.of[Integer], n: Integer]
        var i: Integer := 0
        var tmp: Integer
        loop
            exit when i >= n
            if i = 0 or arr.item[i] >= arr.item[i-1] then
                i := i + 1
            else
                tmp := arr.item[i]
                arr.set[i, arr.item[i-1]]
                arr.set[i-1, tmp]
                i := i - 1
            end if
        end loop
    end sort
end gnomeSorter
