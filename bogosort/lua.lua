function bogosort(arr)
    while not is_sorted(arr) do
        shuffle(arr)
    end
    return arr
end

function is_sorted(arr)
    for i = 1, #arr - 1 do
        if arr[i] > arr[i + 1] then return false end
    end
    return true
end

function shuffle(arr)
    for i = #arr, 2, -1 do
        local j = math.random(i)
        arr[i], arr[j] = arr[j], arr[i]
    end
end
