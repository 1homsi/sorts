define selectionSort
    input array
    local n = len array
    local i = 0
    while i < n - 1 do
        local minIdx = i
        local j = i + 1
        while j < n do
            if array.j < array.minIdx then
                minIdx = j
            end
            j = j + 1
        end
        local tmp = array.i
        array.i = array.minIdx
        array.minIdx = tmp
        i = i + 1
    end
    return array
end

put selectionSort [5, 2, 8, 1, 9, 3]