procedure insert;
var val, node;
begin
  if node = 0 then node := 1
  else if val < node then insert
       else if val > node then insert
  end;
  val := node
end;

procedure inorder;
var node;
begin
  if node != 0 then begin
    inorder;
    write(node);
    inorder
  end
end;

begin
  var arr[6];
  var root;
  arr[1] := 5; arr[2] := 2; arr[3] := 8;
  arr[4] := 1; arr[5] := 9; arr[6] := 3;
  root := 0;
  for i := 1 to 6 do
    insert
  end;
  inorder
end
