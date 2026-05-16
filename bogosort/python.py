import random

def is_sorted(arr):
    for i in range(len(arr) - 1):
        if arr[i] > arr[i + 1]:
            return False
    return True

def shuffle(arr):
    random.shuffle(arr)

def bogosort(arr):
    while not is_sorted(arr):
        shuffle(arr)
    return arr

arr = [3, 1, 4, 1, 5, 9, 2, 6]
print(bogosort(arr))
