const std = @import("std");

fn countingSort(allocator: std.mem.Allocator, arr: []i32) ![]i32 {
    if (arr.len == 0) return arr;
    var min = arr[0];
    var max = arr[0];
    for (arr) |v| {
        if (v < min) min = v;
        if (v > max) max = v;
    }
    const range = @intCast(usize, max - min + 1);
    const count = try allocator.alloc(i32, range);
    defer allocator.free(count);
    @memset(count, 0);
    for (arr) |v| count[@intCast(usize, v - min)] += 1;
    var i: usize = 1;
    while (i < range) : (i += 1) count[i] += count[i - 1];
    const output = try allocator.alloc(i32, arr.len);
    var j: usize = arr.len;
    while (j > 0) {
        j -= 1;
        const idx = @intCast(usize, arr[j] - min);
        count[idx] -= 1;
        output[@intCast(usize, count[idx])] = arr[j];
    }
    return output;
}

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    var arr = [_]i32{ 4, 2, 2, 8, 3, 3, 1 };
    const result = try countingSort(allocator, &arr);
    defer allocator.free(result);
    std.debug.print("{any}
", .{result});
}
