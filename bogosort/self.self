isSorted: arr = (
    | n |
    n := arr size.
    1 to: n - 1 do: [:i |
        (arr at: i) > (arr at: i + 1) ifTrue: [^false]
    ].
    ^true
)

shuffle: arr = (
    | n j tmp |
    n := arr size.
    n to: 2 by: -1 do: [:i |
        j := (random * i) floor + 1.
        tmp := arr at: i.
        arr at: i put: (arr at: j).
        arr at: j put: tmp
    ]
)

bogosort: arr = (
    [self isSorted: arr] whileFalse: [self shuffle: arr].
    ^arr
)

| arr |
arr := OrderedCollection withAll: #(3 1 4 1 5 9 2 6).
Transcript show: (self bogosort: arr) printString.
