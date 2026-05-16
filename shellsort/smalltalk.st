| arr n gap i j temp |
arr := #(64 34 25 12 22 11 90) asOrderedCollection.
n := arr size.
gap := n // 2.
[gap > 0] whileTrue: [
    i := gap + 1.
    [i <= n] whileTrue: [
        temp := arr at: i.
        j := i.
        [(j > gap) and: [(arr at: j - gap) > temp]] whileTrue: [
            arr at: j put: (arr at: j - gap).
            j := j - gap.
        ].
        arr at: j put: temp.
        i := i + 1.
    ].
    gap := gap // 2.
].
Transcript showCr: arr printString.
