program Delphi;

{$APPTYPE CONSOLE}

type
  PNode = ^TNode;
  TNode = record
    Val: Integer;
    Left, Right: PNode;
  end;

procedure Insert(var Node: PNode; V: Integer);
begin
  if Node = nil then begin
    New(Node);
    Node^.Val := V;
    Node^.Left := nil;
    Node^.Right := nil;
  end else if V < Node^.Val then
    Insert(Node^.Left, V)
  else
    Insert(Node^.Right, V);
end;

procedure Inorder(Node: PNode);
begin
  if Node = nil then Exit;
  Inorder(Node^.Left);
  Write(Node^.Val, ' ');
  Inorder(Node^.Right);
end;

var
  Root: PNode;
  Arr: array[0..6] of Integer = (5, 3, 7, 1, 4, 6, 8);
  I: Integer;
begin
  Root := nil;
  for I := 0 to 6 do Insert(Root, Arr[I]);
  Inorder(Root);
  Writeln;
end.
