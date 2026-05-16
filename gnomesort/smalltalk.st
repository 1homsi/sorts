| gnomeSort |
gnomeSort := [:arr |
    | i n temp |
    i := 1.
    n := arr size.
    [i <= n] whileTrue: [
        (i = 1 or: [(arr at: i) >= (arr at: i - 1)])
            ifTrue: [i := i + 1]
            ifFalse: [
                temp := arr at: i.
                arr at: i put: (arr at: i - 1).
                arr at: i - 1 put: temp.
                i := i - 1
            ]
    ].
    arr
].
