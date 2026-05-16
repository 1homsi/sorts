| arr n |

arr := #(12 11 13 5 6 7) asOrderedCollection.
n := arr size.

heapify := [:a :sz :i |
    | largest left right tmp |
    largest := i.
    left := (2 * i).
    right := (2 * i) + 1.
    (left <= sz and: [(a at: left) > (a at: largest)]) ifTrue: [largest := left].
    (right <= sz and: [(a at: right) > (a at: largest)]) ifTrue: [largest := right].
    largest ~= i ifTrue: [
        tmp := a at: i.
        a at: i put: (a at: largest).
        a at: largest put: tmp.
        heapify value: a value: sz value: largest
    ]
].

n // 2 to: 1 by: -1 do: [:i | heapify value: arr value: n value: i].
n to: 2 by: -1 do: [:i |
    | tmp |
    tmp := arr at: 1.
    arr at: 1 put: (arr at: i).
    arr at: i put: tmp.
    heapify value: arr value: i - 1 value: 1
].

Transcript showCr: arr printString.
