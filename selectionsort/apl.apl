selectionSort ← {
    arr ← ⍵
    n ← ≢arr
    i ← 0
    :While i < n
        minIdx ← i + ⊃⍒⌽arr[i↓⍳n]
        arr[i minIdx] ← arr[minIdx i]
        i ← i + 1
    :EndWhile
    arr
}
