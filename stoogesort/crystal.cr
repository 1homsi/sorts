def stooge_sort(arr : Array(Int32), first : Int32, last : Int32)
    if arr[first] > arr[last]
        arr[first], arr[last] = arr[last], arr[first]
    end
    if last - first + 1 > 2
        t = (last - first + 1) * 2 // 3
        stooge_sort(arr, first, first + t - 1)
        stooge_sort(arr, last - t + 1, last)
        stooge_sort(arr, first, first + t - 1)
    end
end

arr = [3, 1, 4, 1, 5, 9, 2, 6]
stooge_sort(arr, 0, arr.size - 1)
puts arr.inspect
