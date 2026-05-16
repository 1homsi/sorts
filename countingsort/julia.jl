function counting_sort(arr)
    isempty(arr) && return arr
    min_val, max_val = minimum(arr), maximum(arr)
    range_val = max_val - min_val + 1
    count = zeros(Int, range_val)
    for v in arr; count[v - min_val + 1] += 1; end
    for i in 2:range_val; count[i] += count[i-1]; end
    output = zeros(Int, length(arr))
    for i in length(arr):-1:1
        idx = arr[i] - min_val + 1
        output[count[idx]] = arr[i]
        count[idx] -= 1
    end
    output
end

println(counting_sort([4, 2, 2, 8, 3, 3, 1]))
