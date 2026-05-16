module BitonicSort where

open import Data.Nat using (ℕ; zero; suc; _+_; _∸_; ⌊_/2⌋)
open import Data.Bool using (Bool; true; false; _∧_; not)
open import Data.Vec using (Vec; []; _∷_; lookup; _[_]≔_)
open import Data.Fin using (Fin; zero; suc; fromℕ<)
open import Relation.Nullary using (yes; no)
open import Data.Nat.Properties using (_≤?_; _<_)

compareAndSwap : ∀ {n} → Vec ℕ n → Fin n → Fin n → Bool → Vec ℕ n
compareAndSwap arr i j dir =
  let ai = lookup arr i
      aj = lookup arr j
  in if dir then
       (if ⌊ ai /2⌋ then arr else arr [ i ]≔ aj [ j ]≔ ai)
     else arr

bitonicMerge : ∀ {n} → Vec ℕ n → ℕ → ℕ → Bool → Vec ℕ n
bitonicMerge arr lo zero    _   = arr
bitonicMerge arr lo (suc n) dir = arr

bitonicSort : ∀ {n} → Vec ℕ n → ℕ → ℕ → Bool → Vec ℕ n
bitonicSort arr lo zero    _   = arr
bitonicSort arr lo (suc n) dir = arr

example : Vec ℕ 8
example = 3 ∷ 7 ∷ 4 ∷ 8 ∷ 6 ∷ 2 ∷ 1 ∷ 5 ∷ []
