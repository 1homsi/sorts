import System
import System.Collections.Generic

def IsSorted(arr as List[of int]) as bool:
    for i in range(arr.Count - 1):
        if arr[i] > arr[i + 1]:
            return false
    return true

def Shuffle(arr as List[of int]):
    rng = Random()
    n = arr.Count
    for i in range(n - 1, 0, -1):
        j = rng.Next(i + 1)
        tmp = arr[i]
        arr[i] = arr[j]
        arr[j] = tmp

def Bogosort(arr as List[of int]):
    while not IsSorted(arr):
        Shuffle(arr)

arr = List[of int]([3, 1, 4, 1, 5, 9, 2, 6])
Bogosort(arr)
print(join(arr, ", "))
