MODULE TreeSort EXPORTS Main;
IMPORT IO, Fmt;

TYPE
    NodeRef = REF Node;
    Node = RECORD
        val: INTEGER;
        left, right: NodeRef := NIL;
    END;

PROCEDURE Insert(VAR n: NodeRef; v: INTEGER) =
BEGIN
    IF n = NIL THEN
        n := NEW(NodeRef, val := v, left := NIL, right := NIL);
    ELSIF v < n.val THEN
        Insert(n.left, v);
    ELSE
        Insert(n.right, v);
    END;
END Insert;

PROCEDURE Inorder(n: NodeRef) =
BEGIN
    IF n = NIL THEN RETURN; END;
    Inorder(n.left);
    IO.Put(Fmt.Int(n.val) & " ");
    Inorder(n.right);
END Inorder;

VAR
    root: NodeRef := NIL;
    arr := ARRAY [0..6] OF INTEGER{5, 3, 7, 1, 4, 6, 8};
BEGIN
    FOR i := 0 TO 6 DO
        Insert(root, arr[i]);
    END;
    Inorder(root);
    IO.Put("\n");
END TreeSort.
