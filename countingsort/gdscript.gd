extends Node

func counting_sort(arr: Array) -> Array:
    if arr.size() == 0:
        return arr
    var min_val = arr[0]
    var max_val = arr[0]
    for v in arr:
        if v < min_val: min_val = v
        if v > max_val: max_val = v
    var range_val = max_val - min_val + 1
    var count = []
    count.resize(range_val)
    count.fill(0)
    for v in arr:
        count[v - min_val] += 1
    for i in range(1, range_val):
        count[i] += count[i - 1]
    var output = []
    output.resize(arr.size())
    output.fill(0)
    for i in range(arr.size() - 1, -1, -1):
        count[arr[i] - min_val] -= 1
        output[count[arr[i] - min_val]] = arr[i]
    return output

func _ready():
    print(counting_sort([4, 2, 2, 8, 3, 3, 1]))
