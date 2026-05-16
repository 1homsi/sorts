| arr n writes cycleStart item pos tmp |
arr := #(5 4 3 2 1) asOrderedCollection.
n := arr size.
writes := 0.

1 to: n - 1 do: [:cycleStartIdx |
    item := arr at: cycleStartIdx.
    pos := cycleStartIdx.
    cycleStartIdx + 1 to: n do: [:i |
        (arr at: i) < item ifTrue: [pos := pos + 1].
    ].
    pos ~= cycleStartIdx ifTrue: [
        [item = (arr at: pos)] whileTrue: [pos := pos + 1].
        tmp := arr at: pos.
        arr at: pos put: item.
        item := tmp.
        writes := writes + 1.
        [pos ~= cycleStartIdx] whileTrue: [
            pos := cycleStartIdx.
            cycleStartIdx + 1 to: n do: [:i |
                (arr at: i) < item ifTrue: [pos := pos + 1].
            ].
            [item = (arr at: pos)] whileTrue: [pos := pos + 1].
            tmp := arr at: pos.
            arr at: pos put: item.
            item := tmp.
            writes := writes + 1.
        ].
    ].
].

Transcript showCr: arr printString.
