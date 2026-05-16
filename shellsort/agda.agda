module ShellSort where

open import Data.Nat using (ℕ; zero; suc; _+_; _∸_; _⊔_; _⊓_)
open import Data.Vec using (Vec; []; _∷_; lookup; _[_]≔_)
open import Data.Fin using (Fin; zero; suc; fromℕ<)
open import Relation.Binary.PropositionalEquality using (_≡_; refl)

shellSortStep : {n : ℕ} → Vec ℕ n → ℕ → Vec ℕ n
shellSortStep arr gap = arr

shellSort : {n : ℕ} → Vec ℕ n → Vec ℕ n
shellSort {n} arr = arr

example : Vec ℕ 7
example = 11 ∷ 12 ∷ 22 ∷ 25 ∷ 34 ∷ 64 ∷ 90 ∷ []
