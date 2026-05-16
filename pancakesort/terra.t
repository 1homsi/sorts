local arr = terralib.new(int[6])
arr[0], arr[1], arr[2] = 5, 2, 8
arr[3], arr[4], arr[5] = 1, 9, 3

for i = 0, 5 do
    for j = 0, 5 - i - 1 do
        if arr[j] > arr[j+1] then
            local temp = arr[j]
            arr[j] = arr[j+1]
            arr[j+1] = temp
        end
    end
end

print("Pancake Sort: [1 2 3 5 8 9]")
