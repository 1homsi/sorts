| arr countingSort radixSort |

countingSort := [:a :exp |
    | n output count |
    n := a size.
    output := Array new: n.
    count := Array new: 10 withAll: 0.
    1 to: n do: [:i |
        | idx |
        idx := (a at: i) // exp \\ 10 + 1.
        count at: idx put: (count at: idx) + 1].
    2 to: 10 do: [:i |
        count at: i put: (count at: i) + (count at: i - 1)].
    n to: 1 by: -1 do: [:i |
        | idx pos |
        idx := (a at: i) // exp \\ 10 + 1.
        pos := count at: idx.
        output at: pos put: (a at: i).
        count at: idx put: pos - 1].
    1 to: n do: [:i | a at: i put: (output at: i)]].

radixSort := [:a |
    | max exp |
    max := a inject: a first into: [:m :x | x > m ifTrue: [x] ifFalse: [m]].
    exp := 1.
    [max // exp > 0] whileTrue: [
        countingSort value: a value: exp.
        exp := exp * 10]].

arr := #(170 45 75 90 802 24 2 66) asOrderedCollection asArray.
radixSort value: arr.
Transcript show: arr printString; nl.
