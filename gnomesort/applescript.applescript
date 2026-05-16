on gnomeSort(arr)
    set n to count of arr
    set i to 1
    repeat while i <= n
        if i = 1 or item i of arr >= item (i - 1) of arr then
            set i to i + 1
        else
            set tmp to item i of arr
            set item i of arr to item (i - 1) of arr
            set item (i - 1) of arr to tmp
            set i to i - 1
        end if
    end repeat
    return arr
end gnomeSort
