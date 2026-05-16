| arr flip findMaxIdx pancakeSort |

arr := #(3 6 2 7 4 1 5) asOrderedCollection.

flip := [:a :k |
    | left right tmp |
    left := 1. right := k + 1.
    [left < right] whileTrue: [
        tmp := a at: left.
        a at: left put: (a at: right).
        a at: right put: tmp.
        left := left + 1.
        right := right - 1.
    ].
].

findMaxIdx := [:a :size |
    | maxIdx |
    maxIdx := 1.
    2 to: size do: [:i |
        ((a at: i) > (a at: maxIdx)) ifTrue: [maxIdx := i].
    ].
    maxIdx
].

pancakeSort := [:a |
    | size maxIdx |
    size := a size.
    [size > 1] whileTrue: [
        maxIdx := findMaxIdx value: a value: size.
        maxIdx ~= size ifTrue: [
            maxIdx ~= 1 ifTrue: [flip value: a value: maxIdx - 1].
            flip value: a value: size - 1.
        ].
        size := size - 1.
    ].
    a
].

Transcript showCr: (pancakeSort value: arr) printString.
