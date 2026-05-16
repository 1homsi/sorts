func shellSort arr
    n = len(arr)
    gap = n / 2
    while gap > 0
        for i = gap + 1 to n
            temp = arr[i]
            j = i
            while j > gap and arr[j - gap] > temp
                arr[j] = arr[j - gap]
                j -= gap
            end
            arr[j] = temp
        next
        gap = gap / 2
    end
    return arr

arr = [64, 34, 25, 12, 22, 11, 90]
see shellSort(arr)
