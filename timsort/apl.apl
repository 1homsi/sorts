⍝ APL Timsort - uses merge sort on chunked insertion-sorted runs
MinRun←32

InsSort←{
    arr←⍵
    n←≢arr
    1=n:arr
    ⊃{
        v←⍵
        idx←⍸⍺≥v
        (idx↑v),⍺,(idx↓v)
    }/⌽arr
}

MergeTwo←{
    l←⍺ ⋄ r←⍵
    0=≢l:r ⋄ 0=≢r:l
    (⊃l)≤(⊃r):(⊃l),(1↓l)∇r
    (⊃r),l ∇(1↓r)
}

MergeAll←{
    1=≢⍵:⊃⍵
    ∇{⍺ MergeTwo ⍵}/⍵
}

Timsort←{
    arr←⍵
    n←≢arr
    chunks←MinRun(↑,↓)arr
    sorted←InsSort¨chunks
    MergeAll sorted
}

arr←5 2 8 1 9 3 7 4 6
⎕←Timsort arr
