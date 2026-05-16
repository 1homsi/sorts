def partition(arr:int[], low:int, high:int):int
    pivot = arr[high]
    i = low
    j = low
    while j < high
        if arr[j] <= pivot
            tmp = arr[i]; arr[i] = arr[j]; arr[j] = tmp
            i += 1
        end
        j += 1
    end
    tmp = arr[i]; arr[i] = arr[high]; arr[high] = tmp
    return i
end

def quicksort(arr:int[], low:int, high:int):void
    if low < high
        p = partition(arr, low, high)
        quicksort(arr, low, p - 1)
        quicksort(arr, p + 1, high)
    end
end

arr = int[]{3, 6, 8, 10, 1, 2, 1}
quicksort(arr, 0, arr.length - 1)
puts arr.inspect
