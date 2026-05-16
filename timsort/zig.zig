const std = @import("std");

const MIN_RUN: usize = 32;

fn insertionSort(arr: []i64, left: usize, right: usize) void {
    var i: usize = left + 1;
    while (i <= right) : (i += 1) {
        const key = arr[i];
        var j: usize = i;
        while (j > left and arr[j - 1] > key) : (j -= 1) {
            arr[j] = arr[j - 1];
        }
        arr[j] = key;
    }
}

fn merge(arr: []i64, left: usize, mid: usize, right: usize, allocator: std.mem.Allocator) !void {
    const ln = mid - left + 1;
    const rn = right - mid;
    const lp = try allocator.alloc(i64, ln);
    defer allocator.free(lp);
    const rp = try allocator.alloc(i64, rn);
    defer allocator.free(rp);
    @memcpy(lp, arr[left .. mid + 1]);
    @memcpy(rp, arr[mid + 1 .. right + 1]);
    var i: usize = 0;
    var j: usize = 0;
    var k: usize = left;
    while (i < ln and j < rn) {
        if (lp[i] <= rp[j]) {
            arr[k] = lp[i];
            i += 1;
        } else {
            arr[k] = rp[j];
            j += 1;
        }
        k += 1;
    }
    while (i < ln) : (i += 1) { arr[k] = lp[i]; k += 1; }
    while (j < rn) : (j += 1) { arr[k] = rp[j]; k += 1; }
}

fn timsort(arr: []i64, allocator: std.mem.Allocator) !void {
    const n = arr.len;
    var i: usize = 0;
    while (i < n) : (i += MIN_RUN) {
        const right = @min(i + MIN_RUN - 1, n - 1);
        insertionSort(arr, i, right);
    }
    var size: usize = MIN_RUN;
    while (size < n) : (size *= 2) {
        var left: usize = 0;
        while (left < n) : (left += 2 * size) {
            const mid = @min(left + size - 1, n - 1);
            const right = @min(left + 2 * size - 1, n - 1);
            if (mid < right) try merge(arr, left, mid, right, allocator);
        }
    }
}

pub fn main() !void {
    var arr = [_]i64{ 5, 2, 8, 1, 9, 3, 7, 4, 6 };
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    try timsort(&arr, gpa.allocator());
    const stdout = std.io.getStdOut().writer();
    for (arr) |v| try stdout.print("{d} ", .{v});
    try stdout.print("\n", .{});
}
