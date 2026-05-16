on shellSort(arr)
    set n to count of arr
    set gap to n div 2
    repeat while gap > 0
        repeat with i from gap + 1 to n
            set temp to item i of arr
            set j to i
            repeat while j > gap and item (j - gap) of arr > temp
                set item j of arr to item (j - gap) of arr
                set j to j - gap
            end repeat
            set item j of arr to temp
        end repeat
        set gap to gap div 2
    end repeat
    return arr
end shellSort

set arr to {64, 34, 25, 12, 22, 11, 90}
set sorted to shellSort(arr)
log sorted
