const std = @import("std");

fn bubbleSort(arr: []i32) void {
    var n = arr.len;
    var swapped = true;
    while (swapped) {
        swapped = false;
        var i: usize = 0;
        while (i < n - 1) : (i += 1) {
            if (arr[i] > arr[i + 1]) {
                const tmp = arr[i];
                arr[i] = arr[i + 1];
                arr[i + 1] = tmp;
                swapped = true;
            }
        }
        n -= 1;
    }
}

pub fn main() !void {
    var arr = [_]i32{ 64, 34, 25, 12, 22, 11, 90 };
    bubbleSort(&arr);
    std.debug.print("{any}\n", .{arr});
}
