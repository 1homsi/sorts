cycleSort: arr = (
    | n writes cycleStart item pos i tmp |
    n := arr size.
    writes := 0.
    cycleStart := 0.
    [cycleStart < (n - 1)] whileTrue: [
        item := arr at: cycleStart.
        pos := cycleStart.
        i := cycleStart + 1.
        [i < n] whileTrue: [
            (arr at: i) < item ifTrue: [pos := pos + 1].
            i := i + 1.
        ].
        pos = cycleStart ifFalse: [
            [item = (arr at: pos)] whileTrue: [pos := pos + 1].
            tmp := arr at: pos.
            arr at: pos put: item.
            item := tmp.
            writes := writes + 1.
            [pos = cycleStart] whileFalse: [
                pos := cycleStart.
                i := cycleStart + 1.
                [i < n] whileTrue: [
                    (arr at: i) < item ifTrue: [pos := pos + 1].
                    i := i + 1.
                ].
                [item = (arr at: pos)] whileTrue: [pos := pos + 1].
                tmp := arr at: pos.
                arr at: pos put: item.
                item := tmp.
                writes := writes + 1.
            ].
        ].
        cycleStart := cycleStart + 1.
    ].
    arr
).
