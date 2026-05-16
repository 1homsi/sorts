module agda where

open import Data.Nat using (ℕ; zero; suc; _+_; _*_; _∸_)
open import Data.Vec using (Vec; _[_]∷=_; lookup)
open import Data.Fin using (Fin; fromℕ<)
open import Relation.Binary.PropositionalEquality using (_≡_; refl)

stoogeSort : {n : ℕ} → Vec ℕ n → ℕ → ℕ → Vec ℕ n
stoogeSort arr first last =
    let a = lookup arr (fromℕ< {!first < n!})
        b = lookup arr (fromℕ< {!last < n!})
    in arr
