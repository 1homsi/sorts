import java.util.Arrays

MIN_RUN = 32

def insertion_sort(arr:int[], left:int, right:int):void
    i = left + 1
    while i <= right
        key = arr[i]
        j = i - 1
        while j >= left && arr[j] > key
            arr[j+1] = arr[j]
            j -= 1
        end
        arr[j+1] = key
        i += 1
    end
end

def merge(arr:int[], left:int, mid:int, right:int):void
    lp = Arrays.copyOfRange(arr, left, mid+1)
    rp = Arrays.copyOfRange(arr, mid+1, right+1)
    i = 0; j = 0; k = left
    while i < lp.length && j < rp.length
        if lp[i] <= rp[j]; arr[k] = lp[i]; i += 1
        else; arr[k] = rp[j]; j += 1
        end
        k += 1
    end
    while i < lp.length; arr[k] = lp[i]; i += 1; k += 1; end
    while j < rp.length; arr[k] = rp[j]; j += 1; k += 1; end
end

def timsort(arr:int[]):void
    n = arr.length
    i = 0
    while i < n
        right = Math.min(i + MIN_RUN - 1, n - 1)
        insertion_sort(arr, i, right)
        i += MIN_RUN
    end
    size = MIN_RUN
    while size < n
        left = 0
        while left < n
            mid = Math.min(left + size - 1, n - 1)
            right = Math.min(left + 2 * size - 1, n - 1)
            if mid < right; merge(arr, left, mid, right); end
            left += 2 * size
        end
        size *= 2
    end
end

arr = [5, 2, 8, 1, 9, 3, 7, 4, 6] as int[]
timsort(arr)
puts Arrays.toString(arr)
