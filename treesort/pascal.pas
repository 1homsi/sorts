program TreeSort;

type
  PNode = ^TNode;
  TNode = record
    val: integer;
    left, right: PNode;
  end;

procedure insert(var node: PNode; v: integer);
begin
  if node = nil then begin
    New(node);
    node^.val := v;
    node^.left := nil;
    node^.right := nil;
  end else if v < node^.val then
    insert(node^.left, v)
  else
    insert(node^.right, v);
end;

procedure inorder(node: PNode);
begin
  if node = nil then exit;
  inorder(node^.left);
  write(node^.val, ' ');
  inorder(node^.right);
end;

var
  root: PNode;
  arr: array[1..7] of integer = (5, 3, 7, 1, 4, 6, 8);
  i: integer;
begin
  root := nil;
  for i := 1 to 7 do insert(root, arr[i]);
  inorder(root);
  writeln;
end.
