class_name TreeSort

class Node:
    var val: int
    var left
    var right
    func _init(v: int):
        val = v
        left = null
        right = null

static func insert(node, val: int):
    if node == null:
        return Node.new(val)
    if val < node.val:
        node.left = insert(node.left, val)
    else:
        node.right = insert(node.right, val)
    return node

static func inorder(node, result: Array):
    if node == null:
        return
    inorder(node.left, result)
    result.append(node.val)
    inorder(node.right, result)

static func treesort(arr: Array) -> Array:
    var root = null
    for v in arr:
        root = insert(root, v)
    var result = []
    inorder(root, result)
    return result

func _ready():
    print(treesort([5, 3, 7, 1, 4, 6, 8]))
