function comb_sort!(arr)
    n = length(arr)
    gap = n
    shrink = 1.3
    sorted = false
    while !sorted
        gap = floor(Int, gap / shrink)
        if gap <= 1
            gap = 1
            sorted = true
        end
        for i in 1:(n - gap)
            if arr[i] > arr[i + gap]
                arr[i], arr[i + gap] = arr[i + gap], arr[i]
                sorted = false
            end
        end
    end
    arr
end
