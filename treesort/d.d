import std.stdio;

struct Node {
    int val;
    Node* left, right;
}

Node* insert(Node* node, int val) {
    if (node is null) {
        auto n = new Node(val, null, null);
        return n;
    }
    if (val < node.val) node.left = insert(node.left, val);
    else node.right = insert(node.right, val);
    return node;
}

void inorder(Node* node, ref int[] result) {
    if (node is null) return;
    inorder(node.left, result);
    result ~= node.val;
    inorder(node.right, result);
}

int[] treesort(int[] arr) {
    Node* root = null;
    foreach (v; arr) root = insert(root, v);
    int[] result;
    inorder(root, result);
    return result;
}

void main() {
    writeln(treesort([5, 3, 7, 1, 4, 6, 8]));
}
