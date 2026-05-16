Object subclass: #Quicksorter
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: ''.

Quicksorter class >> sort: anArray [
    ^self sort: anArray from: 1 to: anArray size
]

Quicksorter class >> sort: arr from: low to: high [
    | pivot i tmp |
    low < high ifFalse: [^arr].
    pivot := arr at: high.
    i := low.
    low to: high - 1 do: [:j |
        (arr at: j) <= pivot ifTrue: [
            tmp := arr at: i.
            arr at: i put: (arr at: j).
            arr at: j put: tmp.
            i := i + 1.
        ].
    ].
    tmp := arr at: i.
    arr at: i put: (arr at: high).
    arr at: high put: tmp.
    self sort: arr from: low to: i - 1.
    self sort: arr from: i + 1 to: high.
    ^arr
]

| arr |
arr := #(3 6 8 10 1 2 1) asOrderedCollection asArray.
Transcript showCr: (Quicksorter sort: arr) printString.
