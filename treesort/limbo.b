implement TreeSort;

include "sys.m";
include "draw.m";

TreeSort: module {
  init: fn(nil: ref Draw->Context, nil: list of string);
};

Node: adt {
  Val: int;
  Left: ref Node;
  Right: ref Node;
};

init(nil: ref Draw->Context, nil: list of string) {
  sys := load Sys Sys->PATH;

  insert := func(node: ref Node, val: int): ref Node {
    if (node == nil) {
      return ref Node(Val => val, Left => nil, Right => nil);
    }
    if (val < node.Val) {
      node.Left = insert(node.Left, val);
    } else if (val > node.Val) {
      node.Right = insert(node.Right, val);
    }
    return node;
  };
}
