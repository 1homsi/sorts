REBOL []

selection-sort: function [arr [block!]] [
    n: length? arr
    repeat i n [
        min-idx: i
        j: i + 1
        while [j <= n] [
            if arr/(j) < arr/(min-idx) [min-idx: j]
            j: j + 1
        ]
        tmp: arr/(i)
        arr/(i): arr/(min-idx)
        arr/(min-idx): tmp
    ]
    arr
]
probe selection-sort [5 3 1 4 2]
