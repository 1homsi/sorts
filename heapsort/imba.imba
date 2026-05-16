def heapify(arr, n, i)
    var largest = i
    var left = 2 * i + 1
    var right = 2 * i + 2
    largest = left if left < n and arr[left] > arr[largest]
    largest = right if right < n and arr[right] > arr[largest]
    if largest != i
        var tmp = arr[i]
        arr[i] = arr[largest]
        arr[largest] = tmp
        heapify(arr, n, largest)

def heapsort(arr)
    var n = arr.length
    var i = Math.floor(n / 2) - 1
    while i >= 0
        heapify(arr, n, i)
        i--
    i = n - 1
    while i > 0
        var tmp = arr[0]
        arr[0] = arr[i]
        arr[i] = tmp
        heapify(arr, i, 0)
        i--
    arr

var arr = [12, 11, 13, 5, 6, 7]
console.log(heapsort(arr))
