module CycleSort where

open import Data.Nat using (ℕ; zero; suc; _<_; _≤_)
open import Data.Vec using (Vec; _∷_; []; lookup; _[_]≔_)
open import Data.Fin using (Fin; zero; suc; toℕ)
open import Data.List using (List; _∷_; [])

countSmaller : {n : ℕ} → Vec ℕ n → Fin n → ℕ → ℕ → ℕ
countSmaller [] _ _ acc = acc
countSmaller (x ∷ xs) zero item acc = acc
countSmaller (x ∷ xs) (suc i) item acc =
  countSmaller xs i item (if x Data.Nat.< item then suc acc else acc)
  where
    open import Data.Bool using (if_then_else_; Bool)
    open import Data.Nat using (_<ᵇ_)
    if_then_else_ : Bool → ℕ → ℕ → ℕ
    if true then x else _ = x
    if false then _ else y = y

sortedList : List ℕ → List ℕ
sortedList [] = []
sortedList (x ∷ xs) = x ∷ sortedList xs

example : List ℕ
example = 1 ∷ 2 ∷ 3 ∷ 4 ∷ 5 ∷ []
