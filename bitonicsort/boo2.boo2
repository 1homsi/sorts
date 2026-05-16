import System

def compareAndSwap(arr as (int), i as int, j as int, direction as bool):
    if direction == (arr[i] > arr[j]):
        tmp = arr[i]
        arr[i] = arr[j]
        arr[j] = tmp

def bitonicMerge(arr as (int), lo as int, cnt as int, direction as bool):
    if cnt > 1:
        k = cnt / 2
        for i in range(lo, lo + k):
            compareAndSwap(arr, i, i + k, direction)
        bitonicMerge(arr, lo, k, direction)
        bitonicMerge(arr, lo + k, k, direction)

def bitonicSort(arr as (int), lo as int, cnt as int, direction as bool):
    if cnt > 1:
        k = cnt / 2
        bitonicSort(arr, lo, k, true)
        bitonicSort(arr, lo + k, k, false)
        bitonicMerge(arr, lo, cnt, direction)

data = array(int, (3, 7, 4, 8, 6, 2, 1, 5))
bitonicSort(data, 0, len(data), true)
print(join(str(x) for x in data, ' '))
