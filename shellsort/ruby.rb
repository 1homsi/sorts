def shellsort(arr)
    n = arr.length
    gap = n / 2
    while gap > 0
        (gap...n).each do |i|
            temp = arr[i]
            j = i
            while j >= gap && arr[j - gap] > temp
                arr[j] = arr[j - gap]
                j -= gap
            end
            arr[j] = temp
        end
        gap /= 2
    end
    arr
end
