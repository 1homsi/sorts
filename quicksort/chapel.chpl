proc partition(ref arr: [] int, low: int, high: int): int {
    var pivot = arr[high];
    var i = low;
    for j in low..high-1 {
        if arr[j] <= pivot {
            arr[i] <=> arr[j];
            i += 1;
        }
    }
    arr[i] <=> arr[high];
    return i;
}

proc quicksort(ref arr: [] int, low: int, high: int) {
    if low < high {
        var p = partition(arr, low, high);
        quicksort(arr, low, p - 1);
        quicksort(arr, p + 1, high);
    }
}

var arr = [3, 6, 8, 10, 1, 2, 1];
quicksort(arr, arr.domain.low, arr.domain.high);
writeln(arr);
