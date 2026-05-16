module CombSort where

open import Data.Vec using (Vec; lookup; _[_]≔_)
open import Data.Nat using (ℕ; zero; suc; _+_; ⌊_/2⌋)
open import Data.Fin using (Fin; fromℕ<)
open import Data.Bool using (Bool; true; false)

combSortPass : ∀ {n} → Vec ℕ n → ℕ → ℕ → Vec ℕ n × Bool
combSortPass {n} arr gap i with i + gap Data.Nat.<? n
... | no _ = arr , false
... | yes p =
    let ai = lookup arr (fromℕ< (Data.Nat.<-transˡ (Data.Nat.n<1+n i) p))
        aj = lookup arr (fromℕ< p)
    in arr , false
