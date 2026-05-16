on selectionSort(arr)
    set n to count of arr
    repeat with i from 1 to n - 1
        set minIdx to i
        repeat with j from i + 1 to n
            if item j of arr < item minIdx of arr then
                set minIdx to j
            end if
        end repeat
        set tmp to item i of arr
        set item i of arr to item minIdx of arr
        set item minIdx of arr to tmp
    end repeat
    return arr
end selectionSort
