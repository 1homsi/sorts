| arr stoogeSort |
arr := (3@1@4@1@5@9@2@6) printString.
stoogeSort := [|:a :first :last |
    (a at: first) > (a at: last) ifTrue: [
        | tmp |
        tmp := a at: first.
        a at: first put: (a at: last).
        a at: last put: tmp.
    ].
    (last - first + 1) > 2 ifTrue: [
        | t |
        t := (last - first + 1) * 2 // 3.
        stoogeSort value: a value: first value: first + t - 1.
        stoogeSort value: a value: last - t + 1 value: last.
        stoogeSort value: a value: first value: first + t - 1.
    ].
].
| myArr |
myArr := Array new: 8.
myArr at: 1 put: 3. myArr at: 2 put: 1. myArr at: 3 put: 4. myArr at: 4 put: 1.
myArr at: 5 put: 5. myArr at: 6 put: 9. myArr at: 7 put: 2. myArr at: 8 put: 6.
stoogeSort value: myArr value: 1 value: 8.
myArr printNl.
