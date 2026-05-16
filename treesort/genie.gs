[indent=4]
uses Gee

class Node : Object
    val: int
    left: Node?
    right: Node?
    construct(v: int)
        val = v
        left = null
        right = null

def insert(node: Node?, val: int): Node
    if node == null
        return new Node(val)
    if val < node.val
        node.left = insert(node.left, val)
    else
        node.right = insert(node.right, val)
    return node

def inorder(node: Node?, result: ArrayList of int)
    if node == null
        return
    inorder(node.left, result)
    result.add(node.val)
    inorder(node.right, result)

def treesort(arr: array of int): array of int
    root: Node? = null
    for v in arr
        root = insert(root, v)
    result: ArrayList of int = new ArrayList of int
    inorder(root, result)
    return result.to_array()

init
    arr: array of int = {5, 3, 7, 1, 4, 6, 8}
    sorted: array of int = treesort(arr)
    for v in sorted
        stdout.printf("%d ", v)
    print ""
