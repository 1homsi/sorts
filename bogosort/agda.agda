module bogosort where

open import Data.List using (List; []; _∷_)
open import Data.Nat using (ℕ; _≤_; _≤?_)
open import Data.Bool using (Bool; true; false; _∧_)
open import Relation.Nullary using (yes; no)

isSorted : List ℕ → Bool
isSorted [] = true
isSorted (_ ∷ []) = true
isSorted (x ∷ y ∷ rest) with x ≤? y
... | yes _ = isSorted (y ∷ rest)
... | no  _ = false

postulate
  shuffle : List ℕ → List ℕ

{-# TERMINATING #-}
bogosort : List ℕ → List ℕ
bogosort xs with isSorted xs
... | true  = xs
... | false = bogosort (shuffle xs)
