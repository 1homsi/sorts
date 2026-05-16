function is_sorted(arr)
    for i in 1:length(arr)-1
        if arr[i] > arr[i+1]
            return false
        end
    end
    return true
end

function bogosort(arr)
    arr = copy(arr)
    while !is_sorted(arr)
        shuffle!(arr)
    end
    return arr
end

using Random
arr = [3, 1, 4, 1, 5, 9, 2, 6]
println(bogosort(arr))
