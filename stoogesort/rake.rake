def stooge_sort(arr, first, last)
    if arr[first] > arr[last]
        arr[first], arr[last] = arr[last], arr[first]
    end
    if last - first + 1 > 2
        t = (last - first + 1) * 2 / 3
        stooge_sort(arr, first, first + t - 1)
        stooge_sort(arr, last - t + 1, last)
        stooge_sort(arr, first, first + t - 1)
    end
end

task :default do
    arr = [3, 1, 4, 1, 5, 9, 2, 6]
    stooge_sort(arr, 0, arr.length - 1)
    puts arr.inspect
end
