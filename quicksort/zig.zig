const std = @import("std");

fn partition(arr: []i32, low: usize, high: usize) usize {
    const pivot = arr[high];
    var i: usize = low;
    var j: usize = low;
    while (j < high) : (j += 1) {
        if (arr[j] <= pivot) {
            std.mem.swap(i32, &arr[i], &arr[j]);
            i += 1;
        }
    }
    std.mem.swap(i32, &arr[i], &arr[high]);
    return i;
}

fn quicksort(arr: []i32, low: usize, high: usize) void {
    if (low < high) {
        const p = partition(arr, low, high);
        if (p > 0) quicksort(arr, low, p - 1);
        quicksort(arr, p + 1, high);
    }
}

pub fn main() void {
    var arr = [_]i32{ 3, 6, 8, 10, 1, 2, 1 };
    quicksort(&arr, 0, arr.len - 1);
    std.debug.print("{any}\n", .{arr});
}
