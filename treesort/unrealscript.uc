class TreeNode extends Object;

var int Value;
var TreeNode Left;
var TreeNode Right;

function TreeNode Insert(TreeNode Node, int Val) {
  if (Node == None) {
    Node = new class 'TreeNode';
    Node.Value = Val;
    return Node;
  }
  if (Val < Node.Value) {
    Node.Left = Insert(Node.Left, Val);
  } else if (Val > Node.Value) {
    Node.Right = Insert(Node.Right, Val);
  }
  return Node;
}

function void Inorder(TreeNode Node) {
  if (Node != None) {
    Inorder(Node.Left);
    log(Node.Value);
    Inorder(Node.Right);
  }
}

function void TreeSort() {
  local TreeNode Root;
  local int Arr[6];
  local int i;

  Arr[0] = 5; Arr[1] = 2; Arr[2] = 8;
  Arr[3] = 1; Arr[4] = 9; Arr[5] = 3;

  for (i = 0; i < 6; i++) {
    Root = Insert(Root, Arr[i]);
  }
  Inorder(Root);
}
