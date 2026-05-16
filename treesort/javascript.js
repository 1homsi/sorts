class Node {
    constructor(val) {
        this.val = val;
        this.left = null;
        this.right = null;
    }
}

function insert(node, val) {
    if (node === null) return new Node(val);
    if (val < node.val) node.left = insert(node.left, val);
    else node.right = insert(node.right, val);
    return node;
}

function inorder(node, result) {
    if (node === null) return;
    inorder(node.left, result);
    result.push(node.val);
    inorder(node.right, result);
}

function treesort(arr) {
    let root = null;
    for (const val of arr) root = insert(root, val);
    const result = [];
    inorder(root, result);
    return result;
}

console.log(treesort([5, 3, 7, 1, 4, 6, 8]));
