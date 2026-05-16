const std = @import("std");

fn flip(arr: []i32, k: usize) void {
    var left: usize = 0;
    var right: usize = k;
    while (left < right) {
        const tmp = arr[left];
        arr[left] = arr[right];
        arr[right] = tmp;
        left += 1;
        right -= 1;
    }
}

fn pancakeSort(arr: []i32) void {
    var size: usize = arr.len;
    while (size > 1) {
        var maxIdx: usize = 0;
        var i: usize = 1;
        while (i < size) : (i += 1) {
            if (arr[i] > arr[maxIdx]) maxIdx = i;
        }
        if (maxIdx != size - 1) {
            if (maxIdx != 0) flip(arr, maxIdx);
            flip(arr, size - 1);
        }
        size -= 1;
    }
}

pub fn main() void {
    var arr = [_]i32{ 3, 6, 2, 7, 4, 1, 5 };
    pancakeSort(&arr);
    std.debug.print("{any}\n", .{arr});
}
