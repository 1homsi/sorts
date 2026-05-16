import java.util.Arrays

def flip(arr:int[], k:int):void
    left = 0
    right = k
    while left < right
        tmp = arr[left]
        arr[left] = arr[right]
        arr[right] = tmp
        left += 1
        right -= 1
    end
end

def find_max_idx(arr:int[], size:int):int
    max_idx = 0
    i = 1
    while i < size
        if arr[i] > arr[max_idx]
            max_idx = i
        end
        i += 1
    end
    max_idx
end

def pancake_sort(arr:int[]):int[]
    size = arr.length
    while size > 1
        max_idx = find_max_idx(arr, size)
        if max_idx != size - 1
            if max_idx != 0
                flip(arr, max_idx)
            end
            flip(arr, size - 1)
        end
        size -= 1
    end
    arr
end

arr = [3, 6, 2, 7, 4, 1, 5] as int[]
puts Arrays.toString(pancake_sort(arr))
