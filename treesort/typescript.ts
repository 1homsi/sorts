class Node {
    val: number;
    left: Node | null;
    right: Node | null;
    constructor(val: number) {
        this.val = val;
        this.left = null;
        this.right = null;
    }
}

function insert(node: Node | null, val: number): Node {
    if (node === null) return new Node(val);
    if (val < node.val) node.left = insert(node.left, val);
    else node.right = insert(node.right, val);
    return node;
}

function inorder(node: Node | null, result: number[]): void {
    if (node === null) return;
    inorder(node.left, result);
    result.push(node.val);
    inorder(node.right, result);
}

function treesort(arr: number[]): number[] {
    let root: Node | null = null;
    for (const val of arr) root = insert(root, val);
    const result: number[] = [];
    inorder(root, result);
    return result;
}

console.log(treesort([5, 3, 7, 1, 4, 6, 8]));
