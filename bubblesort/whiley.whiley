import whiley.lang.*

function bubbleSort(int[] arr) -> int[]:
    int n = |arr|
    bool swapped = true
    while swapped:
        swapped = false
        int i = 0
        while i < n - 1:
            if arr[i] > arr[i+1]:
                int tmp = arr[i]
                arr[i] = arr[i+1]
                arr[i+1] = tmp
                swapped = true
            i = i + 1
        n = n - 1
    return arr

method main(System.Console sys):
    int[] arr = [64, 34, 25, 12, 22, 11, 90]
    arr = bubbleSort(arr)
    sys.out.println(Any.toString(arr))
