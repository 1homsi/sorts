class Node {
  int value;
  Node left, right;
  Node(int v) { value = v; }
}

Node insert(Node node, int val) {
  if (node == null) return new Node(val);
  if (val < node.value) node.left = insert(node.left, val);
  else if (val > node.value) node.right = insert(node.right, val);
  return node;
}

void inorder(Node node) {
  if (node != null) {
    inorder(node.left);
    println(node.value);
    inorder(node.right);
  }
}

void setup() {
  int[] arr = {5, 2, 8, 1, 9, 3};
  Node root = null;
  for (int val : arr) root = insert(root, val);
  inorder(root);
  noLoop();
}

void draw() {}
