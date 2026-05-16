⍝ Bitonic Sort in APL
BitonicMerge ← {
    arr ← ⍵[1] ⋄ lo ← ⍵[2] ⋄ cnt ← ⍵[3] ⋄ dir ← ⍵[4]
    cnt≤1: arr
    k ← ⌊cnt÷2
    idx ← lo+⍳k
    pairs ← arr[idx] ,⍪ arr[idx+k]
    swapped ← (dir=0)⌽[1] pairs
    arr[idx] ← swapped[;1]
    arr[idx+k] ← swapped[;2]
    arr ← BitonicMerge arr lo k dir
    arr ← BitonicMerge arr (lo+k) k dir
    arr
}

BitonicSort ← {
    arr ← ⍵[1] ⋄ lo ← ⍵[2] ⋄ cnt ← ⍵[3] ⋄ dir ← ⍵[4]
    cnt≤1: arr
    k ← ⌊cnt÷2
    arr ← BitonicSort arr lo k 1
    arr ← BitonicSort arr (lo+k) k 0
    arr ← BitonicMerge arr lo cnt dir
    arr
}

data ← 3 7 4 8 6 2 1 5
⎕ ← BitonicSort data 1 (⍴data) 1
