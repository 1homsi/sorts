use fmt;

type node = struct {
  value: int,
  left: *node,
  right: *node,
};

fn insert(n: *node, val: int) *node = {
  if (n == null) {
    let new_node = alloc(node {
      value = val,
      left = null,
      right = null,
    });
    return new_node;
  };
  if (val < n.value) {
    n.left = insert(n.left, val);
  } else if (val > n.value) {
    n.right = insert(n.right, val);
  };
  return n;
};

fn inorder(n: *node) void = {
  if (n != null) {
    inorder(n.left);
    fmt::println(n.value);
    inorder(n.right);
  };
};

export fn main() void = {
  let arr = [5, 2, 8, 1, 9, 3];
  let mut root: *node = null;
  for (let i = 0z; i < len(arr); i += 1) {
    root = insert(root, arr[i]);
  };
  inorder(root);
};
