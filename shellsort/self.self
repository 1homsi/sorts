shellSort: arr = (
    | n gap i j temp |
    n := arr size.
    gap := n // 2.
    [gap > 0] whileTrue: [
        i := gap.
        [i < n] whileTrue: [
            temp := arr at: i.
            j := i.
            [(j >= gap) & ((arr at: j - gap) > temp)] whileTrue: [
                arr at: j put: (arr at: j - gap).
                j := j - gap.
            ].
            arr at: j put: temp.
            i := i + 1.
        ].
        gap := gap // 2.
    ].
    arr
)
