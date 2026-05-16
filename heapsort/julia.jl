function heapify!(arr, n, i)
    largest = i
    left = 2 * i
    right = 2 * i + 1
    if left <= n && arr[left] > arr[largest]; largest = left; end
    if right <= n && arr[right] > arr[largest]; largest = right; end
    if largest != i
        arr[i], arr[largest] = arr[largest], arr[i]
        heapify!(arr, n, largest)
    end
end

function heapsort!(arr)
    n = length(arr)
    for i in div(n, 2):-1:1; heapify!(arr, n, i); end
    for i in n:-1:2
        arr[1], arr[i] = arr[i], arr[1]
        heapify!(arr, i - 1, 1)
    end
    arr
end

arr = [12, 11, 13, 5, 6, 7]
println(heapsort!(arr))
