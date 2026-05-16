import whiley.lang.*

function countingSort(int[] arr) -> (int[] result):
    int n = |arr|
    if n == 0:
        return arr
    int mn = arr[0]
    int mx = arr[0]
    for i in 0..n:
        if arr[i] < mn:
            mn = arr[i]
        if arr[i] > mx:
            mx = arr[i]
    int range = mx - mn + 1
    int[] count = [0; range]
    for i in 0..n:
        count[arr[i] - mn] = count[arr[i] - mn] + 1
    for i in 1..range:
        count[i] = count[i] + count[i - 1]
    int[] output = [0; n]
    int i = n - 1
    while i >= 0:
        int v = arr[i]
        count[v - mn] = count[v - mn] - 1
        output[count[v - mn]] = v
        i = i - 1
    return output

method main(System.Console sys):
    int[] arr = [4, 2, 2, 8, 3, 3, 1]
    int[] sorted = countingSort(arr)
    sys.out.println(sorted)
