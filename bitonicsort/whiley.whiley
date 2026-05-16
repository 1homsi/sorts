function compareAndSwap(int[] arr, int i, int j, bool direction) -> int[]:
    int ai = arr[i]
    int aj = arr[j]
    if direction == (ai > aj):
        arr[i] = aj
        arr[j] = ai
    return arr

function bitonicMerge(int[] arr, int lo, int cnt, bool direction) -> int[]:
    if cnt > 1:
        int k = cnt / 2
        int i = lo
        while i < lo + k:
            arr = compareAndSwap(arr, i, i + k, direction)
            i = i + 1
        arr = bitonicMerge(arr, lo, k, direction)
        arr = bitonicMerge(arr, lo + k, k, direction)
    return arr

function bitonicSort(int[] arr, int lo, int cnt, bool direction) -> int[]:
    if cnt > 1:
        int k = cnt / 2
        arr = bitonicSort(arr, lo, k, true)
        arr = bitonicSort(arr, lo + k, k, false)
        arr = bitonicMerge(arr, lo, cnt, direction)
    return arr

method main():
    int[] data = [3, 7, 4, 8, 6, 2, 1, 5]
    data = bitonicSort(data, 0, |data|, true)
    debug(data)
