on quicksort(theList, low, high)
    if low < high then
        set p to my partition(theList, low, high)
        my quicksort(theList, low, p - 1)
        my quicksort(theList, p + 1, high)
    end if
end quicksort

on partition(arr, low, high)
    set pivot to item high of arr
    set i to low
    repeat with j from low to high - 1
        if item j of arr <= pivot then
            set tmp to item i of arr
            set item i of arr to item j of arr
            set item j of arr to tmp
            set i to i + 1
        end if
    end repeat
    set tmp to item i of arr
    set item i of arr to item high of arr
    set item high of arr to tmp
    return i
end partition

set arr to {3, 6, 8, 10, 1, 2, 1}
quicksort(arr, 1, count of arr)
return arr
