radixSort = (|
    getDigit: x exp: e = (x // e \\ 10).

    countingSort: arr exp: e = (|
        result = List new.
    |
        0 to: 9 do: [:d |
            arr do: [:x |
                (getDigit: x exp: e) = d ifTrue: [result add: x]
            ]
        ].
        result
    ).

    sort: arr = (|
        maxVal.
        exp = 1.
        result.
    |
        arr isEmpty ifTrue: [^arr].
        maxVal: (arr inject: 0 into: [:m :x | x > m ifTrue: [x] ifFalse: [m]]).
        result: arr copy.
        [maxVal // exp > 0] whileTrue: [
            result: (countingSort: result exp: exp).
            exp: exp * 10.
        ].
        result
    ).
|).

(radixSort sort: (List withAll: #(170 45 75 90 802 24 2 66))) printNl.
