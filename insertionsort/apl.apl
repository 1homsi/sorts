InsertionSort ← {
    arr ← ⍵
    n ← ≢arr
    :For i :In 1↓⍳n
        key ← arr[i]
        j ← i-1
        :While (j≥0) ∧ (key < arr[j])
            arr[j+1] ← arr[j]
            j ← j-1
        :EndWhile
        arr[j+1] ← key
    :EndFor
    arr
}
