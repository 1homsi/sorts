selectionSort: anArray
    | n minIdx tmp |
    n := anArray size.
    1 to: n - 1 do: [:i |
        minIdx := i.
        i + 1 to: n do: [:j |
            (anArray at: j) < (anArray at: minIdx)
                ifTrue: [minIdx := j]].
        tmp := anArray at: i.
        anArray at: i put: (anArray at: minIdx).
        anArray at: minIdx put: tmp].
    ^anArray
