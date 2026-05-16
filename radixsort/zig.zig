const std = @import("std");

fn countingSort(arr: []u32, exp: u32) void {
    const n = arr.len;
    var output = std.heap.page_allocator.alloc(u32, n) catch unreachable;
    defer std.heap.page_allocator.free(output);
    var count = [_]u32{0} ** 10;
    for (arr) |x| count[(x / exp) % 10] += 1;
    var i: usize = 1;
    while (i < 10) : (i += 1) count[i] += count[i - 1];
    var j: usize = n;
    while (j > 0) : (j -= 1) {
        const idx = (arr[j - 1] / exp) % 10;
        count[idx] -= 1;
        output[count[idx]] = arr[j - 1];
    }
    @memcpy(arr, output);
}

fn radixSort(arr: []u32) void {
    if (arr.len == 0) return;
    var max: u32 = arr[0];
    for (arr) |x| if (x > max) { max = x; };
    var exp: u32 = 1;
    while (max / exp > 0) : (exp *= 10) countingSort(arr, exp);
}

pub fn main() !void {
    var arr = [_]u32{ 170, 45, 75, 90, 802, 24, 2, 66 };
    radixSort(&arr);
    const stdout = std.io.getStdOut().writer();
    try stdout.print("{any}\n", .{arr});
}
