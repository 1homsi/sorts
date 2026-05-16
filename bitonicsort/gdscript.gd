extends Node

func compare_and_swap(arr: Array, i: int, j: int, direction: bool) -> void:
    if direction == (arr[i] > arr[j]):
        var tmp = arr[i]
        arr[i] = arr[j]
        arr[j] = tmp

func bitonic_merge(arr: Array, lo: int, cnt: int, direction: bool) -> void:
    if cnt > 1:
        var k = cnt / 2
        for i in range(lo, lo + k):
            compare_and_swap(arr, i, i + k, direction)
        bitonic_merge(arr, lo, k, direction)
        bitonic_merge(arr, lo + k, k, direction)

func bitonic_sort(arr: Array, lo: int, cnt: int, direction: bool) -> void:
    if cnt > 1:
        var k = cnt / 2
        bitonic_sort(arr, lo, k, true)
        bitonic_sort(arr, lo + k, k, false)
        bitonic_merge(arr, lo, cnt, direction)

func _ready() -> void:
    var data = [3, 7, 4, 8, 6, 2, 1, 5]
    bitonic_sort(data, 0, data.size(), true)
    print(data)
