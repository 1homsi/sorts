bitonicSort = (| arr lo cnt dir |
    compareAndSwap: i with: j dir: direction = (
        | ai aj tmp |
        ai: arr at: i.
        aj: arr at: j.
        (direction = (ai > aj)) ifTrue: [
            arr at: i put: aj.
            arr at: j put: ai.
        ]
    ).

    bitonicMerge: lo count: cnt dir: direction = (
        cnt > 1 ifTrue: [
            | k |
            k: cnt // 2.
            lo to: lo + k - 1 do: [:i |
                compareAndSwap: i with: i + k dir: direction.
            ].
            bitonicMerge: lo count: k dir: direction.
            bitonicMerge: lo + k count: k dir: direction.
        ]
    ).

    bitonicSort: lo count: cnt dir: direction = (
        cnt > 1 ifTrue: [
            | k |
            k: cnt // 2.
            bitonicSort: lo count: k dir: true.
            bitonicSort: lo + k count: k dir: false.
            bitonicMerge: lo count: cnt dir: direction.
        ]
    ).

    arr: (3, 7, 4, 8, 6, 2, 1, 5) asArray.
    bitonicSort: 0 count: arr size dir: true.
    arr printString printNl.
)
