const MIN_RUN = 32

func insertion_sort(arr: Array, left: int, right: int) -> void:
    for i in range(left + 1, right + 1):
        var key = arr[i]
        var j = i - 1
        while j >= left and arr[j] > key:
            arr[j + 1] = arr[j]
            j -= 1
        arr[j + 1] = key

func merge(arr: Array, left: int, mid: int, right: int) -> void:
    var lp = arr.slice(left, mid + 1)
    var rp = arr.slice(mid + 1, right + 1)
    var i = 0
    var j = 0
    var k = left
    while i < lp.size() and j < rp.size():
        if lp[i] <= rp[j]:
            arr[k] = lp[i]; i += 1
        else:
            arr[k] = rp[j]; j += 1
        k += 1
    while i < lp.size():
        arr[k] = lp[i]; i += 1; k += 1
    while j < rp.size():
        arr[k] = rp[j]; j += 1; k += 1

func timsort(arr: Array) -> Array:
    var n = arr.size()
    var i = 0
    while i < n:
        insertion_sort(arr, i, min(i + MIN_RUN - 1, n - 1))
        i += MIN_RUN
    var size = MIN_RUN
    while size < n:
        var left = 0
        while left < n:
            var mid = min(left + size - 1, n - 1)
            var right = min(left + 2 * size - 1, n - 1)
            if mid < right:
                merge(arr, left, mid, right)
            left += 2 * size
        size *= 2
    return arr

func _ready():
    var arr = [5, 2, 8, 1, 9, 3, 7, 4, 6]
    print(timsort(arr))
