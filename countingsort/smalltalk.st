Object subclass: #CountingSort
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: ''

CountingSort class >> sort: anArray [
    | min max range count output n |
    anArray isEmpty ifTrue: [ ^anArray ].
    min := anArray inject: anArray first into: [:m :v | v < m ifTrue: [v] ifFalse: [m]].
    max := anArray inject: anArray first into: [:m :v | v > m ifTrue: [v] ifFalse: [m]].
    range := max - min + 1.
    count := Array new: range withAll: 0.
    anArray do: [:v | count at: v - min + 1 put: (count at: v - min + 1) + 1].
    2 to: range do: [:i | count at: i put: (count at: i) + (count at: i - 1)].
    n := anArray size.
    output := Array new: n.
    n to: 1 by: -1 do: [:i |
        | v idx pos |
        v := anArray at: i.
        idx := v - min + 1.
        pos := count at: idx.
        count at: idx put: pos - 1.
        output at: pos put: v].
    ^output
]

| result |
result := CountingSort sort: #(4 2 2 8 3 3 1).
Transcript showCr: result printString.
