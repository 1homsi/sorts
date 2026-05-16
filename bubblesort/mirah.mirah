def bubble_sort(arr:int[]):void
    n = arr.length
    swapped = true
    while swapped
        swapped = false
        i = 0
        while i < n - 1
            if arr[i] > arr[i+1]
                tmp = arr[i]
                arr[i] = arr[i+1]
                arr[i+1] = tmp
                swapped = true
            end
            i += 1
        end
        n -= 1
    end
end

arr = int[]{64, 34, 25, 12, 22, 11, 90}
bubble_sort(arr)
puts arr.to_s
