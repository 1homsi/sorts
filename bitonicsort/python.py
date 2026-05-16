def compare_and_swap(arr, i, j, direction):
    if direction == (arr[i] > arr[j]):
        arr[i], arr[j] = arr[j], arr[i]

def bitonic_merge(arr, lo, cnt, direction):
    if cnt > 1:
        k = cnt // 2
        for i in range(lo, lo + k):
            compare_and_swap(arr, i, i + k, direction)
        bitonic_merge(arr, lo, k, direction)
        bitonic_merge(arr, lo + k, k, direction)

def bitonic_sort(arr, lo, cnt, direction):
    if cnt > 1:
        k = cnt // 2
        bitonic_sort(arr, lo, k, True)
        bitonic_sort(arr, lo + k, k, False)
        bitonic_merge(arr, lo, cnt, direction)

def sort(arr):
    bitonic_sort(arr, 0, len(arr), True)
    return arr

data = [3, 7, 4, 8, 6, 2, 1, 5]
print(sort(data))
