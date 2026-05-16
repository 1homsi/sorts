import whiley.lang.*

function isSorted(int[] arr) -> bool:
    int n = |arr|
    int i = 0
    while i < n - 1:
        if arr[i] > arr[i + 1]:
            return false
        i = i + 1
    return true

function shuffle(int[] arr) -> int[]:
    int n = |arr|
    int i = n - 1
    while i > 0:
        int j = Math.abs(Math.random()) % (i + 1)
        int tmp = arr[i]
        arr[i] = arr[j]
        arr[j] = tmp
        i = i - 1
    return arr

function bogosort(int[] arr) -> int[]:
    while !isSorted(arr):
        arr = shuffle(arr)
    return arr

method main(System.Console console):
    int[] arr = [3, 1, 4, 1, 5, 9, 2, 6]
    console.out.println(bogosort(arr))
