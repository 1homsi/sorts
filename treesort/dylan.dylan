module: treesort

define class <node> (<object>)
  slot val :: <integer>, required-init-keyword: val:;
  slot left :: false-or(<node>) = #f;
  slot right :: false-or(<node>) = #f;
end class;

define function insert(node :: false-or(<node>), v :: <integer>) => (result :: <node>)
  if (~node)
    make(<node>, val: v)
  elseif (v < node.val)
    node.left := insert(node.left, v);
    node
  else
    node.right := insert(node.right, v);
    node
  end if
end function;

define function inorder(node :: false-or(<node>), result :: <list>) => (result :: <list>)
  if (~node)
    result
  else
    let r1 = inorder(node.left, result);
    let r2 = add!(r1, node.val);
    inorder(node.right, r2)
  end if
end function;

define function treesort(arr :: <sequence>) => (result :: <list>)
  let root = reduce(insert, #f, arr);
  inorder(root, #())
end function;

format-out("%=\n", treesort(#(5, 3, 7, 1, 4, 6, 8)));
