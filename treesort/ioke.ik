Node = Origin mimic do(
    withVal = method(v,
        n = self mimic
        n val = v
        n left = nil
        n right = nil
        n
    )

    insert = method(v,
        if(v < @val,
            if(@left nil?,
                @left = Node withVal(v),
                @left insert(v)),
            if(@right nil?,
                @right = Node withVal(v),
                @right insert(v)))
    )

    inorder = method(result,
        unless(@left nil?, @left inorder(result))
        result << @val
        unless(@right nil?, @right inorder(result))
    )
)

treesort = method(arr,
    root = nil
    arr each(v,
        if(root nil?,
            root = Node withVal(v),
            root insert(v)))
    result = []
    unless(root nil?, root inorder(result))
    result
)

treesort([5, 3, 7, 1, 4, 6, 8]) println
