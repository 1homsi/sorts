class Node {
    construct new(v) {
        _val = v
        _left = null
        _right = null
    }
    val { _val }
    left { _left }
    right { _right }
    left=(v) { _left = v }
    right=(v) { _right = v }
}

var insert = Fn.new { |node, val|
    if (node == null) return Node.new(val)
    if (val < node.val) node.left = insert.call(node.left, val)
    else node.right = insert.call(node.right, val)
    return node
}

var inorder
inorder = Fn.new { |node, result|
    if (node == null) return
    inorder.call(node.left, result)
    result.add(node.val)
    inorder.call(node.right, result)
}

var treesort = Fn.new { |arr|
    var root = null
    for (v in arr) root = insert.call(root, v)
    var result = []
    inorder.call(root, result)
    return result
}

System.print(treesort.call([5, 3, 7, 1, 4, 6, 8]))
