MODULE TreeSort;
FROM InOut IMPORT WriteInt, WriteLn;
FROM Storage IMPORT ALLOCATE;

TYPE
    NodePtr = POINTER TO Node;
    Node = RECORD
        val: INTEGER;
        left, right: NodePtr;
    END;

VAR root: NodePtr;
    arr: ARRAY [0..6] OF INTEGER;
    i: INTEGER;

PROCEDURE Insert(VAR n: NodePtr; v: INTEGER);
VAR newNode: NodePtr;
BEGIN
    IF n = NIL THEN
        ALLOCATE(newNode, SIZE(Node));
        newNode^.val := v;
        newNode^.left := NIL;
        newNode^.right := NIL;
        n := newNode;
    ELSIF v < n^.val THEN
        Insert(n^.left, v);
    ELSE
        Insert(n^.right, v);
    END;
END Insert;

PROCEDURE Inorder(n: NodePtr);
BEGIN
    IF n = NIL THEN RETURN; END;
    Inorder(n^.left);
    WriteInt(n^.val, 4);
    Inorder(n^.right);
END Inorder;

BEGIN
    arr[0]:=5; arr[1]:=3; arr[2]:=7; arr[3]:=1;
    arr[4]:=4; arr[5]:=6; arr[6]:=8;
    root := NIL;
    FOR i := 0 TO 6 DO
        Insert(root, arr[i]);
    END;
    Inorder(root);
    WriteLn;
END TreeSort.
