Object subclass: #CombSort
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'Sorting'.

CombSort class >> sort: anArray [
    | n gap sorted tmp |
    n := anArray size.
    gap := n.
    sorted := false.
    [ sorted not ] whileTrue: [
        gap := (gap / 1.3) truncated.
        gap < 1 ifTrue: [ gap := 1 ].
        gap = 1 ifTrue: [ sorted := true ].
        1 to: n - gap do: [:i |
            (anArray at: i) > (anArray at: i + gap) ifTrue: [
                tmp := anArray at: i.
                anArray at: i put: (anArray at: i + gap).
                anArray at: i + gap put: tmp.
                sorted := false.
            ].
        ].
    ].
    ^ anArray
]
