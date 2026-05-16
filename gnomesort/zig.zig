const std = @import("std");

fn gnomeSort(arr: []i32) void {
    var i: usize = 0;
    while (i < arr.len) {
        if (i == 0 or arr[i] >= arr[i - 1]) {
            i += 1;
        } else {
            const tmp = arr[i];
            arr[i] = arr[i - 1];
            arr[i - 1] = tmp;
            i -= 1;
        }
    }
}
