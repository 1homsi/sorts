def flip(arr, k):
    left, right = 0, k
    while left < right:
        arr[left], arr[right] = arr[right], arr[left]
        left += 1
        right -= 1

def find_max_idx(arr, size):
    max_idx = 0
    for i in range(1, size):
        if arr[i] > arr[max_idx]:
            max_idx = i
    return max_idx

def pancake_sort(arr):
    size = len(arr)
    while size > 1:
        mi = find_max_idx(arr, size)
        if mi != size - 1:
            if mi != 0:
                flip(arr, mi)
            flip(arr, size - 1)
        size -= 1
    return arr

arr = [3, 6, 2, 7, 4, 1, 5]
print(pancake_sort(arr))
