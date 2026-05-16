function bitonicsort(arr, lo, cnt, dir) {
    if (cnt > 1) {
        local k = cnt / 2;
        bitonicsort(arr, lo, k, 1);
        bitonicsort(arr, lo + k, k, 0);
        bitonicmerge(arr, lo, cnt, dir);
    }
}

function bitonicmerge(arr, lo, cnt, dir) {
    if (cnt > 1) {
        local k = cnt / 2;
        for (local i = lo; i < lo + cnt - k; i++) {
            if ((arr[i] > arr[i + k]) == (dir == 1)) {
                local tmp = arr[i];
                arr[i] = arr[i + k];
                arr[i + k] = tmp;
            }
        }
        bitonicmerge(arr, lo, k, dir);
        bitonicmerge(arr, lo + k, k, dir);
    }
}

local arr = [5, 2, 8, 1, 9, 3, 7, 4];
bitonicsort(arr, 0, arr.len(), 1);
print(arr);
