extends Node

func heapify(arr: Array, n: int, i: int) -> void:
    var largest = i
    var left = 2 * i + 1
    var right = 2 * i + 2
    if left < n and arr[left] > arr[largest]:
        largest = left
    if right < n and arr[right] > arr[largest]:
        largest = right
    if largest != i:
        var tmp = arr[i]
        arr[i] = arr[largest]
        arr[largest] = tmp
        heapify(arr, n, largest)

func heapsort(arr: Array) -> Array:
    var n = arr.size()
    var i = n / 2 - 1
    while i >= 0:
        heapify(arr, n, i)
        i -= 1
    i = n - 1
    while i > 0:
        var tmp = arr[0]
        arr[0] = arr[i]
        arr[i] = tmp
        heapify(arr, i, 0)
        i -= 1
    return arr

func _ready() -> void:
    var arr = [12, 11, 13, 5, 6, 7]
    print(heapsort(arr))
