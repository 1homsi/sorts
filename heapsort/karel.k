program Karel
    var arr[6] = [5, 2, 8, 1, 9, 3]
    var n = 6
    
    for var i = n / 2 - 1 down to 0
        siftdown(arr, i, n)
    
    for var i = n - 1 down to 1
        var temp = arr[0]
        arr[0] = arr[i]
        arr[i] = temp
        siftdown(arr, 0, i)
    
    for var i = 0 to n - 1
        turnOn(arr[i])
end

procedure siftdown(array arr, int idx, int n)
    var largest = idx
    var left = 2 * idx + 1
    var right = 2 * idx + 2
    
    if left < n and arr[left] > arr[largest]
        largest = left
    
    if right < n and arr[right] > arr[largest]
        largest = right
    
    if largest != idx
        var temp = arr[idx]
        arr[idx] = arr[largest]
        arr[largest] = temp
        siftdown(arr, largest, n)
end
