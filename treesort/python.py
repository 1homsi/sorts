class Node:
    def __init__(self, val):
        self.val = val
        self.left = None
        self.right = None

def insert(node, val):
    if node is None:
        return Node(val)
    if val < node.val:
        node.left = insert(node.left, val)
    else:
        node.right = insert(node.right, val)
    return node

def inorder(node, result):
    if node is None:
        return
    inorder(node.left, result)
    result.append(node.val)
    inorder(node.right, result)

def treesort(arr):
    root = None
    for val in arr:
        root = insert(root, val)
    result = []
    inorder(root, result)
    return result

print(treesort([5, 3, 7, 1, 4, 6, 8]))
