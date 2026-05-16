Object subclass: #MergeSort
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'Sorting'.

MergeSort class >> sort: aCollection [
    aCollection size <= 1 ifTrue: [^aCollection].
    | mid left right |
    mid := aCollection size // 2.
    left := self sort: (aCollection copyFrom: 1 to: mid).
    right := self sort: (aCollection copyFrom: mid + 1 to: aCollection size).
    ^self merge: left with: right
]

MergeSort class >> merge: left with: right [
    | result i j |
    result := OrderedCollection new.
    i := 1. j := 1.
    [i <= left size and: [j <= right size]] whileTrue: [
        (left at: i) <= (right at: j)
            ifTrue: [result add: (left at: i). i := i + 1]
            ifFalse: [result add: (right at: j). j := j + 1]].
    [i <= left size] whileTrue: [result add: (left at: i). i := i + 1].
    [j <= right size] whileTrue: [result add: (right at: j). j := j + 1].
    ^result asArray
]

| arr sorted |
arr := #(38 27 43 3 9 82 10).
sorted := MergeSort sort: arr.
Transcript showCr: sorted printString.
