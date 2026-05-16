func flip(arr: Array, k: int) -> void:
    var left := 0
    var right := k
    while left < right:
        var tmp = arr[left]
        arr[left] = arr[right]
        arr[right] = tmp
        left += 1
        right -= 1

func pancake_sort(arr: Array) -> Array:
    var size := arr.size()
    while size > 1:
        var max_idx := 0
        for i in range(1, size):
            if arr[i] > arr[max_idx]:
                max_idx = i
        if max_idx != size - 1:
            if max_idx != 0:
                flip(arr, max_idx)
            flip(arr, size - 1)
        size -= 1
    return arr

func _ready() -> void:
    var arr := [3, 6, 2, 7, 4, 1, 5]
    print(pancake_sort(arr))
