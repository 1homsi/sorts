class Node {
  int value;
  Node @left;
  Node @right;
}

Node@ Insert(Node@ node, int val) {
  if (node is null) {
    Node @n = Node();
    n.value = val;
    return n;
  }
  if (val < node.value) {
    @node.left = Insert(node.left, val);
  } else if (val > node.value) {
    @node.right = Insert(node.right, val);
  }
  return node;
}

void Inorder(Node@ node) {
  if (node is not null) {
    Inorder(node.left);
    print(node.value + "\n");
    Inorder(node.right);
  }
}

void main() {
  int arr[] = {5, 2, 8, 1, 9, 3};
  Node @root;
  for (uint i = 0; i < arr.length(); i++) {
    @root = Insert(root, arr[i]);
  }
  Inorder(root);
}
