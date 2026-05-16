public class TreeNode {
  int value;
  TreeNode left;
  TreeNode right;

  fun void init(int v) { value = v; left = null; right = null; }
}

fun TreeNode insert(TreeNode node, int val) {
  if (node == null) {
    TreeNode n;
    new TreeNode @=> n;
    n.init(val);
    return n;
  }
  if (val < node.value) {
    insert(node.left, val) @=> node.left;
  } else if (val > node.value) {
    insert(node.right, val) @=> node.right;
  }
  return node;
}

fun void inorder(TreeNode node) {
  if (node != null) {
    inorder(node.left);
    <<< node.value >>>;
    inorder(node.right);
  }
}

null @=> TreeNode root;
[5, 2, 8, 1, 9, 3] @=> int arr[];
for (0 => int i; i < arr.cap(); i++) {
  insert(root, arr[i]) @=> root;
}
inorder(root);
