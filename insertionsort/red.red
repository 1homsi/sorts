Red []

insertion-sort: function [arr [block!]] [
    n: length? arr
    repeat i n - 1 [
        key: arr/(i + 1)
        j: i
        while [all [j >= 1 arr/j > key]] [
            arr/(j + 1): arr/j
            j: j - 1
        ]
        arr/(j + 1): key
    ]
    arr
]
