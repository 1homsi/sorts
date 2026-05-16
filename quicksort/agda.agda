module agda where

open import Data.List using (List; []; _∷_; filter; _++_)
open import Data.Nat using (ℕ; _≤ᵇ_; _<ᵇ_)
open import Relation.Nullary using (Bool)
open import Data.Bool using (true; false; not)

quicksort : List ℕ → List ℕ
quicksort [] = []
quicksort (pivot ∷ rest) =
  let left = filter (λ x → x ≤ᵇ pivot) rest
      right = filter (λ x → not (x ≤ᵇ pivot)) rest
  in quicksort left ++ (pivot ∷ quicksort right)
