Object subclass: #InsertionSort
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'Sorting'.

InsertionSort class >> sort: anArray [
    | n key j |
    n := anArray size.
    2 to: n do: [:i |
        key := anArray at: i.
        j := i - 1.
        [j >= 1 and: [(anArray at: j) > key]] whileTrue: [
            anArray at: j + 1 put: (anArray at: j).
            j := j - 1.
        ].
        anArray at: j + 1 put: key.
    ].
    ^anArray
]
