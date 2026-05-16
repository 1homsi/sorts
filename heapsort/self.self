heapsort = (| arr |
    heapify: arr size: n at: i = (|largest. left. right. tmp|
        largest: i.
        left: (2 * i) + 1.
        right: (2 * i) + 2.
        (left < n) && ((arr at: left) > (arr at: largest)) ifTrue: [largest: left].
        (right < n) && ((arr at: right) > (arr at: largest)) ifTrue: [largest: right].
        largest != i ifTrue: [
            tmp: arr at: i.
            arr at: i put: (arr at: largest).
            arr at: largest put: tmp.
            heapify: arr size: n at: largest
        ]
    ).

    sort: aList = (| n. i. tmp |
        arr: aList.
        n: arr size.
        i: (n / 2) - 1.
        [i >= 0] whileTrue: [heapify: arr size: n at: i. i: i - 1].
        i: n - 1.
        [i > 0] whileTrue: [
            tmp: arr at: 0.
            arr at: 0 put: (arr at: i).
            arr at: i put: tmp.
            heapify: arr size: i at: 0.
            i: i - 1
        ].
        arr
    )
).

| result |
result: heapsort sort: (Array new: 6 withAll: 0).
result printString printNl.
