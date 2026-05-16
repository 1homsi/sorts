const std = @import("std");

fn selectionSort(arr: []i32) void {
    const n = arr.len;
    var i: usize = 0;
    while (i < n) : (i += 1) {
        var min_idx = i;
        var j = i + 1;
        while (j < n) : (j += 1) {
            if (arr[j] < arr[min_idx]) min_idx = j;
        }
        const tmp = arr[i];
        arr[i] = arr[min_idx];
        arr[min_idx] = tmp;
    }
}
