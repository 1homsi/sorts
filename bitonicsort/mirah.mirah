def compare_and_swap(arr:int[], i:int, j:int, direction:boolean):void
    if direction == (arr[i] > arr[j])
        tmp = arr[i]
        arr[i] = arr[j]
        arr[j] = tmp
    end
end

def bitonic_merge(arr:int[], lo:int, cnt:int, direction:boolean):void
    if cnt > 1
        k = cnt / 2
        i = lo
        while i < lo + k
            compare_and_swap(arr, i, i + k, direction)
            i = i + 1
        end
        bitonic_merge(arr, lo, k, direction)
        bitonic_merge(arr, lo + k, k, direction)
    end
end

def bitonic_sort(arr:int[], lo:int, cnt:int, direction:boolean):void
    if cnt > 1
        k = cnt / 2
        bitonic_sort(arr, lo, k, true)
        bitonic_sort(arr, lo + k, k, false)
        bitonic_merge(arr, lo, cnt, direction)
    end
end

data = int[]{3, 7, 4, 8, 6, 2, 1, 5}
bitonic_sort(data, 0, data.length, true)
puts data.inspect
