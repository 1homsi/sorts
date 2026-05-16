package TreeSort api;

class Node {
  var val: i64;
  var left: Optional(Node*);
  var right: Optional(Node*);
}

fn Insert(node: Optional(Node*), val: i64) -> Node* {
  if (node.IsEmpty()) {
    var n: Node* = heap.New(Node);
    n->val = val;
    n->left = Optional(Node*).Empty();
    n->right = Optional(Node*).Empty();
    return n;
  }
  var n: Node* = node.Get();
  if (val < n->val) {
    n->left = Optional(Node*)(Insert(n->left, val));
  } else {
    n->right = Optional(Node*)(Insert(n->right, val));
  }
  return n;
}

fn Inorder(node: Optional(Node*), result: Vector(i64)*) {
  if (node.IsEmpty()) { return; }
  var n: Node* = node.Get();
  Inorder(n->left, result);
  result->push_back(n->val);
  Inorder(n->right, result);
}

fn TreeSort(arr: Slice(i64)) -> Vector(i64) {
  var root: Optional(Node*) = Optional(Node*).Empty();
  for (var v: i64 in arr) {
    root = Optional(Node*)(Insert(root, v));
  }
  var result: Vector(i64);
  Inorder(root, &result);
  return result;
}
