def compare_and_swap(arr, i, j, direction):
    ai = arr[i]
    aj = arr[j]
    if direction == (ai > aj):
        arr[i], arr[j] = aj, ai

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

data = [3, 7, 4, 8, 6, 2, 1, 5]
bitonic_sort(data, 0, len(data), True)
print(data)
