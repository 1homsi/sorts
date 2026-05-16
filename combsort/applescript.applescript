on combSort(arr)
    set n to count of arr
    set gap to n
    set sorted to false
    repeat until sorted
        set gap to (gap / 1.3) div 1
        if gap < 1 then set gap to 1
        if gap = 1 then set sorted to true
        repeat with i from 1 to n - gap
            if item i of arr > item (i + gap) of arr then
                set tmp to item i of arr
                set item i of arr to item (i + gap) of arr
                set item (i + gap) of arr to tmp
                set sorted to false
            end if
        end repeat
    end repeat
    return arr
end combSort
