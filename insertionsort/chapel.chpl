proc insertionSort(ref arr: [] int) {
    const n = arr.size;
    for i in 1..n-1 {
        var key = arr[i];
        var j = i - 1;
        while j >= 0 && arr[j] > key {
            arr[j + 1] = arr[j];
            j -= 1;
        }
        arr[j + 1] = key;
    }
}
