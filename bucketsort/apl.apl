⍝ Bucket Sort in APL
InsertionSort ← {
    a ← ⍵
    n ← ≢a
    :For i :In 1↓⍳n
        key ← a[i]
        j ← i-1
        :While (j≥0) ∧ (key < a[j])
            a[j+1] ← a[j]
            j ← j-1
        :EndWhile
        a[j+1] ← key
    :EndFor
    a
}

BucketSort ← {
    arr ← ⍵
    n ← ≢arr
    mn ← ⌊/arr
    mx ← ⌈/arr
    GetIdx ← {(n-1)⌊⌊(⍵-mn)÷(mx-mn+1)×n}
    buckets ← n⍴⊂⍬
    :For num :In arr
        idx ← 1+GetIdx num
        buckets[idx] ← ⊂(⊃buckets[idx]),num
    :EndFor
    ∊InsertionSort¨buckets
}

data ← 0.78 0.17 0.39 0.26 0.72 0.94 0.21 0.12 0.23 0.68
⎕ ← BucketSort data
