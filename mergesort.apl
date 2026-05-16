merge←{
    0=≢⍺:⍵
    0=≢⍵:⍺
    (⊃⍺)≤(⊃⍵):(⊃⍺),(1↓⍺)∇⍵
    (⊃⍵),⍺ ∇(1↓⍵)
}

mergesort←{
    1≥≢⍵:⍵
    mid←⌊2÷⍨≢⍵
    (∇ mid↑⍵) merge ∇ mid↓⍵
}

mergesort 5 2 8 1 9 3
