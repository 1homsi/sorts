function shellSort(arr)
    local n = #arr
    local gap = math.floor(n / 2)
    while gap > 0 do
        for i = gap + 1, n do
            local temp = arr[i]
            local j = i
            while j > gap and arr[j - gap] > temp do
                arr[j] = arr[j - gap]
                j = j - gap
            end
            arr[j] = temp
        end
        gap = math.floor(gap / 2)
    end
    return arr
end

local arr = {64, 34, 25, 12, 22, 11, 90}
shellSort(arr)
for _, v in ipairs(arr) do io.write(v .. " ") end
print()
