module InsertionSort where

open import Data.List using (List; []; _∷_)
open import Data.Nat using (ℕ; _≤?_)
open import Relation.Nullary using (yes; no)

insert : ℕ → List ℕ → List ℕ
insert x [] = x ∷ []
insert x (y ∷ ys) with x ≤? y
... | yes _ = x ∷ y ∷ ys
... | no  _ = y ∷ insert x ys

insertionSort : List ℕ → List ℕ
insertionSort [] = []
insertionSort (x ∷ xs) = insert x (insertionSort xs)
