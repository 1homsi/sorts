proc stoogeSort(ref arr: [] int, first: int, last: int) {
    if arr[first] > arr[last] {
        var tmp = arr[first];
        arr[first] = arr[last];
        arr[last] = tmp;
    }
    var n = last - first + 1;
    if n > 2 {
        var t = n * 2 / 3;
        stoogeSort(arr, first, first + t - 1);
        stoogeSort(arr, last - t + 1, last);
        stoogeSort(arr, first, first + t - 1);
    }
}

var arr: [0..7] int = [3, 1, 4, 1, 5, 9, 2, 6];
stoogeSort(arr, 0, 7);
writeln(arr);
