const std = @import("std");

fn stoogeSort(arr: []i32, first: usize, last: usize) void {
    if (arr[first] > arr[last]) {
        const tmp = arr[first];
        arr[first] = arr[last];
        arr[last] = tmp;
    }
    if (last - first + 1 > 2) {
        const t = (last - first + 1) * 2 / 3;
        stoogeSort(arr, first, first + t - 1);
        stoogeSort(arr, last - t + 1, last);
        stoogeSort(arr, first, first + t - 1);
    }
}

pub fn main() !void {
    var arr = [_]i32{ 3, 1, 4, 1, 5, 9, 2, 6 };
    stoogeSort(&arr, 0, arr.len - 1);
    const stdout = std.io.getStdOut().writer();
    for (arr) |x| {
        try stdout.print("{} ", .{x});
    }
    try stdout.print("\n", .{});
}
