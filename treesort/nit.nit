class Node
  var value: Int
  var left: Node
  var right: Node

  init(v: Int) do
    value = v
    left = null
    right = null
  end
end

fun insert(node: Node, val: Int): Node do
  if node == null then return new Node(val)
  if val < node.value then
    node.left = insert(node.left, val)
  else if val > node.value then
    node.right = insert(node.right, val)
  end
  return node
end

fun inorder(node: Node): Array[Int] do
  var result = new Array[Int]
  var process: fun(Node) = fun(n: Node) do
    if n != null then
      process(n.left)
      result.push(n.value)
      process(n.right)
    end
  end
  process(node)
  return result
end

var root: Node = null
for val in [5, 2, 8, 1, 9, 3] do root = insert(root, val)
print(inorder(root))
