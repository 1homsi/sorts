[indent=4]

def merge(left: array of int, right: array of int): array of int
    result: list of int = new list of int
    i: int = 0
    j: int = 0
    while i < left.length and j < right.length
        if left[i] <= right[j]
            result.add(left[i])
            i++
        else
            result.add(right[j])
            j++
    while i < left.length
        result.add(left[i])
        i++
    while j < right.length
        result.add(right[j])
        j++
    return result.to_array()

def merge_sort(arr: array of int): array of int
    if arr.length <= 1
        return arr
    mid: int = arr.length / 2
    left: array of int = merge_sort(arr[0:mid])
    right: array of int = merge_sort(arr[mid:arr.length])
    return merge(left, right)

init
    arr: array of int = {38, 27, 43, 3, 9, 82, 10}
    sorted: array of int = merge_sort(arr)
    for v in sorted
        print("%d", v)
