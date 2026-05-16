program TreeSort;

type
  Node = record
    value: integer;
    left: ^Node;
    right: ^Node;
  end;

procedure Insert(var node: Node; val: integer);
begin
  if node.value = 0 then
  begin
    node.value := val;
    new(node.left);
    new(node.right);
  end
  else if val < node.value then
    Insert(node.left^, val)
  else if val > node.value then
    Insert(node.right^, val);
end;

var root: Node;
var arr: array[1..6] of integer;
var i: integer;

begin
  arr[1] := 5; arr[2] := 2; arr[3] := 8;
  arr[4] := 1; arr[5] := 9; arr[6] := 3;

  for i := 1 to 6 do
    Insert(root, arr[i]);
end.
