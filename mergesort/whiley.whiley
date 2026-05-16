function merge(int[] left, int[] right) -> (int[] result):
    int[] res = [0; |left| + |right|]
    int i = 0; int j = 0; int k = 0
    while i < |left| && j < |right|:
        if left[i] <= right[j]:
            res[k] = left[i]; i = i + 1
        else:
            res[k] = right[j]; j = j + 1
        k = k + 1
    while i < |left|:
        res[k] = left[i]; i = i + 1; k = k + 1
    while j < |right|:
        res[k] = right[j]; j = j + 1; k = k + 1
    return res

function mergeSort(int[] arr) -> (int[] sorted):
    if |arr| <= 1:
        return arr
    int mid = |arr| / 2
    int[] left = mergeSort(arr[0..mid])
    int[] right = mergeSort(arr[mid..|arr|])
    return merge(left, right)

method main(System.Console console):
    int[] arr = [38, 27, 43, 3, 9, 82, 10]
    int[] sorted = mergeSort(arr)
    console.out.println(sorted)
