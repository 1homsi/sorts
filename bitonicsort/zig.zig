const std = @import("std");

fn compareAndSwap(arr: []i32, i: usize, j: usize, direction: bool) void {
    if (direction == (arr[i] > arr[j])) {
        const tmp = arr[i];
        arr[i] = arr[j];
        arr[j] = tmp;
    }
}

fn bitonicMerge(arr: []i32, lo: usize, cnt: usize, direction: bool) void {
    if (cnt > 1) {
        const k = cnt / 2;
        var i: usize = lo;
        while (i < lo + k) : (i += 1) {
            compareAndSwap(arr, i, i + k, direction);
        }
        bitonicMerge(arr, lo, k, direction);
        bitonicMerge(arr, lo + k, k, direction);
    }
}

fn bitonicSort(arr: []i32, lo: usize, cnt: usize, direction: bool) void {
    if (cnt > 1) {
        const k = cnt / 2;
        bitonicSort(arr, lo, k, true);
        bitonicSort(arr, lo + k, k, false);
        bitonicMerge(arr, lo, cnt, direction);
    }
}

pub fn main() void {
    var data = [_]i32{ 3, 7, 4, 8, 6, 2, 1, 5 };
    bitonicSort(&data, 0, data.len, true);
    std.debug.print("{any}\n", .{data});
}
