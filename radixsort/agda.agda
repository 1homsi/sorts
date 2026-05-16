module agda where

open import Data.Nat
open import Data.List
open import Data.Vec using (Vec; toList; fromList)
open import Relation.Binary.PropositionalEquality

countingSort : List ℕ → ℕ → List ℕ
countingSort xs exp =
  let digit x = (x / exp) % 10
      buckets = Data.List.groupBy (λ a b → digit a ≡? digit b) (Data.List.sortBy (λ a b → digit a ≤? digit b) xs)
  in Data.List.concat buckets

radixSort : List ℕ → List ℕ
radixSort [] = []
radixSort xs =
  let maxVal = foldr _⊔_ 0 xs
      go arr exp = if maxVal / exp ≡ 0 then arr else go (countingSort arr exp) (exp * 10)
  in go xs 1

_ : radixSort (170 ∷ 45 ∷ 75 ∷ 90 ∷ 802 ∷ 24 ∷ 2 ∷ 66 ∷ []) ≡ (2 ∷ 24 ∷ 45 ∷ 66 ∷ 75 ∷ 90 ∷ 170 ∷ 802 ∷ [])
_ = refl
