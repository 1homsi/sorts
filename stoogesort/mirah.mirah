def stooge_sort(arr:int[], first:int, last:int):void
    if arr[first] > arr[last]
        tmp = arr[first]
        arr[first] = arr[last]
        arr[last] = tmp
    end
    n = last - first + 1
    if n > 2
        t = n * 2 / 3
        stooge_sort(arr, first, first + t - 1)
        stooge_sort(arr, last - t + 1, last)
        stooge_sort(arr, first, first + t - 1)
    end
end

arr = int[]{3, 1, 4, 1, 5, 9, 2, 6}
stooge_sort(arr, 0, arr.length - 1)
puts arr.inspect
