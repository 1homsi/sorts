const MergeSort == object mergesort
    export operation sort[arr: ImmutableArray.of[Integer]] -> [result: ImmutableArray.of[Integer]]
        if arr.size <= 1 then result := arr
        else
            const mid == arr.size / 2
            const left == sort[arr.slice[0, mid]]
            const right == sort[arr.slice[mid, arr.size]]
            result := merge[left, right]
        end if
    end operation

    operation merge[left, right: ImmutableArray.of[Integer]] -> [result: ImmutableArray.of[Integer]]
        var res: Array.of[Integer] == Array.of[Integer].create[left.size + right.size]
        var i: Integer == 0
        var j: Integer == 0
        var k: Integer == 0
        loop
            exit when i >= left.size || j >= right.size
            if left[i] <= right[j] then
                res[k] := left[i]; i := i + 1
            else
                res[k] := right[j]; j := j + 1
            end if
            k := k + 1
        end loop
        loop exit when i >= left.size; res[k] := left[i]; i := i+1; k := k+1 end loop
        loop exit when j >= right.size; res[k] := right[j]; j := j+1; k := k+1 end loop
        result := res.immutable
    end operation
end MergeSort
