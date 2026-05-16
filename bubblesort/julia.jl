function bubble_sort!(arr)
    n = length(arr)
    swapped = true
    while swapped
        swapped = false
        for i in 1:n-1
            if arr[i] > arr[i+1]
                arr[i], arr[i+1] = arr[i+1], arr[i]
                swapped = true
            end
        end
        n -= 1
    end
    arr
end

arr = [64, 34, 25, 12, 22, 11, 90]
println(bubble_sort!(arr))
