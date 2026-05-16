const std = @import("std");

fn cycleSort(arr: []i32) usize {
    var writes: usize = 0;
    const n = arr.len;
    var cycleStart: usize = 0;
    while (cycleStart < n - 1) : (cycleStart += 1) {
        var item = arr[cycleStart];
        var pos = cycleStart;
        var i = cycleStart + 1;
        while (i < n) : (i += 1) {
            if (arr[i] < item) pos += 1;
        }
        if (pos == cycleStart) continue;
        while (item == arr[pos]) pos += 1;
        const tmp = arr[pos];
        arr[pos] = item;
        item = tmp;
        writes += 1;
        while (pos != cycleStart) {
            pos = cycleStart;
            i = cycleStart + 1;
            while (i < n) : (i += 1) {
                if (arr[i] < item) pos += 1;
            }
            while (item == arr[pos]) pos += 1;
            const t = arr[pos];
            arr[pos] = item;
            item = t;
            writes += 1;
        }
    }
    return writes;
}

pub fn main() void {
    var arr = [_]i32{ 5, 4, 3, 2, 1 };
    _ = cycleSort(&arr);
    const stdout = std.io.getStdOut().writer();
    for (arr) |v| {
        stdout.print("{d} ", .{v}) catch {};
    }
    stdout.print("\n", .{}) catch {};
}
