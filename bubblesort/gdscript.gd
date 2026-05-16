func bubble_sort(arr):
    var n = arr.size()
    var swapped = true
    while swapped:
        swapped = false
        for i in range(n - 1):
            if arr[i] > arr[i + 1]:
                var tmp = arr[i]
                arr[i] = arr[i + 1]
                arr[i + 1] = tmp
                swapped = true
        n -= 1
    return arr

func _ready():
    var arr = [64, 34, 25, 12, 22, 11, 90]
    print(bubble_sort(arr))
