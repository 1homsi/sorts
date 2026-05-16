REBOL []

insertion-sort: func [arr [block!]] [
    n: length? arr
    repeat i n - 1 [
        key: arr/(i + 1)
        j: i
        while [j >= 1 and (arr/j > key)] [
            arr/(j + 1): arr/j
            j: j - 1
        ]
        arr/(j + 1): key
    ]
    arr
]
