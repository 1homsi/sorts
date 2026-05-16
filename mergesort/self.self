traits mergesort = (|
    merge: left With: right = (|
        result. i. j.
    | result: orderedCollection new.
      i: 0. j: 0.
      [i < left size & [j < right size]] whileTrue: [
          (left at: i) <= (right at: j)
              ifTrue:  [result add: (left at: i). i: i + 1]
              ifFalse: [result add: (right at: j). j: j + 1].
      ].
      [i < left size] whileTrue: [result add: (left at: i). i: i + 1].
      [j < right size] whileTrue: [result add: (right at: j). j: j + 1].
      result asVector
    )

    mergeSort: arr = (|
        mid. left. right.
    | arr size <= 1 ifTrue: [^arr].
      mid: arr size / 2.
      left: mergeSort: (arr copyFrom: 0 To: mid - 1).
      right: mergeSort: (arr copyFrom: mid To: arr size - 1).
      merge: left With: right
    )
|)

| arr sorted |
arr: vector copyWith: 38 with: 27 with: 43 with: 3 with: 9 with: 82 with: 10.
sorted: traits mergesort mergeSort: arr.
sorted do: [:v | v printNl].
