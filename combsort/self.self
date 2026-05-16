traits combSort = (|
    sort: arr = (|
        n = arr size.
        gap = n copy.
        sorted = false copy.
        [sorted not] whileTrue: [
            gap: (gap / 1.3) truncated.
            gap <= 1 ifTrue: [gap: 1. sorted: true].
            0 to: n - gap - 1 do: [:i |
                (arr at: i) > (arr at: i + gap)
                    ifTrue: [
                        | tmp |
                        tmp: arr at: i.
                        arr at: i put: (arr at: i + gap).
                        arr at: i + gap put: tmp.
                        sorted: false.
                    ].
            ].
        ].
        arr
    ).
|)
