(
{
    var bitonicsort = { |arr, lo, cnt, dir|
        if (cnt > 1) {
            var k = (cnt / 2).asInteger;
            arr = bitonicsort.value(arr, lo, k, 1);
            arr = bitonicsort.value(arr, lo + k, k, 0);
            arr = bitonicmerge.value(arr, lo, cnt, dir);
        };
        arr
    };

    var bitonicmerge = { |arr, lo, cnt, dir|
        if (cnt > 1) {
            var k = (cnt / 2).asInteger;
            (lo..(lo + cnt - k - 1)).do { |i|
                if (((arr[i] > arr[i + k]) == (dir == 1))) {
                    var tmp = arr[i];
                    arr[i] = arr[i + k];
                    arr[i + k] = tmp;
                };
            };
            arr = bitonicmerge.value(arr, lo, k, dir);
            arr = bitonicmerge.value(arr, lo + k, k, dir);
        };
        arr
    };

    var arr = [5, 2, 8, 1, 9, 3, 7, 4];
    arr = bitonicsort.value(arr, 0, arr.size, 1);
    arr.postln;
}.value
)
