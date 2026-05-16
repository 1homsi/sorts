sub Main()
    arr = [5, 2, 8, 1, 9, 3]
    sorted = mergesort(arr)
    print sorted
end sub

function mergesort(arr as Object) as Object
    if arr.Count() <= 1 then return arr
    mid = arr.Count() / 2
    left = []
    right = []
    for i = 0 to mid - 1 : left.Push(arr[i]) : end for
    for i = mid to arr.Count() - 1 : right.Push(arr[i]) : end for
    return merge(mergesort(left), mergesort(right))
end function

function merge(left as Object, right as Object) as Object
    result = []
    i = 0
    j = 0
    while i < left.Count() and j < right.Count()
        if left[i] <= right[j] then
            result.Push(left[i])
            i = i + 1
        else
            result.Push(right[j])
            j = j + 1
        end if
    end while
    while i < left.Count()  : result.Push(left[i])  : i = i + 1 : end while
    while j < right.Count() : result.Push(right[j]) : j = j + 1 : end while
    return result
end function
