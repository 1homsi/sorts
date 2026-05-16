class Node
    new: (v) =>
        @val = v
        @left = nil
        @right = nil

insert = (node, val) ->
    return Node(val) unless node
    if val < node.val
        node.left = insert(node.left, val)
    else
        node.right = insert(node.right, val)
    node

inorder = (node, result) ->
    return unless node
    inorder(node.left, result)
    table.insert(result, node.val)
    inorder(node.right, result)

treesort = (arr) ->
    root = nil
    for v in *arr
        root = insert(root, v)
    result = {}
    inorder(root, result)
    result

sorted = treesort {5, 3, 7, 1, 4, 6, 8}
print(table.concat(sorted, " "))
