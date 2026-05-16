const std = @import("std");

const Node = struct {
    val: i64,
    left: ?*Node,
    right: ?*Node,
};

fn insert(allocator: std.mem.Allocator, node: ?*Node, val: i64) !*Node {
    if (node == null) {
        const n = try allocator.create(Node);
        n.* = Node{ .val = val, .left = null, .right = null };
        return n;
    }
    const n = node.?;
    if (val < n.val) {
        n.left = try insert(allocator, n.left, val);
    } else {
        n.right = try insert(allocator, n.right, val);
    }
    return n;
}

fn inorder(node: ?*Node, result: *std.ArrayList(i64)) !void {
    if (node == null) return;
    const n = node.?;
    try inorder(n.left, result);
    try result.append(n.val);
    try inorder(n.right, result);
}

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    const arr = [_]i64{ 5, 3, 7, 1, 4, 6, 8 };
    var root: ?*Node = null;
    for (arr) |v| {
        root = try insert(allocator, root, v);
    }
    var result = std.ArrayList(i64).init(allocator);
    try inorder(root, &result);
    const stdout = std.io.getStdOut().writer();
    for (result.items) |v| {
        try stdout.print("{} ", .{v});
    }
    try stdout.print("\n", .{});
}
