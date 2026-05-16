bubbleSort: arr = (
    | n swapped tmp |
    n: arr size.
    swapped: true.
    [swapped] whileTrue: [
        swapped: false.
        0 to: n - 2 do: [:i |
            (arr at: i) > (arr at: i + 1) ifTrue: [
                tmp: arr at: i.
                arr at: i put: (arr at: i + 1).
                arr at: i + 1 put: tmp.
                swapped: true.
            ].
        ].
        n: n - 1.
    ].
    arr
)

| arr |
arr: (Array new: 7).
arr at: 0 put: 64. arr at: 1 put: 34. arr at: 2 put: 25. arr at: 3 put: 12.
arr at: 4 put: 22. arr at: 5 put: 11. arr at: 6 put: 90.
(bubbleSort: arr) printString printNl.
