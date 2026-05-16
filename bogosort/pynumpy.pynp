import random

def bogosort(arr):
    while not all(arr[i] <= arr[i + 1] for i in range(len(arr) - 1)):
        random.shuffle(arr)
    return arr
