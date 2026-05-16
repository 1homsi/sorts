on stoogeSort(arr, first, last)
    if item first of arr > item last of arr then
        set tmp to item first of arr
        set item first of arr to item last of arr
        set item last of arr to tmp
    end if
    set n to last - first + 1
    if n > 2 then
        set t to (n * 2) div 3
        stoogeSort(arr, first, first + t - 1)
        stoogeSort(arr, last - t + 1, last)
        stoogeSort(arr, first, first + t - 1)
    end if
    return arr
end stoogeSort

set arr to {3, 1, 4, 1, 5, 9, 2, 6}
set arr to stoogeSort(arr, 1, count of arr)
return arr
