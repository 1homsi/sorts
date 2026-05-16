extends Node

func merge(left: Array, right: Array) -> Array:
    var result = []
    var i = 0
    var j = 0
    while i < left.size() and j < right.size():
        if left[i] <= right[j]:
            result.append(left[i])
            i += 1
        else:
            result.append(right[j])
            j += 1
    while i < left.size():
        result.append(left[i])
        i += 1
    while j < right.size():
        result.append(right[j])
        j += 1
    return result

func merge_sort(arr: Array) -> Array:
    if arr.size() <= 1:
        return arr
    var mid = arr.size() / 2
    var left = merge_sort(arr.slice(0, mid))
    var right = merge_sort(arr.slice(mid))
    return merge(left, right)

func _ready():
    var arr = [38, 27, 43, 3, 9, 82, 10]
    print(merge_sort(arr))
