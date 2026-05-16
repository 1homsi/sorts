func shell_sort(arr: Array) -> Array:
    var n = arr.size()
    var gap = n / 2
    while gap > 0:
        for i in range(gap, n):
            var temp = arr[i]
            var j = i
            while j >= gap and arr[j - gap] > temp:
                arr[j] = arr[j - gap]
                j -= gap
            arr[j] = temp
        gap /= 2
    return arr

func _ready():
    var arr = [64, 34, 25, 12, 22, 11, 90]
    print(shell_sort(arr))
