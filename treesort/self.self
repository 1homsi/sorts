node = (|
    val <- 0.
    left <- nil.
    right <- nil.

    withVal: v = (|n|
        n: copy.
        n val: v.
        n left: nil.
        n right: nil.
        n
    ).

    insert: v = (
        v < val ifTrue: [
            left isNil
                ifTrue: [left: (copy withVal: v)]
                ifFalse: [left insert: v]
        ] ifFalse: [
            right isNil
                ifTrue: [right: (copy withVal: v)]
                ifFalse: [right insert: v]
        ]
    ).

    inorder: result = (
        left isNil ifFalse: [left inorder: result].
        result addLast: val.
        right isNil ifFalse: [right inorder: result].
    ).
|).

treesort = (|root. result. arr|
    arr: (5, 3, 7, 1, 4, 6, 8).
    root: nil.
    arr do: [|:v| root isNil
        ifTrue: [root: node withVal: v]
        ifFalse: [root insert: v]].
    result: OrderedCollection new.
    root inorder: result.
    result
).

treesort printString.
