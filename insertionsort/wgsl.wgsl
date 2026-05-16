fn insertionSort(arr: ptr<function, array<i32, 16>>, n: i32) {
    var i: i32 = 1;
    loop {
        if (i >= n) { break; }
        let key: i32 = (*arr)[i];
        var j: i32 = i - 1;
        loop {
            if (j < 0 || (*arr)[j] <= key) { break; }
            (*arr)[j + 1] = (*arr)[j];
            j = j - 1;
        }
        (*arr)[j + 1] = key;
        i = i + 1;
    }
}
