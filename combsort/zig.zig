const std = @import("std");

pub fn combSort(arr: []i32) void {
    const n = arr.len;
    var gap: usize = n;
    var sorted = false;
    while (!sorted) {
        gap = @intFromFloat(@as(f64, @floatFromInt(gap)) / 1.3);
        if (gap <= 1) {
            gap = 1;
            sorted = true;
        }
        var i: usize = 0;
        while (i + gap < n) : (i += 1) {
            if (arr[i] > arr[i + gap]) {
                const tmp = arr[i];
                arr[i] = arr[i + gap];
                arr[i + gap] = tmp;
                sorted = false;
            }
        }
    }
}
