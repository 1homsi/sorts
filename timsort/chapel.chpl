const MIN_RUN = 32;

proc insertionSort(ref arr: [] int, left: int, right: int) {
    for i in left+1..right {
        var key = arr[i];
        var j = i - 1;
        while j >= left && arr[j] > key {
            arr[j+1] = arr[j];
            j -= 1;
        }
        arr[j+1] = key;
    }
}

proc merge(ref arr: [] int, left: int, mid: int, right: int) {
    var lp = arr[left..mid];
    var rp = arr[mid+1..right];
    var i = 0; var j = 0; var k = left;
    while i < lp.size && j < rp.size {
        if lp[i] <= rp[j] { arr[k] = lp[i]; i += 1; }
        else { arr[k] = rp[j]; j += 1; }
        k += 1;
    }
    while i < lp.size { arr[k] = lp[i]; i += 1; k += 1; }
    while j < rp.size { arr[k] = rp[j]; j += 1; k += 1; }
}

proc timsort(ref arr: [] int) {
    var n = arr.size;
    var i = 0;
    while i < n {
        insertionSort(arr, i, min(i + MIN_RUN - 1, n - 1));
        i += MIN_RUN;
    }
    var sz = MIN_RUN;
    while sz < n {
        var left = 0;
        while left < n {
            var mid = min(left + sz - 1, n - 1);
            var right = min(left + 2*sz - 1, n - 1);
            if mid < right then merge(arr, left, mid, right);
            left += 2 * sz;
        }
        sz *= 2;
    }
}

var arr = [5, 2, 8, 1, 9, 3, 7, 4, 6];
timsort(arr);
writeln(arr);
