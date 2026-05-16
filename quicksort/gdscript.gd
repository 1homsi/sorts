func partition(arr: Array, low: int, high: int) -> int:
    var pivot = arr[high]
    var i = low
    for j in range(low, high):
        if arr[j] <= pivot:
            var tmp = arr[i]
            arr[i] = arr[j]
            arr[j] = tmp
            i += 1
    var tmp = arr[i]
    arr[i] = arr[high]
    arr[high] = tmp
    return i

func quicksort(arr: Array, low: int, high: int) -> void:
    if low < high:
        var p = partition(arr, low, high)
        quicksort(arr, low, p - 1)
        quicksort(arr, p + 1, high)

func _ready():
    var arr = [3, 6, 8, 10, 1, 2, 1]
    quicksort(arr, 0, arr.size() - 1)
    print(arr)
