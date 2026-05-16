module CocktailSort where

open import Data.Nat
open import Data.Vec using (Vec; []; _∷_)
open import Data.Bool using (Bool; true; false)

data Sorted : ∀ {n} → Vec ℕ n → Set where
  sorted-nil  : Sorted []
  sorted-one  : ∀ {x} → Sorted (x ∷ [])
  sorted-cons : ∀ {n x y} {ys : Vec ℕ n}
              → x ≤ y → Sorted (y ∷ ys) → Sorted (x ∷ y ∷ ys)

cocktailSortSpec : ∀ {n} → Vec ℕ n → Vec ℕ n
cocktailSortSpec [] = []
cocktailSortSpec (x ∷ []) = x ∷ []
cocktailSortSpec xs = xs
