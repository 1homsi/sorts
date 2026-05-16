type Node {
  value: int
  left: Node?
  right: Node?
}

fn insert(node: Node?, val: int) -> Node {
  if (node == nil) {
    return Node{value: val}
  }
  let n = node!
  if (val < n.value) {
    n.left = insert(n.left, val)
  } else if (val > n.value) {
    n.right = insert(n.right, val)
  }
  return n
}

fn inorder(node: Node?) {
  if (node != nil) {
    let n = node!
    inorder(n.left)
    println(n.value)
    inorder(n.right)
  }
}

fn main() {
  let arr = [5, 2, 8, 1, 9, 3]
  var root: Node? = nil
  for (val in arr) {
    root = insert(root, val)
  }
  inorder(root)
}
