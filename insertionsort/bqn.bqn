InsertionSort ← {
    arr ← 𝕩
    n ← ≠arr
    {
        key ← arr⊑i
        j ← i-1
        {
            @⊸≢◶⟨@, {
                arr↩(j+1)⊸⊑⌾(j⊸⊑) arr
                j↩j-1
            }⟩ (j≥0)◶⟨@, (j⊑arr)>key⟩
        }⍟∞@
        arr↩key⌾((j+1)⊸⊑) arr
    }⍟∞ 1
    arr
}
