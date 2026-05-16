on heapify(arr, n, i)
    set largest to i
    set left to 2 * i
    set right to 2 * i + 1
    if left ≤ n and item left of arr > item largest of arr then set largest to left
    if right ≤ n and item right of arr > item largest of arr then set largest to right
    if largest ≠ i then
        set tmp to item i of arr
        set item i of arr to item largest of arr
        set item largest of arr to tmp
        heapify(arr, n, largest)
    end if
    return arr
end heapify

on heapsort(arr)
    set n to count of arr
    set i to n div 2
    repeat while i ≥ 1
        set arr to heapify(arr, n, i)
        set i to i - 1
    end repeat
    set i to n
    repeat while i ≥ 2
        set tmp to item 1 of arr
        set item 1 of arr to item i of arr
        set item i of arr to tmp
        set arr to heapify(arr, i - 1, 1)
        set i to i - 1
    end repeat
    return arr
end heapsort

set arr to {12, 11, 13, 5, 6, 7}
set result to heapsort(arr)
log result
