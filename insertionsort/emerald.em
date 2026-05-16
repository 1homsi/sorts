object InsertionSort
    export operation sort[arr: Array.of[Integer], n: Integer]
        var key, j: Integer
        for i: Integer := 1 to n-1 do
            key := arr.at[i]
            j := i - 1
            loop
                exit when j < 0 or arr.at[j] <= key
                arr.setAt[j+1, arr.at[j]]
                j := j - 1
            end loop
            arr.setAt[j+1, key]
        end for
    end sort
end InsertionSort
