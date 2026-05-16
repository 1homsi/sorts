import whiley.lang.*

function shellSort(int[] arr) -> int[]:
    int n = |arr|
    int gap = n / 2
    while gap > 0:
        int i = gap
        while i < n:
            int temp = arr[i]
            int j = i
            while j >= gap && arr[j - gap] > temp:
                arr[j] = arr[j - gap]
                j = j - gap
            arr[j] = temp
            i = i + 1
        gap = gap / 2
    return arr

method main(System.Console console):
    int[] arr = [64, 34, 25, 12, 22, 11, 90]
    int[] sorted = shellSort(arr)
    console.out.println(sorted)
