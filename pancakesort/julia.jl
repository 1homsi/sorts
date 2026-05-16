function flip!(arr, k)
    left, right = 1, k + 1
    while left < right
        arr[left], arr[right] = arr[right], arr[left]
        left += 1; right -= 1
    end
end

function pancake_sort!(arr)
    n = length(arr)
    for size in n:-1:2
        max_idx = argmax(arr[1:size])
        if max_idx != size
            if max_idx != 1
                flip!(arr, max_idx - 1)
            end
            flip!(arr, size - 1)
        end
    end
    arr
end

arr = [3, 6, 2, 7, 4, 1, 5]
println(pancake_sort!(arr))
