func stooge_sort(arr: Array, first: int, last: int) -> void:
    if arr[first] > arr[last]:
        var tmp = arr[first]
        arr[first] = arr[last]
        arr[last] = tmp
    if last - first + 1 > 2:
        var t = (last - first + 1) * 2 / 3
        stooge_sort(arr, first, first + t - 1)
        stooge_sort(arr, last - t + 1, last)
        stooge_sort(arr, first, first + t - 1)

func _ready() -> void:
    var arr = [3, 1, 4, 1, 5, 9, 2, 6]
    stooge_sort(arr, 0, arr.size() - 1)
    print(arr)
