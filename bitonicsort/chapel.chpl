var arr: [0..7] int = [3, 7, 4, 8, 6, 2, 1, 5];

proc compareAndSwap(ref a: [] int, i: int, j: int, direction: bool) {
    if direction == (a[i] > a[j]) {
        var tmp = a[i];
        a[i] = a[j];
        a[j] = tmp;
    }
}

proc bitonicMerge(ref a: [] int, lo: int, cnt: int, direction: bool) {
    if cnt > 1 {
        var k = cnt / 2;
        for i in lo..lo+k-1 {
            compareAndSwap(a, i, i+k, direction);
        }
        bitonicMerge(a, lo, k, direction);
        bitonicMerge(a, lo+k, k, direction);
    }
}

proc bitonicSort(ref a: [] int, lo: int, cnt: int, direction: bool) {
    if cnt > 1 {
        var k = cnt / 2;
        bitonicSort(a, lo, k, true);
        bitonicSort(a, lo+k, k, false);
        bitonicMerge(a, lo, cnt, direction);
    }
}

bitonicSort(arr, 0, arr.size, true);
writeln(arr);
