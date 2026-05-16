def selectionSort(arr):
    n = arr.length()
    for i in range(0, n - 1):
        minIdx = i
        for j in range(i + 1, n):
            if arr[j] < arr[minIdx]:
                minIdx = j
            end
        end
        tmp = arr[i]
        arr[i] = arr[minIdx]
        arr[minIdx] = tmp
    end
    return arr
end

print(selectionSort([5, 2, 8, 1, 9, 3]))