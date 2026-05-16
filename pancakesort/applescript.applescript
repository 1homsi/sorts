on flip(arr, k)
    set left to 1
    set right to k + 1
    repeat while left < right
        set tmp to item left of arr
        set item left of arr to item right of arr
        set item right of arr to tmp
        set left to left + 1
        set right to right - 1
    end repeat
    return arr
end flip

on findMaxIdx(arr, sz)
    set maxIdx to 1
    repeat with i from 2 to sz
        if item i of arr > item maxIdx of arr then
            set maxIdx to i
        end if
    end repeat
    return maxIdx
end findMaxIdx

on pancakeSort(arr)
    set sz to count of arr
    repeat while sz > 1
        set maxIdx to my findMaxIdx(arr, sz)
        if maxIdx is not sz then
            if maxIdx is not 1 then
                set arr to my flip(arr, maxIdx - 1)
            end if
            set arr to my flip(arr, sz - 1)
        end if
        set sz to sz - 1
    end repeat
    return arr
end pancakeSort

set arr to {3, 6, 2, 7, 4, 1, 5}
set result to pancakeSort(arr)
return result
