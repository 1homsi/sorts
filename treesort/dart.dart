class Node {
  int val;
  Node? left, right;
  Node(this.val);
}

Node insert(Node? node, int val) {
  if (node == null) return Node(val);
  if (val < node.val) node.left = insert(node.left, val);
  else node.right = insert(node.right, val);
  return node;
}

void inorder(Node? node, List<int> result) {
  if (node == null) return;
  inorder(node.left, result);
  result.add(node.val);
  inorder(node.right, result);
}

List<int> treesort(List<int> arr) {
  Node? root;
  for (final val in arr) root = insert(root, val);
  final result = <int>[];
  inorder(root, result);
  return result;
}

void main() => print(treesort([5, 3, 7, 1, 4, 6, 8]));
