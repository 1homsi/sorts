const std = @import("std");

fn heapify(arr: []i32, n: usize, i: usize) void {
    var largest = i;
    const left = 2 * i + 1;
    const right = 2 * i + 2;
    if (left < n and arr[left] > arr[largest]) largest = left;
    if (right < n and arr[right] > arr[largest]) largest = right;
    if (largest != i) {
        const tmp = arr[i];
        arr[i] = arr[largest];
        arr[largest] = tmp;
        heapify(arr, n, largest);
    }
}

fn heapsort(arr: []i32) void {
    const n = arr.len;
    var i: usize = n / 2;
    while (i > 0) {
        i -= 1;
        heapify(arr, n, i);
    }
    var j: usize = n - 1;
    while (j > 0) : (j -= 1) {
        const tmp = arr[0];
        arr[0] = arr[j];
        arr[j] = tmp;
        heapify(arr, j, 0);
    }
}

pub fn main() void {
    var arr = [_]i32{ 12, 11, 13, 5, 6, 7 };
    heapsort(&arr);
    std.debug.print("{any}\n", .{arr});
}
