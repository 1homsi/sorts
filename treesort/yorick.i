struct TreeNode {
  int value;
  pointer left;
  pointer right;
};

func insert(node, val) {
  if (is_void(node)) {
    return &TreeNode(value=val, left=[], right=[]);
  }
  if (val < (*node).value) {
    (*node).left = insert((*node).left, val);
  } else if (val > (*node).value) {
    (*node).right = insert((*node).right, val);
  }
  return node;
}

func inorder(node) {
  if (!is_void(node)) {
    inorder((*node).left);
    write, (*node).value, format="%d\n";
    inorder((*node).right);
  }
}

arr = [5, 2, 8, 1, 9, 3];
root = [];
for (i = 1; i <= numberof(arr); i++) {
  root = insert(root, arr(i));
}
inorder(root);
