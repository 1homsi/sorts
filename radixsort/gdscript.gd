func counting_sort(arr: Array, exp: int) -> Array:
    var n = arr.size()
    var output = []
    output.resize(n)
    var count = []
    count.resize(10)
    for i in range(10):
        count[i] = 0
    for x in arr:
        count[(x / exp) % 10] += 1
    for i in range(1, 10):
        count[i] += count[i - 1]
    for i in range(n - 1, -1, -1):
        var idx = (arr[i] / exp) % 10
        count[idx] -= 1
        output[count[idx]] = arr[i]
    return output

func radix_sort(arr: Array) -> Array:
    if arr.size() == 0:
        return arr
    var max_val = arr.max()
    var exp = 1
    while max_val / exp > 0:
        arr = counting_sort(arr, exp)
        exp *= 10
    return arr

func _ready():
    var arr = [170, 45, 75, 90, 802, 24, 2, 66]
    print(radix_sort(arr))
