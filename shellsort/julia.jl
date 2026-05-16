function shellsort(arr)
    n = length(arr)
    gap = div(n, 2)
    while gap > 0
        for i in (gap+1):n
            temp = arr[i]
            j = i
            while j > gap && arr[j-gap] > temp
                arr[j] = arr[j-gap]
                j -= gap
            end
            arr[j] = temp
        end
        gap = div(gap, 2)
    end
    return arr
end
