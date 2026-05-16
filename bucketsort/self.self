traits bucketSort = (|
    insertionSort: bucket = (
        | n key j |
        n: bucket size.
        1 to: n - 1 do: [:i |
            key: bucket at: i.
            j: i - 1.
            [j >= 0 && (bucket at: j) > key] whileTrue: [
                bucket at: j + 1 put: (bucket at: j).
                j: j - 1.
            ].
            bucket at: j + 1 put: key.
        ].
        bucket
    ).

    sort: arr = (
        | n minV maxV buckets result idx |
        n: arr size.
        n = 0 ifTrue: [^arr].
        minV: arr first.
        maxV: arr first.
        arr do: [:v |
            v < minV ifTrue: [minV: v].
            v > maxV ifTrue: [maxV: v].
        ].
        buckets: (Array new: n) collect: [:each | OrderedCollection new].
        arr do: [:num |
            idx: ((num - minV) / (maxV - minV + 1) * n) truncated.
            idx >= n ifTrue: [idx: n - 1].
            (buckets at: idx + 1) addLast: num.
        ].
        result: OrderedCollection new.
        buckets do: [:b |
            (self insertionSort: b asArray) do: [:v | result addLast: v].
        ].
        result asArray
    ).
|)

| data sorted |
data: #(0.78 0.17 0.39 0.26 0.72 0.94 0.21 0.12 0.23 0.68).
sorted: traits bucketSort sort: data.
sorted printLine.
