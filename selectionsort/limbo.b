implement SelectionSort;

include "sys.m";
include "draw.m";

SelectionSort: module {
    sort: fn(arr: array of int);
};

init(nil: ref Draw->Context, nil: list of string) {
}

sort(arr: array of int) {
    n := len arr;
    for (i := 0; i < n - 1; i++) {
        min_idx := i;
        for (j := i + 1; j < n; j++) {
            if (arr[j] < arr[min_idx]) {
                min_idx = j;
            }
        }
        tmp := arr[i];
        arr[i] = arr[min_idx];
        arr[min_idx] = tmp;
    }
    sys->print("%v\n", arr);
}