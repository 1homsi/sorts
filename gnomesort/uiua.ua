GnomeSort ← (
  dup length :n
  0 :i
  ⍢(
    ⊙(
      |i = 0 ∨ (⊡i) ≥ (⊡(i-1))
      |swap(⊡i)(⊡(i-1)) ↙i ↙(i+1)
    )
    |i + 1
    |i - 1
  )(i < n)
)
