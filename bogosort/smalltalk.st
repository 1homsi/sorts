| arr |
arr := #(3 1 4 1 5 9 2 6) asOrderedCollection.

| isSorted |
isSorted := [:a |
    | sorted |
    sorted := true.
    1 to: a size - 1 do: [:i |
        (a at: i) > (a at: i + 1) ifTrue: [sorted := false]].
    sorted].

| shuffle |
shuffle := [:a |
    | n j tmp |
    n := a size.
    n to: 2 by: -1 do: [:i |
        j := (Random new next * i) truncated + 1.
        tmp := a at: i.
        a at: i put: (a at: j).
        a at: j put: tmp].
    a].

[isSorted value: arr] whileFalse: [shuffle value: arr].
Transcript showCr: arr printString.
