var<workgroup> arr: array<i32, 256>;

fn gnomeSort(n: i32) {
    var i: i32 = 0;
    loop {
        if (i >= n) { break; }
        if (i == 0 || arr[i] >= arr[i - 1]) {
            i = i + 1;
        } else {
            let tmp = arr[i];
            arr[i] = arr[i - 1];
            arr[i - 1] = tmp;
            i = i - 1;
        }
    }
}
