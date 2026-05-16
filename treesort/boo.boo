import System.Collections.Generic

class Node:
    public val as int
    public left as Node
    public right as Node
    def constructor(v as int):
        val = v
        left = null
        right = null

def insert(node as Node, val as int) as Node:
    if node is null:
        return Node(val)
    if val < node.val:
        node.left = insert(node.left, val)
    else:
        node.right = insert(node.right, val)
    return node

def inorder(node as Node, result as List[of int]):
    if node is null:
        return
    inorder(node.left, result)
    result.Add(node.val)
    inorder(node.right, result)

def treesort(arr as (int)) as List[of int]:
    root as Node = null
    for v in arr:
        root = insert(root, v)
    result = List[of int]()
    inorder(root, result)
    return result

print(treesort((5, 3, 7, 1, 4, 6, 8)))
