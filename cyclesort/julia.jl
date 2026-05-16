function cycle_sort!(arr::Vector{Int})
    writes = 0
    n = length(arr)
    for cycle_start in 1:n-1
        item = arr[cycle_start]
        pos = cycle_start
        for i in cycle_start+1:n
            if arr[i] < item
                pos += 1
            end
        end
        pos == cycle_start && continue
        while item == arr[pos]
            pos += 1
        end
        arr[pos], item = item, arr[pos]
        writes += 1
        while pos != cycle_start
            pos = cycle_start
            for i in cycle_start+1:n
                if arr[i] < item
                    pos += 1
                end
            end
            while item == arr[pos]
                pos += 1
            end
            arr[pos], item = item, arr[pos]
            writes += 1
        end
    end
    writes
end

arr = [5, 4, 3, 2, 1]
cycle_sort!(arr)
println(arr)
