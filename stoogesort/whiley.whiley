import std::io

function stoogeSort(int[] arr, int first, int last) -> int[]:
    if arr[first] > arr[last]:
        int tmp = arr[first]
        arr[first] = arr[last]
        arr[last] = tmp
    int n = last - first + 1
    if n > 2:
        int t = (n * 2) / 3
        arr = stoogeSort(arr, first, first + t - 1)
        arr = stoogeSort(arr, last - t + 1, last)
        arr = stoogeSort(arr, first, first + t - 1)
    return arr

method main(System.Console console):
    int[] arr = [3, 1, 4, 1, 5, 9, 2, 6]
    arr = stoogeSort(arr, 0, |arr| - 1)
    console.out.println(arr)
