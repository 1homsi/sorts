set minRun to 32

on insertionSort(arr, leftIdx, rightIdx)
    repeat with i from leftIdx + 1 to rightIdx
        set keyVal to item i of arr
        set j to i - 1
        repeat while j >= leftIdx and item j of arr > keyVal
            set item (j + 1) of arr to item j of arr
            set j to j - 1
        end repeat
        set item (j + 1) of arr to keyVal
    end repeat
    return arr
end insertionSort

on mergeRuns(arr, leftIdx, midIdx, rightIdx)
    set lp to {}
    set rp to {}
    repeat with i from leftIdx to midIdx
        set end of lp to item i of arr
    end repeat
    repeat with i from midIdx + 1 to rightIdx
        set end of rp to item i of arr
    end repeat
    set i to 1
    set j to 1
    set k to leftIdx
    repeat while i <= (count lp) and j <= (count rp)
        if item i of lp <= item j of rp then
            set item k of arr to item i of lp
            set i to i + 1
        else
            set item k of arr to item j of rp
            set j to j + 1
        end if
        set k to k + 1
    end repeat
    repeat while i <= (count lp)
        set item k of arr to item i of lp
        set i to i + 1
        set k to k + 1
    end repeat
    repeat while j <= (count rp)
        set item k of arr to item j of rp
        set j to j + 1
        set k to k + 1
    end repeat
    return arr
end mergeRuns

on timsort(arr)
    set n to count arr
    set i to 1
    repeat while i <= n
        set rightIdx to i + minRun - 1
        if rightIdx > n then set rightIdx to n
        set arr to my insertionSort(arr, i, rightIdx)
        set i to i + minRun
    end repeat
    set sz to minRun
    repeat while sz < n
        set leftIdx to 1
        repeat while leftIdx <= n
            set midIdx to leftIdx + sz - 1
            if midIdx > n then set midIdx to n
            set rightIdx to leftIdx + 2 * sz - 1
            if rightIdx > n then set rightIdx to n
            if midIdx < rightIdx then set arr to my mergeRuns(arr, leftIdx, midIdx, rightIdx)
            set leftIdx to leftIdx + 2 * sz
        end repeat
        set sz to sz * 2
    end repeat
    return arr
end timsort

set myArr to {5, 2, 8, 1, 9, 3, 7, 4, 6}
set result to timsort(myArr)
return result
