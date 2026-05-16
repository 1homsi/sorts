implement BitonicSort;

include "sys.m";
include "draw.m";

BitonicSort: module {
    init: fn(nil: ref Draw->Context, nil: list of string);
};

init(nil: ref Draw->Context, nil: list of string) {
    sys := load Sys Sys->PATH;

    bitonicsort := fn(arr: array of int, lo: int, cnt: int, dir: int) {
        if (cnt > 1) {
            k := cnt / 2;
            bitonicsort(arr, lo, k, 1);
            bitonicsort(arr, lo + k, k, 0);
            bitonicmerge(arr, lo, cnt, dir);
        }
    };

    bitonicmerge := fn(arr: array of int, lo: int, cnt: int, dir: int) {
        if (cnt > 1) {
            k := cnt / 2;
            for (i := lo; i < lo + cnt - k; i++) {
                if ((arr[i] > arr[i + k]) == (dir == 1)) {
                    tmp := arr[i];
                    arr[i] = arr[i + k];
                    arr[i + k] = tmp;
                }
            }
            bitonicmerge(arr, lo, k, dir);
            bitonicmerge(arr, lo + k, k, dir);
        }
    };

    arr := array[8] of {5, 2, 8, 1, 9, 3, 7, 4};
    bitonicsort(arr, 0, 8, 1);
    sys->print("%v\n", arr);
}
