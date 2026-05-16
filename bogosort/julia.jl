function bogosort(arr)
    while !is_sorted(arr)
        shuffle!(arr)
    end
    return arr
end

function is_sorted(arr)
    all(arr[i] <= arr[i+1] for i in 1:length(arr)-1)
end
