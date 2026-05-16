timsort = (|
    minRun = 32.

    insertionSort: arr from: left to: right = (|
        i <- left + 1.
        key. j.
    |
        [i <= right] whileTrue: [
            key: arr at: i.
            j: i - 1.
            [j >= left and: [(arr at: j) > key]] whileTrue: [
                arr at: j + 1 put: (arr at: j).
                j: j - 1.
            ].
            arr at: j + 1 put: key.
            i: i + 1.
        ].
    ).

    merge: arr from: left mid: mid to: right = (|
        lp. rp. i <- 0. j <- 0. k <- left.
    |
        lp: arr copyFrom: left to: mid.
        rp: arr copyFrom: mid + 1 to: right.
        [i < lp size and: [j < rp size]] whileTrue: [
            (lp at: i) <= (rp at: j)
                ifTrue: [arr at: k put: (lp at: i). i: i + 1.]
                ifFalse: [arr at: k put: (rp at: j). j: j + 1.].
            k: k + 1.
        ].
        [i < lp size] whileTrue: [arr at: k put: (lp at: i). i: i+1. k: k+1.].
        [j < rp size] whileTrue: [arr at: k put: (rp at: j). j: j+1. k: k+1.].
    ).

    sort: arr = (|
        n <- arr size. i <- 0. size <- minRun. left. mid. right.
    |
        [i < n] whileTrue: [
            insertionSort: arr from: i to: ((i + minRun - 1) min: n - 1).
            i: i + minRun.
        ].
        [size < n] whileTrue: [
            left: 0.
            [left < n] whileTrue: [
                mid: (left + size - 1) min: n - 1.
                right: (left + 2 * size - 1) min: n - 1.
                mid < right ifTrue: [merge: arr from: left mid: mid to: right].
                left: left + 2 * size.
            ].
            size: size * 2.
        ].
        arr
    ).
|).
