def flip(arr, k):
    arr[:k+1] = arr[:k+1][::-1]

def pancake_sort(arr):
    n = len(arr)
    for size in range(n, 1, -1):
        max_idx = arr.index(max(arr[:size]))
        if max_idx != size - 1:
            if max_idx != 0:
                flip(arr, max_idx)
            flip(arr, size - 1)
    return arr

arr = [3, 6, 2, 7, 4, 1, 5]
print(pancake_sort(arr))
