arr = [3, 6, 2, 7, 4, 1, 5]
n = len(arr)

func flip k
    left = 1
    right = k + 1
    while left < right
        tmp = arr[left]
        arr[left] = arr[right]
        arr[right] = tmp
        left++
        right--
    end

func findMaxIdx size
    maxIdx = 1
    for i = 2 to size
        if arr[i] > arr[maxIdx]
            maxIdx = i
        ok
    next
    return maxIdx

size = n
while size > 1
    maxIdx = findMaxIdx(size)
    if maxIdx != size
        if maxIdx != 1
            flip(maxIdx - 1)
        ok
        flip(size - 1)
    ok
    size--
end

see arr
