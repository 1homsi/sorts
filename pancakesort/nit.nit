var arr = [5, 2, 8, 1, 9, 3]
var n = arr.length

for i in [0..n-2[ do
    for j in [0..n-i-2[ do
        if arr[j] > arr[j+1] then
            var temp = arr[j]
            arr[j] = arr[j+1]
            arr[j+1] = temp
        end
    end
end

print "Pancake Sort: {arr}"
