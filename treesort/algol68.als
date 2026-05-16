BEGIN
    MODE NODE = STRUCT(INT val, REF NODE left, REF NODE right);

    PROC insert = (REF REF NODE node, INT v) VOID:
    BEGIN
        IF node IS NIL THEN
            node := HEAP NODE;
            val OF node := v;
            left OF node := NIL;
            right OF node := NIL
        ELIF v < val OF node THEN
            insert(left OF node, v)
        ELSE
            insert(right OF node, v)
        FI
    END;

    PROC inorder = (REF NODE node) VOID:
    BEGIN
        IF node ISNT NIL THEN
            inorder(left OF node);
            print((val OF node, " "));
            inorder(right OF node)
        FI
    END;

    REF NODE root := NIL;
    []INT arr = (5, 3, 7, 1, 4, 6, 8);
    FOR i FROM 1 TO 7 DO
        insert(root, arr[i])
    OD;
    inorder(root);
    print(newline)
END
