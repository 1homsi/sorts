def is_sorted(arr):
    for i in range(len(arr) - 1):
        if arr[i] > arr[i + 1]:
            return False
    return True

def bogosort(arr):
    import random
    arr = list(arr)
    while not is_sorted(arr):
        random.shuffle(arr)
    return arr

arr = [3, 1, 4, 1, 5, 9, 2, 6]
print(bogosort(arr))
