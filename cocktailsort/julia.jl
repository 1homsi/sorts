function cocktail_sort!(arr)
    swapped = true
    start = 1
    ending = length(arr)
    while swapped
        swapped = false
        for i in start:ending-1
            if arr[i] > arr[i+1]
                arr[i], arr[i+1] = arr[i+1], arr[i]
                swapped = true
            end
        end
        if !swapped
            break
        end
        swapped = false
        ending -= 1
        for i in ending-1:-1:start
            if arr[i] > arr[i+1]
                arr[i], arr[i+1] = arr[i+1], arr[i]
                swapped = true
            end
        end
        start += 1
    end
    arr
end
