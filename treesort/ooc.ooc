Node: class {
  value: Int
  left: Node
  right: Node

  init: func (v: Int) {
    this value = v
    this left = null
    this right = null
  }
}

insert: func (node: Node, val: Int) -> Node {
  if (node == null) {
    return Node new(val)
  }
  if (val < node value) {
    node left = insert(node left, val)
  } else if (val > node value) {
    node right = insert(node right, val)
  }
  return node
}

inorder: func (node: Node, result: ArrayList<Int>) -> ArrayList<Int> {
  if (node == null) return result
  result = inorder(node left, result)
  result add(node value)
  return inorder(node right, result)
}

treeSort: func (arr: ArrayList<Int>) -> ArrayList<Int> {
  root := null as Node
  arr each(|val| root = insert(root, val))
  return inorder(root, ArrayList<Int> new())
}

arr := ArrayList<Int> new()
arr addAll([5, 2, 8, 1, 9, 3])
treeSort(arr) println()
