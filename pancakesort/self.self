pancakeSort = (|
    flip: arr k = (|
        left <- 0.
        right <- k.
    |
        [left < right] whileTrue: [
            tmp <- arr at: left.
            arr at: left put: (arr at: right).
            arr at: right put: tmp.
            left <- left + 1.
            right <- right - 1.
        ].
    ).

    findMaxIdx: arr size: sz = (|
        maxIdx <- 0.
        i <- 1.
    |
        [i < sz] whileTrue: [
            (arr at: i) > (arr at: maxIdx) ifTrue: [maxIdx <- i].
            i <- i + 1.
        ].
        maxIdx.
    ).

    sort: arr = (|
        size <- arr size.
        maxIdx.
    |
        [size > 1] whileTrue: [
            maxIdx <- findMaxIdx: arr size: size.
            maxIdx = (size - 1) ifFalse: [
                maxIdx = 0 ifFalse: [flip: arr k: maxIdx].
                flip: arr k: (size - 1).
            ].
            size <- size - 1.
        ].
        arr.
    ).
|).
