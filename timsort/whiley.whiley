import whiley.lang.*

function insertionSort(int[] arr, int left, int right) -> int[]:
    int i = left + 1
    while i <= right:
        int key = arr[i]
        int j = i - 1
        while j >= left && arr[j] > key:
            arr[j+1] = arr[j]
            j = j - 1
        arr[j+1] = key
        i = i + 1
    return arr

function merge(int[] arr, int left, int mid, int right) -> int[]:
    int ln = mid - left + 1
    int rn = right - mid
    int[] lp = arr[left..mid+1]
    int[] rp = arr[mid+1..right+1]
    int i = 0; int j = 0; int k = left
    while i < ln && j < rn:
        if lp[i] <= rp[j]:
            arr[k] = lp[i]; i = i + 1
        else:
            arr[k] = rp[j]; j = j + 1
        k = k + 1
    while i < ln:
        arr[k] = lp[i]; i = i+1; k = k+1
    while j < rn:
        arr[k] = rp[j]; j = j+1; k = k+1
    return arr

function timsort(int[] arr) -> int[]:
    int n = |arr|
    int minRun = 32
    int i = 0
    while i < n:
        int right = Math.min(i + minRun - 1, n - 1)
        arr = insertionSort(arr, i, right)
        i = i + minRun
    int sz = minRun
    while sz < n:
        int left = 0
        while left < n:
            int mid = Math.min(left + sz - 1, n - 1)
            int right = Math.min(left + 2*sz - 1, n - 1)
            if mid < right:
                arr = merge(arr, left, mid, right)
            left = left + 2*sz
        sz = sz * 2
    return arr

method main(System.Console console):
    int[] arr = [5, 2, 8, 1, 9, 3, 7, 4, 6]
    arr = timsort(arr)
    console.out.println(arr)
