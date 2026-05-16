procedure shellSort(arr, n)
    gap = n / 2
    while gap > 0 do
        for i = gap to n - 1 do
            temp = arr[i]
            j = i
            while j >= gap and arr[j - gap] > temp do
                arr[j] = arr[j - gap]
                j = j - gap
            end
            arr[j] = temp
        end
        gap = gap / 2
    end
    return arr
end

arr = {64, 34, 25, 12, 22, 11, 90}
print shellSort(arr, 7)
