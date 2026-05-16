function selection_sort!(arr::Vector{Int})
    n = length(arr)
    for i in 1:n
        min_idx = i
        for j in i+1:n
            if arr[j] < arr[min_idx]
                min_idx = j
            end
        end
        arr[i], arr[min_idx] = arr[min_idx], arr[i]
    end
    return arr
end
