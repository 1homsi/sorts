define insertion_sort(arr: Array{Int}, n: Int) -> Void {
    for i in 1..n-1 {
        let key = arr[i];
        var j = i - 1;
        while j >= 0 and arr[j] > key {
            arr[j+1] = arr[j];
            j = j - 1;
        }
        arr[j+1] = key;
    }
}
