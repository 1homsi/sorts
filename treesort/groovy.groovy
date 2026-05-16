class Node {
    int val
    Node left, right
    Node(int v) { val = v }
}

Node insert(Node node, int val) {
    if (node == null) return new Node(val)
    if (val < node.val) node.left = insert(node.left, val)
    else node.right = insert(node.right, val)
    node
}

void inorder(Node node, List result) {
    if (node == null) return
    inorder(node.left, result)
    result << node.val
    inorder(node.right, result)
}

List treesort(List arr) {
    Node root = null
    arr.each { root = insert(root, it) }
    def result = []
    inorder(root, result)
    result
}

println treesort([5, 3, 7, 1, 4, 6, 8])
