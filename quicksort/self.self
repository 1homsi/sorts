quicksort: aCollection = (
    | pivot left middle right |
    aCollection size <= 1 ifTrue: [^aCollection].
    pivot := aCollection at: aCollection size // 2.
    left := aCollection select: [:x | x < pivot].
    middle := aCollection select: [:x | x = pivot].
    right := aCollection select: [:x | x > pivot].
    ^(self quicksort: left), middle, (self quicksort: right)
)

| arr |
arr := list copyAddingLast: 3.
arr := arr copyAddingLast: 6.
arr := arr copyAddingLast: 8.
arr := arr copyAddingLast: 10.
arr := arr copyAddingLast: 1.
arr := arr copyAddingLast: 2.
arr := arr copyAddingLast: 1.
(self quicksort: arr) printLine.
