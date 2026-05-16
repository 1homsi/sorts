const std = @import("std");

fn cocktailSort(arr: []i32) void {
    var swapped = true;
    var start: usize = 0;
    var end: usize = arr.len - 1;
    while (swapped) {
        swapped = false;
        var i: usize = start;
        while (i < end) : (i += 1) {
            if (arr[i] > arr[i + 1]) {
                const tmp = arr[i];
                arr[i] = arr[i + 1];
                arr[i + 1] = tmp;
                swapped = true;
            }
        }
        if (!swapped) break;
        swapped = false;
        end -= 1;
        var j: usize = end - 1;
        while (j >= start) {
            if (arr[j] > arr[j + 1]) {
                const tmp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = tmp;
                swapped = true;
            }
            if (j == 0) break;
            j -= 1;
        }
        start += 1;
    }
}
