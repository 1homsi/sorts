const std = @import("std");

fn insertionSort(arr: []i32) void {
    var i: usize = 1;
    while (i < arr.len) : (i += 1) {
        const key = arr[i];
        var j: i32 = @as(i32, @intCast(i)) - 1;
        while (j >= 0 and arr[@intCast(j)] > key) : (j -= 1) {
            arr[@intCast(j + 1)] = arr[@intCast(j)];
        }
        arr[@intCast(j + 1)] = key;
    }
}
