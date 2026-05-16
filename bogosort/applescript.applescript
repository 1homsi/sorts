on isSorted(arr)
    repeat with i from 1 to (count arr) - 1
        if item i of arr > item (i + 1) of arr then return false
    end repeat
    return true
end isSorted

on shuffleList(arr)
    set n to count arr
    set a to arr
    repeat with i from n to 2 by -1
        set j to (random number from 1 to i)
        set tmp to item i of a
        set item i of a to item j of a
        set item j of a to tmp
    end repeat
    return a
end shuffleList

on bogosort(arr)
    repeat until isSorted(arr)
        set arr to shuffleList(arr)
    end repeat
    return arr
end bogosort

set arr to {3, 1, 4, 1, 5, 9, 2, 6}
set result to bogosort(arr)
log result
