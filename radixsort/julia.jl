function counting_sort!(arr::Vector{Int}, exp::Int)
    n = length(arr)
    output = zeros(Int, n)
    count = zeros(Int, 10)
    for x in arr
        count[(x ÷ exp) % 10 + 1] += 1
    end
    for i in 2:10
        count[i] += count[i-1]
    end
    for i in n:-1:1
        idx = (arr[i] ÷ exp) % 10 + 1
        count[idx] -= 1
        output[count[idx] + 1] = arr[i]
    end
    arr .= output
end

function radix_sort!(arr::Vector{Int})
    isempty(arr) && return arr
    max_val = maximum(arr)
    exp = 1
    while max_val ÷ exp > 0
        counting_sort!(arr, exp)
        exp *= 10
    end
    arr
end

arr = [170, 45, 75, 90, 802, 24, 2, 66]
println(radix_sort!(arr))
