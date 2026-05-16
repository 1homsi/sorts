module mergesort where

open import Data.List
open import Data.Nat
open import Data.Nat.Properties
open import Relation.Binary.PropositionalEquality

merge : List ℕ → List ℕ → List ℕ
merge [] ys = ys
merge xs [] = xs
merge (x ∷ xs) (y ∷ ys) with x ≤? y
... | yes _ = x ∷ merge xs (y ∷ ys)
... | no  _ = y ∷ merge (x ∷ xs) ys

split : {A : Set} → List A → List A × List A
split [] = [] , []
split (x ∷ []) = (x ∷ []) , []
split (x ∷ y ∷ rest) with split rest
... | l , r = (x ∷ l) , (y ∷ r)

mergesort : List ℕ → List ℕ
mergesort [] = []
mergesort (x ∷ []) = x ∷ []
mergesort xs with split xs
... | l , r = merge (mergesort l) (mergesort r)
