function compare_and_swap!(arr, i, j, direction)
    if direction == (arr[i] > arr[j])
        arr[i], arr[j] = arr[j], arr[i]
    end
end

function bitonic_merge!(arr, lo, cnt, direction)
    if cnt > 1
        k = cnt ÷ 2
        for i in lo:lo+k-1
            compare_and_swap!(arr, i, i+k, direction)
        end
        bitonic_merge!(arr, lo, k, direction)
        bitonic_merge!(arr, lo+k, k, direction)
    end
end

function bitonic_sort!(arr, lo, cnt, direction)
    if cnt > 1
        k = cnt ÷ 2
        bitonic_sort!(arr, lo, k, true)
        bitonic_sort!(arr, lo+k, k, false)
        bitonic_merge!(arr, lo, cnt, direction)
    end
end

data = [3, 7, 4, 8, 6, 2, 1, 5]
bitonic_sort!(data, 1, length(data), true)
println(data)
