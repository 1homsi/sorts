Node := Object clone do(
    val ::= nil
    left ::= nil
    right ::= nil
    init := method(v,
        val = v
        left = nil
        right = nil
    )
)

insert := method(node, v,
    if(node isNil, return(Node clone init(v)))
    if(v < node val,
        node setLeft(insert(node left, v)),
        node setRight(insert(node right, v))
    )
    node
)

inorder := method(node, result,
    if(node isNil, return)
    inorder(node left, result)
    result append(node val)
    inorder(node right, result)
)

treesort := method(arr,
    root := nil
    arr foreach(v, root = insert(root, v))
    result := list()
    inorder(root, result)
    result
)

treesort(list(5, 3, 7, 1, 4, 6, 8)) println
