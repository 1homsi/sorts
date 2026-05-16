package StoogeSort api;

fn StoogeSort(arr: [i32; 8]*, first: i32, last: i32) -> () {
    if ((*arr)[first] > (*arr)[last]) {
        var tmp: i32 = (*arr)[first];
        (*arr)[first] = (*arr)[last];
        (*arr)[last] = tmp;
    }
    if (last - first + 1 > 2) {
        var t: i32 = (last - first + 1) * 2 / 3;
        StoogeSort(arr, first, first + t - 1);
        StoogeSort(arr, last - t + 1, last);
        StoogeSort(arr, first, first + t - 1);
    }
}

fn Main() -> i32 {
    var arr: [i32; 8] = (3, 1, 4, 1, 5, 9, 2, 6);
    StoogeSort(&arr, 0, 7);
    return 0;
}
