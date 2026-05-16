on insertionSort(arr)
    set n to count of arr
    repeat with i from 2 to n
        set key to item i of arr
        set j to i - 1
        repeat while j >= 1 and item j of arr > key
            set item (j + 1) of arr to item j of arr
            set j to j - 1
        end repeat
        set item (j + 1) of arr to key
    end repeat
    return arr
end insertionSort
