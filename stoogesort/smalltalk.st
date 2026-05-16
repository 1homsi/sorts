Object subclass: #StoogeSort
    instanceVariableNames: 'arr'
    classVariableNames: ''
    poolDictionaries: ''
    category: ''.

StoogeSort >> stoogeSort: anArray from: first to: last [
    | tmp t n |
    (anArray at: first) > (anArray at: last) ifTrue: [
        tmp := anArray at: first.
        anArray at: first put: (anArray at: last).
        anArray at: last put: tmp
    ].
    n := last - first + 1.
    n > 2 ifTrue: [
        t := n * 2 // 3.
        self stoogeSort: anArray from: first to: first + t - 1.
        self stoogeSort: anArray from: last - t + 1 to: last.
        self stoogeSort: anArray from: first to: first + t - 1
    ]
]

| sorter arr |
sorter := StoogeSort new.
arr := #(3 1 4 1 5 9 2 6) asOrderedCollection.
sorter stoogeSort: arr from: 1 to: arr size.
Transcript showCr: arr printString.
