function quicksort(arr)
    length(arr) <= 1 && return arr
    pivot = arr[div(length(arr), 2) + 1]
    left = filter(x -> x < pivot, arr)
    middle = filter(x -> x == pivot, arr)
    right = filter(x -> x > pivot, arr)
    [quicksort(left); middle; quicksort(right)]
end

println(quicksort([3, 6, 8, 10, 1, 2, 1]))
