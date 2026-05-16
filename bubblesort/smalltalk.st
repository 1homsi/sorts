| arr n swapped tmp |
arr := #(64 34 25 12 22 11 90) asOrderedCollection.
n := arr size.
[
    swapped := false.
    1 to: n - 1 do: [:i |
        (arr at: i) > (arr at: i + 1) ifTrue: [
            tmp := arr at: i.
            arr at: i put: (arr at: i + 1).
            arr at: i + 1 put: tmp.
            swapped := true.
        ].
    ].
    n := n - 1.
    swapped
] whileTrue.
Transcript showCr: arr printString.
