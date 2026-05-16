begin
  record node(value, left, right);

  procedure insert(node, val);
  value val;
  reference node;
  reference result;
  begin
    if node = null then
      result := new node(val, null, null)
    else if val < node.value then
      insert(node.left, val);
      result := node
    else if val > node.value then
      insert(node.right, val);
      result := node
    else
      result := node
  end;

  procedure inorder(node);
  reference node;
  begin
    if node ≠ null then begin
      inorder(node.left);
      print(node.value);
      inorder(node.right)
    end
  end;

  integer array arr[1:6];
  reference root;
  integer i;
  arr[1] := 5; arr[2] := 2; arr[3] := 8;
  arr[4] := 1; arr[5] := 9; arr[6] := 3;
  root := null;
  for i := 1 step 1 until 6 do
    insert(root, arr[i]);
  inorder(root)
end
