on compareAndSwap(arr, i, j, direction)
    set ai to item i of arr
    set aj to item j of arr
    if direction = (ai > aj) then
        set item i of arr to aj
        set item j of arr to ai
    end if
    return arr
end compareAndSwap

on bitonicMerge(arr, lo, cnt, direction)
    if cnt > 1 then
        set k to cnt div 2
        repeat with idx from lo to lo + k - 1
            set arr to compareAndSwap(arr, idx, idx + k, direction)
        end repeat
        set arr to bitonicMerge(arr, lo, k, direction)
        set arr to bitonicMerge(arr, lo + k, k, direction)
    end if
    return arr
end bitonicMerge

on bitonicSort(arr, lo, cnt, direction)
    if cnt > 1 then
        set k to cnt div 2
        set arr to bitonicSort(arr, lo, k, true)
        set arr to bitonicSort(arr, lo + k, k, false)
        set arr to bitonicMerge(arr, lo, cnt, direction)
    end if
    return arr
end bitonicSort

set data to {3, 7, 4, 8, 6, 2, 1, 5}
set result to bitonicSort(data, 1, count of data, true)
return result
