| arr |

arr := #(3 7 4 8 6 2 1 5) asOrderedCollection.

BitonicSorter := Object subclass: #BitonicSorter
    instanceVariableNames: 'arr'
    classVariableNames: ''
    poolDictionaries: ''
    category: ''.

BitonicSorter class >> sort: anArray [
    | sorter |
    sorter := self new.
    sorter setArray: anArray.
    sorter bitonicSort: 1 count: anArray size direction: true.
    ^anArray
]

BitonicSorter >> setArray: anArray [
    arr := anArray
]

BitonicSorter >> compareAndSwap: i with: j direction: dir [
    | tmp |
    (dir = (arr at: i) > (arr at: j)) ifTrue: [
        tmp := arr at: i.
        arr at: i put: (arr at: j).
        arr at: j put: tmp
    ]
]

BitonicSorter >> bitonicMerge: lo count: cnt direction: dir [
    | k |
    cnt > 1 ifTrue: [
        k := cnt // 2.
        lo to: lo + k - 1 do: [:i | self compareAndSwap: i with: i + k direction: dir].
        self bitonicMerge: lo count: k direction: dir.
        self bitonicMerge: lo + k count: k direction: dir
    ]
]

BitonicSorter >> bitonicSort: lo count: cnt direction: dir [
    | k |
    cnt > 1 ifTrue: [
        k := cnt // 2.
        self bitonicSort: lo count: k direction: true.
        self bitonicSort: lo + k count: k direction: false.
        self bitonicMerge: lo count: cnt direction: dir
    ]
]

| data sorter |
data := #(3 7 4 8 6 2 1 5) asArray.
sorter := BitonicSorter new.
sorter setArray: data.
sorter bitonicSort: 1 count: data size direction: true.
Transcript showCr: data printString.
