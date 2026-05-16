type Node = ref object
  val: int
  left, right: Node

proc insert(node: Node, v: int): Node =
  if node == nil:
    return Node(val: v, left: nil, right: nil)
  if v < node.val:
    node.left = insert(node.left, v)
  else:
    node.right = insert(node.right, v)
  node

proc inorder(node: Node, result: var seq[int]) =
  if node == nil: return
  inorder(node.left, result)
  result.add(node.val)
  inorder(node.right, result)

proc treesort(arr: seq[int]): seq[int] =
  var root: Node = nil
  for v in arr:
    root = insert(root, v)
  inorder(root, result)

echo treesort(@[5, 3, 7, 1, 4, 6, 8])
