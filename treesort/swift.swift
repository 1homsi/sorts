class Node {
    var val: Int
    var left: Node?
    var right: Node?
    init(_ val: Int) { self.val = val }
}

func insert(_ node: Node?, _ val: Int) -> Node {
    guard let node = node else { return Node(val) }
    if val < node.val { node.left = insert(node.left, val) }
    else { node.right = insert(node.right, val) }
    return node
}

func inorder(_ node: Node?, _ result: inout [Int]) {
    guard let node = node else { return }
    inorder(node.left, &result)
    result.append(node.val)
    inorder(node.right, &result)
}

func treesort(_ arr: [Int]) -> [Int] {
    var root: Node? = nil
    for val in arr { root = insert(root, val) }
    var result: [Int] = []
    inorder(root, &result)
    return result
}

print(treesort([5, 3, 7, 1, 4, 6, 8]))
