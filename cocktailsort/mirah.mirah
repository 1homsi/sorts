def cocktail_sort(arr:int[]):int[]
    swapped = true
    start = 0
    end_idx = arr.length - 1
    while swapped
        swapped = false
        i = start
        while i < end_idx
            if arr[i] > arr[i + 1]
                tmp = arr[i]
                arr[i] = arr[i + 1]
                arr[i + 1] = tmp
                swapped = true
            end
            i += 1
        end
        break unless swapped
        swapped = false
        end_idx -= 1
        i = end_idx - 1
        while i >= start
            if arr[i] > arr[i + 1]
                tmp = arr[i]
                arr[i] = arr[i + 1]
                arr[i + 1] = tmp
                swapped = true
            end
            i -= 1
        end
        start += 1
    end
    arr
end
