type Node is {int val, Node|null left, Node|null right}

function insert(Node|null node, int val) -> Node:
    if node is null:
        return {val: val, left: null, right: null}
    if val < node.val:
        node.left = insert(node.left, val)
    else:
        node.right = insert(node.right, val)
    return node

function inorder(Node|null node, int[] result, int idx) -> (int[] r, int i):
    if node is null:
        return result, idx
    result, idx = inorder(node.left, result, idx)
    result[idx] = node.val
    idx = idx + 1
    result, idx = inorder(node.right, result, idx)
    return result, idx

function treesort(int[] arr) -> int[]:
    Node|null root = null
    for v in arr:
        root = insert(root, v)
    int[] result = [0; |arr|]
    result, _ = inorder(root, result, 0)
    return result

method main(System.Console console):
    int[] sorted = treesort([5, 3, 7, 1, 4, 6, 8])
    console.out.println(sorted)
