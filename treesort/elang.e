def makeNode(v) {
    var left := null
    var right := null
    def node {
        to val() { v }
        to left() { left }
        to right() { right }
        to setLeft(n) { left := n }
        to setRight(n) { right := n }
    }
    node
}

def insert(node, val) {
    if (node == null) { return makeNode(val) }
    if (val < node.val()) {
        node.setLeft(insert(node.left(), val))
    } else {
        node.setRight(insert(node.right(), val))
    }
    node
}

def inorder(node, result) {
    if (node == null) { return }
    inorder(node.left(), result)
    result.push(node.val())
    inorder(node.right(), result)
}

def treesort(arr) {
    var root := null
    for v in arr { root := insert(root, v) }
    def result := [].diverge()
    inorder(root, result)
    result.snapshot()
}

println(treesort([5, 3, 7, 1, 4, 6, 8]))
