quicksort←{
    1≥≢⍵:⍵
    pivot←⍵[⌊(≢⍵)÷2]
    (∇⍵[⍵<pivot]),⍵[⍵=pivot],(∇⍵[⍵>pivot])
}

⎕←quicksort 3 6 8 10 1 2 1
