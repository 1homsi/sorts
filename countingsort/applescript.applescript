on countingSort(arr)
    set n to length of arr
    if n = 0 then return arr
    set minVal to item 1 of arr
    set maxVal to item 1 of arr
    repeat with v in arr
        if v < minVal then set minVal to v
        if v > maxVal then set maxVal to v
    end repeat
    set rng to maxVal - minVal + 1
    set count to {}
    repeat rng times
        set end of count to 0
    end repeat
    repeat with v in arr
        set idx to (v as integer) - minVal + 1
        set item idx of count to (item idx of count) + 1
    end repeat
    repeat with i from 2 to rng
        set item i of count to (item i of count) + (item (i - 1) of count)
    end repeat
    set output to {}
    repeat n times
        set end of output to 0
    end repeat
    repeat with i from n to 1 by -1
        set v to item i of arr
        set idx to v - minVal + 1
        set pos to item idx of count
        set item idx of count to pos - 1
        set item pos of output to v
    end repeat
    return output
end countingSort

set result to countingSort({4, 2, 2, 8, 3, 3, 1})
return result
