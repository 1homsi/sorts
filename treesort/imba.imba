class Node
    def constructor v
        val = v
        left = null
        right = null

def insert(node, val)
    unless node
        return new Node(val)
    if val < node.val
        node.left = insert(node.left, val)
    else
        node.right = insert(node.right, val)
    node

def inorder(node, result)
    return unless node
    inorder(node.left, result)
    result.push(node.val)
    inorder(node.right, result)

def treesort(arr)
    let root = null
    var r = root
    for v in arr
        r = insert(r, v)
    let result = []
    inorder(r, result)
    result

console.log treesort([5, 3, 7, 1, 4, 6, 8])
