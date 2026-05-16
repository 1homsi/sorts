import System

def flip(arr as (int), k as int):
    left = 0
    right = k
    while left < right:
        tmp = arr[left]
        arr[left] = arr[right]
        arr[right] = tmp
        left++
        right--

def pancake_sort(arr as (int)) as (int):
    size = len(arr)
    while size > 1:
        max_idx = 0
        for i in range(1, size):
            if arr[i] > arr[max_idx]:
                max_idx = i
        if max_idx != size - 1:
            if max_idx != 0:
                flip(arr, max_idx)
            flip(arr, size - 1)
        size--
    return arr

arr = (3, 6, 2, 7, 4, 1, 5)
print(join(pancake_sort(arr), ", "))
