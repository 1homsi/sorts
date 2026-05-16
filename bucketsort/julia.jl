function insertion_sort!(bucket)
    n = length(bucket)
    for i in 2:n
        key = bucket[i]
        j = i - 1
        while j >= 1 && bucket[j] > key
            bucket[j + 1] = bucket[j]
            j -= 1
        end
        bucket[j + 1] = key
    end
    bucket
end

function bucket_sort(arr)
    n = length(arr)
    n == 0 && return arr
    mn, mx = minimum(arr), maximum(arr)
    buckets = [Float64[] for _ in 1:n]
    for num in arr
        idx = floor(Int, (num - mn) / (mx - mn + 1) * n) + 1
        idx = min(idx, n)
        push!(buckets[idx], num)
    end
    vcat([insertion_sort!(b) for b in buckets]...)
end

println(bucket_sort([0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68]))
