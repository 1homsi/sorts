on cocktailSort(arr)
    set n to count arr
    set swapped to true
    set startIdx to 1
    set endIdx to n
    repeat while swapped
        set swapped to false
        repeat with i from startIdx to endIdx - 1
            if item i of arr > item (i + 1) of arr then
                set tmp to item i of arr
                set item i of arr to item (i + 1) of arr
                set item (i + 1) of arr to tmp
                set swapped to true
            end if
        end repeat
        if not swapped then exit repeat
        set swapped to false
        set endIdx to endIdx - 1
        repeat with i from endIdx - 1 to startIdx by -1
            if item i of arr > item (i + 1) of arr then
                set tmp to item i of arr
                set item i of arr to item (i + 1) of arr
                set item (i + 1) of arr to tmp
                set swapped to true
            end if
        end repeat
        set startIdx to startIdx + 1
    end repeat
    return arr
end cocktailSort
