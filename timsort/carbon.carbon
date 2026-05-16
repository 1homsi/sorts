package TimSort api;

fn InsertionSort(arr: [i64; 9]*, left: i32, right: i32) {
    var i: i32 = left + 1;
    while (i <= right) {
        var key: i64 = (*arr)[i];
        var j: i32 = i - 1;
        while (j >= left and (*arr)[j] > key) {
            (*arr)[j + 1] = (*arr)[j];
            j = j - 1;
        }
        (*arr)[j + 1] = key;
        i = i + 1;
    }
}

fn Merge(arr: [i64; 9]*, left: i32, mid: i32, right: i32) {
    var lp: [i64; 256] = {0};
    var rp: [i64; 256] = {0};
    var ln: i32 = mid - left + 1;
    var rn: i32 = right - mid;
    var k: i32 = 0;
    while (k < ln) { lp[k] = (*arr)[left + k]; k = k + 1; }
    k = 0;
    while (k < rn) { rp[k] = (*arr)[mid + 1 + k]; k = k + 1; }
    var i: i32 = 0;
    var j: i32 = 0;
    k = left;
    while (i < ln and j < rn) {
        if (lp[i] <= rp[j]) { (*arr)[k] = lp[i]; i = i + 1; }
        else { (*arr)[k] = rp[j]; j = j + 1; }
        k = k + 1;
    }
    while (i < ln) { (*arr)[k] = lp[i]; i = i + 1; k = k + 1; }
    while (j < rn) { (*arr)[k] = rp[j]; j = j + 1; k = k + 1; }
}

fn Main() -> i32 {
    var arr: [i64; 9] = {5, 2, 8, 1, 9, 3, 7, 4, 6};
    var n: i32 = 9;
    var min_run: i32 = 32;
    var i: i32 = 0;
    while (i < n) {
        var right: i32 = if i + min_run - 1 < n then i + min_run - 1 else n - 1;
        InsertionSort(&arr, i, right);
        i = i + min_run;
    }
    return 0;
}
