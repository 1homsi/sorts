import ballerina/io;

type Node record {
    int val;
    Node? left = ();
    Node? right = ();
};

function insert(Node? node, int val) returns Node {
    if node is () {
        return {val: val};
    }
    if val < node.val {
        node.left = insert(node.left, val);
    } else {
        node.right = insert(node.right, val);
    }
    return node;
}

function inorder(Node? node, int[] result) {
    if node is () { return; }
    inorder(node.left, result);
    result.push(node.val);
    inorder(node.right, result);
}

function treesort(int[] arr) returns int[] {
    Node? root = ();
    foreach int val in arr {
        root = insert(root, val);
    }
    int[] result = [];
    inorder(root, result);
    return result;
}

public function main() {
    io:println(treesort([5, 3, 7, 1, 4, 6, 8]));
}
