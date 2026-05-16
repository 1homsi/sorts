on countingSort(arr, exp)
    set n to count of arr
    set output to {}
    repeat n times
        set end of output to 0
    end repeat
    set cnt to {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
    repeat with i from 1 to n
        set x to item i of arr
        set idx to ((x div exp) mod 10) + 1
        set item idx of cnt to (item idx of cnt) + 1
    end repeat
    repeat with i from 2 to 10
        set item i of cnt to (item i of cnt) + (item (i - 1) of cnt)
    end repeat
    repeat with i from n to 1 by -1
        set x to item i of arr
        set idx to ((x div exp) mod 10) + 1
        set pos to item idx of cnt
        set item pos of output to x
        set item idx of cnt to pos - 1
    end repeat
    return output
end countingSort

on radixSort(arr)
    if (count of arr) is 0 then return arr
    set maxVal to item 1 of arr
    repeat with x in arr
        if x > maxVal then set maxVal to x
    end repeat
    set exp to 1
    repeat while (maxVal div exp) > 0
        set arr to countingSort(arr, exp)
        set exp to exp * 10
    end repeat
    return arr
end radixSort

set arr to {170, 45, 75, 90, 802, 24, 2, 66}
set result to radixSort(arr)
log result
