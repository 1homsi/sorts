import whiley.lang.*

function getDigit(int x, int exp) -> int:
    return (x / exp) % 10

function countingSort(int[] arr, int exp) -> int[]:
    int[] result = []
    int d = 0
    while d < 10:
        int i = 0
        while i < |arr|:
            if getDigit(arr[i], exp) == d:
                result = result ++ [arr[i]]
            i = i + 1
        d = d + 1
    return result

function radixSort(int[] arr) -> int[]:
    if |arr| == 0:
        return arr
    int maxVal = 0
    int i = 0
    while i < |arr|:
        if arr[i] > maxVal:
            maxVal = arr[i]
        i = i + 1
    int exp = 1
    while maxVal / exp > 0:
        arr = countingSort(arr, exp)
        exp = exp * 10
    return arr

method main(System.Console sys):
    int[] arr = [170, 45, 75, 90, 802, 24, 2, 66]
    arr = radixSort(arr)
    sys.out.println(Any.toString(arr))
