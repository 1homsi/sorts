local function comb_sort(arr)
    local n = #arr
    local gap = n
    local shrink = 1.3
    local sorted = false
    while not sorted do
        gap = math.floor(gap / shrink)
        if gap <= 1 then
            gap = 1
            sorted = true
        end
        for i = 1, n - gap do
            if arr[i] > arr[i + gap] then
                arr[i], arr[i + gap] = arr[i + gap], arr[i]
                sorted = false
            end
        end
    end
    return arr
end
