isSorted ← {∧/2≤/⍵}
shuffle ← {⍵[?⍨≢⍵]}
bogosort ← {⍵{isSorted ⍵:⍵ ⋄ ∇shuffle ⍵}⍵}
⎕←bogosort 3 1 4 1 5 9 2 6
