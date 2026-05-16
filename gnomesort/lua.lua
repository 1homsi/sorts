function gnomeSort(arr)
    local i = 1
    local n = #arr
    while i <= n do
        if i == 1 or arr[i] >= arr[i - 1] then
            i = i + 1
        else
            arr[i], arr[i - 1] = arr[i - 1], arr[i]
            i = i - 1
        end
    end
    return arr
end
