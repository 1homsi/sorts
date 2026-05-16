gnomeSort: arr = (
    | i n tmp |
    i := 0.
    n := arr size.
    [i < n] whileTrue: [
        (i = 0 or: [arr at: i] >= [arr at: i - 1])
            ifTrue: [i := i + 1]
            ifFalse: [
                tmp := arr at: i.
                arr at: i put: (arr at: i - 1).
                arr at: i - 1 put: tmp.
                i := i - 1
            ]
    ].
    arr
)
