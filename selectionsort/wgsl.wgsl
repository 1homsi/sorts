fn selection_sort(arr: ptr<function, array<i32, 10>>, n: i32) {
    for (var i = 0; i < n - 1; i++) {
        var min_idx = i;
        for (var j = i + 1; j < n; j++) {
            if ((*arr)[j] < (*arr)[min_idx]) {
                min_idx = j;
            }
        }
        let tmp = (*arr)[i];
        (*arr)[i] = (*arr)[min_idx];
        (*arr)[min_idx] = tmp;
    }
}
