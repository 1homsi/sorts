extends Node

func is_sorted(arr: Array) -> bool:
    for i in range(arr.size() - 1):
        if arr[i] > arr[i + 1]:
            return false
    return true

func shuffle(arr: Array) -> Array:
    var a = arr.duplicate()
    a.shuffle()
    return a

func bogosort(arr: Array) -> Array:
    var a = arr.duplicate()
    while not is_sorted(a):
        a = shuffle(a)
    return a

func _ready():
    var arr = [3, 1, 4, 1, 5, 9, 2, 6]
    print(bogosort(arr))
