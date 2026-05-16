IsSorted ← ∧´2≤`⊢
Shuffle ← {⍵⌷˜⍋•rand.Range∘≠⍵}
Bogosort ← {IsSorted⍵? ⍵; ∇Shuffle⍵}
Bogosort 3‿1‿4‿1‿5‿9‿2‿6
