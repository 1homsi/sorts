(
var insert = { |node, val|
  if (node.isNil) {
    (value: val, left: nil, right: nil)
  } {
    if (val < node.value) {
      (value: node.value, left: insert.(node.left, val), right: node.right)
    } {
      if (val > node.value) {
        (value: node.value, left: node.left, right: insert.(node.right, val))
      } {
        node
      }
    }
  }
};

var inorder = { |node, result|
  if (node.isNil) {
    result
  } {
    var left = inorder.(node.left, result);
    var withNode = left ++ [node.value];
    inorder.(node.right, withNode)
  }
};

var arr = [5, 2, 8, 1, 9, 3];
var root = nil;
arr.do { |val| root = insert.(root, val); };
var sorted = inorder.(root, []);
sorted.postln;
)
