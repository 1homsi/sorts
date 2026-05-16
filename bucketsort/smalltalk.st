| insertionSort bucketSort data sorted |

insertionSort := [:bucket |
    | arr n key j |
    arr := bucket asOrderedCollection.
    n := arr size.
    2 to: n do: [:i |
        key := arr at: i.
        j := i - 1.
        [j >= 1 and: [(arr at: j) > key]] whileTrue: [
            arr at: j + 1 put: (arr at: j).
            j := j - 1.
        ].
        arr at: j + 1 put: key.
    ].
    arr asArray
].

bucketSort := [:arr |
    | n minV maxV buckets result |
    n := arr size.
    n = 0 ifTrue: [arr] ifFalse: [
        minV := arr inject: arr first into: [:m :v | m min: v].
        maxV := arr inject: arr first into: [:m :v | m max: v].
        buckets := Array new: n withAll: OrderedCollection new.
        buckets := buckets collect: [:each | OrderedCollection new].
        arr do: [:num |
            | idx |
            idx := ((num - minV) / (maxV - minV + 1) * n) truncated.
            idx := idx min: n - 1.
            (buckets at: idx + 1) add: num.
        ].
        result := OrderedCollection new.
        buckets do: [:b |
            (insertionSort value: b asArray) do: [:v | result add: v].
        ].
        result asArray
    ]
].

data := #(0.78 0.17 0.39 0.26 0.72 0.94 0.21 0.12 0.23 0.68).
sorted := bucketSort value: data.
Transcript showCr: sorted printString.
