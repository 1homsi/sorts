const std = @import("std");

fn insertionSort(bucket: []f64) void {
    const n = bucket.len;
    var i: usize = 1;
    while (i < n) : (i += 1) {
        const key = bucket[i];
        var j: usize = i;
        while (j > 0 and bucket[j - 1] > key) : (j -= 1) {
            bucket[j] = bucket[j - 1];
        }
        bucket[j] = key;
    }
}

fn bucketSort(allocator: std.mem.Allocator, arr: []f64) ![]f64 {
    const n = arr.len;
    if (n == 0) return arr;
    var min_v = arr[0];
    var max_v = arr[0];
    for (arr) |v| {
        if (v < min_v) min_v = v;
        if (v > max_v) max_v = v;
    }
    var buckets = try allocator.alloc(std.ArrayList(f64), n);
    defer allocator.free(buckets);
    for (buckets) |*b| b.* = std.ArrayList(f64).init(allocator);
    defer for (buckets) |*b| b.deinit();

    for (arr) |num| {
        var idx = @as(usize, @intFromFloat((num - min_v) / (max_v - min_v + 1) * @as(f64, @floatFromInt(n))));
        if (idx >= n) idx = n - 1;
        try buckets[idx].append(num);
    }
    var result = std.ArrayList(f64).init(allocator);
    defer result.deinit();
    for (buckets) |*b| {
        insertionSort(b.items);
        try result.appendSlice(b.items);
    }
    return try allocator.dupe(f64, result.items);
}

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();
    var data = [_]f64{ 0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68 };
    const sorted = try bucketSort(allocator, &data);
    defer allocator.free(sorted);
    const stdout = std.io.getStdOut().writer();
    for (sorted) |v| try stdout.print("{d:.2} ", .{v});
    try stdout.print("\n", .{});
}
