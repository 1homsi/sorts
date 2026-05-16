const std = @import("std");

fn merge(allocator: std.mem.Allocator, left: []i32, right: []i32) ![]i32 {
    var result = try allocator.alloc(i32, left.len + right.len);
    var i: usize = 0;
    var j: usize = 0;
    var k: usize = 0;
    while (i < left.len and j < right.len) {
        if (left[i] <= right[j]) {
            result[k] = left[i];
            i += 1;
        } else {
            result[k] = right[j];
            j += 1;
        }
        k += 1;
    }
    while (i < left.len) : (i += 1) {
        result[k] = left[i];
        k += 1;
    }
    while (j < right.len) : (j += 1) {
        result[k] = right[j];
        k += 1;
    }
    return result;
}

fn mergeSort(allocator: std.mem.Allocator, arr: []i32) ![]i32 {
    if (arr.len <= 1) return arr;
    const mid = arr.len / 2;
    const left = try mergeSort(allocator, arr[0..mid]);
    const right = try mergeSort(allocator, arr[mid..]);
    return merge(allocator, left, right);
}

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    var arr = [_]i32{ 38, 27, 43, 3, 9, 82, 10 };
    const sorted = try mergeSort(allocator, &arr);
    for (sorted) |v| {
        std.debug.print("{} ", .{v});
    }
    std.debug.print("\n", .{});
}
