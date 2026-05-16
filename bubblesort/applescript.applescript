on bubbleSort(arr)
    set n to count of arr
    set swapped to true
    repeat while swapped
        set swapped to false
        repeat with i from 1 to n - 1
            if item i of arr > item (i + 1) of arr then
                set tmp to item i of arr
                set item i of arr to item (i + 1) of arr
                set item (i + 1) of arr to tmp
                set swapped to true
            end if
        end repeat
        set n to n - 1
    end repeat
    return arr
end bubbleSort

set arr to {64, 34, 25, 12, 22, 11, 90}
set sorted to bubbleSort(arr)
log sorted
