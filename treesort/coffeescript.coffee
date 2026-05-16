class Node
  constructor: (@val) ->
    @left = null
    @right = null

insert = (node, val) ->
  unless node then return new Node(val)
  if val < node.val then node.left = insert(node.left, val)
  else node.right = insert(node.right, val)
  node

inorder = (node, result) ->
  return unless node
  inorder(node.left, result)
  result.push(node.val)
  inorder(node.right, result)

treesort = (arr) ->
  root = null
  root = insert(root, val) for val in arr
  result = []
  inorder(root, result)
  result

console.log treesort([5, 3, 7, 1, 4, 6, 8])
