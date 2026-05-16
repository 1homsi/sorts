terra cocktailsort(arr : &int, n : int)
    var i = 0
    while i < n do
        var swapped = false
        for k = 0, n - i - 1 do
            if arr[k] > arr[k + 1] then
                var temp = arr[k]
                arr[k] = arr[k + 1]
                arr[k + 1] = temp
                swapped = true
            end
        end
        if not swapped then break end
        i = i + 1
        swapped = false
        for k = n - i - 2, -1, -1 do
            if arr[k] > arr[k + 1] then
                var temp = arr[k]
                arr[k] = arr[k + 1]
                arr[k + 1] = temp
                swapped = true
            end
        end
        if not swapped then break end
        i = i + 1
    end
end

var arr : int[6] = [5, 2, 8, 1, 9, 3]
cocktailsort(&arr[0], 6)
