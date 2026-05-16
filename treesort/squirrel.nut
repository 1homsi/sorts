function insert(node, val) {
  if (node == null) {
    return { value = val, left = null, right = null };
  }
  if (val < node.value) {
    node.left = insert(node.left, val);
  } else if (val > node.value) {
    node.right = insert(node.right, val);
  }
  return node;
}

function inorder(node, result) {
  if (node == null) return result;
  result = inorder(node.left, result);
  result.push(node.value);
  return inorder(node.right, result);
}

function treeSort(arr) {
  local root = null;
  foreach (val in arr) {
    root = insert(root, val);
  }
  return inorder(root, []);
}

print(treeSort([5, 2, 8, 1, 9, 3]));
