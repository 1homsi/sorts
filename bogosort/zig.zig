const std = @import("std");

fn isSorted(arr: []const i32) bool {
    var i: usize = 0;
    while (i < arr.len - 1) : (i += 1) {
        if (arr[i] > arr[i + 1]) return false;
    }
    return true;
}

fn bogosort(arr: []i32, rng: *std.rand.Random) void {
    while (!isSorted(arr)) {
        std.rand.shuffle(rng.*, i32, arr);
    }
}

pub fn main() !void {
    var arr = [_]i32{ 3, 1, 4, 1, 5, 9, 2, 6 };
    var prng = std.rand.DefaultPrng.init(42);
    var rng = prng.random();
    bogosort(&arr, &rng);
    const stdout = std.io.getStdOut().writer();
    for (arr) |v| {
        try stdout.print("{d} ", .{v});
    }
    try stdout.print("\n", .{});
}
