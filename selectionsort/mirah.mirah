def selection_sort(arr:int[]):int[]
    n = arr.length
    i = 0
    while i < n
        min_idx = i
        j = i + 1
        while j < n
            min_idx = j if arr[j] < arr[min_idx]
            j += 1
        end
        tmp = arr[i]; arr[i] = arr[min_idx]; arr[min_idx] = tmp
        i += 1
    end
    arr
end
