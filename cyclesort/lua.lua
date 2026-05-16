local function cycleSort(arr)
    local writes = 0
    local n = #arr
    for cycleStart = 1, n - 1 do
        local item = arr[cycleStart]
        local pos = cycleStart
        for i = cycleStart + 1, n do
            if arr[i] < item then pos = pos + 1 end
        end
        if pos ~= cycleStart then
            while item == arr[pos] do pos = pos + 1 end
            arr[pos], item = item, arr[pos]
            writes = writes + 1
            while pos ~= cycleStart do
                pos = cycleStart
                for i = cycleStart + 1, n do
                    if arr[i] < item then pos = pos + 1 end
                end
                while item == arr[pos] do pos = pos + 1 end
                arr[pos], item = item, arr[pos]
                writes = writes + 1
            end
        end
    end
    return writes
end

local arr = {5, 4, 3, 2, 1}
cycleSort(arr)
for _, v in ipairs(arr) do io.write(v .. " ") end
print()
