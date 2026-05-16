on mergeLists(left, right)
    set result to {}
    set i to 1
    set j to 1
    repeat while i ≤ length of left and j ≤ length of right
        if item i of left ≤ item j of right then
            set end of result to item i of left
            set i to i + 1
        else
            set end of result to item j of right
            set j to j + 1
        end if
    end repeat
    repeat while i ≤ length of left
        set end of result to item i of left
        set i to i + 1
    end repeat
    repeat while j ≤ length of right
        set end of result to item j of right
        set j to j + 1
    end repeat
    return result
end mergeLists

on mergesort(theList)
    if length of theList ≤ 1 then return theList
    set midPoint to (length of theList) div 2
    set leftHalf to items 1 thru midPoint of theList
    set rightHalf to items (midPoint + 1) thru -1 of theList
    return mergeLists(mergesort(leftHalf), mergesort(rightHalf))
end mergesort

mergesort({5, 2, 8, 1, 9, 3})
