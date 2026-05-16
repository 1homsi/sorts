proc selectionSort(arr: [] int) {
    const n = arr.size;
    for i in 0..#n {
        var minIdx = i;
        for j in (i+1)..#(n-i-1) {
            if arr[j] < arr[minIdx] then minIdx = j;
        }
        arr[i] <=> arr[minIdx];
    }
}
