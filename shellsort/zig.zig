const std = @import("std");

fn shellSort(arr: []i32) void {
    const n = arr.len;
    var gap: usize = n / 2;
    while (gap > 0) : (gap /= 2) {
        var i: usize = gap;
        while (i < n) : (i += 1) {
            const temp = arr[i];
            var j: usize = i;
            while (j >= gap and arr[j - gap] > temp) : (j -= gap) {
                arr[j] = arr[j - gap];
            }
            arr[j] = temp;
        }
    }
}

pub fn main() !void {
    var arr = [_]i32{ 64, 34, 25, 12, 22, 11, 90 };
    shellSort(&arr);
    const stdout = std.io.getStdOut().writer();
    for (arr) |v| {
        try stdout.print("{} ", .{v});
    }
    try stdout.print("\n", .{});
}
