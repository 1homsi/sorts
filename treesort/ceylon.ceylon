shared void run() {
    class Node(shared variable Integer val,
               shared variable Node? left = null,
               shared variable Node? right = null) {}

    Node insert(Node? node, Integer val) {
        if (is Null node) {
            return Node(val);
        }
        if (val < node.val) {
            node.left = insert(node.left, val);
        } else {
            node.right = insert(node.right, val);
        }
        return node;
    }

    void inorder(Node? node, variable Integer[] result) {
        if (is Null node) { return; }
        inorder(node.left, result);
        result = result.append([node.val]);
        inorder(node.right, result);
    }

    value arr = [5, 3, 7, 1, 4, 6, 8];
    variable Node? root = null;
    for (v in arr) {
        root = insert(root, v);
    }
    variable Integer[] result = [];
    inorder(root, result);
    print(result);
}
