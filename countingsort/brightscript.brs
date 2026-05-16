function countingSort(arr as object) as object
    n = arr.Count()
    if n = 0 then return arr
    minVal = arr[0]
    maxVal = arr[0]
    for i = 0 to n - 1
        if arr[i] < minVal then minVal = arr[i]
        if arr[i] > maxVal then maxVal = arr[i]
    end for
    rng = maxVal - minVal + 1
    count = CreateObject("roArray", rng, true)
    for i = 0 to rng - 1
        count[i] = 0
    end for
    for i = 0 to n - 1
        count[arr[i] - minVal] = count[arr[i] - minVal] + 1
    end for
    for i = 1 to rng - 1
        count[i] = count[i] + count[i - 1]
    end for
    output = CreateObject("roArray", n, true)
    for i = 0 to n - 1
        output[i] = 0
    end for
    for i = n - 1 to 0 step -1
        count[arr[i] - minVal] = count[arr[i] - minVal] - 1
        output[count[arr[i] - minVal]] = arr[i]
    end for
    return output
end function

arr = [4, 2, 2, 8, 3, 3, 1]
result = countingSort(arr)
print result
