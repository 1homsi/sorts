function flip(int[] arr, int k) -> (int[] result):
    int left = 0
    int right = k
    while left < right:
        int tmp = arr[left]
        arr[left] = arr[right]
        arr[right] = tmp
        left = left + 1
        right = right - 1
    return arr

function findMaxIdx(int[] arr, int size) -> (int result):
    int maxIdx = 0
    int i = 1
    while i < size:
        if arr[i] > arr[maxIdx]:
            maxIdx = i
        i = i + 1
    return maxIdx

function pancakeSort(int[] arr) -> (int[] result):
    int size = |arr|
    while size > 1:
        int maxIdx = findMaxIdx(arr, size)
        if maxIdx != size - 1:
            if maxIdx != 0:
                arr = flip(arr, maxIdx)
            arr = flip(arr, size - 1)
        size = size - 1
    return arr

method main():
    int[] arr = [3, 6, 2, 7, 4, 1, 5]
    arr = pancakeSort(arr)
    debug arr
