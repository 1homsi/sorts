class Node : Object {
    public int val;
    public Node? left;
    public Node? right;
    public Node(int v) {
        val = v;
        left = null;
        right = null;
    }
}

Node insert(Node? node, int val) {
    if (node == null) return new Node(val);
    if (val < node.val) node.left = insert(node.left, val);
    else node.right = insert(node.right, val);
    return node;
}

void inorder(Node? node, Gee.ArrayList<int> result) {
    if (node == null) return;
    inorder(node.left, result);
    result.add(node.val);
    inorder(node.right, result);
}

int[] treesort(int[] arr) {
    Node? root = null;
    foreach (int v in arr) root = insert(root, v);
    var result = new Gee.ArrayList<int>();
    inorder(root, result);
    return result.to_array();
}

void main() {
    int[] arr = {5, 3, 7, 1, 4, 6, 8};
    int[] sorted = treesort(arr);
    foreach (int v in sorted) stdout.printf("%d ", v);
    stdout.printf("\n");
}
