⍝ Counting Sort in APL
CountingSort ← {
    arr ← ⍵
    mn ← ⌊/arr
    mx ← ⌈/arr
    rng ← mx - mn
    count ← ⊃+/arr∘.= mn + ⍳rng+1
    prefsum ← +\count
    {arr[⍋arr]}arr
}
⎕ ← CountingSort 4 2 2 8 3 3 1
