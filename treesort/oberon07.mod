MODULE TreeSort;
  IMPORT Out;

  TYPE Node = POINTER TO RECORD
    value: INTEGER;
    left, right: Node;
  END;

  PROCEDURE Insert(node: Node; val: INTEGER): Node;
    VAR n: Node;
  BEGIN
    IF node = NIL THEN
      NEW(n);
      n.value := val;
      n.left := NIL;
      n.right := NIL;
      RETURN n;
    END;
    IF val < node.value THEN
      node.left := Insert(node.left, val);
    ELSIF val > node.value THEN
      node.right := Insert(node.right, val);
    END;
    RETURN node;
  END Insert;

  PROCEDURE Inorder(node: Node);
  BEGIN
    IF node # NIL THEN
      Inorder(node.left);
      Out.Int(node.value, 0);
      Out.Ln;
      Inorder(node.right);
    END;
  END Inorder;

  VAR root: Node;
      arr: ARRAY 6 OF INTEGER;
      i: INTEGER;

BEGIN
  arr[0] := 5; arr[1] := 2; arr[2] := 8;
  arr[3] := 1; arr[4] := 9; arr[5] := 3;
  root := NIL;
  FOR i := 0 TO 5 DO
    root := Insert(root, arr[i]);
  END;
  Inorder(root);
END TreeSort.
